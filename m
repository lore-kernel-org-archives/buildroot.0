Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70205C98318
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:57:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34052408D4;
	Thu, 24 Sep 2026 18:57:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2qAI6uLu5Rcw; Thu, 24 Sep 2026 18:57:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 52140404C1
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276239;
	b=Fcxh9U9bPYQWmPTL61r/2rzm8bVyA8WX9wTWEd48RoVBGiBCtHlcqGzBpgUj/eZzl6Jt
	 /kjYJiztYV01PZU/v51ivTri1IpY5yDVDH0kiO26zr54KPs1QTyi/ZgxBLF5qnohFFOuu
	 zqGgYjBgXfAtsj6oN3F2pKZFU2jZ5AsEVHoe5r8z6iHVZ+v28HSzWSgeIIcO8oETARq70
	 3Ml8QGm7uyv3X0Q07iYrAnrHZCYJqZwg0IVL6/NhL0krycsqbYZYe5Q3O2vNmbgM5GmNy
	 rMC0h5uZV+OS2FgavfC0bfxFBKMTc1GGmpA/toRL27hTMq9LBQcSjLwe5JzEAfAYflQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276239;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=4QiEQjKLp5B8ADpMUDduEE4try+r7KdCfzki+Wbszog=;
	b=X3Ya2vcHBehBG/ZQCcPmx91lYBHurOV43Mtn0m6Zx90uJt1I+lsyXuJKuWSWiOddG47b
	 z74RPyCJ9Mpj+tRHR5htKkuDgrN7/dyh30EIjyYOA6aZNYwLxO2iWkWSqtNiubspdZMcg
	 GiPrB2lYJCZ8631rpnu+VQztMx/YOPYPWojL6G8e+BN2VREfUFEEm7Y3HSloEfDZsja63
	 FjcDsgK8jWLNDTjeZMgILlD2vWFZrlwWQIJUM23iHuyrxaVIOw4ef+GMUbvCtSJI9uYhi
	 LrCSwCPwO7Z/o3h2tfW+3OMa+UWJ56B47sdoLZiPpvnyVZClKmQD47WQcWPUmO38ebA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276239;
	bh=4QiEQjKLp5B8ADpMUDduEE4try+r7KdCfzki+Wbszog=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NMRBwOPKxDKoZafKWOzFBwR25KNyHApPmTSTaBnEHnoS+ZG2ApHqBXm1mMAoTERvp
	 vEvM8mp0yHG1LeNAqt5tNIHo+Yy3b62Z2QIkWLsTNS7ZBzM2Dbb+ZWY5eOLq6oXOrI
	 sJYWZXDYgVx8XkqaNCitreVEa47ycECAVsJumnziF1BUYBaB2dHMKAtzEwEukffjse
	 vZqK5G/rpffNClm+uz0XLfi0HusFL38j/RGf9FYmKYlPXN5nZvlL2RzMIybB3qU9yZ
	 GyBg4pm1culLFtgAsnlCprBRyQ29my/1kN/Pk+OKbvSiHeONWswi9Bn08p/OwtVqsV
	 y36zsE125MOwQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52140404C1;
	Thu, 24 Sep 2026 18:57:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 61C553B7
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 47F9681209
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lsT5m-kB3-Hz for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 63C4081215
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276204;
 b=bHq52kBG2e2leTWC35u2eIuqceYWpYjslyrub2IMw95GENIA/prwQC94Kf577CUx4gAD
 PQGzyEYczgsiij61LqCw/uyRHNFX+jFiBrzta4Ru6DJZfPsAreVYWQtuKKK4WEzvkXNk8
 kBks9sBg8v1T4Lu2sxEMpB0ZiRdiP+uUxPuBeWVBCzaruTOIJAmv1ju072u2RaGRO1/82
 GysFn9OUby/CTz0iklJBwKjaoeZZ7CHJBpAHk4S3kLd+a24XCY4Mvh2ePO6xYaScg5ZPF
 NVuyiD6wVyi0zuoj7BSlatIltqZ+2Yo/I9pbD4Yg05KEmMvG1MksCuk+GYFQTjl5juQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276204;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=EmdjIlVU5IJdnEfL3HDvN/ZGj4JAtw1kpld/Hdnq3Pc=;
 b=proslYcR3ifME7c6upuYFT66kLHAcq8jmz1fmpJN2GQNYVrrZZx7dY+CoTepQDpV9UvI
 b4LosEmJC/alZsuNIWOhRz1JXzCP0tBLZfIyRbw8b1sdmGLzG2ra3wKrlNYBakEhvCSQC
 xbWQXx+v5+4Bm0EcnP6arqYZo206CLqEbvaHIwiGkkdwogt/FOmOSXi+JPMLmmIoACCoV
 17wCZ/zwk8OSiKUYqjouQwfMqgCkvEyhPUlJ/CxTIwfQMUoJXWpur1abSxsS+Pe4uSgg3
 OoTdh90yl9D0FMQbKCwRU1LLm1S0lDfxAvBSjGdQBrmTAhogeV8dIBaUS8Br7aZUeqw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63C4081215
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EFA4B98385; Thu, 24 Sep 2026 18:55:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:22:51 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: ec746f6b57d48850cb2ee86c94188d4b5c433978
X-Git-Newrev: 31feeffd69e67590e1410ded429933cc0840859e
X-Patchwork-Hint: ignore
Message-Id: <20260924185533.EFA4B98385@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] linux/linux.mk: forcibly
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
Content-Type: multipart/mixed; boundary="===============8409219833071033428=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8409219833071033428==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/31feeffd69e67590e1410ded429933cc0840859e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
index 98aed16861..eba22f5de2 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -692,7 +692,7 @@ linux-rebuild-with-initramfs: rootfs-cpio
 linux-rebuild-with-initramfs:
 	@$(call MESSAGE,"Rebuilding kernel with initramfs")
 	# Build the kernel.
-	$(LINUX_MAKE_ENV) $(BR2_MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) $(LINUX_TARGET_NAME)
+	+$(LINUX_MAKE_ENV) $(BR2_MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) $(LINUX_TARGET_NAME)
 	$(LINUX_APPEND_DTB)
 	# Copy the kernel image(s) to its(their) final destination
 	$(call LINUX_INSTALL_IMAGE,$(BINARIES_DIR))

--===============8409219833071033428==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8409219833071033428==--
