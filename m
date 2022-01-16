Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B533CC433F5
	for <buildroot@archiver.kernel.org>; Sun, 16 Jan 2022 23:18:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D8318143F;
	Sun, 16 Jan 2022 23:18:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G_cYRS2WL8XX; Sun, 16 Jan 2022 23:18:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 650FC8144E;
	Sun, 16 Jan 2022 23:18:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8C6EB1BF3C5
 for <buildroot@lists.busybox.net>; Sun, 16 Jan 2022 23:18:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 79B1F40435
 for <buildroot@lists.busybox.net>; Sun, 16 Jan 2022 23:18:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=dbrgn.ch header.b="vCGRYd6u";
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.b="goGuZsx8"
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y13GbmkG2lws for <buildroot@lists.busybox.net>;
 Sun, 16 Jan 2022 23:18:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5D3FC40178
 for <buildroot@buildroot.org>; Sun, 16 Jan 2022 23:18:22 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 2FBE05C0131
 for <buildroot@buildroot.org>; Sun, 16 Jan 2022 18:18:22 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Sun, 16 Jan 2022 18:18:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dbrgn.ch; h=date
 :from:to:subject:message-id:mime-version:content-type
 :content-transfer-encoding; s=fm1; bh=RWMomaJmf2zVas0wglvr6eAK2L
 JQ9/tPgEfbLksJmCM=; b=vCGRYd6uvTdxJt+VJEhQXIPcz5cIF+kM3zgY5Jh/1B
 iJj3pC3NcbED96j4429n+4uDHCT4jvOQE+5NDUym+VA8tjhEoY1dI3+riSsPPgDn
 r9eX+xG9LRBEUwK0Vvdc4DEaUVYbaDXQgsKWN9nAGBZjA7lB/Ekpy6Nx1DJBykoR
 jmz8Z/HAI8dq3JaDeRCVUDnxSOh1pGYgtAIBJ+wcyZis5G4+pjmkOZTORUDYvF6o
 Ib9f0EOLbq52EZslsnmcA7QW6tU5gdQT1Yfw3d24GHax5Q2TJHgYTQqezwNqLQI7
 bRvqLcbmWQNOkSdxMpdMOt0Cc7ht19zfmt8cX2LnfZBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=RWMoma
 Jmf2zVas0wglvr6eAK2LJQ9/tPgEfbLksJmCM=; b=goGuZsx8ug/qItUkAgZGPH
 BAOGTn6eZXOi3uIAQ7o4LJd0hm1nPdBKvhsKB1ywv5SWdiSWwVZ2rBR3uEg0hH1A
 YdyIB+DMWJD+HHy5raovRfiBYsTB9OOhJE6gnFNDpObdCJWpMjd0MGV0In+simNe
 my7tepDvzXwJxTlkcNWIBz77j1q43/BWGu4KojK/+sFCjs5yUsMEflL25qITWboA
 I2IFuhLq7MozwjOcTYBk0ofvd9cxD0BeT6NKShmvMMMKRKTQu9o+1jg7oM9KJsen
 GrSEGUKvsMoURM3KXvnb3n6NNY3j1YP6mGhFRFmLW39bulAh1TKhmuEMJv5PlIiA
 ==
X-ME-Sender: <xms:vafkYQN3h6AvWViWOamnZ4DfFunXLKX2HzlwEAPgUHRHgsgEYkafuw>
 <xme:vafkYW96VKcpDIO9nUw7VqKKl6jeMuKYq82GGENNj1s_t3yVY4Y0PQ23ivajsqbJN
 Lil1HueLmsIVRUT>
X-ME-Received: <xmr:vafkYXQzrDzmWSzhh_B0s1B4qAOPwKjEv9X0AV_ASCc_1r45jFX_ZyL7Y12DzxwZFwXyugvQVEuq3tQjI5iUhA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddtgddtlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukffogggtgfesthejredtre
 dtvdenucfhrhhomhepffgrnhhilhhouceurghrghgvnhcuoehmrghilhesuggsrhhgnhdr
 tghhqeenucggtffrrghtthgvrhhnpeevueffleeltdevvefgkefgkedtudegkefhjeegud
 eglefgheekieehgeduteekveenucffohhmrghinhepthhlughrrdhshhdpghhithhhuhgs
 rdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrihhlsegusghrghhnrdgthh
X-ME-Proxy: <xmx:vafkYYuMX9csZEC4iLkPmIhg6k87tQPpXCAkKvC-3RG2PoTnUhjfgg>
 <xmx:vafkYYd9W-K5Ed0V26e8r7-EmORpYprWSYaomPpDLR7E92nimiTZCQ>
 <xmx:vafkYc1YFt9AiDJQDcdurcCZfOYB0ab510fDQZcg2i_6XhC-tlN46Q>
 <xmx:vqfkYUF-CdzP-sBl9akUd8NnYlP_qPlryF0KLO_Lg5KNA5bfXGtxMA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <buildroot@buildroot.org>; Sun, 16 Jan 2022 18:18:21 -0500 (EST)
Date: Mon, 17 Jan 2022 00:18:14 +0100
From: Danilo Bargen <mail@dbrgn.ch>
To: buildroot@buildroot.org
Message-ID: <20220117001814.2645cd1b@c3po>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/tealdeer: new package
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

Tealdeer is a fast and full-featured tldr client. tldr pages are
simplified and community-driven man pages, see https://tldr.sh/ for more
information.

https://github.com/dbrgn/tealdeer/

Signed-off-by: Danilo Bargen <mail@dbrgn.ch>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/tealdeer/Config.in     | 10 ++++++++++
 package/tealdeer/tealdeer.hash |  4 ++++
 package/tealdeer/tealdeer.mk   | 12 ++++++++++++
 5 files changed, 28 insertions(+)
 create mode 100644 package/tealdeer/Config.in
 create mode 100644 package/tealdeer/tealdeer.hash
 create mode 100644 package/tealdeer/tealdeer.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index a91e2dfcde..d2f23968d0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -643,6 +643,7 @@ N:	Daniel Sangue <daniel.sangue@sangue.ch>
 F:	package/libftdi1/

 N:	Danilo Bargen <mail@dbrgn.ch>
+F:  package/tealdeer/
 F:	board/pcengines/apu2/
 F:	configs/pcengines_apu2_defconfig

diff --git a/package/Config.in b/package/Config.in
index 4df1474b91..6e5e69a4f1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2604,6 +2604,7 @@ menu "System tools"
 	source "package/systemd-bootchart/Config.in"
 	source "package/sysvinit/Config.in"
 	source "package/tar/Config.in"
+	source "package/tealdeer/Config.in"
 	source "package/thermald/Config.in"
 	source "package/tpm-tools/Config.in"
 	source "package/tpm2-abrmd/Config.in"
diff --git a/package/tealdeer/Config.in b/package/tealdeer/Config.in
new file mode 100644
index 0000000000..96ed81614b
--- /dev/null
+++ b/package/tealdeer/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_TEALDEER
+	bool "tealdeer"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_RUSTC
+	help
+	  A fast and full-featured tldr client. tldr pages are
+	  simplified and community-driven man pages, see
+	  https://tldr.sh/ for more information.
+
+	  https://github.com/dbrgn/tealdeer/
diff --git a/package/tealdeer/tealdeer.hash b/package/tealdeer/tealdeer.hash
new file mode 100644
index 0000000000..0e53174841
--- /dev/null
+++ b/package/tealdeer/tealdeer.hash
@@ -0,0 +1,4 @@
+# Locally generated
+sha256  42febf9ee84721b9230077d62e2fc51201fd59624d3c776ccc1a634788768a60  tealdeer-1.5.0.tar.gz
+sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
+sha256  a313b5e62b80a08f3aae0fa62ff3de8482ef55247299eb352ab44f87ef456b1b  LICENSE-MIT
diff --git a/package/tealdeer/tealdeer.mk b/package/tealdeer/tealdeer.mk
new file mode 100644
index 0000000000..c396225098
--- /dev/null
+++ b/package/tealdeer/tealdeer.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# tealdeer
+#
+################################################################################
+
+TEALDEER_VERSION = 1.5.0
+TEALDEER_SITE = $(call github,dbrgn,tealdeer,v$(TEALDEER_VERSION))
+TEALDEER_LICENSE = Apache-2.0 or MIT
+TEALDEER_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
+
+$(eval $(cargo-package))
--
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
