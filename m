Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BEA4CC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:12:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1430A6126D;
	Fri, 16 Oct 2026 13:12:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sJSdLCoH-4MA; Fri, 16 Oct 2026 13:12:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 057B360F19
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156353;
	b=tGj4glL7GOXoWED4LIFNKuVcPKEclHKv2nrcSHG3wQ3M93f6g9eFmMVYJYA/QIJZ3XEB
	 IRxOfjdB373Fso3Q3h/JfwO7Fv7zAJJ2dLloHktCvF9GnvD6q3g1btRzLcXAjMKannMqG
	 AdKSsDv3L9Ji4bBDLMbehso48d+Nv/HIH3SuRELStmB0XB/x+pGB+VjJxbP7gwx8Ule6l
	 VlVfLFXM4fb5rjpq94IDGZ4t3QrXkeQNRiG83V7fgPh2tMR5H6mefXHLCGPD6ilk/of1E
	 iN0ftuIfAaMDlDDxz5Ewyvhhw2y61DYwSwGt55nha7B8+OUNHJaNVt3egEs6/8A78Bg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156353;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=fGsQ1ySDF8XZMk2i6dN7UmOVIK3Wycqkt5KFiRCkYQA=;
	b=WDHoOm/MgmCbkSk24AHb66x24bA4qK4//dG7RQOMl3XRsAwjZpJwuD/6iMCwcJnTMRix
	 c0Gow4cQmsVneYG1j8Jid9FfbkcX1dN3bEU3yVCsyl8l4ggGdHxCCoXNzbfr2iJlw/HPx
	 Gj91ww/BbuWRCYxU6xyoQuC/Fw57/e+RbOtwRNTzjg4np7S47OIX7yWKD56CskYCZU7L9
	 MVkp0R35JtHgm3M5ZdxUPDOVC0AMf46eEd+yPHp2VVIvdTB4AUsvm8Tg/eIDVJBa8qWey
	 bNk1+KlBchcjJedeL21zmeTKXoOF50C726vJRvBAcSsQT04B0opx/EN+fevKd4G3dTA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156353;
	bh=fGsQ1ySDF8XZMk2i6dN7UmOVIK3Wycqkt5KFiRCkYQA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hg3lAmxaTkNMYKZr6e0gOQfa3923lN+yUS24BGZ/fg/fA0Eg+LM58GnqWiiPilkH3
	 DWVkXL7Tbw9d4ATfOAWEBEZDg78NOJTc1+7Dk+h1k1WPUmCqoN6bPXX66xaeBZ4X93
	 n+YUJfZHRoQ9dyJJKDiLof3+Ml3zYRhnPvjyE4+URz8IUv0AilWsEO0xUm2lMuC9gR
	 +7D3IbkXnvU5SxbNfDc/rUVnwagPFmzCw5AkyUl4W4qVZ/FhEklfYZ0GZ0s7NcDhNn
	 S7qgJU2BjNgPD1WGg3IN/xk/r69m/6nwTDyegGEQX10x233t+Nu8mLyp4MGdrTx5Dh
	 dkfyMrOmGKr5A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 057B360F19;
	Fri, 16 Oct 2026 13:12:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 80BB8105
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7279F60E9F
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nHeI8K6tDOVC for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:09:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6279560EDD
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156191;
 b=fAhIOIl3tZ3GtLdotfoCvGTyAbszOLz0uAM4G2l7bJYA5msKNyc8w8inY1bXzKeRsH1L
 vfJla/RTsMb7TFj72zoow0qc4Y+vpLnVyXhU4IBQU1PFPT1By6rSRtdt1ldkximDv6EKe
 5WRi+cSQIeYuqeNZawpuLUGaW/WQF4Wb3rxKaXbqcM9bFObvK9sTbXf3qLHOkrLd2Je1B
 9MX80gaPr+Ioby07xlh87oDDLjJTkXH/oh7HakCWvSB3dztd4MLKFA9kE412+pgLJ2LJJ
 /t8iYDfkOVqkuWHsdHs0Is0nlaJNt4ak6J0iaoq0NZbXMJ3hX+Hz2dLb639NyDZ3z2Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156191;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Qc27OnmGI9UOmUFRyN/Sj0YDrNxvjNiuEIa4cYQT3Xs=;
 b=Wl2XosTBgHVu+EhKaRm/G9aluSz5l/rgUlvSFkeeh2vJderYMAoCpPmvuiXVG2pko5aF
 KpP2pj9lY700QrE91cUzZnGRBknk5eN449ijS8bM5XuuNyCLFjPaEIjSSA4MssMSLFJ7s
 Qoe1wUyO+XfQ16L0IXoIUAxCDQirST2OIu0LEsYgh9VPd8lIgmkxWLeubLixBtF6oeKfY
 d9+6IWbjYmV8JIYk+y8NX/P1sE7FYgHlYPen8kOpLKDJ6q9bgkuCbPtvN4QH+c3h4nO8P
 Vq8UsZHjEoz3qNE7sMwCeAo+YHdEgSidY+j4g2FeeCH/smCFDbumPBXqWnzBSsPq/zA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6279560EDD
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 523D7960DA; Fri, 16 Oct 2026 13:08:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 14:03:21 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 64b813b5b7cdbd57b4c984d81e43d9e88603cf90
X-Git-Newrev: f7a030038f77a82678407dd0c2134129d6cc5151
X-Patchwork-Hint: ignore
Message-Id: <20261016130830.523D7960DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/go: new major
 version 1.27
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2021384930922634127=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2021384930922634127==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f7a030038f77a82678407dd0c2134129d6cc5151
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Bump to go1.27.0. The go-bootstrap-stage5 package (go1.25.x) still
satisfies the bootstrap requirement, so no bootstrap stage changes are
needed.

