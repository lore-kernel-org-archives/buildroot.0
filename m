Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C84ACA9EC7
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 13:16:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9721407E5;
	Sun, 11 Oct 2026 13:16:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sb2UT_cXLAkb; Sun, 11 Oct 2026 13:16:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 92B59407E6
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791724569;
	b=LtJNOQqKf1fh8SisN9S776vlivQ0rFPye0zTyGO6BRVTgERQqGfSSM4ZF3mmDxueu68R
	 nKCKlLOF6iwPsEAA2j5g34CsPYTUpFWWl3Xn50Z3e3Kbks5oCIQuttJF1dDw4IWq7KOu/
	 h5aeoEBrsiNW48deS7R3h9uBNsiogwyGmzc4aQgq7ZY9j8js1VEKkomZZF0Y3YaEnYxWr
	 A+EFWx3U2cyKT4CpVDT1/o4AUn0fjWEaAOVs7Pj0TyAfXpqrsPAKfiF7DxqvwQom7IKBJ
	 oiJEKQ1Zw9wiVA6FgQrt3CkW5KDl7fRVUna8fI7Q2boEzToDo6uZbZ+w5El0NxXbLEQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791724569;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Kas-Delay:X-Spamd-Bar:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=+d6Dm8aKLGLy73tkNK1TcqqMU4dfYOVo+0lM9zA1foA=;
	b=oJKSnzT/D/M4WRh+no4aIUOSaZgOy+Nsr2xz0EsezB1IPKF7TkYCY2TTpF6xbwonHoYH
	 o/1do3Jh9lZEaQcUZ5zC6ou2rTaCT5w+jtFKNLJVCHQ47bfflNpK7oWTADyCLjPUbLfus
	 EuxN27z1YqMcu7QHiglZ/KL0MQYi5tkbwpyU0eDl+qIBQyuG6WXSHgHJszmPdrV1HXN8S
	 bGdZudeZnWIHIgg2bE1BnKamNjWRl7JReOh3YSD4rMaZBONwIFr+/CA0LlDhqe1lKjzJM
	 Iz/W0r1Fp/tpHIfhT+RVqiGwddjt2gqc0IIbDpiTo+NbmEvTFJNg50rLtqdG0pyz53Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791724569;
	bh=+d6Dm8aKLGLy73tkNK1TcqqMU4dfYOVo+0lM9zA1foA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DqC6Hbd5rqy3j/Hg9U5j5r/Q8pO3m1SUlvAoILWNQEloxq13xqeJ0b1FyrogmZWqg
	 sok2EZ6qkPjRHigxj/3CfjAOHTTiJwAIyIJgqlHHI+VuYKP0RcRV8G7laRvKgtu2Ie
	 h5vlQkai5CUbbHhkbDE6xp0lldF5FmmOPvJMZkuB5+pHMUAf091GBLxmNJo0l6TBIm
	 VCP93rJR73rFk0qEfftABwjqCNsmlrSYrNQHreIlGC3Mlq9nWNbtiTmGQqmy/JddYS
	 9uHKZrhhXjVrkImI2NdxHBiBOVgEtj2os5Jcbp+NZz/clnlN1tRYtIoSrY/3F8cQzV
	 sfcZc0hUU96wA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92B59407E6;
	Sun, 11 Oct 2026 13:16:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A56D194
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:16:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5AED160612
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:16:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0al_OpnibdAn for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 13:16:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 466506060E
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791724567;
 b=mtk15l3km0VHOEd+B5E1RlGY4yq7wiZzeqObeyMEbUqMj82uD8Ha8SSJqSsqkysVRn1l
 1zQiPkonRQvgdDDkuLaSf/MhC7LOKogO8rfsXGbE5LpqmK7Wprobhvxo6e0NSZb3+x+TO
 6krByqXZZSLYbYd18P7LbzCQwWg40qCDP531uFvf4GCWrHjo5Ct5sHvHjWYgBl6liUkCw
 J6Hl3yklMiCWVkHow/grYvHXTOqxeoKIgLOIgNvtrYj29ajF5jKwo1j+swFzoNswPC3Z+
 g7xcfJTwKADBFOQEnO8EUMvJkprKzeHXipVjejLDI4mkHhlyixDAgfasNUlfkvz9vcQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791724567;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Kas-Delay:X-Spamd-Bar;
 bh=lqxQ1isYPHla7/ze6dNNsQ03dGsGHoVK2Q1mf0V6kxQ=;
 b=pcD2yOVvOR9Gf9IdnoVQKMmSIF6Sadg4Tw6Oc6jd8yZUPYE2Ep3y1k1S8KWWkb05Pdbw
 X1ugi71mmH+/L68IISINPeaTYyZoPFBH/bSnHF4yKcxcXxnMkYrtNTu/7EkdWv0oRdvfY
 O0OAKAQ/DRq+K7aOw/HQYM1lY+BnOfk/8Sf08QMrckLf7cwEe6gjvnLHncvZrYIOxhKYM
 qAhMe2NJacMzY2GTQD8mmNmCE/388xHCUYDLOFvavj2NC/mgw7NRxemUTwn9uKZaqjHZb
 HZBSdOBJ+eGKNwqONMwxnsxgn92s6XcPowPrVluI/2gRNSPuZeuZ/Nw1kwGWmZ9DrkQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=fct5fZAL; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=fct5fZAL
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 466506060E
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791723684;
 bh=lqxQ1isYPHla7/ze6dNNsQ03dGsGHoVK2Q1mf0V6kxQ=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=fct5fZALRiJb4yz4BQG2whkRAqitXgTFC9bcLP+m4PFDKFEM2BGnLAOY0BlDtneqe
 IQKefiEd2uKU5XuW4bK8Aa8yWWMCc2IqGNtTnf8K7oNY4/ZfJVyrFjtMG8qVyZniF6
 +vU1XG9UvNdG/hypCmGDXwJLkII/RCpyQa03RTXXeGRnAdvHothsuJfhSgcs3e5E9d
 DMCrFe11PXYzhjIzdiZPr1vwI3IPiMvnvBOWG+OGGLfDzq++mQVkhDcza/R/WVdd5g
 DBv3Q01EChAYO0vmnf9VFQuaB517lUo2SaUGvJjzpLcd3AtQxgRlNVdVftDLQHdWfb
 FTjlUavwSqTBA==
