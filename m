Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30116CD37B0
	for <buildroot@archiver.kernel.org>; Mon, 18 Sep 2023 20:16:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB45C40169;
	Mon, 18 Sep 2023 20:16:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB45C40169
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h4qBhqk4VEkn; Mon, 18 Sep 2023 20:16:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DA5D941596;
	Mon, 18 Sep 2023 20:16:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA5D941596
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 12CDE1BF3D8
 for <buildroot@lists.busybox.net>; Mon, 18 Sep 2023 20:16:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E1627410E4
 for <buildroot@lists.busybox.net>; Mon, 18 Sep 2023 20:16:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1627410E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PKKp3mAZ8bP0 for <buildroot@lists.busybox.net>;
 Mon, 18 Sep 2023 20:16:28 +0000 (UTC)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A440D410D7
 for <buildroot@buildroot.org>; Mon, 18 Sep 2023 20:16:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A440D410D7
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-403012f27e1so52837635e9.1
 for <buildroot@buildroot.org>; Mon, 18 Sep 2023 13:16:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068186; x=1695672986;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DN8yLY+oerCW5s0TqEUICgxVR5ehER7HV61zO2U6gKs=;
 b=p36KUAKuNlrJCXpBL8HhGOiIEYymcmFgmSjwvyWSsQw8GKrTK/wHPzT0v4HgIJMCsn
 mXSmlpQhVAHHJrMn4OOGCrx5ow5bpy4bkNf3F+ltoYKSIbDbBL3f2cyBuu1kG/EzBYg/
 eyF2arzNK/rJ44mZ+6uD/T9aC2dzXyx98V4zSqKG+wJ7SSuPLh/EA2QYPzVfcbd1vkKL
 PMvgH5xgT7fusHyzcgT8JRYVHP9a5zHvakBhcyKhPwk+VIcNbOJND7MWcYRmlIf4QRoU
 nrSPgtU1yDtPB/Id5YKempVvthPqqIf+CTuqFZ7PIPGvvVwMdHoYRPdGuxSxSiUrCTpZ
 QW5g==
X-Gm-Message-State: AOJu0Yw6mqMFPl3J/d7ocvEMdqaZPclqJzC5/NQweBvFujTsaeYH5m4m
 Pk4bkbhpdyWPNxFyPKcAL1QvkirIyJc=
X-Google-Smtp-Source: AGHT+IEKaB+/dFisCVDcIa2RcBj95m1OcwgSlrHDOqJwlIXxigaDU+OcSJFhpzweUvRa2GLxFxo9VQ==
X-Received: by 2002:a05:600c:2804:b0:401:daf2:2735 with SMTP id
 m4-20020a05600c280400b00401daf22735mr8957092wmb.31.1695068186129; 
 Mon, 18 Sep 2023 13:16:26 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 t27-20020a05600c329b00b003fd2e898aa3sm57071wmp.0.2023.09.18.13.16.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:16:25 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 18 Sep 2023 22:16:23 +0200
Message-Id: <20230918201623.2639458-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068186; x=1695672986; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DN8yLY+oerCW5s0TqEUICgxVR5ehER7HV61zO2U6gKs=;
 b=NxCzG1wQRnminn6Rht7kpipPfdh/MBlXlEcvrHRw3zemgbZHlbJ35w4u6dBGFp5NaG
 noaTzaMpYSjTsP/qzIYIp10UwJ+OECr+0Q9YpYMUuVOKGceSQyX8Vxc8lEMDqyPKbUsx
 OLFU0HnySXflz7T5pOSv+sXeN7qaiCCT1MB1rmwVEqDpA9udRcvrecTzECsdiosSp5FK
 aOq+i4LFKzVpJcJ2HosRFdePNtHOXYpqDPxHkGuAvvHSMMXxkgG4r69aiPaNTNbXAfK+
 eXTB4e3HZHyAsqD7fv/bxRj+4IKU4VVj/JSE1Y0ryJDRf+FsMZp2Ix72O0XbGRKb/7QY
 oPuA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NxCzG1wQ
Subject: [Buildroot] [PATCH 1/1] package/agentpp: fix build with gcc 4.8
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with gcc 4.8 raised since bump of snmppp
to version 3.5.0 in commit e011fa0415883b9d44df616cfaf6956e1a11da88:

configure: error: Cannot find suitable libsnmp++ library

[...]

configure:9496: checking if libsnmp++ can be linked with flags from pkg-config
configure:9528: /home/buildroot/autobuild/run/instance-1/output-1/host/bin/arm-none-linux-gnueabi-g++ -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0 -D_FORTIFY_SOURCE=1 -pthread -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -D_XOPEN_SOURCE=XPG6  conftest.cpp -L/home/buildroot/autobuild/run/instance-1/output-1/host/bin/../arm-buildroot-linux-gnueabi/sysroot/usr/lib -lsnmp++ >&5
In file included from /home/buildroot/autobuild/run/instance-1/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/snmp_pp/snmp_pp.h:71:0,
                 from conftest.cpp:92:
/home/buildroot/autobuild/run/instance-1/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/snmp_pp/uxsnmp.h:628:35: error: 'nullptr' was not declared in this scope
      CSNMPMessage *snmp_message = nullptr);
                                   ^

Fixes:
 - http://autobuild.buildroot.org/results/f272473e7b588f5390b183072935a0217290ee4e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/agentpp/agentpp.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/agentpp/agentpp.mk b/package/agentpp/agentpp.mk
index 0ef549426e..7616d3eb0c 100644
--- a/package/agentpp/agentpp.mk
+++ b/package/agentpp/agentpp.mk
@@ -11,6 +11,7 @@ AGENTPP_LICENSE = Apache-2.0
 AGENTPP_LICENSE_FILES = LICENSE-2_0.txt
 AGENTPP_INSTALL_STAGING = YES
 AGENTPP_DEPENDENCIES = host-pkgconf snmppp
+AGENTPP_CONF_ENV = CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
 AGENTPP_CONF_OPTS += \
 	--disable-proxy \
 	--disable-forwarder \
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
