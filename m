Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 124B8C43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:51:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB1F680A67;
	Fri, 10 Jul 2026 13:51:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qWxRKy8mGd7j; Fri, 10 Jul 2026 13:51:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ABD9280A79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783691494;
	bh=ZPiqJ/5TScAWs2i5otN/LUwto8dseR4hwIhpeNtEBDM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pQzdfAZVqnuR5QBqe2ukYqkX3EqOh3oqa735ww0tQtm9s2SBJjcky0+Rg+86G3cce
	 O1hkK1U0kXA05eF3zwq9GL8yK0URD8/zqIajj29iaut2RVPH+tS789dNO29h0ENiua
	 PCogA6JzWKyFSy++XIcZ7MjXF0ThWfc76Fh2Sa+D77WtuWza5VCSKqLf207ACt3axE
	 HrhaFKbuTjzV7iE0pXl6IaTQY1mOHCzkX9IpBuVo7dQdZ2dMf1EKNsyvebfFbxIpwj
	 zYJImj84cRpv8r7XWBxjA0ALWdVK2bcUjYgCxvrMx1otcPD4sYOSxggrguQPDKvJTA
	 GOG5/gNoO6wOQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ABD9280A79;
	Fri, 10 Jul 2026 13:51:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9FB58A3C
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:51:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B75E40B2F
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:51:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 07OrBUS1xdiM for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:51:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D676040ACD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D676040ACD
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D676040ACD
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:51:30 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-47de0093c42so901913f8f.3
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 06:51:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783691489; x=1784296289;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=3onyemiwiqQp4YaP55e5QOjKQ3LN9mGDHucfeWyJJDw=;
 b=BvS5oEn2tgxPIM8z9j9sKmcE43y6z+sRSo5ycP+kNQ56h9dXw0Uabt7V3yseif4cwK
 Oveu6wARVft4yOl8bfpytSit4iwtuMS0Zes8uOAyVUJ4noOBYVtnSeGC3Zj8sFse4x0n
 cD7SrrS3yfzbcFjIorsp5Ui8AJz28F97Sc/wpa3ML9EzwxcAT5MZeCnM0IRY09QP1KxZ
 J9qh4rSvss0DzqoRMRTQwXfOz69QalhHdfw1avlO+nvy69pKVH2G3XF37mnhOy6xIB8S
 9ilh69JFCJI+98FLC8zwDtjovCqpwYi4bM74Mqc7so9ScR9h+GnBk1qbAiU158vKCKk5
 l+VA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rpgw4kCnCWghXM3p0xGW3Df18hIH1OvNPfAgV1OZQocpUx3k5Dt4GCQy1/tNGDEm5IXdgOp3KsVss0=@buildroot.org
X-Gm-Message-State: AOJu0YxaAfSd9NN310nhPoGcNJBSgYCPvF4AORi+6j3s88fRthdZ3E4I
 qxCovU57iyhOGBAjGQDwMZ130yayEIfsos8spfQChQN0Q4X8Ep6BKfkOG0c0gE7vE7o=
X-Gm-Gg: AfdE7ckDDOlFv+1aFVqRUQCi8wkQ/nv96JJ3mgrz7GtxDlo1tYvOGFNMMHxvpUjZDA6
 NckYtnu3uIPtk1X6A8XbtC0reuyrbzVX5Z/XNIgj0/m/cTftmiE9LhkMsyHli1fmwyPb/Q8jPJZ
 +AG0u2r6T1jHjYZ1C3ABCtPy3W87als7FrE/D0Y9SrTnC5VcXFfVlQ+9+oWVwuUq2TctGIuauVF
 oJ7X3pr8etv3rPO2GBvY9sv6eDL4zuhA92wMWYXPMstao4v+qk/vo5Ukwg2seFwYnKrzqLpzlqE
 zsU/y4N3ZIrP87jG7VzdvCB715q6DO/fFpOu140Eh8U0xNWgr19DioXJa6RkuxKqJqehGrvD66y
 eDXAkm5ft1+44G8wo876f91HpanN2X+T8uo3GP3kx6PE1147PI1RbcHSypd9Q/Jlx+oDTxR583H
 /u+BbVLA==
X-Received: by 2002:a5d:5e91:0:b0:475:f0d1:eb59 with SMTP id
 ffacd0b85a97d-47df07b5eb1mr13708316f8f.52.1783691488661; 
 Fri, 10 Jul 2026 06:51:28 -0700 (PDT)
