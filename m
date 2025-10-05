Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83DD6CAC5B8
	for <buildroot@archiver.kernel.org>; Sun,  5 Oct 2025 11:38:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04B0960DB9;
	Sun,  5 Oct 2025 11:38:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZmO2BdVflGNn; Sun,  5 Oct 2025 11:38:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B10060DE9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B10060DE9;
	Sun,  5 Oct 2025 11:38:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 906D7272
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 11:38:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A03F40A3C
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 11:38:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Pz4eKeckd_U for <buildroot@buildroot.org>;
 Sun,  5 Oct 2025 11:38:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1BA9B40639
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1BA9B40639
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1BA9B40639
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 11:38:52 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1756008933; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 05 Oct 2025 11:38:49 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1v5N4i-00GX5t-3B;
 Sun, 05 Oct 2025 13:38:48 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun,  5 Oct 2025 13:38:46 +0200
Message-Id: <20251005113846.3940440-2-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251005113846.3940440-1-peter@korsgaard.com>
References: <20251005113846.3940440-1-peter@korsgaard.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=cC++BWghY4JFdD/r9J9d0DDHYyJDDXN78g+tDpyEvk9LN5IXOpSTgPzMstpRA6YXAHWv20MDkO78V65xDDIWN/R0LGrLgWzqabLK1otgYl4H+KjRLUCL59wn5qDo0eAGOsOexL0DiHn4aawagPV1Ix9mDxsMhZrq+kqV4Tt1j93AOjG8aPyunmuR8CZrGdSOWrU/Rn6W93YHwgMVlXQR1k1cPlXjdWj+Q1nGjN9Bi9DsMo4s/2tZc671tNE2wViSvDqzvTIvZLml5SFRn0lUbG6olB3tjVSQ1ZuFRg2VhS0cMXBg3HuvcmxdDJVK0soqBwaCYrHSEYhmDUYc6HI0DA==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=k2FZWMINRauUXyklHVNDivCnU2F4zNhZq+kGDJ2h5gI=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=cC++BWgh
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH 2/2] configs/beagleboneai: move to Linux 6.12.50
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

And adjust the dtb path to the new subdir after commit 724ba6751532 ("ARM:
dts: Move .dts files to vendor sub-directories") in v6.5.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/beagleboard/beagleboneai/patches/linux/linux.hash | 2 +-
 configs/beagleboneai_defconfig                          | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/beagleboard/beagleboneai/patches/linux/linux.hash b/board/beagleboard/beagleboneai/patches/linux/linux.hash
index ec1a3601b7..4ae61c9e4f 100644
--- a/board/beagleboard/beagleboneai/patches/linux/linux.hash
+++ b/board/beagleboard/beagleboneai/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  c52bc1ffc396c11bce335c9ee5cd55fe4213cbc1fb4026ff62bb90c864c61f62  linux-5.10.217.tar.xz
+sha256  c435bd74d1c21fc5a950781a50d78bae2b93944144694843359948ad3afc72a5  linux-6.12.50.tar.xz
diff --git a/configs/beagleboneai_defconfig b/configs/beagleboneai_defconfig
index 5d269a1825..bf6d73a525 100644
--- a/configs/beagleboneai_defconfig
+++ b/configs/beagleboneai_defconfig
@@ -1,6 +1,6 @@
 BR2_arm=y
 BR2_cortex_a15=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/beagleboard/beagleboneai/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_SYSTEM_DHCP="eth0"
@@ -9,10 +9,10 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beagleboard/beagleboneai/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.217"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.50"
 BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="am5729-beagleboneai"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/omap/am5729-beagleboneai"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