X-KAS-Sym: v3:f51bdf72230551df:Ox5mmHqwgIvMyI1QgKEa7Ro2UqoiVPYwa1ib8hnsjjQqD
 25s8M2vwFrIHsd3K5yBRCNR9KcmhbTBGk0Z/UIeFpf8wsnVNojbXdjCN1xVotleGBWWjjzHBgEE
 74kL4L+STMwD/l3tPdkNjVc2aEcTg5E+9kq3JIuVVgKZUkyGnD/Kyv1FD6YSp7FcFjV40N/5gBQ
 c1a8pSNeJlBzzKSDlvrm7tStdZZURMMjpShUwTVAm3ujJrgLAxVichT90dl6Ye+LoRN+5NYuoCq
 FrxKp8YCAl4Fk1rds2RrRz+55Ma6FGhELkZkdxRcDOeNbj/YZtgaek8wOz/3DQCuSXG5FAKA==:
 j4E1gT8hpVH05Lydhy4wQ6VQ3SU9fR0UNZy04lL5bMPWGGUXyybYwOACxS16tYxxA0eqwrJ0Wf0
 rYpRWW8aO5oNLNw608ttMA2IEV3bkmuXM3y++fLoXYBpY0yvTG57AxKnzhmqQQvJBSASuhYR96S
 A5fMxhb7FXQi81L77mgevlkGhyPoaDtetmybN761aA26JTDHT/7W8XeBRvpdNyv5FUSc7nKSKMq
 FpJwZsxHSvWRvn0XqPPS3wHe/kxwiYGeYcP1b6gcr0gDjk0ohcrik/zg/+9tjRD30wn/dNbmcFE
 Dfic2L/1k9M/rLREABtgmzT9ZoHm9V9+W7AXpyfwvlm7geCnq+9u5DM1DlSnvUGvRD0C8q9u6h9
 qRuEOX9V/XJDd2jbsS/CYh45OC/dUalgvNmXrHSNS6QyyUHHiIzVUnN9ea37KuM0Vtbq1VVyUTM
 I2obcYhqQgcYUOMMlrVvJx2zQfITbXmPA+aJqO6mgHovfrtcoO7Xgn2Q9nMtCtlusfvuHpO+pjD
 YZnCjv41QVWHC/a9D7x25nPH7O+oWYWw6A2ATCbxvhVd8HRtVcMoOsMKeyOvak+dgyNsjCd2azW
 pNCwCgI=
