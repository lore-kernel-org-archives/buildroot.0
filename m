Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF682CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:03:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96B1740C9C;
	Sat,  3 Oct 2026 07:03:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vBYgg_3e1RCs; Sat,  3 Oct 2026 07:03:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org ABB7240BC0
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011021;
	b=KC/NBUvA3CWOnzzZGMvQjLtjSi7PRIjDao2M8mW4qHNXGYMJJT9iG4kxmPBCLh5ua/Ax
	 S0qGskGdyGXjCyOUE3DcupE4cIxrERb6yCQOrvfO0GvkutZEWVE0iAmqynPorUnapU50b
	 Bx5wB0/GgyvrItWfwZMvKsYFmlRxAYbQIjHyOPqAPcUADWBvKpsY2phecsDnbj0BQUt2e
	 NPDYtbOMyYpV4KrmFa1kAr8SEqoeakFGc69cp3yxESuYsKT1vKYs+3qVZM5+Tg1w3ymvw
	 dZ94CNM8rpWmvnMPsoPD15T5puJ++RxyH3Qx/2b7y2q19gTAY8KcBwp89+PXmRGmmNA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011021;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=VGUI+fljfVyed88vQ5mSOHCQ87dWWasfwBmK++12Pnc=;
	b=D2xNrBg7ivk1WfTN3JgWAufWSFroKzW7NFzfRcGxFnW46HGlF5PUvOEG1Ro7gM5cCWT2
	 lfXYh6zevpxx1ybxeFA2w13qsU5y4iYgmwFschOm5lSXKwJpbZCIOloXfJmBxLHPboJCa
	 1wCRo3lSAmcaCObFZLeIASuT+ta0thU0ibZuv1ex2hJeSlCxWZxj5eV2jyDbaUjedMJeh
	 mV+d2lLpjjPGBiV/aOv1p6Z6ceALSRjKNfdWXZ3OkCub7HGhpDqQ65oen/qWXJRRltzZ+
	 Qk6CZLUTYAXZCYagXA9acsUGxbMM6/V9ddYn5nyGy0tvtruwekoNBOTzpIrToZFh/iQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=h6vKO0gd;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011021;
	bh=VGUI+fljfVyed88vQ5mSOHCQ87dWWasfwBmK++12Pnc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=XT9XaDj1X5kCNpYiXYYaWIann4ejIz/h+xBYmwOAQbLvJ/3PgyF9RM/TCoMT4p84G
	 tWdNhR37CF1YlYwexSUA4diD7+cB+mK9NkBwOLUG0/CSXae8gdvw1BaCCkp/7t2/Fm
	 1lOfhjhY4Y8fdLdrnZAINl9CZzbwIJn0DSC6FwawCUcnmzU5zA0mn9gES0cjXevIlA
	 XiBdUGD9uYjPTBY+PyNGvaIKgTdN+oSvx+SbPfHgtphNv+PgPImZgAK7HzkkD+4rxY
	 eQQ8bYd6wnfjFc+TfkoNWowKQIZobicWmDfEORH4pNkaMFsrI4Kkzs5iF+dwKNFIx6
	 +6T7GuCKtjU1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABB7240BC0;
	Sat,  3 Oct 2026 07:03:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 23EBC263
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:03:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1503A40BC0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:03:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EjSylM6Jy5co for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:03:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 1DE4940BAB
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011019;
 b=jwZ28g6+sdiW2Po5UWNvFZaoVpoPXaHYGVzLF1eDgatAQ2bB9IUoeCU0qQivW4N0KtYd
 mQ608DvuO95i/gm8dpDG0USds+HGMwxg7DmMoNsq5X096LSSF4J9PNtCXSV/OK6H5Rdb2
 tbDjLH8Tj4238sTnKhbEuYZyyGgEBF+4/wQi9/f2+wU+R4b6S4g0F8M2jcqTODvQr9G71
 RQ1XMtRtkcHhjkb3jP8Ipp9cdZve22ZbAWlvP/Pw+VXycrZlLCnsLWqfGhIQ+BItuAdHA
 uqBSfOpK1B3uaYbNdyOaj9jdGuBwlmLPc9FdA1UEyFA+WS+dLJuSLLPD5dPdfNp1BkA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011019;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=9HdKI+UTLYAbym/5pi8Y52QgPSVG4j9YHMYPcA/Slqs=;
 b=MgIOo3K88Hk8JM9O0BYYO5lJGqZey29O0vn56udyYkE6PEwmCOOnMhYMfsGZ9A5bmU8+
 ZKcDmZtP6T4HONsLHusL9mxI0VVGLQL3KoxBs2Ng6NXjpQX446e/VuUfEJW+VEuinDVBo
 zR1UgCpBmAb8kc+9UUOTA9QYFzVUmVe18rjAq3JruJNTcwl6ztNRy48lI3fX2gbL/exG4
 I+NHKm5hcfy7gH5qxKxvm4yAf5GtUtUolbScPXujEPFFFRQC+6Dx9zECFZBpr/Mq6zmSp
 EeomPiI2F2jAQLVSjqI4rtSnQGiCQthAyiHYzFsMeM94DzbTA7NHC+PDZwJw/quL05Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=h6vKO0gd; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=h6vKO0gd
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1DE4940BAB
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010922;
 bh=9HdKI+UTLYAbym/5pi8Y52QgPSVG4j9YHMYPcA/Slqs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=h6vKO0gdmpAeHOD7ju2USaJwoFRAm6qj/9Sc8oop9sidoJSj4ltkoVeMdKhPC7+10
 m8XxFvryI7i8cbJaQv/L4l3v/Qtcsm7iLM69GoKUTJyJ8c1Vq3bthYlK/eq65ktNdZ
 q4GMUCoD6IHeGXR/u4xe143tPmyzwA4Jr2hERLChKR0Ud8AkNf1kjm48k8bTdWJVop
 zD3aUZl8MwyQdgbpFAcn2astD1GfIqc57vBUl4oUkDgZYPstrFzP54FPTz+ZsPBJMk
 ZjprCzJCbADktU9T8ZmguzfSxDsv3F1D8t3UAbHjyJ47qJ1oN7AVU1yxnmwu21s0/Z
 kTX77/3wEg+/g==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 32myMRd5Q2F+np4DA9WfNJMBxQo5whbZivMPw1lGOmRpUwwKpvQQRGICnPtD7KqyB5sJGFNKuvi
 JopjjlHiZoI8mixaar7gM8gXTfFglGOh3pKPPe9tq0OimS30B+/I+p2UQqI6UmFMdEX7znthqmF
 OVH6gG4OKIBHHRGd/uLUDoI63mVugjg7ILvHGl/KnLkLxdDatD5Wjl6gBkt9pOJnAywRqU2SMKb
 wxKpf9Njdf/P3g8VLYOEU4zsuOdpM5psHaS2K62OPK8nbKSUGYfu3WzQ99TW8oOS3g/1r9r/isc
 vngZYErqR74qpcSD3ODwU8YRvEDlBRWBlgTuDyU3IzhJl8772USMQTzH/IfwvwKlPHT3h35hblx
 nDRewnu07K0oh1lI2iAIiZA9eHYk4uXcrq6sALfVSrlBI3wiH1jdSnhRi5l2Uf/XeIwX2pVk3wo
 +FMwM7HE7WTNHwaVRCEPw86bCjHiKeS34oxYpbjRGl7I2w8Tc5lDvbzd1Uwg70Ecj4/aQtgOELr
 rjZqzR0MwpAFlEnjEod7WpstaILIJYR2DmYoGvvjNvlrEL977LgmWUlXbFFRpkD0BhZrJvrFVs6
 67exyA+490Jpr04J7U8OxtAyr930aUEthI/8+r+4GtCBomzY8N/uFKXpEQE0bt49Dw==
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9DA3EA4C5411;
 Sat,  3 Oct 2026 09:02:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkj-000000007Zo-2DgJ;
 Sat, 03 Oct 2026 07:01:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:01:21 +0200
