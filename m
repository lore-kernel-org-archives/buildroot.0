Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC028C98321
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:58:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97FCE8134B;
	Thu, 24 Sep 2026 18:58:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h0_3sF-00FRf; Thu, 24 Sep 2026 18:58:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 9D9D9812FA
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276313;
	b=kixq6Xbrlj6moPKaxstpQt5rm/xLDVfdWwM7DDzB0+lQH3IBAae6nEkJc8TQSW0ZTJHn
	 8zki0zkWN93aUHfx216xDF/GjWDr+SAnMfL8kEmkyeKux//7IhVF9N1rq258hdFSJAZiq
	 /c3H8bQSX5pnrju+sk3kdDQtF2t6U4Bz6WbQyRvrBpR5BrRun0EqPqg6jlDTcClMIBxwW
	 m3zMyTcwMlhPxes8M+4qhdm5t8tLrSXCtrdFDDoJXL0DPl2w/FwauM9gP85340csxoqVh
	 QlypzmNr4TCWtIOOS6hyvxWt8WBa7UOlMpejYcU1neRHNQ04got+3pnFUgS8/2JSRhQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276313;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=8hS4sFGcXkoBggPOBemTrmVIwcxD+vqwdI9nPSjerMY=;
	b=MpYhJbPBDlL1teNHEQpO8GJXUk4TFouTmNue5ejsKHYV4K0m/zKN8hCtDXfBOoC2XQJI
	 cn5KWtFoI9j4yWJCbaMVaENo+oqska8fFshLQ2wTmVmlgmCKRlgg4wBY1ZhZW9qHv9zQu
	 +iA7UneNXKOoPOcf286Tv5H/04ZCxhFFZNKBYXG6D6XYKhycRK1ntqZR0lZJsYcv2aeHj
	 ZwsAgoJqiD9UWAwqlMkVdLbtnu4OJuz4IfRGX3LK9Dd2ArrAODP03QFmQWwPs1tTAz/4d
	 yVVqbPI9yMfllNdGUpd4w0HHQ7G4O4LvcItzMYydXlks0xpPY6b0liuQhPkgELoRprw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276313;
	bh=8hS4sFGcXkoBggPOBemTrmVIwcxD+vqwdI9nPSjerMY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QFnjX7GGCovT11HJtVezUivwxc3ZP3Oe6mDoODEikDA6xFIiHbHUTKCJkIt0b9d5E
	 N6sPXc3sYfN5t1/yOMmcrPfSh6p0hvX7T9Qv00yD0NJP4Iham8HSsUne4qmCz1WrTK
	 ClU8gmoibpUzFDIc3sod2TtZebA3mcWocYYk+bdVYBBGulQ5rvvb7dDHm2A/G+UeIR
	 t9h+BG4x435haAtu6wUq4LCljh4RO/lDGKw0HkEx+ZPyLSPRjmY3bF0BWM+99Hz9hH
	 YV0JsK3ow5x2QVmwNqZEAeJa6hAamv7s4IZbtPRagX5tIvODZ3EfklRdXKMDayOavw
	 qKtJu0uXadf/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D9D9812FA;
	Thu, 24 Sep 2026 18:58:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 78E50332
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5EB50404C3
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aPUUMcv-NGTR for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 4D5D94017A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276210;
 b=sxZiKeVFcKZxrUhbDx7XbCy25dkWZmCvjeqQCkUOyNmr54yQeNRARw2eQvieg7ttzcF4
 yi68Uor8MiCEN1wDuoiF/zIZT3yzoB389esaAi0wLw9jTUBXk4xfKxYmou44bVhoekVJS
 T50InQqq6WphQgoJuguwLp54Da9DFQHb0x+E55B8WqnQQ9E5fAaSsSUIrBoYlacBtwxBW
 VDjjPbGMY4X9ZVN7K2b++1Pw2DD7AdaSurfhAaZeGuXXhhF1AfzTXKQRC4JMtVBHL99fg
 h4sklruFs1hkXd0gSxDpGVUz7mhkjwv4ZIDuYQzW7rb2rXY6rRntQ/WuCh+7t0e3o6A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276210;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=jUnkI0VDyTMhq66ZxIR3TfP9FEKq/R/7K27nSu+K+Mo=;
 b=P+GIlCn2xRPUzqDYU4rqdY//Mvzu3NVzHg5CZVPONvxTGSZYSeUWxTwAH8JqmeTQtHQc
 2u3JalvpM7n85IGTneoJuKtJpMzbMgG+oVc0GqLEYMGpSTm1bAz3xNwszESG2OFRT1kdC
 c/HVZTJHIBb4H07relCaxv+onu99gUDKbfT1VEgqOCLjahFZKBRHTvfYVpVYfB50zJjBA
 qXWc3f3ylIze93DFdpBk6Z5r/DFeKWSRHUkND/58plQQ8EwcozBbPEDn2VrvLeFeJxQdt
 fMlDg/N/ykJUJK8KE8KqVjVSnNl273tKes78uzS2yYnKMvP44HWQA7UYg9YvoNdYb4Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D5D94017A
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D780C9835A; Thu, 24 Sep 2026 18:55:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 16:57:26 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: f8c4315d4cd5e3e58b959728b278d61715744da2
X-Git-Newrev: e12ef9c6524d0e9bd0f26458603820be5dd21439
X-Patchwork-Hint: ignore
Message-Id: <20260924185539.D780C9835A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/lldpd: security
 bump to version 1.0.22
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
Content-Type: multipart/mixed; boundary="===============3545668597978448023=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3545668597978448023==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e12ef9c6524d0e9bd0f26458603820be5dd21439
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

