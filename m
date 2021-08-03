Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88BA4C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 13:01:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AB3860F58
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 13:01:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4AB3860F58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1758B60794;
	Tue,  3 Aug 2021 13:01:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lqg8iBewHoZu; Tue,  3 Aug 2021 13:01:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58E3B6077B;
	Tue,  3 Aug 2021 13:01:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3D2DD1BF29F
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 13:01:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 293D940341
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 13:01:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yLwqe2JtiTgo for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 13:01:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E3B67400F2
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 13:01:37 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id n11so12442078wmd.2
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 06:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=btKTgXVGy/yI4Sc29BZbHfUnj34F34v5QikU3Rqjy4o=;
 b=mSc6yp8ylxZqAggV7g/tk29xYI4wLPCY4oZvosupfMjJRSBMC/4K2j22+MLmIOInXP
 qe9QGF8/wJJ3JyfMumcwZ5RV/xiRczRc+CaTDvtc98U0/eEc5sA40CB5XBQX6hO6DbQA
 iCwO1WTYdYdy30l2yXySy6SWcxcGfl/pqLjXspMUeHh5UyePO3xy93s1EiF+PwqxVPTS
 f9TNHefE2hOA/j2/g89uHVpkKMb8yOsVk+WChoAB/Fa7BjlyKYGA3UWgldB0U8+AEHjf
 bgKulENeks5PGtIEuvakt7EbFV5pu3z1LLd4qYwmM+JW3YS52sfT4r8eaRBBCG81vHxh
 lkWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=btKTgXVGy/yI4Sc29BZbHfUnj34F34v5QikU3Rqjy4o=;
 b=t69tq7S2I/PbG96Z1WB0hrwrO0oQBzo4XaH9pN6OpKS9pSKpbnlAU+4Ba+l+slP6e7
 mx1/nlUHxehuvMcIvc+1vBPevuqE5CPoqJo09YNm8lO0gh4PjsnMAOKs72Y2wKQ/Jo2Z
 CS0yNeSHHpcQMLKHr17CDlkRW45U/ZCNSUJ+IwNbX9vl8Ku1ltNN2VueVsUi9PHGpT3p
 1D1bMERr70MckojS4ls5daOelA5Mz1T7NbFxtXbvd8ZEzUmjptfkzWGnFpeCavHI7QFN
 nf56k9Dxk6IA8KloX3BU/jG0Xz714sxyQbWW3jCJXJJBio1wBfaZayX18O5qCzeTDplE
 dmzg==
X-Gm-Message-State: AOAM5325kIxIUHu0zSnMuB0Hyyg73lB6BfK8OgmVyMcL+NpUWhF96KUY
 orvkIDLhnAckA/wQtAX8q/5DuCUG9ZZx1Q==
X-Google-Smtp-Source: ABdhPJxL1Br3sqsJFwMe36VmfVZrtBRVWHk1mj6RhozdHjRvEN8+SPDC12AOm9+NW13FrP2GGjPQAA==
X-Received: by 2002:a05:600c:3795:: with SMTP id
 o21mr21847975wmr.90.1627995695868; 
 Tue, 03 Aug 2021 06:01:35 -0700 (PDT)
Received: from kali.home (pop.92-184-97-255.mobile.abo.orange.fr.
 [92.184.97.255])
 by smtp.gmail.com with ESMTPSA id l9sm14340653wro.92.2021.08.03.06.01.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 06:01:19 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  3 Aug 2021 15:01:10 +0200
Message-Id: <20210803130110.3399543-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/s390-tools: fix build with latest
 binutils
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Alexander Egorenkov <egorenar@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fix the following build failure with latest binutils:

/tmp/instance-16/output-1/host/bin/s390x-buildroot-linux-gnu-ld: Error: unable to disambiguate: -no-pie (did you mean --no-pie ?)
make[3]: *** [Makefile:113: data.o] Error 1

Fixes:
 - http://autobuild.buildroot.org/results/90100519d696c49441669117276fb8084796544b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...kefile-no-pie-is-not-a-valid-ld-flag.patch | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 package/s390-tools/0004-zipl-boot-Makefile-no-pie-is-not-a-valid-ld-flag.patch

diff --git a/package/s390-tools/0004-zipl-boot-Makefile-no-pie-is-not-a-valid-ld-flag.patch b/package/s390-tools/0004-zipl-boot-Makefile-no-pie-is-not-a-valid-ld-flag.patch
new file mode 100644
index 0000000000..fcdf06088a
--- /dev/null
+++ b/package/s390-tools/0004-zipl-boot-Makefile-no-pie-is-not-a-valid-ld-flag.patch
@@ -0,0 +1,29 @@
+From 9fd3c733c645be13a2e39a3bae3983f88530b48d Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Lukas=20M=C3=A4rdian?= <lukas.maerdian@canonical.com>
+Date: Thu, 7 Jan 2021 12:46:22 +0100
+Subject: [PATCH] zipl/boot/Makefile: -no-pie is not a valid ld flag
+
+The "-no-pie" option never has been a valid flag of ld. It breaks the build with newer binutils.
+See:
+https://sourceware.org/bugzilla/show_bug.cgi?id=27050
+https://bugs.launchpad.net/ubuntu/+source/s390-tools/+bug/1907789
+
+[Retrieved from: https://github.com/ibm-s390-linux/s390-tools/pull/106]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ zipl/boot/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/zipl/boot/Makefile b/zipl/boot/Makefile
+index a2e5f190..b81df778 100644
+--- a/zipl/boot/Makefile
++++ b/zipl/boot/Makefile
+@@ -109,7 +109,7 @@ stage3.bin:	stage3.exec
+ 		$< $@
+ 
+ data.o: $(FILES)
+-	$(LD) $(NO_PIE_LDFLAGS) -r -b binary -o data.o $(FILES)
++	$(LD) -r -b binary -o data.o $(FILES)
+ 
+ data.h: data.o
+ 	rm -f data.h
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
