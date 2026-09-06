Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB41C79F99
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 10:33:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B39560618;
	Sun,  6 Sep 2026 10:33:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Q0GnX7jbEdM; Sun,  6 Sep 2026 10:33:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 340CF605F3
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788690809;
	b=Vf75ii1kv33yCu7ypQLdM8/Xop6FvHjuJR+VbSYbySGG/cWzNetpa1I/O0rkEIYmXRIe
	 01BN4ZIQx9Fx+DYl79RsfPzXHMOcomrutasVLGHI4vF55IYX6WBTtyNYgcpaYpDTQPRyw
	 YMJcEkeEvpVfX9I66+I4qDmUrrr3TcDvUOfejk6L1I6WTXoAHxkKUctxmwfHr7hB3n0uU
	 5IxiwXkH0TOs2hTXm3zHvslDJAqWFVRWQWHAy8FVpPOkhwk33Cvf+cDyQXje+GTFCLNDD
	 6lHPAIvxn2raCMQmI/VwlETKjVfD3/cnmWbg5Ma67fyhlwRbjOs7OV5/At5/E9JNKgg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788690809;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=GRQY64l1DZSpfYBS+5fM8NmEoz9fkBUVZJZA+daXAJE=;
	b=Kh/T8ygJQAQdEUDzZkzAFbkRhh73/UK4U/8qYVoJowXKwUnqtmHeDAu2elpmsHXzjktG
	 BuPM9G0kc4pjFyQ+ecehf/4+zbtfKGed/HxJuHPr8DVEr1YGNs8XQHYMqn8j6pr+k+VEr
	 x6DslsRCIlUHssM1KWQMUjsWMhf6qRjZ2jhCQpI+e+FEVvcQyATfiANset0Rj5gqJboPU
	 PLUCMWPHzed9utvOzXLj7PxWqJvIZzkb/SH9sdhpGdW32UYbXAqJndsFHUhGzGpnvRDh8
	 LqJi9STtsxerqFXJmCdg8ijkaaGl2YSG8IkMxaJkSYD4utEF2acJGsuXccOsNNveo/Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=IxCo18nA;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788690809;
	bh=GRQY64l1DZSpfYBS+5fM8NmEoz9fkBUVZJZA+daXAJE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Rv70vQe9jUbVNxCKK9zICvGcc1rJ/tp2x/Io4ne/MzL24xkXHR4IFxlkGbk2Km8jR
	 XX2O2nt8vspzqoaZHLiWyWrc3F3RoUw20XfZn3eLlFl3O+1ukq0aJIgvheIgwSrZe5
	 OIZsrn6ZcWvFCRQPDXDJelO5FFMuFzSw0kEbXaF1i74Yk95zn8+zgdwA7IZjc9Fg31
	 aX7XU5KO+nlWwk+vjBCVeuX+PDhqnrlDMPtGB4Gp8aJu+ZzZ2FEkj5vX3IMNX3pfPF
	 VfzHDSxFA6pYh2yVIn7dRSGU1HZASIbHRezMjIaNnTC/EJJ4aH4cBeOrDHxY1tYu8k
	 wDBDok6m08gzg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 340CF605F3;
	Sun,  6 Sep 2026 10:33:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C40CA990
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 10:33:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA28D605F3
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 10:33:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id doWoU_yBde68 for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 10:33:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org BDA47605E5
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788690807;
 b=VBeb63cSJ93PG+ORadC+GUYWVvvE63DXBAQAAdQvGff0xkF1vLi3GUc5bBqY+GJYPIXU
 cReidBiKwRHe4Dfin5vwSR0ND98GlqCSC1YgKFaztFb+FeTcldmj6F55urq9oEBQA3vjn
 di8FPhaCAzmSm6s9AxA1mVD4w+42Bwt5M08KGot+Z3vevavynxk4wDT+wheX5EoMjy0te
 bu4w/YDvy5Y5zI7DWfLbrk7tultd5uF19lTHvMx7GYEP6L0qe1pDQHx/eFR0jkQilwUoS
 P2NjatC2/XR53SjKk7Mh6GFXQ81uNTBQTgTTXI+bML2NcJTD9nVpz3Ufc1J1ntQlP/w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788690807;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=xUhIYv8ViGvwuRKuDk3bA8cSBoEHE4F6A+ddsjg0NOY=;
 b=fde/4jT5wR9Vo2wcA10KOx98ajuB57NvX1aLiznaruhJG+FirWzcKN31NUu/g0QPPJD9
 us1+jG5NDwU8QMVvXPZ+L63Gfr8sU2PD5vQXf8RdYcY1w3iApQO3ktG72zOxyrGepPjm4
 ZrWHd9/ghXDtdz93xWbHirquPxP85VaQp0ezTRsR+ixElhN3uiCTEtpZMYlRejYTJ2BGt
 uHoQ8VluScNZm0SjQ9fygrUyspYz7l4pMeecOXduY2b6a4y/1TYhXiEclArBATVU4Vpbf
 YZzvCsRZ5z7/c3ZBDxCJQekhwpqepju4zZd2yxt3XeZ4M7LtwtpjVh+LzlxqH3NHdEQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=IxCo18nA; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=IxCo18nA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BDA47605E5
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 10:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788690778;
 bh=xUhIYv8ViGvwuRKuDk3bA8cSBoEHE4F6A+ddsjg0NOY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=IxCo18nAY1d9NaNADQ6bWUChExFXtSK5A2C5z2WUsU+ia1KRHN1GkVRdydvVl15Px
 +iy1+U6x3b235oJaxtQUsgvOb5pvr2aLKZ2f3ZYF8dPjll3cWXn634tTB2yVnoaXVr
 t96p5t3/rzhKfijgbHtJYI9z/X2wD6aWx/sabJSLntZ0n2+nIRf+iHM8wFjqIl332x
 mZMKIvYvdr8k+7Q8q1ORn/45qb8SGSkEBLlFj6e+3f4G1szDvZM79wLIuZgAIVDtiU
 LVqvGPvYWCRiy3DIhTCZZOsxmPxDA5sJ+sLOIP/CrrEsw4jZIjsb64n3eKrGGWZus9
 COcWNauq+sVUQ==
Received: from fli4l.lan.fli4l (p5b3a02ab.dip0.t-ipconnect.de [91.58.2.171])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5DEDEA4C38E4;
 Sun,  6 Sep 2026 12:32:58 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53358)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x3ABG-0000000048S-0KZM;
 Sun, 06 Sep 2026 10:32:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  6 Sep 2026 12:32:53 +0200
Message-ID: <20260906103257.3688362-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260906103257.3688362-1-bernd@kuhls.net>
References: <20260906103257.3688362-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
Subject: [Buildroot] [PATCH 3/7] linux: bump latest version to 7.2
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For an overview of changes in 7.2, see:
https://kernelnewbies.org/Linux_7.2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index d511acd26b..21a8819e5e 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -30,8 +30,8 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (7.1)"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_1 if BR2_KERNEL_HEADERS_AS_KERNEL
+	bool "Latest version (7.2)"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_2 if BR2_KERNEL_HEADERS_AS_KERNEL
 	# mips always generates an ITB image
 	select BR2_PACKAGE_HOST_UBOOT_TOOLS if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	select BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
@@ -143,7 +143,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "7.1.13" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "7.2.3" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.254-cip72" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.254-cip72-rt32" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
