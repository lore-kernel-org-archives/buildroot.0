Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8798CC982D2
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 20:43:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E9D681138;
	Thu, 17 Sep 2026 20:43:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l4mAu3dDEOIV; Thu, 17 Sep 2026 20:43:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1E2B58111E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789677783;
	b=Ww4X0gWsGjgjct03kTRvN4kzK7EvNb52Dq0fSbNz9tNJtdDmftUeRtFBSAxUysyhO27B
	 Ed79tJLxfoe49z2XfDAN4DE0LEsFy2T+kpmHlkXWlFZ0h67gnKz7RWuTxDAGG/aoh11/9
	 rjxxOZyO6dBAkLqhRmmOWRmD329kbWz4CPiGhv8vu8fKfB0bBu5M6lFc3d0UKhzkQ/JHr
	 XHT7og9D+65T6HsgZX1YA5DrBNyFJe/BIRn61sq08ktEsv6tg00I7tF7AR9Cuy8E2kSe0
	 Fx7yFcXqRXUKWJSAj18GSydd5VlqtyY2y/aiiIMv+XwMFUbnMl29/rTlpih/ST1oQ+w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789677783;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:Date:MIME-Version:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=p7B3CeyIJSCPhlo98tXG9tpTQVuLXG9oNJ3OuoO6yGo=;
	b=DxV9+ws0olA+YmgEkK+Bk5vH+r1w5sXqQ7PMn2gj0+fLeOZiS3+jOZazC5rD2eftTvhf
	 3jz0C9wzeibJF+r7bmkYDifrKeT2cy7qU70scx0MxLAy/0Kgyc2VjC//ddMYX0HzSeKDV
	 cDmTjyDTBowqqEgjJpiSnAku36dsM171FD6VNTXZEXXR6P/oiJQEQKPvHts2UIfKo8s06
	 jVjkb5mBl5Vf+ZYXG7X6kecZQHTx8PPHtRBPdWHUpNatrSl0oXfSzT6QLAkeW8YUh/RCk
	 /t5bTukG/Ew2ddB/CjuSUmeYPQgutRvYAUbVtVYlCo03sR3yi/y8FmzmNmLKxx+yCkA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789677783;
	bh=p7B3CeyIJSCPhlo98tXG9tpTQVuLXG9oNJ3OuoO6yGo=;
	h=From:Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gKNhTXdJnjwtLnvhx1bhnJ57D5+SAa0uvUQ5wUvqj7MzHel8Ss3vuozCdbs4iMabD
	 t6OJpsqYNlRME7+L7E2NwfW6iDH71dTrDeXHZW6yc99B3WhpMd5HPHku4jpDeNqhcK
	 6GYnOymUExcvXV53GaOCurO9UxIZV2o1VOfjzLt6YMNj8H4knc3NVBFQmVeoZDUwhf
	 SWUt66GkaJzwP30gU9eCy5IyxUOYlCltOys3hnzR/d42M9lAuxrN63dCFtpfiBV1xf
	 9YPT0nXu36/nOj+Zb22Da1xSVySDdAsVtsDT/6ec5mDrVGQo/zsKwZXOeq2v7E+/GU
	 N1k3eW4zY6Pfg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E2B58111E;
	Thu, 17 Sep 2026 20:43:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A71793B6
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 20:43:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 98BBB4045B
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 20:43:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OoWvoiiaskpH for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 20:43:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 75DCC40460
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789677780;
 b=fKgX9EvjSx/+4kvXOolNsSeOVFMTM/JK35TgMWFg7Q9R4G8qEaZEVEKqSVi9DIf2OlGo
 /8B8eniOiNwxc+KxdM1U/5F8MpoVYXofGWHmPdQBpqdxeluHVMmf7FzM2Uq3l1+0IMonV
 PC396HaB230vyHnGppuTRRagjJJm2mIPpa1EFscY9NOlJuqGRowT0YO5xnuE6Zod1ASJB
 u25gVHpo3Y7gIDSOozIC9lhTGSeOr78tdMJiFtKF8o4bf9eGwvxApfFqafvssklAryuBb
 c7/57OKW46DQxfbt7C9lNgeR3XO569cgZrRI3TJQiPOxOUOSasQH2AN6RKO6O7YnuLw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789677780;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
 References:In-Reply-To:To:Cc:X-Mailer;
 bh=riJsuJT0XueGxtz14i5L7qPNUIy5mST5eksptancz+g=;
 b=mOu3fMF3j9dXdUIzI3+wspkBye+esjyGHhl2YCywA2NPIYnGJjrbj09Hjhpayq62OL5a
 M1MNjl857GEwFQ/NmT595Hqn5LeQLEhUOddgN8gi+t91tH+GuLFBM7S7T6nDNqlr8nyuT
 iQ3XuXgBnrMLB51f6gRb0S/qTAlyeTU4qexB+63u9cj/N5CXxth9DCxCaZKGZIdFVpD+y
 Ae/E4g/n1AGSA3efJYU0Rv+BsCAI7uflwgxXiCjFzoTa8OQm252FCzVY0r6O4i5LIbKty
 reV7bO+xEXxIyloB9dZ0uFj546GAX33VkcdSrE04RbB4Kr4VOlonwE7TvcTFbnRC7ag==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=RfrE7uxZ; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::10; helo=mail-wm2-x10.google.com;
 envelope-from=fractalclone@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=RfrE7uxZ
