Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36168C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 08:40:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B536760ABE;
	Sun, 14 Aug 2022 08:40:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B536760ABE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8IABLDybmVKw; Sun, 14 Aug 2022 08:39:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32359607E3;
	Sun, 14 Aug 2022 08:39:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32359607E3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 65F801BF356
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 08:39:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E2F5410C1
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 08:39:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E2F5410C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6GqMMj4YzEpN for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 08:39:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2B4F410A5
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D2B4F410A5
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 08:39:54 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id b4so2678344wrn.4
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 01:39:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=8QD4tq3YmGy+cN6ksy5caX2jzGBPUhcKc7OD2Zkr+OY=;
 b=7p/3XHlBnpuGwjftWG9PrmwsC/y7F5IDUVLiixp4FplPNzWYNqAxLiGh4mG9oTsD/C
 7xFZId8OZ28b3TpMw9NlLlQlUS8KCTnp0ddt6rn7keX+EgHyXq4dbNqmvg6vYPtTWzPQ
 SQkS+IbwQykFCGa0Lfa8I5vXBf2dXKYPVNhH0/1EnI5GAYB+CNdfpCXpKI9zZNFzuejs
 QpvmEhIaAuNLbcXBrBbK8pKtuplwH8CH7x+YT/gxoCFDMjINwOyRWXu6Mek8j+hG/hSv
 wF9clOVm8oWPjUvIi075mavixSXe8LEd4Th49hFkwsi35g557NUxNRzukJeC36f2jW6u
 7qHg==
X-Gm-Message-State: ACgBeo0Z1odk2Nh4zo91F/QaouW8Pnj4oHOoxjhm2RCO623XTa5PdjA0
 4JlssQO0OTPVzuFygKF9vjE/MUO+lts=
X-Google-Smtp-Source: AA6agR6n+Ah1Revvju40qKRSF/HbYwyEsoBOtJBLg48SVFcoXzheyxFnWzf1stZx8vsqU26vetfWWA==
X-Received: by 2002:a5d:5a1a:0:b0:21f:a9b:62c6 with SMTP id
 bq26-20020a5d5a1a000000b0021f0a9b62c6mr5759887wrb.20.1660466392673; 
 Sun, 14 Aug 2022 01:39:52 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b00623e26afd6274afb.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:623e:26af:d627:4afb])
 by smtp.gmail.com with ESMTPSA id
 q65-20020a1c4344000000b003a327b98c0asm5619129wma.22.2022.08.14.01.39.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Aug 2022 01:39:52 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 10:39:49 +0200
Message-Id: <20220814083949.2781340-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=8QD4tq3YmGy+cN6ksy5caX2jzGBPUhcKc7OD2Zkr+OY=;
 b=lwIlufxQiSMuJXu8FZufthQrytFqJc2VkY8p9HmOB8+oJKiYC9V6eH/8t1HXBG3FCW
 imNLTAkdsLIC34wLg+gn5U2u5dm8x19qp/hr/xsjNtKeYSflA4wMIiy+Yen/ZuQBQPDb
 /Yf4fJ4ayZiR1pjjjBYbANAQ+1Nexpx17Yze2OtVzAmTtUTqQHcZlGLpW568jSp3s5nb
 7xu1tll4rGICi/7C2p9dsJ6ns0YUO5ZXLjaghduz63cyCZhMXer/6h/CJI0C6kVWHqkm
 VjdTD6tVoZcYlZ/Dm6kk6vJMhEtcRtxn5O+yZGhqcRDs5bmDHsSK2Uao9fqQd9yngvab
 388A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=lwIlufxQ
Subject: [Buildroot] [PATCH v2, 1/1] package/libvirt: fix libvirtd dependency
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

Add a dependency to BR2_TOOLCHAIN_USES_GLIBC to fix the following
libvirtd build failure raised since commit
f81242ae4fb64ab85af5d38e70246222276552ae:

Makefile:575: *** libbsd is in the dependency chain of netcat-openbsd that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.

BR2_TOOLCHAIN_USES_GLIBC is only needed by netcat-openbsd, but a
dependency on BR2_TOOLCHAIN_USES_GLIBC || !BR2_PACKAGE_NETCAT_OPENBSD
can't be added as it will create a circular dependency

An other option would be to revert
f81242ae4fb64ab85af5d38e70246222276552ae and to always mandate C++ even
if it is only needed by nmap-ncat

Fixes:
 - http://autobuild.buildroot.org/results/aada1d92df6cab0d01e27431b7b7483e3d165e79

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Yann E. Morin):
 - Fix patch (rebase on top of current master)

 package/libvirt/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libvirt/Config.in b/package/libvirt/Config.in
index 5a6b067a0d..f24647bb2d 100644
--- a/package/libvirt/Config.in
+++ b/package/libvirt/Config.in
@@ -38,6 +38,7 @@ if BR2_PACKAGE_LIBVIRT
 config BR2_PACKAGE_LIBVIRT_DAEMON
 	bool "libvirtd"
 	default y
+	depends on BR2_TOOLCHAIN_USES_GLIBC # netcat-openbsd
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	select BR2_PACKAGE_DNSMASQ
 	select BR2_PACKAGE_EBTABLES
@@ -50,6 +51,9 @@ config BR2_PACKAGE_LIBVIRT_DAEMON
 	  Build the libvirt daemon (libvirtd) otherwise build only the
 	  utility programs.
 
+comment "libvirtd needs a glibc toolchain"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
+
 # Stateful drivers are useful only when building the daemon.
 if BR2_PACKAGE_LIBVIRT_DAEMON
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
