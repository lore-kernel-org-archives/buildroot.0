Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65D57CCF2C1
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:11:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31F2261112;
	Fri, 16 Oct 2026 13:11:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z8ywYc2iIACK; Fri, 16 Oct 2026 13:11:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 69D95610AC
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156278;
	b=DmYGrC877h1+X1wzo9E3jlHpE0qqp4HyQpfp5lHDpSfLE80cVHD4Oc+3/oAWzCmBJpfs
	 yL3mfzUrCRJPAzYizTEmtw8/R0K78Cj0zhE5U23ViGjI1bMZ5cc27VCwlwL3UKw5JD0nm
	 V07oNh7r92zm21srObctpPmiNiMm/gFiK0sKQul0CElI5wa43u8LzaYPxaApPGTcuifDo
	 OE2F+XMZ5PitfPhobZMGVw/sHJG+QYEKEmpTVXN+LCFS9y0Q/UiVntGPs/alX0/oTxcWw
	 J9aEPlibOc/m6OQLwuYB++dPnILvqxiSmNLjQJFXW9TMoHab0jDrFn69wreW+NnwR+Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156278;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=47ExXQ+uzNEBlZR2VqfgNTpYUUI5OYG8h3xtla1+x8o=;
	b=UPKCyjGUvuNQJpw7KpcIKIa7+rlbvicqvm4gWxDpAUWAH2+DYPNejpAvmjl+CaAr+QcH
	 HPYaEU6g3D5QoOaJhIZwi7MCdkA1Ozfc1cFrC4dB2qyc6cPy6/N/5GL9YRAQTQfkHPh8b
	 cjaRfm4OTEdMYUGB1l6JvbX5UQyTRX4pT2nSBvEpNHrlP9GSNzZoMK3P7x0GPKh6K94J4
	 rWewNioz+j0FlUgmLUGTRvCXT91pHQM2S+1cIlIVtXoOetHc+3y9dMxqb2CNec7JWTS8N
	 HKtJjC3LH/CiaA85qtK9uXr0UT/QaQ4zTle6UMTpeYXVIpQ2xN/GkRsDaiw38Oz96Ug==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156278;
	bh=47ExXQ+uzNEBlZR2VqfgNTpYUUI5OYG8h3xtla1+x8o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QVBwhu3/4lUNDCfjt6cFziF7ZuDp8SldPImkgRLF8kDmZgJd0+yYVdEvt88PSJmgl
	 2zMJjAyxpperS1GyiM+M5JSs0DOiwqIjfDBy8iAwxByt8S8C7OIUr/L3n/MZ4rG9sk
	 UrQ5AHLhKvw/XuPWZFdm9uDoS98vKBnnJxBi6NSKp5h7fQVCiiknSHSvUkjBcpKgkY
	 MP6gueQOfkseZCt17Vb9DJgTzQ9NYiB2ITQ5Mpw/RBbVJXcf83wyR1iCr6IC7k46F1
	 BNJSJpEKp/XbgS+QW319gkp/QkARU6K3lqJR4xY7nWWLfxfcT31FsrQAEGU6sRcmAf
	 Q2zd31UAfuBLg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69D95610AC;
	Fri, 16 Oct 2026 13:11:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 168F9105
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0EE184016B
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vImqtLfEBubw for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:09:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 068B940491
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156191;
 b=iTYWP3FjFuIho2B/ukKSHTGsBck9iUOWE5shQgEIni/vbzNdPq1RdikuvGnLo3xXZMRG
 7hhRgKBX2SUkWM/9T/AG0Ly5LrQ2yPfvW07FsZZ/7i15jNy7qTBEkMvUUmdQJv9dzvaEV
 oAjIbOzI6hWG2qSSVbMXfgweTWqWWCZuGJuLrFqHgSr1yQ1BuqZQwbpnV2iQdbAANmJyV
 dfmMUOchlSwn5v1tM19ATzY55iYXh3q5Lnc+o67thTa+vVsxoOTGKwFcn+48MxC5aNVlf
 0im1KhqonpDE6uW1xdFOu60ZWzfQ4Hjl47Wg8B/RxBQuEsUC/SSn8HtxasJTVmprE1g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156191;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=jH3rnTx1fKsRDvFUfrqmvcKs8uuwqgt4qyiswlW4gLA=;
 b=n6VXoicyunEq3foBYhSJ4sH92zt3oK6kKBDug/vzzAcLaSpR13/eJjLm/FAtdhl79m0c
 B4JLOKKUAXRie7GfdaS8mPqTE40LJoGRO91kg2mzWCSkxHZ7aHM7WpNnlb7NpwcOKfUii
 tQmXDDjT4vg4AJOnGlGrNd+UYSiiEj8BT+FcdiAdIyfi/w62k1/XdxwZN7qozKBMjGnze
 9vs5xEraLthptrHf7w+4XJ9thsh6jPgpuZ+2CrO84eAllguMn9JVSd+IOEsNz0aCGTxn0
 deJoVP7iqy+aHSK5PaoshnY5exaJRk5hDFLskzQzzbG3m/+/MClGZH0FSBvCihUIqJQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 068B940491
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EB623960D9; Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 13:20:47 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 23a89f02459f60432a2cb2af6704da62066ad940
X-Git-Newrev: c4edb8a80510a4edf1e61e384e4a9d3c7f5809e2
X-Patchwork-Hint: ignore
Message-Id: <20261016130829.EB623960D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/redis: security
 bump to v8.10.2
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
Content-Type: multipart/mixed; boundary="===============1177796199931284465=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1177796199931284465==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c4edb8a80510a4edf1e61e384e4a9d3c7f5809e2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

See the release notes:
https://github.com/redis/redis/blob/8.10.2/00-RELEASENOTES

No CVE number are mentioned in these notes, however it states:
"Update urgency: `SECURITY`: There are security fixes in the release"

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 5263a5f220444bd0f3b59ff12c9762e6d89565ed)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index c3239337d6..e0dc5fc521 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  60166c95ab7aedaa9dfe516de685be0a4dd87be95ded59ba429df14c13f1b663  redis-8.10.1.tar.gz
+sha256  b9ffee226b5eecdba98a679260dad764b2a4ebd90dce4ad5ac9e9f3eef9c02b3  redis-8.10.2.tar.gz
 
 # Locally calculated
 sha256  4a0e416b9537688f30dfe69ddaceb2ca64d96b7df02a0a6760d376890ddc4e40  LICENSE.txt
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 30142bc0e5..8b03f79cd9 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 8.10.1
+REDIS_VERSION = 8.10.2
 REDIS_SITE = https://download.redis.io/releases
 REDIS_LICENSE = \
 	AGPL-3.0 or SSPL-1.0 or RSAL-2.0 (core); \

--===============1177796199931284465==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1177796199931284465==--