Remove the workaround for https://github.com/golang/go/issues/77436,
which the go.mk comment scheduled for removal at this bump: restore the
plain CGO_CFLAGS and CGO_CXXFLAGS settings in HOST_GO_TARGET_ENV.

https://go.dev/doc/go1.27#bootstrap

Signed-off-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 798741f4dc8da3baed0c7947d459d9d4223d90d4)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/go/go.hash | 14 +++++++-------
 package/go/go.mk   | 12 +++---------
 2 files changed, 10 insertions(+), 16 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 1c43cabf7b..bc6d026a6c 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,9 +1,9 @@
 # sha256 checksum from https://go.dev/dl/
-sha256  a0721c54c688901448d77ad9b3ec7ea7c474730755ff891382e92ecb93ff2cb1  go1.26.6.src.tar.gz
-sha256  f09a71029fc5cd2940fbe36b0eb1fb2d8f3407cd6adb6b7b4de3eaf04007f8c4  go1.26.6.linux-386.tar.gz
-sha256  708effb774be8237570d0add163225abbdfaf4fca28b2611df167beba4feef89  go1.26.6.linux-amd64.tar.gz
-sha256  d0507e9e9d7fe012aae570108cbd76c15de879e17130ab8cb90d4d7445cb1f2e  go1.26.6.linux-arm64.tar.gz
-sha256  e1379a2fe77bd30fa29833074388247e7c65416e09279f746f20de2d5cf4dfea  go1.26.6.linux-armv6l.tar.gz
-sha256  232b65543a42eda95df6a63f76235c1795bb535eba5c74e509faec71bc648388  go1.26.6.linux-ppc64le.tar.gz
-sha256  958757933d38172dd544085d253c8738cf09793d24c8bc0422e5e1e1fffa4fde  go1.26.6.linux-s390x.tar.gz
+sha256  7002403d7cc44529ef6d26f69a44818263395ead7c16c05a5808ae047ebeb0e5  go1.27.0.src.tar.gz
+sha256  eac4abaca4113170a1cf261b8bf1d38480e61e99deecbc6a14767deb8b19e8ad  go1.27.0.linux-386.tar.gz
+sha256  675c26c449cbb18fc24b74650de1eabbae6e16f64326fd85a283fb3b58280685  go1.27.0.linux-amd64.tar.gz
+sha256  51798d2c42d0e1c6ed7fd9f48728b4193abac9e8aad6dbac2fe96a81f5909bda  go1.27.0.linux-arm64.tar.gz
+sha256  e337ecd9c321377c0d8832690c2cb10463447c0bd0e65e2e3413dfff63a3435b  go1.27.0.linux-armv6l.tar.gz
+sha256  068085e257a6014c036c723ca62943edbf48fd168b8d00a6d39527d10b656255  go1.27.0.linux-ppc64le.tar.gz
+sha256  cb5c89fa48cba4123c68aee62b217ca030f281546df0898a0c32889c340b928c  go1.27.0.linux-s390x.tar.gz
 sha256  911f8f5782931320f5b8d1160a76365b83aea6447ee6c04fa6d5591467db9dad  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index df1023c19b..a49dc206cc 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,10 +4,7 @@
 #
 ################################################################################
 
-# When bumping this to 1.27 (or beyond), remove the workaround for
-# upstream issue https://github.com/golang/go/issues/77436, below
-# (i.e. revert the commit adding these lines).
-GO_VERSION = 1.26.6
+GO_VERSION = 1.27.0
 
 HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
 HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
@@ -78,14 +75,11 @@ HOST_GO_TARGET_ENV = \
 	$(if $(GO_GOARM),GOARM=$(GO_GOARM)) \
 	CC="$(TARGET_CC)" \
 	CXX="$(TARGET_CXX)" \
+	CGO_CFLAGS="$(TARGET_CFLAGS)" \
+	CGO_CXXFLAGS="$(TARGET_CXXFLAGS)" \
 	CGO_LDFLAGS="$(TARGET_LDFLAGS)" \
 	GOTOOLDIR="$(HOST_GO_TOOLDIR)"
 
-# Workaround for https://github.com/golang/go/issues/77436
-HOST_GO_TARGET_ENV += \
-	CGO_CFLAGS="$(subst -g3,-g2,$(TARGET_CFLAGS))" \
-	CGO_CXXFLAGS="$(subst -g3,-g2,$(TARGET_CXXFLAGS))"
-
 # Allow packages to use cgo support if it is available for the target. They
 # will need the toolchain for cgo support; for convenence, include that
 # dependency here.

--===============2021384930922634127==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2021384930922634127==--
