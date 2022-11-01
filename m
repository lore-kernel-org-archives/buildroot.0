Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1715BFA373D
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 07:42:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92D988135F;
	Tue,  1 Nov 2022 07:42:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92D988135F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K-LSJ3Z7HXTI; Tue,  1 Nov 2022 07:42:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7BB281354;
	Tue,  1 Nov 2022 07:42:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7BB281354
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 509131BF2BE
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 07:42:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 388E98135D
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 07:42:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 388E98135D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LugWa1pBqpMy for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 07:42:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D33781351
Received: from mail.tkos.co.il (guitar.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6D33781351
 for <buildroot@busybox.net>; Tue,  1 Nov 2022 07:42:09 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id D9F1A44076D;
 Tue,  1 Nov 2022 09:39:46 +0200 (IST)
To: buildroot@busybox.net
Date: Tue,  1 Nov 2022 09:41:54 +0200
Message-Id: <996e9db6fa29e5b1c59d7ecf3e84da781bace4ee.1667288516.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1667288386;
 bh=dl9XoPKLR2uyth7av5fcU3m6NmLGrzoX6u+VwYiMESk=;
 h=From:To:Cc:Subject:Date:From;
 b=NCLTOPrZgjSvJe9DXslgsGS09pmcFoEE9Mx/ET2Zu/81nQhRZehFDyWQN5YlkYm3K
 +25zgv1xMCZ9QU3pki3WQlDPhMutjyNrMTnrXyoeX/cxN4oal5t2UiFwd+Ylsgf7QT
 1tp9pBDnWbj2LYXQa+SZgKBZnDsbIZzCKh5KKJgQkY3CdG/8uOSVhC0DXuHR2lo7u+
 s7suDgSmc5yz/zqEWqCOWKCpdr2JEJTRFfFTUyZ46ErIoxVGVZF1LqbLIKvB3Rc7Rd
 X6L41xoMefUVtHz5F/5uJx3sOVPaBpuKroHOYL/LZpoLPKK/offHEmAGu69MbGEqNT
 rDqkKWcP3109g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=NCLTOPrZ
Subject: [Buildroot] [PATCH 1/3] package/socat: fix printf feature detection
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

socal configure uses AC_TRY_RUN to detect printf features. This does not
work for cross compilation.

All C libraries we use support C99 snprintf. Only glibc and uClibc
support the deprecated Z modifier.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/socat/socat.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/socat/socat.mk b/package/socat/socat.mk
index e20577492d86..c1bf4d260f61 100644
--- a/package/socat/socat.mk
+++ b/package/socat/socat.mk
@@ -11,6 +11,14 @@ SOCAT_LICENSE = GPL-2.0 with OpenSSL exception
 SOCAT_LICENSE_FILES = README COPYING COPYING.OpenSSL
 SOCAT_CPE_ID_VENDOR = dest-unreach
 
+SOCAT_CONF_ENV = ac_cv_have_c99_snprintf=yes
+
+ifeq ($(BR2_TOOLCHAIN_USES_GLIBC)$(BR2_TOOLCHAIN_USES_UCLIBC),y)
+SOCAT_CONF_ENV += ac_cv_have_z_modifier=yes
+else
+SOCAT_CONF_ENV += ac_cv_have_z_modifier=no
+endif
+
 ifeq ($(BR2_powerpc)$(BR2_powerpc64)$(BR2_powerpc64le),y)
 SOCAT_CONF_ENV += \
 	sc_cv_sys_crdly_shift=12 \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
