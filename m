Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4555C88E77
	for <buildroot@archiver.kernel.org>; Tue, 15 Sep 2026 17:20:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0691C80DC8;
	Tue, 15 Sep 2026 17:20:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bYwtf4DmHQpi; Tue, 15 Sep 2026 17:20:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 43CA580E00
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789492834;
	b=VmVBWIT0UOA/5+DxNKkDvCG7UujfWvRze+1sJPMgL9xsGjFpA+7JB7E2g8uvoR++WmRO
	 KkJctvT1lwPjop5F8PKUC4XHpvF4WWQu5bAXTc7S7WfTt4RJMh9dVaiW7mASefL4GcrSk
	 0JOK9w2HDfHjlHqLnG6B2qPSITwbNQlqWndRsdUDdHmSpqFPu67JD3qlUoWRw6uWAyI5X
	 0GoPjrGmnbhq0c76Bx2YZptJ33VGmPjbICUJfOg8qOqJrOj3yfCDYFZbEd3pSytLtSFA+
	 TJ4IOZWM2X+mFscKeFy1WGvsqlusKe1y9qqjGt4cv8VrzgxNpFapbc7uZyeVJzaNIaQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789492834;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=VJ+R5W/y6Cr3gQLbJMLVUdwwjsRX+IhX/Hkw8gv6Qck=;
	b=hl5briBp2SjZDunRQ7QneFqqJs1FpUi67dBmkuu7rNDuQQ58MAnxcMEFeKEN1zU3N65L
	 hiBuwJu1rCCmyh8qvp4IYHUfM3iHN6Gvn4orEnUTTUpUMpkyvqif28OSwqyAHaR5LE0cB
	 OgjnWhDZnZlr49MjlyNmq3NzYbg7ZGwLXGMscB8MhAA1vEF2eKHapABjV6vweT/inuaak
	 L30oheJigophEyIyyD4n/wR/xftnwrts4nAlxFWUgFyWm8LllXb9X8E6Ioo0xde4SwAyH
	 56IqkqqV9w7s4B6EftMOUtOjdVK5yiAmMhxzeWMn4fEs+WclsJXmiNX0pw1h7I4Ejfw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789492834;
	bh=VJ+R5W/y6Cr3gQLbJMLVUdwwjsRX+IhX/Hkw8gv6Qck=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AxtNXyODmMplkEoFiXl4ra+BtlQg7LQ3maVTfGBOgEBz2WbFZDAXIP720jfea6P6H
	 3if+eNAXO6MW4H27hiAH0sWoi7eCaA7ALEHQPWZxc54TXLTZi1zq7i+UlcVGM7eMIX
	 uYFW2khiwHuBN8w/++Xg9uUH62okUfDZ8Folcof2JD8iJMDKe+WrfUVnYBP4tvrDia
	 jP5KCduAUtrYzHVfhhEwHXAGSuwfZodYkhDtasayuHpEBLWLXD+Q+CjHgq8VPdYXW5
	 AXmEmAw3irIyldtlNDDPyISvNgcbUz6d4JtQlu04SA+3fWnZHu35T1AuusDt6NQ2mh
	 HW1PxVG4SjeXw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43CA580E00;
	Tue, 15 Sep 2026 17:20:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 17BDB23F
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:20:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F21296076D
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:20:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d9i0wjOawad5 for <buildroot@buildroot.org>;
 Tue, 15 Sep 2026 17:20:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7FCFA6076C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789492828;
 b=C+WUwMQQGlvJxBbjfeJtzyur7LBlKOQQ2o+ajOhbdpUBs5RTzYDopdmV3sD32fSoktnE
 lc64E33R+qeMJSRIaujrW2BTfvt5PxmQXXe9hREzTmsTUl4n9vHptjk/iFWc8WH0zPjCb
 sIWmq5/8NE0aTpQoBx4YuK5YaR/JCZjh0RTsoYdS3cpBiOyF1QCJZ1mv6fFfsEf08buEp
 m085hwquYvmUzhGe8fQimo+cLQ36yahHu1QZle5E0v7J6knNDrR+60vfTnDt4IcezIH3e
 9hnN44z5VVrqpkl6NBS7JYBpmygcgI8RcQGjXWif8mdM9b2zgJOQ8CN6IepOArPVp2w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789492828;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=iMImIYumqBD6uSizVm9yjYkabuMiebr10nc5Lfq42ss=;
 b=giKXduGGQtvps0+LkA57QIq5Dif2YPhK1BiyHQ2cot/UMtSlkXxQ45ww3OBLrHlRU19Z
 5VdWZbNv/Eg2NSurqO2qYdT0zRN6dgRXqSjvKl2/1pXfPdBl1A+AiC4a7RtZN7800yX3c
 +R/PPw1//mDV7q61RBKWLKGw/5awwHMweQyxGtBoRwQLS6ydJql9Wz/HWh/4SiOOjMfPS
 8CiyTCSVIkDkDWlaQY9f5suUJJ7pZqsXL5Pd5iUXyC8WaxVuu35cuLSwkme/q3E/DIsH2
 OJgU8y4aPfRlaCyMHgzyq85EtA9Lb76ci7c7NiHRuCuN/YnKuj1T/rvcsoAqcqfrB9Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7FCFA6076C
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:20:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 898F295D68; Tue, 15 Sep 2026 17:19:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 15 Sep 2026 19:14:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d64b05108c3cc8426a079723a3b73b1f791c8125
X-Git-Newrev: e67b301f53ebe6838c92203856792e6953a19f1f
X-Patchwork-Hint: ignore
Message-Id: <20260915171922.898F295D68@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rpi-rgb-led-matrix: propagate
 BR2_PACKAGE_GRAPHICSMAGICK dependency
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e67b301f53ebe6838c92203856792e6953a19f1f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

BR2_PACKAGE_RPI_RGB_LED_MATRIX_IMAGE_VIEWER selects
BR2_PACKAGE_GRAPHICSMAGICK, but did not propagate its BR2_USE_MMU
dependency. This issue exists since the package was introduced in
commit e821078031e14df69e5142f23e9cb7b5a1ea0e77.

It fixes the following Kconfig warning:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_GRAPHICSMAGICK
  Depends on [n]: BR2_USE_MMU [=n] && BR2_TOOLCHAIN_HAS_THREADS [=y]
  Selected by [y]:
  - BR2_PACKAGE_RPI_RGB_LED_MATRIX_IMAGE_VIEWER [=y] && BR2_PACKAGE_RPI_RGB_LED_MATRIX [=y]

which occurs when you configure an ARM noMMU FDPIC toolchain (because
we have noMMU, but shared libraries, so rpi-rgb-led-matrix can be
enabled).

Fixes: e821078031e14df69e5142f23e9cb7b5a1ea0e77 ("package/rpi-rgb-led-matrix: new package")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/rpi-rgb-led-matrix/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rpi-rgb-led-matrix/Config.in b/package/rpi-rgb-led-matrix/Config.in
index ca945a92af..5088af3bf1 100644
--- a/package/rpi-rgb-led-matrix/Config.in
+++ b/package/rpi-rgb-led-matrix/Config.in
@@ -16,6 +16,7 @@ if BR2_PACKAGE_RPI_RGB_LED_MATRIX
 
 config BR2_PACKAGE_RPI_RGB_LED_MATRIX_IMAGE_VIEWER
 	bool "Build led-image-viewer"
+	depends on BR2_USE_MMU
 	select BR2_PACKAGE_GRAPHICSMAGICK
 	help
 	  The image viewer reads all kinds of image formats,
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
