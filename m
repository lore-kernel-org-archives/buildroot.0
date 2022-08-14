Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F708C25B0E
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 18:25:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D891383ECC;
	Sun, 14 Aug 2022 18:25:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D891383ECC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YdaP1lOoecxl; Sun, 14 Aug 2022 18:25:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB9C183EC4;
	Sun, 14 Aug 2022 18:25:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB9C183EC4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1E0601BF3F2
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 18:25:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ED8F440A93
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 18:25:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED8F440A93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xVSYbMQq2nlG for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 18:25:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0155740A16
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0155740A16
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 18:25:31 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 k6-20020a05600c1c8600b003a54ecc62f6so2951147wms.5
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 11:25:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=7u6jejO535Y7qru7hyEfwnpa1MJCxqWwHhcmsNkIg+o=;
 b=QAvxaCXDoiEXpj6q36i4P8axPLISkgaheIob2dyCfP1IMHxxwCK82PLVRFRysjFZyq
 T55sGUHGnZjMHYj9ZcPdoIMrNIct+JZh/TLZWejikFmXOtsvZywqgGdQeBqPUxdzmlGP
 9D8e/9It5NkYdhl8C6N/tb3bL+EKSj3j91G2sfQk6gnLFSrk9P5UCafUrN92JwbEillv
 ubq1WmsGQx48+z5XvgxzXY2JFh8M4td/21BO+/VLmhvUQhKrsI9+vW58a6t/pSbprS7p
 Pq6Zu8jf0VXLQlPI7/5qgF1wpht2AjOGzqmkevj80isnipdI0Xk6NR3fTBy38mflVJIY
 YVJA==
X-Gm-Message-State: ACgBeo3HfftTUJgzcMgqmgFCwLIwJgHq4wUcxBZ7cTZPXsj6+/ZS2r6X
 VqJSy8F5XVZ0uY6lX/oYzP4UkQjm4yg=
X-Google-Smtp-Source: AA6agR4SlCnLfkLp28YOwms03WwyP5IjltwlB70aW1Qnno1lv2wNHw8hAAnJv13cYBUCx1JJ6Mf25g==
X-Received: by 2002:a05:600c:1993:b0:3a4:c0a9:5b6f with SMTP id
 t19-20020a05600c199300b003a4c0a95b6fmr8155933wmq.79.1660501529575; 
 Sun, 14 Aug 2022 11:25:29 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b0007ba281157de2184.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:7ba:2811:57de:2184])
 by smtp.gmail.com with ESMTPSA id
 l23-20020a05600c2cd700b003a502c23f2asm7348298wmc.16.2022.08.14.11.25.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Aug 2022 11:25:29 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 20:25:21 +0200
Message-Id: <20220814182521.2877845-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220814182521.2877845-1-fontaine.fabrice@gmail.com>
References: <20220814182521.2877845-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=7u6jejO535Y7qru7hyEfwnpa1MJCxqWwHhcmsNkIg+o=;
 b=UVPRQKdLlhxoZN1by2FtVnWXwBtjmbVFbC5kZ0ChjNRLyyQvo3HQqHplIKvTkwOg4Q
 ua6RBhvwuQe6PZEVC0urx3/S03EmryEcCDtDOQnau3xgJHXV+4m2+aAlb5U50WbT6EAM
 hYKuWx2+JeCiS1WsV3pRNI0taMMjOu/br9byzQsUW2Y6RcGFm87KDkCIJ8awCHUJ+CaK
 jMGZGEztMfPyfRG01AkNAXq14ez4ig6EUZVsxxWqFklShpgi89yCz7D+ebn/vhTwZ+YS
 L4Ty6Si2SHnSa0QrPk+VgLwu9X/Pf8NnAAgzYSX/VvBTQrkziML+kStoS9Odl+F78r6f
 0vtw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=UVPRQKdL
Subject: [Buildroot] [PATCH v2, 2/2] package/libvirt: fix libvirtd dependency
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

Commit 4dff1be05e90 (package/libvirt: libvirtd needs C++ for nmap-ncat)
introduce a recursive dependency (really: a circular dependency):

    package/busybox/Config.in:33:error: recursive dependency detected!
    package/busybox/Config.in:33:   symbol BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is selected by BR2_PACKAGE_EBTABLES_UTILS_SAVE
    package/ebtables/Config.in:11:  symbol BR2_PACKAGE_EBTABLES_UTILS_SAVE depends on BR2_PACKAGE_EBTABLES
    package/ebtables/Config.in:1:   symbol BR2_PACKAGE_EBTABLES is selected by BR2_PACKAGE_LIBVIRT_DAEMON
    package/libvirt/Config.in:44:   symbol BR2_PACKAGE_LIBVIRT_DAEMON depends on BR2_PACKAGE_NETCAT_OPENBSD
    package/netcat-openbsd/Config.in:1:     symbol BR2_PACKAGE_NETCAT_OPENBSD depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS

We can't drop the C++ dependency and switch the netcat-openbsd and
nmap-ncat dependencies conditions without adding a glibc dependency.

So always mandate C++ even if is only needed by nmap and not
netcat-openbsd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Always mandate C++ instead of glibc

 package/libvirt/Config.in | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/libvirt/Config.in b/package/libvirt/Config.in
index afd2372d0e..c404d1b0e2 100644
--- a/package/libvirt/Config.in
+++ b/package/libvirt/Config.in
@@ -38,7 +38,7 @@ if BR2_PACKAGE_LIBVIRT
 config BR2_PACKAGE_LIBVIRT_DAEMON
 	bool "libvirtd"
 	default y
-	depends on BR2_INSTALL_LIBSTDCPP || BR2_PACKAGE_NETCAT_OPENBSD # nmap
+	depends on BR2_INSTALL_LIBSTDCPP # nmap
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	select BR2_PACKAGE_DNSMASQ
 	select BR2_PACKAGE_EBTABLES
@@ -52,6 +52,9 @@ config BR2_PACKAGE_LIBVIRT_DAEMON
 	  Build the libvirt daemon (libvirtd) otherwise build only the
 	  utility programs.
 
+comment "libvirtd needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
+
 # Stateful drivers are useful only when building the daemon.
 if BR2_PACKAGE_LIBVIRT_DAEMON
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
