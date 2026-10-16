Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A72CC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:09:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FBDD60B15;
	Fri, 16 Oct 2026 13:09:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k87DFdzJW3EG; Fri, 16 Oct 2026 13:09:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2106060AF2
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156160;
	b=Cwd1CQBBmiKkQg/k3+RR0wCIADWKhe9ydgNmV4kPUTzLnerLZ5j5CZ/+/d2DYVLMWqZb
	 VAPEXVaTQ8mX82qjVux5HcyN2Bs8oKQUtw/jk/4tmbBAR06lfCcNW/WZ4EJ+ywWif2mvm
	 R5MM+N7uT9uAUXksv/+anHT2enrbKeSpZxXN8kFUs6I64gY2QET/BfUsDK3Et5k3NGrSd
	 BPV4+X5l/fn7NLCndghzhHbEHHg7eecJRhiSby7NySFHpJNthGQgLd4XUhjdavlLy4IfZ
	 gTJ3WhcxM8F1b1S6twReBYaVBtn7/BRnx0fAbOHgvmOiVt2UN+64w8thY2Wof7KEkzw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156160;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=TbzHpr5CdlzgMKXln59LXT6ktUQ30BY4WgPCI+pH6aM=;
	b=Iju3lCFTQSmUs+9rfoZmbepIQFsEZvFSvtgH2i0AZZ5fPNIX8eisAv3Z4CZoWbd3sTIa
	 omkX2AvBczden4jLe+OUHlkbxDeRcEQXe8QyoQK7ySvHHN5zrtUZ0BNTz9RouvZs2fw+n
	 nEyICDPUKQ3+21c8u8/KkVx8ekEeYmUwhz+TeGliebj0lxVe+sFmocT4U5FOPOJ5h1nZ9
	 QSdc1oVFE9feaequagorXinH1M1N0HF6tEZQIL2KEd8qPvMma+Hz+L14EszLc7sYTRVto
	 w3/iuacXY8BEuc5pKTNdqoWQ89tdw02WtcQZR0r4hOlrnuNiP8AGBnFbn9OZCwz1lJQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156160;
	bh=TbzHpr5CdlzgMKXln59LXT6ktUQ30BY4WgPCI+pH6aM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dElH0QRoeFis2HntXX9eH0cbDt1OSGIPGKn2n7rbXUtMG5uZZmG2tBAg2asgEMeom
	 UXmh9SKS8g/csF9vi6LHENfIWP9uKXXJM0A6aN9zgKy/4Y2ecl3CGlmpxI+pr4JDaf
	 3kpkDHwxxKVZLtopCBIc5VZGO0eXALGhApw2+mfUx9TzQ6CcKHjfyghnf+n8jDuoIU
	 Z8BTMJjuO2BD0HQ2iX5vNWFtvjCoYXi+Va7oTBs8IoYE8GgYTx+JRmSkaRzfBQGp+7
	 mKlb8Zu9EU1uaggiYv3iRWd2xpHofQvOD2ca2J7YoN4Fse+1JECOtK0/NagxpjhcBO
	 cNUCRBKLMUHIQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2106060AF2;
	Fri, 16 Oct 2026 13:09:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F183B255
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD08B81514
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DDH5ldcJPipt for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2BAFE814BE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156107;
 b=RdY+IQycIa1WNqgnY1IQ2U1uT2hTzxfQpUD1yOClqJuyu3JtndKTy+lXflvcJGh7q4Ho
 WHJgQEBQ0K7B5xyiQ3+xXO/ar8EsNBm9ArZQD5881AOfJRTgbywgrWry5g9Hzvhsv0tv+
 2Cxw5Kju4qmN2gz0T5lmhNCXK3cJPxjok+TH3rFQjX1o8GktZ34adIwZ22SggusUE4fSa
 NU3FK/NNPxla1Q0Ur8wKAWnKHTStARL/l7CleHem+WzctK/TV1gkZNQuZKY2NKj/UjmlW
 ssH7CjxEB4NgKBWCn7+DjAgiLDrfOwZZXoCCvU0g34J07idZ4VGiYiMt7rmq1Yo8+fQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156107;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=e1eb0c9QikA1OQilr2Z+ldWBkl0AV+hwhMXj2VqMe8Y=;
 b=gacGHtOH2GwooDDLiP3yNFqun+MfnVNqmYIdmRFGPTuGPJ7ou/0l87kaABJwSVoo0yi/
 b+iF2bZMZptc32/x5bwq6/Kxf46lcykfjO1ESwRGngvwD0BUrh+nS+LiUipva++oHvqGI
 a84t4bLB9c8oCyClH0duontm8JbcPuVO+DvVMZkcYVeUtCx8BlwQcNwmJlT3Kbgro2uFv
 ++62vBFFp1V8UglP3pLmZwZuilQKMWAp807y95YMX543B6Cj/xuE76Nuj4JlVoKXEztX6
 JFhwDHnZ1gTm4QQFI/qpPx7nCqH020eqW89+CA/zb2M1u4nxMgMs+13CUzTuooVi5Jw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2BAFE814BE
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1BDAC960D7; Fri, 16 Oct 2026 13:07:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:51 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 00f561ee1004f6610fcdcee15e548a248a0c3c48
X-Git-Newrev: e7291dc26bc8986bb00e5e96555aa3681d7e9f82
X-Patchwork-Hint: ignore
Message-Id: <20261016130706.1BDAC960D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/go: new major
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3216268401385135864=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3216268401385135864==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e7291dc26bc8986bb00e5e96555aa3681d7e9f82
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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

--===============3216268401385135864==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3216268401385135864==--
