Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C6CCD6E75
	for <buildroot@archiver.kernel.org>; Thu,  4 Jun 2026 19:17:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEFD44ECD2;
	Thu,  4 Jun 2026 19:17:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S9KGcIXZ3j2Y; Thu,  4 Jun 2026 19:17:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7AE824EC0C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780600620;
	bh=INYcrqzR8jelbAcWxwBvk8F7eN4GngcAUv+sIDDqE2M=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=imiNd9Z1i/hxMEgChRAn9YHzAViAx6PaC96wvgUxm76+Slx/5Hio5C/j/0TICewQC
	 TFWgeNArgdSQy3qPpyeulzh2T4z/FUfQrxfd5El/5eilVy+9uN/O1EJcTIkV5zH6/w
	 gCs1PCO+oSe+6EW6kk7j45XwAQYb/KeTKlUoUuPF9xMxYd4ncsxRMf/6fjWdNNZuBz
	 GnaSkl3dyfeHu+P2wl7944NOMufuOICil5M0HhythOKBZyUnd7XMpYuJo0TfPSI0+F
	 A3mtV+9DIB5KBqYsA+8BWV+XXKER2fV62vpo7A1IoJJH+7eAH4RniASZrG73l/GI0m
	 zhC1Mz6xKM8Aw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7AE824EC0C;
	Thu,  4 Jun 2026 19:17:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 17BD8DE
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 19:16:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F24E76F865
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 19:16:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BVqHadu0UA_7 for <buildroot@buildroot.org>;
 Thu,  4 Jun 2026 19:16:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DA30D6F864
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA30D6F864
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DA30D6F864
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 19:16:57 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0d62.dip0.t-ipconnect.de [91.58.13.98])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D1991A4C3ABC
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 21:16:43 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59328)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wVDYZ-000000005T1-28qD
 for buildroot@buildroot.org; Thu, 04 Jun 2026 19:16:43 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  4 Jun 2026 21:16:42 +0200
Message-ID: <20260604191642.2162777-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260604191642.2162777-1-bernd@kuhls.net>
References: <20260604191642.2162777-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1780600603;
 bh=aDC9FDAuejLSMfINeUqKS5oYRN0TPq0muBeUjz0bLlA=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=WnaVU/gK1OsrgHceyhzC7+1U64FLjEykuF7mCIHRnVBn06qKwCx2WNZCS1gy3/W67
 /7BGLlTDXDDKFFSFWfvoDlLjEv9/SRaOqImY4ZTt8QURuHYXKNomyj+DEZM3K0m6x2
 LhqvcFzA18s0m3wJj5QWOi2B1pgu5W5O3kr+XPlBqdgkz3ZIF2i9t1VdFRi8fZG6rv
 brbsXMBo8cGExxXFRja5j8ZXX3RUpTi2P+9yfzsXpFFfxx2J8098nJsmN3IYYOwI6x
 Z7FZ3G+tRdINNRVPgzBC6IPXwcfLwcc9uv+QvafPUd5mjsLqqoLcBtGhDe25ArIqhD
 FEaL+wHx8QxQw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=WnaVU/gK
Subject: [Buildroot] [PATCH 2/2] package/libinput: security bump version to
 1.31.3
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

1.31.2:
https://lore.freedesktop.org/wayland-devel/agWtsIBqMXTVknR_@quokka/T/#u

1.31.3:
https://lore.freedesktop.org/wayland-devel/aiDR_N7VUOSOfBUA@quokka/T/#u
https://seclists.org/oss-sec/2026/q2/809
"A CVE has been requested for this issue but did not get assigned in time
 for this disclosure."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:

master branch, only check-* jobs:
https://gitlab.com/bkuhls/buildroot/-/commits/e6c0f8ed987ab79d91eaec0c40997a853abf5b56

next branch, build-tested using libudev-zero:
https://gitlab.com/bkuhls/buildroot/-/commits/3f67decddfbcc74eecf3a34532bd9abb3a66cae6

 package/libinput/libinput.hash | 2 +-
 package/libinput/libinput.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index c813993358..4ea45ead4d 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  1daebac6cb5b8946139c9669a7e5c0e4c8f17320de232a6b9bf470f37dc569e4  libinput-1.31.2.tar.bz2
+sha256  01414457befc3d1c68a328ebe01eacec8e7077a4ff08e181f5659daf9f50930e  libinput-1.31.3.tar.bz2
 
 # License files
 sha256  80de50b2022a840db044c56db804ca3565600a692c0714babface587acc6d1b0  COPYING
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index 33fd012076..176a11e83d 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.31.2
+LIBINPUT_VERSION = 1.31.3
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.bz2
 LIBINPUT_SITE = https://gitlab.freedesktop.org/libinput/libinput/-/archive/$(LIBINPUT_VERSION)
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev udev
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
