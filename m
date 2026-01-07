Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF492D0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:51:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDB8240ECF;
	Wed,  7 Jan 2026 17:51:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hP9Xbc4O3qUe; Wed,  7 Jan 2026 17:51:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD42840EE4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808279;
	bh=UiXYlmT4HWOKIrHumyBeMYorYc5SlxkpHpnUrCPJcCc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rXdKMDO45jpK8dDy8fwoiXwrn3Fc30hwZAvbZoVT+zG9egBPEjFCA6Jusx4OagrQC
	 gJstDC7RE13PzTLyaof1TCYFxn6iDgyonXjUQ2IgIkOcCwmXW5WNwEulfOxJgq99l4
	 YhPHwcgcuAkqc8v5PyHeRmUp02opDkpBhwdDJNsnT8fnMsmOG/KB05vezdOxmfcwHC
	 2oT5VbVqbj0hUIeoAKFYXaoCojijvmTL7AXK2Z161DNngtVkK7FzyVtsurVeDB3EmH
	 Cs1KiPS7C+JUPhJWp5PDlVjy3Y5ntetEOjHKT8bWK83J9BjYlcq0MCzVqrd7aBOZ0I
	 iiyBUqVUgmYmw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD42840EE4;
	Wed,  7 Jan 2026 17:51:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id F1B2625B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E1E5240263
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PnGEZtlm13Lx for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:51:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CA76440160
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA76440160
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CA76440160
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0E466B97A704; Wed,  7 Jan 2026 18:51:16 +0100 (CET)
To: Thomas Perale <thomas.perale@mind.be>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:51:14 +0100
Message-ID: <20260107175114.227665-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251227151915.225508-1-thomas.perale@mind.be>
References: <20251227151915.225508-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808276; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=58JuoXaa2gIunadYPmP5Tdt1Mr1e9CHPJQizjD53WPI=;
 b=h6VRB1/Kt1pvlwZxr9zalx2nFCqb8f35sUJDW1XlEvcZTuaZezCg01x6/sElQq0A1eLP2N
 DmKCTOk1hiZVLouUiTtSCeRewH8vXC0lc9QKUeC8knu+ZJPtV2Ca0Rf51b5nznEzNOoNY+
 N/x6AtPYZ02S6JNRJmIv1eU+uAMwLV0q3mPGYBarWJxhaSD9v8Ofe5mFOw7p9Rrq9sD19O
 Qzeh9vTSk1xyhM0ac93YDraxBBcEy+FIxkOQIQEqQMSj1QbeKvYLnBPLesGU0Gne0CHPAm
 PqlV/C8FAj823v0D/5sQ08YjBHoeb0tSf2FbrdKuKJc3hzHjJieBDY6CW+Y1Xw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=h6VRB1/K
Subject: Re: [Buildroot] [2025.02.x,
 PATCH] package/python-filelock: fix CVE-2025-68146
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Fixes the following vulnerability:
> 
> - CVE-2025-68146
> 
> A Time-of-Check-Time-of-Use (TOCTOU) race condition allows local
> attackers to corrupt or truncate arbitrary user files through symlink
> attacks.
> 
> For more informations, see:
>   - https://nvd.nist.gov/vuln/detail/CVE-2025-68146
>   - https://github.com/tox-dev/filelock/commit/18a99880087934252e7c0c994640f66e80e34be9
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  ...-vulnerability-in-lock-file-creation.patch | 27 +++++++++++++++++++
>  package/python-filelock/python-filelock.mk    |  3 +++
>  2 files changed, 30 insertions(+)
>  create mode 100644 package/python-filelock/0001-Fix-TOCTOU-symlink-vulnerability-in-lock-file-creation.patch
> 
> diff --git a/package/python-filelock/0001-Fix-TOCTOU-symlink-vulnerability-in-lock-file-creation.patch b/package/python-filelock/0001-Fix-TOCTOU-symlink-vulnerability-in-lock-file-creation.patch
> new file mode 100644
> index 0000000000..a1656e1fa1
> --- /dev/null
> +++ b/package/python-filelock/0001-Fix-TOCTOU-symlink-vulnerability-in-lock-file-creation.patch
> @@ -0,0 +1,27 @@
> +From 4724d7f8c3393ec1f048c93933e6e3e6ec321f0e Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Bern=C3=A1t=20G=C3=A1bor?= <gaborjbernat@gmail.com>
> +Date: Mon, 15 Dec 2025 15:52:12 -0800
> +Subject: [PATCH] Fix TOCTOU symlink vulnerability in lock file creation (#461)
> +
> +CVE: CVE-2025-68146
> +Upstream: https://github.com/tox-dev/filelock/commit/4724d7f8c3393ec1f048c93933e6e3e6ec321f0e
> +[thomas: Dropped the windows part of the patch]
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + src/filelock/_unix.py    |  2 +-
> + src/filelock/_windows.py | 38 ++++++++++++++++++++++++++++++++++++++
> + 2 files changed, 39 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/filelock/_unix.py b/src/filelock/_unix.py
> +index b2fd0f33..25cbeca6 100644
> +--- a/src/filelock/_unix.py
> ++++ b/src/filelock/_unix.py
> +@@ -38,7 +38,7 @@ class UnixFileLock(BaseFileLock):
> + 
> +         def _acquire(self) -> None:
> +             ensure_directory_exists(self.lock_file)
> +-            open_flags = os.O_RDWR | os.O_TRUNC
> ++            open_flags = os.O_RDWR | os.O_TRUNC | os.O_NOFOLLOW
> +             if not Path(self.lock_file).exists():
> +                 open_flags |= os.O_CREAT
> +             fd = os.open(self.lock_file, open_flags, self._context.mode)
> diff --git a/package/python-filelock/python-filelock.mk b/package/python-filelock/python-filelock.mk
> index 44599ee865..48025d8345 100644
> --- a/package/python-filelock/python-filelock.mk
> +++ b/package/python-filelock/python-filelock.mk
> @@ -12,4 +12,7 @@ PYTHON_FILELOCK_LICENSE = Public Domain
>  PYTHON_FILELOCK_LICENSE_FILES = LICENSE
>  PYTHON_FILELOCK_DEPENDENCIES = host-python-hatch-vcs
>  
> +# 0001-Fix-TOCTOU-symlink-vulnerability-in-lock-file-creation.patch
> +PYTHON_FILELOCK_IGNORE_CVES += CVE-2025-68146
> +
>  $(eval $(python-package))
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
