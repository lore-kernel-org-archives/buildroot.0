Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9C0EC433EF
	for <buildroot@archiver.kernel.org>; Thu,  2 Dec 2021 22:32:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FA9D83FB0;
	Thu,  2 Dec 2021 22:32:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qkRhe85Ycli7; Thu,  2 Dec 2021 22:32:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64DBB83FAA;
	Thu,  2 Dec 2021 22:32:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 908AE1BF475
 for <buildroot@lists.busybox.net>; Thu,  2 Dec 2021 22:32:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 891C440A95
 for <buildroot@lists.busybox.net>; Thu,  2 Dec 2021 22:32:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1yRe3_qhd0uB for <buildroot@lists.busybox.net>;
 Thu,  2 Dec 2021 22:32:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 76F5E40A94
 for <buildroot@buildroot.org>; Thu,  2 Dec 2021 22:32:54 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 1258C40003;
 Thu,  2 Dec 2021 22:32:50 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1msudG-0004JJ-4k; Thu, 02 Dec 2021 23:32:50 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu,  2 Dec 2021 23:32:43 +0100
Message-Id: <20211202223245.16511-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/icu: backport upstream security fix for
 CVE-2021-30535
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes CVE-2021-30535: Double free in ICU in Google Chrome prior to
91.0.4472.77 allowed a remote attacker to potentially exploit heap
corruption via a crafted HTML page.

https://nvd.nist.gov/vuln/detail/CVE-2021-30535

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-ICU-21587-Fix-memory-bug-w-baseName.patch | 112 ++++++++++++++++++
 package/icu/icu.mk                            |   3 +
 2 files changed, 115 insertions(+)
 create mode 100644 package/icu/0005-ICU-21587-Fix-memory-bug-w-baseName.patch

