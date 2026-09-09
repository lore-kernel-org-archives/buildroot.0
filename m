Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6877CC79FAD
	for <buildroot@archiver.kernel.org>; Wed,  9 Sep 2026 11:19:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E946A406F3;
	Wed,  9 Sep 2026 11:19:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lw0FRg78D5GE; Wed,  9 Sep 2026 11:19:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6CC61406D1
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788952764;
	b=Y7ItHwyik5L97pxbhnP6oouCelWhJ1HtBsLBD8Midn3+7oZIAXQr70YErxdtmklF8FTY
	 0cnssQMufvjX18VKysk9H6PjJCHwt0JzLm/5EVY6RfUZ3+EDmhhI3/n8f8M8ebk48lLqz
	 5AHyv7xNmKH+lMDlEE7j3FcnjlwaogmnQvWK8ZFmzYNKak/8KucpUApFG1/Gcz1009OlM
	 UbkY7Fv12uUPLfDfitMFqNXqlHOT2sX70wko+lAqtQmxsg/nynQilE2v9/9mcqMoyAK+7
	 BK9iWd6FODRVYSiV+PD/FQ9fCchSnjzdJqCfajHMNT3wp9zFLDdlpsdHwbdjccv2LLg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788952764;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=HDBNnCDSkDKkgb+mH8S9ZdsoWLaSufT6wYx994Ad4Yo=;
	b=XOvNc3KVgvqn2pwW+4e+cDLCNhXY9d4uo4fopbLwQtiedg3TOY/EgqHYLp1Woc9L5pyJ
	 mQYai3Bx8VhzYtOTpdnybqYcan3gxE+D6XdH2WQpDoN9hACcZtC4CiP1aFlA7ZOchiDYb
	 wZ1W1fS6zPmpPwtBtdX15Exn3+z+l4VI7xJqc0dCDkp+Q6ktYnJro3IlJ0YKfb+3OuYNt
	 eJh9AIKJ82XDOV0mjFpNgu+lgW4HB5du1mqhmBSQ/e+2DPyaOgmaA5PAxuK/TJaCqY0wZ
	 463RAGwGieqE0X8t2wnd8XGzZzZpxjjDfLy2FuR+nCBLNb0hUtfsdNW5uW1wCOkbG8g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788952764;
	bh=HDBNnCDSkDKkgb+mH8S9ZdsoWLaSufT6wYx994Ad4Yo=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ppJU2QYFRH1BaXCgWmZBazkI56PDNEREWTMh3UlzSKg4jFThPbdONLY8AN/3497YB
	 DMoh7h6h2QUN/sDVu1jY075pjhkG++7nppiAY8Xs05GyAcSILMiJ4zTwHpqqCVpgjz
	 EzEvXweC66tCdNKpMFGlY0A2XpMAxUaqofEtVMzg0KxsQEl2Bjv73dnv3Z1ctfWzGT
	 p8T0TfD5sdjeu0RF4hlB8Cdi7qD/d6v2nDnQ+7iTHE1pOgaqXm9TRo/D6OkdvqnN3j
	 VtLPV9f1HTm52cCEDWIfhrHSeztG4fmhMj0QF/n/QB4BZbTIm7iQEJc4fYohfCaPis
	 i6MkdElP8cUaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CC61406D1;
	Wed,  9 Sep 2026 11:19:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 19E9E29B
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 11:19:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0BDEE400C2
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 11:19:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DjT39LkzMS9N for <buildroot@buildroot.org>;
 Wed,  9 Sep 2026 11:19:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 5084A40026
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788952762;
 b=ME09uOLo0LLHDFnQ6I/zcmWU52aEX/GiRjWz6PtfjaIGY1KISzpI3m/wqs1diYJgoOaY
 hwZ/RN87xv/cdYORftONTmNjeRHR8oyRgXLSNcP59JtZe61OG4NxvT6vMGGAwOOz9m/WX
 QURVT4p3MenYdM9GzyDzTWCemxE43ZbDU3/IgBX2ZG6ujxXEBrKHHoVHfX/DNtJjv+uvN
 7D9R3OhHrGdmziieE5HYXlzciHESa23t8jdLIf1e7WQ/ofWzZYqVUHXG/O8pE7gw1cfxu
 TF9tqjuyQ3dxe0IWhiL7qZtXIkfVyr4Kq71DkVMLZNt3Qd0ngNhfIQPJw2kZP74JJZQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788952762;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=LobzVCM2X5fN2YDLXM27ntyiHFiPN2mq5URp2NmghCc=;
 b=rg30UJA1M6bK2KzrpL6nec1AwNV8J8jCI7FnXRrY8lJtKwzLVJO3scVL/AuOebwn4UAo
 FaeWvkfMqAuNEe7P3nIiuigOHTtrRD+ReOsLelFLl5sPwC6+GgnC1RRatYgGjqGvlja8m
 EdXFiNY5+yaw59T25ToxZ3J9UmA170ZYwlBJWcGcNNS+WVj9rMcD2pGgN9mPUEajBZYsJ
 BVrQsNdtrLdAts+OJFZpsS5S2J/C8S15n2Yq2OvIEA7vPMSGd+c+VenGat1NpW8YezE8h
 fiPgJgfrazMmEcAfNmsCOBFJws906uVGTDyZo8q6epvYWfc8ay5niTc3yzAvGMQYtlw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=ttP63QT2; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=ttP63QT2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5084A40026
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 11:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788952758;
 bh=LobzVCM2X5fN2YDLXM27ntyiHFiPN2mq5URp2NmghCc=;
 h=From:To:Cc:Subject:Date:From;
 b=ttP63QT2tYRWPlWmOW+Nm0IFMBp/4ueW8jcEpNjETYCxckhTQvmnPkA7302KaKZsF
 6/3BhCrj+YIN/iE76+cUlL65fjRuuh1Uh8Ab7jGrp+oWaung2qTLsqV13IemzPB3UW
 Lg5VpVe1DdqYFZ+yrU8Q9+gfklB8+GQrXr9opmtzgpNwMRz3GjJQa8W5MSW3pGKc/3
 tJUnzHsWV5ai/M+x+0tPZ1ek0t7JCmHHtXfAaGGJPypW214P2Me1B96aCqohaGQsCH
 ZC4Qwk0vdoy66k9hiFz2YtE2xlBmN/FqN4kvgSqjL+Brtqvx++N7zNlX5grzDHJeFq
 kEi0jAg2hNwGw==
