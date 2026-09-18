Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 002D1C982D8
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 18:56:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBC4440B10;
	Fri, 18 Sep 2026 18:56:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bcgldCNDBUgP; Fri, 18 Sep 2026 18:56:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E119440CE8
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789757789;
	b=eSfjOkQPMg48wGHajNkStI3WFwKv4uMoszInzz2JcNssp1HC/vurP20UiNK/O0XJ/w7A
	 M4y2Zf/XM7EDVTGBlSAoJBX1dBeY7OZIKhz8iskAhu2RQ2Hkl+P6wMCJRXC/890+mfaJ+
	 agc1U8XV8inpNKuKRXccpK3/4owlPt2jU5kzZUSZwBO4Xyvf2ckMkFGrb8Op5oiB+O1Wp
	 xi4b+1z4wOphHGAO7z7LgxBCYzz74L/4+E9rBICx8XyZUZi7lAK+divKjlp0Wfh2GFx8d
	 38ALuw6DQEy+7LE15TQtxUSPhVFl/RE9tNmM3KoacGeKRClqcyDGkGr+F6g/PLENYFA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789757789;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=+ad4XvIk8KRN3crymuuUiV/3f/jcXmWAX8WkfdtfKG0=;
	b=hcpgeGimsa8YfacFCV4UXcd5lBJy+304TKuILvockX8mxGtG9FZ5/C/Db6Z3KK+ZdX/h
	 +1w+qk/Q7asX5a+8kzRUqP3/7KBKrr6rIdq53JKstzBZznmo4fSuQPx3yWIODn30JT945
	 tjZH/wnLRHffQoFZ1ztv3sfqwHtejUsdgDBk5vk7VGkRTMVYvif1kD70TZabYX0an/mtt
	 b+QVzryLqa1T/8J5NJjBz6nObMpcRazwpPWGJ5ngu/urMdgoouFtvQZF5a+FBKb4t1yN5
	 vU/gOi6+CKL8FPr4GXxeTkKMArYR8a8QGrYHg1w/HtFZP/t3xXNBXTpgb75B1vsovwg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789757789;
	bh=+ad4XvIk8KRN3crymuuUiV/3f/jcXmWAX8WkfdtfKG0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=p7kKW5IIfwF6x9CpCm3xkhq0C30c+J3Df8pR8tTr07WAm+XRpuQmHzWx08dxYGh/8
	 s0ShkEJF5mbB/suxNV1BTZLdRwWiRItZYEIRIICWoK9j4m1zzBj8HZIHrMA+tfLIzx
	 J5Qlnp7lvG49dttALgr3MoSlcpYRiyZMLwmbAktM2qCRSw9b/js7kXZQCq8Tx0QteB
	 U/ZwLuhiHU/BssgOimbdEhH8mRzmVW+wHQIPkoQRAIDmxj7NBWQ51S0TZLUmB+bTzM
	 Tom1lqTA4aCNQmYeWab5ma6f26T9xW8ea5YyHxbm9BQv+6UcfwpeXP6CTUs/e9yz4M
	 LVOeLekZlpSwQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E119440CE8;
	Fri, 18 Sep 2026 18:56:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B59F237
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:56:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4154960E95
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:56:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fxvZoDc8hO1g for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 18:56:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 554C760E60
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789757786;
 b=DphY/Pqu4iq0kIxUX6O8vMcXW29LvPsZoiA9maUdEOvpuYgM/FeLG9ye/lMJXJi2blqO
 y0DBjWl6fut7uRI/bMoQ++mfWgH9GnKVoHP+DDzRorZ4lBflOcGBn411DjraACc26qhif
 SMwn7MEO4cy+/BJnYA8DjV3YI4D28anLVc4J3XjTxAzJLLHOZ+Wqw3cFRjT7siI4YxdQv
 FSCd51Fgo5Kv+yBGXtvK3n7LdVekpN40q5/a1/arebQycK3TOPbTsXAZjhAXuJx0GO7HY
 q9V+WtUrmy3mtu5+xSmHKCT56wa9LunhhK73OYkr7jSMnxTm64b/k2p0HMruafiYj2w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789757786;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=5gDvCJ+UXhkxW77CQFBghKeHwlvChzvv2/WWLjOyl5E=;
 b=hI1d2BscoUF0yFFerZzXRzDFu+DfMOSxLf9vGr9a5Pjevd1gUp2OEj2J/UEpqChpCyvb
 0K4AfIdsddGqDR+IdXKrowmPXm/sJc7po9Jr+aQuYBuv4dq4m8qxD+7ZGXOzPHn6M+Y2N
 9jhnlM2CWRvjjileMkPMuSP4ERCOubY0k5iuRCDsND7/SpFzR9aMCMSqeF41fN1TaRcgc
 xiGmF2JqX38QaUlWxbcuqJJ7jKN7F+uTIQdw2lkz+nxxaC6EIZq8FIoXfaMkTqbHFI36w
 XfRyE8BdW6MfDT28Dmedp4xbcCtmjsIFa8Ieb+rFx2zeiSThrACzSx2aWbrze4xtc6Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="eSvlSVG/"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=eSvlSVG/
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 554C760E60
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789756950;
 bh=5gDvCJ+UXhkxW77CQFBghKeHwlvChzvv2/WWLjOyl5E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=eSvlSVG/DUNSz9BMVbxE7+6VL6lYtQj0Vg3zbQxKC0vWvza3yfMvo/r7GcyiSNNqa
 mz7JBsF8Pb+j+YDV6+K3yRWu3B8ApBhMQh0Qy8174i21hQKOYi0RxAhUTZC8EMSvKt
 ejE+7jVkopi58XeqbNmCrZCZuTEXntrbU/TKiyGEb67tWOmbgBzmq5Hk2J6M1GbiSb
 eawEJTov9CTtIy2sUAV11AApSKgvBCGUW8Y3fDInuMO9RtIka4Kx5JLuOk0V7fugSe
 bxrtBRZmkKZ1ZWCuR3+M9dnAgY8DDwzArU/KfTl6meaAQo88qcCXZByNnpI0n03jtS
 oJot48vMO4zqQ==
