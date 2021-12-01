Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31953C433F5
	for <buildroot@archiver.kernel.org>; Wed,  1 Dec 2021 09:52:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4E7081D47;
	Wed,  1 Dec 2021 09:52:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nsf2Hv-zm2Aw; Wed,  1 Dec 2021 09:52:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D878A81CD0;
	Wed,  1 Dec 2021 09:52:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 572381BF59F
 for <buildroot@lists.busybox.net>; Wed,  1 Dec 2021 09:52:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 46F7F408F4
 for <buildroot@lists.busybox.net>; Wed,  1 Dec 2021 09:52:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t8yJSN_RID_0 for <buildroot@lists.busybox.net>;
 Wed,  1 Dec 2021 09:52:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 055D7408F1
 for <buildroot@buildroot.org>; Wed,  1 Dec 2021 09:52:31 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id j21so24503947ila.5
 for <buildroot@buildroot.org>; Wed, 01 Dec 2021 01:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lkmWRiQZCvaytXVBILDUhe6m1vALu1tQC0JhrJq6ZTM=;
 b=QoYBd6gqPfjVgwVatlMOmm+ZRwSkLv6NaMpOnLvg8Qi1biS0VVL755z1xIWVAglWoP
 TArVOGcOHpp0sFGL1+eVdNkbVTQBPt9gSVGHvg1BB1adaxBJTDWzQVtNgtBjluXYjLQF
 tx0iTNVLxGttyctQ+fOvjqCJMIWhBfjzDwH0DBtFiWxlEgqfcrNB53yHfXgo1N8FaDHV
 oMJpAan8A9VGSnrST92EOnH0m+8HLrMkV9Q9QcVvdCnNiuSZQeXx6632D34seN6gWJFT
 +x/mRBIDu7KMpVFY1Q3iy2ZrYD050kR/+xkaWCPE+DKKSmn2iirYjvmOghoo09jMjh5g
 KItg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lkmWRiQZCvaytXVBILDUhe6m1vALu1tQC0JhrJq6ZTM=;
 b=bhjnj2S75diluxo+E3WgOk97ip37HrFZnbnlXDqIkzW76T+DY6oFtaKSCK4sRXKEYg
 K/AQM15b3R4Jkxlmgia3C9GTKqRVK8OsHYoR08EGulWbLbXOOEcieIp/KUoCT0IoKyyb
 TdwzouAtBGXi9Ow3VpBZfi5S7Lm+ns4TC8rrnMAZYX3JnvWkXRMAdxGu2Kw/IcGSP35H
 KaZ3tMqgNtvOcyTgehF9KLh5qF9rdBdcdmSuR5yWO2DscziFh5RDl6aFCfnWsxSBbQFf
 iYby790vgG37qufvPQM0nBA98tR9n9m/FLcPcttaiRGNFj3HgOESXofApMdqcm2dTuXS
 F0vA==
X-Gm-Message-State: AOAM531tyCOqEBDj6ZTpKYmjXVEIrcQc/VxSK5DE8RGjq+tuxDvhLkDr
 HoaEQkgQDiQXQ6eEUmOXNya+KZEMSuE=
X-Google-Smtp-Source: ABdhPJxHA52lgEWJ7BNWsX535aietpafnnJW5DOPDI6NtyFFIOZ+VLYcgQvWrZP/MPw7Kl3ucfdC8g==
X-Received: by 2002:a05:6e02:1c48:: with SMTP id
 d8mr5818303ilg.96.1638352350969; 
 Wed, 01 Dec 2021 01:52:30 -0800 (PST)
Received: from james-x399.localdomain (71-33-128-47.hlrn.qwest.net.
 [71.33.128.47])
 by smtp.gmail.com with ESMTPSA id l18sm11518884iob.17.2021.12.01.01.52.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 01:52:30 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  1 Dec 2021 02:52:25 -0700
Message-Id: <20211201095225.90511-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211201095225.90511-1-james.hilliard1@gmail.com>
References: <20211201095225.90511-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/iwd: bump to version 1.20
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>, Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patches that are now upstream

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...-build-Add-reallocarray-to-missing-h.patch | 55 -------------------
 ...nfig-Remove-usage-of-in6_addr__in6_u.patch | 32 -----------
 package/iwd/iwd.hash                          |  2 +-
 package/iwd/iwd.mk                            |  2 +-
 4 files changed, 2 insertions(+), 89 deletions(-)
 delete mode 100644 package/iwd/0001-build-Add-reallocarray-to-missing-h.patch
 delete mode 100644 package/iwd/0002-netconfig-Remove-usage-of-in6_addr__in6_u.patch

