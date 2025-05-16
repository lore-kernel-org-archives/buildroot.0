Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18910C54754
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 17:59:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C758E612F6;
	Fri, 16 May 2025 17:59:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gG-D5VyfUDAD; Fri, 16 May 2025 17:59:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC98E612EA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC98E612EA;
	Fri, 16 May 2025 17:59:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 06D3713D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:59:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE6CA612C1
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:59:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5gaDlabe2LBU for <buildroot@buildroot.org>;
 Fri, 16 May 2025 17:59:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C5431612F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5431612F0
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C5431612F0
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:59:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6B9641C1104; Fri, 16 May 2025 19:59:24 +0200 (CEST)
Message-ID: <5c5d34c2-809c-43f5-acf0-0296ead83bb5@rnout.be>
Date: Fri, 16 May 2025 13:06:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Cc: Petr Vorel <petr.vorel@gmail.com>
References: <20250510075826.781184-1-thomas.petazzoni@bootlin.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250510075826.781184-1-thomas.petazzoni@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747418364; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=00kIk3XWoXBJ3irUU/jrSbRhcSCpWzmSZ9wzTHKdx8g=;
 b=OI+6PFpYcj6fu3xxYLTJHLAcBoA5mzL7SCY+9Cwp1z0WT6gMdleed1eAGkjNz0yUgh7UpD
 WBFS8C/+gcc27C6YK4pQIeecMd4IEsfsxGF7EGPJnbwqIwqrS/VIht8JxkvJFvbw8Shk/d
 oA3gqphxpCOocTkKtiQI7GXYsCYOoHrV9jIWfGQ/buyRyyV4wfbl2hAFMTdzFvkFMghn55
 Sx0BypvbqPSpCXfzMwdnLblIgXeQjSp+Yr5DaN5q/qXGZNyWdbtKqL5DhQHaC9p3WFknp8
 mUr5nik1tU/ZbMI15knmAtejy7GSs9bFVxqKRXe9EP7If6dVg/spzdlzplU+9A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=OI+6PFpY
