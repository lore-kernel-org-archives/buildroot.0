Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98172CA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 20:33:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45803606EF;
	Sat, 10 Oct 2026 20:33:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XO0C3cpZNHR1; Sat, 10 Oct 2026 20:33:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 766C360638
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791664421;
	b=RvuOsIxtJy/ole/wMAy8dfWVAKV2PF23n3b4ukPj7rTcc1oHaU0xtPyEPSN3KKi2bBUw
	 /up9cEWk7MYpMEyutWZS4J/9M374cg7Ew777Wk+HYq7KbI6gfRSM66qE0VaPCtrV+Z5eB
	 1COgb+t3pnRGKGEgmdlAWWnGLWzak+QyvSgpEClkDKG5wiBKNGfwkzN/08TfWcKzEKqHh
	 OdcPFr/CHXDdaWCCFaIqv0ob+b8VDhuPt53ECz5Pgt3jRpMR8d2UDX+xcdikulxy9Hnge
	 zxLQdslj99U9FSmQlquiPfh01RyU7XRFj9UlzUtliNsEMn8cT2/U6Zv7opJd8Fe2rlQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791664421;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=mxgdIqMjIgg5sJvG20pE7Ojs9APnnQoqQXg/Dmx7PbU=;
	b=Z2nnsI0vznTeOPAMFQKIQYess0Zw4i9u3IxISQjgVslYx9pue/IxOAqFgiFU5bUy3SZC
	 vJUUDDPkfg7cTQO2UBKVOsclBn1VPJKTzITPtLbZU7LWSS9TVAHgEroU9/+GcxRjM2WAg
	 p9M8drJOQqA96PWfcLpga67VbhRYn8M4ZrBn9/n4LLhPVJiLrtOgntbSH8MP2XQ2O09BB
	 0tE/AyjNH2AyDO4d30Au+nQbQ2HFRDNYU9DGAACWTyD6vmp+Rp+aVGVXzphloL/H4+og+
	 FM843vdIwj0xD3zUy7XmWD/H3YkAkDI7UXW33QpEUXE8RuElCXlZr57NI9fsR/95eyw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791664421;
	bh=mxgdIqMjIgg5sJvG20pE7Ojs9APnnQoqQXg/Dmx7PbU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=p7eu+3J9CFQ128K68kd9BniWIpigjtYL2Z6epZGps0a6yedEsRkXFPF7ZXz2E/zVj
	 DcaJdwCQ+q3mrGQ3BGBWGGNmfjKiB6pxPsVu9vWfqw+CZ57eg07gwSvhlWaW1c6M3x
	 eyd8jwIbUVW9vxmwopQ5+ZdfgVxHy09sJidk5fmiO7IRaW2SV76mwi9J+GJPjHRb+y
	 ZlIbajYajgsPOUq1QicNS0dYqEmc8ETT3xQ+Db6JykUFUSNtEJJHpc6CYek4N5efyf
	 Jn9MFzl8wI49FqmhkMqvdzDFjRvFXSq9oLCkcvuK9lRbTY9QXzurs316P5ZbTON9Dv
	 eT3NH3Xms/fQA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 766C360638;
	Sat, 10 Oct 2026 20:33:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B9D0356
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:33:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0DB4C407F3
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:33:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DeIiCuWJmWf7 for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 20:33:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4ECA4407EE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791664419;
 b=NDipq4cjW5F5R2OBANa7bfA5L+fJDlKPn8jcNKmxHyMkw2qGhiLMQEsVm8kEA8+1hdt3
 O2hlse1Ap/wuKtRYuCy6kc9BPDJZFlkm8m07jxctZarHgk/7rEqTTBfTrjc6sVqaV2/rZ
 sNtIbCBLiKMmCsrCQ4iUQVJK4AxgLMq3rOYdFZqGP0N4lStNI/Ad5Bxz4aldKXbrQoYtM
 vhisbHORt0n7QEFFjK6cUFBTPJa5qDqFyRPFoorpXohTy13QdcLOn4+ZB1gR+4dBuTq2Q
 ix1UauvgX5Mk3JNU55Nf2H803iDBa2OPkq8t4gcwtrVIvc4oJSv/KW8f4pydFVJXiBQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791664419;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=lvcFOmMNGIyEA5bnPIV8SqCjLP79HQ0KsEZpqG84WgM=;
 b=iqYMa2hODBOqfW9fhQ7rmgz1vHx03phdarOYzhtdFqwzIzpffXO+9bL+IMmVuD4TocJy
 bWf/ZEODdMUXXYXwpx37tQbH3rc2Ss0Zn1ThwpdX8xzfaMTk+S85X3f4UVSxtOIgZwsep
 Ffw0A1Ef4mw8F77vjfo4i18MbGG8DPSBO/p96+u4YTkIqit+Oobn7NSwcHSRubBnfAv2V
 9GXep7YcsTEKk0SOfrSrNburGdNCImZZGCj3XsUErHqCAYwMBAv8SHVJudpuB2ik9fCBd
 hMW1QSQ0v/0IJlP+eiOpIL6xt17IDnfMWAF7aoaNj+dPYQbjoqODTBP0nhjKgttsx1A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4ECA4407EE
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:33:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F0CF89354E; Sat, 10 Oct 2026 20:32:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 22:33:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 409b8bf716016f0b94e44e1122bf8b91cf255b50
X-Git-Newrev: 725cea53c7aca562de0869ecf1c89467b3e4bc2f
X-Patchwork-Hint: ignore
Message-Id: <20261010203220.F0CF89354E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/util-linux: fix mount helper
 lookup path
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/725cea53c7aca562de0869ecf1c89467b3e4bc2f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
