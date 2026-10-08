Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4CC8CA6007
	for <buildroot@archiver.kernel.org>; Thu,  8 Oct 2026 13:23:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FA4840AA9;
	Thu,  8 Oct 2026 13:23:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mDWjQT_Wvebm; Thu,  8 Oct 2026 13:23:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6359940AB6
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791465826;
	b=q2xEKXxVqS4MKBcZyFJclzN1gsMAte8Tbjko/8xt3wIC5jbQkto0mBN3X4Wpjjy+cTJT
	 TvjdL/KPxb4TH2Gm2mQzD1IJ13Ievku13uTgxg90u+sUAG0BHmOkfIWWig3GbLfahmIgf
	 ZtJ9jH0VNrdgafd+IdacYX4+OF3FPnZxNY8QXb3uP9SrKnfC7MfW3HIX1dTFupYIFTvhL
	 Lrhh4QYDlRxi9jB6Naa3BbrbKl+0MuJMGQrkcM4aef47MqLZfqbUyt0cQUh9j+WeYyLZW
	 +sb3JBmpgLqLFyzzZa34OVAdgo+Hgya2xTDmWW+JLl4eDuUH3HfGFn2D/3ameY4GlAQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791465826;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-CMAE-Envelope:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=LbPqsh7eHOjrZuIPciyRizkESwg9Ea/RYnkVDRZtPZc=;
	b=aYzYplfrsPv6METLzm/D3glKWrcd5EBVevdjlz/3IEOg7js/M+J8EXfKjrVaX36uom/b
	 VZVP2sfFLvg+yNyMhOWh0uLxcwRRIErmLR9rc7LxfSA/3ozz6azZxuhKmha8T4u7TWnhP
	 129nn00gqCmjox8JWQnR5OAM7lnkLEjvIXg249a8VPruKuAPB39LPXbRDqcgXQ53MnyaU
	 lZKb0pdZhHPk6z3x3cxMDIWd/T/3HZj0L+9zs9YA7aLIba77SzhNGBOLyQvVE2oWVK5ss
	 rIZPx+iBbtXR4gITSFOipvCooCZpM6zG7xd8nkqdBWhICbKV4lZ3LK3VYEIxzt6gteA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=benettiengineering.com;
	dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=Uxbm1Oa3;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791465826;
	bh=LbPqsh7eHOjrZuIPciyRizkESwg9Ea/RYnkVDRZtPZc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kY4g6tdcoSXc9vsEI0ITXbF8Q3jsHkGhn2kcWEd147eqmFunBKosYYpwFinKGcR48
	 KJN/teRyYEMmWENplCaS+7Aq5wGqV7Z1xr/YYI7FR1V+cyQosc/9ReQGkaiuJJ0vji
	 2OfM/fbXHaAo6p4899NXhushBoV7rA54fI/3vIZSRDYM5ci00YHLZ1YrhuL3AhtRO3
	 i+JLbMvrSbjbDZp9vFiygwW1y3Kjdkal4aLwqn6PEr9Y3mGSOmq5NNCrF+ogwrQgHe
	 Yq3rAHUe+806cjASgmWviIeDDIMLKqdARhO7qgzyGxrTi2Qit71IdD+EFL++N2Apn7
	 yvhjulksRFTXw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6359940AB6;
	Thu,  8 Oct 2026 13:23:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BD82D34E
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 13:23:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A38D940AB6
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 13:23:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8kxm5334_9mU for <buildroot@buildroot.org>;
 Thu,  8 Oct 2026 13:23:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 364E440AA9
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=62.149.156.102
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791465823;
 b=XcZYjK03Atr8APjNlpZv4IkIV23vSqutHdFUio40UmnvuWvi3kfGKoO5EQkhuIO9np8u
 04gQEP5viYgVhSk06EVNlpOyHxzEExVzyquE6tPJ+Pg2pgFHnwGFFdIN3DqFiQC+KccZE
 zNUnFrUVC/mQXzP5CLssgarp3nMIYq/Pm2CMRERZS611ryCq2bfU+MIlApCLAPQCRa/4p
 VEFj2uB3WWicmQ5KMe00d1oETQxEg7Mw0auDHzX8mIrtB67rnB7VYX+cTfSCV6QjJbocE
 5YM/X4fsMmLW1GyerP9vUy5HAk7oBDK1pWl5Fc2tzdHo8FGW0DAIfd3IhxuITQXhKjw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791465823;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-CMAE-Envelope;
 bh=5tmwUXHN6FnEQWW9nMcZr73FJupOWw9M0Pk53XXtaO4=;
 b=mbju+r7bGaKaQIsuocYWxJUbrwpNpQHn/R8ewogQYvc0LYEPGRfYvYME7m2Bw6roSzVP
 UJDhoig8ejMRbrGxC7zEW81DVLNVZYyLdyQQRApuJTaUqti3b1wfBqf7XWVsSj/MjiNuP
 lXeZuw8ig/jqCiSKQvBtjCV8TKbUMT5KuaOl3Ww3K+ojpvPGdwTs1czClui/5rFHkGaqQ
 OoydFMMagly+g3tXQNZcu3pBGsL9JnXz1RJORHI+O7KQtZikVZJWySIv3rgeyLN/iDzWk
 3MRb9r6RX9WDmkA/QGAb12yZReYbE05y5HUB2I/+aZUArp3nCXiTCQ25PsjXfY4azoQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=benettiengineering.com; 
 dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1
 header.b=Uxbm1Oa3; 
 arc=none smtp.remote-ip=62.149.156.102
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.102;
 helo=smtpcmd10102.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=Uxbm1Oa3
