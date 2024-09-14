Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC038C02197
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 13:23:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E74184120B;
	Sat, 14 Sep 2024 13:23:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m-W-pzoof_fQ; Sat, 14 Sep 2024 13:23:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E627C411FC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E627C411FC;
	Sat, 14 Sep 2024 13:23:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9EAC51BF3F9
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 13:23:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 986298431B
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 13:23:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X0CmPs0KMxHj for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 13:23:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E3A98430C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E3A98430C
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 13:23:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 480A482B59; Sat, 14 Sep 2024 13:23:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 15:11:57 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 862543eca03a9819d4429ce7c5237e6449ae63a9
X-Git-Newrev: 0436dd22fc4ca1c6083d2dbc5eb2bbfbf32c68a5
X-Patchwork-Hint: ignore
Message-Id: <20240914132311.480A482B59@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/qt6/qt6base:
 backport fix for CVE-2023-38197
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4296316594958217486=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4296316594958217486==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=0436dd22fc4ca1c6083d2dbc5eb2bbfbf32c68a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

This commit backports an upstream patch to fix CVE-2023-38197, which
requires 3 other patches to be backported in order to work properly.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ngArray-fix-ambiguous-qOffsetStringArray-.patch |  49 +++
 ...StringArray-fix-size_t-qsizetype-mismatch.patch |  37 ++
 ...eader-use-qOffsetStringArray-for-storing-.patch | 114 ++++++
 ...amReader-Raise-error-on-unexpected-tokens.patch | 406 +++++++++++++++++++++
 package/qt6/qt6base/qt6base.mk                     |   2 +
 5 files changed, 608 insertions(+)

