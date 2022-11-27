Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34FA4C4321E
	for <buildroot@archiver.kernel.org>; Sun, 27 Nov 2022 13:12:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF00C81B35;
	Sun, 27 Nov 2022 13:12:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF00C81B35
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IXWIzos-cdzx; Sun, 27 Nov 2022 13:12:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0621A81B14;
	Sun, 27 Nov 2022 13:11:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0621A81B14
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5DC231BF42C
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 13:08:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 471C5400D0
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 13:08:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 471C5400D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q6nw_AncLHOE for <buildroot@lists.busybox.net>;
 Sun, 27 Nov 2022 13:08:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E1EA400B8
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8E1EA400B8
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 13:08:50 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id n205so9046850oib.1
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 05:08:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n6oRyXAAeTUDvl9Suu1BQycOsqaseWCKk11ppfJd6Bo=;
 b=YWix/1M/3HW4Be+iU25d+QXMTEJZFWtQMDZjca+yLmWJ2mKuGCDyGMGfQRWFlBaVMg
 35ORYT8YJlCLx3wWRRirxerKiFPhucGr8cYOK0zqCeyimBa0JfHYFqQl+yEvsKvE1Lrg
 +SOvv0xtrQooymWlpX3mLWQMFEN05HWumC3Yl7KZpyqWbWXYXpttUk8Cu2s7UdiQbJRY
 azEZHJT6rO9yQPXmPcsXrmwtcNkcFhF8PCY4+Lt488FZUoI13Jgd2Q+zoNUMjNAegHR2
 DEucPoErSp8ZlV0oTRD27qjfVglR2ynCBxlpF+E9nDZv6SZrabBINyJEzEzbdDRo8XJC
 Lz2g==
X-Gm-Message-State: ANoB5pnNc2Ftsb6c1+0TWf5qBi86CzB88zQnBcbQ3cFtVB17gAsBJzBW
 bfZ6zrTLj0ZRPm7fQyYuf9CPKXax38o=
X-Google-Smtp-Source: AA0mqf5Ajpq5RBHeEwPuQg9x3ttBJcvEkLJlkx73KqDzp5aZx8Kkq+aeQWkaHAgBUS+pLej98Drgwg==
X-Received: by 2002:a05:6808:8c9:b0:351:1a63:a74c with SMTP id
 k9-20020a05680808c900b003511a63a74cmr13649085oij.288.1669554529673; 
 Sun, 27 Nov 2022 05:08:49 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:7980:988a:9b54:d73e:4d8c:458c])
 by smtp.gmail.com with ESMTPSA id
 i25-20020a9d6519000000b0066a9ba5094fsm3655102otl.1.2022.11.27.05.08.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Nov 2022 05:08:48 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Nov 2022 10:07:32 -0300
Message-Id: <20221127130739.1862398-19-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221127130739.1862398-1-ricardo.martincoski@gmail.com>
References: <20221127130739.1862398-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n6oRyXAAeTUDvl9Suu1BQycOsqaseWCKk11ppfJd6Bo=;
 b=fRgVm4AoMSodbekoaYfK5fVojMysN2TgieG9Ynz/QvYdg1+jLShjtYm340ArGuBurG
 baTa1EGq/3WEYr5V6FDp3Bukf2LD+pDXpNKTtLX1eeVioSE+hcc/BHfp0G3QMdkaAJH6
 7l2gNj3IzB+PiEPriDAkNjrGMdi/ZKVpuWmyirteVq2KzHsuYRjqMuzr8AJ+ayi0aL5E
 EogF679xW8AbMUQ3EBHjH64OAa3t4UzefuVb7AeTdpZZj4G3f7dniK627GSLvcsXIo40
 sg95wFir8UtydukrA6e8+MSUWzTHNZbjH6XnQZu/f+jtm7jXNdCdl8BBNpQncIPeichE
 r6rg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=fRgVm4Ao
Subject: [Buildroot] [next 18/25] package/openpowerlink: properly handle
 legacy options
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit "b1063a0136 package/openpowerlink: bump to v2.2.2" tried to add
legacy handling but the new symbols are part of a choice, and Kconfig
does not enforce the select of a option from a choice.

Update the legacy entry for 2016.02, following the example described in
the beginning of the file.

Cc: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
test config 1:
BR2_PACKAGE_OPENPOWERLINK_LIBPCAP=y
BR2_PACKAGE_OPENPOWERLINK=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y

test config 2:
BR2_PACKAGE_OPENPOWERLINK_KERNEL_MODULE=y
BR2_PACKAGE_OPENPOWERLINK=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_LINUX_KERNEL=y
---
 Config.in.legacy                | 6 ++++--
 package/openpowerlink/Config.in | 2 ++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 9ce1004b0c..e489458270 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -4313,19 +4313,21 @@ config BR2_PACKAGE_OPENPOWERLINK_DEBUG_LEVEL
 config BR2_PACKAGE_OPENPOWERLINK_KERNEL_MODULE
 	bool "openpowerlink package has been updated"
 	select BR2_LEGACY
-	select BR2_PACKAGE_OPENPOWERLINK_STACK_KERNEL_STACK_LIB
 	help
 	  openpowerlink kernel modules are built if the
 	  kernel stack library is selected.
+# Note: BR2_PACKAGE_OPENPOWERLINK_KERNEL_MODULE is still referenced from
+# package/openpowerlink/Config.in
 
 config BR2_PACKAGE_OPENPOWERLINK_LIBPCAP
 	bool "openpowerlink package has been updated"
 	select BR2_LEGACY
-	select BR2_PACKAGE_OPENPOWERLINK_STACK_USERSPACE_DAEMON_LIB
 	help
 	  The user space support has been split in two part:
 	  - a monolithic user space library
 	  - a user space daemon driver
+# Note: BR2_PACKAGE_OPENPOWERLINK_LIBPCAP is still referenced from
+# package/openpowerlink/Config.in
 
 config BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	bool "using the linux headers version for the kernel has been removed"
diff --git a/package/openpowerlink/Config.in b/package/openpowerlink/Config.in
index 1a3dd62acd..ef59a04baf 100644
--- a/package/openpowerlink/Config.in
+++ b/package/openpowerlink/Config.in
@@ -38,6 +38,8 @@ endchoice
 
 choice
 	prompt "stack type"
+	default BR2_PACKAGE_OPENPOWERLINK_STACK_KERNEL_STACK_LIB if BR2_PACKAGE_OPENPOWERLINK_KERNEL_MODULE # legacy
+	default BR2_PACKAGE_OPENPOWERLINK_STACK_USERSPACE_DAEMON_LIB if BR2_PACKAGE_OPENPOWERLINK_LIBPCAP # legacy
 
 config BR2_PACKAGE_OPENPOWERLINK_STACK_MONOLITHIC_USER_STACK_LIB
 	bool "linked into application"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
