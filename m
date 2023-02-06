Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E53EC05027
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 17:15:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C3F880AAB;
	Mon,  6 Feb 2023 17:15:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C3F880AAB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Po8ux-w6h6nj; Mon,  6 Feb 2023 17:15:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B152481934;
	Mon,  6 Feb 2023 17:15:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B152481934
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 67CF11BF338
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 17:15:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2CBF7410B8
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 17:15:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CBF7410B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CgjXnqDfFKih for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 17:15:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E494401D2
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8E494401D2
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 17:15:51 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id bk16so11052213wrb.11
 for <buildroot@buildroot.org>; Mon, 06 Feb 2023 09:15:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UFcZeUfg/mEoJaea8zLfKPL58SgiYk9hdHCCA5IRPuw=;
 b=lGKzWfbuPJLPUwdJtHgi4r2gQ6pB5A5VxmBWQ2wdFXfncizq7d1v5tG/sCcIX3adNA
 90fIjh7pxcxHhVQEjyNyxIZQze3sIOUkEUkNQMD0Ue8Zifpsfwo+kE1D7xkG1MgWzv4F
 63uLO9kL2QTykO4cvkmA+rpNC4l5jBMBTIklZsqTJjSFqVYo1AKhZfvqvjgj1xhX19eJ
 yxUedT7PptiFbAHsk6d9W6rcVuL2A2JuETqmW0h9r3fRtkGOm6N1IA5WdynmLqHPuwtc
 udYvkYtsaY7G4UTFvOFGF3RswEXtLmKKwBBDXX6KkybVWDzBK55Y78YUfeXmLKm1H/Ym
 3sHQ==
X-Gm-Message-State: AO0yUKWOud5oqxT+jjQoESVbz7hFhSMEL1oXOIBSj1/sWa3QZaUHKmNO
 YuvOvmNTJPUSkEWVP+3uDCqfa9yAhiA=
X-Google-Smtp-Source: AK7set+FZ8eWFjh5bjyloyIng05pqTd5FNl42PNLUtiLDThYJpn0cmYwCm6m20zOIro2XR8lqyl6ng==
X-Received: by 2002:adf:f4d2:0:b0:2bf:cd20:bdb7 with SMTP id
 h18-20020adff4d2000000b002bfcd20bdb7mr259043wrp.64.1675703749338; 
 Mon, 06 Feb 2023 09:15:49 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 p10-20020a5d59aa000000b002be5401ef5fsm9474527wrr.39.2023.02.06.09.15.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 09:15:48 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  6 Feb 2023 18:15:44 +0100
Message-Id: <20230206171544.35665-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UFcZeUfg/mEoJaea8zLfKPL58SgiYk9hdHCCA5IRPuw=;
 b=mNGBjNLpVkHw3OlYUN2EmgbveiF+4AQA9sDog9h9i1KJSuNaL9rLFmmRJlzBllYFhe
 0+tpYgL28PcUa+Xnstb8XX5HBpHYHZ1hNlO3mubkKQ5zL6oZp1S/49XDiBUEgfRxlnWh
 4bnQvUcJN3hgA3DXONx7HM42KlBmCtc2z/cecVcX93SMYRcNTTqgk56BhY25+8ERH+Xn
 MuaeVCqHJHd5TRCw3f4P7xEpMys94dbwa/QGglVTgXOSgQEHTy5H1FdqHz8hsuDv/gag
 kKDEyU+m05fVG3FbsPylSGfaxHTNLxxtn+H2+QMQvEgQGVX4nKUaPbXkHDrSWlZhIwHG
 AnQQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=mNGBjNLp
Subject: [Buildroot] [PATCH 2020.02.x] package/lxc: fix CVE-2022-47952
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

lxc-user-nic in lxc through 5.0.1 is installed setuid root, and may
allow local users to infer whether any file exists, even within a
protected directory tree, because "Failed to open" often indicates that
a file does not exist, whereas "does not refer to a network namespace
path" often indicates that a file exists. NOTE: this is different from
CVE-2018-6556 because the CVE-2018-6556 fix design was based on the
premise that "we will report back to the user that the open() failed but
the user has no way of knowing why it failed"; however, in many
realistic cases, there are no plausible reasons for failing except that
the file does not exist.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ching-an-incoming-CVE-CVE-2022-47952.patch | 73 +++++++++++++++++++
 package/lxc/lxc.mk                            |  3 +
 2 files changed, 76 insertions(+)
 create mode 100644 package/lxc/0005-Patching-an-incoming-CVE-CVE-2022-47952.patch

