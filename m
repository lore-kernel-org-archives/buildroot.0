Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A8EAC54EE9
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 13:18:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B2BA7409B0;
	Sun, 18 Sep 2022 13:18:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2BA7409B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t2j-IyuAPY6u; Sun, 18 Sep 2022 13:18:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1995B4047C;
	Sun, 18 Sep 2022 13:18:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1995B4047C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 024931BF426
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 13:18:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D06B2418D6
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 13:18:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D06B2418D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DhexbSboO7g1 for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 13:18:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 679A6418E2
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 679A6418E2
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 13:18:42 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id k9so43196043wri.0
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 06:18:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=bN/I4zW1I3FE6FwVJL47poSHkqO7/QDB+zlPI5FA/1Q=;
 b=JSMwfBnWjKJHgMEAVe9vrGMXBaW4vdmVGnnCjWjKTNykHVw5JWBrqo4Kud5B5UQBav
 dYQ9ee0L2iWlrMqGcGyWyoYXsl7PzEycnuQ/A4YfUx5t44JP7vaBggHx4KPGoi94Kx5R
 mEwtjepOIkGEzDOZPIll4I24CKpG1VBcGVDp4vFlByFYNBjReq6mzeTVEugiNFrhOrDv
 Mh3B78tbeEXwSnON/pV8mGjGtDZ+JTYQwS8OyNF1waWXqpV0XO79AKUd3YJPQq9uXzAB
 Mbmsmp275kmZQv+HfEOtjikgVqXh5frppUleaKYVkkOCEVNYOlcdoNz7JcvFjBtX+dze
 sDJQ==
X-Gm-Message-State: ACrzQf0/NFFA32vwaCpt3V8r/Wf7RTNM0Sp3BMFhdh8trzMxjVqf2kdd
 PUMI06UNw05sQ05oHx3hN9vawXEyVOs=
X-Google-Smtp-Source: AMsMyM6TlQ0JSPhbzrBIpo5nLf2pcQUGfeYnmWGvewHr7ilb+4s6sc6R9kKUk+Xy5oGxUltFLeQDHg==
X-Received: by 2002:adf:e4cc:0:b0:22a:d755:aaf7 with SMTP id
 v12-20020adfe4cc000000b0022ad755aaf7mr8117167wrm.692.1663507120066; 
 Sun, 18 Sep 2022 06:18:40 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 m2-20020a5d6242000000b00228df23bd51sm10640628wrv.82.2022.09.18.06.18.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Sep 2022 06:18:39 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 18 Sep 2022 15:18:36 +0200
Message-Id: <20220918131836.341127-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=bN/I4zW1I3FE6FwVJL47poSHkqO7/QDB+zlPI5FA/1Q=;
 b=OXJTMmJx0Nk79GxHSybN4UpR9L4OOKPqMyxD/NClmDgUoakqWvCUba/tegJh6MeslP
 MIMHPhvVvtMyZYAztEdgrbUTw3AqyvUHkXp5wsp+6aqnw426TLkOgwZLL6TjnAENEsr+
 STerNDFUwlP5y7Drw65APwTmBtvBh6f475CNsuS+9aQLBxg2bQGFPi2QIjDus4GKMsDF
 jarWhl7EXS9rHLLxM7UmWd+AeXbI6eeLKVoKy4JFowis2BtPXlfygzX6VNTqoLYKBeXO
 fioo25kEdhS1+xT1KZ5Ce5QU2jK0AHcoYmgSSpxQO+/V2dfnXlrhQVGxandRYc0/33eX
 Od6w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=OXJTMmJx
Subject: [Buildroot] [PATCH 1/1] package/boinc: bump to version 7.20.2
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://boinc.berkeley.edu/wiki/Release_Notes

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/boinc/boinc.hash | 2 +-
 package/boinc/boinc.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/boinc/boinc.hash b/package/boinc/boinc.hash
index 35e59ce415..3955cffb31 100644
--- a/package/boinc/boinc.hash
+++ b/package/boinc/boinc.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  274388d9c49e488b6c8502ffc6eb605d5ceae391fb0c2fc56dbb0254d0ceb27e  boinc-7.18.1.tar.gz
+sha256  e577072b06f590d3230c25c94b221dba528b0938681e645bbd870778f8958077  boinc-7.20.2.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
 sha256  a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  COPYING.LESSER
diff --git a/package/boinc/boinc.mk b/package/boinc/boinc.mk
index 695495f777..6b76e5f530 100644
--- a/package/boinc/boinc.mk
+++ b/package/boinc/boinc.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-BOINC_VERSION_MAJOR = 7.18
-BOINC_VERSION = $(BOINC_VERSION_MAJOR).1
+BOINC_VERSION_MAJOR = 7.20
+BOINC_VERSION = $(BOINC_VERSION_MAJOR).2
 BOINC_SITE = \
 	$(call github,BOINC,boinc,client_release/$(BOINC_VERSION_MAJOR)/$(BOINC_VERSION))
 BOINC_LICENSE = LGPL-3.0+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
