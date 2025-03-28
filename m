Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D08FAC3ABD8
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:43:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9356183A5E;
	Mon, 19 May 2025 10:43:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uGm38T0Xpo5E; Mon, 19 May 2025 10:43:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0F7C83A5A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0F7C83A5A;
	Mon, 19 May 2025 10:43:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 194F9E4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1FDD940E10
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hxOnq_djjimN for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:39:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEC0A40C46
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BEC0A40C46
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BC93C83A2E; Mon, 19 May 2025 10:39:45 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 28 Mar 2025 19:39:45 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 91bfce113e895fc9637707e73567e5d13da3f169
X-Git-Newrev: a7aeb5a46eaaf8a39560c8664593018cf253835a
X-Patchwork-Hint: ignore
Message-Id: <20250519103945.BC93C83A2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libopenh264: security
 bump to version 2.5.1
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a7aeb5a46eaaf8a39560c8664593018cf253835a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
