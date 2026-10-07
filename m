Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB3C9CA6004
	for <buildroot@archiver.kernel.org>; Wed,  7 Oct 2026 06:05:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61F0540723;
	Wed,  7 Oct 2026 06:05:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q5ARZ6M0vYnH; Wed,  7 Oct 2026 06:05:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 84CBB40721
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791353123;
	b=R5kDHawalaupaEfzFCLUQaFB7vyXZqcxyS/4uo281rQEoDPGzZMetPPaJxcZvsXEQMAB
	 nSCTjKPSEPguTx8ep8Ro4O87HjNFCGzO5YhwFUX6Fn+cif+HyQONiDUvnh1yVuV5wYNu1
	 f499snL2ZMJphF5ZnuMxUdkjDVtP05cCJa96Ku6e9+gTXiiASXENxaATZVUZEhx216eOr
	 fti+EO6JKpxAUa3xNCR0bYZJ4LbFUvzcyT+kylpBMys3AMJdIatWpYJZVRO2SQKlosQGw
	 sLhc+Chyhob45vQvw1aVtGt25s2lsuZz2ozBVt2aOW9yvTuI6FogGlSIR3hHhtonm5g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791353123;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:From:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=YytXQSlnKn/vJMT4phSS9wrrP9aJx/mApkO88Z9Zt3I=;
	b=YQRHQ22lvtAx5g9G+o+530QW4oBRwiVyeM/EgAEPRJWmLPwVGxcXTZOkqLZKJ+Z/xSV2
	 pGN7TdMqBS8+alC/R5Ge9XRgd39s14tcY+iUJj/kICEiq0oX1su9eaQ0bgs9eTi/wqPpR
	 dm+RUxLcs1gLTwGfPGPZ2k8PBfhobyeQ4ECJKMmaRW+MK6MuMYNAYfbruiukZpS9fFy6Q
	 JdzvJEsEEzjcx2xV1tzmPL7b5id0N+u3rmlGe9duqeLB4sVua9EwgdQo041QG1Df57R5R
	 qLaGBK05CMgKo8Maho2Zhe2e97+KFAg96bgaQj643s+Dz8dbZvwj9mJAiFI88VriqyA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791353123;
	bh=YytXQSlnKn/vJMT4phSS9wrrP9aJx/mApkO88Z9Zt3I=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=m/tQvHYdW6qvG0fDRETJecIfJ1lAj2A/g6OYAMV65Pegv9o1SwgVBjW1Br4/G7eUs
	 y3s9VKNmNSP5H/2fC8smcDYJ4xT5AHN4xqnKEr0JJcWhyetg1ZsDnjmIzBqOuktHV3
	 F0b97pHx5t/nVhCFkOF/FQvAIxmDi6NwNOUT/oY9d0Bgh6iDy7N+jtmlTQMu9wuTiU
	 doKlEoMoEyHhxi7+jU6RoW9nB2NtfVY8yl79duw2PZSezibINFd9yHH4l0rEf9uzBd
	 cv+SGiheYmC06ABwsJ3g9rdtP1TDmsPGuV7OxmyCgagEHP65XB3iQkbsREoE9OIZu+
	 n5Ef8s8boujIA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84CBB40721;
	Wed,  7 Oct 2026 06:05:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A94532F
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 05:50:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C77E40204
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 05:50:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KgiYMJY900Tr for <buildroot@buildroot.org>;
 Wed,  7 Oct 2026 05:50:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org C5DCB400D0
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791352230;
 b=bf7KruH8aFDVxpyCbHk84qDtL5CcA4FjdnsQb2biQ9ku9b+Be7wfB+IVV7EAPfGZnNqQ
 eTacf/HkCqHQHZbtQ4BE9BVBbw8Z2oqxyWql+aC7VW83ngMoOy2reIAQVUGeuDhV7+NfK
 C5jB0ey2gBpRlcwxSHxwQJnfYJ3Z7nWYLdQv7cKb8s5+93VmzsJTM882XQUxYV04n0wPj
 ZogrcEWvd7S6y448Jo5cbumUMs/7o2SPdtKCL3/amS+IUq/QjCpaEg+SYcNUbJJ6tgp7i
 pOEG9/bqiQX8GmiKMV1RdF2n3ehblSIv2/WLC2xpmQBE4GUTZuxDAeHalhp+S++tFng==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791352230;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Ihrwpsoe2cgIO/uL7eZ808P9RoB9mqAA0hQxlqd0bHk=;
 b=MRmS37O2MWR8xjdq6C/oRJjINHbZyIf9x16YBdKfmgdTwKomt91B+beydLDVWloRK7JQ
 F8fZk0rU6hJP+GsENdQP8h8kiAJ4yUfyoEQJUgvgiuRv+Bntv+h7/BIiG1T34pf4rlu7P
 +1R+y0XnQzfM63ma0BUKk7sP9Vi7tY5rwgi9ZD+etmMOXLpSfA/qgwQSd6AG596Cifqru
 MwmAiLSpghdIuVj7R5CZbfsAZTY83+N4yyNEMRDaUkIuGMhrrk9da4IDfcxZ/b5MFQgpX
 LuNcv83rZIJ27lX34P9ky9qwfevEMMXbEbqn2P9dtnekyTkrHeHOm3AKjvtO4TrPI9A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5DCB400D0
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 05:50:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 36F178DAA6; Wed,  7 Oct 2026 05:49:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 7 Oct 2026 07:49:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 042b25792ba0e3eab1e70c614278664253fef1b0
X-Git-Newrev: 23d71bfd96a32a7a1282ca474861d5e5d86a8d41
X-Patchwork-Hint: ignore
Message-Id: <20261007054914.36F178DAA6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/inadyn: fix mbedtls support
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/23d71bfd96a32a7a1282ca474861d5e5d86a8d41
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Since commit 6bab22ca41 ("package/inadyn: bump to v2.10.0"), the
mbedtls condition is written as "$BR2_PACKAGE_MBEDTLS", which make
expands as the variable $B followed by "R2_PACKAGE_MBEDTLS", so the
condition is never true. Without OpenSSL and GnuTLS, inadyn was built
with --disable-ssl even when mbedtls was enabled.

In addition, inadyn uses GnuTLS by default and needs --enable-mbedtls
to use mbedtls, which was never passed.

Fix the condition and pass --enable-mbedtls.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/inadyn/inadyn.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/inadyn/inadyn.mk b/package/inadyn/inadyn.mk
index a8891debb3..68a28eabfa 100644
--- a/package/inadyn/inadyn.mk
+++ b/package/inadyn/inadyn.mk
@@ -15,7 +15,8 @@ INADYN_CONF_OPTS += --enable-openssl
 INADYN_DEPENDENCIES += openssl
 else ifeq ($(BR2_PACKAGE_GNUTLS),y)
 INADYN_DEPENDENCIES += gnutls
-else ifeq ($BR2_PACKAGE_MBEDTLS, y)
+else ifeq ($(BR2_PACKAGE_MBEDTLS),y)
+INADYN_CONF_OPTS += --enable-mbedtls
 INADYN_DEPENDENCIES += mbedtls
 else
 INADYN_CONF_OPTS += --disable-ssl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
