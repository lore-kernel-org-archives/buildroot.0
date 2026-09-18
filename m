Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA867C982D8
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 13:06:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E93460DCE;
	Fri, 18 Sep 2026 13:06:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hoWQv50xIgUm; Fri, 18 Sep 2026 13:06:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org EC6B560DAD
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789736776;
	b=m9i9rRbZEwdEuCLO/TIhc+fFkfno6obhGHmFQ+vy6TahBK5CokzENq2qj857QqVJp4LM
	 wiv9ytLIRgO0u6Juk4/4+T0Ryzt62FKw1m/ePIHisgristrLefBJr+URWSKPbzI5J4k0n
	 45I5FYu+vtf1wA03u5cV6PiYnNuLwAubBjSLIDjnVouImhN2k2TU5STStstkSuZWdDKbd
	 VM0m4qLjJBwroryaqnboWHKOKv6aLNo8BrBWUPjNgu7h4Tsw37c27JwWQGyxH4xHu9BTu
	 v1RiVJ/oiGpEpduXDmmRw21o0WjjHWpRvivqOkoptwlZo03o8YSmoeNh1cRPg7CINLQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789736776;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=I85q5vP4lt997uw2iSSgwavHaJIJRPdzUEDVP36uYoU=;
	b=Umj51sMnKb8LvtdyDEpKxgEXe9dMnUrnVF6Kg6sQ8IyHtCshhe7igZ0Mb1cU22c2X10D
	 xcR6lwrFLfM6mxlY/hK/LkCBDimfCajQS/mSddFCu+u9XIj/AL90f0DUQ3gXRCkQKuwwe
	 CT1663ayvyfDIi9BXZOAuoC2S52y773rDoWkTnmQ8dgjDWdYJG0ZDQrY0WifXDHMrypoY
	 wffLzU1/zw6EjgtSdadAFcoCrCOQvZIsbe26KtrIl/Z0pX/fTw8Z+MO8E5L8qp0Q+7DY7
	 fnroUcC/HGJ05KwkZyOxzZIPLG+0+FvfdBJeW7oSuSc+UvdDZgH+IcNpooK0T5bNXGw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789736776;
	bh=I85q5vP4lt997uw2iSSgwavHaJIJRPdzUEDVP36uYoU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pa6qEhYIznD1T7HaA1WbVovKTj9zo7FVcN9uL9r+J7Un9ylPjJ8TEADFQ2uaZx8Sf
	 XZREGlhe9pnoqwHsMB3QF0NwudGvTOy30wL8MKXLK+2t7LIQKIuHOkIynA0UT+ZwhX
	 oq7cOIDGRLoREMQwsJhD1cVOq/t0uecV4H9d2JGZoVgRQrS4kn5/doKyDeommcf5H6
	 A3EocfG24xXEog5ga+1Qo/INuSTxXuWwrX8/6CtBNVLFyJz5Fop7r351vFE2hxPb7j
	 d3kJzIRdAJbR4zmwlvGInc/M/JLcqG59QESoD2XaaXRGh5Bbb+TKDBXCl/IC7yM7/y
	 x98d4GlTEn/mg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC6B560DAD;
	Fri, 18 Sep 2026 13:06:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D8F42224
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA87A8124D
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:05:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6_LymYIsfnf3 for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 13:05:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E54698129D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789736747;
 b=ktSCsv7PYPkGeawJV9PHAs+8fB4h/ugoQDafy+F6aIeBzg4KXsMSyP6+/kJ4NQnSfr7d
 hRxdvpNF5xeo5J37NKE4BVQ9CUrDlXYswIDMwQQ6s+BShvAZUokV+YBl8piwSV6q+AfRn
 UwtVtoZCDSuKaIAZhKcHMi8PvowOzaHWvwmC/qj/k6Q2ZlY1gdkobslNh8QB6ZtJCu/k4
 udka8yDPFkvcNioG0SQJJw2v1tWffO4tlw5Nh+naen8v0FFglvchgI9sJIMAeVPeFG8Xr
 /MmCbQ9c6SOA5kJWQG5Ri5eMesdGWoU0KMpyL70V+plHK4OdwZepQhYIT0IRWqKBKrQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789736747;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=CIEAanQTh7QJt1vF+3aXzhVLIzF/FcfyJ+WGFtXI80M=;
 b=MNkeZ642SU3FgcBbfpMc7szw1GmHZYrmeMtKYJmpWXEnm/wW+k/2AeTNQ3np0tlJ9XQH
 1uhlnA+fSBHLoAAm2comyzZWVN0oMJpbybwd4k617URe1DrIzJ8tve2/zuDLYlYu+oDgz
 2t7cIaGStAJduPc83omQd2ai+yDtYPICZj5VXQie6EB7M/G+zx9goHTwmO3staj1l8R2r
 8v4jq1dv7xQfl1UixWUY2/lq6B/cGADzQ3QECAhxsdfUziv5v1KiC112YhuICO8w7Z5vx
 si7UwIj6C4sB/5gBO0wufsC458JEwWwNYxx3uY1rJxf/cD6uNaaEBzbfKV2X4fAdqJw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E54698129D
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:05:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9E48B97696; Fri, 18 Sep 2026 13:04:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 11:19:21 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: bef43a2af118934174a2398dcafb3c04b443b644
X-Git-Newrev: d5525434313c49de48ff75e218964fdc01605ebc
X-Patchwork-Hint: ignore
Message-Id: <20260918130440.9E48B97696@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/pulseview: add
 missing 'select BR2_PACKAGE_QT5GUI'
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d5525434313c49de48ff75e218964fdc01605ebc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

BR2_PACKAGE_PULSEVIEW selects BR2_PACKAGE_QT5BASE_PNG and
BR2_PACKAGE_QT5BASE_WIDGETS, which both depend on
BR2_PACKAGE_QT5BASE_GUI. It ends working because we also select
BR2_PACKAGE_QT5SVG, which selects BR2_PACKAGE_QT5BASE_GUI, so there is
no bug, but it's bit inconsistent to select sub-options that have a
"depends on" without selecting the option they depend on.

This not a bug fix, it has no functional implication.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit aff091c39dd49c418edc406879c03dd2eb0cdf8f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/pulseview/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pulseview/Config.in b/package/pulseview/Config.in
index b1f9dc25d7..b9dbd88c28 100644
--- a/package/pulseview/Config.in
+++ b/package/pulseview/Config.in
@@ -17,6 +17,7 @@ config BR2_PACKAGE_PULSEVIEW
 	select BR2_PACKAGE_LIBSIGROKCXX
 	select BR2_PACKAGE_QT5
 	select BR2_PACKAGE_QT5BASE
+	select BR2_PACKAGE_QT5BASE_GUI
 	select BR2_PACKAGE_QT5BASE_PNG
 	select BR2_PACKAGE_QT5BASE_WIDGETS
 	select BR2_PACKAGE_QT5SVG
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
