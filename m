Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F43DCA601E
	for <buildroot@archiver.kernel.org>; Fri,  9 Oct 2026 20:08:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9EFC40674;
	Fri,  9 Oct 2026 20:08:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qs_5F7p5ox7T; Fri,  9 Oct 2026 20:08:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 111A2407B8
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791576497;
	b=SeTBWfM/n/kCChFmqTy4KCQsCW1ukxjIZTc9PByBVes+P8nUoA5HItzUyYmhPRgsX9EG
	 fDFmCbacKXcELFMTXc7KmNGtbHr0YpYWA8BqeVHQxQE9WzQPStFKzUDOeamAXqoQvywgU
	 P877wmirJhjXT2qN1kq8kTGcPOGuFwM+IzsAdUIDMNg2Ib3TT1UpJUGY+RVlBsTQZDnA3
	 VVQAMmbl4xu6HbaAxIrhpOM4vjhhbJChyp3C6rRpUdxnkx1ovie8EahBKv67cRRIPWDrG
	 liJB4NF6m19OWaAcwfaqMILghnCrUPXRKGEYVIenW/rSSiIfkUREz0ZiqlYD6dRjsFg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791576497;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Cn3ySfjxklajLozlo2697xov8QdMB2VGrA8z//0e2VE=;
	b=HThye+/BU9TFXCMRwcn2NqfaSeyAr3U8zwn0JC5UjMYdWsXXL8O0lFYAPGuYo/AJxKVm
	 ytmLZk4tpytrsrS3ZdltIm1OZgaKy04B+/VZF34C5r33socZEd6zo0lxIrYkBaUnq39AZ
	 Xn3U4WCxzly/Q4WIyovCgZPguGFIPaT9Av5+iukeS+9/dMiSIJaySyinG4QWdDzlabE3w
	 q31lWECpqPsFWdvOH7XxjgFOMEbep+ctBnVEqRXnABaF0UtpFXO93Ig5js5V6k6o5Hvw4
	 BYmmZSrquV044X8omafCye6XpQEQuVQxsRFWC7FNANYt84PhDfeCsAspsVpI7Ddxl5w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791576497;
	bh=Cn3ySfjxklajLozlo2697xov8QdMB2VGrA8z//0e2VE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GiuIGzS/eTWweGIiTTa39ZqNa5OLAkKYwBGejLy1fjoe9Iiw5WxPyBUBezgTsKs0e
	 VGYjWhXuFOSjrng5ZeMsJ3/kn99zRVJ2A8qaw6Cvu7L2rlQch6T3bzd6xTZgCbRK1b
	 RxwYSX2MrgjZvlzH5d2gqOsDdseWhBlXzGTpRyyvqFp7gEQSYPJ54TgiLnBzgfN2wE
	 DzOHxfKzh7NUCxlbPukF77/4lXilYvLQPaPbTvw3yK9Nu540bATFun8w/EaEIYrewQ
	 A28vG1MtD6A7jTNAeOdT1l0Zcl9hyTmd5VEQHLc/vSCKaQm1YPNu2j8MiTolTrvuin
	 90C1+Sgf65FOQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 111A2407B8;
	Fri,  9 Oct 2026 20:08:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 14324380
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 20:08:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EEB1740053
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 20:08:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ew6FPJSs6w3k for <buildroot@buildroot.org>;
 Fri,  9 Oct 2026 20:08:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 3D91840080
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791576494;
 b=ZfqMZoCwDSpxI2FPXbjhIfwlEeaIirUhAegO2dJTd72vpIMQ6icXyolOlzesPc7Wz09e
 cKRekGoUEoi+3LqLYPn2Z+QQztk8Nmumk6/CI/pilCUMyANknHxgk8RK/HABphvRjhoMe
 NATVAbYnusCRjRHC9pzSTbWIra0+xDz7fqGdJkP/focGDsQSAazUualJUsYSF9YY0ERJf
 4CKGwid77pUt/TWWIxV6LSboXj0grCTjrLeMCfhDCl28dIlQjg7Wit+lfbkq+EwcjIGWf
 Q3H5KPRM3x6vUqDVdrjpOkgQywF2w/zRxLXavuoZhWFdW8NZEpw3oDW0b1lRopd3Zrw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791576494;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=lN/j4rlDcwKnMKFGfeM7gbHL5QCj02sOMF6wQFSLECY=;
 b=sMuwrShXKtHX5aALvQIoFKOdG3qyXoY2DtTk6AXHfBcCXibmNdaWJHhlZoGw6WINiap8
 +oW6riqbVcvniCBUQi9/V7OdozxaW8qZaliBsGfovvrgL8/r/8tDlHZuYYqUrgCfDQHcO
 71AEx6v+8JWW3p1RtXR8pdaMcL+4k2tVO0npExIXPl+G5ysjagfYy6SL+KF3usWNe+bWW
 xeugiqsIcrdTCOgvWrTtBD09xEbYBQFFofaaYRIwmv3lkl+HkwCna4wmaeNLMEt3g9OxY
 o+X/FFsRc7z4hQfb8y3ND8GJUhA4aixjhz2e+zdzQP2idBoMCRWTHipnnvE4qQCPiDw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D91840080
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 20:08:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 587D08E1E5; Fri,  9 Oct 2026 20:06:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Oct 2026 22:04:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fa18f43882f52950b63c4f802016d7825dece068
X-Git-Newrev: a152da33b17badcaa1aeba1742c24da3f7391475
X-Patchwork-Hint: ignore
Message-Id: <20261009200656.587D08E1E5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnss: bump version to 3.131
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a152da33b17badcaa1aeba1742c24da3f7391475
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For release notes since 3.129, see:
https://hg-edge.mozilla.org/projects/nss/file/NSS_3_130_RTM/doc/src/releases/nss_3_130.md
https://hg-edge.mozilla.org/projects/nss/file/NSS_3_131_RTM/doc/src/releases/nss_3_131.md

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 1851b1e5fd..02bbcaf00d 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_129_RTM/src/SHA256SUMS
-sha256  38baa3b0a18a3f674843473b549753c96419a0151abd1e7a9b214ce0493d0785  nss-3.129.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_131_RTM/src/SHA256SUMS
+sha256  ca0005bc77e9255d9942103e6f9756cfe311a3df72afa99860709e386eb3c167  nss-3.131.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 42021503f7..6b4e68a624 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.129
+LIBNSS_VERSION = 3.131
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