Received: from arch ([212.233.37.141]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47a9e4d6da9sm59641872f8f.12.2026.07.10.06.51.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 06:51:28 -0700 (PDT)
To: Quentin Schulz <foss+buildroot@0leil.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 10 Jul 2026 15:51:27 +0200
Message-ID: <20260710135127.759044-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260709-icu-cve-2025-5222-v1-1-6f05ee855fcd@cherry.de>
References: <20260709-icu-cve-2025-5222-v1-1-6f05ee855fcd@cherry.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1783691489; x=1784296289; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=3onyemiwiqQp4YaP55e5QOjKQ3LN9mGDHucfeWyJJDw=;
 b=henUeNk1+F6hfHCCTCBpO4SeT5JEY2fWuIjixqmAGKD227V7dhdPTcY30vCXyNGOA0
 03M/m0PasAAxtJt9VgkUxlkAitIMFwTi8Wa3xbrrSZoN+wzwbw4TD8593D7yx7M3m8Kz
 mtfHd7I2DWw6CwupAmOSDpXpvl/89i+9sLLESjyrd0iSJ0EiqN5p+GQM7KDTH24V3kVo
 doJ6xvzGHMGs6bh93o4/vInTRsEeUXVB4e9q7I7HbFJDs9Lx/XQZZpTd7QbQh3enP55o
 g7wojqhfKCnSCy06vZliL7L7FARlp9lPUZzZ3HM2hES/p/kkIWSlMKhkOpukWopQc5tQ
 w0jg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=henUeNk1
Subject: Re: [Buildroot] [PATCH 2025.02.x] package/icu: backport upstream
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Fixes CVE-2025-5222[1]. The patch is generated with
> git format-patch -1 2c667e31cfd0b6bb1923627a932fd3453a5bac77 --relative=icu4c
> and matches the Debian patch[2] aside from s/NULL/nullptr/ in the git
> context. This is expected as the Debian patch is based on 72-1 and we
> are on 73-2, so we have commit 2e0d30cfcf43 ("ICU-21833 Replace NULL
> with nullptr in all C++ code.")
> 
> While NVD[1] and Debian[3] list ICU-22957 in their bug reports, looking
> at the icu bug report[4] one can see it's marked as a duplicate of
> ICU-22973[5] which also happens to be the bug ID specified in the commit
> log of the commit listed in the Debian advisory[3].
> 
> [1] https://nvd.nist.gov/vuln/detail/CVE-2025-5222
> [2] https://sources.debian.org/src/icu/72.1-3%2Bdeb12u1/debian/patches/0001-ICU-22973-Fix-buffer-overflow-by-using-CharString.patch
> [3] https://security-tracker.debian.org/tracker/CVE-2025-5222
> [4] https://unicode-org.atlassian.net/browse/ICU-22957
> [5] https://unicode-org.atlassian.net/browse/ICU-22973
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>

Applied to 2025.02.x. Thanks

> ---
> 2026.05.x and master already have migrated to 78.2 which contain the fix
> (available since 77-1) hence why this is directed to 2025.02.x only.
> ---
>  ...3-Fix-buffer-overflow-by-using-CharString.patch | 162 +++++++++++++++++++++
>  package/icu/icu.mk                                 |   3 +
>  2 files changed, 165 insertions(+)
> 
> diff --git a/package/icu/0005-ICU-22973-Fix-buffer-overflow-by-using-CharString.patch b/package/icu/0005-ICU-22973-Fix-buffer-overflow-by-using-CharString.patch
> new file mode 100644
> index 0000000000..3068ab7f98
> --- /dev/null
> +++ b/package/icu/0005-ICU-22973-Fix-buffer-overflow-by-using-CharString.patch
> @@ -0,0 +1,162 @@
> +From 2c667e31cfd0b6bb1923627a932fd3453a5bac77 Mon Sep 17 00:00:00 2001
> +From: Frank Tang <ftang@chromium.org>
> +Date: Wed, 22 Jan 2025 11:50:59 -0800
> +Subject: [PATCH] ICU-22973 Fix buffer overflow by using CharString
> +
> +Upstream: https://github.com/unicode-org/icu/commit/2c667e31cfd0b6bb1923627a932fd3453a5bac77
> +CVE: CVE-2025-5222
> +Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> +---
> + source/tools/genrb/parse.cpp | 49 +++++++++++++++++++++---------------
> + 1 file changed, 29 insertions(+), 20 deletions(-)
> +
> +diff --git a/source/tools/genrb/parse.cpp b/source/tools/genrb/parse.cpp
> +index f487241cc18..eb85d5157a6 100644
> +--- a/source/tools/genrb/parse.cpp
> ++++ b/source/tools/genrb/parse.cpp
> +@@ -1153,7 +1153,7 @@ addCollation(ParseState* state, TableResource  *result, const char *collationTyp
> +     struct UString    *tokenValue;
> +     struct UString     comment;
> +     enum   ETokenType  token;
> +-    char               subtag[1024];
> ++    CharString         subtag;
> +     UnicodeString      rules;
> +     UBool              haveRules = false;
> +     UVersionInfo       version;
> +@@ -1189,15 +1189,15 @@ addCollation(ParseState* state, TableResource  *result, const char *collationTyp
> +             return nullptr;
> +         }
> + 
> +-        u_UCharsToChars(tokenValue->fChars, subtag, u_strlen(tokenValue->fChars) + 1);
> +-
> ++        subtag.clear();
> ++        subtag.appendInvariantChars(tokenValue->fChars, u_strlen(tokenValue->fChars), *status);
> +         if (U_FAILURE(*status))
> +         {
> +             res_close(result);
> +             return nullptr;
> +         }
> + 
> +-        member = parseResource(state, subtag, nullptr, status);
> ++        member = parseResource(state, subtag.data(), nullptr, status);
> + 
> +         if (U_FAILURE(*status))
> +         {
> +@@ -1208,7 +1208,7 @@ addCollation(ParseState* state, TableResource  *result, const char *collationTyp
> +         {
> +             // Ignore the parsed resources, continue parsing.
> +         }
> +-        else if (uprv_strcmp(subtag, "Version") == 0 && member->isString())
> ++        else if (uprv_strcmp(subtag.data(), "Version") == 0 && member->isString())
> +         {
> +             StringResource *sr = static_cast<StringResource *>(member);
> +             char     ver[40];
> +@@ -1225,11 +1225,11 @@ addCollation(ParseState* state, TableResource  *result, const char *collationTyp
> +             result->add(member, line, *status);
> +             member = nullptr;
> +         }
> +-        else if(uprv_strcmp(subtag, "%%CollationBin")==0)
> ++        else if(uprv_strcmp(subtag.data(), "%%CollationBin")==0)
> +         {
> +             /* discard duplicate %%CollationBin if any*/
> +         }
> +-        else if (uprv_strcmp(subtag, "Sequence") == 0 && member->isString())
> ++        else if (uprv_strcmp(subtag.data(), "Sequence") == 0 && member->isString())
> +         {
> +             StringResource *sr = static_cast<StringResource *>(member);
> +             rules = sr->fString;
> +@@ -1395,7 +1395,7 @@ parseCollationElements(ParseState* state, char *tag, uint32_t startline, UBool n
> +     struct UString    *tokenValue;
> +     struct UString     comment;
> +     enum   ETokenType  token;
> +-    char               subtag[1024], typeKeyword[1024];
> ++    CharString         subtag, typeKeyword;
> +     uint32_t           line;
> + 
> +     result = table_open(state->bundle, tag, nullptr, status);
> +@@ -1437,7 +1437,8 @@ parseCollationElements(ParseState* state, char *tag, uint32_t startline, UBool n
> +                 return nullptr;
> +             }
> + 
> +-            u_UCharsToChars(tokenValue->fChars, subtag, u_strlen(tokenValue->fChars) + 1);
> ++            subtag.clear();
> ++            subtag.appendInvariantChars(tokenValue->fChars, u_strlen(tokenValue->fChars), *status);
> + 
> +             if (U_FAILURE(*status))
> +             {
> +@@ -1445,9 +1446,9 @@ parseCollationElements(ParseState* state, char *tag, uint32_t startline, UBool n
> +                 return nullptr;
> +             }
> + 
> +-            if (uprv_strcmp(subtag, "default") == 0)
> ++            if (uprv_strcmp(subtag.data(), "default") == 0)
> +             {
> +-                member = parseResource(state, subtag, nullptr, status);
> ++                member = parseResource(state, subtag.data(), nullptr, status);
> + 
> +                 if (U_FAILURE(*status))
> +                 {
> +@@ -1466,22 +1467,29 @@ parseCollationElements(ParseState* state, char *tag, uint32_t startline, UBool n
> +                 if(token == TOK_OPEN_BRACE) {
> +                     token = getToken(state, &tokenValue, &comment, &line, status);
> +                     TableResource *collationRes;
> +-                    if (keepCollationType(subtag)) {
> +-                        collationRes = table_open(state->bundle, subtag, nullptr, status);
> ++                    if (keepCollationType(subtag.data())) {
> ++                        collationRes = table_open(state->bundle, subtag.data(), nullptr, status);
> +                     } else {
> +                         collationRes = nullptr;
> +                     }
> +                     // need to parse the collation data regardless
> +-                    collationRes = addCollation(state, collationRes, subtag, startline, status);
> ++                    collationRes = addCollation(state, collationRes, subtag.data(), startline, status);
> +                     if (collationRes != nullptr) {
> +                         result->add(collationRes, startline, *status);
> +                     }
> +                 } else if(token == TOK_COLON) { /* right now, we'll just try to see if we have aliases */
> +                     /* we could have a table too */
> +                     token = peekToken(state, 1, &tokenValue, &line, &comment, status);
> +-                    u_UCharsToChars(tokenValue->fChars, typeKeyword, u_strlen(tokenValue->fChars) + 1);
> +-                    if(uprv_strcmp(typeKeyword, "alias") == 0) {
> +-                        member = parseResource(state, subtag, nullptr, status);
> ++                    typeKeyword.clear();
> ++                    typeKeyword.appendInvariantChars(tokenValue->fChars, u_strlen(tokenValue->fChars), *status);
> ++                    if (U_FAILURE(*status))
> ++                    {
> ++                        res_close(result);
> ++                        return nullptr;
> ++                    }
> ++
> ++                    if(uprv_strcmp(typeKeyword.data(), "alias") == 0) {
> ++                        member = parseResource(state, subtag.data(), nullptr, status);
> +                         if (U_FAILURE(*status))
> +                         {
> +                             res_close(result);
> +@@ -1523,7 +1531,7 @@ realParseTable(ParseState* state, TableResource *table, char *tag, uint32_t star
> +     struct UString    *tokenValue=nullptr;
> +     struct UString    comment;
> +     enum   ETokenType token;
> +-    char              subtag[1024];
> ++    CharString        subtag;
> +     uint32_t          line;
> +     UBool             readToken = false;
> + 
> +@@ -1562,7 +1570,8 @@ realParseTable(ParseState* state, TableResource *table, char *tag, uint32_t star
> +         }
> + 
> +         if(uprv_isInvariantUString(tokenValue->fChars, -1)) {
> +-            u_UCharsToChars(tokenValue->fChars, subtag, u_strlen(tokenValue->fChars) + 1);
> ++            subtag.clear();
> ++            subtag.appendInvariantChars(tokenValue->fChars, u_strlen(tokenValue->fChars), *status);
> +         } else {
> +             *status = U_INVALID_FORMAT_ERROR;
> +             error(line, "invariant characters required for table keys");
> +@@ -1575,7 +1584,7 @@ realParseTable(ParseState* state, TableResource *table, char *tag, uint32_t star
> +             return nullptr;
> +         }
> + 
> +-        member = parseResource(state, subtag, &comment, status);
> ++        member = parseResource(state, subtag.data(), &comment, status);
> + 
> +         if (member == nullptr || U_FAILURE(*status))
> +         {
> diff --git a/package/icu/icu.mk b/package/icu/icu.mk
> index e0dffd543c..afc0693b7f 100644
> --- a/package/icu/icu.mk
> +++ b/package/icu/icu.mk
> @@ -17,6 +17,9 @@ ICU_CPE_ID_VENDOR = unicode
>  ICU_CPE_ID_PRODUCT = international_components_for_unicode
>  ICU_CPE_ID_VERSION = $(subst -,.,$(ICU_VERSION))
>  
> +# 0005-ICU-22973-Fix-buffer-overflow-by-using-CharString.patch
> +ICU_IGNORE_CVES += CVE-2025-5222
> +
>  ICU_DEPENDENCIES = host-icu
>  ICU_INSTALL_STAGING = YES
>  ICU_CONFIG_SCRIPTS = icu-config
> 
> ---
> base-commit: 0f2bd03f9aaf1d53f09920a3cd8a4886ee5f8e50
> change-id: 20260709-icu-cve-2025-5222-e1301b4de0fa
> 
> Best regards,
> --  
> Quentin Schulz <quentin.schulz@cherry.de>
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
