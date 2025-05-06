Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A6BC3ABBC
	for <buildroot@archiver.kernel.org>; Tue,  6 May 2025 20:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E9D360BDC;
	Tue,  6 May 2025 20:06:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7gmECPQ2Fq9S; Tue,  6 May 2025 20:06:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A07BE60C08
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A07BE60C08;
	Tue,  6 May 2025 20:06:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C6071A3
 for <buildroot@buildroot.org>; Tue,  6 May 2025 20:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 32BD1407DC
 for <buildroot@buildroot.org>; Tue,  6 May 2025 20:06:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fBSpcRt9qrwl for <buildroot@buildroot.org>;
 Tue,  6 May 2025 20:06:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76C5C405D3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 76C5C405D3
 for <buildroot@buildroot.org>; Tue,  6 May 2025 20:06:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 712CD8632C; Tue,  6 May 2025 20:06:21 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 6 May 2025 22:03:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b769d4dbb88a878a1ab5a261a9618c404c6a7e29
X-Git-Newrev: 80cfdcb86ba455ed286bea1f557ff351ac6ce263
X-Patchwork-Hint: ignore
Message-Id: <20250506200621.712CD8632C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bird: fix build failure with bfd
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

commit: https://git.buildroot.net/buildroot/commit/?id=80cfdcb86ba455ed286bea1f557ff351ac6ce263
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 'bird' package with only the `BR2_PACKAGE_BIRD_BFD=y` protocol
enabled fails to build with the following error

```
bison  -Dparse.lac=full -Dparse.error=verbose -dv -pcf_ -b obj/conf/cf-parse obj/conf/cf-parse.y
proto/bfd/config.Y:204.27-33: error: symbol 'ADDRESS' is used, but is not defined as a token and has no rules
  204 |  | bfd_show_sessions_args ADDRESS net_or_ipa { net_copy(&($$->address...
      |                           ^~~~~~~
```

The `ADDRESS` token is defined only when certain protocols (e.g. OSPF,
RIP, RPKI, or BGP) are enabled. As a result, builds including any of
these protocols do not encounter the issue.

The issue can be reproduced with the commands:

    cat >.config <<EOF
    BR2_aarch64=y
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_PACKAGE_BIRD=y
    BR2_PACKAGE_BIRD_BFD=y
    # BR2_PACKAGE_BIRD_BGP is not set
    EOF
    make olddefconfig
    make bird

This patch backports upstream commits that define the `ADDRESS` token
for the BFD protocol.

Fixes:
https://autobuild.buildroot.org/results/68c5dd84585a7018ad57ea3e7134748c08858ef7/

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
[Julien: add commands to reproduce the issue]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...0002-BFD-Fix-missing-keyword-declarations.patch | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/package/bird/0002-BFD-Fix-missing-keyword-declarations.patch b/package/bird/0002-BFD-Fix-missing-keyword-declarations.patch
new file mode 100644
index 0000000000..29ec8abf7b
--- /dev/null
+++ b/package/bird/0002-BFD-Fix-missing-keyword-declarations.patch
@@ -0,0 +1,31 @@
+From e5b582868c5fa7e185a12023784adc8df7b8c7a2 Mon Sep 17 00:00:00 2001
+From: Ondrej Zajicek <santiago@crfreenet.org>
+Date: Thu, 9 Jan 2025 00:30:37 +0100
+Subject: [PATCH] BFD: Fix missing keyword declarations
+
+Some keywords were missing for BFD-only build.
+
+Upstream: https://gitlab.nic.cz/labs/bird/-/commit/c386369645e584facaad88ec292f2fe0bc70d974
+[tperale: backport v2.15.1]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ proto/bfd/config.Y | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/proto/bfd/config.Y b/proto/bfd/config.Y
+index 1a7474b0..70b09ad8 100644
+--- a/proto/bfd/config.Y
++++ b/proto/bfd/config.Y
+@@ -21,8 +21,8 @@ extern struct bfd_config *bfd_cf;
+ 
+ CF_DECLS
+ 
+-CF_KEYWORDS(BFD, MIN, IDLE, RX, TX, INTERVAL, MULTIPLIER, PASSIVE,
+-	INTERFACE, MULTIHOP, NEIGHBOR, DEV, LOCAL, AUTHENTICATION,
++CF_KEYWORDS(BFD, MIN, IDLE, RX, TX, INTERVAL, MULTIPLIER, PASSIVE, ADDRESS,
++	INTERFACE, MULTIHOP, NEIGHBOR, DEV, ALL, LOCAL, AUTHENTICATION,
+ 	NONE, SIMPLE, METICULOUS, KEYED, MD5, SHA1, IPV4, IPV6, DIRECT,
+ 	STRICT, BIND)
+ 
+-- 
+2.49.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