diff --git a/package/iwd/0001-build-Add-reallocarray-to-missing-h.patch b/package/iwd/0001-build-Add-reallocarray-to-missing-h.patch
deleted file mode 100644
index ef6114f1af..0000000000
--- a/package/iwd/0001-build-Add-reallocarray-to-missing-h.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From ec1c348b4fd67619fa0c2f55ae644f6a8014d971 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 19 Sep 2021 21:17:44 +0200
-Subject: build: Add reallocarray to missing.h
-
-reallocarray has been added to glibc relatively recently (version 2.26,
-from 2017) and apparently not all users run new enough glibc. Moreover,
-reallocarray is not available with uclibc-ng. So use realloc if
-reallocarray is not available to avoid the following build failure
-raised since commit 891b78e9e892a3bcd800eb3a298e6380e9a15dd1:
-
-/home/giuliobenetti/autobuild/run/instance-3/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/10.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: src/sae.o: in function `sae_rx_authenticate':
-sae.c:(.text+0xd74): undefined reference to `reallocarray'
-
-Fixes:
- - http://autobuild.buildroot.org/results/c6d3f86282c44645b4f1c61882dc63ccfc8eb35a
-
-[Retrieved from:
-https://git.kernel.org/pub/scm/network/wireless/iwd.git/commit/?id=ec1c348b4fd67619fa0c2f55ae644f6a8014d971]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- configure.ac  | 1 +
- src/missing.h | 7 +++++++
- 2 files changed, 8 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index c6250401..51d9da93 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -129,6 +129,7 @@ AC_DEFINE_UNQUOTED(WIRED_STORAGEDIR, "${wired_storagedir}",
- 
- AC_CHECK_FUNCS(explicit_bzero)
- AC_CHECK_FUNCS(rawmemchr)
-+AC_CHECK_FUNCS(reallocarray)
- 
- AC_CHECK_HEADERS(linux/types.h linux/if_alg.h)
- 
-diff --git a/src/missing.h b/src/missing.h
-index 2cc80aee..a5b92952 100644
---- a/src/missing.h
-+++ b/src/missing.h
-@@ -37,3 +37,10 @@ _Pragma("GCC diagnostic ignored \"-Wstringop-overflow=\"")
- _Pragma("GCC diagnostic pop")
- }
- #endif
-+
-+#ifndef HAVE_REALLOCARRAY
-+static inline void *reallocarray(void *ptr, size_t nmemb, size_t size)
-+{
-+	return realloc(ptr, nmemb * size);
-+}
-+#endif
--- 
-cgit 1.2.3-1.el7
-
diff --git a/package/iwd/0002-netconfig-Remove-usage-of-in6_addr__in6_u.patch b/package/iwd/0002-netconfig-Remove-usage-of-in6_addr__in6_u.patch
deleted file mode 100644
index f6b3d24516..0000000000
--- a/package/iwd/0002-netconfig-Remove-usage-of-in6_addr__in6_u.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 42bd5ba7c2665c5bf95ba102a8115c4cf01d31d7 Mon Sep 17 00:00:00 2001
-From: Andrew Zaborowski <andrew.zaborowski@intel.com>
-Date: Thu, 16 Sep 2021 01:58:29 +0200
-Subject: netconfig: Remove usage of in6_addr.__in6_u
-
-in6_addr.__in6_u.__u6_addr8 is glibc-specific and named differently in
-the headers shipped with musl libc for example.  The POSIX compliant and
-universal way of accessing it is in6_addr.s6_addr.
-
-[Retrieved from:
-https://git.kernel.org/pub/scm/network/wireless/iwd.git/commit/?id=42bd5ba7c2665c5bf95ba102a8115c4cf01d31d7]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/netconfig.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/netconfig.c b/src/netconfig.c
-index ce95db0b..421270c9 100644
---- a/src/netconfig.c
-+++ b/src/netconfig.c
-@@ -171,7 +171,7 @@ static inline char *netconfig_ipv6_to_string(const uint8_t *addr)
- 	struct in6_addr in6_addr;
- 	char *addr_str = l_malloc(INET6_ADDRSTRLEN);
- 
--	memcpy(in6_addr.__in6_u.__u6_addr8, addr, 16);
-+	memcpy(in6_addr.s6_addr, addr, 16);
- 
- 	if (L_WARN_ON(unlikely(!inet_ntop(AF_INET6, &in6_addr, addr_str,
- 						INET6_ADDRSTRLEN)))) {
--- 
-cgit 1.2.3-1.el7
-
diff --git a/package/iwd/iwd.hash b/package/iwd/iwd.hash
index 7c010ed891..58224170e6 100644
--- a/package/iwd/iwd.hash
+++ b/package/iwd/iwd.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/network/wireless/sha256sums.asc
-sha256  0225ab81579f027e0fcbf255517f432fcf355d14f3645c36813c71a441dfab55  iwd-1.18.tar.xz
+sha256  7d51e2ccabe7c500e44061ac725dbd4f6b0fb518b5e3de1681063d0f15d3050f  iwd-1.20.tar.xz
 
 # License files
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index 96bdc56e93..7b122811c5 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IWD_VERSION = 1.18
+IWD_VERSION = 1.20
 IWD_SOURCE = iwd-$(IWD_VERSION).tar.xz
 IWD_SITE = $(BR2_KERNEL_MIRROR)/linux/network/wireless
 IWD_LICENSE = LGPL-2.1+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
