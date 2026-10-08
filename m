Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B72CA600E
	for <buildroot@archiver.kernel.org>; Thu,  8 Oct 2026 20:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94EF54091F;
	Thu,  8 Oct 2026 20:46:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f_yOwaSEDcly; Thu,  8 Oct 2026 20:46:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0CEDA4092A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791492407;
	b=DlP5VS0VUH2S6rRusMppVHM0I4oKYoCqZXdb8nu8sT2aFR3WoO7uG2hburZmIIa1bp0u
	 5HFkNj16ewWmHc9EAVI7I8feY+l0g6mpcAW0XHc31WO7fl+9Ls24UxEj0bN4AQHGLGoGN
	 D0abZ9keP2wnFE84YD7/sKLxAASBdAqBOouY7TcXkOOoKi1Cb7dzDjaWjgpN0KJv5Ta6O
	 pUAWdIFDV1lNgch2X8BnT4pzZ0qyLhzkSHyB3ImRXjEAmLA8brgZ1FPR+PUcLvcQwbsen
	 JwgyOocAOpZ8vuR7lVkVHa1J2tcF4GIR+/BkBly7ImGfzhwb79pWw5sRvD78TMwkE6w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791492407;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=eGRNFVqNa7Gnb3iNgHsgD+unBVU3AxElxdl4W1MQrJU=;
	b=D44QmL/mh7mLHoI4jx3Ys9GHuUGMmMVZAISXvLDttqqs4q+NRyI5G05S6aUOx3lqrqfc
	 luHiGQ+Ucm9OsPfHWn/g0UcuCkP0wTONOk451kr9DwqaT4ATmyF3Yx8zkLokdd7TTTfq/
	 mkAJTPKsrNBE1bqkgTAHacv34RiuUA085lOGvPwiujGmUe7ha9lMIP5OApTI3nBr5w1kH
	 oWLsesIomOoHPkkr3ZLUR3VWpbE4sYFQhqViGoettN3i0Squ15CBR+CB12Mt7r8qQlnH4
	 S6PedMM4bYHRHsG9M1VYYQi6jWgV9dkFWxeo6R7/OMRCj5mhzu0TptPXMGn3ArBigew==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791492407;
	bh=eGRNFVqNa7Gnb3iNgHsgD+unBVU3AxElxdl4W1MQrJU=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BgZl42Yg963o45Y742e4cSE+4U0aCr2Ph5dgczl2Q6q4ZOEUDAfF5ixK/fgddzsIT
	 S4+c7hONWW11+N+cQYv8CNmU1hnhCPLWigukUKSPlqHmYEe0/4gHZsOkmPmTdA0EjU
	 DbL35lVR/erAS4TuhBDhWgauliZOMVo1rAwLV8yqshHiGfnHWULoW7J3S6ur9VAPzM
	 kKdSOCKd33jbqXLdAb206qbG8+s6d7KP2Ckgo8yUCyDu1a/6XJ+81BErJvII5VIyMc
	 7HjrhbTdQ3fue64SEZbwCvNM2jST7fFXQuKNjfvdy4XLdmzUKPpvxATL/PKfYbm2Jp
	 jYGSLYabuWKmw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0CEDA4092A;
	Thu,  8 Oct 2026 20:46:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6CA0E356
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 20:46:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5EADE403B5
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 20:46:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MARN4htwYEvc for <buildroot@buildroot.org>;
 Thu,  8 Oct 2026 20:46:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org EFAC14032E
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791492404;
 b=fMXKS2TCvIOM8ffVPSWB1YAanJInZ1SjYcoVnLZkL1HtrGRJCmqq+mHe95q4+zO6dx/Q
 YdnQqvH/DauHT+VrvJRvVjQOIFqqaA/+5KuMgiuRfNEIUkShMvGX983gyMtnVyqTsrxJf
 D++sVrbv16P3YHYTYm99/5gdu0XC9BIuKLWUDnuFc6m4HelzVxQbFbofVLCvp1lF+R//w
 49ELP9WYwt8qYxYBbnEn4ZTaxSpBxikefb1i9ygg0EwFIdoomdq8L7eSjBGePIB63UhaA
 B2zgXKkDbKJxDFl/5jdT6uZI+GCjNxg+zdUls00VvGVMZbHAJbRn6ISjIl/bly1Q86Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791492404;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=7FzcwA377HLYwimh7xjccP7pCj0zIu01y5LhLOj+PqE=;
 b=OShnWTfZFQodo2JZovL0A09o2Vk4F+tjiIf6NIt0VY5oskz2jFhP5iM2z5MZgNRMuMX1
 lgqWRq4RCMqNWBmtKi2o3vDA06ik03liHK0yvyiYbdKQmAyk178ywfCghtB3Tf1tO7XZA
 S7Rm3FG03hIMsieoMo01Auy5/23evHJuCdGx3MUKr5IQLkiYFB9qNWGd2cSYZrCszGbP4
 bj+32nXyKePn6EE5l583LlEGh6/7Sspl6cGHcn9UQRg0ojzN6dB2r6/b5JTcoZPLfMP+m
 JeDItu6Z3NmPKC0gKRa66sIyTNFai14FsAcfq8JzPvylmSgva4l9AExc8oaxHVf16pQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=GgEKud4B; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=GgEKud4B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EFAC14032E
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 20:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791492401;
 bh=7FzcwA377HLYwimh7xjccP7pCj0zIu01y5LhLOj+PqE=;
 h=From:To:Cc:Subject:Date:From;
 b=GgEKud4BhM+CU67Sk1Qzbdq0dfM2phnTovhX6vG3LeWyq2MmPIoriIe6RQ7YiEZdJ
 QRypkHRLPuusHWupHXv3kC7OycbDiuAIaEWORhE0nOOTaHbUAKdd2SPpAmsWzO1qox
 gV7LBWnXWtASBe1x1VnJQBzzA1h6j7Lwp8ztkgDE/twgT/SFIZ9rujGMfE9dFaZlLj
 K3bmkkfeMsY5nQFogeIwTUnlohK/EV6Tm0D993n7KAZM031iqsirU9zqql+VBGxcz7
 2QOPN+2rGXyne3pmJjZ3S3X83PdTzJEy9K4W7+m4li3mV6vH17rHv22xgPCHIIdqW0
 /E0Rsblzj8Oqg==