diff --git a/package/qt6/qt6base/0006-QOffsetStringArray-fix-ambiguous-qOffsetStringArray-.patch b/package/qt6/qt6base/0006-QOffsetStringArray-fix-ambiguous-qOffsetStringArray-.patch
new file mode 100644
index 0000000000..c2bebfc4f0
--- /dev/null
+++ b/package/qt6/qt6base/0006-QOffsetStringArray-fix-ambiguous-qOffsetStringArray-.patch
@@ -0,0 +1,49 @@
+From 0e0e075aeb4d8a1efa2178c0de3084b800ab62ed Mon Sep 17 00:00:00 2001
+From: Marc Mutz <marc.mutz@qt.io>
+Date: Sun, 4 Sep 2022 12:31:10 +0200
+Subject: [PATCH] QOffsetStringArray: fix ambiguous qOffsetStringArray
+ overloads
+
+There are two qOffsetStringArray overloads: one in QT_NAMESPACE, the
+other in QT_PREPEND_NAMESPACE(QtPrivate). In TUs which use using
+namespace QtPrivate, a call to qOffsetStringArray() may become
+ambiguous.
+
+Fix by renaming the qOffsetStringArray() to makeOffsetStringArray().
+
+Pick-to: 6.4 6.3 6.2
+Change-Id: I242a969f363e230d6a8dfb048601a0c024724f6a
+Reviewed-by: Thiago Macieira <thiago.macieira@intel.com>
+
+Upstream: https://github.com/qt/qtbase/commit/21c5eeba673694f865badfd137ee9fc474177ae0
+[Thomas: needed to backport fix for CVE-2023-38197]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/corelib/tools/qoffsetstringarray_p.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/corelib/tools/qoffsetstringarray_p.h b/src/corelib/tools/qoffsetstringarray_p.h
+index 461d61a2bae..fe3f7fbd5ff 100644
+--- a/src/corelib/tools/qoffsetstringarray_p.h
++++ b/src/corelib/tools/qoffsetstringarray_p.h
+@@ -118,7 +118,7 @@ template <size_t KL, size_t VL> struct StaticMapEntry
+ };
+ 
+ template <typename StringExtractor, typename... T>
+-constexpr auto qOffsetStringArray(StringExtractor extractString, const T &... entries)
++constexpr auto makeOffsetStringArray(StringExtractor extractString, const T &... entries)
+ {
+     constexpr size_t Count = sizeof...(T);
+     constexpr qsizetype StringLength = (sizeof(extractString(T{})) + ...);
+@@ -142,7 +142,7 @@ template<int ... Nx>
+ constexpr auto qOffsetStringArray(const char (&...strings)[Nx]) noexcept
+ {
+     auto extractString = [](const auto &s) -> decltype(auto) { return s; };
+-    return QtPrivate::qOffsetStringArray(extractString, QtPrivate::StaticString(strings)...);
++    return QtPrivate::makeOffsetStringArray(extractString, QtPrivate::StaticString(strings)...);
+ }
+ 
+ QT_WARNING_POP
+-- 
+2.46.0
+
diff --git a/package/qt6/qt6base/0007-QOffsetStringArray-fix-size_t-qsizetype-mismatch.patch b/package/qt6/qt6base/0007-QOffsetStringArray-fix-size_t-qsizetype-mismatch.patch
new file mode 100644
index 0000000000..a603d63bb8
--- /dev/null
+++ b/package/qt6/qt6base/0007-QOffsetStringArray-fix-size_t-qsizetype-mismatch.patch
@@ -0,0 +1,37 @@
+From 0787be21a79dc3d0278ac77f8f45ed9fc8641dfe Mon Sep 17 00:00:00 2001
+From: Marc Mutz <marc.mutz@qt.io>
+Date: Mon, 5 Sep 2022 08:59:23 +0200
+Subject: [PATCH] QOffsetStringArray: fix size_t/qsizetype mismatch
+
+The sizeof operator returns, and both minifyValue and makeStaticString
+accept, size_t. Don't funnel it through a qsizetype variable, then,
+but maintain it as a size_t all the way.
+
+Pick-to: 6.4 6.3 6.2
+Task-number: QTBUG-103533
+Change-Id: I05c6a6c5da3d02daabbf1d25a15531c6f44a80ce
+Reviewed-by: Sona Kurazyan <sona.kurazyan@qt.io>
+
+Upstream: https://github.com/qt/qtbase/commit/8932eee9a652d8a325410b147955c9939278f9ed
+[Thomas: needed to backport fix for CVE-2023-38197]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/corelib/tools/qoffsetstringarray_p.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/corelib/tools/qoffsetstringarray_p.h b/src/corelib/tools/qoffsetstringarray_p.h
+index fe3f7fbd5ff..177ab9c9f45 100644
+--- a/src/corelib/tools/qoffsetstringarray_p.h
++++ b/src/corelib/tools/qoffsetstringarray_p.h
+@@ -121,7 +121,7 @@ template <typename StringExtractor, typename... T>
+ constexpr auto makeOffsetStringArray(StringExtractor extractString, const T &... entries)
+ {
+     constexpr size_t Count = sizeof...(T);
+-    constexpr qsizetype StringLength = (sizeof(extractString(T{})) + ...);
++    constexpr size_t StringLength = (sizeof(extractString(T{})) + ...);
+     using MinifiedOffsetType = decltype(QtPrivate::minifyValue<StringLength>());
+ 
+     size_t offset = 0;
+-- 
+2.46.0
+
diff --git a/package/qt6/qt6base/0008-QXmlStreamReader-use-qOffsetStringArray-for-storing-.patch b/package/qt6/qt6base/0008-QXmlStreamReader-use-qOffsetStringArray-for-storing-.patch
new file mode 100644
index 0000000000..6d9fe11111
--- /dev/null
+++ b/package/qt6/qt6base/0008-QXmlStreamReader-use-qOffsetStringArray-for-storing-.patch
@@ -0,0 +1,114 @@
+From 7e50927d133e25577a0c3481c00b6877b581f411 Mon Sep 17 00:00:00 2001
+From: Sona Kurazyan <sona.kurazyan@qt.io>
+Date: Fri, 2 Sep 2022 16:52:04 +0200
+Subject: [PATCH] QXmlStreamReader: use qOffsetStringArray for storing token
+ types
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Change-Id: I9e58c17d97c44e1b13899d30396f65b452d8600f
+Reviewed-by: Mårten Nordheim <marten.nordheim@qt.io>
+
+Upstream: https://github.com/qt/qtbase/commit/d674f3f5454fb39de9405484a8c01fb928523f67
+[Thomas: needed to backport fix for CVE-2023-38197]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/corelib/serialization/qxmlstream.cpp | 67 ++++++------------------
+ 1 file changed, 16 insertions(+), 51 deletions(-)
+
+diff --git a/src/corelib/serialization/qxmlstream.cpp b/src/corelib/serialization/qxmlstream.cpp
+index 70e65df9957..a31bd16f1ce 100644
+--- a/src/corelib/serialization/qxmlstream.cpp
++++ b/src/corelib/serialization/qxmlstream.cpp
+@@ -15,6 +15,8 @@
+ #include <qscopeguard.h>
+ #include <qcoreapplication.h>
+ 
++#include <private/qoffsetstringarray_p.h>
++
+ #include <iterator>
+ #include "qxmlstream_p.h"
+ #include "qxmlstreamparser_p.h"
+@@ -642,55 +644,19 @@ void QXmlStreamReader::skipCurrentElement()
+     }
+ }
+ 
+-/*
+- * Use the following Perl script to generate the error string index list:
+-===== PERL SCRIPT ====
+-print "static const char QXmlStreamReader_tokenTypeString_string[] =\n";
+-$counter = 0;
+-$i = 0;
+-while (<STDIN>) {
+-    chomp;
+-    print "    \"$_\\0\"\n";
+-    $sizes[$i++] = $counter;
+-    $counter += length 1 + $_;
+-}
+-print "    \"\\0\";\n\nstatic const short QXmlStreamReader_tokenTypeString_indices[] = {\n    ";
+-for ($j = 0; $j < $i; ++$j) {
+-    printf "$sizes[$j], ";
+-}
+-print "0\n};\n";
+-===== PERL SCRIPT ====
+-
+- * The input data is as follows (copied from qxmlstream.h):
+-NoToken
+-Invalid
+-StartDocument
+-EndDocument
+-StartElement
+-EndElement
+-Characters
+-Comment
+-DTD
+-EntityReference
+-ProcessingInstruction
+-*/
+-static const char QXmlStreamReader_tokenTypeString_string[] =
+-    "NoToken\0"
+-    "Invalid\0"
+-    "StartDocument\0"
+-    "EndDocument\0"
+-    "StartElement\0"
+-    "EndElement\0"
+-    "Characters\0"
+-    "Comment\0"
+-    "DTD\0"
+-    "EntityReference\0"
+-    "ProcessingInstruction\0";
+-
+-static const short QXmlStreamReader_tokenTypeString_indices[] = {
+-    0, 8, 16, 30, 42, 55, 66, 77, 85, 89, 105, 0
+-};
+-
++static constexpr auto QXmlStreamReader_tokenTypeString = qOffsetStringArray(
++    "NoToken",
++    "Invalid",
++    "StartDocument",
++    "EndDocument",
++    "StartElement",
++    "EndElement",
++    "Characters",
++    "Comment",
++    "DTD",
++    "EntityReference",
++    "ProcessingInstruction"
++);
+ 
+ /*!
+     \property  QXmlStreamReader::namespaceProcessing
+@@ -723,8 +689,7 @@ bool QXmlStreamReader::namespaceProcessing() const
+ QString QXmlStreamReader::tokenString() const
+ {
+     Q_D(const QXmlStreamReader);
+-    return QLatin1StringView(QXmlStreamReader_tokenTypeString_string +
+-                             QXmlStreamReader_tokenTypeString_indices[d->type]);
++    return QLatin1StringView(QXmlStreamReader_tokenTypeString.at(d->type));
+ }
+ 
+ #endif // QT_NO_XMLSTREAMREADER
+-- 
+2.46.0
+
diff --git a/package/qt6/qt6base/0009-QXmlStreamReader-Raise-error-on-unexpected-tokens.patch b/package/qt6/qt6base/0009-QXmlStreamReader-Raise-error-on-unexpected-tokens.patch
new file mode 100644
index 0000000000..06f2e367e7
--- /dev/null
+++ b/package/qt6/qt6base/0009-QXmlStreamReader-Raise-error-on-unexpected-tokens.patch
@@ -0,0 +1,406 @@
+From dc24f76cc621d56d11abb015654c427f7a7c0a31 Mon Sep 17 00:00:00 2001
+From: Axel Spoerl <axel.spoerl@qt.io>
+Date: Fri, 30 Jun 2023 12:43:59 +0200
+Subject: [PATCH] QXmlStreamReader: Raise error on unexpected tokens
+
+QXmlStreamReader accepted multiple DOCTYPE elements, containing DTD
+fragments in the XML prolog, and in the XML body.
+Well-formed but invalid XML files - with multiple DTD fragments in
+prolog and body, combined with recursive entity expansions - have
+caused infinite loops in QXmlStreamReader.
+
+This patch implements a token check in QXmlStreamReader.
+A stream is allowed to start with an XML prolog. StartDocument
+and DOCTYPE elements are only allowed in this prolog, which
+may also contain ProcessingInstruction and Comment elements.
+As soon as anything else is seen, the prolog ends.
+After that, the prolog-specific elements are treated as unexpected.
+Furthermore, the prolog can contain at most one DOCTYPE element.
+
+Update the documentation to reflect the new behavior.
+Add an autotest that checks the new error cases are correctly detected,
+and no error is raised for legitimate input.
+
+The original OSS-Fuzz files (see bug reports) are not included in this
+patch for file size reasons. They have been tested manually. Each of
+them has more than one DOCTYPE element, causing infinite loops in
+recursive entity expansions. The newly implemented functionality
+detects those invalid DTD fragments. By raising an error, it aborts
+stream reading before an infinite loop occurs.
+
+Thanks to OSS-Fuzz for finding this.
+
+Fixes: QTBUG-92113
+Fixes: QTBUG-95188
+Pick-to: 6.6 6.5 6.2 5.15
+Change-Id: I0a082b9188b2eee50b396c4d5b1c9e1fd237bbdd
+Reviewed-by: Volker Hilsheimer <volker.hilsheimer@qt.io>
+
+Fixes: https://security-tracker.debian.org/tracker/CVE-2023-38197
+Upstream: https://github.com/qt/qtbase/commit/c4301be7d5f94852e1b17f2c2989d5ca807855d4
+[Thomas: minor conflicts resolved when backporting]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/corelib/serialization/qxmlstream.cpp      | 145 +++++++++++++++++-
+ src/corelib/serialization/qxmlstream_p.h      |  11 ++
+ .../qxmlstream/tokenError/dtdInBody.xml       |  20 +++
+ .../qxmlstream/tokenError/multipleDtd.xml     |  20 +++
+ .../qxmlstream/tokenError/wellFormed.xml      |  15 ++
+ .../qxmlstream/tst_qxmlstream.cpp             |  39 +++++
+ 6 files changed, 242 insertions(+), 8 deletions(-)
+ create mode 100644 tests/auto/corelib/serialization/qxmlstream/tokenError/dtdInBody.xml
+ create mode 100644 tests/auto/corelib/serialization/qxmlstream/tokenError/multipleDtd.xml
+ create mode 100644 tests/auto/corelib/serialization/qxmlstream/tokenError/wellFormed.xml
+
+diff --git a/src/corelib/serialization/qxmlstream.cpp b/src/corelib/serialization/qxmlstream.cpp
+index a31bd16f1ce..ac5b291c278 100644
+--- a/src/corelib/serialization/qxmlstream.cpp
++++ b/src/corelib/serialization/qxmlstream.cpp
+@@ -128,7 +128,7 @@ void reversed(const Range &&) = delete;
+     addData() or by waiting for it to arrive on the device().
+ 
+     \value UnexpectedElementError The parser encountered an element
+-    that was different to those it expected.
++    or token that was different to those it expected.
+ 
+ */
+ 
+@@ -265,13 +265,34 @@ QXmlStreamEntityResolver *QXmlStreamReader::entityResolver() const
+ 
+   QXmlStreamReader is a well-formed XML 1.0 parser that does \e not
+   include external parsed entities. As long as no error occurs, the
+-  application code can thus be assured that the data provided by the
+-  stream reader satisfies the W3C's criteria for well-formed XML. For
+-  example, you can be certain that all tags are indeed nested and
+-  closed properly, that references to internal entities have been
+-  replaced with the correct replacement text, and that attributes have
+-  been normalized or added according to the internal subset of the
+-  DTD.
++  application code can thus be assured, that
++  \list
++  \li the data provided by the stream reader satisfies the W3C's
++      criteria for well-formed XML,
++  \li tokens are provided in a valid order.
++  \endlist
++
++  Unless QXmlStreamReader raises an error, it guarantees the following:
++  \list
++  \li All tags are nested and closed properly.
++  \li References to internal entities have been replaced with the
++      correct replacement text.
++  \li Attributes have been normalized or added according to the
++      internal subset of the \l DTD.
++  \li Tokens of type \l StartDocument happen before all others,
++      aside from comments and processing instructions.
++  \li At most one DOCTYPE element (a token of type \l DTD) is present.
++  \li If present, the DOCTYPE appears before all other elements,
++      aside from StartDocument, comments and processing instructions.
++  \endlist
++
++  In particular, once any token of type \l StartElement, \l EndElement,
++  \l Characters, \l EntityReference or \l EndDocument is seen, no
++  tokens of type StartDocument or DTD will be seen. If one is present in
++  the input stream, out of order, an error is raised.
++
++  \note The token types \l Comment and \l ProcessingInstruction may appear
++  anywhere in the stream.
+ 
+   If an error occurs while parsing, atEnd() and hasError() return
+   true, and error() returns the error that occurred. The functions
+@@ -574,6 +595,7 @@ QXmlStreamReader::TokenType QXmlStreamReader::readNext()
+         d->token = -1;
+         return readNext();
+     }
++    d->checkToken();
+     return d->type;
+ }
+ 
+@@ -658,6 +680,11 @@ static constexpr auto QXmlStreamReader_tokenTypeString = qOffsetStringArray(
+     "ProcessingInstruction"
+ );
+ 
++static constexpr auto QXmlStreamReader_XmlContextString = qOffsetStringArray(
++    "Prolog",
++    "Body"
++);
++
+ /*!
+     \property  QXmlStreamReader::namespaceProcessing
+     \brief the namespace-processing flag of the stream reader.
+@@ -692,6 +719,14 @@ QString QXmlStreamReader::tokenString() const
+     return QLatin1StringView(QXmlStreamReader_tokenTypeString.at(d->type));
+ }
+ 
++/*!
++   \internal
++   \return \param loc (Prolog/Body) as a string.
++ */
++static constexpr QLatin1StringView contextString(QXmlStreamReaderPrivate::XmlContext ctxt)
++{
++    return QLatin1StringView(QXmlStreamReader_XmlContextString.at(static_cast<int>(ctxt)));
++}
+ #endif // QT_NO_XMLSTREAMREADER
+ 
+ QXmlStreamPrivateTagStack::QXmlStreamPrivateTagStack()
+@@ -778,6 +813,8 @@ void QXmlStreamReaderPrivate::init()
+ 
+     type = QXmlStreamReader::NoToken;
+     error = QXmlStreamReader::NoError;
++    currentContext = XmlContext::Prolog;
++    foundDTD = false;
+ }
+ 
+ /*
+@@ -3684,6 +3721,98 @@ void QXmlStreamWriter::writeCurrentToken(const QXmlStreamReader &reader)
+     }
+ }
+ 
++static constexpr bool isTokenAllowedInContext(QXmlStreamReader::TokenType type,
++                                               QXmlStreamReaderPrivate::XmlContext loc)
++{
++    switch (type) {
++    case QXmlStreamReader::StartDocument:
++    case QXmlStreamReader::DTD:
++        return loc == QXmlStreamReaderPrivate::XmlContext::Prolog;
++
++    case QXmlStreamReader::StartElement:
++    case QXmlStreamReader::EndElement:
++    case QXmlStreamReader::Characters:
++    case QXmlStreamReader::EntityReference:
++    case QXmlStreamReader::EndDocument:
++        return loc == QXmlStreamReaderPrivate::XmlContext::Body;
++
++    case QXmlStreamReader::Comment:
++    case QXmlStreamReader::ProcessingInstruction:
++        return true;
++
++    case QXmlStreamReader::NoToken:
++    case QXmlStreamReader::Invalid:
++        return false;
++    }
++
++    // GCC 8.x does not treat __builtin_unreachable() as constexpr
++#if !defined(Q_CC_GNU_ONLY) || (Q_CC_GNU >= 900)
++    Q_UNREACHABLE();
++    return false;
++#else
++    return false;
++#endif
++}
++
++/*!
++   \internal
++   \brief QXmlStreamReader::isValidToken
++   \return \c true if \param type is a valid token type.
++   \return \c false if \param type is an unexpected token,
++   which indicates a non-well-formed or invalid XML stream.
++ */
++bool QXmlStreamReaderPrivate::isValidToken(QXmlStreamReader::TokenType type)
++{
++    // Don't change currentContext, if Invalid or NoToken occur in the prolog
++    if (type == QXmlStreamReader::Invalid || type == QXmlStreamReader::NoToken)
++        return false;
++
++    // If a token type gets rejected in the body, there is no recovery
++    const bool result = isTokenAllowedInContext(type, currentContext);
++    if (result || currentContext == XmlContext::Body)
++        return result;
++
++    // First non-Prolog token observed => switch context to body and check again.
++    currentContext = XmlContext::Body;
++    return isTokenAllowedInContext(type, currentContext);
++}
++
++/*!
++   \internal
++   Checks token type and raises an error, if it is invalid
++   in the current context (prolog/body).
++ */
++void QXmlStreamReaderPrivate::checkToken()
++{
++    Q_Q(QXmlStreamReader);
++
++    // The token type must be consumed, to keep track if the body has been reached.
++    const XmlContext context = currentContext;
++    const bool ok = isValidToken(type);
++
++    // Do nothing if an error has been raised already (going along with an unexpected token)
++    if (error != QXmlStreamReader::Error::NoError)
++        return;
++
++    if (!ok) {
++        raiseError(QXmlStreamReader::UnexpectedElementError,
++                   QObject::tr("Unexpected token type %1 in %2.")
++                   .arg(q->tokenString(), contextString(context)));
++        return;
++    }
++
++    if (type != QXmlStreamReader::DTD)
++        return;
++
++    // Raise error on multiple DTD tokens
++    if (foundDTD) {
++        raiseError(QXmlStreamReader::UnexpectedElementError,
++                   QObject::tr("Found second DTD token in %1.").arg(contextString(context)));
++    } else {
++        foundDTD = true;
++    }
++}
++
+ /*!
+  \fn bool QXmlStreamAttributes::hasAttribute(const QString &qualifiedName) const
+  \since 4.5
+diff --git a/src/corelib/serialization/qxmlstream_p.h b/src/corelib/serialization/qxmlstream_p.h
+index 1fd69a2c1f8..f5059f8fcf9 100644
+--- a/src/corelib/serialization/qxmlstream_p.h
++++ b/src/corelib/serialization/qxmlstream_p.h
+@@ -270,6 +270,17 @@ public:
+     QStringDecoder decoder;
+     bool atEnd;
+ 
++    enum class XmlContext
++    {
++        Prolog,
++        Body,
++    };
++
++    XmlContext currentContext = XmlContext::Prolog;
++    bool foundDTD = false;
++    bool isValidToken(QXmlStreamReader::TokenType type);
++    void checkToken();
++
+     /*!
+       \sa setType()
+      */
+diff --git a/tests/auto/corelib/serialization/qxmlstream/tokenError/dtdInBody.xml b/tests/auto/corelib/serialization/qxmlstream/tokenError/dtdInBody.xml
+new file mode 100644
+index 00000000000..1c3ca4e2711
+--- /dev/null
++++ b/tests/auto/corelib/serialization/qxmlstream/tokenError/dtdInBody.xml
+@@ -0,0 +1,20 @@
++<!DOCTYPE TEST [
++   <!ELEMENT TESTATTRIBUTE (CASE+)>
++   <!ELEMENT CASE (CLASS, FUNCTION)>
++   <!ELEMENT CLASS (#PCDATA)>
++
++   <!-- adding random ENTITY statement, as this is typical DTD content -->
++   <!ENTITY unite "&#x222a;">
++
++   <!ATTLIST CASE CLASS CDATA #REQUIRED>
++]>
++<TEST>
++  <CASE>
++    <CLASS>tst_QXmlStream</CLASS>
++  </CASE>
++  <!-- invalid DTD in XML body follows -->
++  <!DOCTYPE DTDTEST [
++    <!ELEMENT RESULT (CASE+)>
++    <!ATTLIST RESULT OUTPUT CDATA #REQUIRED>
++  ]>
++</TEST>
+diff --git a/tests/auto/corelib/serialization/qxmlstream/tokenError/multipleDtd.xml b/tests/auto/corelib/serialization/qxmlstream/tokenError/multipleDtd.xml
+new file mode 100644
+index 00000000000..cd398c0f9fd
+--- /dev/null
++++ b/tests/auto/corelib/serialization/qxmlstream/tokenError/multipleDtd.xml
+@@ -0,0 +1,20 @@
++<!DOCTYPE TEST [
++   <!ELEMENT TESTATTRIBUTE (CASE+)>
++   <!ELEMENT CASE (CLASS, FUNCTION, DATASET, COMMENTS)>
++   <!ELEMENT CLASS (#PCDATA)>
++
++   <!-- adding random ENTITY statements, as this is typical DTD content -->
++   <!ENTITY iff "&hArr;">
++
++   <!ATTLIST CASE CLASS CDATA #REQUIRED>
++]>
++<!-- invalid second DTD follows -->
++<!DOCTYPE SECOND [
++   <!ELEMENT SECONDATTRIBUTE (#PCDATA)>
++   <!ENTITY on "&#8728;">
++]>
++<TEST>
++  <CASE>
++    <CLASS>tst_QXmlStream</CLASS>
++  </CASE>
++</TEST>
+diff --git a/tests/auto/corelib/serialization/qxmlstream/tokenError/wellFormed.xml b/tests/auto/corelib/serialization/qxmlstream/tokenError/wellFormed.xml
+new file mode 100644
+index 00000000000..1b61a3f0622
+--- /dev/null
++++ b/tests/auto/corelib/serialization/qxmlstream/tokenError/wellFormed.xml
+@@ -0,0 +1,15 @@
++<!DOCTYPE TEST [
++   <!ELEMENT TESTATTRIBUTE (CASE+)>
++   <!ELEMENT CASE (CLASS, FUNCTION, DATASET, COMMENTS)>
++   <!ELEMENT CLASS (#PCDATA)>
++
++   <!-- adding random ENTITY statements, as this is typical DTD content -->
++   <!ENTITY unite "&#x222a;">
++
++   <!ATTLIST CASE CLASS CDATA #REQUIRED>
++]>
++<TEST>
++  <CASE>
++    <CLASS>tst_QXmlStream</CLASS>
++  </CASE>
++</TEST>
+diff --git a/tests/auto/corelib/serialization/qxmlstream/tst_qxmlstream.cpp b/tests/auto/corelib/serialization/qxmlstream/tst_qxmlstream.cpp
+index c64088d4774..8d2738700ea 100644
+--- a/tests/auto/corelib/serialization/qxmlstream/tst_qxmlstream.cpp
++++ b/tests/auto/corelib/serialization/qxmlstream/tst_qxmlstream.cpp
+@@ -584,6 +584,9 @@ private slots:
+ 
+     void entityExpansionLimit() const;
+ 
++    void tokenErrorHandling_data() const;
++    void tokenErrorHandling() const;
++
+ private:
+     static QByteArray readFile(const QString &filename);
+ 
+@@ -1754,5 +1757,41 @@ void tst_QXmlStream::roundTrip() const
+     QCOMPARE(out, in);
+ }
+ 
++void tst_QXmlStream::tokenErrorHandling_data() const
++{
++    QTest::addColumn<QString>("fileName");
++    QTest::addColumn<QXmlStreamReader::Error>("expectedError");
++    QTest::addColumn<QString>("errorKeyWord");
++
++    constexpr auto invalid = QXmlStreamReader::Error::UnexpectedElementError;
++    constexpr auto valid = QXmlStreamReader::Error::NoError;
++    QTest::newRow("DtdInBody") << "dtdInBody.xml" << invalid << "DTD";
++    QTest::newRow("multipleDTD") << "multipleDtd.xml" << invalid << "second DTD";
++    QTest::newRow("wellFormed") << "wellFormed.xml" << valid << "";
++}
++
++void tst_QXmlStream::tokenErrorHandling() const
++{
++    QFETCH(const QString, fileName);
++    QFETCH(const QXmlStreamReader::Error, expectedError);
++    QFETCH(const QString, errorKeyWord);
++
++    const QDir dir(QFINDTESTDATA("tokenError"));
++    QFile file(dir.absoluteFilePath(fileName));
++
++    // Cross-compiling: File will be on host only
++    if (!file.exists())
++        QSKIP("Testfile not found.");
++
++    file.open(QIODevice::ReadOnly);
++    QXmlStreamReader reader(&file);
++    while (!reader.atEnd())
++        reader.readNext();
++
++    QCOMPARE(reader.error(), expectedError);
++    if (expectedError != QXmlStreamReader::Error::NoError)
++        QVERIFY(reader.errorString().contains(errorKeyWord));
++}
++
+ #include "tst_qxmlstream.moc"
+ // vim: et:ts=4:sw=4:sts=4
+-- 
+2.46.0
+
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index a14f1dd4fd..9d21aefbfb 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -15,6 +15,8 @@ QT6BASE_IGNORE_CVES += CVE-2023-33285
 QT6BASE_IGNORE_CVES += CVE-2023-32762
 # 0005-Fix-specific-overflow-in-qtextlayout.patch
 QT6BASE_IGNORE_CVES += CVE-2023-32763
+# 0009-QXmlStreamReader-Raise-error-on-unexpected-tokens.patch
+QT6BASE_IGNORE_CVES += CVE-2023-38197
 
 QT6BASE_CMAKE_BACKEND = ninja
 

--===============4296316594958217486==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4296316594958217486==--
