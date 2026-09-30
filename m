Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB5FCA5FCB
	for <buildroot@archiver.kernel.org>; Thu,  1 Oct 2026 14:22:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B54560D68;
	Thu,  1 Oct 2026 14:22:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8VbGnk1XQvOK; Thu,  1 Oct 2026 14:22:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E2CFE60D71
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790864572;
	b=RKA9g6ItVg1PC5lkBoXXBF1oc8G4sVMFt/acv0O/WOdz/5mln5fP/ZrIdKi9e1WkysAk
	 1keFjbV3C3doengqmMhPYoaonBNeFHsJ+u1mHxbekO0U9mZ2UpLqQYddU5thor4oux2eT
	 dLcFjSuTwK4DG5h/PZsyHbLHO3UhCS6HmvEFn66fIpcfJbmk1P1+k/erX4pJUl1qvqSH1
	 Fbi6zX7xdsajnf75Pn8Y+8P4Bz3ZBJWDDEvZTlCoMn9rN30OMTxEupgyPjQFwsCOy8xxW
	 wwRfV+E9a15+hfipefRUrKre7p49UhRHwRCZOlo1f/k7HJ+m+2KiswDL3enl7lWrVTA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790864572;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=SUtFKTnrgnbPe3QEmSkyZka9SmypGA2fGng3+8niMUM=;
	b=UPCKkBPOGll1lZfbbfZODqBkqa13m+7CldbKSOqh9oRAAuthQAcTWVjZyL6BqgcqXLEr
	 82MiTPVct9UWEPXrjyjOilzgYFgaE0REoyuneWfijD2vZRbhKEBEecGFEJNun3SDcx4y7
	 s52YTfdXM/oenkzeSDbNis+wUCY4b+fKo5aXihzzELmBMHfuFyl14SFR8YWiEVEhrCcpt
	 kPnJzIYdO4UpuqF5J5mvC21zbWWnJHPyaqBAfNWbGveIgDi7WAfw19vnGihpj10NfHyUL
	 hFneZo9s0RKrR6zXiIR4zPKt4BBTVw8npLYNEGiBeE14sxmY/CyXpw+lwBzAYSyV6Qw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790864572;
	bh=SUtFKTnrgnbPe3QEmSkyZka9SmypGA2fGng3+8niMUM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=b+ZnB4qxz2YH7X1lOkZDSwSitLtmkrjk1UU51l9aH2uqyF5aFGx0U7UWZAl2f8ROz
	 l+BZsItCvFlQN3U4NBMhnsq93C6LW80vOEwJyR9jEoIbfILBFFI6AsitY6GPEw/rHD
	 nSzbWWdG2dVpEUdDJ+IdJy4xwQOHvB3jdzbS81HytAFN+QdU1PEZ9YPCM9Y8KME1IT
	 bIZHv3JLF3ZhiQPQO6L7k96OgkKneJEdILiPm+cCN5v7Fj2BAaG/LOYNt1ZzQ8FypA
	 k7MQk64DXxMALkXd/5+xTKBGJgZamL3XfLxHxk3oQAyowY61wotiRT6Xh1Sr/PvmEX
	 WT2OMxTbKQD+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2CFE60D71;
	Thu,  1 Oct 2026 14:22:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B9B231FE5
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB5AF80F56
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pbs99xGpDvu8 for <buildroot@buildroot.org>;
 Thu,  1 Oct 2026 14:22:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org A4C3C80DF4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790864560;
 b=E92ulSSRK5eDYPYzqOV+3WVTq2K4i5jeM8TPPwcEbofoylp+K+VWiLCb1m9rUHRhdZLm
 +ZVtqRDkXI2sDmmvvDexpiCnaVoeIV7Plcn7gfN1g/xZrcubvPyjs+xkqOWeiQhI6mjGb
 z3JK/JNWffe6eIKrqquAMpzWWaeWCV1HlbSiy5q13f7mA1dWoXXYKWDF6H5J+6Z4wyPf8
 wS2lENJ7hUBABYM6VqMlCldNnjeUqdB9DSL7MRp+Mbp1mqmzgzZnurqCwwWDM3RMTdNOc
 o5sZ1TlcEeCqNmkCgxt4s/AyNAGVwTBYoeD6/uMrmZxRSV3FcKNRVLzCxfVswPLkENQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790864560;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=gxfi6GDOMG+A9PPAnCvXelokxcI+lkX8WGHbgK+vJFs=;
 b=qIGKxsKTOe1qWpQM5EnHc3Pp+vR2GVhKbg/G82J0oJJbys/RNyKUZlKiMp/iz+RpAU8G
 uWf82OOPbjJeFho/QNuKNmfbHLUdYCTHIEq9jDxPGLg7+v3bev9Z6tEv/cnn6skj18f6z
 CDRgiGTyQMUipX3VuyS50iG8ANge164kFHhJA+K2hIPwXsq4Dbm3sBTGmiFoW7X8OFApF
 uw0jPwJM1jJVApQwrgL3gsMYvW8J9qQcxC2ZCWwX6i0tSLN2xZG69zC96Ujspv3vCyT0n
 TFD/z6y+Isd546VD3nV/d3DOXsh7x9oOJpWHPObJfH9COxQxPlINBD666RRiZziOqrA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A4C3C80DF4
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EC5669843D; Thu,  1 Oct 2026 14:21:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 30 Sep 2026 16:08:47 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 9efe87bc7d74b088816b8cc44a56d8d182e1a53b
X-Git-Newrev: 7d178d679d2e6af3a9878a45d796a801f6d33733
X-Patchwork-Hint: ignore
Message-Id: <20261001142126.EC5669843D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/bubblewrap:
 security bump to version 0.13.0
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
Content-Type: multipart/mixed; boundary="===============4439858624245514964=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4439858624245514964==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7d178d679d2e6af3a9878a45d796a801f6d33733
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

