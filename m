Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB4F4C43458
	for <buildroot@archiver.kernel.org>; Thu,  9 Jul 2026 09:19:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91F3260ECA;
	Thu,  9 Jul 2026 09:19:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V-ZlIsaCoCw3; Thu,  9 Jul 2026 09:19:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 50C0B60EC4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783588785;
	bh=XHjh0Ywiw9AsgQNixrWVScP20lKN9ILYwkiP00AveN4=;
	h=Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=fQAlb8SEG1YdMgM0GIW/uUjZYRMWue58usY3quhglaZmLVorXkqXGx2dTr/V3NFPo
	 xfxfRDMW5xpARWr2HtU9f81cxgzoo+ABZkTBCzSOqsT2sRw+xZAESnHEhSZdpLGQTJ
	 XF4ylLFMkByaD5veVm86ieg+/8vV4H7sLCDGGeE8eazJ+urewD6ffycORIXxspg+04
	 ccsDAhg+fP0Crm7rvUXEXE7Cz1eENDFaScgX1wuD79sZcoYMcIZJEnRkHQHuo8J5rj
	 MBadjUY4+PM5iRpefHJvX+cqLQAGnvJAlz8HH4UfbNxU47+l0AYBviWIGm5QzhcBMQ
	 RzH2S9vbggt/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50C0B60EC4;
	Thu,  9 Jul 2026 09:19:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3777B320
 for <buildroot@buildroot.org>; Thu,  9 Jul 2026 09:19:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1580340D76
 for <buildroot@buildroot.org>; Thu,  9 Jul 2026 09:19:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yycv2YG04UFN for <buildroot@buildroot.org>;
 Thu,  9 Jul 2026 09:19:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:1600:19:38e0::8faa; helo=smtp-8faa.mail.infomaniak.ch;
 envelope-from=foss+buildroot@0leil.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3FC3E40D77
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FC3E40D77
Received: from smtp-8faa.mail.infomaniak.ch (smtp-8faa.mail.infomaniak.ch
 [IPv6:2001:1600:19:38e0::8faa])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3FC3E40D77
 for <buildroot@buildroot.org>; Thu,  9 Jul 2026 09:19:42 +0000 (UTC)
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch
 [10.4.36.108])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4gwqD80n01zFDm;
 Thu,  9 Jul 2026 11:19:36 +0200 (CEST)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4gwqD73pvxzSy6; Thu,  9 Jul 2026 11:19:35 +0200 (CEST)
Date: Thu, 09 Jul 2026 11:19:21 +0200
MIME-Version: 1.0
Message-Id: <20260709-icu-cve-2025-5222-v1-1-6f05ee855fcd@cherry.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQ6CQBAEv0Lm7JDZ0ZXoV4wHWBoYD2B2hZAQ/
 u6ix+pO1UYJ0ZDoXmwUsViyaczgTgWFoR57sLWZSUWvUsmNLcwcFnAePHtVZbizuObSQrqasve
 O6Gz9NR+H50vRcqXn/0pz80L4HE3a9y8S9YsJgAAAAA==
X-Change-ID: 20260709-icu-cve-2025-5222-e1301b4de0fa
To: buildroot@buildroot.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.16-dev
X-Infomaniak-Routing: alpha
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=0leil.net; s=20231125; t=1783588775;
 bh=l4bgbZKMcchuVVSZFEKdnQEUVWNhOU1e2OLZL2yRvGw=;
 h=From:Date:Subject:To:Cc:From;
 b=e7gKFd9bwwM3brPME89+Yc0EzqBfqDEAhMe53xw23ZUo7Ge6qjAekOE8Ov3I8Bf41
 zH6Fri6GQ35a1FIzc3iG8vcmX+DOrsXm0kmiZd5l9hn04T7n6nljdSWxYXcCSzUxkq
 IAmiXOFhV2jJdIz21OpyvkSsm913gF2aIV+mIfvYgwyFzFz6aZuoKkycuNVhlV2icg
 x19h7qAyRNxu0+UYwgnHjx65tARYpm8qzoMtnvJiptIAKiSzivyAiGg8n0TMQuEQcY
 ZBa2qNTl/+sN7EYfQMwBrOInz8LCJyDvoerGWZuBFZfhgWNpJ5MZJlrVAazGHamMFL
 b4otL+gd/XtNQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=0leil.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=0leil.net header.i=@0leil.net header.a=rsa-sha256
 header.s=20231125 header.b=e7gKFd9b
Subject: [Buildroot] [PATCH 2025.02.x] package/icu: backport upstream
 security fix for CVE-2025-5222
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
From: Quentin Schulz via buildroot <buildroot@buildroot.org>
Reply-To: Quentin Schulz <foss+buildroot@0leil.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Quentin Schulz <quentin.schulz@cherry.de>

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
---
2026.05.x and master already have migrated to 78.2 which contain the fix
(available since 77-1) hence why this is directed to 2025.02.x only.
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

---
base-commit: 0f2bd03f9aaf1d53f09920a3cd8a4886ee5f8e50
change-id: 20260709-icu-cve-2025-5222-e1301b4de0fa

Best regards,
--  
Quentin Schulz <quentin.schulz@cherry.de>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
