Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E37B4C98321
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:59:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8266A41164;
	Thu, 24 Sep 2026 18:59:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WV88slIWzMBb; Thu, 24 Sep 2026 18:59:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 416814115B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276362;
	b=L81SooNtXmRxoQR2khqFVxWLcsAqgeiLjisXhGiytTqTRv0iAuH1ANMojCnDOccQoc9U
	 OR1N3EWHTQVAUwS1tBxo4SQd7j9sXsn2FaOanEsx/u00FoZF3/H+UUyzKWg2/fslyrwbp
	 Gft1vs3VTjGFxWNmg80iBBXHca+RLVGkI/zhTokXuP+V9UJWHAzB1k2abGcd1SK7z7mNf
	 tsFiOaGP5/MB9c/XnIxZW1Us935vqKfj7WzKmdsQZWttr+v4ezRm8NWouqLVLL/eziliv
	 kXfuHadfS0w/tgdwW8+HUdMD5WJh8gKr7h7M6Kj3yRoYSyvWrAQRX6vwRjHny9L1fpQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276362;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=9ybpABMh160c8ZK+oi9cCkjuLOyuPbae2tlgCf/m48w=;
	b=ME7YlrFJ3ITc62enuMrp+W/T5bhSlaHg1i54COuNnwbxEoAlE4fYhZAsFxOLVI45EA+H
	 0zCBVx5eqtyDh54UxqxfgIHr2vuMpW6vjg9eDx3rm+aBjm3O/ldfA99BT2RKPx0UpQ38v
	 Ka+E5MDNyG/A8ftUEHUd0P/2yW+VjS26OkG4q2QbUFdD2VDRKzK69nJzkYMY9zqvFF6Nk
	 +gwCeKneHYV3zIKPKE6cvoenbwC4Jqugpn7hjK6E2hUb2CcHeuK3MJg4LvdaLVzRb8cmh
	 d5SbEriAmPrLD8R3sKw3/Exs3zEeJR1jbl08p5eW4MEWi+gge2QldBwj3DfpQ87vqCA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276362;
	bh=9ybpABMh160c8ZK+oi9cCkjuLOyuPbae2tlgCf/m48w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VtFiMrVejHGK7iSLhkLLS66xqMrajD5+5+6wBjdnr76oEBzjSxuG7B+2IWv/kgeb2
	 yiu9Y7LDSqEXgpFJU8On0rCA0FPMGpFdqLq3eG78XzOzX6DARW50OKKpXK3kX77Uct
	 eGmRV93AVdsSnKPsqRShQIBOIbovX7ORo6AkYtNGfZcjLEd3HezfaAMVq6o3hKIQBx
	 7FtUN7muC1xjijlJ81Nty+3gCQLZZCK3RMN/v1awAyWTKOr6U3C0r0QTTtD43tSF/K
	 BPszrR/PVN4lJD9wLzxVYfkkC0VNcfOG34jdZq08RIHHFJWHlb2fQuG46AO6TPI7yQ
	 1iQn1pDiVQHNw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 416814115B;
	Thu, 24 Sep 2026 18:59:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E8737328
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF87B404CD
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Ifqhbga7ObL for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org E9ADA404C6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276213;
 b=LkoUvzVamITdQ5Acvbyebqgdx7/bAnwKT7SOiH4vzlOzHoIHVrYcf+KdzsemBv7hR4Gh
 zwM3H+ewWLQEl87OWRDzJEy4pw6PKxwZ4AvfUPEUwzMVrkyebMufdxA3vg2f9Yaoh2Z/l
 /lNK38kmrMer+laSl+qDPyCNs0rtqlLgMkhI+K2r8vDHp9VqQ7HOhCpvKNI+It3T2yDLG
 QAiZG6+SY/1ypRJdAMDKNlby92njEiU1Yxm6OjIo7c+6say6m8IurTpJEeAgg/A7QSqd9
 Y7w58R4UDRxIiKhUV2dr0xcAoal7RKIvtrYt2mfZN2Xpl9ReewGJd2mxfUhfaX+TP+A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276213;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=G0CkRZG+h2MUp7wXiT+XNTHGncqIi7t1DOIUtMjttjg=;
 b=IGtveep1QfbtchiX6E/07HkoKr2pf48ymtfv1SHFOSf4AuxwDlljHOTkidfpLeU29yDS
 MNqMag7TwGJMxksYDO6vOxXuIkjYvobU4RM0xbFho+iXiJUpt0pySBwowkD3VgPBSk7Cs
 mJyaNVSOTuPhOem3LWC9azgSThLvYycRhzQfPgfWFpvsD6MbPeM6SY06OS62rBilRob6m
 cHulEZFLjjLiKz9w5pkG/dvovf5lQP2/kQk5jctKaWNly82teAcgaPChPIjAVA1I6lzxz
 xGYGp3LmJJugCrgVnSNQ4Lz2tzeXtH5ipTq+XqEqIouppvrQsd7bLCdY4qAZf1kTdVA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E9ADA404C6
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8D999982D9; Thu, 24 Sep 2026 18:55:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:21:41 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 266957f4ba809df677b82c3ea0a33222a0521dca
X-Git-Newrev: 4a383ac0c2124d29440c21d4ad5b098e52131cd6
X-Patchwork-Hint: ignore
Message-Id: <20260924185542.8D999982D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/cannelloni:
 security bump to version 2.1.2
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
Content-Type: multipart/mixed; boundary="===============8845062090051212760=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8845062090051212760==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4a383ac0c2124d29440c21d4ad5b098e52131cd6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

