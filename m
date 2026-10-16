Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE217CC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E84E60801;
	Fri, 16 Oct 2026 13:08:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dWOnjVV0DdIp; Fri, 16 Oct 2026 13:08:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 061CF60A68
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156110;
	b=SN1SDJeqISn7OHIpMhXVCAsu8Yu0IX9NDclLdcKfEp7cS9WYPWGm7LYPRY4Qh6Rr4fX1
	 Obl+kKsF3S7k2yv5t8X/H2X96XV3/fCLDvH9NoJZ6bnlYHBN70AHlbHpoU1YfkGpJUrWB
	 2X9aSeZubKOgGO+BLirhYzhUXmSWet14q+Cw6rluzvj288HUS+MzOT+3SB0zYtu0x4t47
	 RTaWHDOQIYIUgIUHB/A93m0dnoP0xjNK5w7UNMBOs2XZTpGyk851QtaL0+/4Fqs+73+xG
	 RoisBHWvgqRxuU7mhQTHbx78lb7SbknEYaespAA2CJzlH69Fw2MlywVJhQt5hx65V7Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156110;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=neDGWGp2jxEe/4JPggtEk4vqQ6zTAiZRJP0GBALgCqA=;
	b=s20GNJF0O+vBtzoS3o6f8gDFbWsHO2F6utaPk5et8eo/6Mnl3ECxt6pTcofwscj+46O6
	 StEUYSI+0PNoRPbxNlFYJOhtg8wKzHPUlGezL/EtIGoNE0psoezPxyZcR8LTrPF00jjiA
	 3noXPPLhXe/IqwOeafOfTQ4a2Eb8GDcQTAf80wmxtlgU6tUTF6zdiM2LYHY/mIPT+vpVg
	 0Jdtf+QCgLiFd18JshryDjahglRuSn9N6xXmxLZMwJ7YzPsl7WaJ+D6jt5Q6lfFhU1333
	 fLtIzGrj+bwQSX3ZHFl4/82gRjrR3Zzo20QrpZRK/JG4xkCBv/1kvs8wcynOT0IcHLA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156110;
	bh=neDGWGp2jxEe/4JPggtEk4vqQ6zTAiZRJP0GBALgCqA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LB4Awd3Fq9UtLd8yHD8z8hRp/u6naUwH4IYOM1j3CGwjcy2UvHYEPY4ESdm0mDcxJ
	 vsbr/CPCkIersh61563vey0EZu1+t8bcEOF6z6QSchDd5uhi0GyI9N1siB1p0yKFng
	 o+BzHMgxU/Zj6fG0Yh+nMW84+LmDZ9LflKc+PlXlvctjIZih2Pv3CuftMKle04/sMK
	 AQhCDbZ4jN63pZYjAO8S+RtE4vovoYUxXvw9ioZ0tI0HbWBfljCEI6Loz7yh/lPP43
	 WnbA9WghLxFiT1sHEhOjICa++gJmuWSQ1idlQ6zkLT1sw0SBCzGuMDXDSQm71j6oOm
	 TeiAwd06Y0YGg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 061CF60A68;
	Fri, 16 Oct 2026 13:08:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C8D53769
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF3DF608C4
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VpruL4AJ7En3 for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org BFA91607CE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156106;
 b=Qqg4J0LeWelFoNTztRpZOQxQYGLxwjaAX51MNsD8Rlu8LYO04Czv63AARHtgSYH5laHq
 i7po7QTrub/bkCMYEWf/PvdkYSo8RK1Momk4XL9Mmogqhs+5RdzYsgl3luMo2C6HvYpoN
 cXzLsgoSy/6Wp6VdxnClvJ8dmeJaV8Fg4KFUDIDAqPigc3IRtIsrNPnChNxAfxTZDBvCg
 zqvAMhGy7lnGTu0YEYX28gRdZ5i82lvkawt4CIcBAlWDHvyqyYHBqw2ewLx4qjE/SEH0H
 YZyk+HTSOd9YiG4zyNSKAMyKOri57aqXKhuhgcS6Lvs5j2GBJhfM9lSa7cXKe7Q7pOA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156106;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=4zmye+gqYE9e09fwNtdd0oPwiCAb7A320N5GMcdB0c4=;
 b=CIcIWO4JuQQONFNrJUknUM2NIX00agwQ9Lb7qa1Kv0WhIu/6tEpzV1Qea/SjiNZKTQVU
 xaepefXAPWlpK8S8avLTY9jKX8EJD2fQi3J5xHpnKjNPTsUil31Vy2uwkCSKrGvk+DGsU
 RTlb402jRXBaK/WuXlzHDzdxPQw7B4jCtJ99RbxSLEVu6V+apKzMfS4qmjsmkzUNKfeeA
 Ur/8ctTg31sVm9KEtqzwUSLrZSgiAxALKaROxIjERZvuGMcb2DGcKG5r3J2tJdRiqdU9M
 hDQ1txIRrzSZr3FcirNryrETQgXAGgi4kjVeqkdLCJQgjD2hQL1crPq1WX1jSoDTT3w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BFA91607CE
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 897D3960D5; Fri, 16 Oct 2026 13:07:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:51 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 58f2e69d72c172aa7a943e0bc9b4febd875c5bbe
X-Git-Newrev: c3338ca728def2a45497c41346c57c0d275d4d04
X-Patchwork-Hint: ignore
Message-Id: <20261016130705.897D3960D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/hwdata: bump
 version to 0.411
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5282089043737353837=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5282089043737353837==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c3338ca728def2a45497c41346c57c0d275d4d04
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://github.com/vcrhonek/hwdata/releases/tag/v0.411
https://github.com/vcrhonek/hwdata/releases/tag/v0.410

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit e3c4a32d34bd70fbfba72f384d852d2603233c6c)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/hwdata/hwdata.hash | 2 +-
 package/hwdata/hwdata.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hwdata/hwdata.hash b/package/hwdata/hwdata.hash
index 74a7f5e7e7..0046b56c75 100644
--- a/package/hwdata/hwdata.hash
+++ b/package/hwdata/hwdata.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  23006accc0f931dd5187d0307a57d0744e2b8feb85e73c37bc0f5229fb31eadd  hwdata-0.409.tar.gz
+sha256  d75462181fbd307228e0a48b8d1449f1773ea4b1f17e8a1d56346907f999ce33  hwdata-0.411.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  21d0406f93e884a050426ebc21931839a45d56bfcbcbfdda7686d583f36f107f  LICENSE
diff --git a/package/hwdata/hwdata.mk b/package/hwdata/hwdata.mk
index 7300b908b1..20ecd799b8 100644
--- a/package/hwdata/hwdata.mk
+++ b/package/hwdata/hwdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HWDATA_VERSION = 0.409
+HWDATA_VERSION = 0.411
 HWDATA_SITE = $(call github,vcrhonek,hwdata,v$(HWDATA_VERSION))
 HWDATA_LICENSE = GPL-2.0+, BSD-3-Clause, XFree86 1.0
 HWDATA_LICENSE_FILES = COPYING LICENSE

--===============5282089043737353837==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5282089043737353837==--
