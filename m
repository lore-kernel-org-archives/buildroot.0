Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E58BCD4851
	for <buildroot@archiver.kernel.org>; Tue, 12 May 2026 14:53:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6721F40C0C;
	Tue, 12 May 2026 14:53:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sfjYsRrkp_6w; Tue, 12 May 2026 14:53:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95DFD40C1B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778597583;
	bh=eh3Wq9fevsh+eZ7dgGlDg693ejIYBHhj9Vx9l+GWUFQ=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OAQcsaM2LjfaKH0icNtRMlES3suuvo+UmdB4p2605nf/UpR6T63A+mypt6Q9M0CAX
	 RucUOKN+V94Oyglg7Xnjm+MHDxeYxfG5u817kDwHdpoffqxdflz3gPwQFDYtkkqp1u
	 NbN5ZrNtJ0M+D25EAmXQJqtiUkspd3AP2csA0yp4xftFh07QC9atKsT583yr/4FRfr
	 A2d031rC/9h6oPb4X9Plua4XYmijKcBv1A2S8Uv5uDQoQt7zv5E17ZhOX7d3g24kWV
	 TE/xaxpRBxpiQP5ewCZgZ624ydlZ6G71rVxjJjxrqvRLsnKojdhUdrkGpBjZyEr805
	 Dc4vNvHSI1sXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95DFD40C1B;
	Tue, 12 May 2026 14:53:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5CEDB15F
 for <buildroot@buildroot.org>; Tue, 12 May 2026 14:53:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E7A880C74
 for <buildroot@buildroot.org>; Tue, 12 May 2026 14:53:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XPO3YZf50jv7 for <buildroot@buildroot.org>;
 Tue, 12 May 2026 14:53:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4ADB880C71
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4ADB880C71
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4ADB880C71
 for <buildroot@buildroot.org>; Tue, 12 May 2026 14:53:01 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b10b.dip0.t-ipconnect.de [84.161.177.11])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C1FCCA4C09AF;
 Tue, 12 May 2026 16:52:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45106)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wMoSj-000000004ON-1VRH;
 Tue, 12 May 2026 14:51:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Antoine Tenart <atenart@kernel.org>,
 Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Tue, 12 May 2026 16:51:53 +0200
Message-ID: <20260512145156.320992-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260512145156.320992-1-bernd@kuhls.net>
References: <20260512145156.320992-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778597521;
 bh=O779yDiHF7rT8sxG86p/2v4SAuzOnpe6+l+xz38Cb6E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=QXVGQbDDonAB0fAxDDcKOoTiNAxoAW1kgaNtbLEF31K/WSLbyr2JWUGUpZu5iWxaF
 NdM+VQSW2bu0jVotsoJkx4xSS6jx7Wj0Qrz9lr3VQ2R/0X2SyCf4fRT4doRACuXSNx
 ZsXLxmSHu4+996Yid8aVMYzHg8RMq9pbycoJXQrBEt3vcx/4V5SSx5dtGhiieVPnQf
 xE2XdtfhtQn4UQoGWX045VMXbl1Q+Onw5P5SoAgI1oJ+yN4e70w753oJBfb7cMGUCK
 VikWP1AdDwCnFwZ/NSAOGLpDklEFZ2uhGanxSygyGh3lDVH3ROKfWKUwLwVdZyPUNE
 MjnY0pMHCILzw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=QXVGQbDD
Subject: [Buildroot] [PATCH/next 5/8] package/policycoreutils: bump version
 to 3.10
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/SELinuxProject/selinux/releases/tag/3.10

Added comment for license hash.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/policycoreutils/policycoreutils.hash | 4 +++-
 package/policycoreutils/policycoreutils.mk   | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/policycoreutils/policycoreutils.hash b/package/policycoreutils/policycoreutils.hash
index 7664be0b35..d3d6ee3399 100644
--- a/package/policycoreutils/policycoreutils.hash
+++ b/package/policycoreutils/policycoreutils.hash
@@ -1,3 +1,5 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  44a294139876cf4c7969cb6a75d1932cb42543d74a7661760ded44a20bf7ebe8  policycoreutils-3.9.tar.gz
+sha256  8dbd50d868acbfae9d1a972f6bbb2587f06c9ec73308d11af6acb3a401de9832  policycoreutils-3.10.tar.gz
+
+# Hash for license file
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  LICENSE
diff --git a/package/policycoreutils/policycoreutils.mk b/package/policycoreutils/policycoreutils.mk
index d0e1aae312..952bf5fade 100644
--- a/package/policycoreutils/policycoreutils.mk
+++ b/package/policycoreutils/policycoreutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POLICYCOREUTILS_VERSION = 3.9
+POLICYCOREUTILS_VERSION = 3.10
 POLICYCOREUTILS_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(POLICYCOREUTILS_VERSION)
 POLICYCOREUTILS_LICENSE = GPL-2.0
 POLICYCOREUTILS_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
