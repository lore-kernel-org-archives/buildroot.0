Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB28EC982FA
	for <buildroot@archiver.kernel.org>; Tue, 22 Sep 2026 20:22:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F3FC605D1;
	Tue, 22 Sep 2026 20:22:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j8W1MqGe0ES0; Tue, 22 Sep 2026 20:22:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 6E5BF60615
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790108567;
	b=ePsidgAVIPUvVqNKeyGXKgGwpc/lnLBLolJ3bauSs7g9ZCUVjvBa0oZ+SoX24hKXDhNk
	 b6TfVZpy+25WCJY3hEJDvCCkAoBzbdHK6DNJ4OF3Zi4fwhe9jfH2nX3pAqVhftoiIjksT
	 /ERv1L5+DuhK2hoiuu5ZIzs6uAUfj/6humpbBas/fXQSumJ8Hk2VYUnLL9p9Hk6L98mHx
	 RpYILeAHRvzLGeWiejTWYyhPfhCrZ0eVgFIE+sypOPKtduOkfZy/l4O9pr3JAlo/SCBCa
	 whH2B7dGl6JZOgBwjwgLHRqhyX29ErvNCpa43HDq4+vLZEOLu9EexVU7Kf34HehR1qw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790108567;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=fiY68ZAvCovB4fEOFR2fyv3FHdEzJfRqpTnlrwMIvBE=;
	b=P9fsHI1j12j+5xnmyPf9Px+3Qy7BOahmy0TTpWI2aIh2fRjgWGpvU84hui7Qp3zSV8iX
	 9Es4ay7Z7At8mPOoHBMlxPsrDSjln++4SiW4j7PMGYYl2qsXXCqmLkcSmEAaeJXie7mNd
	 J6IqxL2a2T2OPRRWxoqBxs49KxackeAyQzTb1UAGxCEa1vOn6JHeDp4HKS61yL3+ugOdf
	 +uG+icN0z25zDo92MWcbhSLrIe2NsiJafrZNLSGuavPlF8+DB40j++82ZWrD/qDE3a6Hi
	 7VsWY330FcmHOLgGMoVp0WmfdjK2GsX/lwxbJG005YbvUw89yeHOMYG5/Qtc7zaLNwQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790108567;
	bh=fiY68ZAvCovB4fEOFR2fyv3FHdEzJfRqpTnlrwMIvBE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=osnklswqNnb/WNcyzEBRd5L/AIlib5Pj6fEkoj6IWxaOU0lU+ud9Q0HoO3xWIN8pd
	 AAq5lWEUmDmzCTi4GbQeH5NEtp00PlIiFpywof4BtUvzFAtQGwD65UE9+gYU2Y3nkk
	 hPaMOIIyDTWnBcm09Kq9Vka6vUHkLGDMuEikh7r/T1G84JKBrbbLtDQffJzznTv5vK
	 RggfIsXiwOibRv7INoxaW7/63W8x9IESqFhG0GE0EwU/vDbKsEB3eE37FFa6ZC8n77
	 UsaOHsEdQ5ZgmNfwkdb4yNR5pUw4hDKxYxmcuowDPtSIEM6dYP3bXIi8tt4ZHWDEDQ
	 bgLm/hyJLoaEQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E5BF60615;
	Tue, 22 Sep 2026 20:22:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 53A6235A
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 20:22:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 39EC64067C
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 20:22:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0u9-7_yzORAG for <buildroot@buildroot.org>;
 Tue, 22 Sep 2026 20:22:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 259B240675
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790108564;
 b=FV1CKdpQh8N1c83TfkXPBQDTAhk8w9ZHRsT6g4KZcxkqwSnGuMjyJj9umdQaXnRsfAfo
 DYY2r8q+RhLZQJYz5LzdVAAAG2h0WS6BfzGfLot0by8hKv0WlPE4NkPFOp0AmJ+7CB2yt
 60tyNPMSwnaU4FIpNFnagar/xuTelFwFkUR/55o89PviZzdxKaLIgjuMFpxzqOO50VSEH
 Rcc8SJZKpzx721CIt8KoW8CFkpor9MvhNkLWg4MS/5Dwc48BEiGF7rA+tnAic3mIZae1Q
 K3RESkC4P41uX2QfF7tL9UzZWVMBhQMbpDQVRZEZ2o+nCq1NmpEZJwVmU+EQmlHQfag==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790108564;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=NUcTB7vdbjeicnSC4BLXMo9mmyzOG3SDYyVVWL9FNyk=;
 b=ZyoqnUMyG2sV3IXvtrJ0RceJTGPfea5dIN3vx/5NvF1uYlQ7ncymuXyY3iIYCVTKEVLM
 tcNmqsLFYL7Pzq8lQ8b6GhELly4QjYdlLmIK6d9vEtD4FcDOpEpymv6qyC0/DgRtOsc8d
 sISn7rQRoSeLe0LePoGkNeGZQGIjb+Cw8b6pf+ZsvAM+rE+LQnEzgDQnYc84M1AcCcsiS
 zCCGQwikZy0ouvIo8OqAqMG7eu9ufY1xfPVT5AQb4rEQPBiR6hScVyv4L5IvqgS7mXE/3
 84WOuAprY+exrMvSC5799mt2CXnEvaBLIR6MqPXILThdzGuNJkQV4rsegHewuwVmeow==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 259B240675
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 20:22:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9FFAA9829B; Tue, 22 Sep 2026 20:21:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Sep 2026 21:28:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e2b81003a490363bf249fc5a2ff4660f02333e8f
X-Git-Newrev: 2e4036e3a0a0f336bbd71722ba8f7587ac1f3233
X-Patchwork-Hint: ignore
Message-Id: <20260922202134.9FFAA9829B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/plutovg: new package
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2e4036e3a0a0f336bbd71722ba8f7587ac1f3233
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

