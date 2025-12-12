Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB11DD49204
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 11:51:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E4B440F5C;
	Fri, 12 Dec 2025 11:51:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id APDw0eT-te0T; Fri, 12 Dec 2025 11:51:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FD8A40F6D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765540260;
	bh=DkNptYFESGrAkKQ4I3CwyLTZie5zsIM5Dqtdt23CQcw=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=I41FOpXhYPvOuyMSZh0Z3q/ESEpxMR5SYCcFcacZwBvZ4iscfDZxGrd9QdMmVoArq
	 Wwl4NIjEMO8PoQ7gtfSBkkBw8LG6Kj+J4dtSrQXQh6Y0ix3g/+uI+3l2ce0f9mWpyP
	 +faUKMiw2OhG4gUlVbmXKFoyQ79B4fcdrB4eBt8N7hRKV8ERcmV3rbKnEw1lJT08fJ
	 kTJvA/YnJ4CfqCATOo7DM/1EwD+uoPtx9PrGg37AyWn1sQ9ad1bToGsTC0mKTfUNgw
	 AcNNbQphiaaD4er98DasPmNN5JybxMfNB8299kVaOou/2XBIYRuzpntmxjAL3XSjJx
	 0IxDxB9kR/Asw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FD8A40F6D;
	Fri, 12 Dec 2025 11:51:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EAD5A2C1
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 11:50:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD4E982016
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 11:50:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V6j20GbBgVkl for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 11:50:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.71;
 helo=smtpcmd0871.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A591281BD4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A591281BD4
Received: from smtpcmd0871.aruba.it (smtpcmd0871.aruba.it [62.149.156.71])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A591281BD4
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 11:50:55 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id U1fgvlppLZCONU1fgvtvfh; Fri, 12 Dec 2025 12:50:52 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Petr Vorel <petr.vorel@gmail.com>
Date: Fri, 12 Dec 2025 12:50:05 +0100
Message-ID: <20251212115005.4141423-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfJ9Ruq9jGqEzHTjnOUnNvvNzhNG+lm1VogQ1wxidWsR2Vto4z38xGwWxrpc2TluSQTh9JlifkcUPEnkRkZuj5K3QN2YlTwRp6cj5T8PcOnZ2ENB+ur7Q
 mfPZxf4nZS5uDD4GgUpKajxP3P9j3/p+VyHH3MyPfyzF+QEsPE3QPk6/j8hi2ANsUAeQk4Q8ukCJTHVp2DyObVTu3p0nvTirrs0FmN+v03x0w1BsaRjLGm0Y
 IC1T2EKvKpan5Oq8uIkCRUH+9LFiYv+4PsnOtL1zcNFkCitYH3D8akAx/yXff/R/nTxwvgh+M8/SodguDhcbzA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1765540252; bh=aEfMyqGneCBF0yPMcHl2FE2Cg6vKFQtnBayiFoW2GYI=;
 h=From:To:Subject:Date:MIME-Version;
 b=ehBMK/vlEl7Roi2ujp9TrbGNLpzSTrR7ppuXfvyt+KFak3+KSE7yIsuWG5kq9bGo/
 Nc1RKgmfy8y7N+KJqg0I/P83N0MPrU/08wSiVCeMggkSNw3Lu8MIz70KoYyFY2qE6c
 XnUnm6UO64MrfTSP7Z9lxYJwRTdJ+HfdVTdgm4L17Rbcu2AM/gIC+58F8ZqxqRRkRG
 TuGW6mGqzCpkOidZDzpbMZt+z5XNBPx6MiPvVd4K4PsXLkiBaUWcMm+DooLffoVrVK
 aBKCiTjPJnYAm26y/6GmjHuGZvZmivQjI6KuO9DKpIuxLu5hHBGAV5R7H1fXcqB94U
 BGh5SHkucgXcQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=ehBMK/vl
Subject: [Buildroot] [PATCH] pacakge/nfs-utils: fix build failure due to
 missing BR2_PACKAGE_LIBTIRPC_DB
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

Pacakge nfs-utils requires libtirpc rpcdb option, so let's select it by
default.

Fixes:
https://autobuild.buildroot.org/results/29adf2d04cf4c46e492af95edaa96983985d6b57/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/nfs-utils/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/nfs-utils/Config.in b/package/nfs-utils/Config.in
index 02cc7e78cc..3e13bf87a9 100644
--- a/package/nfs-utils/Config.in
+++ b/package/nfs-utils/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_NFS_UTILS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # getrandom()
 	select BR2_PACKAGE_LIBEVENT
 	select BR2_PACKAGE_LIBTIRPC # IPv6 requires libtirpc
+	select BR2_PACKAGE_LIBTIRPC_DB
 	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
