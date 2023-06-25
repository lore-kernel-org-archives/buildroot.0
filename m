Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E86BEB64DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 16:51:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 55808401ED;
	Sun, 25 Jun 2023 16:51:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 55808401ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rm0dhL7BznYw; Sun, 25 Jun 2023 16:51:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 92FE040A7F;
	Sun, 25 Jun 2023 16:51:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92FE040A7F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EA4901BF3A8
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 16:51:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C0277414C5
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 16:51:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0277414C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H2xBt-3net7H for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 16:51:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF92D40959
Received: from mx.sberdevices.ru (mx.sberdevices.ru [45.89.227.171])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CF92D40959
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 16:51:42 +0000 (UTC)
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
 by mx.sberdevices.ru (Postfix) with ESMTP id 498685FD05;
 Sun, 25 Jun 2023 19:51:40 +0300 (MSK)
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru
 [172.16.192.107]) by mx.sberdevices.ru (Postfix) with ESMTP;
 Sun, 25 Jun 2023 19:51:37 +0300 (MSK)
To: <buildroot@buildroot.org>
Date: Sun, 25 Jun 2023 19:51:21 +0300
Message-ID: <20230625165121.2112986-1-ovlevin@sberdevices.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230625124848.1423168-2-ovlevin@sberdevices.ru>
References: <20230625124848.1423168-2-ovlevin@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30,
 bases: 2023/06/25 12:44:00 #21575070
X-KSMG-AntiVirus-Status: Clean, skipped
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sberdevices.ru; s=mail; t=1687711900;
 bh=OWHxezmAerV4K6YbO6gy2Wq6PR9Pi1PlapAPnrgnhkg=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
 b=sWwCvZEiff0u6O5oE1gF+E9qrQgLy7AE+TwAX4hQCv+EybZPOP5Jak8nmWQq1GtL4
 C/13AVj94eN7/OKJd4g7jqNywVzjjy6Kf1/aVOSfe+UpOMvOh8sPjCUuP9J27YdKge
 uULwPNdGyXaquWQyYTTScQNvKH7YKre3teGSH0K5xeA08SREnNTeOBMXDKFp2K0iuf
 rx6+IsJqqpHpGLJv6rrm8ZdyutROWrD+wF217K0Xqm+uQuWmP5I7FAR8t7JvO3B+Rh
 XU6CS83mS/8W3sYQr1LiKKJZhc4bzrzuGZDP/1kqFQ3GVM61yHIvkEwVNpqTb3YlK1
 p0ZjukTvwpcNw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=sberdevices.ru header.i=@sberdevices.ru
 header.a=rsa-sha256 header.s=mail header.b=sWwCvZEi
Subject: [Buildroot] [PATCH v2] package/libcgroup: allow to build with musl
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
From: Oleg Lyovin via buildroot <buildroot@buildroot.org>
Reply-To: Oleg Lyovin <ovlevin@sberdevices.ru>
Cc: olegartys@gmail.com, Oleg Lyovin <ovlevin@sberdevices.ru>,
 sdfw_system_team@sberdevices.ru
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libcgroup depends on fts API which is missing in musl libc
and provided by musl-fts package.

This patch makes libcgroup dependent on musl-fts for
non-glibc configurations.

Signed-off-by: Oleg Lyovin <ovlevin@sberdevices.ru>

---
Changes v1 -> v2:
  - remove glibc dependency: checked that libcgroup can be built in all
    the configurations: glibc, musl, uClibc, but requires musl-fts
    for the last two.
    (suggested by Arnout)
  - remove LDFLAGS modification: it seems that autoconf
    automatically searches for a library that provides 'fts_open'.
    (suggested by Yann)
  - changed commit-msg (suggsted by Arnout)
    and rebased onto 'master' branch

glibc, musl and uClibc builds are approved by 'test-pkg' script:
      bootlin-armv5-uclibc [1/3]: OK
      bootlin-armv7-glibc [2/3]: OK
      bootlin-x86-64-musl [3/3]: OK

Signed-off-by: Oleg Lyovin <ovlevin@sberdevices.ru>
---
 package/libcgroup/Config.in    | 7 +++----
 package/libcgroup/libcgroup.mk | 4 ++++
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/libcgroup/Config.in b/package/libcgroup/Config.in
index 03efa71e6b..546b5f3560 100644
--- a/package/libcgroup/Config.in
+++ b/package/libcgroup/Config.in
@@ -1,8 +1,7 @@
 config BR2_PACKAGE_LIBCGROUP
 	bool "libcgroup"
 	depends on BR2_INSTALL_LIBSTDCPP
-	# libcgroup uses <fts.h> which is not included by default in uClibc
-	depends on BR2_TOOLCHAIN_USES_GLIBC
+	select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  libcgroup is a library that abstracts the control
 	  group file system in Linux.
@@ -18,5 +17,5 @@ config BR2_PACKAGE_LIBCGROUP_TOOLS
 
 endif
 
-comment "libcgroup needs a glibc toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_USES_GLIBC
+comment "libcgroup needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
\ No newline at end of file
diff --git a/package/libcgroup/libcgroup.mk b/package/libcgroup/libcgroup.mk
index fb0b646c51..e3de48c561 100644
--- a/package/libcgroup/libcgroup.mk
+++ b/package/libcgroup/libcgroup.mk
@@ -36,4 +36,8 @@ else
 LIBCGROUP_CONF_OPTS += --disable-pam
 endif
 
+ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),)
+LIBCGROUP_DEPENDENCIES += musl-fts
+endif
+
 $(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
