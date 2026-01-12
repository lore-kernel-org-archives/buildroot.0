Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D343FD25032
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:15:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9F83611B7;
	Mon, 12 Jan 2026 08:15:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9_ArZD2y9RnK; Mon, 12 Jan 2026 08:15:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFB38614B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768205745;
	bh=MDx4HLYkVPZm2mQzvi8BL3QufdfGy20rNn0wwuUHaZY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HN+8R6pUN+MuuTv/ub4HZLvLVqZlr7qUCAolTyd6fsjysiGr2L/7Q4ieoLKPFU2Qv
	 nYSzdVvxILLEvoS9938C0GLX6B2lyQyNF7XQDvLMT2iws2MdcxJaj76U5GGq7GdCzn
	 853BE2YoLREvY/Dz3OjHwvOTx65quct452rY2SP+j8rblEYjG9Fq0jtTDEas5xYeDG
	 9knpcJ8wp8+iF+5D8Rgf/FdlRMctdX4BtfJPsk1ajY3OOxps+afOT2ctQafHf5pvC1
	 sAFZ14JB3Wlu11opsFHeZsJOVyuZKDNaBB9yXQkm/lEkHSPzyTSz2tRCUWRmvIJiYC
	 23R4P8KZcWJnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFB38614B1;
	Mon, 12 Jan 2026 08:15:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 00D6B12E
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:15:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7725414B7
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:15:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Ag-kTZTPWDG for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:15:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DD9F8414B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD9F8414B6
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DD9F8414B6
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:15:42 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 34BE5A4C3CC4
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:05:35 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCuR-000000003M6-30FV
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:02:41 +0100
Message-ID: <20260112080419.2516889-6-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205135;
 bh=/LOFWZgkTmfh6JbCTkNcHO0AO9n9V+zBsIkAxDz14e8=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=jzWff+yGNz0tM0B5Fk6TPq2t6rOszLzJFRPXDJov0YjaI6fmT+pJjWVNL/J4AoAQM
 b3LCb9ySC9+O1+R2vAZ7p/gUgh1nSOO7VtbQQNWfe+sDvnn4ESjUN4T0Rn9smULdBz
 coInepjGQlKi+YzsqNldhpyPtqbicEIZaljBMTBOdK4t/DX+DFXzieOrB6RxZl+cep
 4il3OhYINYILsVQ15QFuw1MhoguKbtK5TBfcQi+gICb+pB06rmflOhOUPsYCJ+1paz
 HA8r6g5Olc5jbqN92BFM8UVBVv72SesRN4Ed0gGEc3qhfktE1112rYOpPLnEsRntLL
 P3OWKQw3LbJfA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=jzWff+yG
Subject: [Buildroot] [PATCH 006/104] package/x11r7/xorgproto: bump version
 to 2025.1
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

https://lists.x.org/archives/xorg-announce/2025-December/003649.html

Updated license hashes due to upstream commit:
https://gitlab.freedesktop.org/xorg/proto/xorgproto/-/commit/f7176375692e47275e89c3064da4cd3a0f8dd1e7

Added dependencies to host-pkgconf to fix a build error which would be
introduced by this bump due to configure being created by autoconf 2.72
instead of 2.71 which was used for xorgproto 2024.1.

The configure script at line 5146 now contains

 if test -z "$PKG_CONFIG"; then
     as_fn_error $? "pkg-config not found" "$LINENO" 5
 fi

where the previous script would continue:

2024.1:
checking pkg-config is at least version 0.9.0... ./configure: line 4796:
 /home/bernd/buildroot/output/per-package/xorgproto/host/bin/pkg-config: No such file or directory
no
checking build system type... x86_64-pc-linux-gnu

2025.1:
checking pkg-config is at least version 0.9.0... ./configure: line 5137:
 /home/bernd/buildroot/output/per-package/xorgproto/host/bin/pkg-config: No such file or directory
no
configure: error: pkg-config not found

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xorgproto/xorgproto.hash | 20 ++++++++++----------
 package/x11r7/xorgproto/xorgproto.mk   |  4 +++-
 2 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/package/x11r7/xorgproto/xorgproto.hash b/package/x11r7/xorgproto/xorgproto.hash
index 941ceabd49..300d5d0810 100644
--- a/package/x11r7/xorgproto/xorgproto.hash
+++ b/package/x11r7/xorgproto/xorgproto.hash
@@ -1,8 +1,8 @@
-# Verified from https://xorg.freedesktop.org/archive/individual/proto/xorgproto-2024.1.tar.xz.sig
+# Verified from https://xorg.freedesktop.org/archive/individual/proto/xorgproto-2025.1.tar.xz.sig
 # with key 67DC86F2623FC5FD4BB5225D14706DBE1E4B4540
-# From https://lists.x.org/archives/xorg-announce/2024-March/003495.html
-sha256  372225fd40815b8423547f5d890c5debc72e88b91088fbfb13158c20495ccb59  xorgproto-2024.1.tar.xz
-sha512  63955cb604ff831575af2193548857c1b99e52d00206ea9421ce99e145094bcd907388c4574bc32174a01cbe2c940b0377bf75ae7d2c0f953157dc9c32e5a07f  xorgproto-2024.1.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-December/003649.html
+sha256  56898c716c0578df8a2d828c9c3e5c528277705c0484381a81960fe1a67668e8  xorgproto-2025.1.tar.xz
+sha512  dbbee3aa1bc62721d64309e1d98807d403609d8129944b2e23e48f95d30c6448718c2842362994d67647908645bafc757c710070c5dcdca96d191fd2689d023a  xorgproto-2025.1.tar.xz
 
 # Locally computed
 sha256  aacd931f191b610902aee1e526090c2858aabc07969441fa2537ffd3e7049555  COPYING-applewmproto
