Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E4AFC433F5
	for <buildroot@archiver.kernel.org>; Wed, 22 Dec 2021 08:35:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A54A82F99;
	Wed, 22 Dec 2021 08:35:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id inPle4d0ePCX; Wed, 22 Dec 2021 08:35:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C1A882F4A;
	Wed, 22 Dec 2021 08:35:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0A1731BF2FA
 for <buildroot@lists.busybox.net>; Wed, 22 Dec 2021 08:35:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 772664157E
 for <buildroot@lists.busybox.net>; Wed, 22 Dec 2021 08:35:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YGujFa4hLEJN for <buildroot@lists.busybox.net>;
 Wed, 22 Dec 2021 08:35:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 23E58415D7
 for <buildroot@buildroot.org>; Wed, 22 Dec 2021 08:35:26 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id o12so3789689lfk.1
 for <buildroot@buildroot.org>; Wed, 22 Dec 2021 00:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3X5oForlapGKQRaqVFBc5McXLwG0L/ZLH4q2rW9Hms4=;
 b=RVWnwxZg18g4iXqkPV+zSvICeWFd/t/36aJGDvpDTnoX+vMcQ2Gz+t5esa2dSmW9VA
 lQsbxqWyVFXnUhh8j+1h3yjzaCK93RoPo3VOzAZ5exN3OZxiPueMi3hQhId8qIpcT5dX
 Uq9++JLVpDxZzcIca8aouZnXHyCt4aHvCy5zSGDWfHNycoDunl/IdqofQE30YbciOIjc
 Li+TWBH/W3N3xXRBIbXiI3CeQL4d2ITbqtwAiRQdx4gseI9FdTUVTmPI/qS+e8ouPb/e
 FpRv/1pjt/GTp1aymKof4uSfqOYm/fl+L0f9oNIn5LyAeE/oN59K6DDl4bjtd6oahLhv
 KwEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3X5oForlapGKQRaqVFBc5McXLwG0L/ZLH4q2rW9Hms4=;
 b=Se0keOu1cMwP3LW63r4JjtdH5m+ALcN6gx5tuGZQfUC27bcIYBozxIKlfE3zsbJMgY
 8jNQNQ9o8aEysVxjfM2UDLJYXA6WFu8vknZktH/7LEbWf5ZZLNdKzQAi3Dhs9aQR9d7z
 qeYemmF0fhT+tmqHvUe7UHtWhXCLtbgddgYdi23EtX+608+kNeyxDBc0p0o2DoMMUQch
 Qm5BrCiBRi4oUNcAKv4V7wTj57QeMFkKzwkCjuuG0YY/J4TO9hWjh4jewtdljiB6/QuB
 7rrXFew0RrS1ILjurPk8lpTE9S8d81XjoEE3LThv3pZor6IedbxRciMMiYsgkMNNLj/7
 Zlng==
X-Gm-Message-State: AOAM531NrIAGPe2Gl2s2QIEEa4JxHHZADhwmgp90x6Dr8n3RrRu3Dfa/
 TBa5cIMUp4uHxDzpLhPH83bY+nTXSGM=
X-Google-Smtp-Source: ABdhPJw76adcAxwMbe+BVRkm5tFAQ8ErvaBufzAJ4sAkeOoRmEdCNHhns9ZsFJHhhMiKCK0SMv8NjQ==
X-Received: by 2002:a05:6512:282a:: with SMTP id
 cf42mr1710875lfb.171.1640162123964; 
 Wed, 22 Dec 2021 00:35:23 -0800 (PST)
Received: from localhost.localdomain ([98.128.186.122])
 by smtp.gmail.com with ESMTPSA id x28sm147988lfa.85.2021.12.22.00.35.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 00:35:23 -0800 (PST)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 22 Dec 2021 09:35:14 +0100
Message-Id: <20211222083515.1150267-2-troglobit@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211222083515.1150267-1-troglobit@gmail.com>
References: <20211222083515.1150267-1-troglobit@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/2] package/makedevs: allow recursive on
 directory with symlinks
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Joachim Wiberg <troglobit@gmail.com>,
 Matt Weber <matthew.weber@collins.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When using BR2_ROOTFS_DEVICE_TABLE to change ownership of /etc, like so:

  /etc        r  -1 root     wheel     - - - - -

makdevs fails due to it trying to chown() a symlink:

  makedevs: chown failed for /src/myLinux/output/build/buildroot-fs/ext2/target/etc/mtab: No such file or directory
  makedevs: line 25: recursive failed for /src/myLinux/output/build/buildroot-fs/ext2/target/etc: No such file or directory
  make[2]: *** [fs/ext2/ext2.mk:63: /src/myLinux/output/images/rootfs.ext2] Error 1
  make[1]: *** [Makefile:84: _all] Error 2
  make[1]: Leaving directory '/src/myLinux/buildroot'

This patch changes chown() to lchown() in two cases in makedevs.c when
the argument can be a symlink.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/makedevs/makedevs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/makedevs/makedevs.c b/package/makedevs/makedevs.c
index c57b964f5c..634ae7c3d8 100644
--- a/package/makedevs/makedevs.c
+++ b/package/makedevs/makedevs.c
@@ -440,7 +440,7 @@ void bb_show_usage(void)
 int bb_recursive(const char *fpath, const struct stat *sb,
 		int tflag, struct FTW *ftwbuf){
 
-	if (chown(fpath, recursive_uid, recursive_gid) == -1) {
+	if (lchown(fpath, recursive_uid, recursive_gid) == -1) {
 		bb_perror_msg("chown failed for %s", fpath);
 		return -1;
 	}
@@ -628,7 +628,7 @@ int main(int argc, char **argv)
 				if (mknod(full_name_inc, mode, rdev) < 0) {
 					bb_perror_msg("line %d: can't create node %s", linenum, full_name_inc);
 					ret = EXIT_FAILURE;
-				} else if (chown(full_name_inc, uid, gid) < 0) {
+				} else if (lchown(full_name_inc, uid, gid) < 0) {
 					bb_perror_msg("line %d: can't chown %s", linenum, full_name_inc);
 					ret = EXIT_FAILURE;
 				} else if (chmod(full_name_inc, mode) < 0) {
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
