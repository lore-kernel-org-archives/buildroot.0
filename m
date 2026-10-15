Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFBE3CC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:11:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7976661144;
	Fri, 16 Oct 2026 13:11:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I9ZbGHPL5nRT; Fri, 16 Oct 2026 13:11:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A0522610B0
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156279;
	b=pvTIvO/1bUvMLEqh21FuirMzXUR6IOOPdvhk55i3SO0HlIn9qdDotj/1UbklgrD/+nnE
	 o1+u3XlBQaOVdJ3x38da0hk0DTsRGNa3pOxtp9t5s5sPs4TWviviGi0EFoLLa5ynmaHoT
	 FaU0J6g1hz92hDmgeZfbysXmX0eTeZtbZxJpY8qidd44sm70rWWBNoAHHDL0Ahy10o2Yq
	 dPY38v+74Tvjh3gadULLX3E2qSkh7z6jCr5j7KRoMHi7lwmuckMKBHia0sRxfjVCoYMJH
	 t6bI/5GoSpEjj8qVWchZvVEBmjNNqPyatWWM+D86rTHY9J0uA05QizCUHvFYjHEn/fw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156279;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=6xozHPKKskjJ1vuBiiIcMo2b8/VrHjis5Bn2pBjbgFY=;
	b=ayRdLReHyVGQiGkCqvaXMXiUYHLXIfBX4HUpNZckiLBAfJE1Cr3X3r4W7NnkLeJWo4tF
	 aFg2Ielvh2+bs5n+3zrYmGVcrDTP+ARzM2EqllRB/AT8N7AGdXoX+dkd0djsInsBjb8iV
	 fwD/IX5u9pyN1RRPFxVHw7OVaplBF3s7ndR1FRkZxyvmm6d60rHyq05HGjKDHhTyPLuIl
	 Y/Q7aZRiWiYxcwmClahZRESkG+sleBP9jlNc8dL4tPwkdHjGrJw2b9cX7gCjMiJ3qApBJ
	 gAdSTabJZDxEV6Bua1nV/okRaQv4EdG+d0Kr6JXrso/2CIsVkOoEEMfiNkQRu8dgRMw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156279;
	bh=6xozHPKKskjJ1vuBiiIcMo2b8/VrHjis5Bn2pBjbgFY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=K9VYybJht1azLPnZrRd3aP1/vxmxl+4sag6+JcDnmx8o/jRfbT7bARm5ctGjZYKHM
	 E4tpWRI5dptoLaKlz8jEzrCS7a6erBvhpaX+b0tBXcQvUJvmKaKopIkUtYtaLLhE52
	 poKCrTOoHHPgeUBWqdqoAzjSSE86eHB+FDb4f0L9zO7kRezAOovrEAgz2HoJ6sF42J
	 iMZtTD1Ehl/lTE2upI7iB0mm6ALyS7hWS6fd9ffGMt/Tu4x5V7sWRhe30SFLfPaknF
	 VXp8XZRIUJmKZNwbEVkR0Kay/u38wod44D/kZQ8LPcrbPuawp67Wb/GKEgD2x4Yt8w
	 9k7pOAl92ykxQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0522610B0;
	Fri, 16 Oct 2026 13:11:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D72E920
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0044140042
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GnJUlF_8Kze6 for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:09:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org ABA814016B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156190;
 b=NrvJM3KPSzPqGdiwnZ5eEVHhKd6TfXh9gXGUMvSm0mKCJ1v0AtgQ0kI7xiFkm2Qoi1GF
 nMDEFcgZzXf+ajWmQt+eDeECctuQhIraLDtr/Asr5ZmgS7nWs5OZ1ugSUpIR+eLgwxY9R
 6wJuDA73V+EsfZyt9haO7dVaNJfCHHKkMPWwt9FwYNprjgsM2sH0VLg1yibDjz9H82k50
 zm/8MbybmY3GW3jxs6+uwy2P/3vNAsr037U4Dsly+3Q5gkBg7fnymgZqlYR7eMaF5G2Ck
 JfYONl6542H34w11i+iXfOW66eOYUxLDy8/j4FTfiWBSS6PqIyPCMDyqK/QW5pKairg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156190;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ErIlF8fPH1KkZIfkrzZ0OOs6B1phyJBM9gxrNlhnZj0=;
 b=soNh+ENO0OIau9p77TinJL5fGnupqmcAt9AsmPoiIX8FKfCvdC9qjGCK3HLxfQPuz/hY
 Eisgqa9ntNlsfPB1DwZP/ZnVLwrJ+PXCaPlhifHCbvCs9l0nRJgCExFE6OpOwAAvZjdzY
 IZr5aOm5422SYSnW5UoBogxoiszm0OcCAoJVHoukNxOaOEKdvTZokjrOolXDYRNMwrk0H
 CTEYo/eByQWseDn3iApybyIDWHjC9qSgPoIaSBCYnLFB7z5FVmWNVh8XgaBNYGVhL4qOE
 GVBthVwVibLi1VN39B19CFTGLuHeaD5mSYkCDrvm4NJWH75gY93GPf0ObtbW/cXcZOA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id ABA814016B
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9A8E2960D7; Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 13:17:17 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 3a55c7aba610a4f4df1199b436f1570505946655
X-Git-Newrev: 841cdc40172890bdc26b99f74b166324dd12d476
X-Patchwork-Hint: ignore
Message-Id: <20261016130829.9A8E2960D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/hwdata: bump
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5209784033978043318=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5209784033978043318==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/841cdc40172890bdc26b99f74b166324dd12d476
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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

--===============5209784033978043318==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5209784033978043318==--
