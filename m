Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B2FC88E6F
	for <buildroot@archiver.kernel.org>; Mon, 14 Sep 2026 19:27:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83870404F5;
	Mon, 14 Sep 2026 19:27:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gkoJUO2swAX0; Mon, 14 Sep 2026 19:27:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A1FA7404C9
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789414075;
	b=ZGpb2H1BqN4euqW22+yDGJZ5s1jsRcV9Gv+A3FR6ofdO9/1MJzUwRlLkgy7xeMxtnYnP
	 lDat9kYXe3LO2F37PVzhVzPkZRA9PflcayA6uO/mGe7chghFdsbxobk710cG3AFYp1kRN
	 TLiSrjHF6Db4V/Va3Ox/kO7w72N5gXS2rzasixTfwGvjsQ2pus2J4T/YPDQ0pu+VVUzJn
	 +JFUGjwQIc5MxKX5e/BtfDD7PtzXWRIUTWe9fNxCsh3ykcTUUWTnkANwc4ZpPb2AKkf+w
	 iWAY6YnGiPy6gTxjihXG0wDs7hO9xgbYyoqTfJ9utsEVdBsUaJx9LNdFf1SJyAKTGZQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789414075;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=nWLlcW929abTrn804bNSTeXpfzgfeZ8P/TLNXL2ioO0=;
	b=g9lZZKa5ae4uO/y7MiY/H5zJKVutiPg5bk3ChNKHNUN0U30tkMOpfZxc0HZ0Tijfg3Z8
	 Aaew8cxEFYf7wcxE6EwtviFE0q/eTaFiIgnEDeo2gFFWQ/2opjI3tdyCPewVvO/rwMOSL
	 dNV75LRunBxM8pOUk5BpfvMfH65rJX8/Yu4lvz+0U7xlSH9hqJydNl8mE9/3qYU2KfYlu
	 1FqSuJizoycdgAtnLTHbDxRDVgUaSbG+MdSOKb6/iOAJduAzFXmA5pQr47+n9B3JIdPTE
	 +Icg9G0whfSjvwaKkFcBTmMRv+ooK32cbm2NAiMNh1ExkM2/uWHGzI4qXQMVgLEMd6g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789414075;
	bh=nWLlcW929abTrn804bNSTeXpfzgfeZ8P/TLNXL2ioO0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BD5yP+MkdT0PKKfo6BNAQW7e8IpBqaxcWGccK/8xO9elZwo0vDW36qKBCL+FtDUwg
	 5xZKzi7kn1aa7walhe53HKdCg6Mvqd6yfeMAJFi0b3GW05mEVTW9hykCR5XzubHEFp
	 ujl06zyUxA43KQfYPbd+rDlLEzIbRL5A5JHOUJr+hcd1CJmr8kUk09hpBQC87pl9UL
	 whkPwBzh1zs0Q1N3b5cvFjyjWP0HaJOAjJgCNNDRitt/ekzEhfcfTNgQfWjGaGgO1U
	 yf8hdSe2nSCbGbcefplSZ/JyI8SYg1uOFvnD6WwoBOptp0eW6rfNXtU92r7ZwD7Pr4
	 YPoW7QTG+MDZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1FA7404C9;
	Mon, 14 Sep 2026 19:27:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A4E61259
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 19:27:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 967CF404C9
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 19:27:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UED2Ks3ge8hp for <buildroot@buildroot.org>;
 Mon, 14 Sep 2026 19:27:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 920B64048A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789414072;
 b=XLqYTIIDSVXubXoE6Hyf0cWzEJdxM4wg9KSJu1Ul1jhA/670O/qzFo8Qct8mFVxPZduw
 Y8WlVQ3+5WKbF7t1x4HzVM2wHyREB6D6r+iAq6QyZ6GTYsp8QI6lGA1cn/fsTSePSuU79
 VQ8mqH22+GK5NrSgIFe2p9gWgPEh/+zuhcbLujXJbgywtwgP+pArAVTIj/R1xpjl9GsPl
 uhSYcaQ0iKwa/P2cZF5aKWzuOKHHE2Ukl+L+B5wy4tZYnPSIaNd2hmn6jmmw/pbY11FTk
 5Zl9xuktNAf8HxrbdAILTNn51rzYgRywhJ16gUkvbePpk7N1mmKREDjZvnXftBIVOjA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789414072;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=oN3xLWQkBODnUlkyTHL2Iu0Ht+ulR2tozuZPrko4/Jw=;
 b=UqPmTvihiUw2mQRJ0NpxU7prBRcRfEdQjbq/moUzX4K50syQtnF3ODnJDlL3k/U9K2xr
 f301Ylw0l07Tjh5qqvzX6QJN4/nojuooCoAZ0TOQvXyZxk6zWSt5a9sX+8jeYzcN7AVvx
 Hk/MaD1KSFZDir2ceQQS8Ta7NeTqjXscjvTzVRQvmAdLbr0wScrmq0AFHzvsKvthjJ2qx
 DEwLD0luWg4wZaCgW6uuAyjWmopJIle85PyaYsps+72lCyp8DXUCSK6hZeN85oSshEWtK
 zalw5li8/SU2qjXkbiHtC5Ai8qARzUcpu9CvbCOrtQYWraQgPVqyuY/xKCPUbcxqoMA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 920B64048A
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 19:27:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1B89A95CA4; Mon, 14 Sep 2026 19:26:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 14 Sep 2026 21:19:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 38918ea48e55290e8115ad5a336ed3f6d3671757
X-Git-Newrev: 21f18cd0124f994c736c034d79218a2c77735b31
X-Patchwork-Hint: ignore
Message-Id: <20260914192645.1B89A95CA4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXfont2: security
 bump to version 2.0.9
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/21f18cd0124f994c736c034d79218a2c77735b31
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes the following vulnerabilities:

