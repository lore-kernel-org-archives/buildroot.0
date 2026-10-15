Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ADE4CCA462
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:13:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D163C607EB;
	Fri, 16 Oct 2026 13:13:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L6HeziGgrapd; Fri, 16 Oct 2026 13:13:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B35AE607FF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156423;
	b=DAGGnqAQ137ZGWUm8tRzooRxuwMP0R+SyxZZBbqMyBPL8M/0cKKfYxteQECQi/zjZ6ct
	 cOAzIaneOS4VHhyr3pD3cJzYGHBCN5qjtQe5c+8vyzLG4Q3PiCQu+FKYNwUP/atC5o+p0
	 PUH5oHE0S4Wc3mt8i0mmBbY9Z9HXQybqU4zeHofy1rROoipgqyKfmfoQKSoRSdXQAqz/i
	 yTgSkzALABMZ2tEF9lLHlO6DFkX+eie5EjGag8VX3TBsfzZVodjXTpAF4DDvJpZwAT//Y
	 4P31Yb31B3pEtxVpg5ISVfwqpQempCfn+7U9MbbgZ3edWTUZeNZAUFQtV0Xr3VR5B6g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156423;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=BuWUiG+ZI2QVaFYd5vkdigNhe/2h1PfN6FpQyr9zBo0=;
	b=DJPpFopi82cuCVWCoQsp067lqhPETJ0xQuX1JzWApO+An5g4dUoko1KYza3k2jZ8lsb5
	 wWO2YhcOELyPc4AGTZCaJFtZRQuMLx3LK1jgeF9OtUSxwQQISY9eXRtIqK+JCz7oWqtky
	 1+VZtnck5Ux+xW30F/ZPr6phINBps6tG5jKt6b0rfnplBnZboq8e88GgdwomH8gRKiokD
	 bHG+dVR9X5NcTAAZdVjSzlUK7yyNx/t/+5K1X0Vf2GW9gOEdJNLJPoRJBhWunbjPwo+Uy
	 Np83ld8rNe9Aj1n8Snlo39ZdYu00rOxYGsSGEI9V0gcGoRbyaDQ7Pl5VAHR7BbBubiA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156423;
	bh=BuWUiG+ZI2QVaFYd5vkdigNhe/2h1PfN6FpQyr9zBo0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TS5Z+Nw3MGozgxNOwBN9gzAxXawDvZFNo3GRhkatvpAFNxas0tmdG9nXMrscObvpj
	 SJE86jIBFgdsGovZCB9cW4XqBn4Ue8joY0PgicgjIj1xi8GWR3K07OGotvnI67yaQV
	 vc0KnV7OoC/utxCdLKpE+HDTR9ev2s+xKnUTfG6EwAPayZffHRQ3MPaLT7lzb0WLPB
	 ZLNbzAVbn3jk9aYfqym4a4O+E63/PVhwCJ2XKvNrrM3oCBV0JhCxHZEuoUe6eB1qOA
	 JNlc+izwTIWlHIm3dGaIVzCTwhcOCJNOfnAVPY/odFi7srrbSWWJpG5hkHcnen1oVb
	 HF4mtwmp2LIwg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B35AE607FF;
	Fri, 16 Oct 2026 13:13:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BA9B8105
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A97B760F1D
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B61X9K7cB4m6 for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:10:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CE2FE60F4A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156193;
 b=nHTkgchDCa0yuEnLRICFpFk8Yt70u7CeHblxmPhOhe/ozHj2d/It6k+Ku33QCGMt9OXd
 0wv+nqzlAWV8Kmu3bKaDnfKZS1ZXXWaQ3Svfbn7t0+iaBtAocRpdmg5QIze4EbnNr/ttv
 6HcSHzyerV6OCtRyxJLn4Pp9ZdGjMGOZ6Qig1YVrGQPhO8O4As52otH9POs9Umi8y3R9K
 Ntv54zPbGGaGc21t5XTwjV0cBj+uEgZh7jtx1IKG4PdMxmvQeRa3050zLkEHwFjX/KNmx
 Vm8c/Ffrhi+ZP45WlBiSAJsNFmIV0+WE97LzS7ysPIrrgkXncyLQrTciwDqJCxj8IQw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156193;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=XFf4HnUV5dHYAi/mjJOkyk7ccEFkUIkKgxS4giTMbWQ=;
 b=kkBMpdL1SGMYjhkNLYbD9rLOAZjeOiYok7VDLxE4hq74fTtRxg0U6OkGn7IMexDlAEwm
 24GWPRd9svmmDraAYneP+HxJyYD3yhHNfQZcKDqrKZxRv4Azvu7D9KGgQtu2zjAmfx0HZ
 1jzbqeq/vZQjL/VPPeuDDYiRb8ETty/DRSdVzc+LrCc5LGj1lrv8oaj6EHdKZbaoqS03n
 t99h5W9FHuBtS2gH1nULch1el5LYyZJgX8W+4yawO/ZyDJCBgyCPeMprwa/OQezazHk9U
 Rfo/mQy4qaGLVizY+fXNqwnPekdpp0sJ34Ux3elPfmFaBApFoBEpBV3AnR27WISYVLw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE2FE60F4A
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BE1A9960CB; Fri, 16 Oct 2026 13:08:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 15:15:38 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 19cb3b1e5086956d4d0ea3bbda9a8101ad6824ca
X-Git-Newrev: 3422727b3deb3b2e3be2499e655cbf690e903e17
X-Patchwork-Hint: ignore
Message-Id: <20261016130832.BE1A9960CB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/util-linux: fix
 mount helper lookup path
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3178768725043662602=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3178768725043662602==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3422727b3deb3b2e3be2499e655cbf690e903e17
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

When using /bin/mount to mount filesystems that are not supported
directly by the kernel, it delegates the mount operatin to helper
programs, e.g. mount.fuse.sshfs.  Normally /bin/mount searches
these directories in order for a helper: /sbin, /sbin/fs.d, /sbin/fs.

In reality, Buildroot installs e.g. mount.fuse.sshfs into /usr/sbin,
and as a result /bin/mount fails to mount sshfs entries defined in
/etc/fstab.

The patch changes the default search path at configuration.

Signed-off-by: Stephan Henningsen <stephan@asklandd.dk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 725cea53c7aca562de0869ecf1c89467b3e4bc2f)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/util-linux/util-linux.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 807a9fb828..2824d27cc5 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -57,7 +57,8 @@ UTIL_LINUX_CONF_OPTS += \
 	--disable-makeinstall-chown \
 	--disable-poman \
 	--disable-rpath \
-	--disable-year2038
+	--disable-year2038 \
+	--enable-fs-paths-default=/sbin:/usr/sbin
 
 UTIL_LINUX_LINK_LIBS = $(TARGET_NLS_LIBS)
 

--===============3178768725043662602==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3178768725043662602==--
