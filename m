Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9756BC02197
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 13:23:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1FA3440523;
	Sat, 14 Sep 2024 13:23:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BL8efBE9IUhr; Sat, 14 Sep 2024 13:23:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 26D324116D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 26D324116D;
	Sat, 14 Sep 2024 13:23:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E9BF61BF3F9
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 13:23:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ECD9360652
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 13:23:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oNVOCfvzKr8X for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 13:23:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 749526068A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 749526068A
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 13:23:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5EEB182B5C; Sat, 14 Sep 2024 13:23:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 15:12:29 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 4009842cba631b1061bcdea799e0802c40ea549c
X-Git-Newrev: 4757e24ae4863ac7570513ecb8896c74d495a774
X-Patchwork-Hint: ignore
Message-Id: <20240914132311.5EEB182B5C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/qt6/qt6base:
 backport fix for CVE-2023-37369
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4757e24ae4863ac7570513ecb8896c74d495a774
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

This commit backports upstream patches that are needed to fix
CVE-2023-37369. The second one is the actual CVE fix, the first one is
needed to only backporting the second patch in a reasonable way.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...eader-change-fastScanName-to-take-a-Value.patch | 112 +++++++++
 ...eader-make-fastScanName-indicate-parsing-.patch | 277 +++++++++++++++++++++
 package/qt6/qt6base/qt6base.mk                     |   2 +
 3 files changed, 391 insertions(+)