X-KAS-Sym: v3:f51bdf72230551df:lkseH4ZbqNj6+SWeyhXOROAVDVA4wctn5GqYnvj392NxznN0rSxqdWBYYBdhITxI14gBE1k+pJkBIChL3/t/lCKYI3GtmdM3wrKpFumwg08Wm/sNokIQQ6E7zEBL3K1/hdJasLCtPFWYZLZ4DnysL3d4pK5HKpKudG9dMfXruRPXYqC+sKlv7VCmjdbM67WcbSYib/I5z3KXlTx93kwxaIjh7oHXDaIgSs3BBwdUhzwgu27GIhhGPs84OFj8HKUhaehmsatqjfsuhHQOPWGzMJyclLrqdN8RENcGlb3kAp1RNMG5gE4Srsk7d6rPHzd5pP0v2pHDKySwyfSJf2xgPw==:OREJoH1lrJsiLLo7tjiHFKwdG+ACN50baKay8wMVK+flwoTw9a8fzAOCvsFZYy/GhsfbgRGtjHZEH2s1gMlGo2Ubanti2ikon3I6gpFI53VbNA9g6BrcKdlT9oXnStGRecK54gI1zmY9OlXqIUAI1dIsmDc3tpBdhJRS6BK6d6moeAXs9DeZ+Dtg5bgzMoPWZ8FdEgZkvzzlWyi9zuDIcBxnQsQ8qh8Ui2D7XokRBj5nHRSf1q7P3M3/MnmuvT0auYCrpSoN+ee8NZkHxTf8YmyNNprGUXFA291Gxokt+h1Z4iXTvY0YiwxzQ8eY66Y5jcJnsgaBpzIH5uKqpyQN4Cf07WcV+iY5/dRAO4lLDnAlm70kWMtYBb7Sa0HycbS/5KB1LY5SaFD5LAxunicz6TJfCpi2t4n7e3QmXQu2JjknPbu2yl1v3jDKKn3ZtcDwCn193V0Al2HQwm3EqYe1TD1FAlXuFGA2xPMpLM1pqle9mBl7mcSgQrthpySa6s0/j7k80NihR3lsc0KFPMfXL3+fM4ePQ59+ks3ji3h0PZKOFphPvWU9LRjBzIEGHKYbn1H30DTmxsqep0rSq+fQAKrnR0pkzVNmEcRZjj9nRR7nGN
 4R5hP5ZGvoDqgIQ/VF62BlHb/3ReMEG0r6qgWSG+O3X02YyOBfahy5GdJcK+wTblKoNkG35uP7
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 79543A4C46B6;
 Fri, 18 Sep 2026 20:42:30 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59900)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7dX0-000000007cB-3vOq;
 Fri, 18 Sep 2026 18:41:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 20:41:24 +0200
Message-ID: <20260918184140.3631274-63-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918184140.3631274-1-bernd@kuhls.net>
References: <20260918184140.3631274-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 62/77] package/redis: Fix build with OpenSSL
 4.0.0
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
Cc: Koen Martens <gmc@sonologic.nl>,
 Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, David GOUARIN <dgouarin@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Romain Naour <romain.naour@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

tls.c:676:5: error: 'X509_NAME_get_text_by_NID' is deprecated: Since OpenSSL 4.0 [-Werror=deprecated-declarations]
  676 |     int len = X509_NAME_get_text_by_NID(subject, nid, buf, sizeof(buf));
      |     ^~~
In file included from ../../../per-package/redis/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/openssl/ssl.h:34,
                 from tls.c:22:
../../../per-package/redis/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/openssl/x509.h:1041:27: note: declared here
 1041 | OSSL_DEPRECATEDIN_4_0 int X509_NAME_get_text_by_NID(const X509_NAME *name,
      |                           ^~~~~~~~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors

Upstream PR exists to fix the build problem:
https://github.com/redis/redis/pull/15227

Added buildroot-specific patch to remove -Werror=deprecated-declarations
from CFLAGS to not block the bump of OpenSSL to 4.0.2.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...emove-Werror-deprecated-declarations.patch | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/redis/0004-Remove-Werror-deprecated-declarations.patch

diff --git a/package/redis/0004-Remove-Werror-deprecated-declarations.patch b/package/redis/0004-Remove-Werror-deprecated-declarations.patch
new file mode 100644
index 0000000000..3c33456d52
--- /dev/null
+++ b/package/redis/0004-Remove-Werror-deprecated-declarations.patch
@@ -0,0 +1,28 @@
+From b42c0326b542b0e5d29cbfef2ab08d0d36430803 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Thu, 17 Sep 2026 23:58:19 +0200
+Subject: [PATCH] Remove -Werror=deprecated-declarations
+
+Upstream: not applicable
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/Makefile b/src/Makefile
+index 205508596..4f31a3af0 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -52,7 +52,7 @@ ifneq (,$(findstring FreeBSD,$(uname_S)))
+   STD+=-Wno-c11-extensions
+ endif
+ endif
+-WARN=-Wall -W -Wno-missing-field-initializers -Werror=deprecated-declarations -Wstrict-prototypes
++WARN=-Wall -W -Wno-missing-field-initializers -Wstrict-prototypes
+ OPT=$(OPTIMIZATION)
+ 
+ SKIP_VEC_SETS?=no
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
