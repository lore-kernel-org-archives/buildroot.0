Return-Path: <SRS0=GPX0=OK=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8E20C433EF
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 16:31:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4510F61019
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 16:31:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4510F61019
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E74BE82798;
	Mon, 20 Sep 2021 16:31:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dFzWW3Kg0CSz; Mon, 20 Sep 2021 16:31:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31665826FB;
	Mon, 20 Sep 2021 16:31:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A84FA1BF3D5
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 16:31:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A362840250
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 16:31:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xN_uB0smkngy for <buildroot@lists.busybox.net>;
 Mon, 20 Sep 2021 16:31:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 68750400C9
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 16:31:23 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id t8so24409281wri.1
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 09:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M11AFNHZt4s/eUjCtVCUAt45lA8xVO62o0obWtK1HwA=;
 b=Mb4hy3P5/m9bnlc3sKEtLMJfhyZAnSptIAsFmdsYG7yCe0bK3ryFuTyEJ+NwcT0VH6
 ZkyElTDC+MBh/oBcKQrBevJWUmxGPzdiej8oTeffj/5L52aDWDk0wSIt0d64gAxZ3BLw
 szapXo6BkP/HLcesNNwzazrHEB1Aj569wqBPtdchmMoA8mEVsGyR0TjM/PPRIuxkWiHl
 nn9j5pqjweQsnDrh7M4G0Xda/pCVx+KcdzVImuV51LPVWTabHwoCTbyYl90jLwf7pFBu
 fqndULGpXbCbgFG9Fd7ewMTuoqysZEN5sSs5cTxVp9UJeXk6CY0NJQ3J2dRyBiPMoqhh
 MA/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M11AFNHZt4s/eUjCtVCUAt45lA8xVO62o0obWtK1HwA=;
 b=oyxfBtG2wDkoIH0dEWP2kqqYFVPwozcl9JQefSZydIo6wTEoXwYTKoSjegkI8804He
 HvZ9kXAaUk6y4PZYNpoUnCPHLl335Y4Iig0HjrIaJD61VYL/CKDZ9e5LsF8K4De42Wje
 5ONSTcv1dd5jCMV+r/bYjijuJJIJ2JWRP2DLdk8UeblajIWSWuhi6MAboYSU4zyoiTq+
 hQMng3Y3WQh5kIQ2TAzq1X+JpJ7MNRtoj2fp6szI2CtTjAQ+AK2dLW5RpAP7r4dypVBJ
 +TDUVIOegBrRoP05kjWDKImRueJPniLrZwUFCO3Do5qr/NJULuPB+ido8SuPbcfz/l88
 Zzog==
X-Gm-Message-State: AOAM530k9r6eBNgdoLx05fkPG59gQQHIBUarxCbGylFWd3KLU9ufNmsC
 0BJFHXJg08Uwor7lcM1KKYfTbJQFGAg=
X-Google-Smtp-Source: ABdhPJyVYUCGw99oKTGXzE/z8JdBDJOM1+cQpvWO39tYt2qXz4sIIlKqnmat1d7gA+RYkdOT3LQj+w==
X-Received: by 2002:a7b:c142:: with SMTP id z2mr30994002wmi.10.1632155481319; 
 Mon, 20 Sep 2021 09:31:21 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id m18sm16313701wrn.85.2021.09.20.09.31.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 09:31:20 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 20 Sep 2021 18:30:31 +0200
Message-Id: <20210920163031.197937-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/iwd: fix build with uclibc-ng
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Peter Seiderer <ps.report@gmx.net>, Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Fix the following build failure with uclibc-ng raised since bump to
version 1.17 in commit 9badccc9d4887aa2365d7350e3b26bd4250dad48:

/home/giuliobenetti/autobuild/run/instance-3/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/10.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: src/sae.o: in function `sae_rx_authenticate':
sae.c:(.text+0xd74): undefined reference to `reallocarray'

Fixes:
 - http://autobuild.buildroot.org/results/c6d3f86282c44645b4f1c61882dc63ccfc8eb35a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-build-Add-reallocarray-to-missing-h.patch | 55 +++++++++++++++++++
 package/iwd/iwd.mk                            |  2 +
 2 files changed, 57 insertions(+)
 create mode 100644 package/iwd/0001-build-Add-reallocarray-to-missing-h.patch

diff --git a/package/iwd/0001-build-Add-reallocarray-to-missing-h.patch b/package/iwd/0001-build-Add-reallocarray-to-missing-h.patch
new file mode 100644
index 0000000000..ef6114f1af
--- /dev/null
+++ b/package/iwd/0001-build-Add-reallocarray-to-missing-h.patch
@@ -0,0 +1,55 @@
+From ec1c348b4fd67619fa0c2f55ae644f6a8014d971 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 19 Sep 2021 21:17:44 +0200
+Subject: build: Add reallocarray to missing.h
+
+reallocarray has been added to glibc relatively recently (version 2.26,
+from 2017) and apparently not all users run new enough glibc. Moreover,
+reallocarray is not available with uclibc-ng. So use realloc if
+reallocarray is not available to avoid the following build failure
+raised since commit 891b78e9e892a3bcd800eb3a298e6380e9a15dd1:
+
+/home/giuliobenetti/autobuild/run/instance-3/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/10.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: src/sae.o: in function `sae_rx_authenticate':
+sae.c:(.text+0xd74): undefined reference to `reallocarray'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/c6d3f86282c44645b4f1c61882dc63ccfc8eb35a
+
+[Retrieved from:
+https://git.kernel.org/pub/scm/network/wireless/iwd.git/commit/?id=ec1c348b4fd67619fa0c2f55ae644f6a8014d971]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure.ac  | 1 +
+ src/missing.h | 7 +++++++
+ 2 files changed, 8 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index c6250401..51d9da93 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -129,6 +129,7 @@ AC_DEFINE_UNQUOTED(WIRED_STORAGEDIR, "${wired_storagedir}",
+ 
+ AC_CHECK_FUNCS(explicit_bzero)
+ AC_CHECK_FUNCS(rawmemchr)
++AC_CHECK_FUNCS(reallocarray)
+ 
+ AC_CHECK_HEADERS(linux/types.h linux/if_alg.h)
+ 
+diff --git a/src/missing.h b/src/missing.h
+index 2cc80aee..a5b92952 100644
+--- a/src/missing.h
++++ b/src/missing.h
+@@ -37,3 +37,10 @@ _Pragma("GCC diagnostic ignored \"-Wstringop-overflow=\"")
+ _Pragma("GCC diagnostic pop")
+ }
+ #endif
++
++#ifndef HAVE_REALLOCARRAY
++static inline void *reallocarray(void *ptr, size_t nmemb, size_t size)
++{
++	return realloc(ptr, nmemb * size);
++}
++#endif
+-- 
+cgit 1.2.3-1.el7
+
diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index 9737f2c626..58535b1aa1 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -12,6 +12,8 @@ IWD_LICENSE_FILES = COPYING
 IWD_CPE_ID_VENDOR = intel
 IWD_CPE_ID_PRODUCT = inet_wireless_daemon
 IWD_SELINUX_MODULES = networkmanager
+# We're patching configure.ac
+IWD_AUTORECONF = YES
 
 IWD_CONF_OPTS = \
 	--disable-manual-pages \
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
