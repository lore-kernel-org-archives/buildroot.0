Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE9DC3DA49
	for <buildroot@archiver.kernel.org>; Thu, 18 Jul 2024 20:10:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 804B160637;
	Thu, 18 Jul 2024 20:10:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id apJ44-b-umjZ; Thu, 18 Jul 2024 20:10:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8EA3A60BF3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8EA3A60BF3;
	Thu, 18 Jul 2024 20:10:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 03DED1BF3A1
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 20:10:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E4C2A4093A
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 20:10:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8a3WVwiyUaQZ for <buildroot@lists.busybox.net>;
 Thu, 18 Jul 2024 20:10:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A5E4240929
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5E4240929
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A5E4240929
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 20:10:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 49A32FF807;
 Thu, 18 Jul 2024 20:10:40 +0000 (UTC)
Date: Thu, 18 Jul 2024 22:10:39 +0200
To: Bryce Johnson <bryce@redpinelabs.com>
Message-ID: <20240718221039.497a60bf@windsurf>
In-Reply-To: <CADXxVSLCUVvO1MwirtFrxfX8QFP4=N7S49xswD=j1oSrV=6PSg@mail.gmail.com>
References: <CADXxVSKBFjoub2ctkeSAzuuw2hbaMKwPw+xC=BG9z5+JJk7vSg@mail.gmail.com>
 <23725f14-d243-45da-b096-948c5e063aa7@mind.be>
 <CADXxVS+tRXXBbtVf=DXOtsH6BqbJgbKDZgQn206aS0sOMYek=w@mail.gmail.com>
 <CADXxVSLCUVvO1MwirtFrxfX8QFP4=N7S49xswD=j1oSrV=6PSg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721333440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qg45TE7BR658oP2xSgCLWSdFSI3O0hBp0l3SKq9/G/w=;
 b=SZPRPI135Z9ujtur628hwfIR3GESihSHS4PdLK7lbANRPcv7Eqg/llcFv97mhJdgRTyUS5
 aXxkk02KsoldEDcaoxWXLeyrzmjxf15sPOifu+fV/Gy5mYSzAS3M20DI6dCjsme/iVOD6B
 zIrrvWKWGH3G5agi/WtQ6KBSvc+LSC9EOm7CsBSpuDuZHzhekDnS97FyGCCLsbbZFBru3Z
 gWtqDg5DT5d2yhkMG4W0AWbnOrIdMZEzrje7zuNa3ABHaWBMe0M2XYh+B/LwV6I4EvbY0w
 VzH4YqNoWXwpJXUKGnQczXT2V+npVGEfAwedK4+cmMfpndq5uSmiCtqmZnZKcw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SZPRPI13
Subject: Re: [Buildroot] [PATCH v2 1/1] package/connman: Remove
 wpa_supplicant selection for wifi
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
Cc: martin@barkynet.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bryce,

On Thu, 18 Jul 2024 09:15:16 -0600
Bryce Johnson <bryce@redpinelabs.com> wrote:

> Connman wifi works both with IWD and wpa_supplicant
> 
> Signed-off-by: Bryce Johnson <bryce@redpinelabs.com>
> ---
>  package/connman/Config.in | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/package/connman/Config.in b/package/connman/Config.in
> index af3e1f69f6..62516d435f 100644
> --- a/package/connman/Config.in
> +++ b/package/connman/Config.in
> @@ -45,8 +45,7 @@ config BR2_PACKAGE_CONNMAN_ETHERNET
> 
>  config BR2_PACKAGE_CONNMAN_WIFI
>      bool "enable WiFi support"
> -    select BR2_PACKAGE_WPA_SUPPLICANT # runtime
> -    select BR2_PACKAGE_WPA_SUPPLICANT_DBUS # runtime
> +    select BR2_PACKAGE_WPA_SUPPLICANT if !BR2_PACKAGE_IWD #runtime

But what about BR2_PACKAGE_WPA_SUPPLICANT_DBUS ?

Don't we need to also have:

	select BR2_PACKAGE_WPA_SUPPLICANT_DBUS if !BR2_PACKAGE_IWD # runtime

to preserve the same behavior?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
