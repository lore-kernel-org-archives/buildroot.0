Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA5B3C79FB6
	for <buildroot@archiver.kernel.org>; Wed,  9 Sep 2026 14:55:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D9F74077F;
	Wed,  9 Sep 2026 14:55:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zQOptHbjINQP; Wed,  9 Sep 2026 14:55:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 76EC040766
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788965729;
	b=kTm31kn32xx9uoey6Eo2Q64jKzncwLN1FgHiOvi1Uol2soJyd6X6XjDbj0EYKGxb6vRu
	 DQoKD+6Xii2UTqlH9zNXgz4jmj4NCSCtEFTsLYnEiG9Dj/dWR4THebdJFac6dr+l0B0BZ
	 PuHlAFM70GJQmOC1p0rebU7dAca4wWU3TWmq2kjbNsnqv7mIURS2IQjfaJNgeDsdorAt7
	 6ZUt1N1N3s1xp6XISggf56ac7/sG/5B6V2Xr3hSoVD038KmgI47wPZrfB5PTb4F75uJFV
	 WChau/mbPVjY3DjtWveIFxEiyArbKIxC9GiKInSqgx3MFvY3Tk37qBoIKu47ZBulH8Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788965729;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=M3Rx2ltKcDgFWck8dwwWQRTfQIe5HraRO9k35/r/5+k=;
	b=cr35x5e3szGMHYeSfM9fEuWDSza4ZMOj2BIIBRJiY6R2D+58YLPxiMmMerzV2Quiu9+m
	 2v3GyP9u+yjTEYSVEaLRL1xVF4oCxE76M2tGigjzdGGJG1iyhKhQgL4IcgmNgBkC/LsWN
	 UKLWlx2udxBPz6sLC9AJLvCSuGKP99+nKk5XjclZwj4hqWqBEX4FF7kICWulkSz+1P4x+
	 tu3WSReaznxuFhzaQL6Fjy5q/hbQvI3hYPs0YYauD0ZUO4uLIxTDE+TbGFbdHk1h23ECQ
	 FIwunJlmRxm3hOlVY6wuOAQRmxCDGtvNfQ5Wlst0rcpf0H4v6uiPQUWs6CBqrdMjn0A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788965729;
	bh=M3Rx2ltKcDgFWck8dwwWQRTfQIe5HraRO9k35/r/5+k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DesACBRBuo1Qs4VgC4GdH0Q4IaSwaaj4zsBs4uaY5t+6KSxbK+lKUbv4pp/aEx2ML
	 8I4nMMFy7iphamgXD1lxbJnuEJtOQqYvcqCVMwG1n4B+v2XRbm8AU22hC1w1vJjU7O
	 2ke6wu3cgV2U7m7OFmn8veJPSe9STdvMEjDAiIMMwTTGkzVqAlz0YZ9AwmIbb1yLFR
	 31/lvg9YzDtwzRDOzH7qoxLLM7U5/3CsDtfV9S7PZ0mLNlrQ11WiAjxxRXXYRNI/fF
	 GKaDmjSBA9oTHth02eeVQBlDURdHRHlhXtkH4liM1S6RZwnznMX2ZDVeg6Yu4cnDVH
	 VCdwubFfSIkgw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76EC040766;
	Wed,  9 Sep 2026 14:55:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 47756432
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 14:55:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D65B4020C
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 14:55:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id woL_jI1ohSGQ for <buildroot@buildroot.org>;
 Wed,  9 Sep 2026 14:55:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 56B5C401EE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788965727;
 b=VS8/IXXRyyyvG572AlEHt/dqVOQWRndJ4+GY9a6k2FcHcVNgiff3yqk26lUYMEgYYZ5A
 qP17BzZdCiVM1YZqM0qpUm9t6ut83YaMnUDBD9BG86B29QW5bocZ69zTgsCP1HkgtyLQl
 peAhFnhZwxSAzZ+RPqJWwVQOcoI6vR23qKjkKXvkKY7tGV8En08+p9SO+5iMTNV75MjUq
 ka9AA7y3qUNInT+UXVNtGV7QbMDSJR4/AaGj9Qsn8PcgIYBokii9wG7huMTHYCwrnwpa1
 Xw7OYi6up+Mn9j23N7oTkg4I5JbS150euhqaaRl4/vMkUiFc1J0NdIdvPZ1Rizy1eVw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788965727;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=neh9LjVJzbYtitap9n9NxbIYEqFKIixLmqayggACDIQ=;
 b=QT7oq4km4H5bNsPPXIshA+eRcvsjpZA0iDAJ4TL16dI3zOo8Lgt9vRGUbvP2hyt7gwNi
 R06MkVU9ofAH9bcI2t+HAQkkLQ9bXHMFaIAXSMmcK2u2W/2Fm6qxZ6PwKdrcCPxZXyTXQ
 EHdOmfhn6BjUwXWQZF1h1Clsp9tayeiF6MOdNjUzeulpjX05uClfuySF4pMbItPPTW83v
 UQEUBxMaLPWSvuJp8M6f5U+ZESRUM/aVyqglfOsElO8Ec+AplmkhGNsQh7q2hADc2r3EP
 hQ50epDyTkoLbi9YE8xcKR10N+DhjlqKPif53Dm6W0iwE7v2KcRJPkn7T+5eJt2dV4A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 56B5C401EE
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 14:55:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4FFCB954D9; Wed,  9 Sep 2026 14:54:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 9 Sep 2026 16:50:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2d71c874d2605c5d2f66fb69a3fd8c8110cebc77
X-Git-Newrev: 36fa003547306899347c39d3955ef8f704baf660
X-Patchwork-Hint: ignore
Message-Id: <20260909145424.4FFCB954D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nettest: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/36fa003547306899347c39d3955ef8f704baf660
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