diff --git a/package/lxc/0005-Patching-an-incoming-CVE-CVE-2022-47952.patch b/package/lxc/0005-Patching-an-incoming-CVE-CVE-2022-47952.patch
new file mode 100644
index 0000000000..071734848a
--- /dev/null
+++ b/package/lxc/0005-Patching-an-incoming-CVE-CVE-2022-47952.patch
@@ -0,0 +1,73 @@
+From 1b0469530d7a38b8f8990e114b52530d1bf7f3b8 Mon Sep 17 00:00:00 2001
+From: Maher Azzouzi <maherazz04@gmail.com>
+Date: Sun, 25 Dec 2022 13:50:25 +0100
+Subject: [PATCH] Patching an incoming CVE (CVE-2022-47952)
+
+lxc-user-nic in lxc through 5.0.1 is installed setuid root, and may
+allow local users to infer whether any file exists, even within a
+protected directory tree, because "Failed to open" often indicates
+that a file does not exist, whereas "does not refer to a network
+namespace path" often indicates that a file exists. NOTE: this is
+different from CVE-2018-6556 because the CVE-2018-6556 fix design was
+based on the premise that "we will report back to the user that the
+open() failed but the user has no way of knowing why it failed";
+however, in many realistic cases, there are no plausible reasons for
+failing except that the file does not exist.
+
+PoC:
+> % ls /l
+> ls: cannot open directory '/l': Permission denied
+> % /usr/lib/x86_64-linux-gnu/lxc/lxc-user-nic delete lol lol /l/h/tt h h
+> cmd/lxc_user_nic.c: 1096: main: Failed to open "/l/h/tt" <----- file does not exist.
+> % /usr/lib/x86_64-linux-gnu/lxc/lxc-user-nic delete lol lol /l/h/t h h
+> cmd/lxc_user_nic.c: 1101: main: Path "/l/h/t" does not refer to a network namespace path <---- file exist!
+
+Signed-off-by: MaherAzzouzi <maherazz04@gmail.com>
+Acked-by: Serge Hallyn <serge@hallyn.com>
+
+[Retrieved from:
+https://github.com/lxc/lxc/commit/1b0469530d7a38b8f8990e114b52530d1bf7f3b8]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/lxc/cmd/lxc_user_nic.c | 15 ++++++---------
+ 1 file changed, 6 insertions(+), 9 deletions(-)
+
+diff --git a/src/lxc/cmd/lxc_user_nic.c b/src/lxc/cmd/lxc_user_nic.c
+index a91e2259d5..69bc6f17d1 100644
+--- a/src/lxc/cmd/lxc_user_nic.c
++++ b/src/lxc/cmd/lxc_user_nic.c
+@@ -1085,20 +1085,17 @@ int main(int argc, char *argv[])
+ 	} else if (request == LXC_USERNIC_DELETE) {
+ 		char opath[LXC_PROC_PID_FD_LEN];
+ 
+-		/* Open the path with O_PATH which will not trigger an actual
+-		 * open(). Don't report an errno to the caller to not leak
+-		 * information whether the path exists or not.
+-		 * When stracing setuid is stripped so this is not a concern
+-		 * either.
+-		 */
++		// Keep in mind CVE-2022-47952: It's crucial not to leak any
++		// information whether open() succeeded of failed.
++
+ 		netns_fd = open(args.pid, O_PATH | O_CLOEXEC);
+ 		if (netns_fd < 0) {
+-			usernic_error("Failed to open \"%s\"\n", args.pid);
++			usernic_error("Failed while opening netns file for \"%s\"\n", args.pid);
+ 			_exit(EXIT_FAILURE);
+ 		}
+ 
+ 		if (!fhas_fs_type(netns_fd, NSFS_MAGIC)) {
+-			usernic_error("Path \"%s\" does not refer to a network namespace path\n", args.pid);
++			usernic_error("Failed while opening netns file for \"%s\"\n", args.pid);
+ 			close(netns_fd);
+ 			_exit(EXIT_FAILURE);
+ 		}
+@@ -1112,7 +1109,7 @@ int main(int argc, char *argv[])
+ 		/* Now get an fd that we can use in setns() calls. */
+ 		ret = open(opath, O_RDONLY | O_CLOEXEC);
+ 		if (ret < 0) {
+-			CMD_SYSERROR("Failed to open \"%s\"\n", args.pid);
++			CMD_SYSERROR("Failed while opening netns file for \"%s\"\n", args.pid);
+ 			close(netns_fd);
+ 			_exit(EXIT_FAILURE);
+ 		}
diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
index 7994dffcf5..881869969d 100644
--- a/package/lxc/lxc.mk
+++ b/package/lxc/lxc.mk
@@ -13,6 +13,9 @@ LXC_INSTALL_STAGING = YES
 # We're patching configure.ac
 LXC_AUTORECONF = YES
 
+# 0005-Patching-an-incoming-CVE-CVE-2022-47952.patch
+LXC_IGNORE_CVES += CVE-2022-47952
+
 LXC_CONF_OPTS = \
 	--disable-apparmor \
 	--disable-examples \
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
