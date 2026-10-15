Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 188B1CCA462
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:12:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AEF2F611F8;
	Fri, 16 Oct 2026 13:12:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BN1Xp0p2BWNK; Fri, 16 Oct 2026 13:12:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DC97661253
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156358;
	b=FrrgvaDEO0EkPr/wYdZD4LizS3gV9km6gwkJYGmXnnd/BLeVGYLpgYdWZ22evE4r1ZlY
	 ym3Mq8MWF7R2XeD0NjgOKhnKLwVKXPG5jumffxXEkB9IsWQVRp0UNlo9I8I52UBmVKutk
	 qijFCCeYBRCZz8UvTp8IRxJsDmNtoHBPH/UTzveKIx5NWwQ7zKSDZwk5ifjtsdAZldy0A
	 neabj2MEdZX7PDmFlsUzrpmChXsaHlCUl0oU6h2UbQngZMVNFQFXCpcXbCpmq24hOZBma
	 3XvdErYp7pGxlwcYxcaSSJ+tfCX7Tqj4HlC+0ixJvKUbUhFJs7NC3oJ2boYtlBlPzHQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156358;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=uOx1SicZOJpqGBizBgvPznY/YVPaAd/dNWG8LWtn5zA=;
	b=LFGdgRW1gGLjCdNjKkRJUuSS/op6nTXwTcIRgzNyq/v84ucCYhYl5l/In01XQPPOTEvn
	 3VL54cJJYFOiHuqcjK+3RNBgJ6B1LqJc4OS4tRcFwyQMIGic1zqFyc9HKv7iRaoxARl0x
	 ARRv93LehqjghZuCRKhuAHDfS9XeyeDnfWu9bDg+DArNWewfLo8EHT4rMyV3Xzs+PU0bh
	 iVosp6fgoG/m6nDa0PKHmt+ba/rs2Bpr9XIaZQn+NKzuza7PWG3ZYF6S/rBKMvIq+azOa
	 j/5yusKlTtiWVS2SZ9OJT6XpIQLxSTdqJ1wbxzvUgBOIqE3uXlQaxtYcEebhYm3et/A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156358;
	bh=uOx1SicZOJpqGBizBgvPznY/YVPaAd/dNWG8LWtn5zA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QpzmIdoSer3kYF3MVIZL7kW3115oEXj9vbarBR/ujGnozvaJ5qP278aw8ASvWDxHW
	 BQ8IWH4yTZlIP0jtP4c1P+ru5CROEw43fgCDFkR+y4i0ruVyoXzRt0TouFdWBspBHf
	 v5cCz/KJy82yFSsfeVuuMF+EvJ++MKbRCAGEsjjoKbCa4YV2Y58ttTENxNTJ6NthWO
	 ZavSYcKgH1QOFJD3Nt1S5nPJcggHXJiR7Nvm/RLajyc3Tbgm9d8wKDCSlbj9SkhhsA
	 AKYrZ26Vd9Y1XUsFSdpDiWhITT/A1DDymAeY4NIB1uN/xsJ/eggNlex3NaIMcOhIp7
	 Jz9YOKY8Wviow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC97661253;
	Fri, 16 Oct 2026 13:12:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B79A3920
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9297760E9F
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QJMhZIHm7stu for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:09:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 70DBA60F1F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156191;
 b=nRIj73UrtRpcW4IhyYDEqs/9nDKA1gWYwOclTV0XAUXTauHgsTIJIhWllTCl7vTrugAa
 gccqs2S51tY9humE1bMbGdULCMw7SeunwRvKSB+GRZ78i8xTXBJFLWHA7cABwfdyPjVgX
 K5SYz7Jleb2mTwnW04ccObyGJcR6FWo/GUJ/pJ+1fbB6aP7yDLkWsK3d9fD32U0bHtTAb
 Td3ue3V0cN2NVcQdspvqoV9dX6FQWY9q8u2ISCXfAQCHrmEkMS6NT5nh6cI8TLg7uP+Uj
 L7k8hMksEaeulnSzUahec8NPkfuElhx6zqpn2sCbqj4wLSw3Kr/1gN9MAZ3eW9C8oqg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156191;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=PjGZVwGaqJ+NzUPKYBYE/Cj/ZqXgBCJdoqT7X2eagh0=;
 b=GsOFMd3uBSxlIliQIFaPYb68249ExwZOw2O1W8awOMmUNysE46onjxpaXsGwMk1GUYck
 Hjz9LauN5FMP+iQcw+DA9yRaImGkAHsd9Mp9mGDTnIHsGAuysu4n3xIgtuYl0FwZVJpZc
 7spu2DwVuxW4rTZs59PQFdd+1q8yL5maZz3ko061WeykkleoyQVeYgwhiaYp4WO8jfwU1
 GW0ER6St0or9l7C9SpwocSdFjjnMpN1Bbhl2LHUw9IhhQvRM5nmyxBFc42g/5f0LwgLpR
 DwaoZUB5Wu+pvaNIJIMpRmhIoIphi2+bnkugGBMe6Ua70EgLWwww9TgkeFAgoclph5g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 70DBA60F1F
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 60E79960D7; Fri, 16 Oct 2026 13:08:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 14:03:58 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: f7a030038f77a82678407dd0c2134129d6cc5151
X-Git-Newrev: c3ccc14629a57b7e078fdecfd8f3ce22d64141f1
X-Patchwork-Hint: ignore
Message-Id: <20261016130830.60E79960D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/go: security bump
 version to 1.27.2
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
Content-Type: multipart/mixed; boundary="===============0850831014348357872=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0850831014348357872==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c3ccc14629a57b7e078fdecfd8f3ce22d64141f1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

https://go.dev/doc/devel/release#go1.27.2
https://groups.google.com/g/golang-announce/c/U2fTuyDJznI/m/bAPU-QKAAQAJ

Fixes CVE-2026-56857, CVE-2026-56866, CVE-2026-78659, CVE-2026-78660,
CVE-2026-78663, CVE-2026-78667, CVE-2026-78669, CVE-2026-94439,
CVE-2026-94440, CVE-2026-94444, CVE-2026-94447, CVE-2026-94448,
CVE-2026-97030, CVE-2026-97031 & CVE-2026-97032.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 6a9ea2a8bfecf9fc1bb4c8e14106ca11410af72e)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
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

--===============0850831014348357872==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0850831014348357872==--
