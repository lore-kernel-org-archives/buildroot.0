Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5EEAC433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 19:30:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FEFE4091F;
	Thu, 10 Feb 2022 19:30:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kDQXDMsZ8eHA; Thu, 10 Feb 2022 19:30:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A44A3408F1;
	Thu, 10 Feb 2022 19:30:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A93171BF3BB
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 19:29:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 978CB60A74
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 19:29:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NFuyhwH5nD6l for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 19:29:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 63CC1607A4
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 19:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644521348;
 bh=9FB/tBH4ZuGe+vgxOXM9TBlTluDyw8oaI2OVUVo7m6M=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Eu7Z+26x+yEukOpCgS9AI3ofCVIwIS5ELQXIGfMmqDcpjwMFaq54iBQZN25lHVZCw
 ngYMPpp+w5yIF/gH4Po4TXnz016Q3fSru9DoVR/XJseEvuE8u2zDHk5ANhB+GCN89b
 lFHo57iNBI/fcZyRmz9F8jWrFpKSVIXAEKxIlctI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.34]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N3KPg-1oIQAY1FuU-010I5z; Thu, 10
 Feb 2022 20:29:08 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Thu, 10 Feb 2022 20:29:03 +0100
Message-Id: <20220210192905.4500-12-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220210192905.4500-1-ps.report@gmx.net>
References: <20220210192905.4500-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:u0PXczoMDlM7iMyY8rcBjhfietigYcUk6kH5OuOvCQNkIYH7LAh
 vLEfzj3sUP3CPotKVRqbul0EQU/dBspHF3ahfyJ2i4HhQjS7C4gGFEPUBBIbbNMHDfRxadA
 SzGMnr8ZhfEiRmJZAWDRdiqdJNWIixgCXPzefKAOV8ToDT9ADXERH5TpXuLX1DJv7vmva9S
 gROT90v3GMSRjnttNeELA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:dIeRZ5EM4/o=:GS+tEz7po0Qi3gzA3SVgHD
 Ib7kbEk7g50LYOQmpFKzUILEBnnNeKFD/UhDjwQj0izHs8n48V6icMCSqJ1UoZqcaekMK/5UQ
 jdX4N54+BTie3aZ2rJNnnzUks824CuXysgSTb9lUmAxXEXyiSlZRv6T00qjAcYqiJQW+uXoX1
 zdF0yH5mO0OJC2BTAm6bv9IwLjtWKkVq5S3n+bl6cCj9ndb7bi//1CkhXzXVPf0JcJI3l8EHR
 obNM0qmXSmVMjZ9BC7y+TGd3gz4GwWOZ4qTO79MiAZRm8GtZsGAwdk03SwIpAHfl5J9wvcPWJ
 juGfXaqkGGk2FsUQvtUDjavWSzOLk3KV/CXcGV1qejwIqTRtLi+TRMQiNixz7Krnx+BSuXdEK
 2jafRdN2yaRA89NYRNX4+GGIi0F9AsHsibTmvOZQtvibctAmD9A22gtGbQj+67elxm4ntfmZ3
 bd5RF1FqzxrXc/Y+NX12TF7hGCSBZca8PCxeKTHDmf1Kns1nS+ha9tuN0e9Sm04IrSOSAqKnL
 3mzHVKaIN5lhkdGNQWC2qBTAIxAk+3oLFSLuUtVOplg9FKT44MOysVlC6UEXcy+2jvalgxJAt
 kLtVUCwevsJXMjLkUXaEYUmNAG9FwrFc6zQx4MOci8EDbIhnHXfzLJM3WN1jiIGcSRNFNCsVO
 SWjWhpNbp8iuY8qaQrYxuh7En88L6ihyl9jB86Ny5Xl7LpkthBiFdf983Em8/0vZZGU80X3Jw
 oEKneTj+j7xY1vMbkpmHbi3L85KxGXdAx/u/K4qxvlCpOCTBlrXNo1nFRtTxQJyFRbxJtek33
 xapTP7EciiOm3v8BYUX7Rl7zfpD10kDidQCOtWrnHJ0l5/A+Zx5x9M5DjmZv20tDv54yKYklm
 2Ke8lIXOenBIwDmLleV1H6QixNo8M2cna0HBdyFqA15K/siBbIAmRNsyzjfX1WTNcmRiE8499
 DqvOCpJCkjSJfuB0+oB9BoMdCUqLCdyz5TrcKYgPfvWaikuikjcu5ttQXBu8UAR2XiuIMgRtT
 C5Z4UWHWDv5sop31y8mlfKDt9ekxcpjHPbJSXgItzPNHlCw7SCGm3n9U2x/R9Q8amSFw42Tzq
 41jBqgJPSr2iDw=
Subject: [Buildroot] [PATCH v2 11/13] package/gst-omx: bump version to 1.20.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Eloi Bail <eloi.bail@savoirfairelinux.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gstreamer1/gst-omx/gst-omx.hash | 4 ++--
 package/gstreamer1/gst-omx/gst-omx.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst-omx/gst-omx.hash b/package/gstreamer1/gst-omx/gst-omx.hash
index 47f7cb5893..0b95505c5f 100644
--- a/package/gstreamer1/gst-omx/gst-omx.hash
+++ b/package/gstreamer1/gst-omx/gst-omx.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.18.6.tar.xz.sha256sum
-sha256  b5281c938e959fd2418e989cfb6065fdd9fe5f6f87ee86236c9427166e708163  gst-omx-1.18.6.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.20.0.tar.xz.sha256sum
+sha256  c1e46b70ac379ac7b3646506370c9e1007b56ae293f4d334bc0e724c76c345dd  gst-omx-1.20.0.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gstreamer1/gst-omx/gst-omx.mk b/package/gstreamer1/gst-omx/gst-omx.mk
index dc65509244..f71e1242ff 100644
--- a/package/gstreamer1/gst-omx/gst-omx.mk
+++ b/package/gstreamer1/gst-omx/gst-omx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST_OMX_VERSION = 1.18.6
+GST_OMX_VERSION = 1.20.0
 GST_OMX_SOURCE = gst-omx-$(GST_OMX_VERSION).tar.xz
 GST_OMX_SITE = https://gstreamer.freedesktop.org/src/gst-omx
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