- CVE-2026-59679: Font Server Client encoding Out-Of-Bounds Read/Write
- CVE-2026-44950: Font Server Client Cumulative Glyph Data Heap Buffer
  Overflow

For more details, see the advisory:
https://lists.x.org/archives/xorg-announce/2026-August/003734.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xlib_libXfont2/xlib_libXfont2.hash | 6 +++---
 package/x11r7/xlib_libXfont2/xlib_libXfont2.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xlib_libXfont2/xlib_libXfont2.hash b/package/x11r7/xlib_libXfont2/xlib_libXfont2.hash
index 86e972a0e8..d5813b3e24 100644
--- a/package/x11r7/xlib_libXfont2/xlib_libXfont2.hash
+++ b/package/x11r7/xlib_libXfont2/xlib_libXfont2.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2026-July/003715.html
-sha256  f556c0e1093a4e6911cc90bc4b106d201902ee187fd74af206ff162f7e6a24d5  libXfont2-2.0.8.tar.xz
-sha512  e14cc3fa03d7baa4554ee5754ab33f69ac1da3d509c686a5f705fde8cd07772be564d68cc18d9fd0beb5ed7b2f864fcd7f6bf4983f5c0db08a9c747d0e001531  libXfont2-2.0.8.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2026-August/003735.html
+sha256  f042a370666815e7b941e9b7019024755bd1c6c2954afbfa515af378251799e2  libXfont2-2.0.9.tar.xz
+sha512  ccd6d6abf6aa814a940d137813dba638f8259c3672abf00808d82df033c1026ae29d40c9068da4f112637338ad0d0fc15818a4afa9369a626c8f17e466b4fa72  libXfont2-2.0.9.tar.xz
 # Locally calculated
 sha256  3b1047f0d45584973866a40e3eedc74aea4c6ac636960d650ae05af603e6d1a8  COPYING
diff --git a/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk b/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
index a881a4c55b..e8db0004f8 100644
--- a/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
+++ b/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXFONT2_VERSION = 2.0.8
+XLIB_LIBXFONT2_VERSION = 2.0.9
 XLIB_LIBXFONT2_SOURCE = libXfont2-$(XLIB_LIBXFONT2_VERSION).tar.xz
 XLIB_LIBXFONT2_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXFONT2_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