@@ -18,22 +18,22 @@ sha256  1ab381e978bff63d68be2e4f235d51935f3f16f3ba3bebf83afa99a70c0484a2  COPYIN
 sha256  f4af05774b02ae149357cc26f7bf5ef1116c2e09373c2492081a3a1892c58417  COPYING-fontsproto
 sha256  823deb4673d3f26aa8c90e704888299648f00be3262f9363eaeecedcd65b936d  COPYING-glproto
 sha256  5e083a2ace0215a6084c877c023a6079952ba803d692488203ba4269196debe3  COPYING-inputproto
-sha256  d397a67d4b28e897bc5fce79b2b917df9905b54f961fc3ad1f49c7fe3803f92c  COPYING-kbproto
-sha256  7a5dd5d4c989c167da50f15879959f42bbda960e06d0a0aea7197f61fe1dc846  COPYING-lg3dproto
+sha256  883f26ebeffb29f955c1e2becdee284bce16c7139b1410f6f7331d3bd59bfc78  COPYING-kbproto
+sha256  2467132d97b75edba05d908604124be2f46ee113954f848c99bcd938055e8e4b  COPYING-lg3dproto
 sha256  8442b5f22f2fb13017a4302a906e7dedc899267b41f613558970941120170128  COPYING-pmproto
 sha256  64a579d1a0b3347301d87c94698a58ea7933d0ae6ca7e8fdd702fde2ea376301  COPYING-presentproto
 sha256  46f599055002bbf3e6ce244bde8d9ebe5ec24ae7906836db186773a9791d0b75  COPYING-printproto
 sha256  41c13dcd09147ed2440286f2fb8151df8ebee06deee4ed78ddf094601c216d3d  COPYING-randrproto
-sha256  ee10aee0f1697ffdbe870a39f037361d4f7136f2976bb7919a41b3f66407caee  COPYING-recordproto
-sha256  9e48921a94da36d7a69fe71809223ee0bb46370db9842dccdeeb55b5a9946872  COPYING-renderproto
+sha256  e37891ac36e827611d6e7ae51ddb14a9cc9ba56f6cc87c55b6ce3b6d76cd2bf4  COPYING-recordproto
+sha256  e0ca4f1d27a95ef7552ccdfce7e95ddf1e8b10ac713a05b49e8bd82713d7914b  COPYING-renderproto
 sha256  403e7be948674530ad40669b1e3a31adeddb656502f3b0ef810d5d3cc35d0b52  COPYING-resourceproto
 sha256  fcbd3c628bf4d28ee3e6032054bf44bbe58f3b1a944dad856a8d3eb6b37ea412  COPYING-scrnsaverproto
-sha256  d6d3513f5a7099748dc387f54498d799380b45f8a444f13aa98aa45a860ae55b  COPYING-trapproto
+sha256  2c1807ecb78dddba1a9cd612a11bfdbc013b77144880ec3c268241495cb022dd  COPYING-trapproto
 sha256  f8f49bbad61967ebc890fb79fff5bfb7cfc1c341aa8f8dee13eb3fb534040b47  COPYING-videoproto
 sha256  eb183a00c61bb47992f096b6993ed7ec17518bea9c285fe87efff7f622cc6c12  COPYING-windowswmproto
 sha256  da835951edc6e3b8d168d6afe7447c65d0b9a99937293cf3f288bba8244a9f86  COPYING-x11proto
 sha256  5531d18cfcc944dab39991f63f182cbbce3fe493ba0c7cf08a25c0d01ee84482  COPYING-xcmiscproto
-sha256  fb42146c6c06a200a9b121220eb692ff9101ba0fbd0b224b9e16a016c59ae86a  COPYING-xextproto
+sha256  bcdbd7abc060725d3a16c6f5b2d673ab38691f6f7d55c62709140555f8944b9c  COPYING-xextproto
 sha256  3591964e01a9cdfc9cc4149a847a431a3f3d98328cc9e5864c7a7831b29c4058  COPYING-xf86bigfontproto
 sha256  3591964e01a9cdfc9cc4149a847a431a3f3d98328cc9e5864c7a7831b29c4058  COPYING-xf86dgaproto
 sha256  4a05d06752388d9db71ee1006f371d4fb2c316a821fc2fc272db90b3ef978334  COPYING-xf86driproto
diff --git a/package/x11r7/xorgproto/xorgproto.mk b/package/x11r7/xorgproto/xorgproto.mk
index 0253167372..2704e84546 100644
--- a/package/x11r7/xorgproto/xorgproto.mk
+++ b/package/x11r7/xorgproto/xorgproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XORGPROTO_VERSION = 2024.1
+XORGPROTO_VERSION = 2025.1
 XORGPROTO_SOURCE = xorgproto-$(XORGPROTO_VERSION).tar.xz
 XORGPROTO_SITE = https://xorg.freedesktop.org/archive/individual/proto
 XORGPROTO_LICENSE = MIT
@@ -50,6 +50,8 @@ XORGPROTO_INSTALL_STAGING = YES
 XORGPROTO_INSTALL_TARGET = NO
 # xproxymngproto is needed by xfindproxy
 XORGPROTO_CONF_OPTS += --enable-legacy
+XORGPROTO_DEPENDENCIES = host-pkgconf
+HOST_XORGPROTO_DEPENDENCIES = host-pkgconf
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