nettest measures download and upload throughput, latency, jitter and
packet loss using the RMBT protocol. The same binary runs as either the
client or the measurement server it tests against.

Written in Rust with no native library dependencies: the target binary
links only libc, libm and libgcc_s, and is fully static when built
against musl.

Signed-off-by: Bogdan Radulescu <bogdan@nimblex.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/nettest/Config.in    | 11 +++++++++++
 package/nettest/nettest.hash |  3 +++
 package/nettest/nettest.mk   | 12 ++++++++++++
 5 files changed, 28 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1fd93b1de5..97eb2d9cac 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -564,6 +564,7 @@ F:	package/libgpiod2/
 N:	Bogdan Radulescu <bogdan@nimblex.net>
 F:	package/iftop/
 F:	package/ncdu/
+F:	package/nettest/
 
 N:	Brandon Maier <brandon.maier@collins.com>
 F:	board/freescale/ls1046a-frwy/
diff --git a/package/Config.in b/package/Config.in
index 307f7ce86a..243b390d1c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2559,6 +2559,7 @@ endif
 	source "package/nethogs/Config.in"
 	source "package/netplug/Config.in"
 	source "package/netsnmp/Config.in"
+	source "package/nettest/Config.in"
 	source "package/network-manager/Config.in"
 	source "package/network-manager-openvpn/Config.in"
 	source "package/networkd-dispatcher/Config.in"
diff --git a/package/nettest/Config.in b/package/nettest/Config.in
new file mode 100644
index 0000000000..0ec4dcdc4a
--- /dev/null
+++ b/package/nettest/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_NETTEST
+	bool "nettest"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_RUSTC
+	help
+	  nettest measures download and upload throughput, latency,
+	  jitter and packet loss using the RMBT protocol. The same
+	  binary runs as either the client or the measurement server
+	  it tests against.
+
+	  https://github.com/specure/nettest
diff --git a/package/nettest/nettest.hash b/package/nettest/nettest.hash
new file mode 100644
index 0000000000..eaafe15ea3
--- /dev/null
+++ b/package/nettest/nettest.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  13dd03c8853f7eb9a4dd20b9deedbfa7cd7efbc59a175bd3bb1f0c4d1126e238  nettest-2.1.3-cargo6.tar.gz
+sha256  6523fc0e74e4774f105b0ee86a8187952337db6231f1a1817316174e241344ff  LICENSE.txt
diff --git a/package/nettest/nettest.mk b/package/nettest/nettest.mk
new file mode 100644
index 0000000000..d7ca986434
--- /dev/null
+++ b/package/nettest/nettest.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# nettest
+#
+################################################################################
+
+NETTEST_VERSION = 2.1.3
+NETTEST_SITE = $(call github,specure,nettest,v$(NETTEST_VERSION))
+NETTEST_LICENSE = Apache-2.0
+NETTEST_LICENSE_FILES = LICENSE.txt
+
+$(eval $(cargo-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
