Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA5A1C79F80
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 16:22:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A960140AC8;
	Fri,  4 Sep 2026 16:22:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zb3WdpgeMKWy; Fri,  4 Sep 2026 16:22:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org C03D040B03
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788538961;
	b=YV4FYkq4BAB4JCzdFMVPI6YnKvYltntDpPtqDi8oYkzMO6YJ1mF1GAwu/3aOUJQfjUj1
	 aabnorh3FwuzSDTQyR1SYIRpAUexclhrjAVfB8yEs0u5p9BFvOiFnVAVLwnRQtA4TUYC2
	 vYgHCUuUL8EKzD8KwldWtUnMS66/eV6FF+fm29eLQ++ddxx40kg+qQo7oO7cLqvLuar8w
	 WROinO3DdINq+dg71t6jAaUHWc6IWmp/ZgKJVX+H9/tOXOxvFylYsQp1IO/gUDtSwQ7rF
	 hGsPdaSANrTS5G3cittW699n4fkmaceYpdqi8lC9OgziMzLrEHGsI6OLbzT2q67x1fg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788538961;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=I7PsrnUQu/SPIvqu+lyjWffxqQqm+TN77wzW4WdlPdo=;
	b=ATA8v4aKkjP1cLGl2KJemXghHIdlG/K+8qr6yyoTlV+cg1fjtt7gOhYwcJALVSL5lWO0
	 qtlYJBVRgQOJPN1NjBZNQmvwPW1K1z4Jy56PH0rfeudvDvsh3JiwZ32Qs/bT45yzaSQEO
	 CzIh4cRacdYXt4FmN0W6DRbCUc2B9ucdFTR1AGDLVLtHHEKqAUPGiNluJt5Mpk2N3x3Mw
	 lG9u213tBlqGcx7ZRJgwEQhJFgCTDGfRqmepAHxx2siaMQIOT2vy2yC9jagbr2YhDAXR9
	 xecfJpNQQv/IPWa/SQBnRbUdTL7+z7LnuNi5S2nSkDf1i6P5o5QhVdDCyEqX1zn+nUg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788538961;
	bh=I7PsrnUQu/SPIvqu+lyjWffxqQqm+TN77wzW4WdlPdo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XjNakvBA4u0cVtRZVfM3fCaUDETLVb2uDDWmwBPl75UvSX4fslLTDKgDu2vtEHQWS
	 XEdTZ9fqBQYyLfwa4C2vLR4onx2pv/nBisQwOgX64INtp92aGAb6tCTiAQSvH2m4b/
	 cDg5zpuS6zN0cRoAtzqeUthOVcIUxWDUbhtyWITT8kc+XGiYbMbxsnpZ7IsVk/Q118
	 RgbyTTqfzsKYXOoxeWoUSohl86QhePFAitrJE2w4hZWSEQ/N56EHqdPXFs2Lx/5Q/b
	 a2TcZ1ONvOILRoLuzqGs5VYKgbeshk/pviM+JmaKt7twcQjOAQV2LwH5XsmYv83s+F
	 Q6E99yJUKFdiw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C03D040B03;
	Fri,  4 Sep 2026 16:22:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 05DB510E
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB87740A61
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yNXMkxeQxqxY for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 16:22:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org C171140AFB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788538927;
 b=DeMuXlJGOPK3CHqEF5tcDAasbulHiKJOxt1Stl0crqv4yN+FSoxlmhSn1LT4zazWOwHG
 Uj1+/Yxw6XF9CjoNRyRZaq/etnjn3qLu6okkxCbklNHVBrxNy7w4wSYGcDOX1+xEMRXC4
 AoSVZkw8D5uPNqHvLRh/ErpiThkUy+pVVLAOV84rTocPCCWxqClQn+/ItrPBW/CCAqY24
 cSWKPFp/qcwUM/BS3wvhGuewd0AWJfE2h8k3oCbHmNoub492Qrv6iBmqnFre9Ka4DH/Y1
 opVXFoiriPKz5Iu2IUQ+w2eURib2i61p5pmyOFa7/FNzgtU7xSW2ZOKlc6HmawD2xtQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788538927;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=xaE029i9gOu98D5n1waB8MU32Zb1LC4h2+yJcYTs6Hk=;
 b=WdMrWcPZuWq0MtVL5r1dWUwngPgh8a+8mj13OzhXANKQhE6ZuRcoxxmwxt9ami29FMj/
 xQk4iJ3gOrSwUq6xZshKyRbspWmweBsmlm2v2eRTl8LzE5b4XmGoDJmE333hxKowUzqSj
 hphn49i1JRUVyt+B/19s+DrR4OOIKiIsL1llZQKTzcmKbfs3sL7JZUNZIWDbEgRC4dxD+
 WnmuKbJyUGkkhrlFlEv8HlhjHkrVVNUkmiaqLPPDjhNcd0pxFUTPBHUpx4PYzPHA9lJpz
 qj7hsgSzMrO43oa+4uibTWWeTnUo7EIocb6RrnUf6k8onj0Ht6Nsv900jkTgb4rS3kw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C171140AFB
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4013894C87; Fri,  4 Sep 2026 16:21:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 31 Aug 2026 22:00:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ed881dfca758240ee304e5a042ffc3f7c47f31d2
X-Git-Newrev: 798741f4dc8da3baed0c7947d459d9d4223d90d4
X-Patchwork-Hint: ignore
Message-Id: <20260904162107.4013894C87@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/go: new major version 1.27
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/798741f4dc8da3baed0c7947d459d9d4223d90d4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Bump to go1.27.0. The go-bootstrap-stage5 package (go1.25.x) still
satisfies the bootstrap requirement, so no bootstrap stage changes are
needed.

Remove the workaround for https://github.com/golang/go/issues/77436,
which the go.mk comment scheduled for removal at this bump: restore the
plain CGO_CFLAGS and CGO_CXXFLAGS settings in HOST_GO_TARGET_ENV.

https://go.dev/doc/go1.27#bootstrap

Signed-off-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