Received: from fli4l.lan.fli4l (p5b3a0ea9.dip0.t-ipconnect.de [91.58.14.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EA679A4C58B3
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 15:01:24 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52426)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xFtAo-000000007Fz-4AmD
 for buildroot@buildroot.org; Sun, 11 Oct 2026 13:01:06 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 15:00:54 +0200
Message-ID: <20261011130058.3443432-50-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011130058.3443432-1-bernd@kuhls.net>
References: <20261011130058.3443432-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Kas-Delay: 1791724285
X-Spamd-Bar: +++++++
Subject: [Buildroot] [PATCH v9 49/52] package/kodi-visualisation-*: mass
 version bump to Piers
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash  | 2 +-
 .../kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk    | 2 +-
 package/kodi-visualisation-goom/kodi-visualisation-goom.hash    | 2 +-
 package/kodi-visualisation-goom/kodi-visualisation-goom.mk      | 2 +-
 .../kodi-visualisation-matrix/kodi-visualisation-matrix.hash    | 2 +-
 package/kodi-visualisation-matrix/kodi-visualisation-matrix.mk  | 2 +-
 .../kodi-visualisation-shadertoy.hash                           | 2 +-
 .../kodi-visualisation-shadertoy.mk                             | 2 +-
 .../kodi-visualisation-spectrum.hash                            | 2 +-
 .../kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk  | 2 +-
 .../kodi-visualisation-starburst.hash                           | 2 +-
 .../kodi-visualisation-starburst.mk                             | 2 +-
 .../kodi-visualisation-waveform.hash                            | 2 +-
 .../kodi-visualisation-waveform/kodi-visualisation-waveform.mk  | 2 +-
 14 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash
index 3f5f761968..7224b062aa 100644
--- a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash
+++ b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d7433e4e88e29f1dd3524d2d0b660ce529852561f14f479f4b83a9c5ac436ffc  kodi-visualisation-fishbmc-21.0.2-Omega.tar.gz
+sha256  e0ec1dd6832cd916a0ec8a2baa8be55c65670bb618c9be8747c7cadaf22c1535  kodi-visualisation-fishbmc-22.1.2-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk
index b1eb305620..393cf19700 100644
--- a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk
+++ b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_FISHBMC_VERSION = 21.0.2-Omega
+KODI_VISUALISATION_FISHBMC_VERSION = 22.1.2-Piers
 KODI_VISUALISATION_FISHBMC_SITE = $(call github,xbmc,visualization.fishbmc,$(KODI_VISUALISATION_FISHBMC_VERSION))
 KODI_VISUALISATION_FISHBMC_LICENSE = GPL-2.0+
 KODI_VISUALISATION_FISHBMC_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-visualisation-goom/kodi-visualisation-goom.hash b/package/kodi-visualisation-goom/kodi-visualisation-goom.hash
index 71ce1c657e..72fd7ed709 100644
--- a/package/kodi-visualisation-goom/kodi-visualisation-goom.hash
+++ b/package/kodi-visualisation-goom/kodi-visualisation-goom.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f87356122f91ea40d096d559d1180571e701e39867448768d14d6c2ba3b2e264  kodi-visualisation-goom-21.0.2-Omega.tar.gz
+sha256  3bb77b47d26aaf1e6cca451bbb9c22f162101f3a43b014a1bfa3583329e08f44  kodi-visualisation-goom-22.1.2-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-visualisation-goom/kodi-visualisation-goom.mk b/package/kodi-visualisation-goom/kodi-visualisation-goom.mk
index 6b35c64a87..a4b7285589 100644
--- a/package/kodi-visualisation-goom/kodi-visualisation-goom.mk
+++ b/package/kodi-visualisation-goom/kodi-visualisation-goom.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_GOOM_VERSION = 21.0.2-Omega
+KODI_VISUALISATION_GOOM_VERSION = 22.1.2-Piers
 KODI_VISUALISATION_GOOM_SITE = $(call github,xbmc,visualization.goom,$(KODI_VISUALISATION_GOOM_VERSION))
 KODI_VISUALISATION_GOOM_LICENSE = GPL-2.0+
 KODI_VISUALISATION_GOOM_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-visualisation-matrix/kodi-visualisation-matrix.hash b/package/kodi-visualisation-matrix/kodi-visualisation-matrix.hash
index a924eaa6f8..aad763fadb 100644
--- a/package/kodi-visualisation-matrix/kodi-visualisation-matrix.hash
+++ b/package/kodi-visualisation-matrix/kodi-visualisation-matrix.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b1d1f3da5470d657e70c4b914a77445fe1d0a0ba35007fc402982a8b1b4cf9b0  kodi-visualisation-matrix-21.0.2-Omega.tar.gz
+sha256  a0060d82a8a9e9cdf2fb30451116271d5ab1dd9196c27cda1f6ae7eb1f787b02  kodi-visualisation-matrix-22.1.1-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-visualisation-matrix/kodi-visualisation-matrix.mk b/package/kodi-visualisation-matrix/kodi-visualisation-matrix.mk
index fd885712ad..05e4889c84 100644
--- a/package/kodi-visualisation-matrix/kodi-visualisation-matrix.mk
+++ b/package/kodi-visualisation-matrix/kodi-visualisation-matrix.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_MATRIX_VERSION = 21.0.2-Omega
+KODI_VISUALISATION_MATRIX_VERSION = 22.1.1-Piers
 KODI_VISUALISATION_MATRIX_SITE = $(call github,xbmc,visualization.matrix,$(KODI_VISUALISATION_MATRIX_VERSION))
 KODI_VISUALISATION_MATRIX_LICENSE = GPL-2.0+
 KODI_VISUALISATION_MATRIX_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash
index 508820876d..6de80abd30 100644
--- a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash
+++ b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  30a5081365cea1dbdf49ccbb059076d4c7abc28604a58749fcd0d025e2faa760  kodi-visualisation-shadertoy-21.0.2-Omega.tar.gz
+sha256  ec4881e0a71ef4a01ff33a0704bb0e53acb573d49cdeb5bd67a4948b85659e1a  kodi-visualisation-shadertoy-22.1.1-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
index 32d6d6f056..d095247c2a 100644
--- a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
+++ b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_SHADERTOY_VERSION = 21.0.2-Omega
+KODI_VISUALISATION_SHADERTOY_VERSION = 22.1.1-Piers
 KODI_VISUALISATION_SHADERTOY_SITE = $(call github,xbmc,visualization.shadertoy,$(KODI_VISUALISATION_SHADERTOY_VERSION))
 KODI_VISUALISATION_SHADERTOY_LICENSE = GPL-2.0+
 KODI_VISUALISATION_SHADERTOY_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash
index 6bbd7b8c9a..244d7f9881 100644
--- a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash
+++ b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7b6635789d226ee4cd4e17d54d57e880731d0762835802835d0d5ac4f0084b99  kodi-visualisation-spectrum-21.0.2-Omega.tar.gz
+sha256  dac63ce17984d48c8e20be136a840d2543cda184d12cf31c7839c8e810bcc537  kodi-visualisation-spectrum-22.1.1-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk
index 1946cf598a..646917697a 100644
--- a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk
+++ b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_SPECTRUM_VERSION = 21.0.2-Omega
+KODI_VISUALISATION_SPECTRUM_VERSION = 22.1.1-Piers
 KODI_VISUALISATION_SPECTRUM_SITE = $(call github,xbmc,visualization.spectrum,$(KODI_VISUALISATION_SPECTRUM_VERSION))
 KODI_VISUALISATION_SPECTRUM_LICENSE = GPL-2.0+
 KODI_VISUALISATION_SPECTRUM_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-visualisation-starburst/kodi-visualisation-starburst.hash b/package/kodi-visualisation-starburst/kodi-visualisation-starburst.hash
index a362fbd23d..591c3883b5 100644
--- a/package/kodi-visualisation-starburst/kodi-visualisation-starburst.hash
+++ b/package/kodi-visualisation-starburst/kodi-visualisation-starburst.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a3f70985fee6b1014e7e7599431e646f36bd3870ead78bbc8936151b805e4241  kodi-visualisation-starburst-21.0.2-Omega.tar.gz
+sha256  35456e13ab3d82177dde6568b0ab6c09dd09a31acf851f4e141ab4062d787e94  kodi-visualisation-starburst-22.1.1-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-visualisation-starburst/kodi-visualisation-starburst.mk b/package/kodi-visualisation-starburst/kodi-visualisation-starburst.mk
index 6adb21687e..ec922016f0 100644
--- a/package/kodi-visualisation-starburst/kodi-visualisation-starburst.mk
+++ b/package/kodi-visualisation-starburst/kodi-visualisation-starburst.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_STARBURST_VERSION = 21.0.2-Omega
+KODI_VISUALISATION_STARBURST_VERSION = 22.1.1-Piers
 KODI_VISUALISATION_STARBURST_SITE = $(call github,xbmc,visualization.starburst,$(KODI_VISUALISATION_STARBURST_VERSION))
 KODI_VISUALISATION_STARBURST_LICENSE = GPL-2.0+
 KODI_VISUALISATION_STARBURST_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash
index 1041fd5287..683f468cc3 100644
--- a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash
+++ b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  fe6d2f3990ea5f2ea2d4a0a905f451b1c2c7f1300529d8957b5d93a97421f415  kodi-visualisation-waveform-21.0.2-Omega.tar.gz
+sha256  050a184a37c1cef8f87fcf05d5dd90c6d11f33008164bc5a86e370aac1d866fb  kodi-visualisation-waveform-22.1.1-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk
index 819b064789..9a61a4d159 100644
--- a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk
+++ b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_WAVEFORM_VERSION = 21.0.2-Omega
+KODI_VISUALISATION_WAVEFORM_VERSION = 22.1.1-Piers
 KODI_VISUALISATION_WAVEFORM_SITE = $(call github,xbmc,visualization.waveform,$(KODI_VISUALISATION_WAVEFORM_VERSION))
 KODI_VISUALISATION_WAVEFORM_LICENSE = GPL-2.0+
 KODI_VISUALISATION_WAVEFORM_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
