Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECDF5C36008
	for <buildroot@archiver.kernel.org>; Sat, 29 Mar 2025 10:46:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8762240DAC;
	Sat, 29 Mar 2025 10:46:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tHC1jtVg77Vj; Sat, 29 Mar 2025 10:46:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6CA040C99
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6CA040C99;
	Sat, 29 Mar 2025 10:46:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1520119C
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 10:46:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF17E8206E
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 10:46:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jYc7E6f50KBz for <buildroot@buildroot.org>;
 Sat, 29 Mar 2025 10:46:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 283BB82018
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 283BB82018
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 10:46:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 211A083622; Sat, 29 Mar 2025 10:46:20 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 29 Mar 2025 11:42:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e172bb48d3460d994e5eaff9059b3055172d28bb
X-Git-Newrev: 15f15cfe019fc1788c01e5819d238328d4282aa1
X-Patchwork-Hint: ignore
Message-Id: <20250329104620.211A083622@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freerdp: bump to latest commit on
 legacy stable branch
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

commit: https://git.buildroot.net/buildroot/commit/?id=15f15cfe019fc1788c01e5819d238328d4282aa1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

FreeRDP fails to build on newer gcc:

    /freerdp-2.11.7/libfreerdp/core/info.c:88:39: error: initialization of 'const WCHAR *' {aka 'const short unsigned int *'} from incompatible pointer type 'BYTE *' {aka 'unsigned char *'} [-Wincompatible-pointer-types]
       88 |                 const WCHAR* domain = Stream_Pointer(s);
          |                                       ^~~~~~~~~~~~~~

There is a patch upstream [0] to fix that one, but then another similar
build failure triggers, which is also fixed upstream, but then a third
failre triggers, again fixed upstream [2], but then...

FreeRDP 2.x has been kinda discontinued, and the new stable is 3.x.
However, bumping to 3.x looks like a huge leap.

So, rather than backport, just bump to the latest commit on the
stable-2.0 branch, which carries 12 non-merge commits with build fixes:
    562ae3588 [winpr,pubsub] add NULL parameter checks
    68c7c21b9 X11 client: ignore grab related LeaveNotify events
    a9deecc99 fix [core]: 'invalid hHandle' errors
    052c525e0 [core] eliminate rdpRdp::instance
    be23ed4ba [server,proxy] deactivate capture module
    5b2b53b15 [warnings] fix -Wincompatible-pointer-types
    67818bddb [client,wayland] fix const correctness
    d2b6771c7 X11: fix pointer/integer type mismatch
[2] 7894a7dfc redirection: Fix incompatible pointer type
[1] f3ed1f1ac redirection: Fix incompatible pointer type
[0] 4f411197d info: Fix incompatible pointer type
    a383740a2 next-dev-2.11.8-dev

Fixes:
    http://autobuild.buildroot.org/results/e1b/e1b95b4fb0005d4e933b027b508cec9ad510bd73/
    http://autobuild.buildroot.org/results/ba0/ba0beae13e1be2573878ee50b1566f4427b269a3/
    ...

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/freerdp/freerdp.hash | 4 +---
 package/freerdp/freerdp.mk   | 6 ++++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/freerdp/freerdp.hash b/package/freerdp/freerdp.hash
index 1007215cd6..83b83db121 100644
--- a/package/freerdp/freerdp.hash
+++ b/package/freerdp/freerdp.hash
@@ -1,5 +1,3 @@
-# From https://pub.freerdp.com/releases/freerdp-2.11.7.tar.gz.sha256
-sha256  5a2d54e1ca0f1facd1632bcc94c73b9f071a80c5fdbbb3f26e79f02aaa586ca3  freerdp-2.11.7.tar.gz
-
 # Locally calculated
+sha256  f7cc2bf43b9778e9079cd229ea8e37fc1843eb1c11a8e4e003034af71858ce6a  freerdp-2.11.7-18-g0ee17e2f8e49d56ab5b90d5160fa8f87ffc445e0-git4.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index e8c8f320a9..3a1ba61621 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -4,8 +4,10 @@
 #
 ################################################################################
 
-FREERDP_VERSION = 2.11.7
-FREERDP_SITE = https://pub.freerdp.com/releases
+# Latest, and probably last, commit on the stable-2.0 branch
+FREERDP_VERSION = 2.11.7-18-g0ee17e2f8e49d56ab5b90d5160fa8f87ffc445e0
+FREERDP_SITE = https://github.com/FreeRDP/FreeRDP
+FREERDP_SITE_METHOD = git
 FREERDP_DEPENDENCIES = libglib2 openssl zlib
 FREERDP_LICENSE = Apache-2.0
 FREERDP_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
