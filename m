Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1151BFD0066
	for <buildroot@archiver.kernel.org>; Sun,  1 Mar 2026 14:00:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B912983F57;
	Sun,  1 Mar 2026 14:00:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bn0fJX8_lDpr; Sun,  1 Mar 2026 14:00:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A660983F5A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772373634;
	bh=NttSsr5mwLF55o49KPEswO0fk5mby5/UyMDL4gdTfWY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IUkshsRUR3uAdQ/atCwJkmlAD1I4IhZjMuplnjfHl27sSo5iyCqgASmN99XOCPjiN
	 ug3CMnP310Z7tp8Ox4fitlKwB7pRm9CYIoRVUxcFWi5C5XsspbZ4NuW/3UCaU3cfFK
	 4OL7N4l3PTc7CThDrF8wcE2SV0FxjabP8Xbg1NqOjEUJcMDNYOMvmEbo/gUCSYurGA
	 JFiuIsbaX33YpkViHJpFtZz7ultYWU84fU3jy5yewQ4SgngPos2jgOwfQ0S9QEUmSS
	 28MWAIAvdAdMt2BkfdGb1uSjTjOzadxV6vQJ8nqFYaYUcu3G2v3LMnufmExhdrb/uf
	 havs7DdvuVuwg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A660983F5A;
	Sun,  1 Mar 2026 14:00:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C8BA624E
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 14:00:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE4D3403CB
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 14:00:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7cetY6eQSOPz for <buildroot@buildroot.org>;
 Sun,  1 Mar 2026 14:00:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.149;
 helo=smtpdh19-2.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B68154007C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B68154007C
Received: from smtpdh19-2.aruba.it (smtpdh19-2.aruba.it [62.149.155.149])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B68154007C
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 14:00:28 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id whLOvekq4clBZwhLOvUNuY; Sun, 01 Mar 2026 15:00:26 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Petr Vorel <petr.vorel@gmail.com>
Date: Sun,  1 Mar 2026 15:00:24 +0100
Message-ID: <20260301140024.693061-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfEfQBSsGDCHLbgZ3QU+3/cMpUF6dnro1UEuBOGEFJY2uB13Pg0oeRARUO7PRhce/eh0LeBwwDDcHfwC0364it8LSfEFOSt3gRTftcCdrGhHj58ILH3Vu
 KrlTqz1iVkgr3g8DemOTCrwXLt7p4YDmwYIkdJRdXVXgNIp6LbhGLl3n/8e7etT+qGQwRSVhiD2UHg5XDbhdjbceMR63soyOs0N4E4fk7wVJpn+uzi/O7oi1
 jStXGYT20qXpnWKqaNAhn9grfS3/u5BgkkSHMIwRgI6/sfxmF5Dg0l3MmQbsyynIarZFLPSFXRLSpLKCeIGkLA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1772373626; bh=/CVQ/VDlop9s7yKUhWkonymZhU4Y4hUlnWbOvIrviP0=;
 h=From:To:Subject:Date:MIME-Version;
 b=kVenfFkVNtP4PPs1NboHm+P31tK4ATRromdRSzVsKZXqttmUv2navuQjf3Pysdfsc
 cM/km3UDaF1njHzL+vaevRd71AJSSaUw7T16TA4VH2AJxQo4XXE7bqKxgZBmssfzst
 jVKejwYIHLqteiF6O7hmoYVsdvgYy/4N7gQBfqgEV4U0zs30mdqZjiaa+r5L94Ev2/
 VbkrR2w9yI9yxrxd2Uxw0/gS8THw0HPbS8qW/w+RILIosms3KX8b1ShUHA7hEg/Sek
 XpfTArtTjjAhADVArfNuZi94lDYXQiGGDFAXR6ZY/h4E7KUbC/rE5Ozu/fSLQohQo9
 xkvkLKbJNKgxw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=kVenfFkV
Subject: [Buildroot] [PATCH v2] package/nfs-utils: bump version to 2.8.5
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

Release announce:
https://lore.kernel.org/linux-nfs/fdf3631f-e924-4e4c-bd9f-db5b40a90bfe@redhat.com/

With patch [1] option nfsv41 required to be renamed to blkmapd.

[1]: https://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=59e85671e59f7ccbf66dcf72ce7462bf4932cc78

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
---
V1->V2:
* renamed option nfsv41 to blkmapd as pointed by Petr Vorel
---
 package/nfs-utils/nfs-utils.hash | 4 ++--
 package/nfs-utils/nfs-utils.mk   | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/nfs-utils/nfs-utils.hash b/package/nfs-utils/nfs-utils.hash
index fb5c03d917..9aa9151ebb 100644
--- a/package/nfs-utils/nfs-utils.hash
+++ b/package/nfs-utils/nfs-utils.hash
@@ -1,4 +1,4 @@
-# From https://www.kernel.org/pub/linux/utils/nfs-utils/2.8.4/sha256sums.asc
-sha256  11c4cc598a434d7d340bad3e072a373ba1dcc2c49f855d44b202222b78ecdbf5  nfs-utils-2.8.4.tar.xz
+# From https://www.kernel.org/pub/linux/utils/nfs-utils/2.8.5/sha256sums.asc
+sha256  b13ca4a9df44186bdbe107514b22732d4243f785f95daf2fb86afc1edba15bbb  nfs-utils-2.8.5.tar.xz
 # Locally computed
 sha256  576540abf5e95029ad4ad90e32071385a5e95b2c30708c706116f3eb87b9a3de  COPYING
diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index e7d82b10ba..ba87ef813e 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NFS_UTILS_VERSION = 2.8.4
+NFS_UTILS_VERSION = 2.8.5
 NFS_UTILS_SOURCE = nfs-utils-$(NFS_UTILS_VERSION).tar.xz
 NFS_UTILS_SITE = https://www.kernel.org/pub/linux/utils/nfs-utils/$(NFS_UTILS_VERSION)
 NFS_UTILS_LICENSE = GPL-2.0+
@@ -28,7 +28,7 @@ HOST_NFS_UTILS_DEPENDENCIES = host-pkgconf host-libtirpc host-libevent host-sqli
 HOST_NFS_UTILS_CONF_OPTS = \
 	--enable-tirpc \
 	--disable-nfsv4 \
-	--disable-nfsv41 \
+	--disable-blkmapd \
 	--disable-gss \
 	--disable-uuid \
 	--disable-ipv6 \
@@ -50,10 +50,10 @@ NFS_UTILS_TARGETS_$(BR2_PACKAGE_NFS_UTILS_RPC_NFSD) += usr/sbin/exportfs \
 	usr/sbin/fsidd usr/lib/systemd/system/fsidd.service
 
 ifeq ($(BR2_PACKAGE_NFS_UTILS_NFSV4),y)
-NFS_UTILS_CONF_OPTS += --enable-nfsv4 --enable-nfsv41
+NFS_UTILS_CONF_OPTS += --enable-nfsv4 --enable-blkmapd
 NFS_UTILS_DEPENDENCIES += keyutils lvm2
 else
-NFS_UTILS_CONF_OPTS += --disable-nfsv4 --disable-nfsv41
+NFS_UTILS_CONF_OPTS += --disable-nfsv4 --disable-blkmapd
 endif
 
 ifeq ($(BR2_PACKAGE_NFS_UTILS_GSS),y)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
