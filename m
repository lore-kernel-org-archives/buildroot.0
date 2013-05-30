From: Spenser Gilliland <spenser@gillilanding.com>
Date: Thu, 30 May 2013 11:30:28 -0500
Subject: [Buildroot] [PATCH v9 05/14] webkit: bump to version 1.9.6
In-Reply-To: <1369931437-12445-1-git-send-email-spenser@gillilanding.com>
References: <1369931437-12445-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1369931437-12445-6-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/webkit/webkit-bison-2-6-compat.patch       |  672 --------------------
 package/webkit/webkit-disable-docrebase.patch      |   21 +
 package/webkit/webkit-disable-tests.patch          |   76 +++
 package/webkit/webkit-execinfo_h.patch             |   24 +
 .../webkit-fix-build-issue-with-old-gtk.patch      |   22 -
 package/webkit/webkit-fix-build-with-gcc-4-6.patch |   45 --
 .../webkit-fix-compilation-on-DirectFB-2.patch     |   33 -
 .../webkit-fix-compilation-on-DirectFB.patch       |  144 -----
 package/webkit/webkit-fix-pool.patch               |   67 --
 package/webkit/webkit-pthread_getattr_np.patch     |   80 ---
 package/webkit/webkit.mk                           |   31 +-
 11 files changed, 140 insertions(+), 1075 deletions(-)
 delete mode 100644 package/webkit/webkit-bison-2-6-compat.patch
 create mode 100644 package/webkit/webkit-disable-docrebase.patch
 create mode 100644 package/webkit/webkit-disable-tests.patch
 create mode 100644 package/webkit/webkit-execinfo_h.patch
 delete mode 100644 package/webkit/webkit-fix-build-issue-with-old-gtk.patch
 delete mode 100644 package/webkit/webkit-fix-build-with-gcc-4-6.patch
 delete mode 100644 package/webkit/webkit-fix-compilation-on-DirectFB-2.patch
 delete mode 100644 package/webkit/webkit-fix-compilation-on-DirectFB.patch
 delete mode 100644 package/webkit/webkit-fix-pool.patch
 delete mode 100644 package/webkit/webkit-pthread_getattr_np.patch

