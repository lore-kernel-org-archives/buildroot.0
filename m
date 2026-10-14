Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06CFACC6B2A
	for <buildroot@archiver.kernel.org>; Wed, 14 Oct 2026 21:31:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99C9560685;
	Wed, 14 Oct 2026 21:31:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7QJyMPzUenFe; Wed, 14 Oct 2026 21:31:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org AF56E6077F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792013484;
	b=IWX1h5vT62U+dJAZj95q61D++BsRyKz0oSU80ep+eHZ0BOiNjqRl6bmoJXMmlPB8LAz9
	 Jp71sBicyUX/p1AHi5LWevc42ZJXwdQMQ8SpKsUQP51eQpGSMCSqjn/WFKNZh52CcWcg5
	 OiPCmodPM1n+yIZjAiGuwh/JD2mfy9/+VhVECwofCmuf63SCYFUDTy/4vOh4VimkdyO3c
	 bHYoxIPaGrP4BzhYn9iBUvd9MwzixN3SrowbtBV9TK7iVR3UAXLjcWhPPxBlseImI4EKL
	 WL1ooWitKFWSH7yCIdt6XU+mc2FkVxs1hXWbxItZddeTsgAMFgJZJeY/jYO9sehxxaw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792013484;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=Mru290PBblm/zeVZ+vXPhvZIGeUgXYgOWxAveiMY+xY=;
	b=EAqOiFjNfUtx+5KDoaJGPYL83IXhJTAvVVxvbjWzuBsH9gkj/h4W7d/2VXb/8WRwfp0E
	 CCzBB+G/gHXnNByEV5tv5uOSS43a/Hxt7bPfk0DRLGja6P3lY0/DkEutDwsrh0G7cRYso
	 WsRI36/DaFmLeHMw9DMFnhNpQ+xIA/T08XVhAa/VQH8zla7SgOMFZZ0uQQeIPweRxhjXS
	 +e6JAzzGxZsjU0i7Wx6GsloDrdlQGuAacZYPC3R0Lsbyq0apjDouhhwK7W8PhxkHKZrLH
	 A47zZ7wyB2kVMHEMIvVAxMq+AJ71aym7SUoWRjVUgRTd8f7zLLq9dPLQQxizshGpIQA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792013484;
	bh=Mru290PBblm/zeVZ+vXPhvZIGeUgXYgOWxAveiMY+xY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jq5OmGsapm5Bf1UVaSrrM34VWO7nIckSucdqUFOzyia0v8LHakKxc46QlJckirosB
	 0im5SUgFauALjYNkPyYtl/rA3GHhN/z2bftUzl5c3NrzEhexqdQ52na937AIuuv9jJ
	 ySgLs11wE3LxNWDzl8h+XXuC8hK9OUK880h2I6ueqkE83e66ztYt3sBderSNW/WvgM
	 E5wugRsMFptTKRbZ966xEfxfaN4gmQJyj4arhavXk6mv11rNxP9Y2nlvVYNyzv+Q5n
	 JK8ccOKLCeEUZF8K5sNmkUL61Nv4gywUNR7woz3iddF3/v1D+qAMsIvV1eiU4nlRWc
	 D0ayPN8CRV2pA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF56E6077F;
	Wed, 14 Oct 2026 21:31:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 56EA32AC
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 21:31:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C2DB40535
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 21:31:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 63MxM_ndUJIi for <buildroot@buildroot.org>;
 Wed, 14 Oct 2026 21:31:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 088FB404DE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792013482;
 b=rE40Iy6tAobhEnQpjxdI1kblnF4uQFarS/ObLroeszVmt3jkiAIHemNhWIJmvTZ5WsSc
 JQFoq3652tkicTEo3kXMfbQelOHeNYMNS8eI8KERPgFygtGL4DG8LprQu2kJWwJglyCDR
 pYl2ZJTE90vvhWJEzB8uR1o31BolqK0rWyHbV23JM8XDHM65GAioicEpGq84a9m/zFqB+
 rEYv09RYZxxlvkot3qrZ2+WWMW12+E4W6TW/uCCx/pk83yGVUlct+sEKwDEOE0N4L17jZ
 1ssd5PlQocyHFrgmP+iZJ4KxajJUw7p199r+wiRu/Bp744895z3g8a1Ipp/ahsq2fHA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792013482;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=6DTULefn7YETBOeztrxhh5G3vPogqpq9SZLyjG96A3g=;
 b=K8PfpCCaHK9Q/nDXuhzWZ2MTJqiUCNxt5F6UPPGTvb5Pc6LXFOqUQ4cxrNDefFQk8i9t
 HNsc32Lc06MvOEqu1hO57rSZobnparpoZc1IllS70Fb/Sj3VG/H04KoqWlmaE17piLB5n
 eTe9XtDRKIj5Cg3wHc/rZC/FY0LCIr7XPC2vsPuDyzplMgOwX1kVz9uFRU0iL94gJodk2
 6L8FEiX1xAwmvM5x8A3eqVKCre9D6lkZE+C0Hja16Lgw2YCR+bRFZ60GzVQVOxkJnyxgF
 DEseVjVC64aTj3sN+U6mGyqF8mD++Wh3K95kmTM2YRgZ5o9eGDWuRyvLXNwEorxvRPg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 088FB404DE
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 21:31:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9A26595C6D; Wed, 14 Oct 2026 21:30:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 14 Oct 2026 22:57:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0e61ae3b5afa6c10179761bb8874379a41ea0b06
X-Git-Newrev: db192575e0fc2c9e155477b1cbb6d6001d0b0a83
X-Patchwork-Hint: ignore
Message-Id: <20261014213001.9A26595C6D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libglib2: security bump to version
 2.88.4
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
Content-Type: multipart/mixed; boundary="===============7275200902948722865=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7275200902948722865==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/db192575e0fc2c9e155477b1cbb6d6001d0b0a83
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

