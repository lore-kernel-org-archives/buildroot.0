Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5DE8C9830E
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:59:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C6518151E;
	Thu, 24 Sep 2026 18:59:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nCkVpQOiOaaE; Thu, 24 Sep 2026 18:59:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 4FF0D81521
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276395;
	b=GKi/4LNjMiKvFTYHfR7D1vew2zYf0pz66X9kVnITKTxJ4drnvd0UlEwKaZuYwjfsIPhP
	 MorqIPg8Xa0FDVLmIfgjKW/9dA8tORbqLaXsJvU25FpJTPEnpYl/svjAAjgvy5DGphDBo
	 YsJcUxADCxLIxzEEtyJZNWOz2qt7lo1idXTB1O39TBKNSMVF/a/n8R3G99hLTphYkM07B
	 xdEOlfmUZl801Ihp2OFf8+MjYf2M1s61ZqVoeWI62VRhkwNN+OVaCHEkoPxp2Oi3nqbJK
	 6HAN2X90WXB5QwQFBXNRoEdw/6SB58v+aIsRLHHg/mJtjo60XMuhgvABXQlxShGzE/g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276395;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=aoYsvZb0N4u7El1QlvXZAtrlcJe+wvu6r6bhk2zCzPU=;
	b=TxxjBktqVz8abBelzTwnNnEBEk0b9WsOWpwlz5Avr9WNDhVHvv4eVpSEUt2PErxIXKqY
	 1juJ+65+KhHO15UQgyuegxcrfD/JwvE0lvHatJFW2uf1UcCGhDVB0oHDvBKewNWRML+qr
	 xE1vAZF32wYMIHFQ2E6kn3pon5IU9zjtSxx2znbJ4i2EPkqX/jkAx4CwORY67jFawm6lS
	 G1rlc3jbpoYZweT2LbW+qumpcZuQklzVIvB6FEWfsPemWmlmkeaPaRTHJPztZk8CsEP+O
	 x6xKZPSE1Juh9JAPFkuoEGs8onkFu++LTsyJrJOaFa6Fx7P09nxnAoffQhb+XW5/k/Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276395;
	bh=aoYsvZb0N4u7El1QlvXZAtrlcJe+wvu6r6bhk2zCzPU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TC7IdH1RWyZ88F1csQvSFcXujQ7UNPVLW+p/wJ+g4OqLUpXYyFvQOXEybvyd0wU56
	 KFYvhiSi1lM/G356aGMLvqaHoBfo8YzDV/JZWMxG1Ax/k8XkFTHZK7HAKhs7UUyECx
	 CxkEfxoMGoHnyJ8cPHowvdN7FbEH13Q76Xqi00t8evOSfqNMKT+wvZY4C1BH13ek7u
	 gxpJ32cMOvBNRmTU/LUGlHmOEVq0SSFKApKWyuyZVQFzymgY0vUM2Y5+MWSLVrMgcu
	 GqM6J+2K1U0BwX4q4vuu7CAfoWAyCTWf3GRra91BHXZat3UCHoftq5Ab+XodCpAmcv
	 LWWIHYXy6VkNA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FF0D81521;
	Thu, 24 Sep 2026 18:59:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 03B1C431
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA44381230
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0bCQvcEBNdPU for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 23AF581232
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276213;
 b=ErE+o10mmk9zwUQ1iHMllp0TO/Ii8qS3R7BZzUilQat2AhC4mjbQEeDU1Myg+bgz7w0G
 j61D8sRmGIkEhpQn/GHbb0eslPiizKtme6NsBl85hMD2Hw5tTi1zucWWoXfWlVE9r2zsP
 rR0FJq3rhJHzHsXeDbIby3eFN+hOklkf84KeXIWHv8riv0ZXSg6PQiCQxSooL/AD3AMuM
 CD8OSrFmk02/I5bI/Bfo4gooTbtU6XCmX/17LoyilQeqyfEZUk8/CpA5yC2HybVomWjVT
 Rp3Q8lJrdgUGEaevM2qTPJGbmrp7dvcj4fQJUCAQ31+DAhiyTBePNWo57oF6B1tlsVw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276213;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=tN+n9PaSXqAJjjxMhjH9H7xrjwVPRAUtYw4YwxUoaH4=;
 b=kYN6qklr0NZnr/8V1CbKLCx9+SrYF3+zaZmU4u95bBfqM4E+yTPwV92AhRaulhvNN/0b
 XW81P7J9oLVoeo30jp2qYcYc9b/eop6SMf/NLfpZSaoDHK7rL6IHQOAXNm1DwMOcO7+Ei
 Ey21nR/ATgwSmgoMA4+9Wfde9Fg4bLf/RQTW2Rm/1RU78w3Hno8ie0rOSWAFylCBmslVm
 dNkTcJWrZCDBUzvr3lYYw0Rgcjq3lnTqGgGa/HFBrKHNhYvXQhoGrjrUgcv7iY0yXZjSu
 tOb8EMRPEa3t8rxdb3yXLZAcgEKMmm5cdWTKcTDAhGSE6dzZDlDIdSvZSjUKsBmGHOA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 23AF581232
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BBE6698323; Thu, 24 Sep 2026 18:55:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:22:53 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 7011d82a34a3f3e5655485eecc9b76582bbefbdb
X-Git-Newrev: 0897fac6ac0c7d4bc5fa74caef196e8a2cb89f21
X-Patchwork-Hint: ignore
Message-Id: <20260924185542.BBE6698323@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] linux/linux.mk: forcibly
 (re)enable Make jobserver for linux-rebuild-with-initramfs target
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
Content-Type: multipart/mixed; boundary="===============3346935450642114775=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3346935450642114775==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0897fac6ac0c7d4bc5fa74caef196e8a2cb89f21
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Commit 0b9efc991f8a ("linux: use BR2_MAKE", 2023-04-10) replaced $(MAKE)
with $(BR2_MAKE) in a number of recipes. As a consequence, the child
make is unable to discover the job server, in some cases. In those
cases, we get a warning such as:

> warning: jobserver unavailable: using -j1. Add `+' to parent make rule.

See [1] and [2].

Falling back to single job can make build considerably longer.
This longer build time issue can be reproduced in specific
conditions. This situation happens when:

1. The top GNU Make is using a "pipe" jobserver.
   This is the default when GNU Make <= 4.3 is used (and v4.3 is the
   version inside the current Buildroot Docker reference image).
   Make > 4.3 changed the default jobserver style to "fifo".
   See [3][4]. With Make > 4.3, the issue can be reproduced by
   calling "make --jobserver-style=pipe ...".
2. The root filesystem is an initramfs linked into the Kernel
  (i.e. using the config BR2_TARGET_ROOTFS_INITRAMFS=y)
3. Buildroot per-package directories is used
  (i.e. using the config BR2_PER_PACKAGE_DIRECTORIES=y)
4. The build is made in parallel, with 2 or more jobs. For example:
   make -j$(nproc)

Overall, the issue can be reproduced with the commands:

utils/docker-run
cat >.config <<EOF
BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PER_PACKAGE_DIRECTORIES=y
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
BR2_TARGET_ROOTFS_INITRAMFS=y
EOF
make olddefconfig
make -j$(nproc)

The Linux Kernel is built once (with a fake empty initramfs cpio
image), when build log is showing ">>> linux 7.2.6 Building". Then,
at the end of the Buildroot build, once the CPIO filesystem is
complete, it is integrated inside the Kernel with an extra "make"
invocation when the build log shows
">>>   Rebuilding kernel with initramfs".

This second kernel "make" is not expected to rebuild the whole
kernel, since compiled objects from the first compilation are still
here. However, in the described conditions, the second kernel is
fully rebuilt. This is an undesired behaviour. The Make jobserver
issue adds up to that: this second full kernel is rebuilt with only
one job, which can significantly increase the build time.

Running the previous example on a host with 128 CPUs:
without this change, build takes 1h5m,
with this change, build takes 7m.

Note: using GNU Make >= 4.4 (with a fifo jobserver style by default)
or removing per-package directories no longer produces the issue.
For reference, running the example, without this change and without
per-package directories on the same host, the build takes 10 mins.

This commit improves the situation by prefixing the recipe with "+",
to inform the parent Make that $(BR2_MAKE) can deal with the job
server. This will give a chance to do jobs in parallel, in general.

Note: the pkg-generic.mk infra already has '+' for _BUILD_CMDS, which is
why other $(BR2_MAKE) invocations in linux.mk does not need this '+'.
See [5].

[1] https://www.gnu.org/software/make/manual/html_node/Error-Messages.html
[2] https://www.gnu.org/software/make/manual/html_node/MAKE-Variable.html
[3] https://www.gnu.org/software/make/manual/html_node/Options-Summary.html#index-_002d_002djobserver_002dstyle
[4] https://cgit.git.savannah.gnu.org/cgit/make.git/commit/?id=7ad2593b2d2bb5b9332f4444d8bf93ac6f958bc6
[5] https://gitlab.com/buildroot.org/buildroot/-/commit/069b33a30e6d71454ba8cf3b41d1ee2db14549e7

Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Oleg Lyovin <ovlevin@sberdevices.ru>
Cc: buildroot@buildroot.org
Signed-off-by: Laszlo Ersek <laszlo.ersek@arm.com>
[Julien: extend commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 86a56dcc17cc540c08cc4760af9481636016550d)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 linux/linux.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index e3c89282fe..3599a10b50 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -708,7 +708,7 @@ linux-rebuild-with-initramfs: rootfs-cpio
 linux-rebuild-with-initramfs:
 	@$(call MESSAGE,"Rebuilding kernel with initramfs")
 	# Build the kernel.
-	$(LINUX_MAKE_ENV) $(BR2_MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) $(LINUX_TARGET_NAME)
+	+$(LINUX_MAKE_ENV) $(BR2_MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) $(LINUX_TARGET_NAME)
 	$(LINUX_APPEND_DTB)
 	# Copy the kernel image(s) to its(their) final destination
 	$(call LINUX_INSTALL_IMAGE,$(BINARIES_DIR))

--===============3346935450642114775==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3346935450642114775==--
