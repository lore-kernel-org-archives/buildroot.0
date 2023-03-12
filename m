Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFCF9C6FA99
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 22:02:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97F2A40360;
	Sun, 12 Mar 2023 22:02:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97F2A40360
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GXQceVpzemVt; Sun, 12 Mar 2023 22:02:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 890BE4032D;
	Sun, 12 Mar 2023 22:02:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 890BE4032D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B42011BF2CF
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 21:59:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8D08D41702
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 21:59:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D08D41702
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iZ9T6tkb9hpB for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 21:59:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EC2441C9D
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5EC2441C9D
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 21:59:56 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.174.98.73])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id AF7647802BE;
 Sun, 12 Mar 2023 22:59:51 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 12 Mar 2023 22:59:45 +0100
Message-Id: <20230312215945.168367-1-ju.o@free.fr>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230301220159.161476-2-ju.o@free.fr>
References: <20230301220159.161476-2-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1678658393;
 bh=zB6eeCCfhU4rSMybhk+FnqLwJQcfE1t5dzF3QBVdNIE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aGratDsSkPSVounKFdGnJeDhOuPAzeG8+QW5ToYq8gU7/F2sAX5ILrES9Ej4YmgKp
 E8d8sEO/ZpocdRBbZbda7+VMInXeiorcW4hgyTx+scGJB6voOWFURxUO3+p48dGZsx
 dtZ/VFIPtKkTyZIDRCmu/8k9ZinBqmnMPP9Dk7CiJk9ORh4OiRTFpaYpbv7ngl5S1s
 FUeF0z6dw6hoYMD+Fh4uk+XRigtmUHNPRcQwkrQaYWiwL7ugUazjion8DRBjfQrc6S
 bUT0ha0aiq83EejQPG1xOuU4CpLf8PlobyeYMamUx//1jK9VNsS/QdaQY0e8gb3nrw
 Jmpi0IYfr/0jA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=aGratDsS
Subject: [Buildroot] [PATCH v2 1/1] package/kexec: add KEXEC_CPE_ID_{PRODUCT, VENDOR}
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:kexec-tools_project:kexec-tools is a valid CPE identifier
for this package:
https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Akexec-tools_project%3Akexec-tools

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Changes v1 -> v2:
- Add the missing "KEXEC_CPE_ID_PRODUCT = kexec-tools"
  as reported by Thomas.
---
 package/kexec/kexec.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/kexec/kexec.mk b/package/kexec/kexec.mk
index c1411f6ab7..562b09012b 100644
--- a/package/kexec/kexec.mk
+++ b/package/kexec/kexec.mk
@@ -9,6 +9,8 @@ KEXEC_SOURCE = kexec-tools-$(KEXEC_VERSION).tar.xz
 KEXEC_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kexec
 KEXEC_LICENSE = GPL-2.0
 KEXEC_LICENSE_FILES = COPYING
+KEXEC_CPE_ID_PRODUCT = kexec-tools
+KEXEC_CPE_ID_VENDOR = kexec-tools_project
 KEXEC_SELINUX_MODULES = kdump
 
 # Makefile expects $STRIP -o to work, so needed for !BR2_STRIP_strip
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
