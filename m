Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1290DC6379F
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:11:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF0804148B;
	Mon, 20 Feb 2023 22:11:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF0804148B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JEZxwsekkm7Z; Mon, 20 Feb 2023 22:11:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EE9C4EF18;
	Mon, 20 Feb 2023 22:11:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7EE9C4EF18
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1011E1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:54:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B02E1416C4
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B02E1416C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6vIEwicbHGjB for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D593E416BE
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D593E416BE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D363786494; Mon, 20 Feb 2023 20:52:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 14:21:44 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 66f3cc0b96baff46d3a136f9d8bf2a3b44037bdc
X-Git-Newrev: 040ab175df6337bf39a609adea07a7756c309be8
X-Patchwork-Hint: ignore
Message-Id: <20230220205205.D363786494@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/capnproto: security
 bump to version 0.9.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=040ab175df6337bf39a609adea07a7756c309be8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix CVE-2022-46149: Cap'n Proto is a data interchange format and remote
procedure call (RPC) system. Cap'n Proro prior to versions 0.7.1, 0.8.1,
0.9.2, and 0.10.3, as well as versions of Cap'n Proto's Rust
implementation prior to 0.13.7, 0.14.11, and 0.15.2 are vulnerable to
out-of-bounds read due to logic error handling list-of-list. This issue
may lead someone to remotely segfault a peer by sending it a malicious
message, if the victim performs certain actions on a list-of-pointer
type. Exfiltration of memory is possible if the victim performs
additional certain actions on a list-of-pointer type. To be vulnerable,
an application must perform a specific sequence of actions, described in
the GitHub Security Advisory. The bug is present in inlined code,
therefore the fix will require rebuilding dependent applications. Cap'n
Proto has C++ fixes available in versions 0.7.1, 0.8.1, 0.9.2, and
0.10.3.

https://github.com/capnproto/capnproto/security/advisories/GHSA-qqff-4vw4-f6hx
https://dwrensha.github.io/capnproto-rust/2022/11/30/out_of_bounds_memory_access_bug.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/capnproto/capnproto.hash | 2 +-
 package/capnproto/capnproto.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/capnproto/capnproto.hash b/package/capnproto/capnproto.hash
index 7fd0e6158b..c3233e7c8b 100644
--- a/package/capnproto/capnproto.hash
+++ b/package/capnproto/capnproto.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  daf49f794560f715e2f4651c842aaece2d065d4216834c5c3d3254962e35b535  capnproto-0.9.1.tar.gz
+sha256  4fe1ca8ab90859f33f08d2c4fcd7099e2983b0b946beecebd2fe051e3a64c67e  capnproto-0.9.2.tar.gz
 sha256  9564998c8d7f270a61a8b89869a8d17a9d5e3783b64027788b5e339ec8479e10  LICENSE
diff --git a/package/capnproto/capnproto.mk b/package/capnproto/capnproto.mk
index 7fc07043fb..23f128455a 100644
--- a/package/capnproto/capnproto.mk
+++ b/package/capnproto/capnproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CAPNPROTO_VERSION = 0.9.1
+CAPNPROTO_VERSION = 0.9.2
 CAPNPROTO_SITE = $(call github,capnproto,capnproto,v$(CAPNPROTO_VERSION))
 CAPNPROTO_LICENSE = MIT
 CAPNPROTO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