No CVEs specified, but NEWS states:

!5394 Backport various security fixes to glib-2-88
https://gitlab.gnome.org/GNOME/glib/-/merge_requests/5394

And a number of other bugfixes:

* Bugs fixed:
  - #4011 gio/tests/services: Installed service file contains build path after
    !5259 (Jaipaul Cheernam)
  - #4020 ‘TLS callback not invoked’ error on msys2-clang64 CI job (Luca Bacci)
  - !5262 Backport !5261 “gio/tests/services: Fix installed service file
    containing build path” to glib-2-88
  - !5273 Backport !5266 “docs: Fix gio gi-docgen docs_url” to glib-2-88
  - !5285 Backport !5283 “gconstructor: Reference _tls_used also on GCC, CLang”
    to glib-2-88
  - !5323 Backport !5311 “fix: handle long filenames in trash by truncating from
    front” to glib-2-88
  - !5379 Update Norwegian Nynorsk translation
  - !5394 Backport various security fixes to glib-2-88

* Translation updates:
  - Norwegian Nynorsk (Roy-Magne Mo)

https://gitlab.gnome.org/GNOME/glib/-/blob/2.88.4/NEWS?ref_type=tags

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[Fiona: fix typo in upstream NEWS link]
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/libglib2/libglib2.hash | 4 ++--
 package/libglib2/libglib2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
index 8970ef74e3..95bf4d3179 100644
--- a/package/libglib2/libglib2.hash
+++ b/package/libglib2/libglib2.hash
@@ -1,4 +1,4 @@
-# https://download.gnome.org/sources/glib/2.88/glib-2.88.3.sha256sum
-sha256  ab24d24e698dfa1e408b7bcdb508f4aafc906185a8b8ce72fdf79bbbdc9b383b  glib-2.88.3.tar.xz
+# https://download.gnome.org/sources/glib/2.88/glib-2.88.4.sha256sum
+sha256  25fd169f3b2f91fe2391ad297883ce0fcf30c69fc789ffd1c9672d1332b1c5a8  glib-2.88.4.tar.xz
 # License files, locally calculated
 sha256  fa6f36630bb1e0c571d34b2bbdf188d08495c9dbf58f28cac112f303fc1f58fb  COPYING
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index bfe4920291..45aa894b81 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGLIB2_VERSION_MAJOR = 2.88
-LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).3
+LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).4
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = https://download.gnome.org/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 LIBGLIB2_LICENSE = LGPL-2.1+

--===============7275200902948722865==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7275200902948722865==--
