Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D176C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 12:43:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8646C61050
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 12:43:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8646C61050
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A1CC60BD9;
	Sun, 12 Sep 2021 12:43:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HAFvSXDlOyOt; Sun, 12 Sep 2021 12:43:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6764B608B8;
	Sun, 12 Sep 2021 12:43:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 598561BF47A
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 12:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 55BA7826AA
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 12:43:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ld9hoyWKYI-O for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 12:43:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 26636825B1
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 12:43:10 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id t19so14564110ejr.8
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 05:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rLsR6DzqTFL6qbqxJWMjc6CM3upVINoDtk1Jvws82wM=;
 b=dgcBMvpuBK0e8H0rIo47oXxGNSdSo6ttsVYhU5dPGkDR+deTE3BtP8BfCS5A4wHP6j
 0yU4NWqbmXgE8JGMiITZSYFTbW8LOM3JvOR8I03wTC9IKSnd9u0HmWDPNAHNUY9svpXR
 0YR4Aw3plmZbfYX1jgZQOxRamEUXgn6H4FdMU5nqspXX+0XKE5GkP2lMDqwchbvFGIZQ
 Sex35U/nT65AN4L5oo4cfFP41kFctaWfTns3DcGmmcL7/m7qjSD+Efh+qWVCXtA2sWkG
 o2mw2FXoYgGuUpZoY4xPEL4S24iixKQqfefDlqhZz/R8GZrBDdg+poSKZfRFw5bU2BnN
 5yVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=rLsR6DzqTFL6qbqxJWMjc6CM3upVINoDtk1Jvws82wM=;
 b=NUPG0AWKwdBXAxvw5g/4QSp3HRHMLJEYofJK4itIkFkaaaxJlka4Gkne1rFn6MR6Bx
 m5uPhxCCbY0RlRI2263T/Sqg8rMzwx6bXzBJHvFzzEHnlTwhXH6cRU3Hyr4i+0/UfjK6
 6mXJjgTwn7y7tzRhTs2PZe/edQrH4ZxbnajRbfWeSHOs1qFm2K753oiO3ZHT0fttjJTs
 ASiEIECeHU2AezB6NgwOPigCJph72K7c/kfm/82mMB4MVRcdRNEIWhvecx3S7tAVJYon
 Kp+idKJ7BMXB7/L6EN7hzDcx9j3cV/H2leuaIlBIPPgOu3GtwuDkPBjyZAIb1k4/2bYC
 KsXA==
X-Gm-Message-State: AOAM530mStRHpaZ3FidqvuLXJgISD0tZV8Xb2W1whnqUqZzsgkXpJ9B4
 iTp8yohmDpjVjvjQL4T/SW1lbw==
X-Google-Smtp-Source: ABdhPJyo1OBfjeAPhQM3wYdGc/HY9OEi7WUwZqrJgTJ2E+xpEmRdk5DkfHsqshmsIhIrvc7odtP5cw==
X-Received: by 2002:a17:906:2696:: with SMTP id
 t22mr6912067ejc.184.1631450588376; 
 Sun, 12 Sep 2021 05:43:08 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id x15sm1990294ejv.95.2021.09.12.05.43.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Sep 2021 05:43:07 -0700 (PDT)