X-KAS-Sym: v3:f51bdf72230551df:djoEyD1gCZYJzS1e0ipcseL3u+Ww8cgcUu0cTw40/D6ST
 66048p+czedini2B7s87A6wSN9Co2+5VyoLB//rNj+2ZxB+iLanHZMRdPIhUE16JOqOXILRfYQk
 nhpXxzl5jt2V3go1QLKJeLuOYEuWOAFktTKHzgbElSsGPu7CeMUbhkU3Zrip7IRpVEyjhiD2RXZ
 +7x4HazyzcHx1spPJU+6ZA4+O/48AdlifzJbbVTPqlX1zLrNr3OT8fiWcl8U/zv6INq6WNmuzGb
 B0y+5u4QvH5G8cgi2T1XJO8DDBBOXCdrgp6fKNrJihS2QC8daSl9Dq2k+eXx0Owgkw8TWFLA==:
 UCI7RfvnKjHHppOPWWf+utTfggCHfARyv79Y9N9Nmgm4fy2hun2z2pYopkSFNyycax4ZZ7vXVBU
 oAhm6D+Lx/LYz3Dq28CqN255ELJlzK1qKhxveMli+xqjIrZikqjTPxK9jAqRbTKIqJ96MnWM2Td
 xZILc2K0OkfATpHZtmhEgAxTTOu27VQevjaHMwmSDrsjy3vSxD+yP9+3ndTMJWLPPaoXCY/gkWd
 ai9WNwURrRSpj1BnbtbE2BOmd+4HRsXDRJPVnTFfbBoYDOMBoeL3/c4sxRUe/+syzlEqRS73WDC
 Gl5YQp/mdn502CfGETf49jyTdOPM1qdvypjCq48y78p7X6FfWT69Ar6zjNBZB6u6lOvn34UD2EZ
 Sqs2qCZR9wjqz8AFSbY+17xY3cNv2hWcZk9RNjMrgiDXJ8Q0Umhz5LYbJHq5JCTMuJzp6fEP9/i
 5bVn4HHhF++ghohPD749NsFeeuV5oKbL/EdNrPq9Tbu/gXvnOB+VFLs+6Y+xVuaZNxhGT9E43i1
 SrnoOMMhn4kXl6Aq2NUOTxXGJp3K1gOQ4GyDDA0JaPjx+nqbVUJZf7BhnVd3a6+moquxWeodZgk
 ODOazL/K
