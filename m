Return-Path: <SRS0=2n7N=M5=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC80BC4338F
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 14:36:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DD63611C5
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 14:36:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5DD63611C5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2ACBC83A9F;
	Fri,  6 Aug 2021 14:36:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IosT0FTgONAr; Fri,  6 Aug 2021 14:36:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D9E483AA6;
	Fri,  6 Aug 2021 14:36:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4E6821BF321
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 14:36:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3DB38401FE
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 14:36:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id isPZ7Jdgnqbk for <buildroot@lists.busybox.net>;
 Fri,  6 Aug 2021 14:36:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5A171401F9
 for <buildroot@buildroot.org>; Fri,  6 Aug 2021 14:36:53 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id n12so1316928wrr.2
 for <buildroot@buildroot.org>; Fri, 06 Aug 2021 07:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d779WfQ4vt5OAtsgvM8X4x96/q6GFV18h+7yNmYgoT4=;
 b=dSt3v8FaGbakyXeL1JVygSW2EV2AGFOKB25IBuPkukjju5uEvZ1F6VHv31VULsoLvf
 YVYpuIXXzdDdLrqjGNUhHFhLv+UFphitXsL5sVqJtA5dxRN+ZOluSOkWoI3eugfJsxd7
 aHKnZwC7txsdGI6cITgIEN29ySw5yEoh+BvFkuEg/sy9zroft9S9aeIiv7MD1LKjgzav
 70CgkT3VqvPoSHmnRPI9PA6j83U6lc8skztYfm0DZDqJZdMra2FzeBzMrcpmIXoU4wbp
 DtL9PYC71jR6VXLXExhoB4EvgWBXxo4nqMwRvbX2+Okr5ELlLxAIVmjSuknUmakDACv3
 zSdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d779WfQ4vt5OAtsgvM8X4x96/q6GFV18h+7yNmYgoT4=;
 b=T0k/DT4HXyvKXHem87dJWCMWVjM0SCVzmyRfXdrrx1rHwmtUSz27nydDb0zadH7t0r
 +ZCwIugISFJoKnAMHoqLZ7Os6S7TdcMFkGrWXBPykusBs6T9RAfq5m7jPt5OJIOsXRzJ
 3HHY7GNGWx/HfocW78IW99+nm8ynC6zML5DM0HAgfu4Xchc6uuRFmk9qm4wD+tHUwF/s
 a1VYhoLsgnNfvdgH9n1jCHcCCSyD02jlXhpyyawYGYvS7MYfgU179S6IgLh1DPNJutff
 76Ka5ksdGidx9ZksWMSxowFyXDUggNnTNkk+ryHrlQtLJCb735PkD8xg/98WKa6xSu44
 HmPw==
X-Gm-Message-State: AOAM531I06m8a0fMs4qUbDvdGoh+XRApsNOt5C8hSKixnoPQhYwe6DtO
 JYCKWoLVlRjKrukdzXxpakwEhUBpPMC58w==
X-Google-Smtp-Source: ABdhPJxfENeO0UIeqw8muZ/pG5IB5L414K9aUoid1gQZV/fAZJ0L1EKz0R5VsAisxuWWMhymdU+7bg==
X-Received: by 2002:adf:eecf:: with SMTP id a15mr11386185wrp.269.1628260611275; 
 Fri, 06 Aug 2021 07:36:51 -0700 (PDT)
Received: from kali.home (pop.92-184-97-49.mobile.abo.orange.fr.
 [92.184.97.49])
 by smtp.gmail.com with ESMTPSA id h14sm9710343wrp.55.2021.08.06.07.36.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 07:36:50 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Aug 2021 16:36:41 +0200
Message-Id: <20210806143641.3449707-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: add -latomic to
 libavformat.pc
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

-latomic was added to extralibs to fix static build of ffmpeg in commit
fc8798197b57488a852e2c14b4677b5eb0114a0b. However, extralibs is not
added to libavformat.pc resulting in the following static build failure
of motion:

/home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/buildroot/autobuild/instance-1/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libavformat.a(fifo.o): in function `fifo_init':
/home/buildroot/autobuild/instance-1/output-1/build/ffmpeg-4.4/libavformat/fifo.c:519: undefined reference to `__atomic_store_8'

So add a patch to add extralibs (and so -latomic) to libavformat.pc

Fixes:
 - http://autobuild.buildroot.org/results/62ec618e40081a250b8129ec6f5a178eb06fba1d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-add-extralibs-to-extralibs_avformat.patch | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 package/ffmpeg/0004-configure-add-extralibs-to-extralibs_avformat.patch

diff --git a/package/ffmpeg/0004-configure-add-extralibs-to-extralibs_avformat.patch b/package/ffmpeg/0004-configure-add-extralibs-to-extralibs_avformat.patch
new file mode 100644
index 0000000000..f4a2f75e59
--- /dev/null
+++ b/package/ffmpeg/0004-configure-add-extralibs-to-extralibs_avformat.patch
@@ -0,0 +1,30 @@
+From 2aee898241246d293bed9b609926b4a8014dfcb9 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 6 Aug 2021 09:17:20 +0200
+Subject: [PATCH] configure: add extralibs to extralibs_avformat
+
+Add extralibs to extralibs_avformat to allow applications such as motion
+to retrieve ffmpeg dependencies such as -latomic through pkg-config
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: not upstreamable]
+---
+ configure | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure b/configure
+index 0bb3a7cf2b..cb366c3ba6 100755
+--- a/configure
++++ b/configure
+@@ -7604,7 +7604,7 @@ LIBPREF=${LIBPREF}
+ LIBSUF=${LIBSUF}
+ extralibs_avutil="$avutil_extralibs"
+ extralibs_avcodec="$avcodec_extralibs"
+-extralibs_avformat="$avformat_extralibs"
++extralibs_avformat="$avformat_extralibs $extralibs"
+ extralibs_avdevice="$avdevice_extralibs"
+ extralibs_avfilter="$avfilter_extralibs"
+ extralibs_avresample="$avresample_extralibs"
+-- 
+2.30.2
+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
