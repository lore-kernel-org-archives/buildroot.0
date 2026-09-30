Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E9B8CA5FD2
	for <buildroot@archiver.kernel.org>; Thu,  1 Oct 2026 14:23:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08AB360D8F;
	Thu,  1 Oct 2026 14:23:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZPQS7tP-mtAJ; Thu,  1 Oct 2026 14:23:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 3375560C1C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790864586;
	b=jwSaGEhjgec2SGS0UO8CuVlZEtGYU6HwdHs/gwFwrquKKyi/WBRN8DBlXoTbTwaOo2V1
	 8udZMJ2bNdeoNvcMbRYWrubGdNJtY6MKKjHmXLfvnyMMI4ARUZgcQWrca1E7aErqm6g7F
	 GSucJdQ7oFDx+q1yjpx8VTMCOJBYeUhEXzeZrYyPkval8G2HoTO/qIN/E9AQ336eh6FZV
	 HwJgErLLIHQeP/SHIdKXjuQp2wjcsaVGx64eVpphipDqm5luXpdC9BVtdPvyMHJSB8s6K
	 JzgsFuJIxuOwh5ngopkISFy4EIRNS2b+/nXf7F2c03bijyjz460vHU/4yw9+oLsJntA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790864586;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=wCClbcJeP+/3YMOot8nJKq0XolgGyE2guTzdMw4dKBw=;
	b=Ks+7Rdqf9Nx0g39dBRUGvFIrYgJzld+6M1om3z7P6yxILLHpD944zhbVSovqr9hxcxev
	 0Gf9iUsXChC93EcdP+r1qZtps8yVQ9lbPNDegdzKO+psCaoMORgZxUz9wVgJjeqSw5djP
	 3FVjgr1LCJKb3fwBwZRN0InxCKSc4vUJoRDFty0XpEAJlqWiWnZvwn8kwEnYpuH639t6E
	 jIZ58Y7m+WbqJoSeH2OU7v+2qwwcTunZHTD78BLWe16/JqxVf+6l9Z3gv5mj7HqjmNPBO
	 FcjZ8d9gG4O7NH5HIeGkhWIUQfIRY5OJ9fnq+XyVID2hJkpgnUQELiIUWHpNMlBWSpg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790864586;
	bh=wCClbcJeP+/3YMOot8nJKq0XolgGyE2guTzdMw4dKBw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MILBub5QxXGTn2xq8cjJGIAIkDeFJI8ujjkXhEGmyTPqWdUM/n2OYGypetCQjXkuM
	 RaJZuz8/IznZbQKJr8Q2yDdyyoh30zHrkrLrYZpqD+JNqO5mzwoK/TMsU7Vlf/HnkC
	 1HkCzxmWk2RZAugQiwJzQcXohNNSvOiQ90MexZF//g6xMao2m9Ny4SnYaygh/8s+gP
	 puQe9yy21yt46kBr2rzxzkb2X9CgQeDL46ba9/8fGTkmnmnCTLS0/nTtUxuC07Hhrp
	 oRkFQ1AF/nKYan3WOALxktv7N1nKq3aWB/J1R/+cwyoND66Z/5ieUttl77swYkBkUP
	 4RtiPb1LAEemA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3375560C1C;
	Thu,  1 Oct 2026 14:23:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 20616D22
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D69140098
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FSxHNIhsVaTy for <buildroot@buildroot.org>;
 Thu,  1 Oct 2026 14:22:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 47B1E4052D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790864561;
 b=pktkdmLWpPDPvUDcHIncXJKJVHz8nq1rUb6RK5GoiuVCq+cO1ESZLN0janeYC3c2V1uR
 33m6caqs3s2GFRfgJAgIvnRJE+0FAESkctDNgztnBCdBQ+rN08Pnoy2ABPao5RinYacxA
 9fnmoFjWo0wiiN5+1ADdnY9Bu8JwTMvfNqjrhkT2XEQrWRm80jR8BEuZM7RfUSdHL3zf1
 VVZya6R6rlYp1fYH3vEBr5fItPc7G+gWyQman5dYcQBe5ikX+BfdoksLaDsP0eBnax4C/
 jXg8VwGtOs+DUCFUrMVrzz+Jwq/1rYJZAzSQqSLgQkk5lhP1jxiGLZQLyLA9Jee/Qsg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790864561;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=l37Px+PH3sWxRdTWyj+3+OAnpTsxfRfOcEBVV9/wkHk=;
 b=oo3awZbNJdSOo5CJ11jvj6RNlmQeS72FU6VVI0vKeQpRbmWkrGFwXQheAwIRDxp/peIi
 AT1h5Hw0fx131e7078N7VpCwZ0L5p1xclyjfBmKcaEENCCSK9a1njTnNJxleeFhs2KHOH
 d6/2CJs7t923h3u02W4F4jHZLBvORu8FkjLATieEG/1AFaS9zxAzMqN2OsRjskB+hK/Kx
 9SM5Isy5O0xw52/sY67iYBRfoZiMjqoWJLmSvX9GoiQg9AXwgNDqqMQ4x00kH8LlegVYb
 AwNg2wIPiZUWW+vbiO7nM5T9uQYrcQ+JgkYmLEyy1W2e270YOVq1oJLuHC0wqoOrF/w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 47B1E4052D
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 83C8295B8E; Thu,  1 Oct 2026 14:21:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 30 Sep 2026 16:28:50 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 3296b7ee48713ca32901c23fed9620f5ab3ba7e7
X-Git-Newrev: a6f549301c0bd80a7c1ee8e39a19a6195593fb1f
X-Patchwork-Hint: ignore
Message-Id: <20261001142127.83C8295B8E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/wireshark: bump
 to v4.4.17
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
Content-Type: multipart/mixed; boundary="===============3045813149130378763=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3045813149130378763==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a6f549301c0bd80a7c1ee8e39a19a6195593fb1f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

For more information on the version bump, see:
  - https://www.wireshark.org/docs/relnotes/wireshark-4.4.17.html

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 1d257e242c7fcbe6082d774602032e92b7a2c700)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/wireshark/wireshark.hash | 6 +++---
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 2c15d4f0f4..917ac47471 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.4.16.txt
-sha1  1424ea22b4959f94eb85c1fc3c510f281766144e  wireshark-4.4.16.tar.xz
-sha256  0bda0e34a4c5da72ea9009134d733783d08189c07462198e53a4f533fd1201fd  wireshark-4.4.16.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.4.17.txt
+sha1  d46443d5bbca3580f944f3effcdfcc59e24eb7f4  wireshark-4.4.17.tar.xz
+sha256  b89a8c60b9282f29be4db91437a6e969e61bc17e8c92ddd980cc38c7304dd772  wireshark-4.4.17.tar.xz
 
 # Locally calculated
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index ab393b8a48..1fd81515c1 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 4.4.16
+WIRESHARK_VERSION = 4.4.17
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license

--===============3045813149130378763==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3045813149130378763==--
