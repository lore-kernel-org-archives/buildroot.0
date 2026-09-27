Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC1E3C9830E
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 10:08:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A1F06061D;
	Sun, 27 Sep 2026 10:08:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4M9nnptdjejK; Sun, 27 Sep 2026 10:08:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 5C6D26062C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790503690;
	b=bqEkwQsyMtKxY+ji19t4k3uz3NWQDebwrKL6cG8i+DRPc6A2tDeWLNrpi59gzobzclWZ
	 inTzfnrdZBpoNB2VgJJhy+9zahKRSwuGhr0YiBbXMZSwz8wNVBgYWG1CivQJiZb1Tn5v8
	 oTGavrru6CDD6hI17xkyPjyc7oEy9T2I8yZtIYpeCrs6eMrR6qxK7pWyDz69D7UjGZYpq
	 Lc7H6H8F+Z16hIWxON9WjRA7JWQJCye4YBrlVuBOpUf8JU+BBX1Z60hw7R7+4sQ+mQgXr
	 THBcc8VLjbHha79XNxIp2O5jVtB2yNlol+e/nJ1CVnoX+Z+4jaOdmKVo4wNwWPBQkMw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790503690;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=rhkMKXnM/UedDcIGz7uKuSIlPJhwxgOn7SvHkB0x8Vg=;
	b=i5E1I+fZ/XVykpq6RHpc7uqd9BYgNxObEu5bqHHtN2q7EM6mGxxx+PRTtnshn2dXrBAV
	 jKQWsvl6n5N359pCQi/Ios7pTkyL7jlNYImvqU31Mu2uojt8vV5tEW431JzEqRK29Z54k
	 7scKQXnXEQeCz1hmFGyakZYLC+/mxktuKqpMvE95+/AA56v6mKtC4J2uyuPRs/MvfAcEt
	 K7SpdPBIqXSZ1zBl7GKEP7Wlod/rz680TI3YOnUDi3KrenG+OVhcTGQcv8RnXqE4qh9hi
	 k7WaiLVkR/Q3zCuvASe8OXSR0AlYS9YQYEMlrF9O7sPW09fjHteEK/wRpzVE+fAQu6w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790503690;
	bh=rhkMKXnM/UedDcIGz7uKuSIlPJhwxgOn7SvHkB0x8Vg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kS36lVrBK5pHPhFmIBfsgHCXEvXFslr4BLhBBkxMQDQMZtj4A7AAUdrgEArDP1/J2
	 kMMa25Gp7tsGfFSzhpW0DTfCNChVq4HVHuJbtRUhiF3JJ2M0r/5vsHoysC2NvT7LD7
	 RWXrIoNXwOH87EdFHVzi9VaKW31wcCMNO+Kp0Ao8W6gUhPFLjzLh54PCKeuj91oPiS
	 PTzyERu4vizlxPx58O16uXHGI4SleGpfNwKJClQGOenMtsLk7qTHL5ryQh7bNMBoUA
	 oB1cEEJ84dMQHjE6hNp5jxuXgLpsTE180TSgT2/urkBg5//cmDlPPqkbkupOcRQE0R
	 +2l9Kor9ufiBQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C6D26062C;
	Sun, 27 Sep 2026 10:08:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C4BA224E
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:08:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B681660640
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:08:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jp7PZKE7XduN for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 10:08:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 958886061D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790503687;
 b=YanZGUKGc2Q2w87Y6qjIJQQhnwxtqD8O0bhaWYO+qkgTJxokOAF/JMr1Ub1jDgxllwth
 JgcOBrCHZLxl6vCl9igR4gxq7+4KRscTY8XjCIo5ns69d665W6yKEZq5/P8+zpdkRmhab
 kqysbDQze/nvlw8g57kIvRAIt+KTAwjMK9wZIURLIhwdXeKMGiUxJnIWXwLjpdxeCTpLJ
 VLJKLlN/BvGqufDhba9fiKiZ1ljd+mwmVZNJ9h6uNIhOmgYHE4taQT7Jp4JwafC38lT74
 H927aSKwpzr2RNllKihtB+0lq3VFxdiuuHkAJjj+gB0/8yxWpVnoeRAFblgvr0Ko+zw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790503687;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ScdRYV9JpD/LChgiEGSaghHiFtBNTdIQr89DL5QLkUk=;
 b=L41oAiniUl9N6HMtLSMDcB3Rx2KlDHUUWD/dKHR6+cdxrxFOER62DxJPo8ATNIwWHKPU
 riILH0nZOV0xvcgMmj0NBw809BzvpgX201bijQaB8/UvH/EDUWxJMWPlDCyphNuqzWS/x
 2xZW8TOfXG/Fs1Uh6nHn+enQedlpXNIdgfElEvLgQZZWC75RZkWw13NELqC5XL90Pnz3v
 I+wzV+rIjpFE0KHvulodWQeJzsHmmA604FRkKoe7/PJw9Uqve7CekU3QugMa0JFfzGpjn
 lrLB7OWTjtP2douMC7REkwMVn0Jj164j/WX9fpb0rB+S67aawoUlSG0O/oY2zDkdyvg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 958886061D
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:08:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E41B780212; Sun, 27 Sep 2026 10:06:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 10:58:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 94143f61e409b03e921503f476bc67f31e5745d0
X-Git-Newrev: 7626aada6a08a45ec07ace5c0529b95ca165db19
X-Patchwork-Hint: ignore
Message-Id: <20260927100655.E41B780212@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nftables: bump version to 1.1.7
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7626aada6a08a45ec07ace5c0529b95ca165db19
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

