Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B75FC79F99
	for <buildroot@archiver.kernel.org>; Mon,  7 Sep 2026 19:59:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 427E240523;
	Mon,  7 Sep 2026 19:59:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lwwJJxpyo7YQ; Mon,  7 Sep 2026 19:59:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 8414040518
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788811140;
	b=R2IBN5jHW9GKYbnx8J4zvQK1JFaKa3vPQ5sdbLrJtYYKM7j9WFCPtUNZo1STSkc4rpEP
	 hp6whX46I54M3TRuJiZFGSXoyIXFdlfgNpLuJI3zkgNn5r/tnnIFcN5e1KgyiokeQEaYR
	 h+I55MDIMdNjJrKIOJ8aQp+fuWRcMvZvbKTTPqgPGFxJvD5jW4G0eR3sUo14gu/uMK48J
	 jCYYESe0me5DJyRntpaff0TT0OIHOPhI8soUvEuQq17Oi05aX96ZrJBik5jrtdgO1bYrS
	 VNVXpSmjj2HiPohQzqctEO2RzxnbCEqWJEN2PHx/iBTYTIQyL8sVpckzMH8W9+u+Bvg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788811140;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ixfAwuDHQI4/hYOVjtY+/k3NkUqoIMt7W5sGs6/YYsM=;
	b=gOUKtQv9+KNkOKe4bwuYSPqaWDpoum96sjYmZv3B6360nleqm3IN9TCDRk8hzHV5xCDS
	 wL/5IbOz8eDE+ZXKz8HifuTFlzsOO+gn/Z/OSyooTridMmgDJF4HhpmcyxjCyrEHeJTPj
	 Gj0iS8ALxUKl+c3623sZbXzgVGXCTxeUVrVqZpuz0uwj2zSeqY2Ik1SBfVuANZARRnNMj
	 hqk6LwRyCP/x4HuG8mJkCfL7vM3y7sbFFgF3xC2IpvlkoKtBhkF8tYwaVfQSQXjdGsREF
	 3UVFFJ/iywlGeLX8GByiS5YxbjtwX3FJscI1f3S+z1Gk04dlbTOirs1i3YBQ7bSncaA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788811140;
	bh=ixfAwuDHQI4/hYOVjtY+/k3NkUqoIMt7W5sGs6/YYsM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JqSA8D2EBvocrQpnpJD2KvXNU8fvFRG8TT0TDbmOkehMPwgYSLYm6LWLT8MaC5H13
	 xEnabts4RUd9cuKEA8HpIVT1viCwhG68C8wdNsYeG85bhydGKHLz6Eu5IFOI+z68bX
	 8xJhysrvpJEUv26IludCjoax8tYds1MJ1HDelGAeE2c53M7OUOmziGHZwWOtjzTAAW
	 X92x+l5I/lKzx61zVgBLw6C0gJR+wxEkgExKvo/pEP1mUS/w3xZ9FM8/WHDEB1wFaz
	 tTUqXHpi+Apw+Rhza//JarEQV/f+MIUx1v4SOG/yzguIcePf305cFaqMUfgrMQyRKO
	 O3K8LrrUfQR7w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8414040518;
	Mon,  7 Sep 2026 19:59:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F16F388
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 19:58:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C9878099D
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 19:58:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3TUJwRawZna8 for <buildroot@buildroot.org>;
 Mon,  7 Sep 2026 19:58:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D17C680994
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788811137;
 b=bwp6+g+tkO8CW7LaQukVmUZvkTg8r8p5+Y/idyK5NOTBI9d6ea4oC6wQPdf/L2E49aWs
 RRf9xgeS0R+yxVaT63VoW9YRXOlDdLJhD+clUMgVMOZhZU4P1qlzXb+F7+rBNaugvE9/v
 8AOjb0FCQWfqsnHE9zWOunB12I1wUKZP3u5DwYOGdWYWV1XNUqqCOkUb1NCE9BMn1XBdn
 1bvBJqllqGZzg9rZ/9kbF2/2A+5oKKsu8ddSgC/z7aVhFH9QApj95nNHPG6UG6CdELRQH
 S8V6jJ6hOHTvSQ/7Cm1wxhp5XN0gZySuVbqLSAlISfD+DoTcY2kqURg8Nd3e3ixTukg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788811137;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=JWg6qnvPeY/iN0QN+0Gz+wliVc9rPHDzXZXqg7J0gVo=;
 b=r9Wv7AehZhnzfrVe8cEjkvmHLnuk5yKavsFUrf7ZMcLaqXyUGWX9ghe12EZJhXDQcnTG
 JIkqZDPZERwxh9yo4wct6/HeiuJHNEg1IvBW4ECh7ZkkllEm13NCA9VwceqWqE/35uGMl
 lqIMjb0Gib3VQ31aLk9PZ6rl7pgb4vGwalUy2rWQ6bw60Zq3D2b+LZuKqZVXAgtWUxhxz
 UNBTjQhWsiEt7m1ERqoF0nYxkNGy7Cbxh87vpt65ITHYeAeRfvG8Vw/dY72CPCLtyav74
 AafEk7G1nVxWKODgCqVLr4p7btNNSXdkFuOqDrAvdNTfSxqI2xJyg9rgUk3+DjNRGiQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D17C680994
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 19:58:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AE2889549D; Mon,  7 Sep 2026 19:57:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 7 Sep 2026 21:55:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 005c57acae85cd4cfe5a8d11d2bd2eb25f111682
X-Git-Newrev: d0c6a0c40eb940bb6cd12f835e00bb34edcba79b
X-Patchwork-Hint: ignore
Message-Id: <20260907195755.AE2889549D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/broot: bump to version 1.60.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d0c6a0c40eb940bb6cd12f835e00bb34edcba79b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog: https://github.com/Canop/broot/blob/v1.60.0/CHANGELOG.md

Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/broot/broot.hash | 2 +-
 package/broot/broot.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/broot/broot.hash b/package/broot/broot.hash
index a6d767c769..d883337d9d 100644
--- a/package/broot/broot.hash
+++ b/package/broot/broot.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  5a0ac9419b66b7a7763c4ec0e53394b38e87b2cc11958aa6d352e6b4c74020a0  broot-1.59.0-cargo6.tar.gz
+sha256  c7ff621324c799976d52becd7d0c24aad6f991b10421303884065305d4c00a1a  broot-1.60.0-cargo6.tar.gz
 sha256  89461664ce2aee7d80ea8fba7118fe7abd490d76ba435cf1d81d3128e060711f  LICENSE
diff --git a/package/broot/broot.mk b/package/broot/broot.mk
index 2f1648fb6f..c4cdce2e51 100644
--- a/package/broot/broot.mk
+++ b/package/broot/broot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BROOT_VERSION = 1.59.0
+BROOT_VERSION = 1.60.0
 BROOT_SITE = $(call github,Canop,broot,v$(BROOT_VERSION))
 BROOT_LICENSE = MIT
 BROOT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
