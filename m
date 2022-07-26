Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C01C00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 20:26:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 410D881768;
	Tue, 26 Jul 2022 20:26:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 410D881768
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s1y6m7hpKqZw; Tue, 26 Jul 2022 20:26:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44B2D81765;
	Tue, 26 Jul 2022 20:26:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44B2D81765
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 756351BF3EF
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 20:26:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 58F2681763
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 20:26:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58F2681763
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i0A9xatAUeaY for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 20:26:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF57681764
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EF57681764
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 20:26:49 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 u14-20020a05600c00ce00b003a323062569so28320wmm.4
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 13:26:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3l40ecbx0owwtUGH8WgD2mdC2NeW+fArV9W3AOCEcVA=;
 b=60Z3ljBv1R+jGxx48Kz+ryVhE4YAAj8/Ab3kTi/+sEyJa4ckK2jCyf+H9tlgZFMauH
 sSP5cTkQCGVw7/Wy9RNDFkhl9krmYF3F7YfaoOawDP5JzLAQZOhi9/vZp+5S6Kfy0b/7
 hbcuzMQ5eEesKymrZibxTTsrSsuTtceTgtEJiypl0F7U/5rJirNRpOuLuiTfs9BHMkpG
 c49U/tqF+k5kxYkXrNC+yNpbr6rxXed+PYl62iivH9mgrfafDVaI1Tyl5hvDQiYFUXlw
 6YkTypMBaY64m/XAO9jEYoVCHIQNvhPP6Du6oUMo1KvlAHZ4BMDDStMTChxqUqmAsngM
 Jstw==
X-Gm-Message-State: AJIora/ey9sE+xsQvngeJfr83IW67Y6EGg/y203sKB6Y9l/6Q+2WeT+N
 /OUG2J2WchaexcD2bXcFqhIo6QldF8I=
X-Google-Smtp-Source: AGRyM1t7CfIf+vrltBuktWElOc80pVKW5P+rVa5STIS9WzYUqMbw3zdSD8WDV64sC/UH1knO/x6KcQ==
X-Received: by 2002:a1c:a444:0:b0:3a3:53e6:fd3d with SMTP id
 n65-20020a1ca444000000b003a353e6fd3dmr564060wme.173.1658867207869; 
 Tue, 26 Jul 2022 13:26:47 -0700 (PDT)
Received: from kali.home (2a01cb0680639d806be2c385179f3c58.ipv6.abo.wanadoo.fr.
 [2a01:cb06:8063:9d80:6be2:c385:179f:3c58])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a05600c154c00b003a31169a7f4sm33699wmg.12.2022.07.26.13.26.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 13:26:47 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 22:26:45 +0200
Message-Id: <20220726202645.347259-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3l40ecbx0owwtUGH8WgD2mdC2NeW+fArV9W3AOCEcVA=;
 b=ql3ciSnr3S1XpLWbrmSdRewpLrNO3K2Wno8nL3m8PkG73r1L2w0ON6+OK0ZM45dm2N
 aFITWJoW3Rtzz8ruQrTbT0eoZxEQgfQaWo0/BJneOoTp1mjOHvukqm8mtjHM6FIHLHym
 lGJRthW7Ksqn4Pv73BVjh8YuHfiCj8//Ab5FhLtgwHrNxhuxPBGoChZ+LDsVJZ2XHNnB
 FkRIDvDppD3zm4h7Y8Y2EZHadOr2QXsfHzu+vxds8bH+s6BYQWXF+wZGsjzfa1GjGExN
 UatOWSYBnK18J2E3eKTRoiKDb+2eROxdA3x8cK5+CrumY47SubpoEIJR4pfyh+gPPHX0
 6MwA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ql3ciSnr
Subject: [Buildroot] [PATCH 1/1] package/opensc: disable cmocka
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
Cc: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Disable cmocka (enabled by default) to avoid the following uclibc build
failure raised since the addition of the package in commit
8aaa7ecbce1d10cbcd880c3da5e429988f96176a:

In file included from p11test_common.h:30,
                 from p11test_helpers.h:25,
                 from p11test.c:24:
/home/giuliobenetti/autobuild/run/instance-0/output-1/host/powerpc-buildroot-linux-uclibc/sysroot/usr/include/cmocka.h:2334:47: error: unknown type name 'va_list'
 2334 | void vprint_message(const char* const format, va_list args) CMOCKA_PRINTF_ATTRIBUTE(1, 0);
      |                                               ^~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/19d1171a76cd4789472b16aa24b44f58cd7e0a1e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/opensc/opensc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/opensc/opensc.mk b/package/opensc/opensc.mk
index e1ad5d61b0..f9e2f5083e 100644
--- a/package/opensc/opensc.mk
+++ b/package/opensc/opensc.mk
@@ -11,6 +11,6 @@ OPENSC_LICENSE_FILES = COPYING
 OPENSC_CPE_ID_VENDOR = opensc_project
 OPENSC_DEPENDENCIES = openssl pcsc-lite
 OPENSC_INSTALL_STAGING = YES
-OPENSC_CONF_OPTS = --disable-strict
+OPENSC_CONF_OPTS = --disable-cmocka --disable-strict
 
 $(eval $(autotools-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
