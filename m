Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 964B4CCA47F
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 20:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4542861189;
	Mon,  6 Jun 2022 20:41:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rEG8wkuLHhys; Mon,  6 Jun 2022 20:41:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2753C61075;
	Mon,  6 Jun 2022 20:41:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B702F1BF297
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 20:39:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A584F82882
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 20:39:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WDtbuE8sS4xo for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 20:39:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5D95282861
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 20:39:44 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id s12so23999928ejx.3
 for <buildroot@buildroot.org>; Mon, 06 Jun 2022 13:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=pyCchZumwNXLtL1RyRpds+45JUTjkd4HutR9attyDHw=;
 b=NuupNwPdmRzrrr5hagasSspgBo3IQu4xK0H81fSUnQzb5tL8lEhWOGIHJSZYNDn055
 olnxSyTuxLCaTY7MXty3jl4mJ7SKVY/qTCSSiPjMsRhGpyalBDEOxPanfeETyjeFMlYy
 xycpK9qvKb2g2Es+YM0Ks/wkVoD5a2b4sG55ZBxdelR+TaoKmt8sJgqG+0CvwbWJuZyD
 F0BNZE6NJnKVNdiZx+nfFz1pT0246U5nnqLzcyyyW2gkHTf9IfQvN/Ef2PmbfTt5GtiQ
 hLRWPpaJ0Ymav2IOKdB6cuixlQ+d0rNuY9QfFYOQ9ZM6r5D6RH87mcfyc+mHf2ffQvYU
 HM2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=pyCchZumwNXLtL1RyRpds+45JUTjkd4HutR9attyDHw=;
 b=3NTmWDQKsdLeyidDqeCObSBMihbxzSpYp6x1od6NVMQWaWSXBESAEexDY9bAvuWrM5
 qZ+P14h/PmSsb8QLrDYmPXgMVXNiVkHWwxl8nhgYF1F9PPIOA1+Ish5URTTZau/om6IG
 WNgPN6R2RZaHqVkW3+q7Li8pUqEmmoTm/bsJKRcFAQw8tEl1zRA8ZLlw+TQMCFraojDu
 T7OXnUSHTwWFvf4NimwmdkJYwTXrfm3Fonlx4+Fw3Gx+YD9PNZk8QditHqvB8vbxi4Rk
 iUw0gtLALcfjmUyCOeRnfhwG7BDzmKYgsCIrMoMWumASB6Smp1wmY68F8KQgB/9NzjVD
 1WZA==
X-Gm-Message-State: AOAM533GCH2PZpVyM5yWxxyzq4ltuqxZoCmKaJH6NzaQRd7y6nTjdSE2
 9r/wKQP08AOmber45htcgjgybQ==
X-Google-Smtp-Source: ABdhPJy2rlDfHd41ovicaAvcks0aiJrf4muMI/0jHuFpdBJRHc/v8NdydihRC4PGkaNd6qh6DhFHhg==
X-Received: by 2002:a17:907:72c1:b0:6ff:c5f:6b7d with SMTP id
 du1-20020a17090772c100b006ff0c5f6b7dmr23514816ejc.676.1654547982540; 
 Mon, 06 Jun 2022 13:39:42 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a170906380900b00711d546f8a8sm1110431ejc.139.2022.06.06.13.39.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jun 2022 13:39:42 -0700 (PDT)
Message-ID: <ec13bac4-2e1b-8c45-366f-675f0ad06377@mind.be>
Date: Mon, 6 Jun 2022 22:37:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20220514175612.2510884-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220514175612.2510884-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH 01/19] package/x11r7/xserver_xorg-server:
 bump version to 21.1.3
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
Cc: Gary Bisson <bisson.gary@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jezz@sysmic.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/05/2022 19:55, Bernd Kuhls wrote:
> Release notes:
> https://lists.x.org/archives/xorg-announce/2022-January/003127.html
> 
> Removed patch which was applied upstream:
> https://gitlab.freedesktop.org/xorg/xserver/-/commit/9c66d910cae107cbcda02a8502ac5324a6eca052
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  This and the rest of the series applied to next, with the fixes as indicated 
in individual replies, thanks.

  Regards,
  Arnout

