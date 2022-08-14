Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC6E0C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 18:28:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C6EE40A93;
	Sun, 14 Aug 2022 18:28:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C6EE40A93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 69lwX8v7hy1R; Sun, 14 Aug 2022 18:28:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C2CE40A83;
	Sun, 14 Aug 2022 18:28:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C2CE40A83
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 52F001BF3F2
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 18:28:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E86740A83
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 18:28:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E86740A83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oGFic7kB5KWz for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 18:28:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52E9840A16
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 52E9840A16
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 18:28:13 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id b4so3673188wrn.4
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 11:28:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=yMJj5d5xaQEsF/yIjrBUdzXLIHy6sscFk/Tykg8mGVI=;
 b=cW0DXc2BGeSTmCVgQUE0tqL62zmAuu0SOmJyTs0BC02CSLZ10FzJFOvZQbRN3Pw9Fg
 A4tb5a2pEA5VjioWxUZGFykKYiKlz0WsRRk6prWX7P7TvMHciiM6HlZCOTjSNOUhLf3R
 yRNcfT3wsRhEbO6PfPfV/dflRR3X+tec7ZU819Ot14k9C+aFrHVUPTfLBgPqudErC5K6
 y04yLkIyi7oGRobwY8Vr8f8/2Cm7QIplL5fgpvUSoKW1h15xprbFEZ0+Fjsx8p/1NTP9
 DItEyMwT9JiHRm85Eum7Dkna5LdvpVo+PWQl+I1pqbFgblkZ2BvAVplTK8ILniUVZqp6
 ecMA==
X-Gm-Message-State: ACgBeo0XGjTho/tFF/x4llfuqQIppLil/rpRgtXU/+Jofbo5o1w+b5sj
 FtovBSE9GEowB61eeSXy1lBqSOhDnwQ=
X-Google-Smtp-Source: AA6agR7OyKn10lByoUKBNZnn7z6HilIC9iEmvM/D6tsd1uirggmquOs3E3UpVFBMYUNUPKnwNg9BKg==
X-Received: by 2002:a5d:6da8:0:b0:223:60ee:6c33 with SMTP id
 u8-20020a5d6da8000000b0022360ee6c33mr6783181wrs.700.1660501691054; 
 Sun, 14 Aug 2022 11:28:11 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b0007ba281157de2184.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:7ba:2811:57de:2184])
 by smtp.gmail.com with ESMTPSA id
 r6-20020adff706000000b00224f7886c48sm3578140wrp.47.2022.08.14.11.28.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Aug 2022 11:28:10 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 20:27:34 +0200
Message-Id: <20220814182734.2878423-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220814182734.2878423-1-fontaine.fabrice@gmail.com>
References: <20220814182734.2878423-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=yMJj5d5xaQEsF/yIjrBUdzXLIHy6sscFk/Tykg8mGVI=;
 b=Cei23VG48lah9W5LnD/Dw2mMwX4S3BwZHyypVWqpqEzwkOzIO5Hr1jNh0OLFL2pZZ9
 N4hKuYS3D9o1BXnUGaYaKFGP++2QfIJQ4P/8rnvoVimjTXn36gqc+P7LTlNf/CbO6vVS
 p5x5Z9PENj4qzmA7JPr0zstxENaFuMw34y69sxEqrgwXJJryh/nldrPw9lo3RpeVeGjd
 dh80iGMYRSKvJ0A5enN+Eql47QGYai6JAC7Sv+qGJ7zZfhHx/V1I+8VRc1T4XuUhd2pD
 UG+BbNrQB/ajg7U/T/7/iuXeXmOH+hnxS1eq/ovV4FouKwVOtgWoWQfNQ5D8J8rFLNUg
 7GVw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Cei23VG4
Subject: [Buildroot] [PATCH v3, 2/2] package/libvirt: fix libvirtd dependency
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
Changes v2 -> v3 (after review of Thomas Petazzoni):
 - Always mandate C++ instead of glibc
 
Changes v1 -> v2 (after review of Yann E. Morin):
 - Fix patch (rebase on top of current master)

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
