Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53FACD58E4D
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 07:28:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 081E681418;
	Wed,  4 Mar 2026 07:28:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TbfrnTeBCQpe; Wed,  4 Mar 2026 07:28:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CF6F81400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772609290;
	bh=P0WAOqw506xogsCyJMA/LyABQw+6TqJWc/o6LaAb0qU=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ahmFY0brvhdSohWfObtO9nUFWdaRHcU6D5u4KQ3/TZzOcSiElXcnSOFfZ2gdhjJGg
	 0Bw+4W3/SzVTtEjAgpCF1GAo1UXX4bnkQihUilGvSzVvuZAeANt5hL2Zj8ehWmcYb3
	 vn4nVELxC2MlkmqPaxGzEpmd2oG1udjtMFG9WBlnukSv0N0bgl+NdrqpN2WhmWh6lU
	 3lZPfagQe89/RP35/EG1KL+7pv2W8syfkD4dUgF6yYU7U4uEEz4XnLAkyGxclcARsk
	 ZmF/6pKleH6mskGS6IgxkKuBXoKJIDTM8ihJg4EJzfy9Tc7m5Z+TUB5bDkIvJL1PNR
	 rNfvOdtQiWLvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CF6F81400;
	Wed,  4 Mar 2026 07:28:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D0CD1EB
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 07:28:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0EE614020A
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 07:28:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2I4oi3_8UrnM for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 07:28:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=115.124.30.132;
 helo=out30-132.freemail.mail.aliyun.com;
 envelope-from=cp0613@linux.alibaba.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CF72F40153
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF72F40153
Received: from out30-132.freemail.mail.aliyun.com
 (out30-132.freemail.mail.aliyun.com [115.124.30.132])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CF72F40153
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 07:28:03 +0000 (UTC)
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com
 fp:SMTPD_---0X-CXRRQ_1772609274 cluster:ay36) by smtp.aliyun-inc.com;
 Wed, 04 Mar 2026 15:27:54 +0800
From: cp0613@linux.alibaba.com
To: buildroot@buildroot.org
Cc: ju.o@free.fr,
	Chen Pei <cp0613@linux.alibaba.com>
Date: Wed,  4 Mar 2026 15:27:33 +0800
Message-ID: <20260304072733.1779-3-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304072733.1779-1-cp0613@linux.alibaba.com>
References: <20260304072733.1779-1-cp0613@linux.alibaba.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1772609277; h=From:To:Subject:Date:Message-ID:MIME-Version;
 bh=zfAu3lPxP+2PVNXXMB2O1YkAc/wn2OFbyJiT96utIiM=;
 b=YOLjLf3UqVVmd6LA3QaRCp3u8jvC2npzQp3zTsa0xJOeszl6R9GqlEtAs+MNiC+GYBJuYkgsrIqJhrq+PxGy8WNZaiZ9zkwzCuPOGYp/InSbxDFWKv593pCpa+k5pLszReS1ufYYlnolflc6ELjUU2S2SLJAm6DpeD2dKjMZrgA=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linux.alibaba.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com
 header.a=rsa-sha256 header.s=default header.b=YOLjLf3U
Subject: [Buildroot] [PATCH v2 2/2] DEVELOPERS: Add Chen Pei to iniparser
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

From: Chen Pei <cp0613@linux.alibaba.com>

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---
 DEVELOPERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2f4df82102..f347240ef2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -602,6 +602,9 @@ F:	package/alsa-plugins/
 N:	Changming Huang <jerry.huang@nxp.com>
 F:	package/qoriq-cadence-dp-firmware/
 
+N:	Chen Pei <cp0613@linux.alibaba.com>
+F:	package/iniparser/
+
 N:	Chris Packham <judge.packham@gmail.com>
 F:	package/coremark/
 F:	package/coremark-pro/
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
