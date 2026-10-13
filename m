Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59FEECC6B1C
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 17:51:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E98E5405D0;
	Tue, 13 Oct 2026 17:51:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jtIeB-aGhaS3; Tue, 13 Oct 2026 17:51:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 07CEA405CC
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791913900;
	b=GsMAuM/H2QiaR+IlfWiq+mIlRy41A7+YbTP1p0LxV0mUr6hIbHdyg96NoPhf/b44HYD1
	 T8Zc1EFHwDVE1F3G6zTxR1MQ/UmM6zOIu8aVn2Ap1UzONQV35VhM2IGp4rjWsHyDGQ8/5
	 jAzG0qysQNW3iqrEBXSS62YwbuoOwvCsNeJEsSpGqLgB4zXC2aZ5Zy1t6ONdG9dkFpQPn
	 jH/aiPj1lvM2yaUC5zag//wol4qcH19/1E2fTqvRB2E7mYNzOQKvw13gzOu/2ec8ts+E5
	 tNb0KzAZuAndO7fMwToYfyWiZi+QDyposp188WXV5hrNqdVRcMzsN0io/JLHbJXciCw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791913900;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=YDyUFtL4S9/DVT8l2EQNxDcEjSn7qEGaFoOgBVGo30o=;
	b=VnLVBlfC5BAkG/YCOiHnvPYBzmPas8CU/1pnn3nvC2mcT9u2QHXcMWQ0QPkdbTLiLrKJ
	 E520gGxmfKqwWE/w3kiOO3xVdIDsE2GdGyMmgbAgxf183BlaJjnbO14816Wp2dU05cKKk
	 I4IR+bVLD4k0p56P1uDdcLTz6V30Nm4DvhJNf+NEJ3AMo6CM9IqxN5epKFHJaisgNVjiO
	 neE1F0hjIIzkbGchLPm3eM/puA5VN7mGfmtkuAOD0UG/F48VepB/s92sz+KFNFhviNw/G
	 aPzwLVBfQ5THZDFX9mRczP36kdid5FdCxFSWEZ/nmkFOIwGtHJpeHqs4TOMz1pJT7Lw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791913900;
	bh=YDyUFtL4S9/DVT8l2EQNxDcEjSn7qEGaFoOgBVGo30o=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=j5YTtV+H7+LyGt+ZPSRFzZnS6UIDWIxSaBo0dEMGqZsvhmvCJg5+n8Mozzrq+Hmlg
	 i9n1Zm6Gl+k7m4F7D2DfWm3Y4anIQ/dWfPg+onLmIE5juns8ZWopCrVWSDyQHkK41I
	 w/MZB1njVBUhHhgt0kuMJzGNkP7zUYtMFJkuUobfM6LIV/V+a7pvcF6bXABT3tlIwx
	 Ir3N8Ifaz7TnB1LwYhcMCen4eEoAwwyq/iA4iUpDdnBWawTuXJ1Xoaov/0T0HEPwy2
	 HPrKzuTwlj8YtJTr8tu+OlqoMsPWYahvnOmlVvINWx/l6g3GOEpBFB6P1wyPfSvuxU
	 grMtnATTCzSEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07CEA405CC;
	Tue, 13 Oct 2026 17:51:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E13402AC
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:51:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C753E80AA3
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:51:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9x4ZrL2tYwxR for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 17:51:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D314680A86
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::331"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791913897;
 b=WC5o4fhS8eCk7WYLAtdiS7Hbp9r5H9oFIJC/uM8jQ+D1AzSr2tUzIRDCeXS1w1y+QkeP
 +HYPtoAvNRuzc/jgvQZK/EMNNUkC2m1eb7zqzuIJxBxOv0Usc4RBhzn3kUlFEzUOQgAU2
 4e6PS4yvNUpQTM8vOTNHDVcrzLqB88u0xIX0EYPl9ivd2JvyOU5sC5oFdls9FgXiO1Gsg
 usssvkteKIsZeB+nWU+2dNSFlQEQzK4zzX3Bl6a5Ldz7X5ZcnmPwKU6NbBMHdIQyN5JcU
 t2D0DE6Y9LGMC0/Xkh7Q6J6Y2gGpcGC0c1AhtMwI7P3J13N8j4XwVZqhdbPNEfWf7sg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791913897;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=+RB3F8PE3y0SOA0ZT4+AZunWfNaQLxH7SOKXONpmrQs=;
 b=rjDTFfM+w+3I/Ipot1i1ZZFI/XkfgJ0ZcQehOnfMMC3/GHzuSKQ/G1Q/cILlO/8bsxZz
 8wL1/ZNmPrLwEqPG1YkQdOWWLkZ7TKojZxuHtW6OvYRfMy6kgc30zdn1XuibkJY9whpfr
 i50dlhPnopmALAHfCXoXbwR0Tvi14DmwTxLt5sqzG670D9+6gVl539edkDrjkWcUWHchO
 oC9QuPsZQrqLgFiHtqBvzkQBM1CKl6+7oiEjW08sVmme1Ps/AhI+eI7HV40ewGii6WWEn
 TcuMD5jcj7LqUwdFrk60SHyNCGtXyzF4eZ7rgz/U3OHOmUd6TqNyvAnbdH32gLrN8mg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="s/OUOova"; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::331"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::331; helo=mail-ot1-x331.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=s/OUOova
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D314680A86
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:51:36 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-825487fb37bso2038010a34.3
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 10:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791913895; x=1792518695; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=+RB3F8PE3y0SOA0ZT4+AZunWfNaQLxH7SOKXONpmrQs=;
 b=s/OUOovaPL/KcHrod4xZaCKoKPTYvo3SIj1KMVc9UGUCrWcZ+NvfbzL5oLO25Nr80b
 q/PbKYMZx4z9qmg+AxrF5gfajmd5fjb/UUfu/mAMfZAVKzQZZJzKC1tabX1MvNXlkrNe
 ifHbM28c3y7DKi+l1CoeRmgdw3vHHbltEPA1P5wIcvY2NYZdYEqMuDdyy6asTglDCcDm
 wEdnD8uqKQ5zQkm63pcw3iAYj36Zy0sfi/NDDAr63a/vYB6pDl5zZD01NZkP0gGmW/4J
 68oC6+IbWSvCsMY6sEzowRGDCNJ0C1HvbS2G1kYTaM60dTd8hKFvKf9MkuedY1Ylw+vi
 K8IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791913895; x=1792518695;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+RB3F8PE3y0SOA0ZT4+AZunWfNaQLxH7SOKXONpmrQs=;
 b=ueSVQc/fHEpdyIt9BCiv6Jr13oDmx4tnkVQuRQ6QH030KwpxXEGIzC+JuEHURuhuSM
 Lq9cyyfosBlg9oe8aVBAIRoWU3P1SaLa1JCX9LoZGuV3+QhnehRJtOQKUmNL31higJDS
 CVksW/J11UwiAeWyAwYHkM1RI4FxBoVIpotRBNJag83JO/IqEO5FtNBg0mclFS0aI8+c
 HgswxUIdFXmWmRzJOjmaYRh0XLgDP0Mkbd/FKDR1PsVZZU/mJIRNsaHb7THfzzdvsM9d
 WmgrJw+9KQFQFUbCNp7WyhuXLqOy0fvYzU8tS2VznNNN95aikzj9OKtRfBrLqY9sJYiS
 VcoA==