Received: from mail-wm2-x10.google.com (mail-wm2-x10.google.com
 [IPv6:2a00:1450:4864:31::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 75DCC40460
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 20:42:59 +0000 (UTC)
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49d1ca5b0d6so538645e9.0
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 13:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789677778; x=1790282578; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=riJsuJT0XueGxtz14i5L7qPNUIy5mST5eksptancz+g=;
 b=RfrE7uxZeWfqz079JC+3JSxKTJWLvdu1KAHI25OCEMXYb0ojdMsyyD/gUsL2UXKC8D
 Zo/ggByUhmd7jswcO+PfcW39zP6ZuB2reUO+UNS3yRJ+u4RZZs0r2vrv/cdrJHD/k54i
 K+ww3vsoqYljklV3C9pODB9ZPS/veYmWW9YcoONgPkqXEWCMgeRvS5KbLAUx4qGZmfQg
 0IAT0BgIiadmlXYimikqdFDP70SPbXLMbGR0scPYqFHOsUj7j4F+7yZ/8bPGdqgzkDVh
 8m0m6FrAsgvtlP6PpmZHwLEQi9aIl7lExV+9kOboRSZkIL0eWUhsUYa6oUolm/FiJtH5
 j4ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789677778; x=1790282578;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=riJsuJT0XueGxtz14i5L7qPNUIy5mST5eksptancz+g=;
 b=rlc1TfmPBiyrpMzj5wpWdugNWtoNd/lZUa1j7YT3s4EQ32OikDpZhJFGbwOqEoc2if
 QYjQdZ3UFeH4C/+KoW0GWa+Ni5HsU743MKTdfBxv9ZTcZXeT4heChVjPq8VDKQr9C6Bu
 +CqIuAHM/8VP40Sf3TncgjIoV8+fY3fRVE1pYQ93JKC+8Vj0LbpkP4qcuUhfkQAs5eAT
 kYs9Z5r+WCAH7NhAH4J0ikAuEQhYfIg7cNlN0Kw8ciYkyoNMlI7361+riED3gNmYLcj8
 IZmzGTDQwvzag+3s6ejSKy+h1oYJrnqSpPD4TiVR2/jPXl8yMP4lyuabHeQH9eVG/sSz
 c7Rw==
X-Gm-Message-State: AFuF++mSUeCW2WninjQ7YxgtWni12cGdQgRt0oe2zeczJUoFwBfAKGD8
 KExRLGOgfFq2MwcWGqTedBIYOtY0cUkMxw3NPz023u9ljbAroTfHwnKaYrU6OVwe
X-Gm-Gg: AYBFou0TwY2OsOW7v7g2mUN0kPSSl0k/U2UCXyJgWvKpTw9JPRNPZAmQ+GR7gmao6Lp
 owR9Qwn/w4jTIA0qdlGLUHMAryd6t4dgao0F7XOJ1zEWLjEQfmak6g+tSrwVAJuCt3yPrrGyF6P
 /cG6A0kKGtiryOgmBubZdQSagtU6N1FD0/NaStpzZF/a0YWzfppluuTHhXf1ob+Plefffz2BjVF
 CxurlLgxYZncNXWKWU/CH0IqBXfjyKK5geXmLugse93txC0mr9R8hoARtyLJtInvj0XfK/rfhZg
 9ZWBrF/X9DzWe+3IDzC7txpFkoqNX/HXjx3ml/eXOQOCm6+U/l8DvBaJYRlUcD3iv2zBg+CHOk+
 U3OENBZRjIO6bMS2dbmv2X1GEcLa0EycArdz1wUS1Rm4+cM6e7WdjgN8XBC1SCIrOLeBS3wGGBs
 9YlEv1S3drVL/FC1+HBlQ8ezvJEB/ILK7LsD3v85aqZ8y4qW9dqBxDe6NYsYzssXZO2QSIORghL
 6kBKA==
X-Received: by 2002:a05:600c:530e:b0:49c:cfbe:5a76 with SMTP id
 5b1f17b1804b1-49fc568157amr1546885e9.2.1789677777641; 
 Thu, 17 Sep 2026 13:42:57 -0700 (PDT)
Received: from [192.168.1.138] ([139.47.34.204])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fbd2563ccsm126681465e9.13.2026.09.17.13.42.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2026 13:42:57 -0700 (PDT)
From: Jean-Paul Etienne <fractalclone@gmail.com>
Date: Thu, 17 Sep 2026 22:42:44 +0200
MIME-Version: 1.0
Message-Id: <20260917-rock-pi-4b-v1-1-a1da4ee05567@gmail.com>
References: <20260917-rock-pi-4b-v1-0-a1da4ee05567@gmail.com>
In-Reply-To: <20260917-rock-pi-4b-v1-0-a1da4ee05567@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Jean-Paul Etienne <fractalclone@gmail.com>
X-Mailer: b4 0.16.0
Subject: [Buildroot] [PATCH 1/3] package/rockchip-rkdeveloptool: new host
 package
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

rkdeveloptool is an open-source command-line tool
used to communicate with Rockchip devices over USB
for flashing firmware, reading and writing flash storage
and debugging.

Signed-off-by: Jean-Paul Etienne <fractalclone@gmail.com>
---
 DEVELOPERS                                              |  3 +++
 package/Config.in.host                                  |  1 +
 package/rockchip-rkdeveloptool/Config.in.host           |  9 +++++++++
 .../rockchip-rkdeveloptool/rockchip-rkdeveloptool.hash  |  5 +++++
 .../rockchip-rkdeveloptool/rockchip-rkdeveloptool.mk    | 17 +++++++++++++++++
 5 files changed, 35 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0a6d4e455e..6d69fd4663 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1616,6 +1616,9 @@ F:	configs/orangepi_pc2_defconfig
 N:	Jean Burgat <jeanburgat33@gmail.com>
 F:	package/openfpgaloader/
 
+N:	Jean-Paul Etienne <fractalclone@gmail.com>
+F:	package/rockchip-rkdeveloptool
+
 N:	Jens Kleintje <scooby22@web.de>
 F:	package/gcnano-binaries/
 
diff --git a/package/Config.in.host b/package/Config.in.host
index 595caf9e7f..9b4b6172db 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -105,6 +105,7 @@ menu "Host utilities"
 	source "package/raspberrypi-usbboot/Config.in.host"
 	source "package/rauc/Config.in.host"
 	source "package/riscv-isa-sim/Config.in.host"
+	source "package/rockchip-rkdeveloptool/Config.in.host"
 	source "package/runc/Config.in.host"
 	source "package/rustc/Config.in.host"
 	source "package/s6-rc/Config.in.host"
diff --git a/package/rockchip-rkdeveloptool/Config.in.host b/package/rockchip-rkdeveloptool/Config.in.host
new file mode 100644
index 0000000000..5f8029bc7d
--- /dev/null
+++ b/package/rockchip-rkdeveloptool/Config.in.host
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_HOST_ROCKCHIP_RKDEVELOPTOOL
+	bool "host rockchip-rkdeveloptool"
+	help
+	  This package contains the Command-line utility used to
+	  communicate with Rockchip devices over USB for
+	  flashing firmware, reading and writing flash storage,
+	  and debugging.
+
+	  https://github.com/rockchip-linux/rkdeveloptool
diff --git a/package/rockchip-rkdeveloptool/rockchip-rkdeveloptool.hash b/package/rockchip-rkdeveloptool/rockchip-rkdeveloptool.hash
new file mode 100644
index 0000000000..6dfec07958
--- /dev/null
+++ b/package/rockchip-rkdeveloptool/rockchip-rkdeveloptool.hash
@@ -0,0 +1,5 @@
+# Locally computed
+sha256  84f6e7876f1ea3c8d9dcb905a50a48d6d83439439898d06b054d2e8752de1456  rockchip-rkdeveloptool-304f073752fd25c854e1bcf05d8e7f925b1f4e14-git4.tar.gz
+
+# License file
+sha256  1be990a929b50ca91d815cea1cd3cebb5c49e86076ade82b1103f2b9cd71a3af  license.txt
diff --git a/package/rockchip-rkdeveloptool/rockchip-rkdeveloptool.mk b/package/rockchip-rkdeveloptool/rockchip-rkdeveloptool.mk
new file mode 100644
index 0000000000..52e6e3caa4
--- /dev/null
+++ b/package/rockchip-rkdeveloptool/rockchip-rkdeveloptool.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# rockchip-rkdeveloptool
+#
+################################################################################
+
+ROCKCHIP_RKDEVELOPTOOL_VERSION = 304f073752fd25c854e1bcf05d8e7f925b1f4e14
+ROCKCHIP_RKDEVELOPTOOL_SITE = https://github.com/rockchip-linux/rkdeveloptool.git
+ROCKCHIP_RKDEVELOPTOOL_SITE_METHOD = git
+ROCKCHIP_RKDEVELOPTOOL_LICENSE = GPL-2.0
+ROCKCHIP_RKDEVELOPTOOL_LICENSE_FILES = license.txt
+
+HOST_ROCKCHIP_RKDEVELOPTOOL_DEPENDENCIES = host-libusb host-pkgconf
+
+HOST_ROCKCHIP_RKDEVELOPTOOL_AUTORECONF = YES
+
+$(eval $(host-autotools-package))

-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