- bump version to 1.1.7 (for details see [1])
- update coreteam gpg key URL to newer key (used since nftables-1.1.1)

[1] https://git.netfilter.org/nftables/log/?h=v1.1.7

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/nftables/nftables.hash | 8 ++++----
 package/nftables/nftables.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/nftables/nftables.hash b/package/nftables/nftables.hash
index b7c65777ca..b278313e16 100644
--- a/package/nftables/nftables.hash
+++ b/package/nftables/nftables.hash
@@ -1,9 +1,9 @@
 # From https://netfilter.org/projects/nftables/downloads.html
 # Checked pgp signature:
-# https://netfilter.org/projects/nftables/files/nftables-1.1.4.tar.xz.sig
+# https://netfilter.org/projects/nftables/files/nftables-1.1.7.tar.xz.sig
 # with key:
-# https://netfilter.org/files/coreteam-gpg-key-0xD55D978A8A1420E4.txt
-# https://www.netfilter.org/projects/nftables/files/nftables-1.1.4.tar.xz.sha256sum
-sha256  3444f0012af0472399eeae89a758b9c6dc5f311f6c67a48988fa1600fc4bac86  nftables-1.1.4.tar.xz
+# https://netfilter.org/files/coreteam-gpg-key-0xD70D1A666ACF2B21.txt
+# https://www.netfilter.org/projects/nftables/files/nftables-1.1.7.tar.xz.sha256sum
+sha256  a6fbf060d8d4fff001517a2b94f356bb4366bfbf0ba366366f9d27cc38caa58f  nftables-1.1.7.tar.xz
 # Locally computed:
 sha256  4ee1e51baf5f3166712fa0c3e01338c7257e50ddef245d28bb14ad68f6070ba5  COPYING
diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
index 94bf977725..63463f6725 100644
--- a/package/nftables/nftables.mk
+++ b/package/nftables/nftables.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NFTABLES_VERSION = 1.1.4
+NFTABLES_VERSION = 1.1.7
 NFTABLES_SOURCE = nftables-$(NFTABLES_VERSION).tar.xz
 NFTABLES_SITE = https://www.netfilter.org/projects/nftables/files
 NFTABLES_DEPENDENCIES = libmnl libnftnl host-pkgconf $(TARGET_NLS_DEPENDENCIES)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