Subject: Re: [Buildroot] [PATCH] package/libtirpc: backport upstream fixes
 for GCC 15.x issues
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10/05/2025 09:58, Thomas Petazzoni via buildroot wrote:
> This commit backports two upstream commits that address GCC 15.x build
> issues.
> 
> Fixes:
> 
>    https://autobuild.buildroot.org/results/abca98bc69ac51af3652ab2d0d187d1461f83515/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   ...rations-to-allow-compile-with-gcc-15.patch | 67 +++++++++++++++++++
>   ...d-key_call-declarations-to-allow-com.patch | 63 +++++++++++++++++
>   2 files changed, 130 insertions(+)
>   create mode 100644 package/libtirpc/0001-Update-declarations-to-allow-compile-with-gcc-15.patch
>   create mode 100644 package/libtirpc/0002-update-signal-and-key_call-declarations-to-allow-com.patch
> 
> diff --git a/package/libtirpc/0001-Update-declarations-to-allow-compile-with-gcc-15.patch b/package/libtirpc/0001-Update-declarations-to-allow-compile-with-gcc-15.patch
> new file mode 100644
> index 0000000000..f94be6f39a
> --- /dev/null
> +++ b/package/libtirpc/0001-Update-declarations-to-allow-compile-with-gcc-15.patch
> @@ -0,0 +1,67 @@
> +From 45c1eade8fa7ca62c53e80450b315ccae6db55ea Mon Sep 17 00:00:00 2001
> +From: Rudi Heitbaum <rudi@heitbaum.com>
> +Date: Thu, 12 Dec 2024 04:16:02 -0500
> +Subject: [PATCH] Update declarations to allow compile with gcc-15
> +
> +This patch fixes some of the compile errors with gcc 15-20241117.
> +
> +In addition the follow declarations need to be fixed:
> +  sed -n 75,77p libtirpc-1.3.6/src/key_call.c
> +  cryptkeyres *(*__key_encryptsession_pk_LOCAL)() = 0;
> +  cryptkeyres *(*__key_decryptsession_pk_LOCAL)() = 0;
> +  des_block *(*__key_gendes_LOCAL)() = 0;
> +
> +Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
> +Signed-off-by: Steve Dickson <steved@redhat.com>
> +Upstream: d473f1e1f6ba80bfaee4daa058da159305167323
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + src/auth_none.c     | 2 +-
> + src/getpublickey.c  | 2 +-
> + src/svc_auth_none.c | 4 ++--
> + 3 files changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/src/auth_none.c b/src/auth_none.c
> +index 0b0bbd1..aca6e71 100644
> +--- a/src/auth_none.c
> ++++ b/src/auth_none.c
> +@@ -62,7 +62,7 @@ static bool_t authnone_validate (AUTH *, struct opaque_auth *);
> + static bool_t authnone_refresh (AUTH *, void *);
> + static void authnone_destroy (AUTH *);
> +
> +-extern bool_t xdr_opaque_auth();
> ++extern bool_t xdr_opaque_auth(XDR *, struct opaque_auth *);
> +
> + static struct auth_ops *authnone_ops();
> +
> +diff --git a/src/getpublickey.c b/src/getpublickey.c
> +index be37a24..4e96c7c 100644
> +--- a/src/getpublickey.c
> ++++ b/src/getpublickey.c
> +@@ -52,7 +52,7 @@
> + /*
> +  * Hack to let ypserv/rpc.nisd use AUTH_DES.
> +  */
> +-int (*__getpublickey_LOCAL)() = 0;
> ++int (*__getpublickey_LOCAL)(const char *, char *) = 0;
> +
> + /*
> +  * Get somebody's public key
> +diff --git a/src/svc_auth_none.c b/src/svc_auth_none.c
> +index 887e809..5ca98e9 100644
> +--- a/src/svc_auth_none.c
> ++++ b/src/svc_auth_none.c
> +@@ -37,8 +37,8 @@
> +
> + #include <rpc/rpc.h>
> +
> +-static bool_t	svcauth_none_destroy();
> +-static bool_t   svcauth_none_wrap();
> ++static bool_t	svcauth_none_destroy(SVCAUTH *);
> ++static bool_t   svcauth_none_wrap(SVCAUTH *, XDR *, bool_t (*)(XDR *, ...), char *);
> +
> + struct svc_auth_ops svc_auth_none_ops = {
> + 	svcauth_none_wrap,
> +--
> +2.49.0
> +
> diff --git a/package/libtirpc/0002-update-signal-and-key_call-declarations-to-allow-com.patch b/package/libtirpc/0002-update-signal-and-key_call-declarations-to-allow-com.patch
> new file mode 100644
> index 0000000000..7bd8098bbd
> --- /dev/null
> +++ b/package/libtirpc/0002-update-signal-and-key_call-declarations-to-allow-com.patch
> @@ -0,0 +1,63 @@
> +From 09d506d24abb9ce506d7a4a4201deff017018779 Mon Sep 17 00:00:00 2001
> +From: Rudi Heitbaum <rudi@heitbaum.com>
> +Date: Thu, 2 Jan 2025 08:46:24 -0500
> +Subject: [PATCH] update signal and key_call declarations to allow compile with
> + gcc-15
> +
> +Follow up patch addressing the following declarations:
> +  sed -n 75,77p libtirpc-1.3.6/src/key_call.c
> +  cryptkeyres *(*__key_encryptsession_pk_LOCAL)() = 0;
> +  cryptkeyres *(*__key_decryptsession_pk_LOCAL)() = 0;
> +  des_block *(*__key_gendes_LOCAL)() = 0;
> +
> +Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
> +Signed-off-by: Steve Dickson <steved@redhat.com>
> +Upstream: 240ee6c774729c9c24812aa8912f1fcf8996b162
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + src/auth_time.c | 4 ++--
> + src/key_call.c  | 6 +++---
> + 2 files changed, 5 insertions(+), 5 deletions(-)
> +
> +diff --git a/src/auth_time.c b/src/auth_time.c
> +index 936dd76..c21b1df 100644
> +--- a/src/auth_time.c
> ++++ b/src/auth_time.c
> +@@ -248,7 +248,7 @@ __rpc_get_time_offset(td, srv, thost, uaddr, netid)
> + 	char			ut[64], ipuaddr[64];
> + 	endpoint		teps[32];
> + 	nis_server		tsrv;
> +-	void			(*oldsig)() = NULL; /* old alarm handler */
> ++	void			(*oldsig)(int) = NULL; /* old alarm handler */
> + 	struct sockaddr_in	sin;
> + 	int			s = RPC_ANYSOCK;
> + 	socklen_t len;
> +@@ -417,7 +417,7 @@ __rpc_get_time_offset(td, srv, thost, uaddr, netid)
> + 		} else {
> + 			int res;
> +
> +-			oldsig = (void (*)())signal(SIGALRM, alarm_hndler);
> ++			oldsig = (void (*)(int))signal(SIGALRM, alarm_hndler);
> + 			saw_alarm = 0; /* global tracking the alarm */
> + 			alarm(20); /* only wait 20 seconds */
> + 			res = connect(s, (struct sockaddr *)&sin, sizeof(sin));
> +diff --git a/src/key_call.c b/src/key_call.c
> +index 9f4b1d2..43f990e 100644
> +--- a/src/key_call.c
> ++++ b/src/key_call.c
> +@@ -72,9 +72,9 @@
> +  * implementations of these functions, and to call those in key_call().
> +  */
> +
> +-cryptkeyres *(*__key_encryptsession_pk_LOCAL)() = 0;
> +-cryptkeyres *(*__key_decryptsession_pk_LOCAL)() = 0;
> +-des_block *(*__key_gendes_LOCAL)() = 0;
> ++cryptkeyres *(*__key_encryptsession_pk_LOCAL)(uid_t, char *) = 0;
> ++cryptkeyres *(*__key_decryptsession_pk_LOCAL)(uid_t, char *) = 0;
> ++des_block *(*__key_gendes_LOCAL)(uid_t, char *) = 0;
> +
> + static int key_call( u_long, xdrproc_t, void *, xdrproc_t, void *);
> +
> +--
> +2.49.0
> +

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