For change log, see:

https://github.com/mguentner/cannelloni/releases/tag/v2.0.1
https://github.com/mguentner/cannelloni/releases/tag/v2.1.0
https://github.com/mguentner/cannelloni/releases/tag/v2.1.1
https://github.com/mguentner/cannelloni/releases/tag/v2.1.2

2.1.2 fixes CVE-2026-37539 (CVSS 3.1 score 9.8, CWE-121): a stack based
buffer overflow in CAN frame parsing, in parseCANFrame() in parser.cpp
and decodeFrame() in decoder.cpp, allowing remote attackers to cause a
denial of service (crash) or possibly execute arbitrary code via
crafted CAN FD frames.

The advisory names v2.0.0 explicitly, so the version used so far is
affected. The CVE is not reported by
https://security.buildroot.org/master/component/cannelloni because its
NVD entry has no CPE data (vendor and product are both "n/a") and can
therefore not be matched against the package version.

Apart from the security fix, 2.0.0..2.1.2 contains only a handful of
changes: undeliverable frames are dropped after a timeout on a broken
CAN bus, variable length arrays are gone, the default remote address is
fixed, and pthreads are looked up with the CMake module instead of by
hand. 2.1.1 is a maintenance release only, as the 2.1.0 tag pointed to
a commit that was not the final one.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 4dc8e8b6f927bcfd11302a3cee68ea958cc266dc)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/cannelloni/cannelloni.hash | 2 +-
 package/cannelloni/cannelloni.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cannelloni/cannelloni.hash b/package/cannelloni/cannelloni.hash
index 625e43d157..6b45d497e4 100644
--- a/package/cannelloni/cannelloni.hash
+++ b/package/cannelloni/cannelloni.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  3dde63727549d4a39154e78b95f4a5dad96af236ca6cef531f347c0b923c74d5  cannelloni-2.0.0.tar.gz
+sha256  c704707f7dd9f1ed64e9195097809f8882c03b1fa0a79864b8e3bf286521e3d7  cannelloni-2.1.2.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  gpl-2.0.txt
diff --git a/package/cannelloni/cannelloni.mk b/package/cannelloni/cannelloni.mk
index 7978cfccf5..2e6a61545e 100644
--- a/package/cannelloni/cannelloni.mk
+++ b/package/cannelloni/cannelloni.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CANNELLONI_VERSION = 2.0.0
+CANNELLONI_VERSION = 2.1.2
 CANNELLONI_SITE = $(call github,mguentner,cannelloni,v$(CANNELLONI_VERSION))
 CANNELLONI_LICENSE = GPL-2.0
 CANNELLONI_LICENSE_FILES = gpl-2.0.txt

--===============8845062090051212760==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8845062090051212760==--
