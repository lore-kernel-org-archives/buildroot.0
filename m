Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7974C982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 13:20:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9299C40611;
	Sun, 20 Sep 2026 13:20:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sLtQe7v5gW9d; Sun, 20 Sep 2026 13:20:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org CA80C4082A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789910433;
	b=gx1wEWUODDh93WURcUpOsYHzgEjz5W/aKhU6PbqGUX+DzTsVQtyr2YF2kpvHNeM/quS0
	 sP7izCnVz6j/2pqxPE/VImOumcdMUxcM0+alDuvnqGOiSM4z5UwRqya3jpZ/H1S+4Tgdt
	 YUdo9EwIAdWXpq43kax/iUGfBrQoG6ddofkRfnFpE6K0hTG4FVQgoVzvEWW6y/N1sKP8U
	 o65WZtSZySsSi6lMHeQrpTwVhBjlZ+4+r/R9FYRQOhHP4YIBKAqJe+HZuCwdYq/gjFAXV
	 Af0e/GFQlu4aQ66o6Jfi8bpGLn45JD7R6RH78w7m9ZuxBczjWYj3oDwcN63+BbgzpfQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789910433;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=KdOwzATRYJbXPuSH6B1oZ/+FkvLTa58ad0aRrHQrz+A=;
	b=aTTEY5SLTFUXvHC02vDGcNeXetzlf3WvTghrr2ragDKotmCergX34IfC7tYeOxVR414f
	 2908CGo7YFm7YK6YrDNW4xWCEVfr77mWt46WC2LacJfk1jS1ZXQQwJNdH8/41RyD1oruR
	 Ndc8eWs+madr1zSd1Npb2L9fLrhb2U+o1HDhnMiXOvz1iNjwo72Bd0PLdyyoQLOwQdcUz
	 GexyVBPqiXqDaEaU4GBVs0RZ103synU00qu/Jr2rqOo4WcTZSxePS0tUXC4VEzh6FG2SQ
	 UoTGYH9/Lp93fzg5Rq2yrDYHeNGF9/fs7YIhdWMuC2hQxCrqCXnstmlHRRfVOF7PeQA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789910433;
	bh=KdOwzATRYJbXPuSH6B1oZ/+FkvLTa58ad0aRrHQrz+A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HvE0rLDTWcRjqWYNjF5RwBTggxnZzzpWyKYN7nVp6+qFk3unh4DfSnTYacZMn3aLp
	 iztKUGfnm64kegJJ5QpjwD0Xq+yZIOSVWyb/F6pZRpyrhSeGYN3uZG8vpQC8WkxdGj
	 cENp/rHPTWGdRBkLhfW6cXij4uCpCx3ZTu4ZQUAYAxyNc1xTP0Lf6llv1QzojecHIe
	 GzRXCMzZejV5hL0Ss1NGlR2+DxKSV3PBCVJh8VLue6XQly9DIPvm4MitVtfBalt/ZS
	 DNBRB1MaKkZDFRMHmQfBUgTSNMf39CLLnFFXrcDGG75tjMQpmuDcsqPwFctuG2phBJ
	 R/q6AeSi51pTA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA80C4082A;
	Sun, 20 Sep 2026 13:20:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 76DF6392
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 13:20:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 68A7B80E1B
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 13:20:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gQbGW39soKav for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 13:20:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org A030480E17
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789910431;
 b=Vs0ShaLAHwOgcRKdTJo75OMo1LSzGH0EfDHf5U7v6l1zZaavqsNtvX9WlHO73CWcw9g5
 2QNpCNLXe+VNBII+QyYBg5wTXcy6wfgWShhYg9U27q2PA3XbDUFOG8NbpC06ZrQJqtt23
 GQfkBo9PPGq2yDkETPfAt02Ziff55nx/J2s3d91CUutnvl30kZxIXeZtPYqU04+KqtNmz
 V7uYJGvHJ780HbwzdMC1g91uRyGWlTYwmLrs22DGYJFmcLvFiEBCcrNZGeglYZ2tuNAfq
 by72Mjsxvd+Ox63itRcZ/nAJAIgIuPoVDbdh6n5YnCjUdprKAXwZObVTa8RkNnsDTfQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789910431;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=aZyiT1T+KtsGvjwFP5AtYkwxO8JQqT++R3oyZYh7QHw=;
 b=Z6O7uqX+xRSJspigmPEkTW/Q+DO4OGSHTtULBrKoER9nxbU/0Sni5iCJIMbCotE4JquQ
 8qYRWZ5A2cV2/OxAMpUKO9iuGldOSkaTa8aaZj0C2kFlhTjdSXA7MfscT2pI0/bJ+zfBs
 eJqTCf26vujLFyGUveH2r2StqX/XMWKdV4qpUfLqCbxNmtR81azxFpv2U6T21504sHQzT
 VF+beA0bmc0250mWSthVUWtCGCo4qCfTqOvbmhOJcuQYpiDSXsFi+IZzer0303vexpGiA
 sDfZ8q3j0TRgPvTa9OEK0mpdf6VsZQzEI0GZE4URBvNmSXTRlGdlNg3ZiuNwugboxHw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A030480E17
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 13:20:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3A1C78CA36; Sun, 20 Sep 2026 13:19:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 15:19:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e4d9ab154ed28ff9748d0005fc664d10fc5202d4
X-Git-Newrev: c633879757647767f106ce9a77abe005494a4b06
X-Patchwork-Hint: ignore
Message-Id: <20260920131923.3A1C78CA36@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ibrcommon: fix build with OpenSSL
 4.0.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c633879757647767f106ce9a77abe005494a4b06
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...pilation-without-deprecated-OpenSSL-1.1-A.patch | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/package/ibrcommon/0004-ssl-Fix-compilation-without-deprecated-OpenSSL-1.1-A.patch b/package/ibrcommon/0004-ssl-Fix-compilation-without-deprecated-OpenSSL-1.1-A.patch
new file mode 100644
index 0000000000..8a8b21ce7e
--- /dev/null
+++ b/package/ibrcommon/0004-ssl-Fix-compilation-without-deprecated-OpenSSL-1.1-A.patch
@@ -0,0 +1,42 @@
+From 073a1b779826d1e1bbf473ba45db3ac1e273efce Mon Sep 17 00:00:00 2001
+From: Rosen Penev <rosenp@gmail.com>
+Date: Tue, 27 Nov 2018 10:18:37 -0800
+Subject: [PATCH] ssl: Fix compilation without deprecated OpenSSL 1.1 APIs
+
+Upstream: https://github.com/morgenroth/ibrdtn/commit/073a1b779826d1e1bbf473ba45db3ac1e273efce
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ ibrcommon/ssl/TLSStream.cpp | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/ibrcommon/ssl/TLSStream.cpp b/ibrcommon/ssl/TLSStream.cpp
+index b18b43c3..e336db55 100644
+--- a/ibrcommon/ssl/TLSStream.cpp
++++ b/ibrcommon/ssl/TLSStream.cpp
+@@ -259,16 +259,22 @@ namespace ibrcommon
+ 		/* openssl initialization */
+ 		/* the if block is needed because SSL_library_init() is not reentrant */
+ 		if(!_SSL_initialized){
++#if OPENSSL_VERSION_NUMBER < 0x10100000L
+ 			SSL_load_error_strings();
+ 			SSL_library_init();
+ 			ERR_load_BIO_strings();
+ 			ERR_load_SSL_strings();
++#endif
+ 			_SSL_initialized = true;
+ 		}
+ 
+ 
+ 		/* create ssl context and throw exception if it fails */
++#if OPENSSL_VERSION_NUMBER < 0x10100000L
+ 		_ssl_ctx = SSL_CTX_new(TLSv1_method());
++#else
++		_ssl_ctx = SSL_CTX_new(TLS_method());
++#endif
+ 		if(!_ssl_ctx){
+ 			char err_buf[ERR_BUF_SIZE];
+ 			ERR_error_string_n(ERR_get_error(), err_buf, ERR_BUF_SIZE);
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
