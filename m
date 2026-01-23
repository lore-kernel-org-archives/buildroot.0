Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE714D778BC
	for <buildroot@archiver.kernel.org>; Fri, 23 Jan 2026 22:14:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7788A40B84;
	Fri, 23 Jan 2026 22:14:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X-F7ckSyQ8a5; Fri, 23 Jan 2026 22:14:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6EEFD40B6B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769206456;
	bh=ftJvGv8wjsiHnNPEViZxHqCC/hHO0oob24o4Nwjd+Uk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cMXsy2ycgnw808VcfhaC2+Fly/tDHk1iGi2V0C+F/FXxudJE9Pojime9t+Ao4vRfn
	 p8hHtPhaBzC4xA1gLhJ6rcWiWWgDsfPTuIUjlnu3dQJn5NVqAZ40TcGcchNoEptv4V
	 IFifsfTrkpYBuhIQnf/nN3koPy09+EbMY9u5fWqzGXqowvjH2WwdQjJs6uC2F0dINo
	 SJBjmJT46WULhvxqxllvz0vprbUYGL+KwKIRKOtAp0T3IXdb1ZTB0VLO+vvj8ogb//
	 zjOq96wSI9YYAx+7kVIkXisZw0ZJ0ApyLKaXzBVIVuQFdZSfUyIBOngwpEYJMXINnW
	 iS6EzDKC7o92Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EEFD40B6B;
	Fri, 23 Jan 2026 22:14:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 91A07122
 for <buildroot@buildroot.org>; Fri, 23 Jan 2026 22:14:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8154680C16
 for <buildroot@buildroot.org>; Fri, 23 Jan 2026 22:14:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jAJeuhimRth8 for <buildroot@buildroot.org>;
 Fri, 23 Jan 2026 22:14:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B4A2D80BDD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4A2D80BDD
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B4A2D80BDD
 for <buildroot@buildroot.org>; Fri, 23 Jan 2026 22:14:13 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bdf8.dip0.t-ipconnect.de [84.161.189.248])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3157EA4C4849
 for <buildroot@buildroot.org>; Fri, 23 Jan 2026 23:14:09 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36776)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vjPPs-0000000037l-2oax
 for buildroot@buildroot.org; Fri, 23 Jan 2026 22:14:08 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 23 Jan 2026 23:14:08 +0100
Message-ID: <20260123221408.11223-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1769206449;
 bh=XHoJFuY3VZg0wjrG8QGT8kvUJH/MMIusMprcxlnHrcU=;
 h=From:To:Subject:Date:From;
 b=guc5nkS1f3uV5leN38BihExrdDbvg2Dy/C/5l6cyoLzFpk01YapHMdDQY/MmkvEk7
 T6Yt4OWah8kS2VpBOpvjHYF0jgLXjHWzCSjgbS1mm8WC50BB3bo0YeHem4soO4R2Ii
 lFxVFp3nVvLo3vQQasJLvuMABRXmy067UIp7TXfdab5x49tNCtAaT0GcnBBPcCDHkE
 79jFOWDYdCRS7L8pig7OPdxYhG4yZIATS6t4asqixAEhZr6yiJ+RSq03iCDjOu1RJ7
 16D/QMiOWwE8L3QESyzsfYjQWl2+FOLEUuH6kCv0ZU29K2aVzbrTCvMY5cXHj5bOuM
 zJALYE70tE0Uw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=guc5nkS1
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.{12,
 18}.x series
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 4 ++--
 package/linux-headers/Config.in.host | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 5ef453602a..e9ab0d67e0 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -141,7 +141,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.18.6" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.18.7" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.246-cip66" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.246-cip66-rt29" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index a3e621f38d..64f8411046 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  472497197b2f68d4dbf1bc32cc6dc669ca220ff4c0eb0dc39a9cff9a88f9a31b  linux-6.18.6.tar.xz
-sha256  ba3897a1c060b05a03cb4dda6f20d8c75e6f73c88b217744823a915056536eaf  linux-6.12.66.tar.xz
+sha256  b726a4d15cf9ae06219b56d87820776e34d89fbc137e55fb54a9b9c3015b8f1e  linux-6.18.7.tar.xz
+sha256  16805dc62e1fa5ef8a3f466f3f44a2efb171b5206d6840ced4ba5475cf12c432  linux-6.12.67.tar.xz
 sha256  76af9d4fce24cc5a1c9f1fcbba2e23c4e87bbc8e20525b1691206801f24d14ba  linux-6.6.121.tar.xz
 sha256  b41666bda7223600386a07ebe1802f5029da2fe81f6a85d691b6ec6a707e5a29  linux-6.1.161.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index dcf5d46505..4727ba2048 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -460,8 +460,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.15.198"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.161"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.121"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.66"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.6"	if BR2_KERNEL_HEADERS_6_18
+	default "6.12.67"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.7"	if BR2_KERNEL_HEADERS_6_18
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