diff --git a/package/qt6/qt6base/0012-QXmlStreamReader-change-fastScanName-to-take-a-Value.patch b/package/qt6/qt6base/0012-QXmlStreamReader-change-fastScanName-to-take-a-Value.patch
new file mode 100644
index 0000000000..a105abd5bf
--- /dev/null
+++ b/package/qt6/qt6base/0012-QXmlStreamReader-change-fastScanName-to-take-a-Value.patch
@@ -0,0 +1,112 @@
+From 4a19ee001b0a80318860af4bc042382c7ffb6bbb Mon Sep 17 00:00:00 2001
+From: Ahmad Samir <a.samirh78@gmail.com>
+Date: Wed, 12 Apr 2023 13:10:26 +0200
+Subject: [PATCH] QXmlStreamReader: change fastScanName() to take a Value*
+
+For easier debugging, e.g. to print out value.len and value.prefix.
+
+Pick-to: 6.6 6.5 6.5.2 6.2 5.15
+Change-Id: Ib0eed38772f899502962f578775d34ea2744fdde
+Reviewed-by: Marc Mutz <marc.mutz@qt.io>
+
+Upstream: https://github.com/qt/qtbase/commit/1a423ce4372d18a779f3c0d746d5283d9a425839
+[Thomas: needed to fix
+https://security-tracker.debian.org/tracker/CVE-2023-37369]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/corelib/serialization/qxmlstream.cpp       | 16 ++++++++--------
+ src/corelib/serialization/qxmlstream.g         |  3 ++-
+ src/corelib/serialization/qxmlstream_p.h       |  2 +-
+ src/corelib/serialization/qxmlstreamparser_p.h |  3 ++-
+ 4 files changed, 13 insertions(+), 11 deletions(-)
+
+diff --git a/src/corelib/serialization/qxmlstream.cpp b/src/corelib/serialization/qxmlstream.cpp
+index ac5b291c278..466f456ee63 100644
+--- a/src/corelib/serialization/qxmlstream.cpp
++++ b/src/corelib/serialization/qxmlstream.cpp
+@@ -1247,7 +1247,7 @@ inline qsizetype QXmlStreamReaderPrivate::fastScanContentCharList()
+     return n;
+ }
+ 
+-inline qsizetype QXmlStreamReaderPrivate::fastScanName(qint16 *prefix)
++inline qsizetype QXmlStreamReaderPrivate::fastScanName(Value *val)
+ {
+     qsizetype n = 0;
+     uint c;
+@@ -1284,16 +1284,16 @@ inline qsizetype QXmlStreamReaderPrivate::fastScanName(qint16 *prefix)
+         case '+':
+         case '*':
+             putChar(c);
+-            if (prefix && *prefix == n+1) {
+-                *prefix = 0;
++            if (val && val->prefix == n + 1) {
++                val->prefix = 0;
+                 putChar(':');
+                 --n;
+             }
+             return n;
+         case ':':
+-            if (prefix) {
+-                if (*prefix == 0) {
+-                    *prefix = qint16(n + 2);
++            if (val) {
++                if (val->prefix == 0) {
++                    val->prefix = qint16(n + 2);
+                 } else { // only one colon allowed according to the namespace spec.
+                     putChar(c);
+                     return n;
+@@ -1309,8 +1309,8 @@ inline qsizetype QXmlStreamReaderPrivate::fastScanName(qint16 *prefix)
+         }
+     }
+ 
+-    if (prefix)
+-        *prefix = 0;
++    if (val)
++        val->prefix = 0;
+     qsizetype pos = textBuffer.size() - n;
+     putString(textBuffer, pos);
+     textBuffer.resize(pos);
+diff --git a/src/corelib/serialization/qxmlstream.g b/src/corelib/serialization/qxmlstream.g
+index d06c371eb87..f3152bff378 100644
+--- a/src/corelib/serialization/qxmlstream.g
++++ b/src/corelib/serialization/qxmlstream.g
+@@ -1419,7 +1419,8 @@ space_opt ::= space;
+ qname ::= LETTER;
+ /.
+         case $rule_number: {
+-            sym(1).len += fastScanName(&sym(1).prefix);
++            Value &val = sym(1);
++            val.len += fastScanName(&val);
+             if (atEnd) {
+                 resume($rule_number);
+                 return false;
+diff --git a/src/corelib/serialization/qxmlstream_p.h b/src/corelib/serialization/qxmlstream_p.h
+index f5059f8fcf9..efee742963b 100644
+--- a/src/corelib/serialization/qxmlstream_p.h
++++ b/src/corelib/serialization/qxmlstream_p.h
+@@ -482,7 +482,7 @@ public:
+     qsizetype fastScanLiteralContent();
+     qsizetype fastScanSpace();
+     qsizetype fastScanContentCharList();
+-    qsizetype fastScanName(qint16 *prefix = nullptr);
++    qsizetype fastScanName(Value *val = nullptr);
+     inline qsizetype fastScanNMTOKEN();
+ 
+ 
+diff --git a/src/corelib/serialization/qxmlstreamparser_p.h b/src/corelib/serialization/qxmlstreamparser_p.h
+index e3ae6faa442..59370a93106 100644
+--- a/src/corelib/serialization/qxmlstreamparser_p.h
++++ b/src/corelib/serialization/qxmlstreamparser_p.h
+@@ -947,7 +947,8 @@ bool QXmlStreamReaderPrivate::parse()
+         break;
+ 
+         case 262: {
+-            sym(1).len += fastScanName(&sym(1).prefix);
++            Value &val = sym(1);
++            val.len += fastScanName(&val);
+             if (atEnd) {
+                 resume(262);
+                 return false;
+-- 
+2.46.0
+
diff --git a/package/qt6/qt6base/0013-QXmlStreamReader-make-fastScanName-indicate-parsing-.patch b/package/qt6/qt6base/0013-QXmlStreamReader-make-fastScanName-indicate-parsing-.patch
new file mode 100644
index 0000000000..c17a1a2e1f
--- /dev/null
+++ b/package/qt6/qt6base/0013-QXmlStreamReader-make-fastScanName-indicate-parsing-.patch
@@ -0,0 +1,277 @@
+From 87f0d5c9212df3087b053a36165453f10205924d Mon Sep 17 00:00:00 2001
+From: Ahmad Samir <a.samirh78@gmail.com>
+Date: Thu, 22 Jun 2023 15:56:07 +0300
+Subject: [PATCH] QXmlStreamReader: make fastScanName() indicate parsing status
+ to callers
+
+This fixes a crash while parsing an XML file with garbage data, the file
+starts with '<' then garbage data:
+- The loop in the parse() keeps iterating until it hits "case 262:",
+  which calls fastScanName()
+- fastScanName() iterates over the text buffer scanning for the
+  attribute name (e.g. "xml:lang"), until it finds ':'
+- Consider a Value val, fastScanName() is called on it, it would set
+  val.prefix to a number > val.len, then it would hit the 4096 condition
+  and return (returned 0, now it returns the equivalent of
+  std::null_opt), which means that val.len doesn't get modified, making
+  it smaller than val.prefix
+- The code would try constructing an XmlStringRef with negative length,
+  which would hit an assert in one of QStringView's constructors
+
+Add an assert to the XmlStringRef constructor.
+
+Add unittest based on the file from the bug report.
+
+Later on I will replace FastScanNameResult with std::optional<qsizetype>
+(std::optional is C++17, which isn't required by Qt 5.15, and we want to
+backport this fix).
+
+Credit to OSS-Fuzz.
+
+Fixes: QTBUG-109781
+Fixes: QTBUG-114829
+Pick-to: 6.6 6.5 6.2 5.15
+Change-Id: I455a5eeb47870c2ac9ffd0cbcdcd99c1ae2dd374
+Reviewed-by: Allan Sandfeld Jensen <allan.jensen@qt.io>
+
+Fixes: https://security-tracker.debian.org/tracker/CVE-2023-37369
+Upstream: https://github.com/qt/qtbase/commit/6326bec46a618c72feba4a2bb994c4d475050aed
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/corelib/serialization/qxmlstream.cpp      | 23 ++++++++---
+ src/corelib/serialization/qxmlstream.g        | 12 +++++-
+ src/corelib/serialization/qxmlstream_p.h      | 14 ++++++-
+ .../serialization/qxmlstreamparser_p.h        | 12 +++++-
+ .../qxmlstream/tst_qxmlstream.cpp             | 39 +++++++++++++++++++
+ 5 files changed, 88 insertions(+), 12 deletions(-)
+
+diff --git a/src/corelib/serialization/qxmlstream.cpp b/src/corelib/serialization/qxmlstream.cpp
+index 466f456ee63..2c879fb4c20 100644
+--- a/src/corelib/serialization/qxmlstream.cpp
++++ b/src/corelib/serialization/qxmlstream.cpp
+@@ -1247,7 +1247,9 @@ inline qsizetype QXmlStreamReaderPrivate::fastScanContentCharList()
+     return n;
+ }
+ 
+-inline qsizetype QXmlStreamReaderPrivate::fastScanName(Value *val)
++// Fast scan an XML attribute name (e.g. "xml:lang").
++inline QXmlStreamReaderPrivate::FastScanNameResult
++QXmlStreamReaderPrivate::fastScanName(Value *val)
+ {
+     qsizetype n = 0;
+     uint c;
+@@ -1255,7 +1257,8 @@ inline qsizetype QXmlStreamReaderPrivate::fastScanName(Value *val)
+         if (n >= 4096) {
+             // This is too long to be a sensible name, and
+             // can exhaust memory, or the range of decltype(*prefix)
+-            return 0;
++            raiseNamePrefixTooLongError();
++            return {};
+         }
+         switch (c) {
+         case '\n':
+@@ -1289,18 +1292,18 @@ inline qsizetype QXmlStreamReaderPrivate::fastScanName(Value *val)
+                 putChar(':');
+                 --n;
+             }
+-            return n;
++            return FastScanNameResult(n);
+         case ':':
+             if (val) {
+                 if (val->prefix == 0) {
+                     val->prefix = qint16(n + 2);
+                 } else { // only one colon allowed according to the namespace spec.
+                     putChar(c);
+-                    return n;
++                    return FastScanNameResult(n);
+                 }
+             } else {
+                 putChar(c);
+-                return n;
++                return FastScanNameResult(n);
+             }
+             Q_FALLTHROUGH();
+         default:
+@@ -1314,7 +1317,7 @@ inline qsizetype QXmlStreamReaderPrivate::fastScanName(Value *val)
+     qsizetype pos = textBuffer.size() - n;
+     putString(textBuffer, pos);
+     textBuffer.resize(pos);
+-    return 0;
++    return FastScanNameResult(0);
+ }
+ 
+ enum NameChar { NameBeginning, NameNotBeginning, NotName };
+@@ -1795,6 +1798,14 @@ void QXmlStreamReaderPrivate::raiseWellFormedError(const QString &message)
+     raiseError(QXmlStreamReader::NotWellFormedError, message);
+ }
+ 
++void QXmlStreamReaderPrivate::raiseNamePrefixTooLongError()
++{
++    // TODO: add a ImplementationLimitsExceededError and use it instead
++    raiseError(QXmlStreamReader::NotWellFormedError,
++               QXmlStream::tr("Length of XML attribute name exceeds implemnetation limits (4KiB "
++                              "characters)."));
++}
++
+ void QXmlStreamReaderPrivate::parseError()
+ {
+ 
+diff --git a/src/corelib/serialization/qxmlstream.g b/src/corelib/serialization/qxmlstream.g
+index f3152bff378..fc122e66811 100644
+--- a/src/corelib/serialization/qxmlstream.g
++++ b/src/corelib/serialization/qxmlstream.g
+@@ -1420,7 +1420,11 @@ qname ::= LETTER;
+ /.
+         case $rule_number: {
+             Value &val = sym(1);
+-            val.len += fastScanName(&val);
++            if (auto res = fastScanName(&val))
++                val.len += *res;
++            else
++                return false;
++
+             if (atEnd) {
+                 resume($rule_number);
+                 return false;
+@@ -1431,7 +1435,11 @@ qname ::= LETTER;
+ name ::= LETTER;
+ /.
+         case $rule_number:
+-            sym(1).len += fastScanName();
++            if (auto res = fastScanName())
++                sym(1).len += *res;
++            else
++                return false;
++
+             if (atEnd) {
+                 resume($rule_number);
+                 return false;
+diff --git a/src/corelib/serialization/qxmlstream_p.h b/src/corelib/serialization/qxmlstream_p.h
+index efee742963b..be69921c7c3 100644
+--- a/src/corelib/serialization/qxmlstream_p.h
++++ b/src/corelib/serialization/qxmlstream_p.h
+@@ -38,7 +38,7 @@ public:
+ 
+     constexpr XmlStringRef() = default;
+     constexpr inline XmlStringRef(const QString *string, qsizetype pos, qsizetype length)
+-        : m_string(string), m_pos(pos), m_size(length)
++        : m_string(string), m_pos(pos), m_size((Q_ASSERT(length >= 0), length))
+     {
+     }
+     XmlStringRef(const QString *string)
+@@ -482,7 +482,16 @@ public:
+     qsizetype fastScanLiteralContent();
+     qsizetype fastScanSpace();
+     qsizetype fastScanContentCharList();
+-    qsizetype fastScanName(Value *val = nullptr);
++
++    struct FastScanNameResult {
++        FastScanNameResult() : ok(false) {}
++        explicit FastScanNameResult(qsizetype len) : addToLen(len), ok(true) { }
++        operator bool() { return ok; }
++        qsizetype operator*() { Q_ASSERT(ok); return addToLen; }
++        qsizetype addToLen;
++        bool ok;
++    };
++    FastScanNameResult fastScanName(Value *val = nullptr);
+     inline qsizetype fastScanNMTOKEN();
+ 
+ 
+@@ -491,6 +500,7 @@ public:
+ 
+     void raiseError(QXmlStreamReader::Error error, const QString& message = QString());
+     void raiseWellFormedError(const QString &message);
++    void raiseNamePrefixTooLongError();
+ 
+     QXmlStreamEntityResolver *entityResolver;
+ 
+diff --git a/src/corelib/serialization/qxmlstreamparser_p.h b/src/corelib/serialization/qxmlstreamparser_p.h
+index 59370a93106..afd83381b3f 100644
+--- a/src/corelib/serialization/qxmlstreamparser_p.h
++++ b/src/corelib/serialization/qxmlstreamparser_p.h
+@@ -948,7 +948,11 @@ bool QXmlStreamReaderPrivate::parse()
+ 
+         case 262: {
+             Value &val = sym(1);
+-            val.len += fastScanName(&val);
++            if (auto res = fastScanName(&val))
++                val.len += *res;
++            else
++                return false;
++
+             if (atEnd) {
+                 resume(262);
+                 return false;
+@@ -956,7 +960,11 @@ bool QXmlStreamReaderPrivate::parse()
+         } break;
+ 
+         case 263:
+-            sym(1).len += fastScanName();
++            if (auto res = fastScanName())
++                sym(1).len += *res;
++            else
++                return false;
++
+             if (atEnd) {
+                 resume(263);
+                 return false;
+diff --git a/tests/auto/corelib/serialization/qxmlstream/tst_qxmlstream.cpp b/tests/auto/corelib/serialization/qxmlstream/tst_qxmlstream.cpp
+index 8d2738700ea..ac41528e2a8 100644
+--- a/tests/auto/corelib/serialization/qxmlstream/tst_qxmlstream.cpp
++++ b/tests/auto/corelib/serialization/qxmlstream/tst_qxmlstream.cpp
+@@ -581,6 +581,8 @@ private slots:
+     void readBack() const;
+     void roundTrip() const;
+     void roundTrip_data() const;
++    void test_fastScanName_data() const;
++    void test_fastScanName() const;
+ 
+     void entityExpansionLimit() const;
+ 
+@@ -1757,6 +1759,43 @@ void tst_QXmlStream::roundTrip() const
+     QCOMPARE(out, in);
+ }
+ 
++void tst_QXmlStream::test_fastScanName_data() const
++{
++    QTest::addColumn<QByteArray>("data");
++    QTest::addColumn<QXmlStreamReader::Error>("errorType");
++
++    // 4096 is the limit in QXmlStreamReaderPrivate::fastScanName()
++
++    QByteArray arr = "<a"_ba + ":" + QByteArray("b").repeated(4096 - 1);
++    QTest::newRow("data1") << arr << QXmlStreamReader::PrematureEndOfDocumentError;
++
++    arr = "<a"_ba + ":" + QByteArray("b").repeated(4096);
++    QTest::newRow("data2") << arr << QXmlStreamReader::NotWellFormedError;
++
++    arr = "<"_ba + QByteArray("a").repeated(4000) + ":" + QByteArray("b").repeated(96);
++    QTest::newRow("data3") << arr << QXmlStreamReader::PrematureEndOfDocumentError;
++
++    arr = "<"_ba + QByteArray("a").repeated(4000) + ":" + QByteArray("b").repeated(96 + 1);
++    QTest::newRow("data4") << arr << QXmlStreamReader::NotWellFormedError;
++
++    arr = "<"_ba + QByteArray("a").repeated(4000 + 1) + ":" + QByteArray("b").repeated(96);
++    QTest::newRow("data5") << arr << QXmlStreamReader::NotWellFormedError;
++}
++
++void tst_QXmlStream::test_fastScanName() const
++{
++    QFETCH(QByteArray, data);
++    QFETCH(QXmlStreamReader::Error, errorType);
++
++    QXmlStreamReader reader(data);
++    QXmlStreamReader::TokenType tokenType;
++    while (!reader.atEnd())
++        tokenType = reader.readNext();
++
++    QCOMPARE(tokenType, QXmlStreamReader::Invalid);
++    QCOMPARE(reader.error(), errorType);
++}
++
+ void tst_QXmlStream::tokenErrorHandling_data() const
+ {
+     QTest::addColumn<QString>("fileName");
+-- 
+2.46.0
+
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 0bb9a197ec..7cfcc708d8 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -19,6 +19,8 @@ QT6BASE_IGNORE_CVES += CVE-2023-32763
 QT6BASE_IGNORE_CVES += CVE-2023-38197
 # 0011-HPack-fix-incorrect-integer-overflow-check.patch
 QT6BASE_IGNORE_CVES += CVE-2023-38197
+# 0013-QXmlStreamReader-make-fastScanName-indicate-parsing-.patch
+QT6BASE_IGNORE_CVES += CVE-2023-37369
 
 QT6BASE_CMAKE_BACKEND = ninja
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