To: Jan Havran <havran.jan@email.cz>, buildroot@buildroot.org
References: <YTYx/iGrNt8WsbwS@arch-zen.localdomain>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <18db0716-acde-1275-7088-b57fca414231@mind.be>
Date: Sun, 12 Sep 2021 14:43:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YTYx/iGrNt8WsbwS@arch-zen.localdomain>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/bluez-tools: bump to version
 f65321736475429316f07ee94ec0deac8e46ec4a
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 06/09/2021 17:21, Jan Havran wrote:
> Minor fixes:
> - build with gcc 10 (drop patch)
> - correct the signal handler registration bt-agent
> 
> Other changes:
> - remove incorrectly handled error argument from device_* calls
> - add UUID for SIMAccess
> 
> Signed-off-by: Jan Havran <havran.jan@email.cz>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  .../bluez-tools/0001-fix-gcc-10-compile.patch | 46 -------------------
>  package/bluez-tools/bluez-tools.hash          |  2 +-
>  package/bluez-tools/bluez-tools.mk            |  2 +-
>  3 files changed, 2 insertions(+), 48 deletions(-)
>  delete mode 100644 package/bluez-tools/0001-fix-gcc-10-compile.patch
> 
> diff --git a/package/bluez-tools/0001-fix-gcc-10-compile.patch b/package/bluez-tools/0001-fix-gcc-10-compile.patch
> deleted file mode 100644
> index 028c2db69d..0000000000
> --- a/package/bluez-tools/0001-fix-gcc-10-compile.patch
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -From 687105d611b38961f390f0a328f9cfa3b93aeb18 Mon Sep 17 00:00:00 2001
> -From: Leigh Scott <leigh123linux@gmail.com>
> -Date: Tue, 28 Jan 2020 22:46:37 +0000
> -Subject: [PATCH] fix gcc-10 compile
> -
> -[Retrieved from:
> -https://github.com/khvzak/bluez-tools/pull/34/commits/687105d611b38961f390f0a328f9cfa3b93aeb18]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - src/lib/agent-helper.c | 2 ++
> - src/lib/agent-helper.h | 4 ++--
> - 2 files changed, 4 insertions(+), 2 deletions(-)
> -
> -diff --git a/src/lib/agent-helper.c b/src/lib/agent-helper.c
> -index bf50bcc..2b94100 100644
> ---- a/src/lib/agent-helper.c
> -+++ b/src/lib/agent-helper.c
> -@@ -33,6 +33,8 @@
> - 
> - #include "agent-helper.h"
> - 
> -+gboolean agent_need_unregister;
> -+
> - static const gchar *_bt_agent_introspect_xml = "<node name=\"/org/blueztools\">\n\t<interface name=\"org.bluez.Agent1\">\n\t\t<method name=\"Release\">\n\t\t</method>\n\t\t<method name=\"RequestPinCode\">\n\t\t\t<arg name=\"device\" direction=\"in\" type=\"o\"/>\n\t\t\t<arg name=\"pincode\" direction=\"out\" type=\"s\"/>\n\t\t</method>\n\t\t<method name=\"DisplayPinCode\">\n\t\t\t<arg name=\"device\" direction=\"in\" type=\"o\"/>\n\t\t\t<arg name=\"pincode\" direction=\"in\" type=\"s\"/>\n\t\t</method>\n\t\t<method name=\"RequestPasskey\">\n\t\t\t<arg name=\"device\" direction=\"in\" type=\"o\"/>\n\t\t\t<arg name=\"passkey\" direction=\"out\" type=\"u\"/>\n\t\t</method>\n\t\t<method name=\"DisplayPasskey\">\n\t\t\t<arg name=\"device\" direction=\"in\" type=\"o\"/>\n\t\t\t<arg name=\"passkey\" direction=\"in\" type=\"u\"/>\n\t\t\t<arg name=\"entered\" direction=\"in\" type=\"q\"/>\n\t\t</method>\n\t\t<method name=\"RequestConfirmation\">\n\t\t\t<arg name=\"device\" direction=\"in\
 " 
>  type=\"o\"/>\n\t\t\t<arg name=\"passkey\" direction=\"in\" type=\"u\"/>\n\t\t</method>\n\t\t<method name=\"RequestAuthorization\">\n\t\t\t<arg name=\"device\" direction=\"in\" type=\"o\"/>\n\t\t</method>\n\t\t<method name=\"AuthorizeService\">\n\t\t\t<arg name=\"device\" direction=\"in\" type=\"o\"/>\n\t\t\t<arg name=\"uuid\" direction=\"in\" type=\"s\"/>\n\t\t</method>\n\t\t<method name=\"Cancel\">\n\t\t</method>\n\t</interface>\n</node>\n";
> - static guint _bt_agent_registration_id = 0;
> - static GHashTable *_pin_hash_table = NULL;
> -diff --git a/src/lib/agent-helper.h b/src/lib/agent-helper.h
> -index 8e1cc85..9a952c4 100644
> ---- a/src/lib/agent-helper.h
> -+++ b/src/lib/agent-helper.h
> -@@ -35,7 +35,7 @@ extern "C" {
> - #define AGENT_DBUS_INTERFACE "org.bluez.Agent1"
> - #define AGENT_PATH "/org/blueztools"
> - 
> --gboolean agent_need_unregister;
> -+extern gboolean agent_need_unregister;
> - 
> - void register_agent_callbacks(gboolean interactive_console, GHashTable *pin_dictonary, gpointer main_loop_object, GError **error);
> - void unregister_agent_callbacks(GError **error);
> -@@ -44,4 +44,4 @@ void unregister_agent_callbacks(GError **error);
> - }
> - #endif
> - 
> --#endif /* __AGENT_HELPER_H */
> -\ No newline at end of file
> -+#endif /* __AGENT_HELPER_H */
> diff --git a/package/bluez-tools/bluez-tools.hash b/package/bluez-tools/bluez-tools.hash
> index 808e5c6061..f013f195cb 100644
> --- a/package/bluez-tools/bluez-tools.hash
> +++ b/package/bluez-tools/bluez-tools.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  62ca98af63d2ae142dbc77995c6bd4c259eaba4a5832daa33ae9e3d585b9205f  bluez-tools-97efd293491ad7ec96a655665339908f2478b3d1.tar.gz
> +sha256  dd5acf9e501514f4ad1136af966d2723f3270e0e2fffd6d29da93fa76c9fafa3  bluez-tools-f65321736475429316f07ee94ec0deac8e46ec4a.tar.gz
>  sha256  b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
> diff --git a/package/bluez-tools/bluez-tools.mk b/package/bluez-tools/bluez-tools.mk
> index c58701981a..007235958b 100644
> --- a/package/bluez-tools/bluez-tools.mk
> +++ b/package/bluez-tools/bluez-tools.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -BLUEZ_TOOLS_VERSION = 97efd293491ad7ec96a655665339908f2478b3d1
> +BLUEZ_TOOLS_VERSION = f65321736475429316f07ee94ec0deac8e46ec4a
>  BLUEZ_TOOLS_SITE = $(call github,khvzak,bluez-tools,$(BLUEZ_TOOLS_VERSION))
>  
>  # sources fetched from github, no configure script)
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
