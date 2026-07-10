Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5384AC44506
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:43:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E69DA40A59;
	Fri, 10 Jul 2026 13:43:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F3djq-bl_8ce; Fri, 10 Jul 2026 13:43:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 737FC409FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783691007;
	bh=VmTKBJ+GuIMjD2k07qc34PHxxxR/Yv3Zh/qOG9oihTI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GFvpgkXm9uTg5HPeGpKUWgTSpftyJVMcoD3RtFYmtepgcEUP6hNTJbXa0IJXh20ok
	 ry7gYRgVtkwK4NJwjyeXIIS6+GbagXzHXV587L2CVn+Wncohy7viaznQA3TqeuJCmf
	 tpkBdbR+woEdHnW/BdlYADlMe/ps7TVD4W3bJcxUWTyV3WICmq7NaX0D34iRaJ9div
	 J07vQ7GvqcAjgBUy10PIeBD1d2WovKOCKp9peIy/ueiCd5SdxmwAe6RIzhg6o5Y0Yq
	 22NngkPTy/b/UKbaV7BX3+x+msP/OlV+/MiwAmD8D6ijjwtfXUxmMZqmPLNcX7tz83
	 iq4DCONmW/fLg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 737FC409FF;
	Fri, 10 Jul 2026 13:43:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 54245FD1
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:42:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 51E7B400D1
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:42:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BtOCkRaHs0Ka for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:42:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3273340120
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3273340120
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:42:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5B89A8868A; Fri, 10 Jul 2026 13:42:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Jul 2026 11:41:58 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 9e52961485534e92e407e3305a5df20fead02f6c
X-Git-Newrev: ff80cc77b16055420e4569e0b5fbc7a72fb42f72
X-Patchwork-Hint: ignore
Message-Id: <20260710134218.5B89A8868A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/icu: backport
 upstream security fix for CVE-2025-5222
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ff80cc77b16055420e4569e0b5fbc7a72fb42f72
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Fixes CVE-2025-5222[1]. The patch is generated with
git format-patch -1 2c667e31cfd0b6bb1923627a932fd3453a5bac77 --relative=icu4c
and matches the Debian patch[2] aside from s/NULL/nullptr/ in the git
context. This is expected as the Debian patch is based on 72-1 and we
are on 73-2, so we have commit 2e0d30cfcf43 ("ICU-21833 Replace NULL
with nullptr in all C++ code.")

While NVD[1] and Debian[3] list ICU-22957 in their bug reports, looking
at the icu bug report[4] one can see it's marked as a duplicate of
ICU-22973[5] which also happens to be the bug ID specified in the commit
log of the commit listed in the Debian advisory[3].

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-5222
[2] https://sources.debian.org/src/icu/72.1-3%2Bdeb12u1/debian/patches/0001-ICU-22973-Fix-buffer-overflow-by-using-CharString.patch
[3] https://security-tracker.debian.org/tracker/CVE-2025-5222
[4] https://unicode-org.atlassian.net/browse/ICU-22957
[5] https://unicode-org.atlassian.net/browse/ICU-22973

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...3-Fix-buffer-overflow-by-using-CharString.patch | 162 +++++++++++++++++++++
 package/icu/icu.mk                                 |   3 +
 2 files changed, 165 insertions(+)

diff --git a/package/icu/0005-ICU-22973-Fix-buffer-overflow-by-using-CharString.patch b/package/icu/0005-ICU-22973-Fix-buffer-overflow-by-using-CharString.patch
new file mode 100644
index 0000000000..3068ab7f98
--- /dev/null
+++ b/package/icu/0005-ICU-22973-Fix-buffer-overflow-by-using-CharString.patch
@@ -0,0 +1,162 @@
+From 2c667e31cfd0b6bb1923627a932fd3453a5bac77 Mon Sep 17 00:00:00 2001
+From: Frank Tang <ftang@chromium.org>
+Date: Wed, 22 Jan 2025 11:50:59 -0800
+Subject: [PATCH] ICU-22973 Fix buffer overflow by using CharString
+
+Upstream: https://github.com/unicode-org/icu/commit/2c667e31cfd0b6bb1923627a932fd3453a5bac77
+CVE: CVE-2025-5222
+Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
+---
+ source/tools/genrb/parse.cpp | 49 +++++++++++++++++++++---------------
+ 1 file changed, 29 insertions(+), 20 deletions(-)
+
+diff --git a/source/tools/genrb/parse.cpp b/source/tools/genrb/parse.cpp
+index f487241cc18..eb85d5157a6 100644
+--- a/source/tools/genrb/parse.cpp
++++ b/source/tools/genrb/parse.cpp
+@@ -1153,7 +1153,7 @@ addCollation(ParseState* state, TableResource  *result, const char *collationTyp
+     struct UString    *tokenValue;
+     struct UString     comment;
+     enum   ETokenType  token;
+-    char               subtag[1024];
++    CharString         subtag;
+     UnicodeString      rules;
+     UBool              haveRules = false;
+     UVersionInfo       version;
+@@ -1189,15 +1189,15 @@ addCollation(ParseState* state, TableResource  *result, const char *collationTyp
+             return nullptr;
+         }
+ 
+-        u_UCharsToChars(tokenValue->fChars, subtag, u_strlen(tokenValue->fChars) + 1);
+-
++        subtag.clear();
++        subtag.appendInvariantChars(tokenValue->fChars, u_strlen(tokenValue->fChars), *status);
+         if (U_FAILURE(*status))
+         {
+             res_close(result);
+             return nullptr;
+         }
+ 
+-        member = parseResource(state, subtag, nullptr, status);
++        member = parseResource(state, subtag.data(), nullptr, status);
+ 
+         if (U_FAILURE(*status))
+         {
+@@ -1208,7 +1208,7 @@ addCollation(ParseState* state, TableResource  *result, const char *collationTyp
+         {
+             // Ignore the parsed resources, continue parsing.
+         }
+-        else if (uprv_strcmp(subtag, "Version") == 0 && member->isString())
++        else if (uprv_strcmp(subtag.data(), "Version") == 0 && member->isString())
+         {
+             StringResource *sr = static_cast<StringResource *>(member);
+             char     ver[40];
+@@ -1225,11 +1225,11 @@ addCollation(ParseState* state, TableResource  *result, const char *collationTyp
+             result->add(member, line, *status);
+             member = nullptr;
+         }
+-        else if(uprv_strcmp(subtag, "%%CollationBin")==0)
++        else if(uprv_strcmp(subtag.data(), "%%CollationBin")==0)
+         {
+             /* discard duplicate %%CollationBin if any*/
+         }
+-        else if (uprv_strcmp(subtag, "Sequence") == 0 && member->isString())
++        else if (uprv_strcmp(subtag.data(), "Sequence") == 0 && member->isString())
+         {
+             StringResource *sr = static_cast<StringResource *>(member);
+             rules = sr->fString;
+@@ -1395,7 +1395,7 @@ parseCollationElements(ParseState* state, char *tag, uint32_t startline, UBool n
+     struct UString    *tokenValue;
+     struct UString     comment;
+     enum   ETokenType  token;
+-    char               subtag[1024], typeKeyword[1024];
++    CharString         subtag, typeKeyword;
+     uint32_t           line;
+ 
+     result = table_open(state->bundle, tag, nullptr, status);
+@@ -1437,7 +1437,8 @@ parseCollationElements(ParseState* state, char *tag, uint32_t startline, UBool n
+                 return nullptr;
+             }
+ 
+-            u_UCharsToChars(tokenValue->fChars, subtag, u_strlen(tokenValue->fChars) + 1);
++            subtag.clear();
++            subtag.appendInvariantChars(tokenValue->fChars, u_strlen(tokenValue->fChars), *status);
+ 
+             if (U_FAILURE(*status))
+             {
+@@ -1445,9 +1446,9 @@ parseCollationElements(ParseState* state, char *tag, uint32_t startline, UBool n
+                 return nullptr;
+             }
+ 
+-            if (uprv_strcmp(subtag, "default") == 0)
++            if (uprv_strcmp(subtag.data(), "default") == 0)
+             {
+-                member = parseResource(state, subtag, nullptr, status);
++                member = parseResource(state, subtag.data(), nullptr, status);
+ 
+                 if (U_FAILURE(*status))
+                 {
+@@ -1466,22 +1467,29 @@ parseCollationElements(ParseState* state, char *tag, uint32_t startline, UBool n
+                 if(token == TOK_OPEN_BRACE) {
+                     token = getToken(state, &tokenValue, &comment, &line, status);
+                     TableResource *collationRes;
+-                    if (keepCollationType(subtag)) {
+-                        collationRes = table_open(state->bundle, subtag, nullptr, status);
++                    if (keepCollationType(subtag.data())) {
++                        collationRes = table_open(state->bundle, subtag.data(), nullptr, status);
+                     } else {
+                         collationRes = nullptr;
+                     }
+                     // need to parse the collation data regardless
+-                    collationRes = addCollation(state, collationRes, subtag, startline, status);
++                    collationRes = addCollation(state, collationRes, subtag.data(), startline, status);
+                     if (collationRes != nullptr) {
+                         result->add(collationRes, startline, *status);
+                     }
+                 } else if(token == TOK_COLON) { /* right now, we'll just try to see if we have aliases */
+                     /* we could have a table too */
+                     token = peekToken(state, 1, &tokenValue, &line, &comment, status);
+-                    u_UCharsToChars(tokenValue->fChars, typeKeyword, u_strlen(tokenValue->fChars) + 1);
+-                    if(uprv_strcmp(typeKeyword, "alias") == 0) {
+-                        member = parseResource(state, subtag, nullptr, status);
++                    typeKeyword.clear();
++                    typeKeyword.appendInvariantChars(tokenValue->fChars, u_strlen(tokenValue->fChars), *status);
++                    if (U_FAILURE(*status))
++                    {
++                        res_close(result);
++                        return nullptr;
++                    }
++
++                    if(uprv_strcmp(typeKeyword.data(), "alias") == 0) {
++                        member = parseResource(state, subtag.data(), nullptr, status);
+                         if (U_FAILURE(*status))
+                         {
+                             res_close(result);
+@@ -1523,7 +1531,7 @@ realParseTable(ParseState* state, TableResource *table, char *tag, uint32_t star
+     struct UString    *tokenValue=nullptr;
+     struct UString    comment;
+     enum   ETokenType token;
+-    char              subtag[1024];
++    CharString        subtag;
+     uint32_t          line;
+     UBool             readToken = false;
+ 
+@@ -1562,7 +1570,8 @@ realParseTable(ParseState* state, TableResource *table, char *tag, uint32_t star
+         }
+ 
+         if(uprv_isInvariantUString(tokenValue->fChars, -1)) {
+-            u_UCharsToChars(tokenValue->fChars, subtag, u_strlen(tokenValue->fChars) + 1);
++            subtag.clear();
++            subtag.appendInvariantChars(tokenValue->fChars, u_strlen(tokenValue->fChars), *status);
+         } else {
+             *status = U_INVALID_FORMAT_ERROR;
+             error(line, "invariant characters required for table keys");
+@@ -1575,7 +1584,7 @@ realParseTable(ParseState* state, TableResource *table, char *tag, uint32_t star
+             return nullptr;
+         }
+ 
+-        member = parseResource(state, subtag, &comment, status);
++        member = parseResource(state, subtag.data(), &comment, status);
+ 
+         if (member == nullptr || U_FAILURE(*status))
+         {
diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index e0dffd543c..afc0693b7f 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -17,6 +17,9 @@ ICU_CPE_ID_VENDOR = unicode
 ICU_CPE_ID_PRODUCT = international_components_for_unicode
 ICU_CPE_ID_VERSION = $(subst -,.,$(ICU_VERSION))
 
+# 0005-ICU-22973-Fix-buffer-overflow-by-using-CharString.patch
+ICU_IGNORE_CVES += CVE-2025-5222
+
 ICU_DEPENDENCIES = host-icu
 ICU_INSTALL_STAGING = YES
 ICU_CONFIG_SCRIPTS = icu-config
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
