Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF06C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 18:28:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AEE8D60E51;
	Sun, 14 Aug 2022 18:28:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AEE8D60E51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TL6J1CgL6x9M; Sun, 14 Aug 2022 18:28:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0D8260E46;
	Sun, 14 Aug 2022 18:28:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0D8260E46
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A25051BF3F2
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 18:28:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8911C40271
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 18:28:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8911C40271
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WDQLRmBJNmpT for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 18:28:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 458F94026C
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 458F94026C
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 18:28:10 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id d5so670723wms.5
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 11:28:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=fdSsHzbdWoHC0wDDkxJUBFIRXzr2dhTIcveBea/aYA0=;
 b=Wdm0pDhtZFJ2+yxPPEh1Bf5gCitl4RQv3/8S14lN0tjAOOX5kiL9ESPHmMZ36esCrm
 pGLt4jtjPiPpfPWbpTUMIGO03p/HPn47w0yHq8Z0rlE1YoAhnZT8nJct/YkawZ8aNuAO
 0JoPjkK+ywOU0c1xYIrHTaA50Mtu1f0gzpoADHw/3kQACK0eEwXJgV+SajtC/RHJ2vjd
 8kh8ttrQ9pWQHFBtBDXafpliwHh/wAfkS0CY8FoXj+dEXonw78i3FCA+lDrs5FbQlyUq
 abZ8AcC19q0cfmSeSRq95ZY5+W2tciftnhT8rKixI9RqtYTUoRfmrR6u+p/3L4pTcEvz
 SotA==
X-Gm-Message-State: ACgBeo2es0IlAOI85UKjyTcJJWPfUwnZIeajUuqVLMRyoxqpUvCPuoIL
 dX5Xdu/v5bGwjCtvMUpxer4O7+ZrGhk=
X-Google-Smtp-Source: AA6agR5vJZ/iJbh7byz7OdPT7V4s29zDhN2f+jOzkHk+Bpkz198WnEdhVjJjsZS2j23oykxLGfTtOQ==
X-Received: by 2002:a05:600c:378c:b0:3a5:50ac:d802 with SMTP id
 o12-20020a05600c378c00b003a550acd802mr8178962wmr.112.1660501688211; 
 Sun, 14 Aug 2022 11:28:08 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b0007ba281157de2184.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:7ba:2811:57de:2184])
 by smtp.gmail.com with ESMTPSA id
 r6-20020adff706000000b00224f7886c48sm3578140wrp.47.2022.08.14.11.28.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Aug 2022 11:28:07 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 20:27:33 +0200
Message-Id: <20220814182734.2878423-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=fdSsHzbdWoHC0wDDkxJUBFIRXzr2dhTIcveBea/aYA0=;
 b=i/6XHZ/dqhcJZ9a91QOzaNDes5mizeLs1J9zwiyqg2ZUJPtU3h8QQfAOwsV8XWu80P
 PKJO3z24Hs2o3Yv5lsm4gS5VZqonubhoBKLjAgy5D9T054l2LrErbTzKn70i331xzqwK
 uWMsM0SPE6D8U9Go+YTIQNK8LUPyTYyquqLjq65jMAn4VDKziiYsXfW6C43X7e7o3GrN
 8i2wnSFKgqwrLgF4Mok3QFVCLp1MKzi0IUORn8KyR63ph595RSvhSfdWpvSSQFT+Mil5
 PxTItrOj5Ud3MJScUqYzYGZUa9KYBHKcfCTuZpy22SiqDwClNX5PNtluhub0SEcMAPze
 chwg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=i/6XHZ/d
Subject: [Buildroot] [PATCH v3,
 1/2] Revert "package/libvirtd: fix recursive dependency in Kconfig"
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

This reverts commit f81242ae4fb64ab85af5d38e70246222276552ae to avoid
the following build failure:

Makefile:575: *** libbsd is in the dependency chain of netcat-openbsd that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.

Fixes:
 - http://autobuild.buildroot.org/results/aada1d92df6cab0d01e27431b7b7483e3d165e79

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v2 -> v3 (after review of Thomas Petazzoni):
 - Always mandate C++ instead of glibc
 
Changes v1 -> v2 (after review of Yann E. Morin):
 - Fix patch (rebase on top of current master)

 package/libvirt/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/libvirt/Config.in b/package/libvirt/Config.in
index 5a6b067a0d..afd2372d0e 100644
--- a/package/libvirt/Config.in
+++ b/package/libvirt/Config.in
@@ -38,13 +38,15 @@ if BR2_PACKAGE_LIBVIRT
 config BR2_PACKAGE_LIBVIRT_DAEMON
 	bool "libvirtd"
 	default y
+	depends on BR2_INSTALL_LIBSTDCPP || BR2_PACKAGE_NETCAT_OPENBSD # nmap
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	select BR2_PACKAGE_DNSMASQ
 	select BR2_PACKAGE_EBTABLES
 	select BR2_PACKAGE_IPTABLES
 	select BR2_PACKAGE_IPROUTE2
 	# These are required because there is no way to unequivocally select a modern netcat
-	select BR2_PACKAGE_NETCAT_OPENBSD if !BR2_PACKAGE_NMAP_NCAT
+	select BR2_PACKAGE_NMAP      if !BR2_PACKAGE_NETCAT_OPENBSD
+	select BR2_PACKAGE_NMAP_NCAT if !BR2_PACKAGE_NETCAT_OPENBSD
 	select BR2_PACKAGE_RADVD
 	help
 	  Build the libvirt daemon (libvirtd) otherwise build only the
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
