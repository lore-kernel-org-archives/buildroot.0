Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B948C433F5
	for <buildroot@archiver.kernel.org>; Fri, 29 Apr 2022 19:15:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C40960F88;
	Fri, 29 Apr 2022 19:15:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IfknOte5SEOV; Fri, 29 Apr 2022 19:15:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B91E60D5A;
	Fri, 29 Apr 2022 19:15:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EE6CC1BF30B
 for <buildroot@lists.busybox.net>; Fri, 29 Apr 2022 19:15:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB926400BB
 for <buildroot@lists.busybox.net>; Fri, 29 Apr 2022 19:15:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SeispqoRwlBb for <buildroot@lists.busybox.net>;
 Fri, 29 Apr 2022 19:15:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A6620400A8
 for <buildroot@buildroot.org>; Fri, 29 Apr 2022 19:15:36 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id z18so10366895iob.5
 for <buildroot@buildroot.org>; Fri, 29 Apr 2022 12:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kFESH79jspa0hRAJTqamUOjMuHhGV0NsVJyjjIr54G8=;
 b=NjcjRg7AImoGSjasq2g7c0ivxLCNJJZkQfD7EE9CQDT+V0VlI1nBtpQxaCypu9/PUL
 OuyxhsK+iglPzSQku8ESbEh4TWKNRqk/V07Z6+JGBVExWMqnKM9TUDuvl+tN1/cITaX9
 N+WPVCAv6bXrsau3EjhV23rgg8+7+oZCLYT+QHn3kHa82pbU4dWRBqh0oupWIpkQuM7Q
 JgUz8pS/o8qKNxxd4ADO0Cq/0B1LURigqqK2PTo+w6GbhYtZlljHeWpPU9m/YAssf8Ue
 X+LI/V8R/0AhvDIBBdhMlI7o7VQu9MdSOr2XiFZEq8hUveOWg3M0SvPYRymV7KHJMdZr
 7ZKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kFESH79jspa0hRAJTqamUOjMuHhGV0NsVJyjjIr54G8=;
 b=04FkKQ39hSHvMczw47FLXaBoj1BJ5NKQua75dWOFoq2IWobH3v63ZuweUiR7nOKyY4
 tjpF3nHUE0/QXEgZRulQ1fokRu5xHxwQ0rN3OiSBwncbdj8a0YKvGCtOQ6TzTk1YefCp
 gVAujjFWackaKzGmJW28/06fCU1/Sq9FnvV9jcFkkP5CICwnkex9vjEmqjKOguuQlRbp
 FPcUxuVNVewM9rKRqY3Jg3kugiLFCLE3dQDb5Qp6dZGJC/lX+eNyUqwMz45MpesgFJLy
 6pZunzzdRCgEPfaPKFJgq6NK9R/2FY+YS4eezMXnbfWFAffM92cB5fasjKVDEVNbgToh
 dNAg==
X-Gm-Message-State: AOAM531qb0/XUkdY+TFaY869Nyoadj4oVpjjkYxxztETzEzgloT7/XQq
 Dd2lVVkE+6dF8MybHB2C2KFG4Sw9+RY=
X-Google-Smtp-Source: ABdhPJxva5NNiQ6GdG4Nf7lOyI14fCtbnqoS+aSw66VQSk0RSY4W1HUxiRwZ0ZJ/fHThqTuus3vhqg==
X-Received: by 2002:a05:6638:d4c:b0:32b:16b0:f86 with SMTP id
 d12-20020a0566380d4c00b0032b16b00f86mr350117jak.308.1651259735614; 
 Fri, 29 Apr 2022 12:15:35 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 w27-20020a02cf9b000000b0032b3a7817aasm789331jar.110.2022.04.29.12.15.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 12:15:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 29 Apr 2022 13:15:31 -0600
Message-Id: <20220429191531.4173116-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] utils/genrandconfig: increase default
 target rootfs size to 5G
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since there isn't a way to reliably compute the required size lets
just set it to what should be a high enough value to not run out
of space.

Fixes:
 - http://autobuild.buildroot.net/results/a3c68cdc515353c0d2650ee743aa3bd8ab99a418
 - http://autobuild.buildroot.net/results/ad426ff903d78a92de8f0208876e2196136a09a8

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 utils/genrandconfig | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index adefb8f502..ab1f6f43b1 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -200,6 +200,8 @@ def fixup_config(sysinfo, configfile):
     with open(configfile) as configf:
         configlines = configf.readlines()
 
+    ROOTFS_SIZE = '5G'
+
     BR2_TOOLCHAIN_EXTERNAL_URL = 'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/'
 
     if "BR2_NEEDS_HOST_JAVA=y\n" in configlines and not sysinfo.has("java"):
@@ -441,6 +443,16 @@ def fixup_config(sysinfo, configfile):
         configlines.remove('BR2_TARGET_OPTEE_OS=y\n')
         configlines.remove('BR2_TARGET_OPTEE_OS_PLATFORM=""\n')
 
+    if 'BR2_TARGET_ROOTFS_EXT2_GEN=y\n' in configlines and \
+       'BR2_TARGET_ROOTFS_EXT2_SIZE="60M"\n' in configlines:
+        configlines.remove('BR2_TARGET_ROOTFS_EXT2_SIZE="60M"\n')
+        configlines.append('BR2_TARGET_ROOTFS_EXT2_SIZE="%s"\n' % ROOTFS_SIZE)
+
+    if 'BR2_TARGET_ROOTFS_F2FS=y\n' in configlines and \
+       'BR2_TARGET_ROOTFS_F2FS_SIZE="100M"\n' in configlines:
+        configlines.remove('BR2_TARGET_ROOTFS_F2FS_SIZE="100M"\n')
+        configlines.append('BR2_TARGET_ROOTFS_F2FS_SIZE="%s"\n' % ROOTFS_SIZE)
+
     if 'BR2_TARGET_S500_BOOTLOADER=y\n' in configlines and \
        'BR2_TARGET_S500_BOOTLOADER_BOARD=""\n' in configlines:
         configlines.remove('BR2_TARGET_S500_BOOTLOADER=y\n')
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
