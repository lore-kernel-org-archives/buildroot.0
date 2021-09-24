Return-Path: <SRS0=OK8R=OO=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CD72C433EF
	for <buildroot@archiver.kernel.org>; Fri, 24 Sep 2021 15:10:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AF386103C
	for <buildroot@archiver.kernel.org>; Fri, 24 Sep 2021 15:10:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2AF386103C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C275480F33;
	Fri, 24 Sep 2021 15:10:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8JT7OUiZiRkc; Fri, 24 Sep 2021 15:10:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 224AE80EC9;
	Fri, 24 Sep 2021 15:10:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3134B1BF57F
 for <buildroot@lists.busybox.net>; Fri, 24 Sep 2021 15:10:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1FF23614A7
 for <buildroot@lists.busybox.net>; Fri, 24 Sep 2021 15:10:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tU9YPi-VC6OU for <buildroot@lists.busybox.net>;
 Fri, 24 Sep 2021 15:10:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2039E6139A
 for <buildroot@buildroot.org>; Fri, 24 Sep 2021 15:10:14 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id u18so28526869wrg.5
 for <buildroot@buildroot.org>; Fri, 24 Sep 2021 08:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kD5g+7AzRgBKPuLkGxHkvhE8U8NCsTZNA6uTAkvSNlk=;
 b=QXyHXxCUYdFuPdhPXtG6b+J4ivqtB2sRvJ8MBwWIAOpUJg4QIAFNw+BWa309rA60W/
 J0frdR7n0UlR+lAI5yo03Jm4gimsKm2i/So8xsStBxTgHMTugFd+ZL5XfzhioVi/zuSN
 WIccl8wlKQj7XjT8CSrE7LKzEc/+kI2vCqCDFBpCi7JtEaCBmMuCXQqNtsD0uwKs1olv
 azi6Fw+3zc8aci82p4pAfJeon/vI4TJE3O4uZvFYHfhUJReb30KPLXCf3yfNavpzkk6O
 mT7LJs1SB5808gzEH7kJM9dbKRqmoz38E+jBCCu0xPGqh1BkpUncfoDByQpTY8s8pXzJ
 uanA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kD5g+7AzRgBKPuLkGxHkvhE8U8NCsTZNA6uTAkvSNlk=;
 b=pU+SKyH3x4HeHDHd0z/4jh9lXxVKQPm+LOcQXCAJIzgQZxwHwWWNZuDBMpBmM4eR2h
 V97/4S6jdGVG6PgN7vv9X4uHu2p9Y6JskK36Z+Dw5BSMQNG3DlSTJttNAMdC5TdYRxkL
 gzra2Zp91czG5w7buv+Ns/tSm2B6V8jOaY2i3xR9H/mcJbaasKnolZJGnMFtpk8aMHHA
 jwXTR5yi9G+hLiIF7ScV1KeCpGbRpnElhtuTT/QZHuDpZXFpPTQTd1nxZI3OiTa2D9KH
 Iy8i0DdOfPvwRDP4PrtScEaX45aaFH1ZNQjfA6BZMsAm+cePWV4BrX47K8TVI7IikKzd
 PzhA==
X-Gm-Message-State: AOAM532/YkX4DcWsG+4su8E6TTKQ6iD4/Cs6hZVHMoXmO47kK96d+74x
 TUveD42bwjC+XF24xVtiIxJUiavjqWI=
X-Google-Smtp-Source: ABdhPJwwErBo0BkDh4flV5kiXxmvSOhjK6ssPz1yZxOV4foieQHCgPYFYzX88gyowEGda71QBkeLKQ==
X-Received: by 2002:a05:600c:245:: with SMTP id 5mr2610234wmj.53.1632496211789; 
 Fri, 24 Sep 2021 08:10:11 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id t126sm12470161wma.4.2021.09.24.08.10.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 08:10:11 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Sep 2021 17:09:33 +0200
Message-Id: <20210924150933.1618347-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/php-gnupg: fix build with gcc 4.8
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Fix the following build failure with gcc 4.8 raised since bump of
php-gnupg to version 1.5.0 in commit
20ecd9c94222ef20b7804084acefb472b8e5deaf and
https://github.com/bukka/phpc/commit/8b5b1e718fbb2ba57102d1e9d844938038df310c:

.libs/gnupg_keylistiterator.o: In function `_phpc_res_close':
gnupg_keylistiterator.c:(.text+0x2d4): multiple definition of `_phpc_res_close'

Fixes:
 - http://autobuild.buildroot.org/results/d79/d79bc1b0f98d68eb8a7fe7d86af5ddcc75e42507/build-end.log

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...0001-Remove-inlining-_phpc_res_close.patch | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/php-gnupg/0001-Remove-inlining-_phpc_res_close.patch

diff --git a/package/php-gnupg/0001-Remove-inlining-_phpc_res_close.patch b/package/php-gnupg/0001-Remove-inlining-_phpc_res_close.patch
new file mode 100644
index 0000000000..9b94cb7e4f
--- /dev/null
+++ b/package/php-gnupg/0001-Remove-inlining-_phpc_res_close.patch
@@ -0,0 +1,33 @@
+From 887b0899d7e7423baec691255c2d8b56bb348ecd Mon Sep 17 00:00:00 2001
+From: Jakub Zelenka <bukka@php.net>
+Date: Sun, 14 Mar 2021 18:52:21 +0000
+Subject: [PATCH] Remove inlining _phpc_res_close
+
+[Retrieved from:
+https://github.com/bukka/phpc/commit/887b0899d7e7423baec691255c2d8b56bb348ecd]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ phpc.h | 8 --------
+ 1 file changed, 8 deletions(-)
+
+diff --git a/phpc/phpc.h b/phpc/phpc.h
+index dc5887e..9206105 100644
+--- a/phpc/phpc.h
++++ b/phpc/phpc.h
+@@ -945,16 +945,8 @@ typedef zend_resource * phpc_res_value_t;
+ 	zend_fetch_resource2(Z_RES_P(_pz_res), _res_type_name, _res_type_1, _res_type_2)
+ #define PHPC_RES_DELETE(_pz_res) \
+ 	zend_list_delete(Z_RES_P(_pz_res))
+-#if PHP_MAJOR_VERSION < 8
+ #define PHPC_RES_CLOSE(_pz_res) \
+ 	zend_list_close(Z_RES_P(_pz_res))
+-#else
+-inline int _phpc_res_close(zval *zres) {
+-	zend_list_close(Z_RES_P(zres));
+-	return SUCCESS;
+-}
+-#define PHPC_RES_CLOSE _phpc_res_close
+-#endif
+ 
+ /* resource to zval */
+ #define PHPC_RES_PZVAL(_res, _pzv) \
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