diff --git a/package/icu/0005-ICU-21587-Fix-memory-bug-w-baseName.patch b/package/icu/0005-ICU-21587-Fix-memory-bug-w-baseName.patch
new file mode 100644
index 0000000000..15af976e49
--- /dev/null
+++ b/package/icu/0005-ICU-21587-Fix-memory-bug-w-baseName.patch
@@ -0,0 +1,112 @@
+From 2dc5bea9061b4fb05cd03e21b775dd944a0eb81d Mon Sep 17 00:00:00 2001
+From: Frank Tang <ftang@chromium.org>
+Date: Tue, 13 Apr 2021 15:16:50 -0700
+Subject: [PATCH] ICU-21587 Fix memory bug w/ baseName
+
+Edge cases not fixed in assign and move assign operator
+while the locale is long and call setKeywordValue with incorrect
+keyword/values.
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+[Peter: Fixes CVE-2021-30535, adjust paths for tarball]
+---
+ source/common/locid.cpp          | 11 +++++++++--
+ source/test/intltest/loctest.cpp | 26 ++++++++++++++++++++++++++
+ source/test/intltest/loctest.h   |  2 ++
+ 3 files changed, 37 insertions(+), 2 deletions(-)
+
+diff --git a/source/common/locid.cpp b/source/common/locid.cpp
+index 02cd82a7b8..3c6e5b0669 100644
+--- a/source/common/locid.cpp
++++ b/source/common/locid.cpp
+@@ -469,14 +469,18 @@ Locale& Locale::operator=(Locale&& other) U_NOEXCEPT {
+     if ((baseName != fullName) && (baseName != fullNameBuffer)) uprv_free(baseName);
+     if (fullName != fullNameBuffer) uprv_free(fullName);
+ 
+-    if (other.fullName == other.fullNameBuffer) {
++    if (other.fullName == other.fullNameBuffer || other.baseName == other.fullNameBuffer) {
+         uprv_strcpy(fullNameBuffer, other.fullNameBuffer);
++    }
++    if (other.fullName == other.fullNameBuffer) {
+         fullName = fullNameBuffer;
+     } else {
+         fullName = other.fullName;
+     }
+ 
+-    if (other.baseName == other.fullName) {
++    if (other.baseName == other.fullNameBuffer) {
++        baseName = fullNameBuffer;
++    } else if (other.baseName == other.fullName) {
+         baseName = fullName;
+     } else {
+         baseName = other.baseName;
+@@ -2681,6 +2685,9 @@ Locale::setKeywordValue(const char* keywordName, const char* keywordValue, UErro
+         if (fullName != fullNameBuffer) {
+             // if full Name is already on the heap, need to free it.
+             uprv_free(fullName);
++            if (baseName == fullName) {
++                baseName = newFullName; // baseName should not point to freed memory.
++            }
+         }
+         fullName = newFullName;
+         status = U_ZERO_ERROR;
+diff --git a/source/test/intltest/loctest.cpp b/source/test/intltest/loctest.cpp
+index ce41a4c00e..5503b008b0 100644
+--- a/source/test/intltest/loctest.cpp
++++ b/source/test/intltest/loctest.cpp
+@@ -284,6 +284,8 @@ void LocaleTest::runIndexedTest( int32_t index, UBool exec, const char* &name, c
+     TESTCASE_AUTO(TestSetUnicodeKeywordValueNullInLongLocale);
+     TESTCASE_AUTO(TestCanonicalize);
+     TESTCASE_AUTO(TestLeak21419);
++    TESTCASE_AUTO(TestLongLocaleSetKeywordAssign);
++    TESTCASE_AUTO(TestLongLocaleSetKeywordMoveAssign);
+     TESTCASE_AUTO_END;
+ }
+ 
+@@ -6520,6 +6522,30 @@ void LocaleTest::TestSetUnicodeKeywordValueInLongLocale() {
+     }
+ }
+ 
++void LocaleTest::TestLongLocaleSetKeywordAssign() {
++    IcuTestErrorCode status(*this, "TestLongLocaleSetKeywordAssign");
++    // A long base name, with an illegal keyword and copy constructor
++    icu::Locale l("de_AAAAAAA1_AAAAAAA2_AAAAAAA3_AAAAAAA4_AAAAAAA5_AAAAAAA6_"
++                  "AAAAAAA7_AAAAAAA8_AAAAAAA9_AAAAAA10_AAAAAA11_AAAAAA12_"
++                  "AAAAAA13_AAAAAA14_AAAAAA15_AAAAAA16_AAAAAA17_AAAAAA18");
++    Locale l2;
++    l.setUnicodeKeywordValue("co", "12", status); // Cause an error
++    status.reset();
++    l2 = l; // copy operator on such bogus locale.
++}
++
++void LocaleTest::TestLongLocaleSetKeywordMoveAssign() {
++    IcuTestErrorCode status(*this, "TestLongLocaleSetKeywordMoveAssign");
++    // A long base name, with an illegal keyword and copy constructor
++    icu::Locale l("de_AAAAAAA1_AAAAAAA2_AAAAAAA3_AAAAAAA4_AAAAAAA5_AAAAAAA6_"
++                  "AAAAAAA7_AAAAAAA8_AAAAAAA9_AAAAAA10_AAAAAA11_AAAAAA12_"
++                  "AAAAAA13_AAAAAA14_AAAAAA15_AAAAAA16_AAAAAA17");
++    Locale l2;
++    l.setUnicodeKeywordValue("co", "12", status); // Cause an error
++    status.reset();
++    Locale l3 = std::move(l); // move assign
++}
++
+ void LocaleTest::TestSetUnicodeKeywordValueNullInLongLocale() {
+     IcuTestErrorCode status(*this, "TestSetUnicodeKeywordValueNullInLongLocale");
+     const char *exts[] = {"cf", "cu", "em", "kk", "kr", "ks", "kv", "lb", "lw",
+diff --git a/source/test/intltest/loctest.h b/source/test/intltest/loctest.h
+index 05be4037bd..12a93bde53 100644
+--- a/source/test/intltest/loctest.h
++++ b/source/test/intltest/loctest.h
+@@ -156,6 +156,8 @@ class LocaleTest: public IntlTest {
+     void TestSetUnicodeKeywordValueInLongLocale();
+     void TestSetUnicodeKeywordValueNullInLongLocale();
+     void TestLeak21419();
++    void TestLongLocaleSetKeywordAssign();
++    void TestLongLocaleSetKeywordMoveAssign();
+ 
+ private:
+     void _checklocs(const char* label,
+-- 
+2.20.1
+
diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index 0a17c61462..2c04c3c775 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -17,6 +17,9 @@ ICU_CPE_ID_VENDOR = icu-project
 ICU_CPE_ID_PRODUCT = international_components_for_unicode
 ICU_CPE_ID_VERSION = $(subst -,.,$(ICU_VERSION))
 
+# 0005-ICU-21587-Fix-memory-bug-w-baseName.patch
+ICU_IGNORE_CVES += CVE-2021-30535
+
 ICU_DEPENDENCIES = host-icu
 ICU_INSTALL_STAGING = YES
 ICU_CONFIG_SCRIPTS = icu-config
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
