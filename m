Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D3B4C433F5
	for <buildroot@archiver.kernel.org>; Thu, 24 Mar 2022 20:42:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0F7A40979;
	Thu, 24 Mar 2022 20:42:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gaQjKST8_maz; Thu, 24 Mar 2022 20:42:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94E4F40250;
	Thu, 24 Mar 2022 20:42:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CDEDC1BF333
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 20:42:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA37C60B5E
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 20:42:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OQI1TNlsDhus for <buildroot@lists.busybox.net>;
 Thu, 24 Mar 2022 20:42:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7CCFF605C9
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 20:42:18 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id dr20so11539531ejc.6
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 13:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=hXwldYIaCy06ECQsXekkczFqm3+wGFrq+ddsDJfWfY4=;
 b=h9JK1146SXNB9nGiSBjNfXGDYu2PWd0dMh5dAjurYgVkbxr6s7UjoQKiqQWQSLXMwS
 AfdGP+5G5UFSstUtarpJFyAOEufgZ0tQvqG08UsDTy6YBfYMrHAuBzOPyQsH1Tdv7tPV
 OQC0TIIG5Z4asugycG7k10N55/0WlQD2wNgyecLyt2vJqYH0xecI3Nayey1QvFAzbJrH
 Y55xsfSydasEJrIg64aG9fGiZozDqZ5l8Ex/E5FY3y9lHev5HSb54WYFyGWHrTEh8TVq
 hQAjLTp+O2l919LpYVSbYVEw/hHS0MDY/ctMMYwzupY/gpBj0gnwcmzDBCURVzzafYP7
 mxEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=hXwldYIaCy06ECQsXekkczFqm3+wGFrq+ddsDJfWfY4=;
 b=k44rmZgajGLUy3XAwPLoaKS+iRHPQH7o3h+yIeRTyFBE7Oh/iJ5IvsLofAQA9KD9ys
 u8vQ2ozZz0pf9T1X5r3NKa6b6nLpIz1FTR9YJXJyLcgNPpfYmcChzoRpi54cnL1D6dvD
 1Vr6GTesmG6maKqS9kJ551OF5quPOkTpVKm987Xj+W1hglfj9vkYVOj+TnPanD0Xhc7E
 pXnBpbv8JUkSoPlwcF5aeb5NEmIc9if08ai0MXBbQ9nxKqcTbL7jaLP8Ip7UDER1sF+t
 kRqJ5WWg7jR5lwLAPIUARt79BcqVqB6Y+OKR6VCBbYgcqQzjrZJ/SQs8R+UMSbOmK/+8
 9ATw==
X-Gm-Message-State: AOAM531pXfw85GfQ6hNbuJW5xnNz7vwGwjK8imqy276xdPOVCswobQws
 bm4k+NRj4pX0JN8IKmJnR2g88OmtdsXXeA==
X-Google-Smtp-Source: ABdhPJyKcxueM5rhVipmTKxa832XEmzB1zliSknhEQRZgIi7Zzo4G2CF7+hwxkbt5scv13tGcme9Gg==
X-Received: by 2002:a17:907:9621:b0:6d7:355d:6da5 with SMTP id
 gb33-20020a170907962100b006d7355d6da5mr7810275ejc.195.1648154536720; 
 Thu, 24 Mar 2022 13:42:16 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 s20-20020a056402015400b00418f9574a36sm1900260edu.73.2022.03.24.13.42.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Mar 2022 13:42:16 -0700 (PDT)
Message-ID: <b0b87b2f-6787-2ca2-ae7e-8ac2453c87b6@mind.be>
Date: Thu, 24 Mar 2022 21:42:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220314181634.2155997-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220314181634.2155997-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/gstreamer1/gstd: bump to
 version 0.14.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/03/2022 19:16, James Hilliard wrote:
