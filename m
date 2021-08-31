Return-Path: <SRS0=R6N7=NW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CBC3C432BE
	for <buildroot@archiver.kernel.org>; Tue, 31 Aug 2021 19:58:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE22461057
	for <buildroot@archiver.kernel.org>; Tue, 31 Aug 2021 19:58:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DE22461057
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE69D40289;
	Tue, 31 Aug 2021 19:58:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0z6C1qxx4iHh; Tue, 31 Aug 2021 19:58:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF4894063C;
	Tue, 31 Aug 2021 19:58:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 75CE01BF362
 for <buildroot@lists.busybox.net>; Tue, 31 Aug 2021 19:58:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5FFE9613B8
 for <buildroot@lists.busybox.net>; Tue, 31 Aug 2021 19:58:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v3AfY7-UpVnA for <buildroot@lists.busybox.net>;
 Tue, 31 Aug 2021 19:58:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 56FDA605C5
 for <buildroot@buildroot.org>; Tue, 31 Aug 2021 19:58:37 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 c129-20020a1c35870000b02902e6b6135279so346227wma.0
 for <buildroot@buildroot.org>; Tue, 31 Aug 2021 12:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wIhnpPF6T5UMhYGDXE5PNOdy0Itbz7472gMY5xKvncw=;
 b=Dm6DIf9uin0ltqslVAHf76DJM9H375TemZHtoKtBhqfvatUfrnay4+TcNJNZAfS8VP
 MakjvIS+CobDyUrcMyVHjggxx3ycCRzBzPBnZz/YW3+aWYQ9NHGrgLn4twmuJ/IbC4g9
 DzBLyFDauhSsHfXogMfazQUqioTX8mvqD0JACjdi/oX29+tb17xWeVzu1ayvXuMy8J/4
 zUXHtywq68CA+w/rkscMl68bPYo7Y6P29Cx40qm2aXJwAnOljx+ZekO4KENIlrfBMBGX
 lqP3dLlri4h4rXW2/n/ywuqALjk06PMUbS3ZGWWtLB5b46dSqSd50sScpbBF2k9sv9+s
 e5PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wIhnpPF6T5UMhYGDXE5PNOdy0Itbz7472gMY5xKvncw=;
 b=Ml1HaxjNYHHrwJHdy2B1xMU/oxgZY5i0MBYCUfg7MNQlrLJlaqUV0K0hHCKToyBCXW
 lW62L1QtOVDeurNR0l5rnjKEkpBclHMynl6S7dnHyO/UoFIXb0on28CZYBCFwQJlRbSd
 iGplwTXW5CAK+BWDK1CwMzHbyBusnTNvytmZCh7FDMje+8Vpn+vF26Dy72t+5VrOe/bs
 NGd+MvCeMxhLi6CFU4/2pELB3jRezQRtnnh1t4hT3G/cNTr4yMZ8HLnevXI0xgbDy/cR
 nRVkN861BRfgFDr9D8+UK6Lj0oYScmReU4d1V2AObO6BAp5pHMZXGqptIEK4+Y9zoZbT
 bL/w==
X-Gm-Message-State: AOAM533zlj9qeCewh12dUYZkMziGlhiaplPiZJ3eSJ2Fz1jWrCwZAnfc
 1bKA60C21Hz3xkmXU5hKoUD7Idq3ZLFDSg==
X-Google-Smtp-Source: ABdhPJyBzCf/LKFkdWnqNpZS76Or840E4eMn8zfW8WLRJwyVWpeA5vakAescU284u5qYEzHJJqvZLA==
X-Received: by 2002:a05:600c:5123:: with SMTP id
 o35mr5893651wms.153.1630439915382; 
 Tue, 31 Aug 2021 12:58:35 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id c3sm20021357wrd.34.2021.08.31.12.58.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 12:58:31 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 31 Aug 2021 21:58:12 +0200
Message-Id: <20210831195812.1095065-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/zip: fix musl static build
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
Cc: Jan Pedersen <jp@jp-embedded.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fix the following static build failure on musl which is raised because
the "Check for directory libraries" in configure wrongly adds -DNO_DIR
when no directory library is needed:

/tmp/instance-0/output-1/host/bin/arm-buildroot-linux-musleabihf-gcc -c -D_FILE_OFFSET_BITS=64 -O2 -g0 -static -I. -DUNIX -DUIDGID_NOT_16BIT -DBZIP2_SUPPORT -DLARGE_FILE_SUPPORT -DUNICODE_SUPPORT -DNO_MKTIME -DNO_DIR -DHAVE_DIRENT_H -DHAVE_TERMIOS_H unix/unix.c
unix/unix.c:70:14: error: conflicting types for 'DIR'
   70 | typedef FILE DIR;
      |              ^~~

Fixes:
 - http://autobuild.buildroot.org/results/83a6e0c8c4ad026cb0261246e3b1a80d754454bd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/zip/0008-fix-musl-static-build.patch | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 package/zip/0008-fix-musl-static-build.patch

diff --git a/package/zip/0008-fix-musl-static-build.patch b/package/zip/0008-fix-musl-static-build.patch
new file mode 100644
index 0000000000..a7a31eba9e
--- /dev/null
+++ b/package/zip/0008-fix-musl-static-build.patch
@@ -0,0 +1,20 @@
+fix musl static build
+
+Don't define NO_DIR if no directory library is needed
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+
+diff -Nura zip30.orig/unix/configure zip30/unix/configure
+--- zip30.orig/unix/configure	2021-08-31 21:29:55.219967136 +0200
++++ zip30/unix/configure	2021-08-31 21:50:48.239280513 +0200
+@@ -569,8 +569,8 @@
+   done
+   if [ ${OPT} ]; then
+     LFLAGS2="${LFLAGS2} ${OPT}"
+-  else
+-    CFLAGS="${CFLAGS} -DNO_DIR"
++  #else
++  #  CFLAGS="${CFLAGS} -DNO_DIR"
+   fi
+ fi
+ 
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