Received: from smtpcmd10102.aruba.it (smtpcmd10102.aruba.it [62.149.156.102])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 364E440AA9
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 13:23:41 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id Eo5xxnFCVN2P6Eo5yxx7x3; Thu, 08 Oct 2026 15:23:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1791465818; bh=0wuOJATCUqzj10mIFq/fxFHGI1xmsadyd0kaWWte9mY=;
 h=From:To:Subject:Date:MIME-Version;
 b=Uxbm1Oa34BL5B6LI+BGKN8kRu3zT6INUW632KvXv4S5csqTxb+KYmAhalJhfvups7
 5Y6w7NEEG7LgiVcYLuycSqPWvjfcEZUQmSvTNdZuCPtmrmFxtDWejQnv0FqCpFWTO3
 Ac8AfSrz1E3ttvScjvdbqjp2/9Wa90gO7gRCgDARMSYugqivvcw5GRzwuJh7OkKiL/
 fIe9kxop8Zg3UnegKLesEyASU19m2bklCud3f8y+WiyZDv5C2fkg6oob7pV/JGdQ/+
 cvMRjMCco6yu3TtcP9IO711yPwF0ZPbz4FtywrGTFIaci/AedDXs8Ef/qbWYVw76k8
 NmclUbwb8ozbw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Joseph Kogut <joseph.kogut@gmail.com>
Date: Thu,  8 Oct 2026 15:23:36 +0200
Message-ID: <20261008132337.3883254-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfPlWFJ7CnRqXcoPPv01fUtxZAGrvsuH7gseOT+XRDRrp3xWNSPae5Fyc95leV3fY+KmDSLwTWbuL0vPncZJrPCBqvMM2fWN7GMES3Tpdc0xgteANkJVv
 WqJ0KfvyoFAC7drtFAgIxeOkwcs3GsmGX39bvS1zQ5dWSNPvUTNGyYhSKzdS454m3jJCWfZjdPyfY7pXP0jiAkHSTfG9fjLAXGAXigwOAFOLuFDMUMBywp0g
 Lc165UlIn9miiNDabmXOqv7OiAMRrmMWELwqeSyvBEVO+NTy1RizhkJBxg3XKmnAtT11ZM9FoHXWDsHCh8OHiQ==
Subject: [Buildroot] [PATCH] package/libnss: bump version to 3.131
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

For release notes since 3.129, see:
https://hg-edge.mozilla.org/projects/nss/file/NSS_3_130_RTM/doc/src/releases/nss_3_130.md
https://hg-edge.mozilla.org/projects/nss/file/NSS_3_131_RTM/doc/src/releases/nss_3_131.md

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 1851b1e5fd..02bbcaf00d 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_129_RTM/src/SHA256SUMS
-sha256  38baa3b0a18a3f674843473b549753c96419a0151abd1e7a9b214ce0493d0785  nss-3.129.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_131_RTM/src/SHA256SUMS
+sha256  ca0005bc77e9255d9942103e6f9756cfe311a3df72afa99860709e386eb3c167  nss-3.131.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 42021503f7..6b4e68a624 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.129
+LIBNSS_VERSION = 3.131
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
