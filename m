Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D00CCF2C4
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 20:42:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8E1F60656;
	Sun, 18 Oct 2026 20:42:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ucjGbOTyuYtW; Sun, 18 Oct 2026 20:42:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DB8D060622
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792356141;
	b=UxgrRXgqe1pcItgE0PgOsfMHMgEs1PtgdTHRPYJxH9rkHL6Y5p37CFmd3p326p13JQQT
	 BQassL9gATjyaN3hVWt2Wl8uTQkWXZEhWKzeRxhALOWG4EBiuQqMfuAI4XV5syfKZTCt/
	 i7WFLsrrAHF9UyiShO0pQAJcPtCQXAscChTJBM0v90XfdJWFq7pTzgxLx+daY1xXQ9C96
	 emBnphI2wYDsjNHBppCL57uf8sdWHI2Ll/YvPaQXIOQUUnAyy7k67jp1XYQ36pzlU7NYf
	 CuaIHlNUK4Q+5N7BdAVeRc6FwsY1sgjEJ3B+U6QQ8oEW4XqGm2bMNFDXWFrSqRPTPHw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792356141;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=tJ0f2Uk/a4zKbTwD67o9wgIoNrvUz00vFjXQL4LXezs=;
	b=edvqWFAzdnZxlvwJ4IOV4JEjp2Cn4NrPyX6vx1rhtjLxM+myVQU2O1Oj+uECL0xuiO+i
	 cthwrFxXY5qhmgdPNGdvJBZU4k4o/1+1j3OMa6UC39Z/ErR4X9JSSfA3kq2PZELmcRrSH
	 vMVzV4z7HZ39rop7lWxiyGnq9HPQeYDrY9nEk9mvJrZLzwDQ59ZFVqSpsUoLoIRjTbBz6
	 o3Oe8VxN39piMTaHtRIedOGVBI0ewPIHTD+btdjgvrtQllalMp3SeIFiAWSXaT3KvVchC
	 xIn8/ZKy0J+1axyLfbxHTPJLjK47gkFud78Ci5r9whPGTWMIGp45o2s/Up0vpCWcCMg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792356140;
	bh=tJ0f2Uk/a4zKbTwD67o9wgIoNrvUz00vFjXQL4LXezs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=In5z/hOZdQoBJDdQ7zFFgGcePoVxl101EBIzoBfoTvAFveGXYPnIdx5v/yxWPE6ip
	 wV+X0yE3VQDE3IuXWnS9xrOORcMfBvxACXNxpxRh+arMxUrb7W7wHUebe/9JL8p2Vg
	 I8dCeo3YYe36Q8XDCn7IZ2HL3ylIx0BSke34PiNbG/wQ8cdu7ZE1kb71DubT3xSBJJ
	 A1WMC+nDt96fFyTsM7hyfM29FKcT2ebjLC70Oe+jYegDYhsqbSQ2KMROhs6Wevvy7V
	 TXaI1AZ+1QxaMa2op9RNpuTIBj0JnO/N4NCVQw8Jbv0vB1xJ+hnzWX1/BeR27bL9Lo
	 FllKuxVhWo3Fg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB8D060622;
	Sun, 18 Oct 2026 20:42:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E9712A8
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:42:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 807F1406CC
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:42:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hDvytWMn4L0R for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 20:42:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C3A80406CB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792356138;
 b=UIwFoZhFdNRjW5nqbLQxvwq9ZyU5XIVTPl7Xac/r0mnwxC+ByEj9mIgVmSnF2msH+Zj5
 QbP8V4EQ7mr9YfcGiHQ2xsfysyMQEYrkObUMdENnf8P9+koOQLN6nhEKqxgd6qMfXobBy
 9FpLbYe54fT7D1dNHJVMYO8DBUpHksT/GNaAGLyQFxUGKgkXh8fvRL5yLEAaWuPJW2BOP
 9ryZOTflwaelmoTaBMZfuDfH4DVn57jhZocWC6AlpYrnfPKTnqNB0gLJBXd1RcpjBKU0b
 M8FQRKFq6Ky4NM18l1gpgsw62BeMs4dHtf+CgxqfeZ5jL/xZ5Wjsr5sTNpaPfdA37Nw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792356138;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=4KXlLaqFnJD0VXyx+PEUUk6JdF3przd6MUtqMhPVGq4=;
 b=nlZsUj58RBNvVLGHxxZ+dfVepfqGSsv2reESEiTQtjsbYqDLnNNgdDHtLYLRmYtp0QwN
 KKxd3zYPyuzJO0lUcnTnFCA20U/C8YzWS+s0hO08uE7CJDakfgcGy0ViB1Q06ajQiFupm
 boIvBWL7FUV9U+QzRmj5R1+H9dYupc/VJn5Cm9TJ75BXZEkoENtqG9Izn1wPY20YcsJop
 uO6EoYERH+8aiOY8UWltuguIMOrM3UA1b52uzHeshN7lJkS8ppH/7QGTeGTINL8XTvt2L
 0Ps9YqVJJRz6NMiOaJgdhdYDdRzJvdnGHFFAmbe1wzeyx0rEK8sVXtTZQtQM1d9nH2Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C3A80406CB
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:42:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 84B4D98407; Sun, 18 Oct 2026 20:40:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 Oct 2026 22:42:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 218a6b7a7440b4a73046b2d8d3d2600071326f5f
X-Git-Newrev: bd10a0172fa27be4d2d9a90a756319dc8a3371fe
X-Patchwork-Hint: ignore
Message-Id: <20261018204056.84B4D98407@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bpftool: disable feature
 auto-detection for host build
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
Content-Type: multipart/mixed; boundary="===============1006726870221760877=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1006726870221760877==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bd10a0172fa27be4d2d9a90a756319dc8a3371fe
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

