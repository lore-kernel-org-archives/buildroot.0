Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E74C982DC
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 11:58:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F22340B7E;
	Fri, 18 Sep 2026 11:58:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TDeiB066Of8z; Fri, 18 Sep 2026 11:58:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0121340B42
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789732728;
	b=BH2+wmce0kGfx4TVu1bfr7pG5rW0+kh5iAQ/oVCNvTiRlVBLmyQt8Yc7C0pkEKbKfA/x
	 QTUg4qSJwh/OetWSgOPtJxBfHIh+mTJZB2QANU+gNv82OKzng5rqbtBtPFVrtUY/c2MD1
	 xuLi+zmU7jB5Q1fi/KIufG7eeRdPTnnpKlizeXtLwN5KB/JeIOPOACAOMy/sEsWDK+JYl
	 kUN1uxI3Gxfw+Rq2StzLNr8LekQJ2OCgVDHV6nA8dTGVCuuwvEXyiQxjdyv3zMM858V1g
	 tENFpL6yxZuBpXO7Vqp+tZRnvY8mZr63qbh+2s6fTwIr4PeUquCjumJ+xtao+EJfo5g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789732728;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ibvNbPO5NhRlO1DYWFbDBwlUSLK/M5542EO1UTm7b1Q=;
	b=iXIO92XfFE3i92HpRkFkW3CyjOmsvFpMGoBUtICsAY5ybhyjrAdi86ZezC1OwNh3+7c4
	 cCz6ZK63qlT+cTgYeRoWrpmFQodS69ce3tHwO/3a0OryOq+HNkGiu/mMYFOFmMv2Q8VPb
	 5sv3uCng6F1/tpe7K+T25CTQ9ilCJQhZhDjbW9yk98vZM3j2km/8zj0g0fjzzI2uGEEGe
	 jrU1/ffx7X40OROTVsgV9Y8zq6o2YX0hCSbLOcg1CbPBrYvCJ+G6C3Oaq06yXjWzTFZ4H
	 sdOhtvODl9dCR71FZuOH3CYcAIHkWDvDUiIpMacpmHojIBhrqh8WjZET/8nJn8EXsFQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789732728;
	bh=ibvNbPO5NhRlO1DYWFbDBwlUSLK/M5542EO1UTm7b1Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JXPsqjf2KoMYNV+1/dINwu6daFWFN6I3Rxw6LcZifXKozZAlT7zXjsKiOMzypnSMk
	 dw+9yQxoLQ2oZoubeSV4bQQ4ZbtKgg9zsiQ2m6ZcTTA4ikv1AbioT5iInjf9ioC8eV
	 aAfed4tbNp678bE/A97U/XGHzsEMvwPujZlEjUUf+3uufAE+WevDBUt4ec+tPglGOM
	 C336GqYwMC1qNs9pk43a1N2ug9OxRQLrUP8blKl1IYU5xJWCjGPYB99D9DGbTH97/t
	 aKQ/TjSor7pl79tAtiLQboP6sSkGHc9SvpWk8ZZkezH0bvPg2xEzvs++9tWv8MNudd
	 GnLqoLQUCtDGQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0121340B42;
	Fri, 18 Sep 2026 11:58:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 90CA242D
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 11:58:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 76EE240B42
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 11:58:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JrdPEHCUGTjh for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 11:58:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org AB61340B2C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789732725;
 b=A4U10m3yBJez84GYQ0LRVNLxUDBy5R4Aei0LZXwTGSFQ/b0WDqBj1QzaCWRjVVSUTdiN
 ikYwZhiURhQkvOA8LD4GHBr2Vv1eP+O4tS/f3hNZRZzVmWRwa07fuoPL199qFcBpAHJKy
 JVEVaoObDm6DzCzzpbmJS18tGrIV1uULWC9bq8ows7yCYKJJWoWUeAz3TTM1S+4sabTc1
 UFAmq6lrWOfZTqV9aCiLkqq7T2YH9fzrh1W18X/Ex7ksWp/9GMb6F9ZLnKZKBxhgBvhtE
 2TrYaelXNGOJg0HRViSbjDWTzPoyQeF9PPd+vnQawnWNZHgxA//+nl6wGDW5/lzlmRg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789732725;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=DryLXF8Y5GdvYy3psizT3WWF5lK4NqzakPKx9HeIJfc=;
 b=FpPXHkPpPiNcAYyuMsuDkpt0zvR0SBNHDnIitvEADSu0GVyStPVjzqBinHCH1CNvMZvE
 jCMGlHlLvFU8wQmhNkZTk8S4Kk/MxZxNjYomuOyTPFyyimNQrOQJfDowNB1uUWMdUMgiT
 hnGYpEJYv8dmfrApTTGvAeIXDFORPrN+M3/RQTwkZDSroVo0Ar+4AUeChcofpMCpE7nH9
 w9IaWFTLNAB9PqoPRJRXbwplq8r/tcHk7dUBqaODgVIbDy2J5C4kc+7MBoVlGn7KXyZGU
 VdSXxmzneXEKmbgiLT2oxiy6m0V/Y5UMqofeu8pf22/LqW3b/NhjR3ykVyv9lW05oZA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB61340B2C
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 11:58:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5AAD097466; Fri, 18 Sep 2026 11:57:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 13:56:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 72cb1abbcd768c42333125b399b6598923bcaf59
X-Git-Newrev: 86a56dcc17cc540c08cc4760af9481636016550d
X-Patchwork-Hint: ignore
Message-Id: <20260918115738.5AAD097466@busybox.osuosl.org>
Subject: [Buildroot] [git commit] linux/linux.mk: forcibly (re)enable Make
 jobserver for linux-rebuild-with-initramfs target
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/86a56dcc17cc540c08cc4760af9481636016550d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
