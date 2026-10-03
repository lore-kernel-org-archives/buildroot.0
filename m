Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E4CCA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 11:04:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDFC560E8A;
	Sat,  3 Oct 2026 11:04:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XdOgjGtxprCp; Sat,  3 Oct 2026 11:04:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org EA67860DE6
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791025472;
	b=BDSXJ8X1Qg/cJyjPN/J8VHgW1IXCbIFEp6WE+jixOZT8j9cqj2aSgni0uHokas+4P0tG
	 Yx0llIqqB+cXKePmAjwTPY9HJ6xOijln3Jl6dBXnyqiZVMJkaJMOoHm1P5sP9/v6KdqVe
	 aRou53v+gBd83SxfIkG7dxt9Djc8c0S0TiiKSdrTBlpK+T2OoZl5W02bhVlt2pw4z2cJK
	 qziIJFsYX/R7XVW+wNAQItz2wsbKU1iCjCGWaQ32ZBhb0EsPAokwI+B5mfrJhCOxyykD1
	 Ct4TFOGvwclJ2GXDzden6wA3QFfS1yJeF4SeMd7p+M21rXdeJMXRWWZHIkSNT/ijmWg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791025472;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=zRs3vmIRdzHZ5qPA6Y1+zTnHf4880WedtA9qsDZurP4=;
	b=MEKYM411R07t89/nmuih2zXn0Uajuefn9nIgUHSQrXgdZbaaXq5CF+LXTFQ0U2D0RqZE
	 +1bNGctaILqZVV58uSnnA4HRaaaddTVeZlJV7/2R+7ldfA1pKEABjTIzAY+PlkPzgE/kB
	 s6ODkxjhJKNpdSD15NEILwv+4cVoN4b8X6XXcv1AiDyRXbe/vFOEEhuAQLKNfVr4oYppN
	 5FEnbcNspu53W2yUfgMUt3nF9EhD1F0g9cKxMb1ZxGibPlFBnibzGtxFgCAVYCZ3NJ9cK
	 7kfYFeBzo1SrB0z8hOX6wSWMEEo/xXeI80DzxaAyKfjj0g5zmbc6HM4EbLe/J9UYimA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791025472;
	bh=zRs3vmIRdzHZ5qPA6Y1+zTnHf4880WedtA9qsDZurP4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FxfiY7gJTtclM44VeyNpvS6LxKmSaW4QQTtTL2rYodcQumkHLVuGUrZVXUHR6C+yq
	 IdEpT/X716xEe84i+9VxB5pDbVHaWaVg3roM4ZnwEGTMHk7Yw/vdBpVfVjCMjfWQIn
	 PyRGbKANrjUEQJQ6t0VZZnzCxlMch6T2vVW0cRbIAsGlwHmwOIPqDcAfz9IgU4U/E8
	 fMOLoVDLelvnkK7mWIvRZ8edq3tRCjRSQJd0NqqlmmY3rZpKJxhGaexns+z9dFEsyQ
	 XHXy6RUroLkfuGFFUCiqY5snm2hiUWZKo+bvTrvdLCOAoa/uISGDufJDd5aYg4z5gz
	 YG6ha4UcgJDpA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA67860DE6;
	Sat,  3 Oct 2026 11:04:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BA6D2335
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 11:04:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B625960DE6
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 11:04:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c3bM8NF8O2A0 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 11:04:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 564A360642
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791025468;
 b=bdeSEmDvB6WSkWX6b/YuUdq0uaCmCpKfmxArp20S/fwDGr8VINQsoY2gXbd9pp961eiz
 lNNmjDeSOepEQdtrOhTEdE77D3WJKE7/RRDp7OgxnyWeptuKEe+EUxS538Qf22t0vPRKw
 JYHNvGDvIQC0PLntzPFxl8IU9OPoqIaLnJiUdoCr/dAbZyP2m8wr8YLXsayiCrXbajFhB
 oGWjSxajgMuUHE6yNHT+TfBwpE7A9UVDxVj0+M6srcJvFgG2qjMpD0YvZ266RkuneXBgv
 BXB1V4VcPoMZrUphPdmq8zXI/EtcTXURlQNmpV9wmf2lf1s5h8lUI/E4aVV4PMCdtag==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791025468;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=YWSghzTm6HnxSuZuNb5TZuSoxnEhjWqWMnRE34g/0vM=;
 b=JwAENLy5HQzyHiekMN1OqlSfbJvV7NMl3hi8T5Hgb08cPBgk+8tQAX9kjBeOxnwOPx3p
 BxQGgos/974PvXC+GRlbrPMODBtDPEc1gASaeRZ5d1HlLzXOQ4p16heNSNucrLdJMJtQh
 vUvMPcE+bqFaG7xQfTK1OF2u6KqdfI2fo/WrtM/3yn2qqE0c33KiAcEDApV91+OLpH0t6
 Iy21BLQBVUpbXx2JmJkE7DpWgF61ox4bvtzrqNhgw/Ghln2vbgA07iOKIOe5XsprXTyix
 Gj+ofpZZJZ2+TM991ry4eC9q5ceXL9YBQ6QbjobPy02QbmaAzCjw4QFOmI0t/yZ7RFA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 564A360642
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 11:04:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A73A388F7C; Sat,  3 Oct 2026 11:03:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 12:36:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d50fadcaeed45cbbf40fdecf82901dbb938403bd
X-Git-Newrev: e72d189aa0921622ff1c708ccd451aa9831fa56f
X-Patchwork-Hint: ignore
Message-Id: <20261003110311.A73A388F7C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-gobject: bump to version
 3.58.0
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e72d189aa0921622ff1c708ccd451aa9831fa56f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/python-gobject/python-gobject.hash | 4 ++--
 package/python-gobject/python-gobject.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-gobject/python-gobject.hash b/package/python-gobject/python-gobject.hash
index 6b26e289e7..755b51bb32 100644
--- a/package/python-gobject/python-gobject.hash
+++ b/package/python-gobject/python-gobject.hash
@@ -1,3 +1,3 @@
-# from https://download.gnome.org/sources/pygobject/3.56/pygobject-3.56.3.sha256sum
-sha256  12760e4a0e3d04b6eb95e06f7a27e362c826d567ea613373a92c003b6c70d2d6  pygobject-3.56.3.tar.gz
+# from https://download.gnome.org/sources/pygobject/3.58/pygobject-3.58.0.sha256sum
+sha256  45068697de3ffe46840ca369705f23118b34db4f7deb63f6eff079a6734ddcca  pygobject-3.58.0.tar.gz
 sha256  f4cac31434b287b10a70b81c62cfa973d250417f8f248c4c1b5566d061ecfb2f  COPYING
diff --git a/package/python-gobject/python-gobject.mk b/package/python-gobject/python-gobject.mk
index 310cde24a7..f15129a076 100644
--- a/package/python-gobject/python-gobject.mk
+++ b/package/python-gobject/python-gobject.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_GOBJECT_VERSION_MAJOR = 3.56
-PYTHON_GOBJECT_VERSION = $(PYTHON_GOBJECT_VERSION_MAJOR).3
+PYTHON_GOBJECT_VERSION_MAJOR = 3.58
+PYTHON_GOBJECT_VERSION = $(PYTHON_GOBJECT_VERSION_MAJOR).0
 PYTHON_GOBJECT_SOURCE = pygobject-$(PYTHON_GOBJECT_VERSION).tar.gz
 PYTHON_GOBJECT_SITE = https://download.gnome.org/sources/pygobject/$(PYTHON_GOBJECT_VERSION_MAJOR)
 PYTHON_GOBJECT_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
