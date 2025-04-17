Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE00C369C2
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 19:25:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CFA060F30;
	Tue, 22 Apr 2025 19:25:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 74WgAOtgtlT1; Tue, 22 Apr 2025 19:25:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8F3260FE0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8F3260FE0;
	Tue, 22 Apr 2025 19:25:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A1EB71BC
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 19:25:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 92DE860F30
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 19:25:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wT_98puRmA0B for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 19:25:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3110608B8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E3110608B8
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 19:25:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DC82185517; Tue, 22 Apr 2025 19:25:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 17 Apr 2025 11:18:21 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 64d4daded258f1d8efeb94bdd495ef3ee9c528c9
X-Git-Newrev: b33305556329dfa920f8dffad3db4e73c589111d
X-Patchwork-Hint: ignore
Message-Id: <20250422192521.DC82185517@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/libopenh264:
 security bump to version 2.5.1
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b33305556329dfa920f8dffad3db4e73c589111d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Fixes the following security issue:

CVE-2025-27091: OpenH264 Decoding Functions Heap Overflow Vulnerability

A vulnerability in the decoding functions of OpenH264 codec library could
allow a remote, unauthenticated attacker to trigger a heap overflow.

This vulnerability is due to a race condition between a Sequence Parameter
Set (SPS) memory allocation and a subsequent non Instantaneous Decoder
Refresh (non-IDR) Network Abstraction Layer (NAL) unit memory usage.  An
attacker could exploit this vulnerability by crafting a malicious bitstream
and tricking a victim user into processing an arbitrary video containing the
malicious bitstream.  An exploit could allow the attacker to cause an
unexpected crash in the victim's user decoding client and, possibly, perform
arbitrary commands on the victim's host by abusing the heap overflow.

https://github.com/cisco/openh264/security/advisories/GHSA-m99q-5j7x-7m9x
https://github.com/cisco/openh264/releases/tag/2.5.1

The upstream tag now has no 'v' prefix, so drop it from _SITE.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit a7aeb5a46eaaf8a39560c8664593018cf253835a)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libopenh264/libopenh264.hash | 2 +-
 package/libopenh264/libopenh264.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libopenh264/libopenh264.hash b/package/libopenh264/libopenh264.hash
index 6eb78e2009..230b33c57d 100644
--- a/package/libopenh264/libopenh264.hash
+++ b/package/libopenh264/libopenh264.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8ffbe944e74043d0d3fb53d4a2a14c94de71f58dbea6a06d0dc92369542958ea  libopenh264-2.4.1.tar.gz
+sha256  a1b5c88bfb31c4d2251835e57a7df99f91181955cea6ec3ddd4ab82aa54ae9f1  libopenh264-2.5.1.tar.gz
 sha256  dd5c1c9668512530fa5a96e4c29ac4033d70a7eeb0eed7a42fddb6dd794ebdbb  LICENSE
diff --git a/package/libopenh264/libopenh264.mk b/package/libopenh264/libopenh264.mk
index e371e4cdc0..f9a50e4c61 100644
--- a/package/libopenh264/libopenh264.mk
+++ b/package/libopenh264/libopenh264.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBOPENH264_VERSION = 2.4.1
-LIBOPENH264_SITE = $(call github,cisco,openh264,v$(LIBOPENH264_VERSION))
+LIBOPENH264_VERSION = 2.5.1
+LIBOPENH264_SITE = $(call github,cisco,openh264,$(LIBOPENH264_VERSION))
 LIBOPENH264_LICENSE = BSD-2-Clause
 LIBOPENH264_LICENSE_FILES = LICENSE
 LIBOPENH264_CPE_ID_VENDOR = cisco
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
