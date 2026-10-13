Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D5BACC6B10
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 07:46:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0739C60751;
	Tue, 13 Oct 2026 07:46:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qum41eCtPkme; Tue, 13 Oct 2026 07:46:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E3FEA6077A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791877569;
	b=HDMm7pkMT000Cv+C7007Gyiqv4ids+b2S0oI7H+wi6xjvLGfsjzfDTPUztiZ5Yx345fh
	 7xiZXVDsXiEphAHAdPuKxgjBY348aSRtd4njvOCG8qwYbC51/OciGr/nQKrAFo8/Io/1q
	 jEnPxsFmEr0MxvXv5tWfIRU4p9R+LDzyk2nM4CTPTzM2bcRVGijSUDf8RnQtEo23DwlUe
	 Kw8lyIoN2hASNnH+xnxO7lKH60zVkU2YbYBWMGkq42zEKQ47rPglKtIXXshoID/4Wisof
	 cVT5AeXtge9LlBIkd/IvNs05gNfenPPb9IO4lSfRLCPZgd8+v0vAWhYjO5Nv+7uU+TA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791877569;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=zP5tXw93/qBMKs4bey0JyJEsKM/Q20Gs8p0lEvjSSGs=;
	b=PBLcF0eOYeQ8tTksPzT31AEE3iWKxMDLOf4n2zRPppEUqUe2iR1jbbqgTuK/GHcjojjw
	 0Ixne280ehud9vxWefT8nAt/7VAqgTr7C5KwSpEfanLzqKb/5xJ39u3IM09TJnJI514El
	 m2ZS8/Gub7+NRXoxwdVqPX7RpDgBkJzVnEf0vW3BeYq9BBtMqpI79zp9V/+37GIaK2sQ5
	 E3j1WVjWkr6QShvrTXPowWRtgZyIrtBrnE/al7GGb9hxJebkAWok14eOs05t7HwR/lg39
	 BW9daWO3O8oz0/BBqF2TshNRAPuiPRNZqB1xlyqoSKUVk9f9fOB8ys5jl7eg2W7SfJg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791877569;
	bh=zP5tXw93/qBMKs4bey0JyJEsKM/Q20Gs8p0lEvjSSGs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kJlxYxNjUJFcaePD+iWQ3uL9NoQGmnaegPKcOeEFewlhrL3KadwsBPTYIc+smeLor
	 4I0glK4l0sGLQXagesW54aGrJ1rUklngvG+YnN1YAbOlZZW1hg/AEs6TZcfgW9qGob
	 Q5hZfED5Vlm9nqVMMRQVtC0H57ZvB+/SWVWP9wCKmbOSUyNakqs2rgxPwiZ23vF5Yw
	 JHvkzEuxVHee6FJxXB7hDZgT2g6Vr3mNMz6sNzjV94BfG7Qzdh0cfDgvZUMdxXYy6r
	 /CtzLlB3sfPagkWr/u2D1EX1uwZpoEOV3iKWYRjr+xyi2lnZqGUGw5UFPxaT80vQWB
	 mJCsOIWFz416g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3FEA6077A;
	Tue, 13 Oct 2026 07:46:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C3161788
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 07:45:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B54134005F
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 07:45:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XJTXcPbP0_bL for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 07:45:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org B70E940258
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791877551;
 b=qu6Q1EwKHGWJOHxUwKfr8FoIYUM73//N0cTjhmtA6elwl5Non9KBrKVFfnllICaXBhvX
 C/H0Wqun0evU4gcuDhsCY67hG/THVzZCyVzoIZMLosWRzavSB+gfj3VVyQWi5jlh0NoMJ
 bLwThLq5O1/ytq1xY/CE28dAStDOuimaBebe+Rh71kznrD7x7pFlVNQGDAvOO7SdWvtJc
 ueAVlv9KH5qiNQi9bDvZy1ojQqgntJfNJNUh8kLdOfT3nax4DzysZyfyEnC4k0RStF1Iq
 bzBoAd1E7uGverlQbiHwsrWc2AeAq/W/XV5YFfjQfTP03AYLW4/vbwuw6WRbSiazjKw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791877551;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=kanP0FfQ/ErAeLdvE7EeWoirfM0+6MsOInmARhIJQYs=;
 b=hRfy3hi8t0a98cieyK/UmadZJrjGXa7NL24OVilAoBnP3ZxVTH5FQjWI6ked4wBNbTug
 lHZd4t5Y09uYy7/g7nSqeLTLpcwAmPdFioxoqDvL5zu/Cn+wYStEcHF7rnPmSALvfrSSN
 bGwcgbdwIrTGbf1IeRkWsylSPbGl0gVnDCNoEc/ePqch3b/XJIkNWvujvgf3TaAE/4byI
 gDDjxelc0PDp46UGwszFmoQNm/SOBgekG4DV/BRghfIJKeOxD7FOobbFDUF9wXbw3Uxay
 B5rcaIfcYGj24DavcetB3DC+UAFKtmQSBaceYw/6x+RgtHRVUz6svbVNZG5nxm8fvmQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B70E940258
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 07:45:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3C79895441; Tue, 13 Oct 2026 07:44:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 08:42:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a7ebcb62a7dba25139981f89c810479909941a2d
X-Git-Newrev: ae4d8b39b700e6275909ea2004e73faca0ed1dd6
X-Patchwork-Hint: ignore
Message-Id: <20261013074432.3C79895441@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-sys-mmap: bump to version 0.21
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ae4d8b39b700e6275909ea2004e73faca0ed1dd6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-sys-mmap/perl-sys-mmap.hash | 6 +++---
 package/perl-sys-mmap/perl-sys-mmap.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-sys-mmap/perl-sys-mmap.hash b/package/perl-sys-mmap/perl-sys-mmap.hash
index ac4184b08d..d389829837 100644
--- a/package/perl-sys-mmap/perl-sys-mmap.hash
+++ b/package/perl-sys-mmap/perl-sys-mmap.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  57172ce9b33c04de460b4e7ad68d2e9c  Sys-Mmap-0.20.tar.gz
-sha256  1820ce2c89f1ab7357644f8db0f49f142f54526250fb1e235db10aa80f15e2cf  Sys-Mmap-0.20.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  54b46bc153c3fd36dba79b7bab2502d8  Sys-Mmap-0.21.tar.gz
+sha256  fdec18081928b0b3ff688ec8b5d2d9bd1ffc81c2c3eb1fb3c1c56aac48a96f4c  Sys-Mmap-0.21.tar.gz
 
 # computed by scancpan
 sha256  4ac2afe465736476a06e52edcc78c72cfa0fa4d625916e58ab4f2af6c598709c  Artistic
diff --git a/package/perl-sys-mmap/perl-sys-mmap.mk b/package/perl-sys-mmap/perl-sys-mmap.mk
index 5e0814526a..5f22b9c8cd 100644
--- a/package/perl-sys-mmap/perl-sys-mmap.mk
+++ b/package/perl-sys-mmap/perl-sys-mmap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_SYS_MMAP_VERSION = 0.20
+PERL_SYS_MMAP_VERSION = 0.21
 PERL_SYS_MMAP_SOURCE = Sys-Mmap-$(PERL_SYS_MMAP_VERSION).tar.gz
 PERL_SYS_MMAP_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TODDR
 PERL_SYS_MMAP_LICENSE = Artistic or GPL-1.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
