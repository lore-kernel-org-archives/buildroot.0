Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93F9CC433EF
	for <buildroot@archiver.kernel.org>; Mon, 13 Dec 2021 22:11:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BE18403C7;
	Mon, 13 Dec 2021 22:11:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5u_YcqXkmYGO; Mon, 13 Dec 2021 22:11:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79044404A6;
	Mon, 13 Dec 2021 22:11:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E6D231BF297
 for <buildroot@lists.busybox.net>; Mon, 13 Dec 2021 22:11:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D5B6D81360
 for <buildroot@lists.busybox.net>; Mon, 13 Dec 2021 22:11:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Esz9lNoAk46 for <buildroot@lists.busybox.net>;
 Mon, 13 Dec 2021 22:11:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F27A881302
 for <buildroot@buildroot.org>; Mon, 13 Dec 2021 22:11:01 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 m25-20020a7bcb99000000b0033aa12cdd33so11673356wmi.1
 for <buildroot@buildroot.org>; Mon, 13 Dec 2021 14:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wn4GGAPtyxIsLm04ybtMTmsDPEeLCXB1FQIuNOMC0Bk=;
 b=lepK/fUOUoE+PjTZDlfft6+o7NmxxgZinsNORUYfMU6WEhq0SKjkN/fw3/oougTQwV
 fQC/bEXEcbD6onrRRfIF6BasCDD5puzKp/RI/8nzbvcSabezVE5tz8P1KicltjoWGDUa
 Z9QqNjoNTpAxK+p3c/VgxPSlt+FDMJyDNgHE4rLE4wl2sUO9vPSsmkE1mK9C8MXNcog2
 OzEyHe7WyA2VxT8IvNJnDIp0ahXPFNcpTTOapm/EKIrS7dmMxwoJ0+G15Ft6d9u3gDGx
 r432cfdO00hvj92YzCEh2g+znUc34DTsHU9qN6eMEhvmq61194gRpALbEgQYxUk7oLne
 5ZIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wn4GGAPtyxIsLm04ybtMTmsDPEeLCXB1FQIuNOMC0Bk=;
 b=kplskY6XXrVrH0gbttx4LoibbuEt74pOJNs+/1dxt3B431oja3umSWBEjV4bpGBIlK
 ALLlog5SHTgo89o4dB0K+WOtfqsFIef5VPT0dQQ2DPzok4kH4NXRlLCRO1LE/x/uIP4d
 i8axUwLwnb/bafSriBwYzyHxZ2izDmLkVo9rjiOZMFKeach7i3aQi98cLZjdDEQYxyfx
 Na8nPJ0EDACYHW4IWvw+wFJL8/7I3DKCRC79JVWPtIvZSjgbVPWbYxCmoo7JSn9jC9Ev
 Aj/cB0LO0hQw2GPMwEa3BSVhH9lVYYKqc2C01Dz2x/h2gTSmg3KtNI/VuevNEuzgS/hF
 KxBg==
X-Gm-Message-State: AOAM531Qmwc30MjfCdZA8dhO8UptTU1vEJNpW0n/wpgsOnHR1D+W/06a
 9T2jmYTXrDEO7lT3ugEfnZf8/k0MrtgeKQ==
X-Google-Smtp-Source: ABdhPJwGUVoMvF4Mc6Komx3dGwcud01hAmzQRMgNw0x8EAQa6pwKMdF65rJrp/j5oj+GCRu5r+SylA==
X-Received: by 2002:a7b:cd0b:: with SMTP id f11mr1833182wmj.3.1639433459937;
 Mon, 13 Dec 2021 14:10:59 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id a1sm9160935wru.113.2021.12.13.14.10.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 14:10:59 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 13 Dec 2021 23:10:34 +0100
Message-Id: <20211213221035.1779283-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/libvirt: fix libvirtd option
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Jared Bents <jared.bents@rockwellcollins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Replace libvirtd by driver_libvirtd to avoid the following build failure
raised since the addition of the package in commit
ccfc90e1010e42e6529afae3a5ea8bf7226dabc1:

../output-1/build/libvirt-7.7.0/meson.build:1:0: ERROR: Unknown options: "libvirtd"

Fixes:
 - http://autobuild.buildroot.org/results/3a20db6cb39c0d91213adbe82934274659df43e7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libvirt/libvirt.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libvirt/libvirt.mk b/package/libvirt/libvirt.mk
index 3118de4d58..9a4788c905 100644
--- a/package/libvirt/libvirt.mk
+++ b/package/libvirt/libvirt.mk
@@ -194,7 +194,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBVIRT_DAEMON),y)
 # Network is used by daemon, only
-LIBVIRT_CONF_OPTS += -Dlibvirtd=enabled -Ddriver_network=enabled
+LIBVIRT_CONF_OPTS += -Ddriver_libvirtd=enabled -Ddriver_network=enabled
 
 ifeq ($(BR2_PACKAGE_LIBSSH),y)
 LIBVIRT_CONF_OPTS += -Dlibssh=enabled
@@ -240,7 +240,7 @@ endif
 
 else # BR2_PACKAGE_LIBVIRT_DAEMON
 
-LIBVIRT_CONF_OPTS += -Dlibvirtd=disabled -Ddriver_network=disabled
+LIBVIRT_CONF_OPTS += -Ddriver_libvirtd=disabled -Ddriver_network=disabled
 
 endif
 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
