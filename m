Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCDE8C35FE8
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 08:11:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AABDF80594;
	Sun, 15 Sep 2024 08:11:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d0SBANdiPnuc; Sun, 15 Sep 2024 08:11:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB8878083E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB8878083E;
	Sun, 15 Sep 2024 08:11:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 25EED1BF47D
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 08:11:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 144BC60701
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 08:11:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yhocm7g9glUA for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 08:11:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CD06A606FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD06A606FD
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CD06A606FD
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 08:11:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 82A981C0002;
 Sun, 15 Sep 2024 08:11:23 +0000 (UTC)
Date: Sun, 15 Sep 2024 10:11:22 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240915101122.66296e76@windsurf>
In-Reply-To: <20240915071447.1540596-1-james.hilliard1@gmail.com>
References: <20240915071447.1540596-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726387883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8behOtPLY8h/Fn5AUi9/rLHR2n96w93FaoFipqUim5I=;
 b=cdaL81BiQDJX9pJpR4+Og/4xGT+xYoy5knDyeKuCxUk8qnqfnjUamO/CDFY1dMn3RCtWjN
 WUgYCf/mELXPwGgrck3K++NH/rjjptJG6d9mg2f6oARreI4Hl1c4e9/DHKk/y4fIgweaaG
 pQogW532fXGSy0NBP13rIII6GKRqkw9EfnjM+negPrUTMokWh3G2D5jwJrEX/SsQBeqRaw
 waPTgVCLE57IZTYIUSEyIa81okkgCuTWdE8T5qwuK7yGdDfoVSwOkFLiA1eLYV3dVz8Jdq
 mYcr5lyHEdg8x+p6lJhrbH5dB2EVxCcf1PSgykS4/O42xzbl4S9IWVQBspDRrw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cdaL81Bi
Subject: Re: [Buildroot] [PATCH 1/2] package/python-proto-plus: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 15 Sep 2024 01:14:46 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/Config.in                                |  1 +
>  package/python-proto-plus/Config.in              |  7 +++++++
>  package/python-proto-plus/python-proto-plus.hash |  5 +++++
>  package/python-proto-plus/python-proto-plus.mk   | 14 ++++++++++++++
>  4 files changed, 27 insertions(+)
>  create mode 100644 package/python-proto-plus/Config.in
>  create mode 100644 package/python-proto-plus/python-proto-plus.hash
>  create mode 100644 package/python-proto-plus/python-proto-plus.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 269a8cae6f..505ca64c00 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1261,6 +1261,7 @@ menu "External python modules"
>  	source "package/python-posix-ipc/Config.in"
>  	source "package/python-priority/Config.in"
>  	source "package/python-prompt-toolkit/Config.in"
> +	source "package/python-proto-plus/Config.in"
>  	source "package/python-protobuf/Config.in"
>  	source "package/python-psutil/Config.in"
>  	source "package/python-psycopg2/Config.in"
> diff --git a/package/python-proto-plus/Config.in b/package/python-proto-plus/Config.in
> new file mode 100644
> index 0000000000..368ca0160d
> --- /dev/null
> +++ b/package/python-proto-plus/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_PYTHON_PROTO_PLUS
> +	bool "python-proto-plus"
> +	select BR2_PACKAGE_PYTHON_PROTOBUF # runtime

You forgot to propagate the "depends on" from
BR2_PACKAGE_PYTHON_PROTOBUF: BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS. I
fixed that.

Thanks,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