Message-ID: <20261003070128.1295458-109-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 109/114] package/python-xlib: fix build with
 setuptools >= 82
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Joseph Kogut <joseph.kogut@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 ...rate-from-pkg_resources-to-importlib.patch | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 package/python-xlib/0001-build-Migrate-from-pkg_resources-to-importlib.patch

diff --git a/package/python-xlib/0001-build-Migrate-from-pkg_resources-to-importlib.patch b/package/python-xlib/0001-build-Migrate-from-pkg_resources-to-importlib.patch
new file mode 100644
index 0000000000..beb924f4c8
--- /dev/null
+++ b/package/python-xlib/0001-build-Migrate-from-pkg_resources-to-importlib.patch
@@ -0,0 +1,42 @@
+From 52394387f94b798af3431cd16cc48b9f6ebcb53e Mon Sep 17 00:00:00 2001
+From: Evan Maddock <maddock.evan@vivaldi.net>
+Date: Mon, 8 Jun 2026 19:01:47 -0400
+Subject: [PATCH] build: Migrate from pkg_resources to importlib
+
+Setuptools 82 removed the `pkg_resources` module.
+The replacement is `importlib`. This fixes the use
+of the removed module.
+
+Signed-off-by: Evan Maddock <maddock.evan@vivaldi.net>
+
+Upstream: https://github.com/python-xlib/python-xlib/pull/290
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ setup.py | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index 71bdb08..6086f54 100644
+--- a/setup.py
++++ b/setup.py
+@@ -1,12 +1,13 @@
+ # Distutils script for python-xlib
+ 
+-from pkg_resources import parse_requirements
++from importlib.metadata import version
+ from setuptools import (__version__ as setuptools_version, setup)
+ 
+ 
+ # Check setuptools is recent enough to support `setup.cfg`.
+-setuptools_require = next(parse_requirements('setuptools>=30.3.0'))
+-assert setuptools_version in setuptools_require, '{} is required'.format(setuptools_require)
++installed_version = version('setuptools')
++setuptools_require = '30.3.0'
++assert setuptools_version >= setuptools_require, 'setuptools >= {} is required'.format(setuptools_require)
+ 
+ 
+ setup(
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
