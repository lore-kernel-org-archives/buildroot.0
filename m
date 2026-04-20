Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF7BF5A8A3
	for <buildroot@archiver.kernel.org>; Mon, 20 Apr 2026 17:21:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D149C40DAD;
	Mon, 20 Apr 2026 17:21:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OxAJeV-hyHPP; Mon, 20 Apr 2026 17:21:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0655540DBB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776705663;
	bh=ii0Yp8t3oTQzNqE2H9fbLYY17lKuE+LGBth5PDXSOPI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HmjLaGXk5/l20OgrNwaeweJ8oZHOsjFQCsEo9AeA9R1aGjCSjv4o2NVi9ZivfEX13
	 aL8hznD30JeosK//J9tLtaBJJ9TIs2/tYR0TrEtSS7fygRIE9BQjJ5o6Ba6LDD9Eww
	 t/DE9PbuHbSlveijYS0wgPcqNoVKoUXBbcaM70Kc0Alu3abK5YMXjH38IaOzAU2Tg8
	 JzejmOoIGvkBqQYp1XTw2DgK0/2p1BzNk4vKCrog32ZzMEjWw29E8tlNXS+IPzuXdz
	 ygFSWWNC1fHDHKXTxUVVMZaP+9CZHU+bsm+xTMKsSzp+ZGnA/IftFbKjIlMSrtdEXH
	 gsjEtGG8WNcnw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0655540DBB;
	Mon, 20 Apr 2026 17:21:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BF8D4257
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 17:21:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B158940847
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 17:21:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LDp1LLL2Fxbr for <buildroot@buildroot.org>;
 Mon, 20 Apr 2026 17:21:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0E4540839
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B0E4540839
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 17:21:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 588A081F78; Mon, 20 Apr 2026 17:21:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 20 Apr 2026 19:19:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aaeebf981e5a7382d05b16f8d2f5496fa8faa7ee
X-Git-Newrev: b8d8e34e3ae87de081e931b1986d396f19627909
X-Patchwork-Hint: ignore
Message-Id: <20260420172100.588A081F78@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fakeroot: fix hash file format
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b8d8e34e3ae87de081e931b1986d396f19627909
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Commit [1] "package/fakeroot: bump to version 1.37.2" introduced an
incorrect hash file format. The command "make check-package" reports
the error:

    package/fakeroot/fakeroot.hash:2: expected three fields (https://nightly.buildroot.org/#adding-packages-hash)

This commit fixes that.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/a4f2419164c4f3514e573427f6537f94c2878837

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/fakeroot/fakeroot.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/fakeroot/fakeroot.hash b/package/fakeroot/fakeroot.hash
index 13e8695128..82a6214380 100644
--- a/package/fakeroot/fakeroot.hash
+++ b/package/fakeroot/fakeroot.hash
@@ -1,5 +1,5 @@
 # From https://deb.debian.org/debian/pool/main/f/fakeroot/fakeroot_1.37.2-1.dsc
-sha1  1a721c2b4093a4e83dc091dc41a028f19340c1b3 595964 fakeroot_1.37.2.orig.tar.gz
+sha1  1a721c2b4093a4e83dc091dc41a028f19340c1b3  fakeroot_1.37.2.orig.tar.gz
 sha256  0eea60fbe89771b88fcf415c8f2f0a6ccfe9edebbcf3ba5dc0212718d98884db  fakeroot_1.37.2.orig.tar.gz
 # License files, locally calculated
 sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
