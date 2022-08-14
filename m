Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF7BAC25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 18:25:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B82040A97;
	Sun, 14 Aug 2022 18:25:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B82040A97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AS59KgT8XCYo; Sun, 14 Aug 2022 18:25:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6BCA840A8B;
	Sun, 14 Aug 2022 18:25:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6BCA840A8B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D8CA41BF3F2
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 18:25:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B35C960E27
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 18:25:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B35C960E27
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uK67foyhZUo7 for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 18:25:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C35A60AE0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8C35A60AE0
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 18:25:29 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id z16so6760507wrh.12
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 11:25:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=afUesncNhK9QsNDhquMak5+lZU03LrafS600x5DCltk=;
 b=ch+wqP2YTXBBDPNTkdW7QCg+eDOFSdjehc95EBLDxSlKUBcEVp/pPy6FXa6kdJQgrg
 z1iQMEndpN0V5JM9QXmtEjOqp9yfPTUIbe1cJ2mnjAxAkTv3TA4W+MhaZJn0mhvXy5U3
 B9H78+UlGpemgvN3QvIswO2gThGd4JydNaCEklhWwyeNDb+ZJdyeGuJvJevHqA0An/p4
 APdWmpKzCkKENJsLc9DYgpu+Q99O6UcEXXTbX582bTU2Lt6E7GU7xxfl04SIzRfA49Os
 Q8qU5h4nGC7jlNVQSvTX/7TMqavAMrb9HUjVoOD57NdL6JZxAF5/hi2nAwNg3V9Agsf8
 9YlQ==
X-Gm-Message-State: ACgBeo1nqFSUClW3kenIv/yzoVqby0SAC51cknOUwEjjV/JJLuqDKrQf
 bT1wua3VTgpSBu7n/bNI+X89NIzfxos=
X-Google-Smtp-Source: AA6agR4D/XL+GU3nEIVCr4YlK6soQ+AeyhbYtG++/V5YX4rgcdrRBHPRM02SWUo12H35MaUM7Ne8dQ==
X-Received: by 2002:a5d:64c1:0:b0:222:cdc3:2586 with SMTP id
 f1-20020a5d64c1000000b00222cdc32586mr6646621wri.600.1660501527524; 
 Sun, 14 Aug 2022 11:25:27 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b0007ba281157de2184.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:7ba:2811:57de:2184])
 by smtp.gmail.com with ESMTPSA id
 l23-20020a05600c2cd700b003a502c23f2asm7348298wmc.16.2022.08.14.11.25.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Aug 2022 11:25:27 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 20:25:20 +0200
Message-Id: <20220814182521.2877845-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=afUesncNhK9QsNDhquMak5+lZU03LrafS600x5DCltk=;
 b=fBRzNYXHI1jxYDg0+VRbISMCjS7RVE6WE2LRiU5tyoSEFYwue754Bug8UE+XB1a1+p
 xPAM0rLww8/QasXHZI2NluRk+4tIp9G/YG33p+/mV4LWzruK/kyR6WEn+zqGy9AbPpMT
 ownrVmRejkYZ6z10SJis2yhQlEMudHsy6WMVof3LZgiwoJ4OZdYyIuT/OWsZRCa94qsL
 l42lIHTsIjE/fmA2GGwnHvI0qNaAZko+ECuMFZ9QLSZU3tph0ffflfqkcsegWVcsn9jq
 WKels8ukVhP45edkd6RHed9cEA5Nif25QXQg86tRUd1fcW94s4QgQwJB6JvVpeoRmMTM
 HE1A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=fBRzNYXH
Subject: [Buildroot] [PATCH v2,
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
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Always mandate C++ instead of glibc

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
