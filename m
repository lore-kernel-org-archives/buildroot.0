Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E1F3CA5FED
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 16:37:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D668A606C4;
	Sat,  3 Oct 2026 16:37:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R12mV4IMpwsQ; Sat,  3 Oct 2026 16:37:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D94C060681
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791045472;
	b=fJ12QAKzdB+bm34QCw/f6QfGR8BNiDqTOCh6d+rp4lyX7DRamCB2pz5hwM7CKdM5C6/o
	 Of4EcVjnJbgRo5ZtIj3clv4ZxkMLdFEAdk1KReSfBZQ5V2SOVQJkk//hmng5jpKJKF8Vc
	 s+wg5vOmK0zPZCg/1yiNYqNA4vQZGfar3jmww5wcXITIPLCdQw8q2LgpV+NJyyUO0AMfk
	 RLC6u+T++/TU/uyuOga5NiQ4TBt+vowFBVsVOjTOJkeCk8Awk8yv61wcH6KZ8pujTeeJP
	 JV1MDhm160uV+835AdeX6y9KugQgr4C030gInDCEVzSRWD/fbAub9LV1nSjgPLsf91w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791045472;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=lv2KKU41in4dy2WgB/sBlAgi+sbUImecFUbOLyhZK0Q=;
	b=OTO0qja9sho2iqP5R+SBmCkT4RtAj/JR9uZnXDLF6iRbRsltlPAJE2A3vyeA+DK/mAw+
	 HtFAaIdwiy0OOA89d5QSZc3GAF/NpJSeY5ows3ApUrf9psWC1tZ5VS8p3FuLX4ARTPEZV
	 jtyBmqTBoWqv805LXYxJcfr7PZbiOXQ7cjGzXUJrCPF+p6IwqnJSOkV9l+I+IXL1+AoBR
	 ISNxaORQ9r5uiVPm+liO4tw4Ra/ltskdFF3TlWvcVBRgBUlXuDSNZ2zZniYWS7jLdSmRt
	 CcS/GLIhv/aK/gSb79Dg8y0VNxqqAi6hv60bacuTun3Wr2QAoFLTPPgCjd136Hu7yWw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791045471;
	bh=lv2KKU41in4dy2WgB/sBlAgi+sbUImecFUbOLyhZK0Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nRFDr9ukT/hUHJfEzgqk8+E/JfY8bn6M4YIdqRcj/TxzuHnIjxcwv7NXmevgWSuqS
	 xQuS5GCtGVOiTRq5HlxykIQmkwJk+mj7IWjG533BJvog7tmzz/CzFjnfTfWY4qQDJ1
	 cYMas0WIDVMjDp2ZkoOe0H8gACXLlNqIiVYZFCq6rPeDpm9xEVrJoM16AMJEGgVJsb
	 qV0eyM5A+XtBAjWS6tjWDwQ14+9JekLsAQTbyMHSj+ueIzXIENQJ50hRJSLMDRF1am
	 ZRaZwf6juF8zDDsn4DrSreNIngcSzmUYos0GZjIVyivhdIRUVsiHIUojbIQSMkOMDE
	 551LzXB1ZDTAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D94C060681;
	Sat,  3 Oct 2026 16:37:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B69E42E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:37:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A72CA80E60
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:37:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tj56R7NDBoUm for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 16:37:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E049380E35
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791045469;
 b=UM4k63h6fjoXRSnMjdR52Rsbl3HQ/qWn7IUDB7f5pDOiZdOxFgQNEeO/U6jMYNVPScdb
 Dac7rvxhAvL1l7+5kkhJMq8grgT1MSPKEbN5MhwtFqHHxFvH7YJmFeUanQAwlbdtdlShu
 ZYFVcC8tlp7e+MY1VxhjGq0VA7sNMgBXnPYp/FI0kvCYyh+c1gmJTh6O74OGASbUi+tnq
 gF21GqnE7T+fS3W6VPT+oID5LZ6tYaNEdut5XOect6ZAng+9E8+aN0k1F1g7dwfGRd9Hn
 YTRnPcOio0cNB1S8jQNhh6ljtsD2Z78oeHoTBbfgr/GdLyvcUB1sqbJU5n9iGmtMnGw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791045469;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=2nf3JT+JXxzDf5wDI6n+DEprSaN7KcCJsGfzhU//qtU=;
 b=od1bOe+qbzdJ9WvESOB9LyaeWWZDTI6Y3Fq1HdjAYSnGHSXXS9xS1EI27xjDsHOVCuEX
 dtABqCKTaUqGFx68IXYkcfZcmuGb+geosBxgygDni4cllo2OtckSQkn/M93+uNfi5u/+U
 1dPxWaJnZkRFx066QFCC4Ky1SJtCwC5kW8KCXyym7v6FbqNnRPHRO56e44MP0j+7iXOnd
 x5dTkHLVU2UEJgvQ2sbVaX0x7oTZOSxwRHlh3ZDvhxxtGha2k399kHmuJuuhJNrJJaVtt
 +RmlpjEuI/paZExShYqSj7ZOSyp63Fo7PAj4KBd76hWmwp3hXw1RmH3XWu3RaauouVA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E049380E35
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:37:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 19C8C8B505; Sat,  3 Oct 2026 16:36:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 18:37:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 079f168792e1520b615c64d436ed3bb100d9b6f5
X-Git-Newrev: 18f6446b4f29571c3cdd0c241baa975de011edce
X-Patchwork-Hint: ignore
Message-Id: <20261003163635.19C8C8B505@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libseccomp: security bump to
 version 2.6.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/18f6446b4f29571c3cdd0c241baa975de011edce
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The upstream changelog [1] lists three security fixes (without CVEs):