plutovg is a standalone 2D vector graphics library providing path
filling and stroking, gradients and text rendering. It is the renderer
plutosvg is built on.

Examples are not built: they are demo programs that are never installed.

Signed-off-by: Alsey Coleman Miller <alseycmiller@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/plutovg/Config.in    |  7 +++++++
 package/plutovg/plutovg.hash |  3 +++
 package/plutovg/plutovg.mk   | 16 ++++++++++++++++
 5 files changed, 28 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 5cce270296..f4b746290e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -172,6 +172,7 @@ F:	package/xen/
 
 N:	Alsey Coleman Miller <alseycmiller@gmail.com>
 F:	package/liblc3/
+F:	package/plutovg/
 
 N:	Alvaro G. M <alvaro.gamez@hazent.com>
 F:	package/dcron/
diff --git a/package/Config.in b/package/Config.in
index 8d9ec62bfa..dcca214383 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -351,6 +351,7 @@ comment "Graphic libraries"
 	source "package/mesa3d-headers/Config.in"
 	source "package/ocrad/Config.in"
 	source "package/ogre/Config.in"
+	source "package/plutovg/Config.in"
 	source "package/psplash/Config.in"
 	source "package/sdl/Config.in"
 	source "package/sdl_gfx/Config.in"
diff --git a/package/plutovg/Config.in b/package/plutovg/Config.in
new file mode 100644
index 0000000000..f452318198
--- /dev/null
+++ b/package/plutovg/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PLUTOVG
+	bool "plutovg"
+	help
+	  plutovg is a standalone 2D vector graphics library, providing
+	  path filling and stroking, gradients, and text rendering.
+
+	  https://github.com/sammycage/plutovg
diff --git a/package/plutovg/plutovg.hash b/package/plutovg/plutovg.hash
new file mode 100644
index 0000000000..95ef84fee3
--- /dev/null
+++ b/package/plutovg/plutovg.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  2b0d17a6e016f47b86f9c00e2cb82600041b1ea1f7d2a00c2d46ae542cbfed3c  plutovg-1.3.3.tar.gz
+sha256  a55d1e78eaf75779c336b4ba061e74aae56a21195d234474fb24a398935d6ce1  LICENSE
diff --git a/package/plutovg/plutovg.mk b/package/plutovg/plutovg.mk
new file mode 100644
index 0000000000..a77fac1c43
--- /dev/null
+++ b/package/plutovg/plutovg.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# plutovg
+#
+################################################################################
+
+PLUTOVG_VERSION = 1.3.3
+PLUTOVG_SITE = $(call github,sammycage,plutovg,v$(PLUTOVG_VERSION))
+PLUTOVG_LICENSE = MIT
+PLUTOVG_LICENSE_FILES = LICENSE
+PLUTOVG_INSTALL_STAGING = YES
+PLUTOVG_DEPENDENCIES = host-pkgconf
+
+PLUTOVG_CONF_OPTS = -DPLUTOVG_BUILD_EXAMPLES=OFF
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
