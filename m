Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D5EBCA1016
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 12:44:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFC4961BDE;
	Thu, 11 Sep 2025 12:44:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mz2Ch2KUFCjo; Thu, 11 Sep 2025 12:44:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1E8261BB4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1E8261BB4;
	Thu, 11 Sep 2025 12:44:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C1C06234
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 12:44:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ABF3A810EA
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 12:44:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UzoXgv8RSUGZ for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 12:44:45 +0000 (UTC)
X-Greylist: delayed 468 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 11 Sep 2025 12:44:45 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 779AE81064
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 779AE81064
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=199.89.1.16;
 helo=013.lax.mailroute.net; envelope-from=wdouglass@carnegierobotics.com;
 receiver=<UNKNOWN> 
Received: from 013.lax.mailroute.net (013.lax.mailroute.net [199.89.1.16])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 779AE81064
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 12:44:45 +0000 (UTC)
Received: from 003.mia.mailroute.net (relayout.mia.mailroute.net
 [199.89.3.119])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by 013.lax.mailroute.net (Postfix) with ESMTPS id 4cMxrn2sl9zlskkf
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 12:36:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by 003.mia.mailroute.net (Postfix) with ESMTP id 4cMxrh2XG8z2K8Wf9;
 Thu, 11 Sep 2025 12:36:52 +0000 (UTC)
X-Virus-Scanned: by MailRoute
Received: from 003.mia.mailroute.net ([127.0.0.1])
 by localhost (003.mia [127.0.0.1]) (mroute_mailscanner, port 10026) with LMTP
 id YIs9RX_8JbdR; Thu, 11 Sep 2025 12:36:51 +0000 (UTC)
