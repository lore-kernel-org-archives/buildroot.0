Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F0AEC433F5
	for <buildroot@archiver.kernel.org>; Fri,  4 Feb 2022 15:49:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BAF4840A44;
	Fri,  4 Feb 2022 15:49:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GjhcUIkOgTpn; Fri,  4 Feb 2022 15:49:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B982D405C7;
	Fri,  4 Feb 2022 15:49:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CCC331BF2A6
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 15:46:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA4A8404CC
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 15:46:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RVFnLH_MsCa4 for <buildroot@lists.busybox.net>;
 Fri,  4 Feb 2022 15:46:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E5A70405C0
 for <buildroot@buildroot.org>; Fri,  4 Feb 2022 15:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643989593;
 bh=QQ+WY95dqsviFLlpPySWysNwJ4SgV2y+BJJ+KT1x+Sg=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=X/kYFCxxWAOC6aN+Ic8QRjnSEjpBDW26FcgR4FTqfOlv7F/oX5cJLpSZ2VZkQq0IX
 +18x37p0xTy3BahxK0ge4JxfITLTLtLe4o4TVQHaHe4R10t47ymuGYlOTej+J8FTqN
 iI0vVdJ/cSvZDA4Rz1zaKqEa1MEqTW7T3ba1GWDw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.201]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1Mn2WF-1mXMid3uFz-00k7cK for <buildroot@buildroot.org>; Fri, 04 Feb 2022
 16:46:33 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Fri,  4 Feb 2022 16:46:23 +0100
Message-Id: <20220204154631.17814-5-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220204154631.17814-1-ps.report@gmx.net>
References: <20220204154631.17814-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:oBgaCZjgZwhnv/hARF6yjXwHm24uQYACGtO7lckpzWkd/SVgiHp
 gwOhICwM0LlfgupfOX/dQJhJEzF8sSrYqg8d9OhzwBUcNzXK5YrdUgZUSQHusStHbg1FciQ
 FvwPSGA8XB7KxpkKlQ520SQgH/PBTpIjylXClz4V8IeCYftjEgaaar1PSlVTGjPOrZAdbQM
 B2K+9tMspAHVSdEbGO7NQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:TLbNPxGnQ1E=:89+c8sOkb9eanbYkjAXOLE
 71B0PJEtOm9UcwJ3UDgaf0orifSkCIe6o36AcZbcZGv7Dl0IrADJgdyvXWdbiwVZ8ngqeJqDn
 iWntoq2HoggsGFIaRdV6fLBILoxxhsHZaiFmhQspr8H2WEL8DqLP2IwN9FCU/EdrAJXhlyhY2
 admH3h6D1dT8qY+alof64DzSOhfnldWzmd6YXFWMrkawB+9G3ZW2CUzjqvFSFDjasvyvHlMlN
 KzxmeYoUgtZkWUo/RgcLZ6YxxPrlKhmf0Q75xkH4njOe9GWErtt7yryKaLL4nB/6AJM8Kf5SW
 19qA4xUhhMBkPso1mo6N2cKqew90gticYlBTo3XxH3r3+Ojy/u/ocp5ufepqnEHT9Ao42jh2E
 913EbEh0jcnYeabQZYdw3YXchORsJV5FyftlXW1o+cKvz2DCTs64ONATe//B+YqAk3rnNNu4z
 KPFO3gmSAieG9VSm0hGBGQ4McjJ5rLDwfKTfdcOfi1luHo6KlfsySoiLqn7V4nalIvJPIAXWf
 rvykrdJJ94V37oI9j78e3mSy1rSFCyewGh0woS02zM9IpTNFX479i7XA2qQiMc0zdoilg4SzD
 Jh6JZMxhxhYDmGLiEDJpoYPo07jPD3WF4cwuibiY3qV/RLB9LqwxUpYurD+VicaYofJGYhmpq
 x4VRyFav9YrXKuHS+cyi2HFxgs+geNi7Km6ZS8O2oxaAY6hSypU0+qTYbsE6M+9XXz9+sp0ZK
 ow3tAcEI/gvd8dDiqShMt3On9EyBJZN/7/YcFjnQmsksbO3MXHRW458P8HMJA+MaAvkM1VO5o
 9LAFxqwDYkf81rvs/p2lyww6iKscAntP5/J/5BpKhCupvZBNfMmTW0+p5aSnCHx4DD7ateBWv
 bdG7ebyHunBmtN3WMJdwkkZP2LMlG8AIqY0Dnl+X07dMqe/78m3ptbY2/uJifShTdIAH1DINV
 11Y1mclWpZP1zVyfp+juLwFWhZ1ltPi/uvG9lSXzF3O8Wo10ZAVORxSqTAOmiug+kExzqOhPP
 LsvYTZcOkbxyYKL2J6X9L6/q+ir3tSTo8GmSrKaep0H75TCbvVAZ37VoQB18inA2pPcGD97ey
 L+vNvlYbEqtAOM=
Subject: [Buildroot] [PATCH v1 04/12] package/gst1-plugins-bad: bump version
 to 1.18.6
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash | 4 ++--
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
index cbb2729dab..d31a78981e 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.18.5.tar.xz.sha256sum
-sha256  a164923b94f0d08578a6fcaeaac6e0c05da788a46903a1086870e9ca45ad678e  gst-plugins-bad-1.18.5.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.18.6.tar.xz.sha256sum
+sha256  0b1b50ac6311f0c510248b6cd64d6d3c94369344828baa602db85ded5bc70ec9  gst-plugins-bad-1.18.6.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index ac00fd59e1..d02ca1ba74 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BAD_VERSION = 1.18.5
+GST1_PLUGINS_BAD_VERSION = 1.18.6
 GST1_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST1_PLUGINS_BAD_VERSION).tar.xz
 GST1_PLUGINS_BAD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-bad
 GST1_PLUGINS_BAD_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
