Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D29FF885C
	for <buildroot@archiver.kernel.org>; Sat, 25 Apr 2026 14:43:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AD1A40A95;
	Sat, 25 Apr 2026 14:43:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1QwJs1VtAlay; Sat, 25 Apr 2026 14:43:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F01A40C89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777128216;
	bh=+urRwZ6BeIXJE63fRjYccyX02YOA+Qw669cYAW5MzA8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=d75Ul5pgfDZ51kXhsQOkDmA4exKi3YZ1SRgwow5pKebLCnB0y6oYXgrpYX4RZZGNi
	 eBzAqExEfQ9p7d4HlEH//q847U8GUrmzPof3CnWTKTTJYG1fyenT9DHuD8PhuFAWAB
	 7VtMTjfSZhoY9z93dy1MMXFIoW7Pvsycrl+os3ohjPbnME4J/sPN9B32F3xXEOB7Qy
	 NQpcCwyc9m80wv1q6YPfvtyb6PxFwf29EFO5c2xZV43V/AKLDSVgwJJ3wX+9nXz8E3
	 qZ9BAKsTVxchTijf/WLprwFhA7ck7arhr+guWChcmQSo0T3hvfNUErifQHfk/dST+6
	 fyfSE7HLd8yeQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F01A40C89;
	Sat, 25 Apr 2026 14:43:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 53C40194
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 14:43:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3FF1E83EA4
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 14:43:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7UgL7el0zsMH for <buildroot@buildroot.org>;
 Sat, 25 Apr 2026 14:43:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CB52783E9D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB52783E9D
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CB52783E9D
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 14:43:32 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M1Ygz-1wFHJU0h1X-00D5c8; Sat, 25
 Apr 2026 16:43:27 +0200
To: buildroot@buildroot.org
Cc: Sen Hastings <sen@hastings.org>,
	Fiona Klute <fiona.klute@gmx.de>
Date: Sat, 25 Apr 2026 16:43:06 +0200
Message-ID: <20260425144306.881411-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260425144306.881411-1-fiona.klute@gmx.de>
References: <20260425144306.881411-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:Q5iI4+TOTOhc25CSOMWnMVTER+02dJ4PX+OwlpX7FQ8gEtO/Xcr
 CQE8Oj+Qzwz/RXmsbmIDda8Iel6i1fo6j/UaeSl8DkN3df79Nib6NOoNH66R4JKjsngKNGE
 ySTuppJMq8QpQH/vHNvzl6vhH+VTNkPaGGJl57dsu7COo0jNaz9Ks0E0xxu3zglGj0n8t02
 DOaVonVZoD3w4e3ibq/0Q==
UI-OutboundReport: notjunk:1;M01:P0:IAWSNtLRIdM=;YXHCT4zBSgjl0HrHohRogINXwHg
 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
 dtOyLaKg2V9HLXVaLgFJzV1uXC8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1777128207; x=1777733007; i=fiona.klute@gmx.de;
 bh=FyIqnjU2bjQ1oCaFhy3DRhc42OxABrdfN+JTC7j4j3M=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Y6UE9KxQ58yiyDuBwkk7Vfm25ZMKgbn/lhVvmlxXn9oiGiqHZdOAkADHGmE1Z24i
 11X5Nh5ltVnsWyz6H6SFFymmCfoZT/BNAeP77ibsLSwffw8/vimkUWDCWL+ZMPuxn
 JJmKfG3hRs5N3aMZlFQeF8GF8m7AEf9DxSgVrIqY6nO/oHblJ4ykZLuCP2ujtKJ8J
 jEEK4N3sPsggjmk6cHyHLHHzhjk45QWjRXf6KgHDig9Vz6BvOwtom7pVxotj4vhKi
 /jQ/jwBX3YYI9Tecq7VwJiWOmYsio18oVhCxvHCpARjgiEy6zAxDPsGhVYVX8KbTq
 hjkNv4qnq7R3qMghaQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=Y6UE9KxQ
Subject: [Buildroot] [PATCH 3/3] linux/Config.in: add kernel.org URL as
 BR2_LINUX_KERNEL_LATEST_VERSION help
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

This makes it the first URL in the file, so it shows up correctly in
pkg-stats output.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 linux/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index 8633ddbc82..1104902b4b 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -33,6 +33,8 @@ config BR2_LINUX_KERNEL_LATEST_VERSION
 	# mips always generates an ITB image
 	select BR2_PACKAGE_HOST_UBOOT_TOOLS if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	select BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+	help
+	  https://www.kernel.org/
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	bool "Latest CIP SLTS version (5.10.246-cip66)"
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
