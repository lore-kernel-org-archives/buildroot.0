Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D72C982FA
	for <buildroot@archiver.kernel.org>; Tue, 22 Sep 2026 11:46:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54C01607A6;
	Tue, 22 Sep 2026 11:46:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n1KKtG8h5ag8; Tue, 22 Sep 2026 11:46:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 54CE9607A2
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790077606;
	b=R8TBayLT/lyIJQnWjgri4c/iBLwEOVh9Og75uPIM7dUZsFRfcLDa5jMvnvN5JrZwYWB5
	 AHbgWZx6Ao/Ckr3fiGz5tJBR9CleRtMm/tXiTn92DYwdu0vYsaA2qamgFrY4O2hiOXL/6
	 0Pah/G/xYlaZD/s82VqyY9c+UQtzzHDzTO6+0xtPfcEggnHSl/U32PiXdAvmTWIKzRGK/
	 UdyOytVFTQBAC26eSQp6H9KJBiwOu+v9JFYMVfLchtWavTSnq6UMP4XWyGkDcy34x5ejF
	 hQ2sGKtoXF4XdTOET9eWMzGdO6aIlldEzoNwijDxFoi5EFpU0LPUxQDO4GgyZp620bw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790077606;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Swyie8NiE/yPZZjeWQiqsDquz87QxuUesbek+Vp9oWI=;
	b=MGRBAo/OItr2DHyuHP5juipDFTaD6ParxNHf+lZxDrkzPJ5nqFN9V5/K79ulvLGuj5GN
	 YVQc8ncHfDkCipx6G5nLmbCePc/rxY6pVQSFcrj00KbHUHZoxe/7t7zc7kYTKR4c/nU6l
	 RCDHudJr2N4T2+ubmTLbywpUc8MI+vDxKAwRWfFzKONnvtey5MJJ6tRQFuYdK/9xXrrqZ
	 DR4lue1yP0WzHo12DYyvu0n1XUoqTJ83eWwHk2T6hI87L/LBtXwa6Z7AURD/6Z4NjL1uR
	 8Os5+i8TKfV450iPVCJiKydcptAep2SrjRRVD0zbjj4oN0X1hRBTmfuSQorCadLeR3w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790077606;
	bh=Swyie8NiE/yPZZjeWQiqsDquz87QxuUesbek+Vp9oWI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=c4r4M9J1YlYhHvzLsA7JJ8isR6oL4CbThDidPdVP1yAqaaHW4YTyaAemSHEJNWMUG
	 BJ3N/iYOOgLfHdlPq00/uEa3r3JuShDDrSV+0F6JQTociJmj6aB6AVHkWAbe06fGmL
	 uMhNS8nmRNdbHgk/6XvQLUJcOw1Z9FSwGW7dXQF40K3d1FMN/2VV8UXUvtlfMZbD0n
	 T2CrqkyUCTWkrKgpCbJRkMLi4bON68ONXPLkbG9R7OzXxDgWxctyfJME5DxjUYUnEs
	 fZxCvlFwF7fqFAfVg3lMSftVSCPJZmuIKpYMBQxLDqntwWLPVJ+O6XM87C8Wh6NTee
	 /yqcNxC/IbXAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54CE9607A2;
	Tue, 22 Sep 2026 11:46:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 92FC49D1
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 11:46:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 848D1407B7
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 11:46:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E3Nsa-yiTdOW for <buildroot@buildroot.org>;
 Tue, 22 Sep 2026 11:46:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7029740778
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790077604;
 b=OQ0Mj+MmRyEGUZyjujhJi5Zoyumtaoa7IuGI68xbF9yyJ5H/5R5Lb9aYqFtTAbD5IcML
 jGvGIKXCO5HisFdywYlpW3cH0MmobEoDO3odnYxjQcISLLBH2ndtLBffAgapfq2pgkfUR
 XUosVlZnE2gjOBjoKB6YnR+l8BHzBq6L46AHil4XJoUlb8kFR4ZBbj7sXTPXQA5RDUjBR
 1noyU+QfBDcl5tC73Nas8jhVZswaQkw6p0sXIoOORu/IyPb/S57blELAen9DPBshJKpKe
 Hx/6hfWS2Ztieb8IL3jYk/5GquOBvdTO946Pdt6yzbU0Yva757jYxEkTkGCRtfnRGBg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790077604;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=rL6rE7ntBv74vGt6CiLrqGrVVmB8ay6tNhcs6amPKaU=;
 b=X8onQqgLYKBH7nm9Y/8qTvFuOCeTa0K015bhTWZZoYp7pCgoGbdopHoWhL/+Zxu8oNKh
 NYkK6JI+epG//ESgAYaTUQpengXR9W0TxlVYlai6BwG9tKklxKvAnnt2vPMFWUHhqatN3
 zPtHtiX2QK14mKyVtore43yPT6lZdtIn3iiY0CYrQxRRo2gAQo/7vdFpz05M8/Ui4KAmT
 DvBoOXkU23tPhK/HERTaV96aOG+90qiWkIXpUOdt2ykOKQLqOQ3kcqY+VNuv0Um3i3t3L
 A6onpLgrgc9HxqSED3OLtjAsxzoZ5g/Uhyfp+Se24LnRzg/hWhGIoZXTpEFBICwogDQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=LkhbPGI4; 
 arc=none smtp.remote-ip=212.227.15.18
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7029740778
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 11:46:43 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N4hvR-1wjRj60tXD-013vI2; Tue, 22
 Sep 2026 13:46:31 +0200