> Drop patches that are now upstream.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...d-check-user-xenv.sh-for-systemd-se.patch} |  0
>   ...treamer-check-1.0-unless-tests-are-e.patch | 33 ----------------
>   ...on-python-module-for-python-install.patch} |  0
>   ...tive-symlink-for-gstd-gst-client-exe.patch | 38 -------------------
>   package/gstreamer1/gstd/gstd.hash             |  2 +-
>   package/gstreamer1/gstd/gstd.mk               |  2 +-
>   6 files changed, 2 insertions(+), 73 deletions(-)
>   rename package/gstreamer1/gstd/{0004-Don-t-require-gstd-check-user-xenv.sh-for-systemd-se.patch => 0002-Don-t-require-gstd-check-user-xenv.sh-for-systemd-se.patch} (100%)
>   delete mode 100644 package/gstreamer1/gstd/0002-Don-t-require-gstreamer-check-1.0-unless-tests-are-e.patch
>   rename package/gstreamer1/gstd/{0005-Use-native-meson-python-module-for-python-install.patch => 0003-Use-native-meson-python-module-for-python-install.patch} (100%)
>   delete mode 100644 package/gstreamer1/gstd/0003-Use-relative-symlink-for-gstd-gst-client-exe.patch
> 
> diff --git a/package/gstreamer1/gstd/0004-Don-t-require-gstd-check-user-xenv.sh-for-systemd-se.patch b/package/gstreamer1/gstd/0002-Don-t-require-gstd-check-user-xenv.sh-for-systemd-se.patch
> similarity index 100%
> rename from package/gstreamer1/gstd/0004-Don-t-require-gstd-check-user-xenv.sh-for-systemd-se.patch
> rename to package/gstreamer1/gstd/0002-Don-t-require-gstd-check-user-xenv.sh-for-systemd-se.patch
> diff --git a/package/gstreamer1/gstd/0002-Don-t-require-gstreamer-check-1.0-unless-tests-are-e.patch b/package/gstreamer1/gstd/0002-Don-t-require-gstreamer-check-1.0-unless-tests-are-e.patch
> deleted file mode 100644
> index 495fbfc3fa..0000000000
> --- a/package/gstreamer1/gstd/0002-Don-t-require-gstreamer-check-1.0-unless-tests-are-e.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -From 586bb97459e72da30bd9991c228b6b8e9251c68b Mon Sep 17 00:00:00 2001
> -From: James Hilliard <james.hilliard1@gmail.com>
> -Date: Tue, 14 Sep 2021 01:49:49 -0600
> -Subject: [PATCH] Don't require gstreamer-check-1.0 unless tests are enabled.
> -
> -Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> -[Upstream status:
> -https://github.com/RidgeRun/gstd-1.x/pull/248]
> ----
> - meson.build | 4 +++-
> - 1 file changed, 3 insertions(+), 1 deletion(-)
> -
> -diff --git a/meson.build b/meson.build
> -index 1d9ce9d..76990a0 100644
> ---- a/meson.build
> -+++ b/meson.build
> -@@ -22,10 +22,12 @@ gio_unix_dep  = dependency('gio-unix-2.0',       version : '>=2.44.1')
> - json_glib_dep = dependency('json-glib-1.0',      version : '>=0.16.2')
> - libd_dep      = dependency('libdaemon',          version : '>=0.14')
> - jansson_dep   = dependency('jansson',            version : '>=2.7')
> --gst_check_dep = dependency('gstreamer-check-1.0',version : '>=1.0.5')
> - thread_dep    = dependency('threads')
> - libsoup_dep = dependency('libsoup-2.4',		       version : '>=2.4')
> -
> -+gst_check_required = get_option('enable-tests').enabled()
> -+gst_check_dep = dependency('gstreamer-check-1.0', required : gst_check_required, version : '>=1.0.5')
> -+
> - systemd_required = get_option('enable-systemd').enabled()
> - systemd_dep = dependency('systemd', required : systemd_required, version : '>=232')
> -
> ---
> -2.25.1
> -
> diff --git a/package/gstreamer1/gstd/0005-Use-native-meson-python-module-for-python-install.patch b/package/gstreamer1/gstd/0003-Use-native-meson-python-module-for-python-install.patch
> similarity index 100%
> rename from package/gstreamer1/gstd/0005-Use-native-meson-python-module-for-python-install.patch
> rename to package/gstreamer1/gstd/0003-Use-native-meson-python-module-for-python-install.patch
> diff --git a/package/gstreamer1/gstd/0003-Use-relative-symlink-for-gstd-gst-client-exe.patch b/package/gstreamer1/gstd/0003-Use-relative-symlink-for-gstd-gst-client-exe.patch
> deleted file mode 100644
> index 265ea8d8c3..0000000000
> --- a/package/gstreamer1/gstd/0003-Use-relative-symlink-for-gstd-gst-client-exe.patch
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -From a670beca8dcc76171dcfe3f10970d76c6f0439be Mon Sep 17 00:00:00 2001
> -From: James Hilliard <james.hilliard1@gmail.com>
> -Date: Tue, 14 Sep 2021 02:49:10 -0600
> -Subject: [PATCH] Use relative symlink for gstd/gst-client exe.
> -
> -This should fix the symlink path when cross compiling.
> -
> -Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> -[Upstream status:
> -https://github.com/RidgeRun/gstd-1.x/pull/249]
> ----
> - gst_client/gst_client_symbolic_link.sh | 2 +-
> - gstd/gstd_symbolic_link.sh             | 2 +-
> - 2 files changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/gst_client/gst_client_symbolic_link.sh b/gst_client/gst_client_symbolic_link.sh
> -index d8d7617..b87dd12 100755
> ---- a/gst_client/gst_client_symbolic_link.sh
> -+++ b/gst_client/gst_client_symbolic_link.sh
> -@@ -4,4 +4,4 @@
> - # $1: target
> - # $2: link name
> - rm -f ${DESTDIR}${MESON_INSTALL_PREFIX}/$2
> --ln -s ${DESTDIR}${MESON_INSTALL_PREFIX}/$1 ${DESTDIR}${MESON_INSTALL_PREFIX}/$2
> -+ln -s --relative ${DESTDIR}${MESON_INSTALL_PREFIX}/$1 ${DESTDIR}${MESON_INSTALL_PREFIX}/$2
> -diff --git a/gstd/gstd_symbolic_link.sh b/gstd/gstd_symbolic_link.sh
> -index d8d7617..b87dd12 100755
> ---- a/gstd/gstd_symbolic_link.sh
> -+++ b/gstd/gstd_symbolic_link.sh
> -@@ -4,4 +4,4 @@
> - # $1: target
> - # $2: link name
> - rm -f ${DESTDIR}${MESON_INSTALL_PREFIX}/$2
> --ln -s ${DESTDIR}${MESON_INSTALL_PREFIX}/$1 ${DESTDIR}${MESON_INSTALL_PREFIX}/$2
> -+ln -s --relative ${DESTDIR}${MESON_INSTALL_PREFIX}/$1 ${DESTDIR}${MESON_INSTALL_PREFIX}/$2
> ---
> -2.25.1
> -
> diff --git a/package/gstreamer1/gstd/gstd.hash b/package/gstreamer1/gstd/gstd.hash
> index 6ec84bd58d..20c821a27f 100644
> --- a/package/gstreamer1/gstd/gstd.hash
> +++ b/package/gstreamer1/gstd/gstd.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  94c10c798d3618b63cc68cbe053fabd19335a57f982a47b3d66c27c37d325da3  gstd-0.13.0.tar.gz
> +sha256  56afd58530b63d0d88dd818fd4e6c9230861819b3e131c6a87a46084c3f3fa96  gstd-0.14.0.tar.gz
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/gstreamer1/gstd/gstd.mk b/package/gstreamer1/gstd/gstd.mk
> index 959e277272..08a29f26ff 100644
> --- a/package/gstreamer1/gstd/gstd.mk
> +++ b/package/gstreamer1/gstd/gstd.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -GSTD_VERSION = 0.13.0
> +GSTD_VERSION = 0.14.0
>   GSTD_SITE = $(call github,RidgeRun,gstd-1.x,v$(GSTD_VERSION))
>   GSTD_LICENSE_FILES = COPYING
>   GSTD_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
