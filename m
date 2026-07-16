Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D138C43458
	for <buildroot@archiver.kernel.org>; Thu, 16 Jul 2026 05:34:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6822880DDD;
	Thu, 16 Jul 2026 05:34:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gv_1_h1v69q4; Thu, 16 Jul 2026 05:33:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E321980E33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784180039;
	bh=GtCcelpi5vVhewAU7oHv0HrgynuU6uh11Ja18CXk9nk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mU++MVCEQTrbbr8opTl+/RNkOmg6Qzu+6XiASNpa44rkJELCH/1qKlV44BQXA1J4B
	 IllMhj2k00cLtP64no3N18wYvWkZ4jjkV9xDj2m0PnCG/AegJyfmeN6aLlnWkJzIfp
	 3CTMt3jcGCpQtGNyXDXO2oyShjL/HJKGBRMIMY1oImcFB5JMns4VQTnIka3/CGJvir
	 lrrddVBtozz9GZqZtXOVYilV4nj3TCfbV4IoRYtq684fJr84tRZ39HOUM+HBB4dsx7
	 nw0tf9gr9879gl7JWoVT+EECQ7ginS+JZxc7IyWrZhZqECRBA+ZrrqLJJoVHwdWxtD
	 wEOMOC1O2cV1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E321980E33;
	Thu, 16 Jul 2026 05:33:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CE660320
 for <buildroot@buildroot.org>; Thu, 16 Jul 2026 05:33:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B405240820
 for <buildroot@buildroot.org>; Thu, 16 Jul 2026 05:33:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cOc3oM9aJ19t for <buildroot@buildroot.org>;
 Thu, 16 Jul 2026 05:33:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 15AA040755
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15AA040755
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 15AA040755
 for <buildroot@buildroot.org>; Thu, 16 Jul 2026 05:33:55 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b1ce.dip0.t-ipconnect.de [84.161.177.206])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DDE4DA4C39FC
 for <buildroot@buildroot.org>; Thu, 16 Jul 2026 07:33:51 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59512)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wkEjG-000000005Ib-2bOf
 for buildroot@buildroot.org; Thu, 16 Jul 2026 05:33:50 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 16 Jul 2026 07:33:50 +0200
Message-ID: <20260716053350.11727-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1784180031;
 bh=cUrxcBytwTwe8hAWd6r4Am40RolfEysSs+XtT5pOa4A=;
 h=From:To:Subject:Date:From;
 b=QnTHp5e/lMbyFOJS/FIHcbv8Rj6eca50OAH00igRqKmdqw5Ispzqfvlrkmo3DEe68
 IB8Y8ON/T9505PEGUusMa94fLdKmZpcnF3FMf9Hyqw8KVN48s6VSItrPq1swITZ2n4
 qhL2U/t23c8yDRa3xF7dXmFgvz5SDfMYHXYYAV5R2e7OnQVvbNK5kBIYcxAFrWWcSd
 cSBRuC4qPES+2AsRAq1IFQPNQpufeh4ItHzaWLthpCfQCWNMPs0Xti33u49LZlUMSa
 POy9RBRZMSK/bHFna6X0t1ygCamBDSBSkYgB7ayVDDel3xqMZslqSX8uu67dRJyXsM
 CAy1V5FmgGX6w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=QnTHp5e/
Subject: [Buildroot] [PATCH 1/1] package/ntfs-3g: security bump version to
 2026.7.7
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

https://github.com/tuxera/ntfs-3g/wiki/NTFS-3G-Release-History
https://seclists.org/oss-sec/2026/q3/152

  Multiple vulnerabilities have been discovered in ntfs-3g.
  A new version 2026.7.7 is now available at https://github.com/tuxera/ntfs-3g

    (ntfscat) Fix heap memory corruption when processing a corrupt or maliciously crafted filesystem. (CVE-2026-42616)
    Fix heap memory corruption when copying index data from root to an index block in a corrupt or maliciously crafted filesystem. (CVE-2026-42617)
    Fix single-byte heap buffer overflow when decompressing maliciously crafted compressed file data. (CVE-2026-42618)
    Fix heap buffer overflow when copying the tail data of an index block to a freshly allocated block. (CVE-2026-46569)
    Fix out-of-bounds read when processing symlink reparse data in a corrupt or maliciously crafted filesystem. (CVE-2026-46571)
    Fix heap memory corruption for maliciously crafted or corrupt index data descending to an out-of-bounds tree depth. (CVE-2026-46570)
    Fix heap buffer overflow for maliciously crafted or corrupt index data during a node split. (CVE-2026-46572)
    Fix heap buffer overflow when building inherited ACL data. (CVE-2026-56135)
    Fix out of bounds access when clearing an index root in maliciously crafted or corrupt index data. (CVE-2026-56136)

Switched to sha256 tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/e74561d67caed572396db1839ba0826405cfe43b

 package/ntfs-3g/ntfs-3g.hash | 3 ++-
 package/ntfs-3g/ntfs-3g.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/ntfs-3g/ntfs-3g.hash b/package/ntfs-3g/ntfs-3g.hash
index 3fcba6af4d..6c68f227a8 100644
--- a/package/ntfs-3g/ntfs-3g.hash
+++ b/package/ntfs-3g/ntfs-3g.hash
@@ -1,4 +1,5 @@
+# From https://github.com/tuxera/ntfs-3g/releases/tag/2026.7.7
+sha256  d67b769025d32860549d35c2147e45024d172f81c540d750390ce3602c059dab  ntfs-3g_ntfsprogs-2026.7.7.tgz
 # Locally calculated
-sha256  f20e36ee68074b845e3629e6bced4706ad053804cbaf062fbae60738f854170c  ntfs-3g_ntfsprogs-2022.10.3.tgz
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
 sha256  d7bf9d064ac3e5840f9dd02422b7eeec4f1fd03f37fadbd043602be5e882304f  COPYING.LIB
diff --git a/package/ntfs-3g/ntfs-3g.mk b/package/ntfs-3g/ntfs-3g.mk
index 62c515d50f..b44ad86290 100644
--- a/package/ntfs-3g/ntfs-3g.mk
+++ b/package/ntfs-3g/ntfs-3g.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NTFS_3G_VERSION = 2022.10.3
+NTFS_3G_VERSION = 2026.7.7
 NTFS_3G_SOURCE = ntfs-3g_ntfsprogs-$(NTFS_3G_VERSION).tgz
 NTFS_3G_SITE = http://tuxera.com/opensource
 NTFS_3G_CONF_OPTS = --disable-ldconfig
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