Received: from fli4l.lan.fli4l (p54a1bccf.dip0.t-ipconnect.de [84.161.188.207])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A5668A4C1FB5;
 Wed,  9 Sep 2026 13:19:18 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48946)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x4GKk-000000000ON-295d;
 Wed, 09 Sep 2026 11:19:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: "Yann E . MORIN" <yann.morin@orange.com>
Date: Wed,  9 Sep 2026 13:19:18 +0200
Message-ID: <20260909111918.3705686-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/1] package/skopeo: bump version to 1.24.0
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

https://github.com/podman-container-tools/skopeo/releases/tag/v1.24.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/b367d0399d4e09fbef1978d7e71f7ce44d4f6cef

 package/skopeo/skopeo.hash | 2 +-
 package/skopeo/skopeo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/skopeo/skopeo.hash b/package/skopeo/skopeo.hash
index abd68d13f7..8a9fb22133 100644
--- a/package/skopeo/skopeo.hash
+++ b/package/skopeo/skopeo.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  de96bfc2bb523c852af675ffdadd934484812ce190aa8620e1d5fd6c51442e25  skopeo-1.23.0-go2.tar.gz
+sha256  1eea9364e344c4d6cb398fac53bc387663d19690552003b43c75819e8bb55527  skopeo-1.24.0-go2.tar.gz
 sha256  716a8b80635c394681e652823e1e42e411ad2d254e1f202403422d74f4b0b106  LICENSE
diff --git a/package/skopeo/skopeo.mk b/package/skopeo/skopeo.mk
index c2fe201c7c..354998b175 100644
--- a/package/skopeo/skopeo.mk
+++ b/package/skopeo/skopeo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SKOPEO_VERSION = 1.23.0
+SKOPEO_VERSION = 1.24.0
 SKOPEO_SITE = $(call github,containers,skopeo,v$(SKOPEO_VERSION))
 
 SKOPEO_LICENSE = Apache-2.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