X-Gm-Message-State: AFq9FYLJxPlBhz+KHsvlLeIPISvavM91/pJFEzeAg53uZImv6dfVjtm1
 ESjNm1RvSDEze6xUIgwopP/6ArhVxuzQRofWmf3WBxBliCTeZjrVxkkpr8yVY1RC
X-Gm-Gg: AYBFou3r/sD/51MhtdzE/ymvcilKtAHz6OMc2OgnmJ1r5hLEWDx0C/KAEd+6FMHrRUS
 YQfXI9lFuVhUwjeR2CI8o/bRLalP/onoikmnSP9qpe1sBB8WgldtOv8Tbc7ZSNtPYyYWs8LMaZ9
 1XMNaKrZQLu8g9uP7ihggQm0JQEVLyFGAFHpd1xj3Q77NZIGWfVRVUgfIjjpgRHV8aj50Yhrxhh
 D8Ce6CgLACB0NDUQuJ5svPNj40A2491D03zgjoi5GrA7fwgFtFSlgaoDoLt5bchvKGmOJcGF9y+
 UmQxTd0pDxumlt4i8gQfa6CmUobjcM7gp1QZwEJzDQ04sniGTtSgeU1eU1W1T09e3VuNKypCo+x
 UlxsAXLsfOiJvBbLyEwKoOyFXEe6t/21DhaJfXasx5ZAKcljngSzLoLbMZAB8LmV5sheKjVXPqy
 1hCqhkB/p6E6d6c+TI9vNmQX7KUB0iOKYXSO/Gj4pQvrVBRWWwK3T5aryS+4Z20bkfWVUOwTR2U
 /OKPTpFqyHVgTIL6mbkGaPABeKwxqWno2xrHTEo8rEvpa0mwTo55FId/qjDNnMCHjahuFvbIWRC
 MAVCHkwmoW+fBTDv+F6KW8v8LI8p+aktmZ3+ov1SE5eseD2D7TtO0Q7VJK43w+fPpN7BhzmUeVK
 +xdKB37JqeMkLo7luSQOeizOjV+QKH3USGMIlnWVbMhE=