Received: from fli4l.lan.fli4l (p54a1b058.dip0.t-ipconnect.de [84.161.176.88])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2474CA4C078B;
 Thu,  8 Oct 2026 22:46:41 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53966)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xEv0j-000000003ZD-0UCg;
 Thu, 08 Oct 2026 20:46:40 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>
Date: Thu,  8 Oct 2026 22:46:40 +0200
Message-ID: <20261008204640.3755842-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/1] package/go: security bump version to 1.27.2
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

https://go.dev/doc/devel/release#go1.27.2
https://groups.google.com/g/golang-announce/c/U2fTuyDJznI/m/bAPU-QKAAQAJ

Fixes CVE-2026-56857, CVE-2026-56866, CVE-2026-78659, CVE-2026-78660,
CVE-2026-78663, CVE-2026-78667, CVE-2026-78669, CVE-2026-94439,
CVE-2026-94440, CVE-2026-94444, CVE-2026-94447, CVE-2026-94448,
CVE-2026-97030, CVE-2026-97031 & CVE-2026-97032.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/go/go.hash | 14 +++++++-------
 package/go/go.mk   |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index bc6d026a6c..6a4b03ad35 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,9 +1,9 @@
 # sha256 checksum from https://go.dev/dl/
-sha256  7002403d7cc44529ef6d26f69a44818263395ead7c16c05a5808ae047ebeb0e5  go1.27.0.src.tar.gz
-sha256  eac4abaca4113170a1cf261b8bf1d38480e61e99deecbc6a14767deb8b19e8ad  go1.27.0.linux-386.tar.gz
-sha256  675c26c449cbb18fc24b74650de1eabbae6e16f64326fd85a283fb3b58280685  go1.27.0.linux-amd64.tar.gz
-sha256  51798d2c42d0e1c6ed7fd9f48728b4193abac9e8aad6dbac2fe96a81f5909bda  go1.27.0.linux-arm64.tar.gz
-sha256  e337ecd9c321377c0d8832690c2cb10463447c0bd0e65e2e3413dfff63a3435b  go1.27.0.linux-armv6l.tar.gz
-sha256  068085e257a6014c036c723ca62943edbf48fd168b8d00a6d39527d10b656255  go1.27.0.linux-ppc64le.tar.gz
-sha256  cb5c89fa48cba4123c68aee62b217ca030f281546df0898a0c32889c340b928c  go1.27.0.linux-s390x.tar.gz
+sha256  03495da2ba64894d40f5c4992e49454fa78b50690604ff92b6afff5081b76e62  go1.27.2.src.tar.gz
+sha256  93dae4b7f463ed1e9c65e05561ce9fc5f7cd5c4ffca5e336248d48f3a2eab5fc  go1.27.2.linux-386.tar.gz
+sha256  ecbadb99091a3f46e31f5f934b068b1864eafa7995211b39eaddf76996045fe5  go1.27.2.linux-amd64.tar.gz
+sha256  94f3e30b8e374bc285e7dadc11e0865726b9bc6e85b841ccceaabc0214c6b7c8  go1.27.2.linux-arm64.tar.gz
+sha256  e25a174051d8675f87ac720aedcd25bf89ac652c4b82f26aa47919524725ed95  go1.27.2.linux-armv6l.tar.gz
+sha256  059d5f01b1607a724ea5ae87c5589041a51c577a6f3f20099e49d00f31c803fa  go1.27.2.linux-ppc64le.tar.gz
+sha256  dfd01d1e08e4dbece2cd91e259953f87b858752037fd151da2f674c4fa09aeef  go1.27.2.linux-s390x.tar.gz
 sha256  911f8f5782931320f5b8d1160a76365b83aea6447ee6c04fa6d5591467db9dad  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index a49dc206cc..df6f0049bf 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.27.0
+GO_VERSION = 1.27.2
 
 HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
 HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
