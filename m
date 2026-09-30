Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74B9ECA5FD2
	for <buildroot@archiver.kernel.org>; Thu,  1 Oct 2026 14:23:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A2A460D69;
	Thu,  1 Oct 2026 14:23:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XfmlrrdxiwdI; Thu,  1 Oct 2026 14:23:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 19DB060DDF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790864618;
	b=LpqiHeItd8sT8Xrryw+rtV/4ltf8cBcVJ3V7nng0GuyG04znaG5asCUQeZiMSBvwq4z/
	 Xh+oyCbOGpt91SBw4whIq0WjP4wOYklIleZKLdywhwKiWvI64TWpS4c0sh8LYqFcbu2yc
	 UnIzwy3jb3Mh0NHuTkqqOOumerVfIzwepluTJR+ees1xRzcGXMFtQNKb6rdBd0NWeuti9
	 eyzCYIhCaRwpsCs3q7QRZnOi6+2OoaYXA38dt8PZoMVNAQzOuh6odY7StVV1xX1q7wu0G
	 SVjkCA1mSRkDZmEf/wc/LOFUwZCwd7WBJVbaStCSkW/C3zvuE6fN+UZxv/xhqx/Suzw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790864618;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=5MkIKmkGcFbMpddKiI5iO+OopDgGRFrHpyGB0psIkSc=;
	b=ThftwyVZ6f0OQcc0/Brj9Qbb2cEKaJbn6p/pqmQyNkyrLCYLTdsqlqz1aQK2njuc+HJ8
	 Nu0SA+m0kqrHL0JIj7QRJdbiUlcur0k9wtB5Qvi2ke7wlWWWRDEsLoi5L79kJ+ZLLHG00
	 QCGkIRK7qp2BnuvT6t+Qnoxwoccf/wle5pV624xD15VusWMTW4hzezosvuQuiE6nL9scH
	 YRksXAt9+yx0zRa62N3Xmx/ssxr5GsxbaaJH107CNG1oy9iLnbeZ+fcTX3mSmIaz7BaWR
	 YIn61DBf2n7bB9YUpqwqxWbtt5kZQkgTnXCZOOjfBhFrA/RLVXWwW/AgW7ycVJutA0Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790864618;
	bh=5MkIKmkGcFbMpddKiI5iO+OopDgGRFrHpyGB0psIkSc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VluC422703Hq/493Y8v4iFrq4lF+WNaxIe7zYJzUzXfGqlNX/TLLCh3csTstpJzuT
	 +Nd4XYBCHR6sOPDjReJsFVi1p1d+qqPm5I9q9B0MSL3w7iDnjsBCf7OB5G+3ysPSpE
	 xb3VZTBI6xOoscu/ZSo9Ft8h10Q4s9b2kOH1g4M2aPl0YfXXU/zafQnQMBKx6KxpEh
	 YoxEV3V60WKIZBEo22LOnPjeZ04K2hA/1KSljOZqY7Kd7c9i3S+Icjsa1Di/UrXGvL
	 23j9NFh0/rm8CzaDvasrb1QvDV14fbb+aM4Vhz2Z9KlM5kl6eOJjxt/VbW6I47wYCp
	 /XL7x/zRHxtug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19DB060DDF;
	Thu,  1 Oct 2026 14:23:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CB2A5D22
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BA6154085B
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ei7Y-XF6SPb9 for <buildroot@buildroot.org>;
 Thu,  1 Oct 2026 14:22:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 1A6F0407C0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790864563;
 b=iy4kMxewduf07FSFb11lVfhfKZkdRujEW1YHWd7/PZlZHEsYbj8bX96Q5aw5BoyfcRBh
 8aPtuJ7StK+sE7fMFos0AtR9skBZxMYt2lQXv3pCzLPGOf717/m//n/cQgykQfkEubeHd
 V1UsugY4nmGA5Z3NVOTobMiwdnRTznysNuEgOmaW6NGPsVymWWn6qagXPLWwwjjUIcUkg
 ea16NRFVEm+2BGP52XwTqDmcsi1B/371I5lV2L0YjY9Z8/oGL2Ism56/Vp221L7RmPhKA
 aM+KguKnzpPdMRvfLNKlOiJ7VqX4RPEuNaa1cwe7Rykwge5qbugb2d4sB2Hd/JVu/+w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790864563;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=/bNgRCG/hTqpNM4Yg9aJA1q8IV8IS8X0mgGYYT+vslc=;
 b=tCDj8VhNi3RSafjGFhzoSPLZ+gETccCORtxAjhzqMSitW+v9RBd8WikybkFOrFKtAQ4l
 EynBhaxMe5bi9gOcSf1Mn3amWuUeSyryQ3BvSCDUgyxj+EoqWtqjObgHt9/X31vMl9+0W
 CB92E0GgpV2OLEur4eeWd36zgWMLDRO8yXG4nYPf3ui4RgKZg2IDS93cCFLZS1DOFYQu4
 KTwxm5E/ymJFusrDlxKz3yp5aCahXEx4Bu6xedEzYkUdnKKTwFexWI3Q6+3xy5qx1T+oJ
 26o7tnwUyk0vZxycYKrhI+8ea3OK03cN95hKhpv4BmL/Hmisu/UYzJCJPpcJ+J9bK6w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A6F0407C0
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5630E9843B; Thu,  1 Oct 2026 14:21:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 30 Sep 2026 16:08:01 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 2217b0b2c30c6fc7b0921394695f1ac4990ccace
X-Git-Newrev: d852986d652f3d7d10ff6dc0f1905e8ba8174574
X-Patchwork-Hint: ignore
Message-Id: <20261001142129.5630E9843B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/expat: security
 bump version to 2.8.5
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
Content-Type: multipart/mixed; boundary="===============3560586290796454377=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3560586290796454377==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d852986d652f3d7d10ff6dc0f1905e8ba8174574
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

https://github.com/libexpat/libexpat/blob/R_2_8_5/expat/Changes
https://blog.hartwork.org/posts/expat-2-8-5-released/

Fixes CVE-2026-93990.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 67380a32f78ca09b4e302a92307de585b9ee18d7)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/expat/expat.hash | 4 ++--
 package/expat/expat.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index d8b4eef2f9..262ad4bf0d 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -1,4 +1,4 @@
-# From https://github.com/libexpat/libexpat/releases/tag/R_2_8_4
-sha256  656ae1cc8da3b4ea513bb4e254f33e6243938084c0ec6239da873376b09985a7  expat-2.8.4.tar.xz
+# From https://github.com/libexpat/libexpat/releases/tag/R_2_8_5
+sha256  1e727b8933ec51a77a9a9d9afcf8e688bce45d907c13e36ab7393fe36e703182  expat-2.8.5.tar.xz
 # Locally calculated
 sha256  31b15de82aa19a845156169a17a5488bf597e561b2c318d159ed583139b25e87  COPYING
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index 1e5b738463..be4180992f 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPAT_VERSION = 2.8.4
+EXPAT_VERSION = 2.8.5
 EXPAT_SITE = https://github.com/libexpat/libexpat/releases/download/R_$(subst .,_,$(EXPAT_VERSION))
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
 EXPAT_INSTALL_STAGING = YES

--===============3560586290796454377==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3560586290796454377==--