diff --git a/package/webkit/webkit-bison-2-6-compat.patch b/package/webkit/webkit-bison-2-6-compat.patch
deleted file mode 100644
index 7a94164..0000000
--- a/package/webkit/webkit-bison-2-6-compat.patch
+++ /dev/null
@@ -1,672 +0,0 @@
-Bison 2.6 compatibility fix
-
-Taken from upstream at http://trac.webkit.org/changeset/124099, with
-minor adaptations.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: webkit-1.2.7/WebCore/ChangeLog
-===================================================================
---- webkit-1.2.7.orig/WebCore/ChangeLog	2010-12-28 13:27:37.000000000 +0100
-+++ webkit-1.2.7/WebCore/ChangeLog	2012-12-15 15:48:40.000000000 +0100
-@@ -1,3 +1,28 @@
-+2012-07-30  Alexis Menard  <alexis.menard@openbossa.org>
-+
-+        Build fix with newer bison 2.6.
-+        https://bugs.webkit.org/show_bug.cgi?id=92264
-+
-+        Reviewed by Adam Barth.
-+
-+        As stated in http://www.gnu.org/software/bison/manual/html_node/Table-of-Symbols.html
-+        YYLEX_PARAM and YYPARSE_PARAM are depecreated since version 1.875. So far all Mac OS
-+        version I had access to as well as recent Linux runs at least version 2.3 so it's safe
-+        to use the replacement of these deprecated macros in favor of %lex-param and %parse-param.
-+        As announced http://lists.gnu.org/archive/html/info-gnu/2012-07/msg00011.html with the release
-+        of version 2.6 YYLEX_PARAM and YYPARSE_PARAM are not supported anymore.
-+
-+        No new tests : build fix and the patch should not trigger any regressions
-+
-+        * css/CSSGrammar.y:
-+        * css/CSSParser.cpp:
-+        * xml/XPathGrammar.y: Refactored a bit to not use an intermediate PARSER define.
-+        * xml/XPathParser.cpp: bison 2.6 declare xpathyyparse in the .h file now, i.e. XPathGrammar.h
-+        therefore including this file within the namespace {} declarations leads to xpathyyparse being
-+        defined part of WebCore::XPath namespaces but the actual implementation of xpathyyparse is in XPathGrammar.cpp
-+        (generated) and not implemented within the WebCore::XPath so it lead to linking issues. Last, XPathGrammar.h needs 
-+        to be included after the other includes as it uses some XPath types. It breaks the style but CSSParser.cpp is doing the same.
-+
- 2010-06-21  Philippe Normand  <pnormand@igalia.com>
- 
-         Reviewed by Xan Lopez.
-Index: webkit-1.2.7/WebCore/css/CSSParser.cpp
-===================================================================
---- webkit-1.2.7.orig/WebCore/css/CSSParser.cpp	2010-12-28 13:24:33.000000000 +0100
-+++ webkit-1.2.7/WebCore/css/CSSParser.cpp	2012-12-15 17:29:57.000000000 +0100
-@@ -81,7 +81,7 @@
- extern int cssyydebug;
- #endif
- 
--extern int cssyyparse(void* parser);
-+extern int cssyyparse(WebCore::CSSParser*);
- 
- using namespace std;
- using namespace WTF;
-@@ -226,7 +226,7 @@
-     m_defaultNamespace = starAtom; // Reset the default namespace.
-     
-     setupParser("", string, "");
--    cssyyparse(this);
-+    ::cssyyparse(this);
-     m_rule = 0;
- }
- 
-@@ -235,7 +235,7 @@
-     m_styleSheet = sheet;
-     m_allowNamespaceDeclarations = false;
-     setupParser("@-webkit-rule{", string, "} ");
--    cssyyparse(this);
-+    ::cssyyparse(this);
-     return m_rule.release();
- }
- 
-@@ -243,7 +243,7 @@
- {
-     m_styleSheet = sheet;
-     setupParser("@-webkit-keyframe-rule{ ", string, "} ");
--    cssyyparse(this);
-+    ::cssyyparse(this);
-     return m_keyframe.release();
- }
- 
-@@ -257,7 +257,7 @@
-     m_id = id;
-     m_important = important;
-     
--    cssyyparse(this);
-+    ::cssyyparse(this);
-     
-     m_rule = 0;
- 
-@@ -304,7 +304,7 @@
-     m_styleSheet = static_cast<CSSStyleSheet*>(declaration->stylesheet());
- 
-     setupParser("@-webkit-decls{color:", string, "} ");
--    cssyyparse(this);
-+    ::cssyyparse(this);
-     m_rule = 0;
- 
-     return (m_numParsedProperties && m_parsedProperties[0]->m_id == CSSPropertyColor);
-@@ -319,7 +319,7 @@
- 
-     setupParser("@-webkit-selector{", string, "}");
- 
--    cssyyparse(this);
-+    ::cssyyparse(this);
- 
-     m_selectorListForParseSelector = 0;
- }
-@@ -330,7 +330,7 @@
-     m_styleSheet = static_cast<CSSStyleSheet*>(declaration->stylesheet());
- 
-     setupParser("@-webkit-decls{", string, "} ");
--    cssyyparse(this);
-+    ::cssyyparse(this);
-     m_rule = 0;
- 
-     bool ok = false;
-@@ -354,7 +354,7 @@
-     // can't use { because tokenizer state switches from mediaquery to initial state when it sees { token.
-     // instead insert one " " (which is WHITESPACE in CSSGrammar.y)
-     setupParser("@-webkit-mediaquery ", string, "} ");
--    cssyyparse(this);
-+    ::cssyyparse(this);
- 
-     bool ok = false;
-     if (m_mediaQuery) {
-@@ -5191,7 +5191,7 @@
-     nameValuePair += variableValue;
- 
-     setupParser("@-webkit-variables-decls{", nameValuePair, "} ");
--    cssyyparse(this);
-+    ::cssyyparse(this);
-     m_rule = 0;
- 
-     bool ok = false;
-Index: webkit-1.2.7/WebCore/css/CSSGrammar.y
-===================================================================
---- webkit-1.2.7.orig/WebCore/css/CSSGrammar.y	2010-09-10 15:20:33.000000000 +0200
-+++ webkit-1.2.7/WebCore/css/CSSGrammar.y	2012-12-15 15:48:40.000000000 +0100
-@@ -51,14 +51,13 @@
- #define YYMAXDEPTH 10000
- #define YYDEBUG 0
- 
--// FIXME: Replace with %parse-param { CSSParser* parser } once we can depend on bison 2.x
--#define YYPARSE_PARAM parser
--#define YYLEX_PARAM parser
--
- %}
- 
- %pure_parser
- 
-+%parse-param { CSSParser* parser }
-+%lex-param { CSSParser* parser }
-+
- %union {
-     bool boolean;
-     char character;
-@@ -85,7 +84,7 @@
- 
- %{
- 
--static inline int cssyyerror(const char*)
-+static inline int cssyyerror(void*, const char*)
- {
-     return 1;
- }
-Index: webkit-1.2.7/WebCore/xml/XPathParser.cpp
-===================================================================
---- webkit-1.2.7.orig/WebCore/xml/XPathParser.cpp	2010-09-10 15:20:33.000000000 +0200
-+++ webkit-1.2.7/WebCore/xml/XPathParser.cpp	2012-12-15 15:56:37.000000000 +0100
-@@ -35,20 +35,18 @@
- #include "XPathEvaluator.h"
- #include "XPathException.h"
- #include "XPathNSResolver.h"
-+#include "XPathPath.h"
- #include "XPathStep.h"
- #include <wtf/StdLibExtras.h>
- 
--int xpathyyparse(void*);
--
-+using namespace WebCore;
- using namespace WTF;
- using namespace Unicode;
- 
--namespace WebCore {
--namespace XPath {
--
--class LocationPath;
-+using namespace XPath;
- 
--#include "XPathGrammar.h"    
-+extern int xpathyyparse(WebCore::XPath::Parser*);
-+#include "XPathGrammar.h"
- 
- Parser* Parser::currentParser = 0;
-     
-@@ -630,7 +628,5 @@
-     delete t;
- }
- 
--}
--}
- 
- #endif // ENABLE(XPATH)
-Index: webkit-1.2.7/WebCore/xml/XPathGrammar.y
-===================================================================
---- webkit-1.2.7.orig/WebCore/xml/XPathGrammar.y	2010-02-05 17:26:58.000000000 +0100
-+++ webkit-1.2.7/WebCore/xml/XPathGrammar.y	2012-12-15 15:48:40.000000000 +0100
-@@ -36,6 +36,7 @@
- #include "XPathParser.h"
- #include "XPathPath.h"
- #include "XPathPredicate.h"
-+#include "XPathStep.h"
- #include "XPathVariableReference.h"
- #include <wtf/FastMalloc.h>
- 
-@@ -46,8 +47,6 @@
- #define YYLTYPE_IS_TRIVIAL 1
- #define YYDEBUG 0
- #define YYMAXDEPTH 10000
--#define YYPARSE_PARAM parserParameter
--#define PARSER static_cast<Parser*>(parserParameter)
- 
- using namespace WebCore;
- using namespace XPath;
-@@ -55,6 +54,7 @@
- %}
- 
- %pure_parser
-+%parse-param { WebCore::XPath::Parser* parser }
- 
- %union
- {
-@@ -73,7 +73,7 @@
- %{
- 
- static int xpathyylex(YYSTYPE* yylval) { return Parser::current()->lex(yylval); }
--static void xpathyyerror(const char*) { }
-+static void xpathyyerror(void*, const char*) { }
-     
- %}
- 
-@@ -120,7 +120,7 @@
- Expr:
-     OrExpr
-     {
--        PARSER->m_topExpr = $1;
-+        parser->m_topExpr = $1;
-     }
-     ;
- 
-@@ -140,7 +140,7 @@
-     '/'
-     {
-         $$ = new LocationPath;
--        PARSER->registerParseNode($$);
-+        parser->registerParseNode($$);
-     }
-     |
-     '/' RelativeLocationPath
-@@ -152,7 +152,7 @@
-     {
-         $$ = $2;
-         $$->insertFirstStep($1);
--        PARSER->unregisterParseNode($1);
-+        parser->unregisterParseNode($1);
-     }
-     ;
- 
-@@ -161,22 +161,22 @@
-     {
-         $$ = new LocationPath;
-         $$->appendStep($1);
--        PARSER->unregisterParseNode($1);
--        PARSER->registerParseNode($$);
-+        parser->unregisterParseNode($1);
-+        parser->registerParseNode($$);
-     }
-     |
-     RelativeLocationPath '/' Step
-     {
-         $$->appendStep($3);
--        PARSER->unregisterParseNode($3);
-+        parser->unregisterParseNode($3);
-     }
-     |
-     RelativeLocationPath DescendantOrSelf Step
-     {
-         $$->appendStep($2);
-         $$->appendStep($3);
--        PARSER->unregisterParseNode($2);
--        PARSER->unregisterParseNode($3);
-+        parser->unregisterParseNode($2);
-+        parser->unregisterParseNode($3);
-     }
-     ;
- 
-@@ -185,58 +185,58 @@
-     {
-         if ($2) {
-             $$ = new Step(Step::ChildAxis, *$1, *$2);
--            PARSER->deletePredicateVector($2);
-+            parser->deletePredicateVector($2);
-         } else
-             $$ = new Step(Step::ChildAxis, *$1);
--        PARSER->deleteNodeTest($1);
--        PARSER->registerParseNode($$);
-+        parser->deleteNodeTest($1);
-+        parser->registerParseNode($$);
-     }
-     |
-     NAMETEST OptionalPredicateList
-     {
-         String localName;
-         String namespaceURI;
--        if (!PARSER->expandQName(*$1, localName, namespaceURI)) {
--            PARSER->m_gotNamespaceError = true;
-+        if (!parser->expandQName(*$1, localName, namespaceURI)) {
-+            parser->m_gotNamespaceError = true;
-             YYABORT;
-         }
-         
-         if ($2) {
-             $$ = new Step(Step::ChildAxis, Step::NodeTest(Step::NodeTest::NameTest, localName, namespaceURI), *$2);
--            PARSER->deletePredicateVector($2);
-+            parser->deletePredicateVector($2);
-         } else
-             $$ = new Step(Step::ChildAxis, Step::NodeTest(Step::NodeTest::NameTest, localName, namespaceURI));
--        PARSER->deleteString($1);
--        PARSER->registerParseNode($$);
-+        parser->deleteString($1);
-+        parser->registerParseNode($$);
-     }
-     |
-     AxisSpecifier NodeTest OptionalPredicateList
-     {
-         if ($3) {
-             $$ = new Step($1, *$2, *$3);
--            PARSER->deletePredicateVector($3);
-+            parser->deletePredicateVector($3);
-         } else
-             $$ = new Step($1, *$2);
--        PARSER->deleteNodeTest($2);
--        PARSER->registerParseNode($$);
-+        parser->deleteNodeTest($2);
-+        parser->registerParseNode($$);
-     }
-     |
-     AxisSpecifier NAMETEST OptionalPredicateList
-     {
-         String localName;
-         String namespaceURI;
--        if (!PARSER->expandQName(*$2, localName, namespaceURI)) {
--            PARSER->m_gotNamespaceError = true;
-+        if (!parser->expandQName(*$2, localName, namespaceURI)) {
-+            parser->m_gotNamespaceError = true;
-             YYABORT;
-         }
- 
-         if ($3) {
-             $$ = new Step($1, Step::NodeTest(Step::NodeTest::NameTest, localName, namespaceURI), *$3);
--            PARSER->deletePredicateVector($3);
-+            parser->deletePredicateVector($3);
-         } else
-             $$ = new Step($1, Step::NodeTest(Step::NodeTest::NameTest, localName, namespaceURI));
--        PARSER->deleteString($2);
--        PARSER->registerParseNode($$);
-+        parser->deleteString($2);
-+        parser->registerParseNode($$);
-     }
-     |
-     AbbreviatedStep
-@@ -261,23 +261,23 @@
-         else if (*$1 == "comment")
-             $$ = new Step::NodeTest(Step::NodeTest::CommentNodeTest);
- 
--        PARSER->deleteString($1);
--        PARSER->registerNodeTest($$);
-+        parser->deleteString($1);
-+        parser->registerNodeTest($$);
-     }
-     |
-     PI '(' ')'
-     {
-         $$ = new Step::NodeTest(Step::NodeTest::ProcessingInstructionNodeTest);
--        PARSER->deleteString($1);        
--        PARSER->registerNodeTest($$);
-+        parser->deleteString($1);
-+        parser->registerNodeTest($$);
-     }
-     |
-     PI '(' LITERAL ')'
-     {
-         $$ = new Step::NodeTest(Step::NodeTest::ProcessingInstructionNodeTest, $3->stripWhiteSpace());
--        PARSER->deleteString($1);        
--        PARSER->deleteString($3);
--        PARSER->registerNodeTest($$);
-+        parser->deleteString($1);
-+        parser->deleteString($3);
-+        parser->registerNodeTest($$);
-     }
-     ;
- 
-@@ -295,14 +295,14 @@
-     {
-         $$ = new Vector<Predicate*>;
-         $$->append(new Predicate($1));
--        PARSER->unregisterParseNode($1);
--        PARSER->registerPredicateVector($$);
-+        parser->unregisterParseNode($1);
-+        parser->registerPredicateVector($$);
-     }
-     |
-     PredicateList Predicate
-     {
-         $$->append(new Predicate($2));
--        PARSER->unregisterParseNode($2);
-+        parser->unregisterParseNode($2);
-     }
-     ;
- 
-@@ -317,7 +317,7 @@
-     SLASHSLASH
-     {
-         $$ = new Step(Step::DescendantOrSelfAxis, Step::NodeTest(Step::NodeTest::AnyNodeTest));
--        PARSER->registerParseNode($$);
-+        parser->registerParseNode($$);
-     }
-     ;
- 
-@@ -325,13 +325,13 @@
-     '.'
-     {
-         $$ = new Step(Step::SelfAxis, Step::NodeTest(Step::NodeTest::AnyNodeTest));
--        PARSER->registerParseNode($$);
-+        parser->registerParseNode($$);
-     }
-     |
-     DOTDOT
-     {
-         $$ = new Step(Step::ParentAxis, Step::NodeTest(Step::NodeTest::AnyNodeTest));
--        PARSER->registerParseNode($$);
-+        parser->registerParseNode($$);
-     }
-     ;
- 
-@@ -339,8 +339,8 @@
-     VARIABLEREFERENCE
-     {
-         $$ = new VariableReference(*$1);
--        PARSER->deleteString($1);
--        PARSER->registerParseNode($$);
-+        parser->deleteString($1);
-+        parser->registerParseNode($$);
-     }
-     |
-     '(' Expr ')'
-@@ -351,15 +351,15 @@
-     LITERAL
-     {
-         $$ = new StringExpression(*$1);
--        PARSER->deleteString($1);
--        PARSER->registerParseNode($$);
-+        parser->deleteString($1);
-+        parser->registerParseNode($$);
-     }
-     |
-     NUMBER
-     {
-         $$ = new Number($1->toDouble());
--        PARSER->deleteString($1);
--        PARSER->registerParseNode($$);
-+        parser->deleteString($1);
-+        parser->registerParseNode($$);
-     }
-     |
-     FunctionCall
-@@ -371,8 +371,8 @@
-         $$ = createFunction(*$1);
-         if (!$$)
-             YYABORT;
--        PARSER->deleteString($1);
--        PARSER->registerParseNode($$);
-+        parser->deleteString($1);
-+        parser->registerParseNode($$);
-     }
-     |
-     FUNCTIONNAME '(' ArgumentList ')'
-@@ -380,9 +380,9 @@
-         $$ = createFunction(*$1, *$3);
-         if (!$$)
-             YYABORT;
--        PARSER->deleteString($1);
--        PARSER->deleteExpressionVector($3);
--        PARSER->registerParseNode($$);
-+        parser->deleteString($1);
-+        parser->deleteExpressionVector($3);
-+        parser->registerParseNode($$);
-     }
-     ;
- 
-@@ -391,14 +391,14 @@
-     {
-         $$ = new Vector<Expression*>;
-         $$->append($1);
--        PARSER->unregisterParseNode($1);
--        PARSER->registerExpressionVector($$);
-+        parser->unregisterParseNode($1);
-+        parser->registerExpressionVector($$);
-     }
-     |
-     ArgumentList ',' Argument
-     {
-         $$->append($3);
--        PARSER->unregisterParseNode($3);
-+        parser->unregisterParseNode($3);
-     }
-     ;
- 
-@@ -414,9 +414,9 @@
-         $$ = new Union;
-         $$->addSubExpression($1);
-         $$->addSubExpression($3);
--        PARSER->unregisterParseNode($1);
--        PARSER->unregisterParseNode($3);
--        PARSER->registerParseNode($$);
-+        parser->unregisterParseNode($1);
-+        parser->unregisterParseNode($3);
-+        parser->registerParseNode($$);
-     }
-     ;
- 
-@@ -432,9 +432,9 @@
-     {
-         $3->setAbsolute(true);
-         $$ = new Path(static_cast<Filter*>($1), $3);
--        PARSER->unregisterParseNode($1);
--        PARSER->unregisterParseNode($3);
--        PARSER->registerParseNode($$);
-+        parser->unregisterParseNode($1);
-+        parser->unregisterParseNode($3);
-+        parser->registerParseNode($$);
-     }
-     |
-     FilterExpr DescendantOrSelf RelativeLocationPath
-@@ -442,10 +442,10 @@
-         $3->insertFirstStep($2);
-         $3->setAbsolute(true);
-         $$ = new Path(static_cast<Filter*>($1), $3);
--        PARSER->unregisterParseNode($1);
--        PARSER->unregisterParseNode($2);
--        PARSER->unregisterParseNode($3);
--        PARSER->registerParseNode($$);
-+        parser->unregisterParseNode($1);
-+        parser->unregisterParseNode($2);
-+        parser->unregisterParseNode($3);
-+        parser->registerParseNode($$);
-     }
-     ;
- 
-@@ -455,9 +455,9 @@
-     PrimaryExpr PredicateList
-     {
-         $$ = new Filter($1, *$2);
--        PARSER->unregisterParseNode($1);
--        PARSER->deletePredicateVector($2);
--        PARSER->registerParseNode($$);
-+        parser->unregisterParseNode($1);
-+        parser->deletePredicateVector($2);
-+        parser->registerParseNode($$);
-     }
-     ;
- 
-@@ -467,9 +467,9 @@
-     OrExpr OR AndExpr
-     {
-         $$ = new LogicalOp(LogicalOp::OP_Or, $1, $3);
--        PARSER->unregisterParseNode($1);
--        PARSER->unregisterParseNode($3);
--        PARSER->registerParseNode($$);
-+        parser->unregisterParseNode($1);
-+        parser->unregisterParseNode($3);
-+        parser->registerParseNode($$);
-     }
-     ;
- 
-@@ -479,9 +479,9 @@
-     AndExpr AND EqualityExpr
-     {
-         $$ = new LogicalOp(LogicalOp::OP_And, $1, $3);
--        PARSER->unregisterParseNode($1);
--        PARSER->unregisterParseNode($3);
--        PARSER->registerParseNode($$);
-+        parser->unregisterParseNode($1);
-+        parser->unregisterParseNode($3);
-+        parser->registerParseNode($$);
-     }
-     ;
- 
-@@ -491,9 +491,9 @@
-     EqualityExpr EQOP RelationalExpr
-     {
-         $$ = new EqTestOp($2, $1, $3);
--        PARSER->unregisterParseNode($1);
--        PARSER->unregisterParseNode($3);
--        PARSER->registerParseNode($$);
-+        parser->unregisterParseNode($1);
-+        parser->unregisterParseNode($3);
-+        parser->registerParseNode($$);
-     }
-     ;
- 
-@@ -503,9 +503,9 @@
-     RelationalExpr RELOP AdditiveExpr
-     {
-         $$ = new EqTestOp($2, $1, $3);
--        PARSER->unregisterParseNode($1);
--        PARSER->unregisterParseNode($3);
--        PARSER->registerParseNode($$);
-+        parser->unregisterParseNode($1);
-+        parser->unregisterParseNode($3);
-+        parser->registerParseNode($$);
-     }
-     ;
- 
-@@ -515,17 +515,17 @@
-     AdditiveExpr PLUS MultiplicativeExpr
-     {
-         $$ = new NumericOp(NumericOp::OP_Add, $1, $3);
--        PARSER->unregisterParseNode($1);
--        PARSER->unregisterParseNode($3);
--        PARSER->registerParseNode($$);
-+        parser->unregisterParseNode($1);
-+        parser->unregisterParseNode($3);
-+        parser->registerParseNode($$);
-     }
-     |
-     AdditiveExpr MINUS MultiplicativeExpr
-     {
-         $$ = new NumericOp(NumericOp::OP_Sub, $1, $3);
--        PARSER->unregisterParseNode($1);
--        PARSER->unregisterParseNode($3);
--        PARSER->registerParseNode($$);
-+        parser->unregisterParseNode($1);
-+        parser->unregisterParseNode($3);
-+        parser->registerParseNode($$);
-     }
-     ;
- 
-@@ -535,9 +535,9 @@
-     MultiplicativeExpr MULOP UnaryExpr
-     {
-         $$ = new NumericOp($2, $1, $3);
--        PARSER->unregisterParseNode($1);
--        PARSER->unregisterParseNode($3);
--        PARSER->registerParseNode($$);
-+        parser->unregisterParseNode($1);
-+        parser->unregisterParseNode($3);
-+        parser->registerParseNode($$);
-     }
-     ;
- 
-@@ -548,8 +548,8 @@
-     {
-         $$ = new Negative;
-         $$->addSubExpression($2);
--        PARSER->unregisterParseNode($2);
--        PARSER->registerParseNode($$);
-+        parser->unregisterParseNode($2);
-+        parser->registerParseNode($$);
-     }
-     ;
- 
diff --git a/package/webkit/webkit-disable-docrebase.patch b/package/webkit/webkit-disable-docrebase.patch
new file mode 100644
index 0000000..77bb99a
--- /dev/null
+++ b/package/webkit/webkit-disable-docrebase.patch
@@ -0,0 +1,21 @@
+Index: webkit-1.9.6/Tools/GNUmakefile.am
+===================================================================
+--- webkit-1.9.6.orig/Tools/GNUmakefile.am	2012-08-06 07:34:49.000000000 -0500
++++ webkit-1.9.6/Tools/GNUmakefile.am	2013-05-28 21:29:54.135112927 -0500
+@@ -262,6 +262,8 @@
+ 	Tools/Scripts/webkit-build-directory \
+ 	Tools/Scripts/webkitdirs.pm
+ 
++if ENABLE_GTK_DOC
++
+ docs: docs-build.stamp
+ .PHONY : docs
+ DISTCLEANFILES += docs-build.stamp
+@@ -362,7 +364,6 @@
+ 	rm -rf $${installdir}
+ endif
+ 
+-if ENABLE_GTK_DOC
+ all: docs-build.stamp
+ endif
+ 
diff --git a/package/webkit/webkit-disable-tests.patch b/package/webkit/webkit-disable-tests.patch
new file mode 100644
index 0000000..62787cf
--- /dev/null
+++ b/package/webkit/webkit-disable-tests.patch
@@ -0,0 +1,76 @@
+Index: webkit-1.9.6/GNUmakefile.am
+===================================================================
+--- webkit-1.9.6.orig/GNUmakefile.am	2012-08-06 03:17:24.000000000 -0500
++++ webkit-1.9.6/GNUmakefile.am	2013-05-28 10:08:53.645129501 -0500
+@@ -282,11 +282,14 @@
+ include Tools/DumpRenderTree/gtk/GNUmakefile.ImageDiff.am
+ 
+ include Source/WebKit2/GNUmakefile.am
+-include Source/WebKit2/UIProcess/API/gtk/tests/GNUmakefile.am
+ include Tools/MiniBrowser/gtk/GNUmakefile.am
++
++if ENABLE_TESTS
++include Source/WebKit2/UIProcess/API/gtk/tests/GNUmakefile.am
+ include Tools/WebKitTestRunner/GNUmakefile.am
+ include Source/ThirdParty/gtest/GNUmakefile.am
+ include Tools/TestWebKitAPI/GNUmakefile.am
++endif # ENABLE_TESTS
+ # [GTK] Refactor the translations now that we have webkit2
+ # https://bugs.webkit.org/show_bug.cgi?id=55153
+ 
+Index: webkit-1.9.6/Source/WebKit/gtk/GNUmakefile.am
+===================================================================
+--- webkit-1.9.6.orig/Source/WebKit/gtk/GNUmakefile.am	2012-07-19 05:02:29.000000000 -0500
++++ webkit-1.9.6/Source/WebKit/gtk/GNUmakefile.am	2013-05-28 10:09:49.277130516 -0500
+@@ -413,6 +413,7 @@
+ dist_resources_DATA = \
+ 	$(shell ls $(srcdir)/Source/WebKit/gtk/resources/*.html)
+ 
++if ENABLE_TESTS
+ # Build unit tests
+ webkit_tests_cflags = \
+ 	-fno-strict-aliasing \
+@@ -613,6 +614,8 @@
+ Programs_unittests_testcopyandpaste_LDADD = $(webkit_tests_ldadd)
+ Programs_unittests_testcopyandpaste_LDFLAGS = $(webkit_tests_ldflags)
+ 
++endif # ENABLE_TESTS
++
+ # Project-wide clean rules
+ # Files that will be cleaned
+ CLEANFILES += \
+Index: webkit-1.9.6/configure.ac
+===================================================================
+--- webkit-1.9.6.orig/configure.ac	2012-08-06 08:45:10.000000000 -0500
++++ webkit-1.9.6/configure.ac	2013-05-28 10:07:55.817128445 -0500
+@@ -516,6 +516,14 @@
+ AC_SUBST(CAIRO_CFLAGS)
+ AC_SUBST(CAIRO_LIBS)
+ 
++# check wheter to build tests
++AC_MSG_CHECKING([wheter to build tests])
++AC_ARG_ENABLE(tests,
++              AC_HELP_STRING([--enable-tests],
++                             [turn on tests [default=no]]),
++              [],[enable_debug="no"])
++AC_MSG_RESULT([$enable_tests])
++
+ # check whether to build with debugging enabled
+ AC_MSG_CHECKING([whether to do a debug build])
+ AC_ARG_ENABLE(debug,
+@@ -1423,6 +1431,7 @@
+ AM_CONDITIONAL([USE_FARSTREAM], [test "$have_farstream" = "yes"])
+ 
+ # WebKit feature conditionals
++AM_CONDITIONAL([ENABLE_TESTS],[test "$enable_tests" = "yes"])
+ AM_CONDITIONAL([ENABLE_DEBUG],[test "$enable_debug_features" = "yes"])
+ AM_CONDITIONAL([ENABLE_UNSTABLE_FEATURES],[test "$enable_unstable_features" = "yes"])
+ AM_CONDITIONAL([ENABLE_WEBGL],[test "$enable_webgl" = "yes"])
+@@ -1534,6 +1543,7 @@
+ WebKit was configured with the following options:
+ 
+ Build configuration:
++ Enable tests (slow)                                      : $enable_tests
+  Enable debugging (slow)                                  : $enable_debug
+  Compile with debug symbols (slow)                        : $enable_debug_symbols
+  Enable debug features (slow)                             : $enable_debug_features
diff --git a/package/webkit/webkit-execinfo_h.patch b/package/webkit/webkit-execinfo_h.patch
new file mode 100644
index 0000000..dd53e94
--- /dev/null
+++ b/package/webkit/webkit-execinfo_h.patch
@@ -0,0 +1,24 @@
+Index: webkit-1.9.6/Source/WTF/wtf/Assertions.cpp
+===================================================================
+--- webkit-1.9.6.orig/Source/WTF/wtf/Assertions.cpp
++++ webkit-1.9.6/Source/WTF/wtf/Assertions.cpp
+@@ -61,8 +61,10 @@
+ #if (OS(DARWIN) || OS(LINUX)) && !OS(ANDROID)
+ #include <cxxabi.h>
+ #include <dlfcn.h>
++#if !defined(__UCLIBC__)
+ #include <execinfo.h>
+ #endif
++#endif
+ 
+ #if OS(ANDROID)
+ #include "android/log.h"
+@@ -268,7 +270,7 @@ void WTFReportArgumentAssertionFailure(c
+ 
+ void WTFGetBacktrace(void** stack, int* size)
+ {
+-#if (OS(DARWIN) || OS(LINUX)) && !OS(ANDROID)
++#if (OS(DARWIN) || OS(LINUX)) && !OS(ANDROID) && !defined(__UCLIBC__)
+     *size = backtrace(stack, *size);
+ #elif OS(WINDOWS) && !OS(WINCE)
+     // The CaptureStackBackTrace function is available in XP, but it is not defined
diff --git a/package/webkit/webkit-fix-build-issue-with-old-gtk.patch b/package/webkit/webkit-fix-build-issue-with-old-gtk.patch
deleted file mode 100644
index 2b20bae..0000000
--- a/package/webkit/webkit-fix-build-issue-with-old-gtk.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-The WebKit code conditionally calls getRootCoords() when the Gtk
-version is old (i.e < 2.17.3), but fails to declare the prototype of
-this function (which is implemented after its call site). This build
-failure has probably been missed due to the fact that not many people
-try to compile recent WebKit versions with old Gtk.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: webkit-1.2.3/WebKitTools/DumpRenderTree/gtk/EventSender.cpp
-===================================================================
---- webkit-1.2.3.orig/WebKitTools/DumpRenderTree/gtk/EventSender.cpp	2010-07-19 20:42:27.000000000 +0200
-+++ webkit-1.2.3/WebKitTools/DumpRenderTree/gtk/EventSender.cpp	2010-07-19 20:42:57.000000000 +0200
-@@ -86,6 +86,9 @@
- static void sendOrQueueEvent(GdkEvent event);
- static void dispatchEvent(GdkEvent event);
- static guint getStateFlags();
-+#if !GTK_CHECK_VERSION(2,17,3)
-+static void getRootCoords(GtkWidget* view, int* rootX, int* rootY);
-+#endif
- 
- static JSValueRef getDragModeCallback(JSContextRef context, JSObjectRef object, JSStringRef propertyName, JSValueRef* exception)
- {
diff --git a/package/webkit/webkit-fix-build-with-gcc-4-6.patch b/package/webkit/webkit-fix-build-with-gcc-4-6.patch
deleted file mode 100644
index 181c7f5..0000000
--- a/package/webkit/webkit-fix-build-with-gcc-4-6.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-Backported from commit 88e08c43d0200a4b06a298b7d2541965eebc0afe:
-Removed the ChangeLog part.
-
-From: "commit-queue at webkit.org"
- <commit-queue@webkit.org@268f45cc-cd09-0410-ab3c-d52691b4dbfc>
-Date: Mon, 18 Apr 2011 06:53:23 +0000
-Subject: [PATCH] 2011-04-17  Thierry Reding 
- <thierry.reding@avionic-design.de>
-
-        Reviewed by Adam Barth.
-
-        Fix build with GCC 4.6.
-
-        * dom/make_names.pl: Execute preprocessor without the -P option. The
-        preprocessor in GCC 4.6 eats empty lines, effectively breaking the
-        parsing performed by this script. Dropping the -P option when invoking
-        the preprocessor keeps the empty lines but as a side-effect also adds
-        additional linemarkers.
-
-        From the cpp manpage:
-
-          -P  Inhibit generation of linemarkers in the output from the
-              preprocessor. This might be useful when running the preprocessor
-              on something that is not C code, and will be sent to a program
-              which might be confused by the linemarkers.
-
-        The linemarkers are not problematic, however, because the script
-        properly handles them by ignoring all lines starting with a #.
-
-diff --git a/WebCore/dom/make_names.pl b/WebCore/dom/make_names.pl
-index 836137e..50386e0 100755
---- a/WebCore/dom/make_names.pl
-+++ b/WebCore/dom/make_names.pl
-@@ -54,7 +54,7 @@ if ($ENV{CC}) {
- } else {
-     $gccLocation = "/usr/bin/gcc";
- }
--my $preprocessor = $gccLocation . " -E -P -x c++";
-+my $preprocessor = $gccLocation . " -E -x c++";
- 
- GetOptions(
-     'tags=s' => \$tagsFile, 
--- 
-1.7.11.4
-
diff --git a/package/webkit/webkit-fix-compilation-on-DirectFB-2.patch b/package/webkit/webkit-fix-compilation-on-DirectFB-2.patch
deleted file mode 100644
index a15226e..0000000
--- a/package/webkit/webkit-fix-compilation-on-DirectFB-2.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From ef45c7ce5325d85ca924502b1b0a929fecd6581d Mon Sep 17 00:00:00 2001
-From: Stephan Hoffmann <sho@relinux.de>
-Date: Thu, 27 Dec 2012 18:08:29 +0100
-Subject: [PATCH] Fix test for presence of X11
-
-The test in GNUmakefile.in checking for presence of X11 and
-enabling the XP_UNIX define succeeds even when X11 is not
-present and Webkit is built for DirectFB.
-
-Because of this X11-headers are included and the build fails.
-
-Signed-off-by: Stephan Hoffmann <sho@relinux.de>
----
- GNUmakefile.in |    3 ++-
- 1 files changed, 2 insertions(+), 1 deletions(-)
-
-diff --git a/GNUmakefile.in b/GNUmakefile.in
-index f14f27b..3ac811f 100644
---- a/GNUmakefile.in
-+++ b/GNUmakefile.in
-@@ -88,7 +88,8 @@ noinst_PROGRAMS = Programs/minidom$(EXEEXT) \
- 	$(am__EXEEXT_1)
- 
- # For the Gtk port we want to use XP_UNIX both in X11 and Mac
-- at TARGET_WIN32_FALSE@am__append_1 = -DXP_UNIX
-+ at TARGET_X11_TRUE@am__append_1 = -DXP_UNIX
-+ at TARGET_QUARTZ_TRUE@am__append_1 = -DXP_UNIX
- @USE_ICU_UNICODE_TRUE at am__append_2 = \
- @USE_ICU_UNICODE_TRUE@	-DWTF_USE_ICU_UNICODE=1
- 
--- 
-1.7.0.4
-
diff --git a/package/webkit/webkit-fix-compilation-on-DirectFB.patch b/package/webkit/webkit-fix-compilation-on-DirectFB.patch
deleted file mode 100644
index 256f8a1..0000000
--- a/package/webkit/webkit-fix-compilation-on-DirectFB.patch
+++ /dev/null
@@ -1,144 +0,0 @@
-From 91a2bf4c3a21720a27223ba293ba90f58c349959 Mon Sep 17 00:00:00 2001
-From: Lionel Landwerlin <llandwerlin@gmail.com>
-Date: Sun, 11 Apr 2010 14:38:57 +0200
-Subject: [PATCH] Fix compilation with DirectFB
-
-Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
----
- GNUmakefile.am                        |    2 ++
- WebCore/plugins/PluginView.h          |    6 +++---
- WebCore/plugins/gtk/PluginViewGtk.cpp |   17 ++++++++---------
- 3 files changed, 13 insertions(+), 12 deletions(-)
-
-diff --git a/GNUmakefile.am b/GNUmakefile.am
-index 3bdfe53..8626bbb 100644
---- a/GNUmakefile.am
-+++ b/GNUmakefile.am
-@@ -122,8 +122,10 @@ corekit_cppflags += \
- 
- # For the Gtk port we want to use XP_UNIX both in X11 and Mac
- if !TARGET_WIN32
-+if !TARGET_DIRECTFB
- corekit_cppflags += -DXP_UNIX
- endif
-+endif
- 
- # Default compiler flags
- global_cflags += \
-diff --git a/WebCore/plugins/PluginView.h b/WebCore/plugins/PluginView.h
-index 21a25f6..8116864 100644
---- a/WebCore/plugins/PluginView.h
-+++ b/WebCore/plugins/PluginView.h
-@@ -22,7 +22,7 @@
-  * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
-  * OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
-  * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
-- * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. 
-+ * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-  */
- 
- #ifndef PluginView_h
-@@ -312,7 +312,7 @@ namespace WebCore {
-         bool m_haveInitialized;
-         bool m_isWaitingToStart;
- 
--#if defined(XP_UNIX)
-+#if defined(XP_UNIX) || PLATFORM(DIRECTFB)
-         bool m_needsXEmbed;
- #endif
- 
-@@ -340,7 +340,7 @@ public:
- 
- private:
- 
--#if defined(XP_UNIX) || OS(SYMBIAN)
-+#if defined(XP_UNIX) || OS(SYMBIAN) || PLATFORM(DIRECTFB)
-         void setNPWindowIfNeeded();
- #elif defined(XP_MACOSX)
-         NP_CGContext m_npCgContext;
-diff --git a/WebCore/plugins/gtk/PluginViewGtk.cpp b/WebCore/plugins/gtk/PluginViewGtk.cpp
-index 8de63e0..039a845 100644
---- a/WebCore/plugins/gtk/PluginViewGtk.cpp
-+++ b/WebCore/plugins/gtk/PluginViewGtk.cpp
-@@ -23,7 +23,7 @@
-  * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
-  * OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
-  * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
-- * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. 
-+ * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-  */
- 
- #include "config.h"
-@@ -45,6 +45,7 @@
- #include "Image.h"
- #include "KeyboardEvent.h"
- #include "MouseEvent.h"
-+#include "NotImplemented.h"
- #include "Page.h"
- #include "PlatformKeyboardEvent.h"
- #include "PlatformMouseEvent.h"
-@@ -137,7 +138,7 @@ void PluginView::updatePluginWidget()
-     if (!m_isWindowed) {
-         if (m_drawable)
-             XFreePixmap(GDK_DISPLAY(), m_drawable);
--            
-+
-         m_drawable = XCreatePixmap(GDK_DISPLAY(), getRootWindow(m_parentFrame.get()),
-                                    m_windowRect.width(), m_windowRect.height(),
-                                    ((NPSetWindowCallbackStruct*)m_npWindow.ws_info)->depth);
-@@ -571,7 +572,7 @@ NPError PluginView::handlePostReadFile(Vector<char>& buffer, uint32 len, const c
- 
-     //FIXME - read the file data into buffer
-     FILE* fileHandle = fopen((filename.utf8()).data(), "r");
--    
-+
-     if (fileHandle == 0)
-         return NPERR_FILE_NOT_FOUND;
- 
-@@ -706,6 +707,7 @@ void PluginView::forceRedraw()
-         gtk_widget_queue_draw(m_parentFrame->view()->hostWindow()->platformPageClient());
- }
- 
-+#if defined(XP_UNIX)
- static Display* getPluginDisplay()
- {
-     // The plugin toolkit might have a different X connection open.  Since we're
-@@ -713,14 +715,9 @@ static Display* getPluginDisplay()
-     // plugins, so we can return that.  We might want to add other implementations here
-     // later.
- 
--#if defined(XP_UNIX)
-     return GDK_DISPLAY_XDISPLAY(gdk_display_get_default());
--#else
--    return 0;
--#endif
- }
- 
--#if defined(XP_UNIX)
- static void getVisualAndColormap(int depth, Visual** visual, Colormap* colormap)
- {
-     *visual = 0;
-@@ -794,9 +791,9 @@ bool PluginView::platformStart()
-     }
- 
-     if (m_isWindowed) {
--#if defined(XP_UNIX)
-         GtkWidget* pageClient = m_parentFrame->view()->hostWindow()->platformPageClient();
- 
-+#if defined(XP_UNIX)
-         if (m_needsXEmbed) {
-             // If our parent is not anchored the startup process will
-             // fail miserably for XEmbed plugins a bit later on when
-@@ -817,7 +814,9 @@ bool PluginView::platformStart()
- #endif
-     } else {
-         setPlatformWidget(0);
-+#if defined(XP_UNIX)
-         m_pluginDisplay = getPluginDisplay();
-+#endif
-     }
- 
-     show();
--- 
-1.7.0.4
-
diff --git a/package/webkit/webkit-fix-pool.patch b/package/webkit/webkit-fix-pool.patch
deleted file mode 100644
index 5a66a82..0000000
--- a/package/webkit/webkit-fix-pool.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-Description: Fixup pool and add sparc support
-Nixed from gentoo
-
---- webkit-1.2.1.orig/JavaScriptCore/wtf/ListHashSet.h
-+++ webkit-1.2.1/JavaScriptCore/wtf/ListHashSet.h
-@@ -127,7 +127,7 @@ namespace WTF {
-             : m_freeList(pool())
-             , m_isDoneWithInitialFreeList(false)
-         { 
--            memset(m_pool.pool, 0, sizeof(m_pool.pool));
-+            memset(m_pool, 0, sizeof(m_pool));
-         }
- 
-         Node* allocate()
-@@ -171,7 +171,7 @@ namespace WTF {
-         }
- 
-     private:
--        Node* pool() { return reinterpret_cast<Node*>(m_pool.pool); }
-+        Node* pool() { return reinterpret_cast<Node*>(m_pool); }
-         Node* pastPool() { return pool() + m_poolSize; }
- 
-         bool inPool(Node* node)
-@@ -182,10 +182,7 @@ namespace WTF {
-         Node* m_freeList;
-         bool m_isDoneWithInitialFreeList;
-         static const size_t m_poolSize = 256;
--        union {
--            char pool[sizeof(Node) * m_poolSize];
--            double forAlignment;
--        } m_pool;
-+        uint32_t m_pool[(sizeof(Node) * m_poolSize + sizeof(uint32_t) - 1) / sizeof(uint32_t)];
-     };
- 
-     template<typename ValueArg> struct ListHashSetNode {
---- webkit-1.2.1.orig/WebCore/platform/text/AtomicString.cpp
-+++ webkit-1.2.1/WebCore/platform/text/AtomicString.cpp
-@@ -103,9 +103,9 @@ static inline bool equal(StringImpl* str
-     if (string->length() != length)
-         return false;
- 
-+#if CPU(ARM) || CPU(SPARC) || CPU(SH4)
-     // FIXME: perhaps we should have a more abstract macro that indicates when
-     // going 4 bytes at a time is unsafe
--#if CPU(ARM) || CPU(SH4)
-     const UChar* stringCharacters = string->characters();
-     for (unsigned i = 0; i != length; ++i) {
-         if (*stringCharacters++ != *characters++)
---- webkit-1.2.1.orig/WebCore/platform/text/StringHash.h
-+++ webkit-1.2.1/WebCore/platform/text/StringHash.h
-@@ -54,13 +54,13 @@ namespace WebCore {
- 
-             // FIXME: perhaps we should have a more abstract macro that indicates when
-             // going 4 bytes at a time is unsafe
--#if CPU(ARM) || CPU(SH4)
-+#if CPU(ARM) || CPU(SPARC) || CPU(SH4)
-             const UChar* aChars = a->characters();
-             const UChar* bChars = b->characters();
--            for (unsigned i = 0; i != aLength; ++i) {
-+            for (unsigned i = 0; i != aLength; ++i)
-                 if (*aChars++ != *bChars++)
-                     return false;
--            }
-+
-             return true;
- #else
-             /* Do it 4-bytes-at-a-time on architectures where it's safe */
diff --git a/package/webkit/webkit-pthread_getattr_np.patch b/package/webkit/webkit-pthread_getattr_np.patch
deleted file mode 100644
index 8027e37..0000000
--- a/package/webkit/webkit-pthread_getattr_np.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-Patch WebKit because pthread_getattr_np is not implemented in uClibc
-
-Define UCLIBC_USE_PROC_SELF_MAPS etc. as a workaround for uClibc. This
-code was in the qtoipa webkit but appears to have been removed from
-more recent versions of webkit.
-
-See: http://bugreports.qt.nokia.com/browse/QTBUG-6551
-Credit for fix: http://www.avrfreaks.net/index.php?name=PNphpBB2&file=viewtopic&p=545066#545066
-
-Signed-off-by: Paul Jones <paul@pauljones.id.au>
-
-Index: webkit-1.2.3/JavaScriptCore/runtime/Collector.cpp
-===================================================================
---- webkit-1.2.3.orig/JavaScriptCore/runtime/Collector.cpp	2010-07-22 17:16:19.000000000 +0200
-+++ webkit-1.2.3/JavaScriptCore/runtime/Collector.cpp	2010-07-22 17:25:02.000000000 +0200
-@@ -75,6 +75,19 @@
- #endif
- #include <unistd.h>
- 
-+#if defined(__UCLIBC__)
-+// versions of uClibc 0.9.32 and below with linuxthreads.old do not have
-+// pthread_getattr_np or pthread_attr_getstack.
-+#if __UCLIBC_MAJOR__ == 0 &&					\
-+  (__UCLIBC_MINOR__ < 9 ||					\
-+   (__UCLIBC_MINOR__ == 9 && __UCLIBC_SUBLEVEL__ <= 32)) &&	\
-+   defined(__LINUXTHREADS_OLD__)
-+#define UCLIBC_USE_PROC_SELF_MAPS 1
-+#include <stdio_ext.h>
-+extern int *__libc_stack_end;
-+#endif
-+#endif
-+
- #if OS(SOLARIS)
- #include <thread.h>
- #else
-@@ -610,6 +622,36 @@
-     get_thread_info(find_thread(NULL), &threadInfo);
-     return threadInfo.stack_end;
- #elif OS(UNIX)
-+#ifdef UCLIBC_USE_PROC_SELF_MAPS
-+    // Read /proc/self/maps and locate the line whose address
-+    // range contains __libc_stack_end.
-+    FILE *file = fopen("/proc/self/maps", "r");
-+    if (!file)
-+      return 0;
-+    __fsetlocking(file, FSETLOCKING_BYCALLER);
-+    char *line = NULL;
-+    size_t lineLen = 0;
-+    while (!feof_unlocked(file)) {
-+      if (getdelim(&line, &lineLen, '\n', file) <= 0)
-+	break;
-+      long from;
-+      long to;
-+      if (sscanf (line, "%lx-%lx", &from, &to) != 2)
-+	continue;
-+      if (from <= (long)__libc_stack_end && (long)__libc_stack_end < to) {
-+	fclose(file);
-+	free(line);
-+#ifdef _STACK_GROWS_UP
-+	return (void *)from;
-+#else
-+	return (void *)to;
-+#endif
-+      }
-+    }
-+    fclose(file);
-+    free(line);
-+    return 0;
-+#else 
-     static void* stackBase = 0;
-     static size_t stackSize = 0;
-     static pthread_t stackThread;
-@@ -631,6 +673,7 @@
-         stackThread = thread;
-     }
-     return static_cast<char*>(stackBase) + stackSize;
-+#endif
- #elif OS(WINCE)
-     if (g_stackBase)
-         return g_stackBase;
diff --git a/package/webkit/webkit.mk b/package/webkit/webkit.mk
index 264bcad..fb1135b 100644
--- a/package/webkit/webkit.mk
+++ b/package/webkit/webkit.mk
@@ -4,27 +4,34 @@
 #
 #############################################################
 
-WEBKIT_VERSION = 1.2.7
+WEBKIT_VERSION = 1.9.6
 WEBKIT_SITE = http://www.webkitgtk.org/releases
+WEBKIT_SOURCE = webkit-$(WEBKIT_VERSION).tar.xz
 WEBKIT_INSTALL_STAGING = YES
 WEBKIT_DEPENDENCIES = host-flex host-bison host-gperf icu libcurl libxml2 \
 	libxslt libgtk2 sqlite enchant libsoup jpeg libgail
 
+# webkit-disable-tests.patch changes configure.ac therefore autoreconf required
+WEBKIT_AUTORECONF = YES
+WEBKIT_AUTORECONF_OPT = -I $(@D)/Source/autotools
+
 # Give explicit path to icu-config, and silence gazillions of warnings
 # with recent gcc versions.
 WEBKIT_CONF_ENV = ac_cv_path_icu_config=$(STAGING_DIR)/usr/bin/icu-config \
-	CFLAGS="$(TARGET_CFLAGS) -Wno-cast-align" \
-	CXXFLAGS="$(TARGET_CXXFLAGS) -Wno-cast-align"
-
+	CFLAGS="$(TARGET_CFLAGS) -Wno-cast-align -Wno-sign-compare" \
+	CXXFLAGS="$(TARGET_CXXFLAGS) -Wno-cast-align -Wno-sign-compare"
 
-ifeq ($(BR2_PACKAGE_XORG7),y)
-	WEBKIT_CONF_OPT += --with-target=x11
-	WEBKIT_DEPENDENCIES += xlib_libXt
-else
-	WEBKIT_CONF_OPT += --with-target=directfb
-	WEBKIT_DEPENDENCIES += directfb
-endif
+WEBKIT_CONF_OPT += \
+	--with-gtk=2.0 \
+	--disable-geolocation \
+	--disable-webkit2 \
+	--disable-glibtest \
+	--disable-video \
+	--disable-gtk-doc-html \
+	--disable-tests
 
-WEBKIT_CONF_OPT += --disable-video
+# Xorg Dependencies
+WEBKIT_CONF_OPT += --with-target=x11
+WEBKIT_DEPENDENCIES += xlib_libXt
 
 $(eval $(autotools-package))
-- 
1.7.9.5