https://github.com/lldpd/lldpd/releases/tag/1.0.22
https://github.com/lldpd/lldpd/releases/tag/1.0.21

Fixes CVE-2026-46433, an out-of-bound read access when removing the
VLAN tag.  1.0.21 fixes path traversal vulnerabilities and arbitrary
file deletion in the privileged process.

GPG signature verified with key AEF2348766F371C689A7360095A42FE8353525F9,
LICENSE hash unchanged.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 03e4bebcd21a8d25c68f1b225498de5db10d8edc)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/lldpd/lldpd.hash | 6 +++---
 package/lldpd/lldpd.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/lldpd/lldpd.hash b/package/lldpd/lldpd.hash
index f3cefe7b73..46f2b9b476 100644
--- a/package/lldpd/lldpd.hash
+++ b/package/lldpd/lldpd.hash
@@ -1,6 +1,6 @@
 # Locally computed after checking gpg key
-# https://media.luffy.cx/files/lldpd/lldpd-1.0.20.tar.gz.gpg
+# https://media.luffy.cx/files/lldpd/lldpd-1.0.22.tar.gz.gpg
 # using key AEF2348766F371C689A7360095A42FE8353525F9
-# gpg --verify lldpd-1.0.20.tar.gz.gpg lldpd-1.0.20.tar.gz
-sha256  61b8cb22d4879e68f7825a2fb8e1e92abb4aba4773977cf0258bc32ed9f55450  lldpd-1.0.20.tar.gz
+# gpg --verify lldpd-1.0.22.tar.gz.gpg lldpd-1.0.22.tar.gz
+sha256  9587940ed2314a86774c5499f3dfb13a8eb86232a62d243a83a1f09886848e03  lldpd-1.0.22.tar.gz
 sha256  0e96a5aea65f16e2239231ce4ab90497f8bc3bb8fe6abe9299aade4726ff7c8d  LICENSE
diff --git a/package/lldpd/lldpd.mk b/package/lldpd/lldpd.mk
index a3015e9e7d..f0cbc7e436 100644
--- a/package/lldpd/lldpd.mk
+++ b/package/lldpd/lldpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LLDPD_VERSION = 1.0.20
+LLDPD_VERSION = 1.0.22
 LLDPD_SITE = https://media.luffy.cx/files/lldpd
 LLDPD_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_CHECK),check) \

--===============3545668597978448023==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3545668597978448023==--