While there are no CVEs for this Bubblewrap release, it includes a fix
to ensure that arguments that receive a path are not empty (which before
treated those as the root directory: a bit of a footgun!), and that is a
follow-up to the security fixes included in 0.12.0.

Additionally, it patches a number of build failures, which fixes e.g.:

  https://autobuild.buildroot.org/results/2eb2d222daaadc2eb16b42fa2ec102ab0689f038
  https://autobuild.buildroot.org/results/674413f089ce9b80a59058674b3ef6879e1d389c

Release notes:

  https://github.com/containers/bubblewrap/releases/tag/v0.13.0

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 0867818a73dd5884898be9bb226062ffe7c45dfe)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/bubblewrap/bubblewrap.hash | 4 ++--
 package/bubblewrap/bubblewrap.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bubblewrap/bubblewrap.hash b/package/bubblewrap/bubblewrap.hash
index e150e1495d..43b22dcb5e 100644
--- a/package/bubblewrap/bubblewrap.hash
+++ b/package/bubblewrap/bubblewrap.hash
@@ -1,5 +1,5 @@
-# From https://github.com/containers/bubblewrap/releases/download/v0.12.0/bubblewrap-0.12.0.tar.xz.sha256sum
-sha256  9760d007363e3abba7c747489910f9f82d9fca53ba3bd3282e396fa3c97a3314  bubblewrap-0.12.0.tar.xz
+# From https://github.com/containers/bubblewrap/releases/tag/v0.13.0
+sha256  4734237473c0e5d695e4e9034a34e43b2dbf5164655bd13fa59ae376b2b7a765  bubblewrap-0.13.0.tar.xz
 
 # Hash for license files:
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/bubblewrap/bubblewrap.mk b/package/bubblewrap/bubblewrap.mk
index cb31406c8f..dcc3c23d7c 100644
--- a/package/bubblewrap/bubblewrap.mk
+++ b/package/bubblewrap/bubblewrap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BUBBLEWRAP_VERSION = 0.12.0
+BUBBLEWRAP_VERSION = 0.13.0
 BUBBLEWRAP_SITE = https://github.com/containers/bubblewrap/releases/download/v$(BUBBLEWRAP_VERSION)
 BUBBLEWRAP_SOURCE = bubblewrap-$(BUBBLEWRAP_VERSION).tar.xz
 BUBBLEWRAP_DEPENDENCIES = host-pkgconf libcap

--===============4439858624245514964==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4439858624245514964==--
