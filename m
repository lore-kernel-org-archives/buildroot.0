Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAF40CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:22:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80ED560670;
	Sat, 10 Oct 2026 09:22:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1rWp_eWjTVcO; Sat, 10 Oct 2026 09:22:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 579846066F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624135;
	b=Jr8rSk1qp3Cpi0LXyRQlj6k8n88cPvwvSTXD3ucslJNl/9yhxhoeWMhP74/G0JpT7J72
	 1LEWUhB2iNaDC6NOtzx2gyUD9nlFHaK7R/0lQ/G/Qzoh2W3mAqX/qOCejatWdO87PlAzQ
	 53MqnXheJoPKnRbNIcsSoHdd3OlMlzSISsn2koeQH/B7ORU3dLsi4j/Qhac3SnhU0MDMJ
	 A0bf6ODZAWhtGMBr76ahjkzdJl6hjINcAx7w6BeI1giCOsfuBmIVPS51V4YvW62SNHNOT
	 vkoOHyZd55c9zny8yZrAVHsr0vuJzRS0TPZOPOUA+VPl8PlYQqFpswp+bgLbJEOiT9w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624135;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=WD1oz/wgABRoRC8N10/RBzvJeW/TI76twVXRWdDUbYc=;
	b=s1apIwUn6FsAJszRFTocrusFytHXbWimzTGd+dSWWfqg97GtzOiSFVZLAlkzE7XNiySv
	 AKjUlRmGo840nRpr/bo10fsqjT7oHgojdAhVUN2xKcUzgH0hsxYqnkE36lY2cmLNVGOIJ
	 rjF+hLtHHLBtkygQzzeq0bX8PJ0LxBog9jp6qm/cV7x3FnrpYrsnfOg7AtUIK9tJyZI1z
	 mmXELBLBFofr33rYGYalqlzZPCuAYEGbu2suPsD35IvjRdE7sKOjYob6U2KAwHFX2mMBM
	 zYLEJXbHiiVhGj2dA2Z94EV2/SSNM3pFbtFIVkSS3bXEbxyQixbslmrH3vLBGn1GV9g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624135;
	bh=WD1oz/wgABRoRC8N10/RBzvJeW/TI76twVXRWdDUbYc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hDp2q9NLHOR48LlIRpLgVhPjuAzqzRcLQ+zSC7ddie1aQl7l++qBhzv8eFi49PJ0Q
	 2k7/uNIVvMFlFNU2J787bHF7+ipIuyy1JlueVApDsOTUY0p4YVOUCG7QThGlsiUK1i
	 +LOxha3NM2LvX035fRGVKx3mMgKEVHuz5OAM9TNhBrcrdMrCgaiwmpAlaMbMuUnxcX
	 zRxP6f6jYAT+N98OedAOT4TmN8vnYQQG28R1wE6bP0ZtBnJRlMrMNBezUjH+Z5YJ7c
	 zBLPDGpda1tE94pPJTPCNvN76RqDfTG17SMAorNpvymS9oXL84p4bsmc1br2sdtJb/
	 7/ABO5b5c6/8A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 579846066F;
	Sat, 10 Oct 2026 09:22:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 89F9DA64
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7BDDB812B1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w_c0nvgFbwjF for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:21:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A014D81299
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624087;
 b=rhMgKZVjNgkec+B2zXoBkMf/3VO09Ll+CAshfOBdtReKcXA4Pb02uDYmVjnha/5kL9ul
 JCepkz9OWLBm93WR26ij3GAf3+R/Bw4C0ln1LNJ+3O+tOvuhJGbgWLA7MXPdsrXbdRdFa
 VfxLAUpNqI+bKEJFYhVjIbCkIJxVZsRx2cLdn90KXQrB0xBp/xA6dJooDVq3AsVpv6Oow
 /LfhjJMSmLN48JGtJ9sJMDoyTOck4zO6ejDfx2xawjPdBRbcnaF1eTRtlrBgaqfwt+goq
 yrdl/FdIomnUspC+D49hjpTyVOugyPVpY+qW1BSya0IiaX/PiJ229IOcXqgzzzXczHw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624087;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=DSdu/xMWHJq7ZxW8lLeM/vEbR1YUvN6c5cq1g36l+b8=;
 b=rIURJh7rJiiUn01N2bZIHPzWJ8kayw+DSYbDB01jeaho3yHTQY49E/oKpOt8ieoODdh1
 RlgOzQ/sAF33/a/qFApRR24RXC4YPF1Vk+Fp2ECIXLS1AMGQL9u4iTWlCiZW8I9V1VYPL
 e4qFhavo8rgQays9dons0AH4HZO6IUJNXYnoXh/oTkW1V962kO75G8jP7PXVLAseviguA
 cr24Xxjhz8nBEpE+CYR/sRb3H4e2g5v0l1+nEePXrmQn/E3uMv0pWjWHnwW6s6r+E6mfZ
 bEkQjrU/lDOG22GOWNk18ly7C0vvlqbSmfmJKi1SImMecvsBrrdXdLSHkbwgHYSUfsw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A014D81299
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 89FAC8F0B1; Sat, 10 Oct 2026 09:20:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 12:27:51 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: c58a9d0abe550adc8157e1d396d1c2c6f3329b14
X-Git-Newrev: 240b30a2a56dd91538ce88b2cf21624ebe107077
X-Patchwork-Hint: ignore
Message-Id: <20261010092009.89FAC8F0B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/libseccomp:
 security bump to version 2.6.1
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
Content-Type: multipart/mixed; boundary="===============8689558165683471605=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8689558165683471605==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/240b30a2a56dd91538ce88b2cf21624ebe107077
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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
(cherry picked from commit 18f6446b4f29571c3cdd0c241baa975de011edce)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
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

--===============8689558165683471605==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8689558165683471605==--
