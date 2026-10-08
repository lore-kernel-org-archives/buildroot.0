Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C17CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:21:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E988608E6;
	Sat, 10 Oct 2026 09:21:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KYlxxANvG6M6; Sat, 10 Oct 2026 09:21:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 382D760623
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624098;
	b=Muwc2MZlDTu8PspJTdG8vRnL7BIRLx9K9XHwpoGAEZJYDl+VjSITpgJ0WhLwUjTKBokC
	 LBz7QwVwcKiMSMu8h+szpLrWVgfN6ckrCew+5QudkQuu+89bhKIsxaafyp4G5iSts2qOp
	 +UNuppBImJpTUCNWjNqmbc0qQLqmUCEBDa81Zlaz2I+rDQbUCxgzzLOzaQyYYNcH1jpSP
	 HOzlxlY2622NExWJB/km0Ow9glShWfTqrsAgiLkemEzCAbjYrd8VTgx6h4NyScn2qnj8B
	 YutSkH7GXL1zIMSYlt23saifD6Rr57jc3p36AjVYnb8F5wAuNnwtysrQkfFCdlmaQYg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624098;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=HCmrazfTgeavGHwFXVngVzLKIyjJN+Oo0mI3OH/vQs4=;
	b=A27ywqaIgBGaHaiHnRc7mRT0loHn4lY4NzBZLR4HoqE20PeFavqRw9l4e1Lpomxagn8x
	 fm8W/EPyAaO74+aXQDp78861mSoD+HyExBKh6CdlLKiPWH6qVJEEHMj/rCikRYxGnQmjp
	 KfdsxnkWvgqTuNE2hAieLFmO/hPN3ISg2lE5tRTlc4wMXAMAro5rRpTKeuiqSYMP9vafN
	 UTm1DIjcclDt2sQNSivFNZ1t3guu1eJm6Oy0jfGlaOgbNilquLVTPYUr/oQ7AlQoQyD55
	 /2+xrcEFWgmXROXQNFos+sn5fpP1tnmUlZv6Ein8S0IbBvx0emHoCj/E40YoCMY53aA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624098;
	bh=HCmrazfTgeavGHwFXVngVzLKIyjJN+Oo0mI3OH/vQs4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=J9Vz+A+cLBTbg6hSBM1UhGUHdymuPFYyRzm+Kp0xaRWYDLTyg4usCvQK7usadCh4J
	 ueWIJUbp2CGLy0cXJVl1mL6+35f46ogTQpnHTItCNnih54M4bYfSUP9YfyXWALkS+z
	 OqOhJByGfE1zwxcNbwpYwJyYA0IBEJ78zVT4vw1dBz/ypy5327TNONe5ifmRJshf+w
	 T3q28/qQEOcWaF1jOv+MJkGcQsEGEmqP91LY1h8oy0hK0BMfs3bgO0+evNvdV+e97f
	 3pdIvxWXGHgWiiZYTzt1wSPapswsEUgBlLuE2A3FrrcfH2e01i19NDXhNqER8iWucs
	 34dsByiF27J6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 382D760623;
	Sat, 10 Oct 2026 09:21:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D40675
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 78CDF608B4
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZNpR2_9-qqh6 for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:21:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 45EF66064F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624086;
 b=pZ7xpACUCFdwUDIkvfrUzdaY1BS1z4gJ4FphQ91P6EjonH8NPj918cWDcvmL3jUBN+cT
 BOUIBOMjJi+w7Ss36a6E/f4UPK7uPPhwrdmBfk/oZAx5WK5vS7NrA3gXnGzaDSGN5+xZn
 6uHkgYfE94is9DLqWcvsNOIRqyNn2ea6pewnxFeXpTmCspxK4x0/gXrA6xofIhP1P8zBe
 JVrN/Ev2jeoazWXqp+M+H0gBkwNy0mvJ+U+t+HHSUxI3UVeXyyi9UKBvdNnmlzInEFux+
 8stR0Q5pp8PEztcRI/S8TVAmaflNog42YSrO/KsUbFl4FBahh/Qqd3/NHB4RFEFRM1w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624086;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=wPg/F52RtzY25LRORvfFxLgIIaRKKRPOCxrZDF6Vc6s=;
 b=QCv12iJydcKCDgcxxvqBNEKObjVS2noZqISrAI5Ax/Pp2zfNjJqi/4ByCTL/VsWs+Bee
 Qyzr0wKaS1F6S/Lyg+iu1wCGLtr2hOlT6ookLoxH6NUVe3nifqYap7Srf/CEv7UiWGrYt
 WW5IobUeSlpMbjdV8yTxdYoNjdrVqpU39M9XaxT1qJkHak3utXrGIxrGJbbfgQvvyUdIF
 V5mfxz2z+Plujjphv71vtSpVRe1EM8ZdFYJuXlyv2xH0j1qknP3XMxMWqXUTLE2c/Psiw
 vz5o2BsrnuWVUNd0avcuF8Yo8hRuPScCIu4gsEjBJCxCuK9i42YBFN1rBTE8qB7cOQw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 45EF66064F
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2D3088F0B1; Sat, 10 Oct 2026 09:20:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 11:47:59 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: d351d851e408547dfe5a1e809c1d49d613fb16b5
X-Git-Newrev: aacf9c6ad6220d0f127b0b3f2f0dc5819b866e82
X-Patchwork-Hint: ignore
Message-Id: <20261010092008.2D3088F0B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/bubblewrap: fix
 build failure if kernel uses localversion
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2229712016554842602=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2229712016554842602==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/aacf9c6ad6220d0f127b0b3f2f0dc5819b866e82
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Bubblewrap expects the value of the assume_kernel option, if set, to
be exactly three numbers separated by dots, nothing else [1]. If that
requirement is not met configuring the build fails.

Buildroot sets assume_kernel to $(LINUX_VERSION_PROBED) since the
version bump to 0.12.0. However, the expansion of
LINUX_VERSION_PROBED may contain additional suffixes, e.g. if
CONFIG_LOCALVERSION is set, or localversion* files are present (like
in CIP kernels). So filter the version string to ignore any suffixes.

[1] https://github.com/containers/bubblewrap/blob/v0.13.0/meson.build#L94-L104

Fixes: 4cb6193d2eca39b1bd79ff4867c842f507f692b8 ("package/bubblewrap: security bump to version 0.12.0")
Fixes: https://autobuild.buildroot.org/results/e7513e4730000e46b13bb9cf25955ebd3ec5fb71/

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Acked-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a2b5b7371b4ae5460bbaf0ca8c2cfb523f865556)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/bubblewrap/bubblewrap.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bubblewrap/bubblewrap.mk b/package/bubblewrap/bubblewrap.mk
index dcc3c23d7c..a58d7fd143 100644
--- a/package/bubblewrap/bubblewrap.mk
+++ b/package/bubblewrap/bubblewrap.mk
@@ -18,7 +18,7 @@ define BUBBLEWRAP_LINUX_CONFIG_FIXUPS
 endef
 
 BUBBLEWRAP_CONF_OPTS = \
-	-Dassume_kernel=$(LINUX_VERSION_PROBED) \
+	-Dassume_kernel=$(shell echo $(LINUX_VERSION_PROBED) | grep -o '^[0-9]\+\.[0-9]\+\.[0-9]\+') \
 	-Dzsh_completion=disabled \
 	-Dman=disabled \
 	-Dpython=$(HOST_DIR)/bin/python \

--===============2229712016554842602==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2229712016554842602==--