On my system:

    $ readelf -d host/sbin/bpftool | awk '/NEEDED/ {$1=""; print}'
    (NEEDED) Shared library: [libelf.so.1]     # ACK
    (NEEDED) Shared library: [libz.so.1]       # ACK
    (NEEDED) Shared library: [libcap.so.2]     # NACK
    (NEEDED) Shared library: [libLLVM.so.22.1] # NACK
    (NEEDED) Shared library: [libc.so.6]       # ACK

After:

    $ readelf -d host/sbin/bpftool | awk '/NEEDED/ {$1=""; print}'
    (NEEDED) Shared library: [libelf.so.1]
    (NEEDED) Shared library: [libz.so.1]
    (NEEDED) Shared library: [libc.so.6]

Host bpftool auto-detects optional features by probing the system.
In my case it finds:
 - libcap which resolves to my system shared object because
   BR2_PACKAGE_LIBCAP=n.
 - libLLVM which resolves to the BR2-built one thanks to llvm-config in
   $PATH. But we don't have that marked as an explicit dependency.

Avoid the mechanism by hardcoding FEATURE_TESTS to the empty string.
Goal is to make the host-bpftool more hermetic to the host system. If
we ever need those features (future xdp-tools package doesn't), then
we'll add the dependency explicitly.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bpftool/bpftool.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/bpftool/bpftool.mk b/package/bpftool/bpftool.mk
index 1b765ba38f..94be9f6754 100644
--- a/package/bpftool/bpftool.mk
+++ b/package/bpftool/bpftool.mk
@@ -13,6 +13,9 @@ BPFTOOL_LICENSE_FILES = LICENSE LICENSE.BSD-2-Clause LICENSE.GPL-2.0
 BPFTOOL_DEPENDENCIES = binutils elfutils
 HOST_BPFTOOL_DEPENDENCIES = host-elfutils host-pkgconf host-zlib
 
+# Disable the auto detection of features on the host system.
+HOST_BPFTOOL_MAKE_OPTS = FEATURE_TESTS=
+
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
 BPFTOOL_DEPENDENCIES += libcap
 endif
@@ -28,7 +31,7 @@ endef
 
 define HOST_BPFTOOL_BUILD_CMDS
 	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) \
-		-C $(@D)/src
+		-C $(@D)/src $(HOST_BPFTOOL_MAKE_OPTS)
 endef
 
 define BPFTOOL_INSTALL_TARGET_CMDS

--===============1006726870221760877==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1006726870221760877==--
