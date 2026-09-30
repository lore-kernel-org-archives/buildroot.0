Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A658CA5FD4
	for <buildroot@archiver.kernel.org>; Thu,  1 Oct 2026 14:23:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4B2560DFB;
	Thu,  1 Oct 2026 14:23:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rYumJaQcVK5T; Thu,  1 Oct 2026 14:23:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org EB85460DA2
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790864628;
	b=jWVd9HdaxA/ugPS6ke55BsmYbFDZP/Z+hH5SDZt7WwCvtGLU8plR+1u6ecBiuJBN+fuh
	 erw9WwzBUkL3Yv+NOUY4EHmS+HCs0HTSgegPi25Z/NL8b5q6Y7l5oCfNQ3T/FPiKGCOTR
	 prl8nQ9bhTCAVi3rjLCGXBqqUMOHj6kNoWDJvnICUNO+ClGFINscYaHBqilDi6i+/abai
	 0kfVbT5HGwQEGjICO0VZQKQy74x2mDKbozn2gG99Se2xaAQw4nc/rRnCBD9qaH/XUo8RR
	 AVhvbcSWkqsrO2mjOBun4A8G8iwSyWYDOQSHrpR6MHTIvCmYd/NFf4HPgJBeYwkcDow==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790864628;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=eVno5MuEfrreq6vxDYgPMMk4r0YsuVX+Sg73mJ27VTw=;
	b=dkxJ5ggYu4CU1y7mJasEoAkeoLMPd+QralaMWJfuxdpHTCyDQcCupYnHrDaaSXpsBCah
	 ceLs0Vr3Ekib2N4graGcGYtyymv6jmpqxPnIEMNGBfFC/Qh+Fds5KuUa3PlN8Yp0X022u
	 ML0b4aPEh9+9RuVSslbPbj94KabT3tp121sEqF1O0iCHWa0X4/WBK0u/BLFA0qAyWVUzg
	 KsNRVPviREal7XYBH870IKw0Bp7lgu2B2A6yE6f5GPHDwLfO1Du2FXIUbjY4ApuBaIpId
	 BZgnqhfYMgs497vIclJBiO+MngsZFtRmX+HTm7JYDmvvgFUsqh87ERUhLnGjMgGO/lA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790864628;
	bh=eVno5MuEfrreq6vxDYgPMMk4r0YsuVX+Sg73mJ27VTw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lBW7NMQ76Hmsxmqsi04+dEz3GeV87T1G+lYIcU0HcFxgFZbm7SmLJTO3pKrgXxXNE
	 cI2gOMbE8c+RWmwsPwE+gjjw9avIStxTJxboDEid3y5VULU3ZzA1NGR7eWfmuTVi5d
	 cojZnm78jWKnQyPdz5/sCnXhbEOQCsrJyXtCrVkajpo2EXcqAJjMtG2dN9dDkA6QVx
	 xYVGxfY+EZLvgYTk+Xx405duvtJtymRoHSFUyvP7rwlU8OfGnNfjA6WZm+beyegRn5
	 N8DWzsLQEnU3YNwuH3c2jvu35JpUyLgGLm6SnIK5qqEQ3zqE6HNKARAkEBlSWhF6qR
	 rkvdjbDOU114A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB85460DA2;
	Thu,  1 Oct 2026 14:23:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2293D116C
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 032F340098
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jxxtCZv8A3iV for <buildroot@buildroot.org>;
 Thu,  1 Oct 2026 14:22:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 29A374052E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790864563;
 b=gysWaCLkClfTPvj+Z6DhwG2PngRCXRL6k3GC7CqTD5LNpYEhWdZPWF50JPNdRHuRFrd2
 3t63Hc02P6OREU0En3joVcy/PdcNvIeFLij9EsofUNoGwHvDlF88dCbGftAsw0P0U1fWG
 cJiea+gpQck4RgEDp/dHE3nVeKJ1W3khY6Q1fYJQNDdmsZc/mXIRxd+BGtpvSiR4oTdEl
 UaGMAuzg8EgWeyfuLM8kFO/V1ipptVLtAAK3vqgnjsZQ3dMbtIXZstJx5s0YhgZuYzY4h
 isyb9UMBwuSIXWa+fF3wE/i8k/XLqcplghe/9KUyUtzxTL2cn3AVxtIWZwrAOBM7JbQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790864563;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=3ayYtL9YrWZpk1zeZygvLHmo22dGtYZ95XxYUZc+vHc=;
 b=rmQAhutiOgsCWkY3Du6gyH8RFVtMvfhocUAu/SzxO+vHodr0NDTOE6QuiRtxzT8dx1DP
 o17nQUoXCPnXYP2DvQmAALOzEAgUoY6a9Ctkfa7vBW9xXvPv9j5ypWOnASiry/Fk3xV1n
 ifkA+JT160MYhXVVK6zL8/eboAFdBryT3cUXRit57VA72GOewg25zGkwZ7tJzGtQoHy7h
 U3IpFjjGuSKcdI4jMtgDyuYfmipcgiXNpYHoKVBysjLUtUV1z2BqdU9hZyCdwVVGQsAUg
 xtfrsefADFs3GDEGxbtQYj9kwEkUxcrdeiDziYiBQgC1uvKQfWepeBAKGhH07DwesoA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 29A374052E
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 71CC49843D; Thu,  1 Oct 2026 14:21:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 30 Sep 2026 16:08:49 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: ad6468b5434f022157bda002137ce918e30ce498
X-Git-Newrev: 52c50abcd00c452c65d4e93bd7097371d8f1abc9
X-Patchwork-Hint: ignore
Message-Id: <20261001142129.71CC49843D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/bubblewrap:
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
Content-Type: multipart/mixed; boundary="===============2010207304516344880=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2010207304516344880==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/52c50abcd00c452c65d4e93bd7097371d8f1abc9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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

--===============2010207304516344880==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2010207304516344880==--