To: buildroot@buildroot.org
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
Date: Tue, 22 Sep 2026 13:46:11 +0200
Message-ID: <20260922114613.805843-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922114613.805843-1-fiona.klute@gmx.de>
References: <20260922114613.805843-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:V2RUi3bpjjSYyOGo1NWnMPn3ItiO8PCQgvm7tCb8mW3TS8SB4tr
 7rdqbx6g7jCHB7XWtl+jNdaQF9Xhf7P+uJEuYmuTFErLFbU+qw1r5AD5O8nXImZRqDu3cUc
 VNyuXr1V08dQd/ZSsqY9wRN0x2priUk7Cc1Fg9qcXSVhI72Q7XfVCLdx3eDJuTpc/yHRGjt
 Mra8DHQpzDIZY7W6SvnIg==
UI-OutboundReport: notjunk:1;M01:P0:ghEaTX1xQAU=;ot703Dt8ldKfkNjFdJcab8agga2
 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
Subject: [Buildroot] [PATCH v3 2/4] package/tpm2-tss: enable host build
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>

Building host systemd with tpm2=enabled (to build systemd-measure)
requires tpm2-tss.

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
---
 package/tpm2-tss/tpm2-tss.mk | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/package/tpm2-tss/tpm2-tss.mk b/package/tpm2-tss/tpm2-tss.mk
index b9653ad33f..9bb3b9d677 100644
--- a/package/tpm2-tss/tpm2-tss.mk
+++ b/package/tpm2-tss/tpm2-tss.mk
@@ -50,4 +50,20 @@ define TPM2_TSS_USERS
 	tss -1 tss -1 * - - - tss user for tpm2
 endef
 
+HOST_TPM2_TSS_DEPENDENCIES = host-openssl host-pkgconf
+HOST_TPM2_TSS_CONF_OPTS = \
+	ac_cv_prog_result_groupadd=yes \
+	ac_cv_prog_result_setfacl=yes \
+	ac_cv_prog_systemd_sysusers=no \
+	ac_cv_prog_systemd_tmpfiles=no \
+	ac_cv_prog_useradd=yes \
+	ac_cv_prog_groupadd=yes \
+	--disable-defaultflags \
+	--disable-doxygen-doc \
+	--disable-fapi \
+	--disable-policy \
+	--with-crypto=ossl
+HOST_TPM2_TSS_CONF_ENV = CFLAGS="$(HOST_CFLAGS) -std=c99"
+
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