> ---
>   ...error-when-built-without-logind-plat.patch | 90 -------------------
>   .../xserver_xorg-server.hash                  |  6 +-
>   .../xserver_xorg-server.mk                    |  2 +-
>   3 files changed, 4 insertions(+), 94 deletions(-)
>   delete mode 100644 package/x11r7/xserver_xorg-server/0002-Fix-compilation-error-when-built-without-logind-plat.patch
> 
> diff --git a/package/x11r7/xserver_xorg-server/0002-Fix-compilation-error-when-built-without-logind-plat.patch b/package/x11r7/xserver_xorg-server/0002-Fix-compilation-error-when-built-without-logind-plat.patch
> deleted file mode 100644
> index 164c0039bd..0000000000
> --- a/package/x11r7/xserver_xorg-server/0002-Fix-compilation-error-when-built-without-logind-plat.patch
> +++ /dev/null
> @@ -1,90 +0,0 @@
> -From 17b6ab4d8cecf55a3784dbefbef9bfcf84ee3b1b Mon Sep 17 00:00:00 2001
> -From: Jocelyn Falempe <jfalempe@redhat.com>
> -Date: Thu, 16 Dec 2021 15:46:43 +0100
> -Subject: [PATCH] Fix compilation error when built without logind/platform bus
> -
> -This was introduced by commit 8eb1396d
> -
> -Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> -[Peter: from https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/827]
> -Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ----
> - hw/xfree86/common/xf86Events.c               |  9 +--------
> - hw/xfree86/os-support/linux/systemd-logind.c | 16 +++++++++++-----
> - include/systemd-logind.h                     |  4 ++--
> - 3 files changed, 14 insertions(+), 15 deletions(-)
> -
> -diff --git a/hw/xfree86/common/xf86Events.c b/hw/xfree86/common/xf86Events.c
> -index 6076efa80..395bbc7b3 100644
> ---- a/hw/xfree86/common/xf86Events.c
> -+++ b/hw/xfree86/common/xf86Events.c
> -@@ -383,14 +383,7 @@ xf86VTLeave(void)
> -         xf86GPUScreens[i]->LeaveVT(xf86GPUScreens[i]);
> -
> -     if (systemd_logind_controls_session()) {
> --        for (i = 0; i < xf86_num_platform_devices; i++) {
> --            if (xf86_platform_devices[i].flags & XF86_PDEV_SERVER_FD) {
> --                int major, minor;
> --                major = xf86_platform_odev_attributes(i)->major;
> --                minor = xf86_platform_odev_attributes(i)->minor;
> --                systemd_logind_drop_master(major, minor);
> --            }
> --        }
> -+        systemd_logind_drop_master();
> -     }
> -
> -     if (!xf86VTSwitchAway())
> -diff --git a/hw/xfree86/os-support/linux/systemd-logind.c b/hw/xfree86/os-support/linux/systemd-logind.c
> -index 35d5cc75b..f6a223a55 100644
> ---- a/hw/xfree86/os-support/linux/systemd-logind.c
> -+++ b/hw/xfree86/os-support/linux/systemd-logind.c
> -@@ -308,13 +308,19 @@ cleanup:
> -  * and ensure the drm_drop_master is done before
> -  * VT_RELDISP when switching VT
> -  */
> --void systemd_logind_drop_master(int _major, int _minor)
> -+void systemd_logind_drop_master(void)
> - {
> --    struct systemd_logind_info *info = &logind_info;
> --    dbus_int32_t major = _major;
> --    dbus_int32_t minor = _minor;
> -+    int i;
> -+    for (i = 0; i < xf86_num_platform_devices; i++) {
> -+        if (xf86_platform_devices[i].flags & XF86_PDEV_SERVER_FD) {
> -+            dbus_int32_t major, minor;
> -+            struct systemd_logind_info *info = &logind_info;
> -
> --    systemd_logind_ack_pause(info, minor, major);
> -+            major = xf86_platform_odev_attributes(i)->major;
> -+            minor = xf86_platform_odev_attributes(i)->minor;
> -+            systemd_logind_ack_pause(info, minor, major);
> -+        }
> -+    }
> - }
> -
> - static DBusHandlerResult
> -diff --git a/include/systemd-logind.h b/include/systemd-logind.h
> -index a8af2b96d..5c04d0130 100644
> ---- a/include/systemd-logind.h
> -+++ b/include/systemd-logind.h
> -@@ -33,7 +33,7 @@ int systemd_logind_take_fd(int major, int minor, const char *path, Bool *paus);
> - void systemd_logind_release_fd(int major, int minor, int fd);
> - int systemd_logind_controls_session(void);
> - void systemd_logind_vtenter(void);
> --void systemd_logind_drop_master(int major, int minor);
> -+void systemd_logind_drop_master(void);
> - #else
> - #define systemd_logind_init()
> - #define systemd_logind_fini()
> -@@ -41,7 +41,7 @@ void systemd_logind_drop_master(int major, int minor);
> - #define systemd_logind_release_fd(major, minor, fd) close(fd)
> - #define systemd_logind_controls_session() 0
> - #define systemd_logind_vtenter()
> --#define systemd_logind_drop_master(major, minor)
> -+#define systemd_logind_drop_master()
> - #endif
> -
> - #endif
> ---
> -2.20.1
> -
> diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
> index 6008661db1..b5635b9afa 100644
> --- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
> +++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
> @@ -1,6 +1,6 @@
> -# From https://lists.x.org/archives/xorg-announce/2021-December/003125.html
> -sha256  c20bf46a9fe8e74bf4e75430637e58d49a02d806609dc161462bceb1ef7e8db0  xorg-server-21.1.2.tar.xz
> -sha512  6d7a0d29d5be09f80ed505c4d6ae964795127525a0ab73a4eab4f601788ab3627033143e5aeb4c2565c6683dd3402084d13acab5554606fbd519c4aec0a79def  xorg-server-21.1.2.tar.xz
> +# From https://lists.x.org/archives/xorg-announce/2022-January/003127.html
> +sha256  61d6aad5b6b47a116b960bd7f0cba4ee7e6da95d6bb0b127bde75d7d1acdebe5  xorg-server-21.1.3.tar.xz
> +sha512  cf5fed023eadda62ae732f8c4d427c272ebe005188341290f3d03147042c103b00cbb94d86a0256da815fb9b9a3da315c21a05ee0c926c1a2ff0c54ab0c0638b  xorg-server-21.1.3.tar.xz
>   
>   # Locally calculated
>   sha256  4cc0447a22635c7b2f1a93fec4aa94f1970fadeb72a063de006b51cf4963a06f  COPYING
> diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> index 0cadba92a3..0f1779dcab 100644
> --- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> +++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -XSERVER_XORG_SERVER_VERSION = 21.1.2
> +XSERVER_XORG_SERVER_VERSION = 21.1.3
>   XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.xz
>   XSERVER_XORG_SERVER_SITE = https://xorg.freedesktop.org/archive/individual/xserver
>   XSERVER_XORG_SERVER_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
