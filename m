Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A8D8C433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 19:29:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E113F60BD7;
	Thu, 10 Feb 2022 19:29:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gxvzXq2FFUcF; Thu, 10 Feb 2022 19:29:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 162CF60A74;
	Thu, 10 Feb 2022 19:29:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1245F1C113E
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 19:29:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F3E0817A5
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 19:29:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jCYZKD6nIxCN for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 19:29:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CFB1281775
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 19:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644521346;
 bh=1G1bJN0Pfksb6pPUoLngjwr+nbpqnpSmZy4eqoBQRLc=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=HlmFUrfrbtlc+JOZ+f8CqYnt6VpKKiOIDLcmkx3z5TWELyfasRNEEejyqK4uqME8h
 qwSFVC4L+YwtVk5k0i8q38wmwEX8U16BMKrSFSg2IQ4AlSidH9gOSW5uWfwXSVsqI3
 entfVSZEqJz4RGjLGgwSNbeic58GYAVG8r2bdGQQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.34]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mq2j2-1o5J8S0dwA-00nB3z; Thu, 10
 Feb 2022 20:29:06 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Thu, 10 Feb 2022 20:28:53 +0100
Message-Id: <20220210192905.4500-2-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220210192905.4500-1-ps.report@gmx.net>
References: <20220210192905.4500-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:y1O1G61CVfwiG4//aW/f6PmcyB1ymo7TZHbpMtXNm63alyzVGFz
 P25SrhL4z8DyU4/++dkC9jgW8PfvEczH6Szl+AXWDQapNeva1kTsG5PBLyk4VgK20jP3fxC
 n5Zxzon4lGdA5XetW69f4KVVIhoADZQbAdm4YgDZ6MguXuBnNd1oORcTv9zKVFybo6TvusH
 6mcqvnr6rZr4DVj7xLfHg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:VKozQn53VnA=:GSVNqN0PuKywXPOQXyuXyY
 AX5o4vbqv1pn1XEBuxjTvt2bH8t5lyG3a0Moh5cfprmrQHI8c2Pj1omQnJXiuCi9JUuK6VHNV
 ISzik2jQZGyRxmG7s9+NAj/rUNtKUVAkrjtLidEaUoVN++rKP6nPkJ/HCgAhvCrrRaBHByFOy
 gJ6posemobn+fgN+b5y3lGfMHttGdy6U3UBa9z6T/p3QTTeZzdEi9uaAjiNifH8+WYz0EkYCE
 3LZEpl6kGudZZalZHEFBRvb4/sDZbQU0fKMdIZgz3RSaE/D97c6Lz46VcF66SFIFQ1Cm0w9Nq
 QHRmiIjA0f0SB8sQ9AJr8De/ujQf4McdskzV2n9OVV+kh7rOnZg413T9f7LioaAqbkg2PEON2
 /Kwyg3F4OKmVdu2upzCq/GYXrEADuTUt1G2pzu0DUDm7xzQYR3GHOVPEb42hAkR7dV6zPaw5W
 lvouYvT5u5fCDQBZUjo9dBNZLNQKTuoXuX4KhsNYWje9xwF4sUolI13yXhY8zFRoWvHZwBOoU
 p00pHGk4WshEEb2e3uS+1ZsSeDdPm4xi1HO1GL8vfTlwOrpbl78R9LLDJyN3KEEmLcCWKWC7a
 i7f4Ur5Cthnk7+WZ37+nXo6vWqdoTEmMF+gVcSAhfS9u15jAZWIMd0L37jnkPOKBZT//QkCp6
 mWXdV1W47lbveA5Vbeoan9UVMYsSODOo19fCS1mlTXXubRwrPzmkJ44TpBgGYdJO4n7gPcbq6
 494BcFWHT3WvcGmdD8QIISnsTMpEko90aJM5nQcvvjw4+6D8yRuQpO9v95gOb1N+wIiSnX6Hj
 ao2NH4wbS0jRQjNyQhkR9wn13OdXFhQnCzEFqXgwxDg6ZFQbLpZstUaKoyUvDaiQVCq+u/xle
 RMpKcWmZp/mgKRDLVxS7e8BlURw4E+KOv62TdJAPcETVX0459MPJrkW0ZnL0j1WqiGA1kB9PD
 T7yeaVI4DcWIloUQ3eWzPwmQCZLrouu6cDh2txcxbj5GPvFqeo7L8PRu7mg/2utBHK9KtyhnZ
 qLdmo9l6x3g117oITkVdyE6vGEOl1/TxL8HgpHWTGbwNPvfLE7RWHgFZiZxJHfLlDkzLA9uVM
 /MIK1Z31489vWA=
Subject: [Buildroot] [PATCH v2 01/13] package/gstreamer1: bump version to
 1.20.0
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

- meson option gtk_doc removed ([1])

- update COPYING hash (license text update from LGPL-2.0+ to LGPL-2.1+,
  see [2]) and adjust GSTREAMER1_LICENSE accordingly

[1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/f5ee12395832d4305bb8dbdf4751552d03430d6d.patch

[2] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/d157b23fb0ce175b167611a4cb019599d9017042.patch

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gstreamer1/gstreamer1/gstreamer1.hash | 6 +++---
 package/gstreamer1/gstreamer1/gstreamer1.mk   | 5 ++---
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/gstreamer1/gstreamer1/gstreamer1.hash b/package/gstreamer1/gstreamer1/gstreamer1.hash
index 1202bf2c50..f4a74a6125 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.hash
+++ b/package/gstreamer1/gstreamer1/gstreamer1.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.18.6.tar.xz.sha256sum
-sha256  4ec816010dd4d3a93cf470ad0a6f25315f52b204eb1d71dfa70ab8a1c3bd06e6  gstreamer-1.18.6.tar.xz
-sha256  f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a  COPYING
+# From https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.20.0.tar.xz.sha256sum
+sha256  edf4bffff85591d4fff7b21bb9ed7f0feabc123ac4a4eff29e73cbce454f9db7  gstreamer-1.20.0.tar.xz
+sha256  ad2eec519ebd4b5df86ea84dff24ae3bfa2edea846a703b58902dd221ae375db  COPYING
diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
index 27745f3bf9..86df5d6cf6 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-GSTREAMER1_VERSION = 1.18.6
+GSTREAMER1_VERSION = 1.20.0
 GSTREAMER1_SOURCE = gstreamer-$(GSTREAMER1_VERSION).tar.xz
 GSTREAMER1_SITE = https://gstreamer.freedesktop.org/src/gstreamer
 GSTREAMER1_INSTALL_STAGING = YES
 GSTREAMER1_LICENSE_FILES = COPYING
-GSTREAMER1_LICENSE = LGPL-2.0+, LGPL-2.1+
+GSTREAMER1_LICENSE = LGPL-2.1+
 GSTREAMER1_CPE_ID_VENDOR = gstreamer_project
 GSTREAMER1_CPE_ID_PRODUCT = gstreamer
 
@@ -18,7 +18,6 @@ GSTREAMER1_CONF_OPTS = \
 	-Dtests=disabled \
 	-Dbenchmarks=disabled \
 	-Dtools=$(if $(BR2_PACKAGE_GSTREAMER1_INSTALL_TOOLS),enabled,disabled) \
-	-Dgtk_doc=disabled \
 	-Dgobject-cast-checks=disabled \
 	-Dglib-asserts=disabled \
 	-Dglib-checks=disabled \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
