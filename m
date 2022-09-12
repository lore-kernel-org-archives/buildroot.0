Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 445F9ECAAA1
	for <buildroot@archiver.kernel.org>; Mon, 12 Sep 2022 07:12:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A9E1340220;
	Mon, 12 Sep 2022 07:12:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A9E1340220
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WF8L561rwu0q; Mon, 12 Sep 2022 07:12:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9134D401CC;
	Mon, 12 Sep 2022 07:12:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9134D401CC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8F7C61BF2B4
 for <buildroot@lists.busybox.net>; Mon, 12 Sep 2022 07:12:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 66B5E844F4
 for <buildroot@lists.busybox.net>; Mon, 12 Sep 2022 07:12:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66B5E844F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4diEI81pxo0C for <buildroot@lists.busybox.net>;
 Mon, 12 Sep 2022 07:12:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A050B842FD
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A050B842FD
 for <buildroot@buildroot.org>; Mon, 12 Sep 2022 07:12:43 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id q83so4188995iod.7
 for <buildroot@buildroot.org>; Mon, 12 Sep 2022 00:12:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=DZkAJH//irOPHeGmX97wUGDVv1/IClFSoqGMCD05osg=;
 b=ElrDq+U7OuxvMeeyohZRmzsOzsKiGO0zVhpmA4LSvVAE6tY9J/PBbU9JKHZWzhK5db
 BDC7NH/WOCxTzHSQmeHmH3d0GT7jAE3oDRV7Gid7xTF9+dyXQtmzaWmf5DHcpSa462vX
 sFqqlg5nxEBxaf2AniENYTbJ540G50iNKkVEpi4/dFSR9KNNeVevx/c9hUmyU+rjEBfK
 ny74SS8iD4j2RL6AgaPKeTS8m3ZJrBTesdSOAE3uCepwzQ5apIdi9doM4wrSfGcmNPnK
 PvETtVVCOvVlw1Undk0kEPJbCtdBzk85zww//vTLSdgrWsVoQL6JGdQOW4UfN+SZ7mB5
 htuQ==
X-Gm-Message-State: ACgBeo3LiZ7JPLN4sOES+X7GVU4O8kQFxysLYyELvQrjyIgMGQIBS/A7
 VnGSzOVbvGF9TW8qH4wwv7TG/QdR0hE=
X-Google-Smtp-Source: AA6agR76JXfCctBIUweclFuczyXIRPPgNxkqzC3flp0x04B3wZh5lifthA5vxv3GZImCFCRs2FIMNQ==
X-Received: by 2002:a05:6638:1683:b0:35a:4772:edc2 with SMTP id
 f3-20020a056638168300b0035a4772edc2mr417776jat.128.1662966762202; 
 Mon, 12 Sep 2022 00:12:42 -0700 (PDT)
Received: from james-x399.localdomain (71-33-138-207.hlrn.qwest.net.
 [71.33.138.207]) by smtp.gmail.com with ESMTPSA id
 j9-20020a056e02014900b002de7ceafb4esm3106915ilr.20.2022.09.12.00.12.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Sep 2022 00:12:41 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 12 Sep 2022 01:12:39 -0600
Message-Id: <20220912071239.2848460-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=DZkAJH//irOPHeGmX97wUGDVv1/IClFSoqGMCD05osg=;
 b=KS7Obry4i6Cqb0PiPKenW4ZAVmrwrqcxvRbUwBRd57uAZLXYAagoDNBbR08PvCyOXP
 q0xm6TtvjhkaygvL3Zn5kIsVUgrXtGqrV74y22r0Dno/g59Gwp16VfGJwWgKFab9U+9J
 00OZMZzsTfI+UphiXmO0Zzm4JGQKk4mgK9R1QE92ePN5g/yU1BYPI1IeI5Bc3UlWkwWP
 QzXitjpl+EfII9gwfZTuPci1P18ZtpvjMl92dRayedZRJP8HMg+4r91q9bVUCgZ4KRJm
 lgwFcZX17GUea6ivv4Y4A0EDx3qqRQaF5JJSK3X+vUlLXT89yhWU1Baincwm3zgX49bO
 gDRg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=KS7Obry4
Subject: [Buildroot] [PATCH 1/1] package/icu: clear TARGET env variable
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

If the TARGET env variable is set icu may try to use it.

To prevent this from causing issues clear it from the icu env.

Fixes:
>>> host-icu 70-1 Building
PATH="/home/buildroot/buildroot/output/per-package/host-icu/host/bin:/home/buildroot/buildroot/output/per-package/host-icu/host/sbin:/home/buildroot/bin:/home/buildroot/.local/bin:/home/buildroot/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
PKG_CONFIG="/home/buildroot/buildroot/output/per-package/host-icu/host/bin/pkg-config"
PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1
PKG_CONFIG_ALLOW_SYSTEM_LIBS=1
PKG_CONFIG_LIBDIR="/home/buildroot/buildroot/output/per-package/host-icu/host/lib/pkgconfig:/home/buildroot/buildroot/output/per-package/host-icu/host/share/pkgconfig"
 /usr/bin/make -j33  -C
/home/buildroot/buildroot/output/build/host-icu-70-1/source
cd ./config; \
    /usr/bin/make -f pkgdataMakefile
rm -rf config/icu-config
rebuilding config/icucross.mk
rebuilding config/icucross.inc
/bin/bash ./mkinstalldirs lib
/bin/bash ./mkinstalldirs bin
/usr/bin/install -c ./config/icu-config-top config/icu-config
rm -rf pkgdata.inc
chmod u+w config/icu-config
mkdir lib
mkdir bin
LC_ALL=C /usr/bin/sed -f ./config/make2sh.sed < ./config/Makefile.inc
| grep -v '#M#' | uniq >> config/icu-config
config/icu-uc.pc updated.
config/icu-i18n.pc updated.
/usr/bin/make[2]: Making `all' in `stubdata'
LC_ALL=C /usr/bin/sed -f ./config/make2sh.sed < ./config/mh-linux |
grep -v '#M#' | uniq >> config/icu-config
cat ./config/icu-config-bottom >> config/icu-config
   (deps)     stubdata.cpp
chmod u-w config/icu-config
Note: rebuild with "/usr/bin/make VERBOSE=1 " to show all compiler parameters.
make[3]: *** No rule to make target 'bpf', needed by 'all-local'.  Stop.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/icu/icu.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index ebbb1968fc..22fe686a7e 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -28,6 +28,11 @@ ICU_CONF_OPTS = \
 	--disable-samples \
 	--disable-tests
 
+ICU_CONF_ENV += TARGET=""
+ICU_MAKE_ENV += TARGET=""
+HOST_ICU_CONF_ENV += TARGET=""
+HOST_ICU_MAKE_ENV += TARGET=""
+
 # When available, icu prefers to use C++11 atomics, which rely on the
 # __atomic builtins. On certain architectures, this requires linking
 # with libatomic starting from gcc 4.8.
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
