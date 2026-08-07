Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10992C5AC7A
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 02:14:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADFD160862;
	Fri,  7 Aug 2026 02:14:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p_25VuhdZfJx; Fri,  7 Aug 2026 02:14:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A81E260859
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786068872;
	bh=64V+D1Cy34VocYpxxG57vCY7n4208HyeEy6Ne5bJhrc=;
	h=Date:From:To:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nDDSo9GRFsp3zQ9o5pdkoruvpZxxn1H+XjK9X6o+Cx8b6GZFGoz4yRUsDlzfNJ9X4
	 YL6djyr85QTQ6F8IXJJQgDo0jRHVYr27S6J7XngzTCGGhQEx+uTM1L8k4e+zRa1Soh
	 cdT3+STWRvcxWJqQdoUwKirkvrTe6IE05EQJhIHsOfzUm3BtrMBVOqR1ctjLkILqUj
	 ZPKOtGT6tpP6x1Rh4WbLfba9hADAr2DegSqyD26bgl7tpKIA12zDj1BNACkNALJUc8
	 VjKnPR/Z/fLZ6V9A3ggOwCOdhnQprGzG74TIqCBaMfqlNF4B/xPQN7bQby64M6u876
	 e925pb3Ul051A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A81E260859;
	Fri,  7 Aug 2026 02:14:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A9CE23F
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 02:14:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC81E6085B
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 02:14:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 03YAArEGyOp3 for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 02:14:31 +0000 (UTC)
X-Greylist: delayed 381 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 07 Aug 2026 02:14:29 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 01C15607F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01C15607F0
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=220.197.31.5;
 helo=m16.mail.163.com; envelope-from=tianyuanhao3@163.com; receiver=<UNKNOWN> 
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 01C15607F0
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 02:14:28 +0000 (UTC)
Received: from tianyuanhao3$163.com (
 [2409:8915:20a7:1878:61ef:3d15:68c1:b28c] ) by ajax-webmail-wmsvr-40-148
 (Coremail) ; Fri, 7 Aug 2026 10:07:37 +0800 (CST)
X-Originating-IP: [2409:8915:20a7:1878:61ef:3d15:68c1:b28c]
Date: Fri, 7 Aug 2026 10:07:37 +0800 (CST)
From: "TIAN Yuanhao" <tianyuanhao3@163.com>
To: buildroot@buildroot.org, yann.morin.1998@free.fr, buildroot@bubu1.eu,
 thomas.petazzoni@bootlin.com
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <20260606024042.4765-1-tianyuanhao3@163.com>
References: <20260606024042.4765-1-tianyuanhao3@163.com>
X-NTES-SC: AL_Qu2TBPydt0wu4SSaY+kfmksSgOg6X8CxuP8g3IRWO5x+jCHr6jgJTWBjJHDq6u+hLRGqtieIQipV1cVkWax2bYcBNqL3L1eGqyOSUTMfAhRUjQ==
MIME-Version: 1.0
Message-ID: <2deaa514.197e.19fd9f9d7db.Coremail.tianyuanhao3@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: lCgvCgDXv+3pPXVqeGQtAA--.6487W
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/xtbC4QmBD2p1PemthAAA3E
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
 Message-ID; bh=zGySS2IQ4/fSaw7870gMZEn99lnI98sI0hlAGf0O8ug=; b=j
 UkACEaK5tvjHU8cpdb0GKK8ueHoPcw1Y5bRhTB4AID3q7LXgbQ498cpDsqMgTbQB
 MbDGAWZhy3xCz0kseHVHpVD/I0j71YSVljFqIqhMPtjRATRNyg6gnV2R5H5dUZ9u
 pGz2pwF30wnTL+1CGthrU7WsKt+t1FhVYpYSROQTI8=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=163.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=jUkACEaK
Subject: Re: [Buildroot] [PATCH 1/1] package/systemd: add clock group for
 PTP and RTC devices
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

Hello,

Can someone review this patch?

At 2026-06-06 10:40:42, "TIAN Yuanhao" <tianyuanhao3@163.com> wrote:
>systemd upstream added a new udev rule to set the clock group for PTP
>and RTC devices, allowing applications like linuxptp to open clocks
>without root privileges:
>https://github.com/systemd/systemd/commit/af96ccfc24bc4803078a46b4ef2cdeb5decdfbcd
>
>Add the corresponding clock group to SYSTEMD_USERS so that the group
>exists on the target system.
>
>Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
>---
> package/systemd/systemd.mk | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
>index 9ce4f8fef2..e4484b9aa1 100644
>--- a/package/systemd/systemd.mk
>+++ b/package/systemd/systemd.mk
>@@ -699,6 +699,7 @@ endef
> 
> define SYSTEMD_USERS
> 	# udev user groups
>+	- - clock -1 * - - - PTP and RTC device group
> 	- - render -1 * - - - DRI rendering nodes
> 	# systemd user groups
> 	- - systemd-journal -1 * - - - Journal
>-- 
>2.53.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