X-Received: by 2002:a05:6808:319b:b0:4cb:818f:d573 with SMTP id
 5614622812f47-50c4e67e7bfmr13983168b6e.27.1791913895452; 
 Tue, 13 Oct 2026 10:51:35 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-50c1c120686sm15424624b6e.16.2026.10.13.10.51.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 10:51:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 11:51:12 -0600
Message-ID: <20261013175130.1822395-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-installer: bump to version 1.1.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-installer/python-installer.hash | 4 ++--
 package/python-installer/python-installer.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-installer/python-installer.hash b/package/python-installer/python-installer.hash
index 0a4c9f6dd6..0b4ffee0e4 100644
--- a/package/python-installer/python-installer.hash
+++ b/package/python-installer/python-installer.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/installer/json
-md5  c919fdc746e46b0a93ae53ed375e047f  installer-1.0.1.tar.gz
-sha256  052c7fc3721d54c696e2dea019be67539d7b144e924f559f54beb3121831c364  installer-1.0.1.tar.gz
+md5  b621d65e0ff2a13335f3f651ff86f944  installer-1.1.0.tar.gz
+sha256  5adc0c01ce62d809989e246987cd68944fe5df8af562d0358f65b2ab15cb5de7  installer-1.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  37b8b9f2569892fa54406383d431169dbb2115980d78b7efba6eeae5664c484f  LICENSE
diff --git a/package/python-installer/python-installer.mk b/package/python-installer/python-installer.mk
index 20cf1cb744..e4d2fe96d2 100644
--- a/package/python-installer/python-installer.mk
+++ b/package/python-installer/python-installer.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_INSTALLER_VERSION = 1.0.1
+PYTHON_INSTALLER_VERSION = 1.1.0
 PYTHON_INSTALLER_SOURCE = installer-$(PYTHON_INSTALLER_VERSION).tar.gz
-PYTHON_INSTALLER_SITE = https://files.pythonhosted.org/packages/06/fe/b9f481cf0cc867958a21338baa900357b7b7d86cac9b025948049d77923c
+PYTHON_INSTALLER_SITE = https://files.pythonhosted.org/packages/56/d3/2fab33d15004d41ae8e7b5d3e310510f7f34a7e1dd032a3e60d8b38d8fba
 PYTHON_INSTALLER_LICENSE = MIT
 PYTHON_INSTALLER_LICENSE_FILES = LICENSE
 PYTHON_INSTALLER_SETUP_TYPE = flit-bootstrap
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