* Incorrect 64-bit comparison merge in libseccomp can weaken seccomp filters
  https://github.com/seccomp/libseccomp/security/advisories/GHSA-4q85-33p6-j5g6

* Oversized seccomp filters can trigger libseccomp double free
  https://github.com/seccomp/libseccomp/security/advisories/GHSA-46fr-jh49-xvhx

* Oversized seccomp filters can trigger libseccomp heap corruption
  https://github.com/seccomp/libseccomp/security/advisories/GHSA-2hqh-5c36-grrm

[1] https://github.com/seccomp/libseccomp/releases/tag/v2.6.1

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libseccomp/libseccomp.hash | 4 ++--
 package/libseccomp/libseccomp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libseccomp/libseccomp.hash b/package/libseccomp/libseccomp.hash
index aaadc8424e..58aee03e6c 100644
--- a/package/libseccomp/libseccomp.hash
+++ b/package/libseccomp/libseccomp.hash
@@ -1,4 +1,4 @@
-# From https://github.com/seccomp/libseccomp/releases/tag/v2.6.0 (PGP-signed checksum)
-sha256  83b6085232d1588c379dc9b9cae47bb37407cf262e6e74993c61ba72d2a784dc  libseccomp-2.6.0.tar.gz
+# From https://github.com/seccomp/libseccomp/releases/tag/v2.6.1 (PGP-signed checksum)
+sha256  501f66c667225d53791b97e1d7cf85ab764c297d04881f60f38f451c4b0ee1be  libseccomp-2.6.1.tar.gz
 # Locally calculated
 sha256  102900208eef27b766380135906d431dba87edaa7ec6aa72e6ebd3dd67f3a97b  LICENSE
diff --git a/package/libseccomp/libseccomp.mk b/package/libseccomp/libseccomp.mk
index 26585b1887..e1d1271d71 100644
--- a/package/libseccomp/libseccomp.mk
+++ b/package/libseccomp/libseccomp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSECCOMP_VERSION = 2.6.0
+LIBSECCOMP_VERSION = 2.6.1
 LIBSECCOMP_SITE = https://github.com/seccomp/libseccomp/releases/download/v$(LIBSECCOMP_VERSION)
 LIBSECCOMP_LICENSE = LGPL-2.1
 LIBSECCOMP_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
