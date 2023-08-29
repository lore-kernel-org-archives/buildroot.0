Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63587C83F14
	for <buildroot@archiver.kernel.org>; Tue, 29 Aug 2023 06:35:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE8C3607C0;
	Tue, 29 Aug 2023 06:35:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE8C3607C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bbCviZJfsHXx; Tue, 29 Aug 2023 06:35:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 375F560758;
	Tue, 29 Aug 2023 06:35:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 375F560758
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CE8131BF41D
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 06:35:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B632640955
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 06:35:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B632640955
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O8Q_787Nlc8B for <buildroot@lists.busybox.net>;
 Tue, 29 Aug 2023 06:35:07 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 858C5408B4
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 06:35:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 858C5408B4
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 2F1FF352BD7A; Tue, 29 Aug 2023 08:35:05 +0200 (CEST)
Date: Tue, 29 Aug 2023 08:35:05 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZO2RmRfF1fvQNzyi@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-21-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1693290905; bh=rXno9TrxHb8pXiorHwvwMJchsrQzyF3Ne7lH5ryIOfY=;
 h=Date:From:To:Subject:From;
 b=oEoZqgueSSrNGWipH/X01YT990T6aArutlQkh9unkLYo9sibz9ayZsqyIrvC/GQdh
 CuIYaVaoY1aqEOcfkUKNsZigDztbdUVW7MLe9hr5ZihPk8hXZkAxZ00aZ4r62bFn6+
 q8wdA7HX4cPdSJZT9RLf+zb3FmK1D5w9x/Es2XuPbEYoj1ucrpqv39RMYRShirbs3j
 unaWAiyE0R1BOXl8ZrtWOCk9oXAjotEnUg6mTGfFuptwpodRRjXwENW8e7gVubqWR8
 Ea28h9Q6xKFmp53Oc1ud+Fg6u9SIpolB+SVKG0Gih+jRW2HNl8QnoGOTFrGOE7U1un
 gnsul9EIFwmHw==
Subject: [Buildroot] [PATCH] package/shellinabox: fix misdetection of
 ptsname_r
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Shellinabox configure fails to detect ptsname_r, because of the following warning
binutils 2.39+ emits:
ld: warning: some.o: missing .note.GNU-stack section implies executable stack
ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker

Then the build errors out with:
shellinabox/launcher.c:772:12: error: static declaration of 'ptsname_r' follows non-static declaration

Fixes:
 - http://autobuild.buildroot.net/results/3e4/3e478d22e820703ddfd11d1491e631ef8ed6b29b

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/shellinabox/shellinabox.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/shellinabox/shellinabox.mk b/package/shellinabox/shellinabox.mk
index 58c1668112..c48b3db96f 100644
--- a/package/shellinabox/shellinabox.mk
+++ b/package/shellinabox/shellinabox.mk
@@ -30,4 +30,8 @@ ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
 SHELLINABOX_CONF_OPTS += --disable-utmp
 endif
 
+# shellinabox configure check for ptsname_r is failing when
+# binutils is warning about executable stack
+SHELLINABOX_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -z noexecstack"
+
 $(eval $(autotools-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
