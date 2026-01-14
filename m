Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73311D39008
	for <buildroot@archiver.kernel.org>; Wed, 14 Jan 2026 19:31:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECF3540A36;
	Wed, 14 Jan 2026 19:31:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rdoJ-qupXkcW; Wed, 14 Jan 2026 19:31:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0725440942
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768419115;
	bh=ojfMdCgasr5daGn3iCvL5zt/4K8bxqTJkA5AQtdgqsI=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NYOltIVQvDdTEVeSBXTxGrQbL3x/wvDF6dw8sq+75oZSMl5e2HZGVA+NamqyJdYUz
	 NEjmXtKDCsJvo85e5IhhmXELcsCSHdkFF/MhqCGO8ncE5LPDqgehIJQpzXtOj4YITM
	 kVlTo144mL0TDVTrPdst27Te8TLqK4EojxnNdbPf4hLFjNY1e4oNwCqodYVygKsbvX
	 owCi7AUoIN+NidaKcYoFz6tcJOl0xPtMSQ67IPldddvXD1QT7nE4Upy9k9Fd+txJYF
	 X3tDLhD2GK8kMKYhsGzHYD1S3KmxIOzKidBnuEre0Vm0Ytf3SsPLnLuK1KRYWLsxyD
	 6utUc4MVRpKKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0725440942;
	Wed, 14 Jan 2026 19:31:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E46B61C3
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 19:31:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D65B940942
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 19:31:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZFGu8FLUHV9T for <buildroot@buildroot.org>;
 Wed, 14 Jan 2026 19:31:52 +0000 (UTC)
X-Greylist: delayed 400 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 14 Jan 2026 19:31:50 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3AFB840939
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3AFB840939
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a02:6b8:c02:900:1:45:d181:d204; helo=forward204b.mail.yandex.net;
 envelope-from=tarelovma@yandex.ru; receiver=<UNKNOWN> 
Received: from forward204b.mail.yandex.net (forward204b.mail.yandex.net
 [IPv6:2a02:6b8:c02:900:1:45:d181:d204])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3AFB840939
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 19:31:50 +0000 (UTC)
Received: from forward102b.mail.yandex.net (forward102b.mail.yandex.net
 [IPv6:2a02:6b8:c02:900:1:45:d181:d102])
 by forward204b.mail.yandex.net (Yandex) with ESMTPS id 0494187366
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 22:25:06 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-91.sas.yp-c.yandex.net
 (mail-nwsmtp-smtp-production-main-91.sas.yp-c.yandex.net
 [IPv6:2a02:6b8:c1e:3990:0:640:454b:0])
 by forward102b.mail.yandex.net (Yandex) with ESMTPS id 822EDC0002;
 Wed, 14 Jan 2026 22:24:57 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-91.sas.yp-c.yandex.net
 (smtp/Yandex) with ESMTPSA id EOai5G2GkiE0-lPqVNYVn; 
 Wed, 14 Jan 2026 22:24:57 +0300
X-Yandex-Fwd: 1
From: Maxim Tarelov <tarelovma@yandex.ru>
To: buildroot@buildroot.org
Cc: Petr Vorel <petr.vorel@gmail.com>,
	Maxim Tarelov <tarelovma@yandex.ru>
Date: Wed, 14 Jan 2026 22:24:13 +0300
Message-ID: <20260114192413.569151-1-tarelovma@yandex.ru>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yandex.ru; s=mail; 
 t=1768418697; bh=XqwCtj5hW20froVnwmGU55YXEeUM+CYrb0kTziXVu8c=;
 h=Message-ID:Date:Cc:Subject:To:From;
 b=DVca2ZX5FOLeO6usEF57Fzyi32zsEwX17RVOV3n4eYCd1JrfwVhkc/aQUUJFQxEK/
 WNVNskM9NfCTwQqXyaK1Opo0qHLEw+qWKEx3ElpKMuLIKi1ZQp7lWxeCU3csNLbhP5
 EKfVuGGKZ31jrqT1M1e+ELKsnb868pJQJj2dfMHU=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=yandex.ru
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=yandex.ru header.i=@yandex.ru header.a=rsa-sha256
 header.s=mail header.b=DVca2ZX5
X-Mailman-Original-Authentication-Results: mail-nwsmtp-smtp-production-main-91.sas.yp-c.yandex.net;
 dkim=pass header.i=@yandex.ru
Subject: [Buildroot] [PATCH 1/1] package/ltp-testsuite: kirk needs python3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

LTP project contains a number of scripts, such as kirk, which depend on
python3, but not all boards _defconfigs enable python3 by default.

To avoid errors like this:
 # /usr/lib/ltp-testsuite/kirk
 env: can't execute 'python3': No such file or directory

we must explicitly enable python3 when selecting LTP.

Signed-off-by: Maxim Tarelov <tarelovma@yandex.ru>
---
 package/ltp-testsuite/Config.in        | 1 +
 package/ltp-testsuite/ltp-testsuite.mk | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/package/ltp-testsuite/Config.in b/package/ltp-testsuite/Config.in
index 81dc9dffee..0ddc2fe02c 100644
--- a/package/ltp-testsuite/Config.in
+++ b/package/ltp-testsuite/Config.in
@@ -15,6 +15,7 @@ config BR2_PACKAGE_LTP_TESTSUITE
 	depends on BR2_PACKAGE_LTP_TESTSUITE_ARCH_SUPPORTS
 	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC
+	select BR2_PACKAGE_PYTHON3
 	help
 	  The Linux Test Project provides a huge testsuite for Linux.
 
diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index e4e3ff8717..c103ac9819 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -13,6 +13,8 @@ LTP_TESTSUITE_LICENSE_FILES = COPYING
 
 LTP_TESTSUITE_CONF_OPTS += --disable-metadata
 
+LTP_TESTSUITE_DEPENDENCIES += python3
+
 ifeq ($(BR2_PACKAGE_LTP_TESTSUITE_OPEN_POSIX),y)
 LTP_TESTSUITE_CONF_OPTS += --with-open-posix-testsuite
 endif
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
