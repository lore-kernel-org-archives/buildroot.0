Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C4E6C4451C
	for <buildroot@archiver.kernel.org>; Tue, 21 Jul 2026 16:06:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1FDD60831;
	Tue, 21 Jul 2026 16:06:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RpcPz-uqGbh9; Tue, 21 Jul 2026 16:06:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0E7D60843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784649986;
	bh=Y3bTo4EoEslmrOodMSvH2GAqEki1S6HO7r3+If/HWG8=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=LeRqL61Prns7SiZqTcyEi9bhj8UYAaSN2Dy7zTosKoqNOqr+hkJau75Bu6u+h+4dm
	 7YYjwDrQtz6CQ5CriAC7afTtBmqoCJSVfIVTJN2nxSbwCmy0FZ/9EMph3iv5NjvG8G
	 XT2Maa0xx1OBqG7/GiLh84U5s5h+Zn+QhZ5DUa5Ugc34M8ktTdmPCj34jx/S8F7O0Q
	 Aty8UbL5RRSSWmuSyengSizv0GAtmHxwOhOf7+pHuSZUCG8nrqPJEUSIh9iU/vYa5W
	 v0r3LyHV/Zixn7p9V6HmDEEdWAFF1nfc1wt2wb3ICLAA8XPdNqFpCvxBkMPinfo6e0
	 2ZqrGi1ORcFzg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0E7D60843;
	Tue, 21 Jul 2026 16:06:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C82C542A
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 16:06:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B9F2B4064B
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 16:06:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MetkHgcuuFeR for <buildroot@buildroot.org>;
 Tue, 21 Jul 2026 16:06:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 45443405CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45443405CC
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 45443405CC
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 16:06:22 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MAwXh-1wsYlR2qgz-00GoMK; Tue, 21
 Jul 2026 18:06:20 +0200
To: buildroot@buildroot.org
Cc: "Fiona Klute (Othermo GmbH)" <fiona.klute@gmx.de>
Date: Tue, 21 Jul 2026 18:06:07 +0200
Message-ID: <20260721160607.276174-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:gAVSZxGVpdjnz4GoTHJv45v1afkivnUv9JcaZi91jrf7o1ZCgHr
 kv9TA9gzjqt7iqVvS38g+jMrkWX3mqSc6+b97gkWNlIBdcYElZ+CQwZMH5oTLbfcoQe87ry
 cgo+iamKkwjlSEP/GuAbOgwl68+5q2FBLqW1p8lTmg6yMZpCC22Ht1qf6IVnXW+iXpKwZf/
 l/8M9wp7PiOD/R5bG6/Xw==
UI-OutboundReport: notjunk:1;M01:P0:IrAWQWD8wNk=;hquyUhXEYq1dUw0aLb91wQS8lCd
 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
 iepP+ykgrUbJ
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1784649980; x=1785254780; i=fiona.klute@gmx.de;
 bh=S8+YwSZc1ekbry9CO+9trrt3eJqENbNh5ynx5qfwM9E=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=gaismkVoYO9+QlO1bE73SzP45i++k2B+ktJHjN0U1/vk5oRFLVJBu4JqQJkIILbk
 kKiL2luEl9VHZEoMFK31dD6IjXG8nr87GlB8Hyxyb/zuE7XU0oQ48cBq/Sy88azL+
 pT8lhb78zpsMzWcfrI5Y+wGSnkSKL6XHlI+vrGe/eJf1ThkHnPKV13icHX4AYKDXP
 w/A9uFyv6WOAZmrarZ2+1R2zmUNeJsq/KqkvqnSWucNYjB4A5F4Ku3+3GDPyoRP6y
 hThFxjakezVYpd66DwQqyFHvO3fA2Ib+80L3TOfGIuvdoo+F+EnTshFX6VgNIdTHZ
 37hNDU5KV8/tRjpqzA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=gaismkVo
Subject: [Buildroot] [PATCH 1/1] package/usbutils: update license information
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

From: "Fiona Klute (Othermo GmbH)" <fiona.klute@gmx.de>

According to the upstream changelog LGPL-2.1+, CC0-1.0, and MIT
licenses were added with v018. Grouping is derived from individual
SPDX-License-Identifier headers in the source files.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usbutils.git/tree/NEWS?id=bd86478bb8d09abd0aba8ead781bc8f4609521e6#n159

Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>
---
 package/usbutils/usbutils.hash | 3 +++
 package/usbutils/usbutils.mk   | 9 +++++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/usbutils/usbutils.hash b/package/usbutils/usbutils.hash
index 3527d4e30d..e4fbe18070 100644
--- a/package/usbutils/usbutils.hash
+++ b/package/usbutils/usbutils.hash
@@ -1,5 +1,8 @@
 # From https://www.kernel.org/pub/linux/utils/usb/usbutils/sha256sums.asc
 sha256  659f40c440e31ba865c52c818a33d3ba6a97349e3353f8b1985179cb2aa71ec5  usbutils-019.tar.xz
 # Locally calculated
+sha256  1f2fa2e0fac0e224fa84969d0e0b3e6801ecdfb7b9526a4664787e840ad705a2  LICENSES/CC0-1.0.txt
 sha256  91412672119c72352b76c1d48fa1a8b7cdc7f70be7929e468c8805db468e23e4  LICENSES/GPL-2.0-only.txt
 sha256  4631da83311d27f99078d0d102e31bd34a4fcbcc2dae2aa40f1454a5b48125dc  LICENSES/GPL-3.0-only.txt
+sha256  efbaee946ac92a48b89eae36f655844042370d2f0e04eadea1e2998efae24ebd  LICENSES/LGPL-2.1-or-later.txt
+sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  LICENSES/MIT.txt
diff --git a/package/usbutils/usbutils.mk b/package/usbutils/usbutils.mk
index afeb7ded2a..4fbb358dfa 100644
--- a/package/usbutils/usbutils.mk
+++ b/package/usbutils/usbutils.mk
@@ -8,8 +8,13 @@ USBUTILS_VERSION = 019
 USBUTILS_SOURCE = usbutils-$(USBUTILS_VERSION).tar.xz
 USBUTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/usb/usbutils
 USBUTILS_DEPENDENCIES = host-pkgconf libudev libusb
-USBUTILS_LICENSE = GPL-2.0+ (utils) GPL-2.0 or GPL-3.0 (lsusb.py)
-USBUTILS_LICENSE_FILES = LICENSES/GPL-2.0-only.txt LICENSES/GPL-3.0-only.txt
+USBUTILS_LICENSE = GPL-2.0+, GPL-2.0 (utils), LGPL-2.1+ (config/CI), GPL-2.0 or GPL-3.0 (lsusb.py), CC0-1.0, MIT (ccan)
+USBUTILS_LICENSE_FILES = \
+	LICENSES/CC0-1.0.txt \
+	LICENSES/GPL-2.0-only.txt \
+	LICENSES/GPL-3.0-only.txt \
+	LICENSES/LGPL-2.1-or-later.txt \
+	LICENSES/MIT.txt
 
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 USBUTILS_DEPENDENCIES += libiconv
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
