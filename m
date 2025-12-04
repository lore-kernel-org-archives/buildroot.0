Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 568F4D2A537
	for <buildroot@archiver.kernel.org>; Thu,  4 Dec 2025 20:43:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 162E361CCC;
	Thu,  4 Dec 2025 20:43:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xtxr-IHdoRx5; Thu,  4 Dec 2025 20:43:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E10B613EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764881032;
	bh=ls3Rt5DB9KqNQfHIwYXuzYREIVcOJxX9h7eVTXGt5JQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=guBef3tB/HHzatnnbJVoZi4WletYneD4LVNxTFhJ+EXvNZspgUxs88iwrBr+P+gVK
	 LkmmO297YNCHLViWHJ8lBaO8hZEk/wRvZvEV+L/2X2sLi2+DbE1CPxtZuPd3xUC0QB
	 095YBC4cKeDCYQny6t2TmoDUVK4qnKiVUSeU7ISJOexpWpP87hYD+XQsBjD0qXjVLO
	 zPIkzl8IJlupZFCKVbWQh0rX0yw3d4b44t0UytzZZKmB8Yvqld6B0806gbbZvWGwh9
	 yF4GKKwd8/QBEvD+g8s9nwEL2cYWfUvO3tNzx8D1C//53yiqIGwucQ1XecABrEc40b
	 leSNKyp6hjtUw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E10B613EB;
	Thu,  4 Dec 2025 20:43:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 03501D3
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:43:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E944461C9E
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:43:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CQW9GDsoFBNp for <buildroot@buildroot.org>;
 Thu,  4 Dec 2025 20:43:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D969C613EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D969C613EB
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D969C613EB
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:43:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CA57DB979ECE; Thu,  4 Dec 2025 21:43:46 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Thu,  4 Dec 2025 21:43:45 +0100
Message-ID: <20251204204345.13253-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251016182638.3397027-1-bernd@kuhls.net>
References: <20251016182638.3397027-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1764881027; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=PzKrKATaFbrmcC0KiqIH6EaLtaU/dLqvrWkgr00o82A=;
 b=leAgvANBsZb3/T+ABErgzQ2d1YHM4y2tQMBUW89TVU9MZbaqQVW4t5gXHVMkwa9Q7MUaL6
 718ceMJlG1cgWm2G4NH9fRFl/zyznxQ2OaTB+K8z74p4XMx6sz3h9gDB9NzHyX45WQoUKo
 7VS7ZhlJnfl8QFdt2vcXYY3RteDBT0uusmmLgL4XFJGYy0gxaGZEdY7J1o1C8zHhsIQrlK
 b8EoDQTtkDcNoP4l6+gb5i2WKzRrlJ4DF1Q3pl5hnWBRwrtqJZtI2f5zLMrIH9mSQuNVa/
 /QaE/CnuRmJ/c3hRftNJuabMyJOqR7GbBuW5CHviS27Wx670BFC+c+DwZojQcQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=leAgvANB
Subject: Re: [Buildroot] [PATCH 1/1] package/samba4: bump version to 4.23.2
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
> Release notes:
> https://www.samba.org/samba/history/samba-4.23.0.html
> https://www.samba.org/samba/history/samba-4.23.1.html
> https://www.samba.org/samba/history/samba-4.23.2.html
> 
> Rebased patch 0001 due to upstream commit:
> https://gitlab.com/samba-team/samba/-/commit/7a4c8d6f84cabfe9d27fcb795a4030de93a1b8cb#8e3d715f2e6eade6c52748fd46ba94a12e2cec4e
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.08.x. Thanks

> ---
>  ...ild-find-pre-built-heimdal-build-tools-in-case-of-.patch | 6 +++---
>  package/samba4/samba4.hash                                  | 4 ++--
>  package/samba4/samba4.mk                                    | 2 +-
>  3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/package/samba4/0001-build-find-pre-built-heimdal-build-tools-in-case-of-.patch b/package/samba4/0001-build-find-pre-built-heimdal-build-tools-in-case-of-.patch
> index 8d223e38a0..b8dd012d41 100644
> --- a/package/samba4/0001-build-find-pre-built-heimdal-build-tools-in-case-of-.patch
> +++ b/package/samba4/0001-build-find-pre-built-heimdal-build-tools-in-case-of-.patch
> @@ -33,7 +33,7 @@ BUG: https://bugzilla.samba.org/show_bug.cgi?id=14164
>  
>  Signed-off-by: Uri Simchoni <uri@samba.org>
>  Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> -[Bernd: rebased for version 4.11.13, 4.17.7, 4.20.3 & 4.22.1]
> +[Bernd: rebased for version 4.23.1]
>  ---
>   wscript_configure_embedded_heimdal | 11 +++++++++++
>   wscript_configure_system_heimdal   | 11 -----------
> @@ -43,10 +43,10 @@ diff --git a/wscript_configure_embedded_heimdal b/wscript_configure_embedded_hei
>  index 8c55ae2..4fdae80 100644
>  --- a/wscript_configure_embedded_heimdal
>  +++ b/wscript_configure_embedded_heimdal
> -@@ -15,3 +15,14 @@
> - conf.define('HAVE_CLIENT_GSS_C_CHANNEL_BOUND_FLAG', 1)
> +@@ -16,3 +16,14 @@
>   
>   conf.define('HAVE_KRB5_INIT_CREDS_STEP', 1)
> + conf.define('HAVE_GSS_KEY_VALUE_SET_DESC', 1)
>  +
>  +def check_system_heimdal_binary(name):
>  +    if conf.LIB_MAY_BE_BUNDLED(name):
> diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
> index 0668a9e8db..462c3c919b 100644
> --- a/package/samba4/samba4.hash
> +++ b/package/samba4/samba4.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated after checking pgp signature
> -# https://download.samba.org/pub/samba/stable/samba-4.22.5.tar.asc
> -sha256  d8566a15d3dbfc0b777d1e8fbb2eee988a024ca9c786dcac65dd10347307400d  samba-4.22.5.tar.gz
> +# https://download.samba.org/pub/samba/stable/samba-4.23.2.tar.asc
> +sha256  2de330647e1486683597e261285d04a9b7514ab5c7da27711736e22c7f2b9c2e  samba-4.23.2.tar.gz
>  sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
> diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
> index 688d5177bc..fb2aab01c6 100644
> --- a/package/samba4/samba4.mk
> +++ b/package/samba4/samba4.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SAMBA4_VERSION = 4.22.5
> +SAMBA4_VERSION = 4.23.2
>  SAMBA4_SITE = https://download.samba.org/pub/samba/stable
>  SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
>  SAMBA4_INSTALL_STAGING = YES
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