Received: from mail.carnegierobotics.com
 (static-108-39-229-99.pitbpa.fios.verizon.net [108.39.229.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by 003.mia.mailroute.net (Postfix) with ESMTPS id 4cMxrb67d2z2K8Wf4;
 Thu, 11 Sep 2025 12:36:45 +0000 (UTC)
Received: from CRL-PGH-EX19-1.crl.local (10.1.7.176) by
 CRL-PGH-EX19-1.crl.local (10.1.7.176) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.33; Thu, 11 Sep 2025 08:36:44 -0400
Received: from CRL-PGH-EX19-1.crl.local ([fe80::81d6:ea84:15d9:67d4]) by
 CRL-PGH-EX19-1.crl.local ([fe80::81d6:ea84:15d9:67d4%7]) with mapi id
 15.02.1544.033; Thu, 11 Sep 2025 08:36:44 -0400
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
CC: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Thread-Topic: [PATCH 17/23] package/opencv4: drop optional dependency on
 libgtk2
Thread-Index: AQHcIpqbAgH1EcFCx0upnmB2JzyFE7SOL08A
Date: Thu, 11 Sep 2025 12:36:44 +0000
Message-ID: <81e8e72d-e69c-4a87-af11-12eccbc789c2@carnegierobotics.com>
References: <20250910213241.1529448-1-thomas.petazzoni@bootlin.com>
 <20250910213241.1529448-18-thomas.petazzoni@bootlin.com>
In-Reply-To: <20250910213241.1529448-18-thomas.petazzoni@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
x-originating-ip: [10.1.80.186]
Content-ID: <750752478053E74B9A5E911577223DA7@crl.local>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 carnegierobotics.com; h=mime-version:content-transfer-encoding
 :content-id:content-type:content-type:user-agent
 :content-language:accept-language:in-reply-to:references
 :message-id:date:date:subject:subject:from:from:received
 :received:received:received; s=mr01; t=1757594211; x=1760186212;
 bh=7z7RDO+9mTJoszfFvee00XWo8dDQBUvd41t/ErCft/o=; b=ZG7qYW0Ltu7y
 IpJmyud1Llsa15iyUn5Haqzh4DKwAuEMR9/TTPI8VVUusV8p+kjhAoSNHF93eHuu
 og3GDIgaPc2lZDO98W0c8rhqB0xyWai/BSEIdoqxE8esj8kVJ1ysxE8ui+RyuGpW
 cOfdlfmX/YxCuK0W4q3YNywPq1XQl8fe8amReiEAgp2F9bdz/a60zjA/eaV5u+6h
 QhVqrX1OA7QL2nXjklvSbMr0uFTIzvmbqjLeyzhoD6w9qw0imNC6IuBjnx8S6d4s
 Bk3JLoBbC+xNCzz0H3sWXUXsHiwCIVYdaPHSCcDHVFCz+F5mC5tLGcYMBpexx4c+
 4onCyNYgXQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=carnegierobotics.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=carnegierobotics.com header.i=@carnegierobotics.com
 header.a=rsa-sha256 header.s=mr01 header.b=ZG7qYW0L
Subject: Re: [Buildroot] [PATCH 17/23] package/opencv4: drop optional
 dependency on libgtk2
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
From: Woody Douglass via buildroot <buildroot@buildroot.org>
Reply-To: Woody Douglass <wdouglass@carnegierobotics.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas,

Sounds good to me!

Reviewed-by: Woodrow Douglass <wdouglass@carnegierobotics.com>

Thanks,
Woodrow Douglass

On 9/10/25 17:32, Thomas Petazzoni wrote:
> As we're about to remove libgtk2, we need to drop libgtk2 support
> from opencv4. gtk3 support remains in place.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/opencv4/Config.in  |  9 ---------
>  package/opencv4/opencv4.mk | 14 ++++----------
>  2 files changed, 4 insertions(+), 19 deletions(-)
> 
> diff --git a/package/opencv4/Config.in b/package/opencv4/Config.in
> index f71ceba2c5..a553411e1a 100644
> --- a/package/opencv4/Config.in
> +++ b/package/opencv4/Config.in
> @@ -81,15 +81,6 @@ choice
>  config BR2_PACKAGE_OPENCV4_GUI_NONE
>         bool "none"
> 
> -config BR2_PACKAGE_OPENCV4_WITH_GTK
> -       bool "gtk2"
> -       depends on BR2_PACKAGE_LIBGTK2
> -
> -comment "gtk2 support needs libgtk2"
> -       depends on BR2_USE_MMU # libgtk2 -> glib2
> -       depends on BR2_TOOLCHAIN_HAS_SYNC_4
> -       depends on !BR2_PACKAGE_LIBGTK2
> -
>  config BR2_PACKAGE_OPENCV4_WITH_GTK3
>         bool "gtk3"
>         depends on BR2_PACKAGE_LIBGTK3
> diff --git a/package/opencv4/opencv4.mk b/package/opencv4/opencv4.mk
> index 01f70dfe49..d3df1a39f7 100644
> --- a/package/opencv4/opencv4.mk
> +++ b/package/opencv4/opencv4.mk
> @@ -211,6 +211,7 @@ OPENCV4_CONF_OPTS += \
>         -DWITH_GDAL=OFF \
>         -DWITH_GPHOTO2=OFF \
>         -DWITH_GSTREAMER_0_10=OFF \
> +       -DWITH_GTK_2_X=OFF \
>         -DWITH_LAPACK=OFF \
>         -DWITH_MATLAB=OFF \
>         -DWITH_OPENCL=OFF \
> @@ -316,18 +317,11 @@ else
>  OPENCV4_CONF_OPTS += -DWITH_GSTREAMER=OFF
>  endif
> 
> -ifeq ($(BR2_PACKAGE_OPENCV4_WITH_GTK)$(BR2_PACKAGE_OPENCV4_WITH_GTK3),)
> -OPENCV4_CONF_OPTS += -DWITH_GTK=OFF -DWITH_GTK_2_X=OFF
> -endif
> -
> -ifeq ($(BR2_PACKAGE_OPENCV4_WITH_GTK),y)
> -OPENCV4_CONF_OPTS += -DWITH_GTK=ON -DWITH_GTK_2_X=ON
> -OPENCV4_DEPENDENCIES += libgtk2
> -endif
> -
>  ifeq ($(BR2_PACKAGE_OPENCV4_WITH_GTK3),y)
> -OPENCV4_CONF_OPTS += -DWITH_GTK=ON -DWITH_GTK_2_X=OFF
> +OPENCV4_CONF_OPTS += -DWITH_GTK=ON
>  OPENCV4_DEPENDENCIES += libgtk3
> +else
> +OPENCV4_CONF_OPTS += -DWITH_GTK=OFF
>  endif
> 
>  ifeq ($(BR2_PACKAGE_OPENCV4_WITH_JPEG),y)
> --
> 2.51.0
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
