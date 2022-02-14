Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D7FC433EF
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 15:49:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6806760F26;
	Mon, 14 Feb 2022 15:49:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wX9DzK4zkFHB; Mon, 14 Feb 2022 15:49:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAE3760F1D;
	Mon, 14 Feb 2022 15:49:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 763E21BF385
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 15:49:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 64F3560F24
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 15:49:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fZyLJVLbIVEr for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 15:49:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 04A2A60F1D
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 15:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644853766;
 bh=GCUuRVrcs3eLmnlqhbV2HTJ6GedF06rJvG9XSss/Nuo=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=RO3jI6O9UHZA4tvnZaxlfYS1l3F9/fpUlfYVMhJeXonhE+Gy9oapWopRNsxrUKdq8
 /CsPpH4moBZii/XReTwYYYbkGtCzaluKzFcxnn++bBbOUsDmdPkzE7Coevd2JWeRCR
 EKoPcFpd/PyRrdtOWCpmWhMs1tD5EpheVTU/X9E4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.232]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1Mo6v3-1o3dXx0Z4t-00peXL for <buildroot@buildroot.org>; Mon, 14 Feb 2022
 16:49:26 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Mon, 14 Feb 2022 16:49:25 +0100
Message-Id: <20220214154925.6014-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:0OcRos8ZPtY9NOaU2wouLTjOevWgfwbS2Kvg4AwaVmcPjpqh886
 rhT35B9gAtxlfDQrgYfAw7O6RyOHtMoevZ30mYZ6cuEtGyU1069JNWbQHeHqlFvV+vbFGlk
 oGWSp2FiZJLjWPXqymMlJ+8QL3WniYbAEHE3g/RsL0xhuTh3Ooo+CCZMXepMdrerCOZTKbq
 HJQ8VZlZVswDhCtLpXjeA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:JfgyurosmQ4=:GFS4ouPHTYVN4L4EyMbFP7
 h0Vmgf3QdrE+Dm5aTXzUAnXhW3kiseYjQnYNs47YmamCPyWIRVQeb1h7B6KoVUli2pfkOOxZk
 xNQ8bnLmeepj4hsHFEDI8ODsATavAViZ7FZQOUYbz0AvUYMZjqBAtxUFYlcxay3ejmDPCIqOP
 eMJXcT204/adaLBlAZdRy4m6eKXjJPApbJWwuO0a61yX0eCamUYGi4LB3JcgwU18SYe3ik+Oz
 FeWLm33yI0o4XhWGqxsZfS6DLKWBgL63YeEXPqmEox2GfNEG3SMDAkmJ0mGih9VBisKNw4grh
 AYRJBB/HD1zLZ6v+ex5D9hSED2S62v7fkIi3wF7SrSPyJTlyYgbR2dq1PVeIdTsAMtT4whpeY
 iwVTk9x7EMsY6lVW9fI5ZliYAG70Th0pNS0OThKoJ3LrCVv7Ub5leEu8gyt8TveifvzK43VSL
 jOH7Camxw7r5Andvd2sEOOkkEmzaxZ4nJKEfS7V0zNJWPNU34cP7uoH4Alssm9jTGJ2gL6+/M
 iwcBnO9DJ/dkChWqzDAA3elFx/JYXZVDu3Y+oSf5GtU4oxjlR8avKUoAuYdndhl+5tcKnTeWi
 I66dt3toI766U8/9dQicm+cEI79jClpkyY9Az95RaukS1UvCem80CzJbeFg12pJtKAkjXBBBW
 reJQXsIAJjglulPJWGY7vciIA+SzToGT4knSnt5i72JGEr9DnrL+bf5Uh5kDqhB6w4T+UFxmf
 77ED26dxSa9LnGGgLNUGhb50Z27wdcYDjUW7ckZjqiImsp1y5BoSfeUFMMn9WAKwaqrzfXUzL
 2z8lU5jmb6ZmWTNiMd42l+CtpRWSLTVjoA2geqmdxTD8nWdUI/1mCdRqeT+PqbV96LKlQbaF3
 Pp94L88HNoUO/o6XsgtbbgJCorUmoYbyIIjbnozKr/XcwaB+HUyffjepKHh2ozF8bPadpAOcy
 /KT8sDCDBKub2/fXwA9N3AX44CWnlcJl5A1AMfl6K0Ai5LfAWruC5Qor0aGBEpZ3GwBeGxjzN
 K7pRUMkJB/NAxATx37JRg/PDM612YeNdypF1HXLXK4SXMWJJcyklF6eOMub0k0avfjYy0vxU7
 Nf42r652d3M83I=
Subject: [Buildroot] [PATCH v1] package/util-linux: bump version to 2.37.4
 (fixes CVE-2022-0563)
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

For details see [1] and [2].

[1] https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.37/v2.37.4-ChangeLog
[2] https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.37/v2.37.4-ReleaseNotes

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/util-linux/util-linux.hash | 2 +-
 package/util-linux/util-linux.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/util-linux/util-linux.hash b/package/util-linux/util-linux.hash
index 9c10a42dca..748a36e0be 100644
--- a/package/util-linux/util-linux.hash
+++ b/package/util-linux/util-linux.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/utils/util-linux/v2.37/sha256sums.asc
-sha256  590c592e58cd6bf38519cb467af05ce6a1ab18040e3e3418f24bcfb2f55f9776  util-linux-2.37.3.tar.xz
+sha256  634e6916ad913366c3536b6468e7844769549b99a7b2bf80314de78ab5655b83  util-linux-2.37.4.tar.xz
 # License files, locally calculated
 sha256  869660b5269f4f40a8a679da7f403ea3a6e71d46087aab5e14871b09bcb55955  README.licensing
 sha256  9b718a9460fed5952466421235bc79eb49d4e9eacc920d7a9dd6285ab8fd6c6d  Documentation/licenses/COPYING.BSD-3-Clause
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index a25b69d910..891c17d1d9 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -8,7 +8,7 @@
 # util-linux-libs/util-linux-libs.mk needs to be updated accordingly as well.
 
 UTIL_LINUX_VERSION_MAJOR = 2.37
-UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).3
+UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).4
 UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
 UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
