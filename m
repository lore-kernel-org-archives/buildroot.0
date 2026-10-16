Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB02DCC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:10:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C95160FEE;
	Fri, 16 Oct 2026 13:10:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W6YFnyG83MIb; Fri, 16 Oct 2026 13:10:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1F74260FD8
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156238;
	b=LDQOUPkWNKitk2NOvWmNYV8a3I3pK+H+VDA6KernnVCC1aTbUV63PCE6b5C5/U3OBR3S
	 3y0Z9nk0vU887ThtRgUVH4w0ZO7hBkeMKaHDb3Aorew93zV82PS12nkeNGxpWkNz9LD7N
	 hc95yb+xYo5eYZOQ399QEfDvMhYfNkmLdymVbkxiZ9yV7AwVdHQBoMheiKRMqsTya8rvX
	 W1ewrmLZRTfnfMh7z5V5RyA3AD0Atb6hu5eUHa9JgQflQ4cwnq6lSPZjSw95YilslXod2
	 iLEOBQmvdJURFXqDJqFSxtI5dBbNQTEJsjn/n3YYiK9T7+dWkkVfY05okz0bn/h/DRA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156238;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=fgBehwRPYY9WUhcPunL/PYyLcgWhD6J5qFoQN3egV/4=;
	b=BZK3dKmL1/6kNxQKBxALYR2YXYOHGcDYkKrL4nXxuQ0eXPXj4/C6R/82XoH3TgN1BPln
	 OLiiZQIa7LBIYMY+7B1Z0T5TtJtJ+nngUWR6zmSsh/yo+BY8mwdViyGNptpA5i8B5zW5j
	 ObKK9cqv8NlxqmGjG4M2/juVpSyZSNPLxy9SgeewDc41VYtsLPQC8FGKFwQEw+3t0Mni/
	 CuFZxiYbW7zWizFhpydm1xiY5rmn7mUfTPJminUTEcY9OOjuFe+7Th9FoRhNqXIL7bRmy
	 HqbUkUluDekf/1sExYDSHMQQ7yRac1uppDLXAoMlwZrbaDXPvFNOaTsV6PQgU6XpGhA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156238;
	bh=fgBehwRPYY9WUhcPunL/PYyLcgWhD6J5qFoQN3egV/4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Zdb4lsjankvznp5pmakWY6+m1gc/upkzgC3OP/tMU/lUOwyFBSms9sQ7R0x4bQ9wt
	 MS1RcPYOJAaXS46E0+hCboImtiGRtrG4mn6Eq3758QFgJsc6eZtatW3jC3G1grTe9v
	 2r7iEPsj0hhC1h9uKSAR2KOvO5zIlKWzBXsYZwe9ZJ48XdlKoNvmqyKpe068Zd6N5M
	 K7UQJt2+iIeX6LplFk5OLd/upfuebUBL5CH805Xj4fJUs+OdwmlrLAutoqXEjYHyzI
	 acYPrMxf88YZZCQX6jse7zD1lXknUhPAYaXTo+40Yb87iK6xhT7y4dqWExgi5K866W
	 dygsOSZieLu1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F74260FD8;
	Fri, 16 Oct 2026 13:10:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 17582769
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F1A0680772
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lnAE9OQJ-Zz6 for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B520E8150C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156108;
 b=QYI4BYFTWIMJWbxZnXGQ5O/nP36fgsZEloDMOaKUYxoK7z6ofNL7vxZUEQo+h7Bb2iFT
 NSKct9ZMm0E4hNyd9+y4X8WwBNG++I/IhoQCAHBynzUu5QZZDQlfJVc/iyT95mbc+K5gY
 noxXL7cdJqs/8Jorj7U3W5MyzlVGZOTeYjG43GC9OA+hj9npVq52D8T5gQpQiqME5Iv8f
 Mzc9COoERgIVMFmpphwLsduTwx/e5f04+xbTep05qRSQzFjzO8cwqJJ+5MHsehzOZ5T62
 /KzTAdWutuo+tjxrPK6xpYt5bpMVcB6wFEyFkXEJj7tXxfmagqSff8/xPiWVd4pKnqQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156108;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=6MG6Acp3hrX5Mj/HORg1RVsfk+MQougn7mtNR573rVQ=;
 b=IxX6CdaB4d3z2ELuBlL28Y3235VkUQ2Vb4pMBR/F27U5Sf0lYwNlcHgO4S62ok9PsRxN
 dBHWi2wuDpUWgwWdxyxzGyNKTKG+mqhRCNtKwekdwKQ08xZPdKeJsHFTj7CqeAhaRaUtq
 5iO4+YrxsrlQZ7nD7eE3Wp9ohQ2SIB6f+ZCdSlIpKd9Osou6ZDBjXZl+DM2zcwZgsj1Bo
 0dOtlXZCYeUI9wYrIj1axLI7BP93+ypPTQ04One2fPhsSIbGxTarBtEuqRkZheU0xtpYp
 g50Vrnvov8q3a+DWo/C7vOBKCzblDincTg0q09VYR+h589EECMaWX6BifOAJMXUigmw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B520E8150C
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A6449960D7; Fri, 16 Oct 2026 13:07:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:52 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 6f3491dcf05e992fd878ee841e8144c052c8c130
X-Git-Newrev: a2a640807699ad8cb5161b7c574f4d5aca412fc5
X-Patchwork-Hint: ignore
Message-Id: <20261016130707.A6449960D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/util-linux: fix
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1084499798089498942=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1084499798089498942==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a2a640807699ad8cb5161b7c574f4d5aca412fc5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
index 9e56894611..d7cb265700 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -71,7 +71,8 @@ UTIL_LINUX_CONF_OPTS += \
 	--disable-makeinstall-chown \
 	--disable-poman \
 	--disable-rpath \
-	--disable-year2038
+	--disable-year2038 \
+	--enable-fs-paths-default=/sbin:/usr/sbin
 
 UTIL_LINUX_LINK_LIBS = $(TARGET_NLS_LIBS)
 

--===============1084499798089498942==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1084499798089498942==--
