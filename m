Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 567C2C79FB6
	for <buildroot@archiver.kernel.org>; Sat, 12 Sep 2026 13:16:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 038AC406E8;
	Sat, 12 Sep 2026 13:16:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BD8_1-WZY2IM; Sat, 12 Sep 2026 13:16:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org F2D6F406ED
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789219015;
	b=lUX5jWPJP20z3UQ6Y90jqPEtEGuGv0OWrJTEZ3RXNpttNwyGYjKIep3QCR6n+3LMhBRy
	 20pkK91rTrAVq1abTSxXrT6s7j5/s/10Wsm09P+c6sS0JY7Z7Lrp4eiqOJuBhPQgU0FXQ
	 EeYWa1PLPzoVEpyeBaVghhcio4kXnPAqYwlqieJNCKsuNkgKUTkfRT6+bz2ZIcLkCK4ap
	 5C7AvSvhQgOMiZTgkIZTo3rqu/9pbDpu3E17yJZ2rySEjgKZodBIMdN6NmoTU9SN5Se8p
	 bsIBEPLR929F60qM2icTHDmRmzt+hNoyTdWEvlMvLugiZ/31G4TT7IlJj5MlkLm69Sg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789219015;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=0yHJnIoknvlGLecCKnmYcoaqcjW2jAMJuPBDUUAusV0=;
	b=mYTeVBYZ/46tDqOd0l60zP/7EVaXwvwLKvHGK+TqrM8qnYHJ/E4LMPch1zFG6RLk/A1G
	 3QTcWUj4sO9Rzr1oSenGX0kW51Gi6TWoNSDwWfO3ZBTUndWp8B+aB/GmqapShI5JabvdV
	 8iIfZZrjb6Uy4TPv/yIzLX0pZ6QZlEo2jcGJl6UNCqixZZndiJ1bAgd+e2wDA+nyRm+u6
	 H0a7AWnlNngos4/QFi2nzJf36g5g9oA4h3IAoNTC5WPK9B/MQQqBqPymPlCZ0nN1iASY/
	 ey0ID0+YUqiMEWdLvrFNBNXyRt0BuDfeDNTJCFTexnH2kXkAS1L6+6GDkEQbdK5egjA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789219015;
	bh=0yHJnIoknvlGLecCKnmYcoaqcjW2jAMJuPBDUUAusV0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JnJQqyq9MwXGxYYg8wt1plAy0wA9kKHUoJ9+FXyo2JkigkKerYIpxzJHxlk8AVp74
	 DwHUwqKCkkx8MYEuPRgLkM+SRBRfGKkLfrVKzbqYhOnHwizc63RYUkjcxHylM1WSD4
	 WC7XcjalkCxqh6TsR2wFPJRQ8PSiTQct7FAF3fVjpWvXamFB2v4WacZHfw1WM+S6Hm
	 ITj+Tk995FFz7ejEHnZ00PQ8exCy621gp5Pwjii843a9P8OWqkBv+N+JsxwCT+EeDg
	 V16jMWPOr4TMvvkcsW+RaaT5ICj+SM7RblLzJviiRqxogh4ad4P0wuCj1YuXBBY8qS
	 uHUtE29pYsKiA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2D6F406ED;
	Sat, 12 Sep 2026 13:16:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 628E423F
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 13:16:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 53B1A80E23
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 13:16:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uFtF-oslKOrx for <buildroot@buildroot.org>;
 Sat, 12 Sep 2026 13:16:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 898FA80DC6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789219012;
 b=H5/nG+Wq8rk+LAQzYJn7l4R/aK5aynzNgaPgruACmA6fdGG/qynaXQCIkgU9jkfimxko
 AyxzgwL/+mZewFzarYpvz6t/xfgP8XpXVhGJiaQV5Zig3JNbgC/vjehBAz5YgpfVDMyGx
 WI8lYFqgXHUBy5yYFBswMK2RTmkelsXE0zri0OPydxrJr2Ql179r6pLJ6O15JvKz7dCPW
 xJhnGWlPvmPpHZlFGmhBdIugVJqj8AmzUxsctkYG9mXEn/Hk4faqG/kloaZky926jOac4
 nemCXPxNo7Dz9H+GpJe+RstcFOOxuCU+trnI/LVc6s80YH3PWbfW5vRnZs3/uPOAOGQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789219012;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=NSPxaWBtsrv+VlgxBZ/FnW5U8mf46mzIR54y/9TmFOU=;
 b=TedI62/3GR+I45bFdyCYSPHGplf3i/EJsvs2wYtPT0nDqkp0DSNJ67HTj0/IaacXX2SZ
 /LLNlgsW4tkQfhg11uBWLbbJNAtvtEh5vCer9g0gu/IdRkmlZpOumAPqECVFr/JSraNfd
 tdcCEvdTpStzteKolc8+xMSg6QjFes/ii6jy8mWYfTGYGDhC1dqzf9DMGE0MQ3cF4kCfw
 Udw1uFXMWo7BVHsqBJr4J/f6+W/7ekg3eOKDpfSp9Q8Zlzi+XF87TyZGPKH2lOVFbywzs
 tRwG0wTyXPpXJSgonJdO9lpIp6m9Qw9Exf0n+J1NgyFrCV8ZRLH/GDREAqJWMkmN2Tw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 898FA80DC6
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 13:16:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 28875956A1; Sat, 12 Sep 2026 13:15:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 12 Sep 2026 15:09:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ee5c69065eb3152b45e6d9f41550af23678b4eb9
X-Git-Newrev: 667c8bda321cbeaca9004ffb88a6282a0909e9b6
X-Patchwork-Hint: ignore
Message-Id: <20260912131548.28875956A1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/luaossl: bump version to 20260910
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/667c8bda321cbeaca9004ffb88a6282a0909e9b6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/wahern/luaossl/releases/tag/rel-20260910

Updated license hash due to copyright year bump:
https://github.com/wahern/luaossl/commit/efaf49dc352c221f518305348bdbf89db873d6e3

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Acked-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/luaossl/luaossl.hash | 4 ++--
 package/luaossl/luaossl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/luaossl/luaossl.hash b/package/luaossl/luaossl.hash
index 734c916f5a..36f1046f07 100644
--- a/package/luaossl/luaossl.hash
+++ b/package/luaossl/luaossl.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  19cfc635dd804bde649a8db1ffae01e5fc0cdfac2630fb73c617fe6d8a0bfd30  luaossl-20250929-0.src.rock
-sha256  421c26c8788c46fd59e4dbfe5bf8eab6c21e37ce3ca8cb44dfff5dc179098756  luaossl-rel-20250929/LICENSE
+sha256  22ad2d0e3d12a9376c3d06a000a1af70c45ed181ae581556759e55f637ff371d  luaossl-20260910-0.src.rock
+sha256  277af5901eb8ae8b0e39fec050e858abd23ebf698147e3567df7518928c5cc2d  luaossl-rel-20260910/LICENSE
diff --git a/package/luaossl/luaossl.mk b/package/luaossl/luaossl.mk
index 079d1e0ca4..e1a2806c80 100644
--- a/package/luaossl/luaossl.mk
+++ b/package/luaossl/luaossl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAOSSL_VERSION_UPSTREAM = 20250929
+LUAOSSL_VERSION_UPSTREAM = 20260910
 LUAOSSL_VERSION = $(LUAOSSL_VERSION_UPSTREAM)-0
 LUAOSSL_SUBDIR = luaossl-rel-$(LUAOSSL_VERSION_UPSTREAM)
 LUAOSSL_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
