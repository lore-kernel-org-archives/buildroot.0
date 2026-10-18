Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18DEFCCF2C9
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 19:41:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D91B2406DD;
	Sun, 18 Oct 2026 19:41:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kz47Bz8kAOJi; Sun, 18 Oct 2026 19:41:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org EAF6D406D4
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792352499;
	b=fWBTxyxCJwT8uTOlevX7VLVp0ZE5PU+dHSSuLnOf8wuxNtWc7TLhx7DBVeQehYA8OrL6
	 oe+q7Gg8pCma9QyzP4kgtnnM8sm0HmfQMjG+xkWSVFXbG5bjKWlOdSdY6DBpbm8DYtr1G
	 M/aB/a6SjlOVsfM2r05Lt88RZpDh6vIkK1xfEq4h2fquNXkAt6QnLZZ91UaItM1GWWaS7
	 YoVkWX5KMrSh6NFy6tE9mN+ITodYTBYlMcuK8d66WL6b3UknU85H+SARZHOc1P24/QV7v
	 dyu15xG8z26rY+bxN/OcdIqCIGXQ6DrRn0LsuQ+sb/nju1C7Bve71RTngespuiDGQ+A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792352499;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=yjGGzxkAHONjVIMKinWRDkPh8OuFF5772EYBmYJ96uQ=;
	b=bS6z/B1E96HUYiyHGymBoabxRqWmN8f2pmrJ0Mjt3R5OtYJakS59nr+QSaSBxh7DHEVk
	 diZLI/r1zWPfylY2VxIVVuY28t9otM3R+BE8k8V9aRJ5u0C4p/y6+YDOTqrqBbk2VL9IF
	 u+I10gj8XHrr/BljZGXx9t5pznNBcSA95wNbSs1WAnq3KR9iG3XAhFQsRUkKUUA1KdQEc
	 YDffKmW+lNvv3LJUJMcgjFmXk57C+krrxRVAv6GJzXrJrB/g4NTAAAkPe0dUQKwuuDT96
	 T2k50t+MuVREvPVx3mjpz0W4DnCVAei0FbUd38wVamUIiddEJb25KMddVjJFbAoJT2Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792352499;
	bh=yjGGzxkAHONjVIMKinWRDkPh8OuFF5772EYBmYJ96uQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CnQZghgY0qPoB0oN9Hd7z1MjM1mrLPPAQlGUva9OyrjPkR8I8f4v4dG88tjQzjiHv
	 XEd6w8Qla/mlRRz2BCtHaDZsI6XkcSaFWeR6Es1WDa5B2Gt90yw915J6jx4dJ1tcxi
	 xyjZc1ZfvNLY2pgiKHCUoqIcXmsjKcjtC1v7amtJ7imDpErf43nYcOtYh7H5IyLd/a
	 XC1kafOUiU1jurgESJHfr7G0GZh1C0SswWHp8KO/7Y5w+nfHq9raAh6vqH4bUZAquU
	 5RqxcJadIwTizEXHWAEuwfjJm2KT5Tgl7LXJEJawFtxZOsM+OPz6aTzn4+kC/y7aD5
	 fFIByMFHVq6JQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EAF6D406D4;
	Sun, 18 Oct 2026 19:41:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E6D162A8
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 19:41:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D907640068
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 19:41:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aXCeZsp6-lPW for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 19:41:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org D556640049
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792352494;
 b=iK9LO77pvjB/23r6lf3wk5mv6S+6TUKFPhluJOSelF48m1MQqa3m1AMmCoyi+SkUD2MX
 2trj6x64OM2YOKXZmCix6AaDaqky12dqdqW/tlYm/rY9HwW8AP63XUxPGwMTCEq+ilB/m
 xjMsItgqqD/Rof5tH2/Ue2aanEtxuSYdoYo/DwzIJz9Hz4IBXBfI8MafDwI1442XtiPjX
 ODEsIuScfbmKsDyaqmK4QYcVMj3qbVMW6Uqkvtdm1rh9wf2KHXkDDUL2Z35W8kjkFDqOG
 jZJgMiyHg6e0qlIeYHlON8musOTtNoGViMaBtRm0gXcoLzz23or6pYC135B8Bo/2zOA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792352494;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=knCyRC1PwQ1vJrHRWHmDeUurHe4vGCH1hNa3UigvvwI=;
 b=OpUdH0zX37HYlQ+KNsqrM827cgCZOoDkU6laleo5V156Dpg3HQ730RigHvMxOCGWFlQJ
 AttA7w9LxQmPWd9GKSA4TWhL/HNDAaRlsc0AnGgAoIvJUCo8IPmkxhjU5WQ1bj+2ziXHe
 lYkAO3y1eF9oR/g4w29htj/fel94Enej/WS3nlk96RNKRhyvVDmDvY0+/RUMPMYDvqYi/
 RJdeLSX6kuWiu2DecZwLqSL4QPYBvohMgFnVdaMYr2WcBY+TaCp6w1+Q3BQSHFErrpOD+
 Orr4apsy7Bf+Fe7UpDCMZIILSIhBkaF3DMpYG8S+h/2r9KZSHRTVPqH0/0LT1fzj1CA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D556640049
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 19:41:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8ADDA983C8; Sun, 18 Oct 2026 19:40:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 Oct 2026 21:40:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: de2b983811ed5ed8f9ec40ebf1f6c286e701f15a
X-Git-Newrev: d04496c8c14a84c6ff9f23a023eb70eea61c683a
X-Patchwork-Hint: ignore
Message-Id: <20261018194012.8ADDA983C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 support/testing/tests/toolchain/test_external.py: use HTTPS for downloads
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d04496c8c14a84c6ff9f23a023eb70eea61c683a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The servers already redirect from HTTP to HTTPS. Use HTTPS directly to
prevent manipulation along the way.

Also switch from the autobuild.buildroot.net alias to
autobuild.buildroot.org, like all other toolchain downloads from the
Buildroot autobuilder.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/toolchain/test_external.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/support/testing/tests/toolchain/test_external.py b/support/testing/tests/toolchain/test_external.py
index b3bb961aac..038b072d1b 100644
--- a/support/testing/tests/toolchain/test_external.py
+++ b/support/testing/tests/toolchain/test_external.py
@@ -80,7 +80,7 @@ class TestExternalToolchainBuildrootMusl(TestExternalToolchain):
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
         BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-        BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-cortex-a9-musl-2017.05-1078-g95b1dae.tar.bz2"
+        BR2_TOOLCHAIN_EXTERNAL_URL="https://autobuild.buildroot.org/toolchains/tarballs/br-arm-cortex-a9-musl-2017.05-1078-g95b1dae.tar.bz2"
         BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
         BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_12=y
         BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL=y
@@ -109,7 +109,7 @@ class TestExternalToolchainCtngMusl(TestExternalToolchain):
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
         BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-        BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/arm-ctng-linux-musleabihf.tar.xz"
+        BR2_TOOLCHAIN_EXTERNAL_URL="https://autobuild.buildroot.org/toolchains/tarballs/arm-ctng-linux-musleabihf.tar.xz"
         BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="arm-ctng-linux-musleabihf"
         BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
         BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
@@ -137,7 +137,7 @@ class TestExternalToolchainBuildrootuClibc(TestExternalToolchain):
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
         BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-        BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2017.05-1078-g95b1dae.tar.bz2"
+        BR2_TOOLCHAIN_EXTERNAL_URL="https://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2017.05-1078-g95b1dae.tar.bz2"
         BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
         BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
         BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
