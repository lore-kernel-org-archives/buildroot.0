Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7936EC44501
	for <buildroot@archiver.kernel.org>; Wed, 15 Jul 2026 17:20:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFB1E40560;
	Wed, 15 Jul 2026 17:20:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O3tNYUvCkdki; Wed, 15 Jul 2026 17:20:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB0554053D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784136056;
	bh=RQb+AwOjwtni0EuabVyADoN1k2i5VyOi/Gk1mtI21ew=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZA1pKt6O6rCqRoXNIGPZlhklh3Dtsrjccln4I136m/U0Zvk32Q9Cwp4x6LuW8nspu
	 0EDpMGrjjVk8qvDu4wc67/4UwTD06MrttrNOttTGlHbNZjMsGSSY7MscYxkifhpFxu
	 5Ou9G0XULSjnP2aF12cIqdJ3Jv1cVmXWDJuOs/CgoyyOFEbfJhXvXTI3siq68Y54Wm
	 1LTeqau/ZgWFl4KIMxiMQLIu/PdYKpnLhyfDls3uK5lBVtvmPTlxUnJ6hUYLcdc0Tf
	 nPcLx57w1OKnrR1E1eXi6u4p4gT76g02I4hpbcPWv3Vh1ZQ4zYfK/7l6t7oud1I1hV
	 Ic4/3xEe3d5uA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB0554053D;
	Wed, 15 Jul 2026 17:20:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B7C6203
 for <buildroot@buildroot.org>; Wed, 15 Jul 2026 17:20:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 18A0F40422
 for <buildroot@buildroot.org>; Wed, 15 Jul 2026 17:20:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q9yfLbzcrGdj for <buildroot@buildroot.org>;
 Wed, 15 Jul 2026 17:20:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 04C0D4053D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04C0D4053D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 04C0D4053D
 for <buildroot@buildroot.org>; Wed, 15 Jul 2026 17:20:53 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b1ce.dip0.t-ipconnect.de [84.161.177.206])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AA39CA4C39ED;
 Wed, 15 Jul 2026 19:20:50 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59556)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wk3Ht-000000004Eh-2S3N;
 Wed, 15 Jul 2026 17:20:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Jul 2026 19:20:49 +0200
Message-ID: <20260715172049.3529215-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1784136050;
 bh=M69A87iKT4caq8Zq6uu5PoF3zif7EEq9YgNWqA19LWE=;
 h=From:To:Cc:Subject:Date:From;
 b=Ubv26m2NPZc2cr+jtSgQ5B95qGMbnRon6Llpm5iPohkx4VROn0oLc0NT5KhClQU4G
 F83+SEv38gPGIfK8+WAuqP4gMvZqZZTwGN4ki64X8Rk9jyxAzzPl5oK1wpbL9rUCVN
 FU31dXkwelIsrGGXOrI2GkVigaAmWPxYk8PZOjfshm+E347RpGKvrPWlxwREg6hwVh
 n5I7tKYR7CethRsRiGHQcJlDB/d0YpoxwlvhT1UA8K3Ofqf+ROcCsL/267vLfKnpgr
 d8r9ecx05kb260kqhXjdUawMx5GxDM0bHC1Tcmm3iFQETZwbW72p0LfaRMdfEMq/kR
 qcSOZMsMYw2tQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=Ubv26m2N
Subject: [Buildroot] [PATCH 1/1] package/cifs-utils: bump version to 7.7
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

https://lists.samba.org/archive/samba-technical/2026-July/140952.html
https://lists.samba.org/archive/samba-technical/2026-June/140908.html

Version 7.5 was not announced separately:
https://wiki.samba.org/index.php/LinuxCIFS_utils
"December, 2025: Release 7.5
 - Various fixes for utilities"
https://git.samba.org/?p=cifs-utils.git;a=shortlog;h=refs/tags/cifs-utils-7.5

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/f4c1ddeaeb319d071c6aa7e1421256dfa8ce79b7
https://gitlab.com/bkuhls/buildroot/-/commits/29f4ea56c3af6f6ecf980eafcf2bda280946e9b4

 package/cifs-utils/cifs-utils.hash | 2 +-
 package/cifs-utils/cifs-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cifs-utils/cifs-utils.hash b/package/cifs-utils/cifs-utils.hash
index e6a5eefeaa..bc90ae98bf 100644
--- a/package/cifs-utils/cifs-utils.hash
+++ b/package/cifs-utils/cifs-utils.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  53353d05c30b4fc9dac006a8f0c5054cdd8a1834c176313c91e4694025c4b891  cifs-utils-7.4.tar.bz2
+sha256  2f8aae9aa5ddd73fbaf4d61e2e5e19ef54124cbf2810b626820050e7bd2f6606  cifs-utils-7.7.tar.bz2
 
 # Hash for license file:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/cifs-utils/cifs-utils.mk b/package/cifs-utils/cifs-utils.mk
index 58ac594b20..7ff3531117 100644
--- a/package/cifs-utils/cifs-utils.mk
+++ b/package/cifs-utils/cifs-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CIFS_UTILS_VERSION = 7.4
+CIFS_UTILS_VERSION = 7.7
 CIFS_UTILS_SOURCE = cifs-utils-$(CIFS_UTILS_VERSION).tar.bz2
 CIFS_UTILS_SITE = http://ftp.samba.org/pub/linux-cifs/cifs-utils
 CIFS_UTILS_LICENSE = GPL-3.0+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
