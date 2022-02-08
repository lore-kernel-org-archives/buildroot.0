Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48BE2C433F5
	for <buildroot@archiver.kernel.org>; Tue,  8 Feb 2022 18:29:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 048FC81328;
	Tue,  8 Feb 2022 18:29:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PJuTzXDwvHt0; Tue,  8 Feb 2022 18:29:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3036881322;
	Tue,  8 Feb 2022 18:29:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A9D641BF2AF
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 18:29:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A59A5401CA
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 18:29:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IYOMpAnpXwh4 for <buildroot@lists.busybox.net>;
 Tue,  8 Feb 2022 18:29:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 88F254013F
 for <buildroot@buildroot.org>; Tue,  8 Feb 2022 18:29:08 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 bg21-20020a05600c3c9500b0035283e7a012so2381613wmb.0
 for <buildroot@buildroot.org>; Tue, 08 Feb 2022 10:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PeTEelwNupM/r4GnDpgrQ7c1R/G9qQZzzKWR2XmIO5I=;
 b=nVgqQnU4FJ5ux25AiIBwfUV9AX+Qxig6ta4pTSxCz6cqtixLj1ZqWeSTMmTFYFwm2H
 C5XW+e5VRYOcG3xpwN/DZgQOwi2UJUP78rGYKWU6+X2EYQB/FdxAM169i+ScAgfKCBo8
 AFrVDjUVtSGWBMxXj703tj84eAtScBJ7BOR3kTRa9ftv5CsX3nKbZEMjVDb9k10MnQaf
 sgi34iVqtA9p0+n4iW03PXYFL01yVwY2sAdHN89QTRh3B/wS178Fs8bWmQ1+xIkaRHTo
 VwwF0O4GevJ/MPKZEE5ASxgqgQrU6zffFeHwKF/dvNIQNiLI8x8E6F2MO4z6FTPqSGUr
 36ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PeTEelwNupM/r4GnDpgrQ7c1R/G9qQZzzKWR2XmIO5I=;
 b=ISKmInkpob0E1z0k0CgiNwLjB/+zgbKbN7tFQm/pQvhWkAhEk4semlIGJG25ffYrfW
 nO+sH4DUGwqpXBLC7RZ6U3B/L+g4yxfNfLJA5xuB/hZDEI3k/DQkooz8aoq+ECIJh/Wx
 qeTNntFB3PYS/iw0iK1GEfeFUpbxZULLmz3iwKTpzaJydEUDR3B+0kcd+QUACeg2Pny+
 NaQlXACFuDqQSUW4cFguWeWJxdWnYRzpytvQV3RtBJIC3yUMtyVobj+V3rrG5jOTXy3x
 X3p7aK+xuZqzUQVD8iM2IzZ/Lxexb4HEt/0xKa9mRs8dqdqsepUxqVjN8QKpjOKDPfLs
 Jf+A==
X-Gm-Message-State: AOAM533vOh4koG/ih7uCcNijd31jXl4DvZ3ikxnCB6uDIzhSbutIFtQw
 Qij9+hy7uThEezXXSVoyINhMG4u/kJY=
X-Google-Smtp-Source: ABdhPJwN45Yu3MYpCOn98DJFKeYH7k/0TIFJpZN4g6Hisf6k7vX/oMQYiBWxMP4nY9T12aXMGycOmQ==
X-Received: by 2002:a05:600c:10cc:: with SMTP id
 l12mr2119301wmd.34.1644344946364; 
 Tue, 08 Feb 2022 10:29:06 -0800 (PST)
Received: from kali.home (pop.92-184-105-81.mobile.abo.orange.fr.
 [92.184.105.81])
 by smtp.gmail.com with ESMTPSA id 5sm15412043wrb.113.2022.02.08.10.29.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 10:29:06 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  8 Feb 2022 19:29:29 +0100
Message-Id: <20220208182929.3976984-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/resiprocate: fix build of rend with
 gcc 11
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure of rend with gcc 11:

/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/riscv32-buildroot-linux-gnu/include/c++/11.2.0/bits/stl_tree.h:770:15: error: static assertion failed: comparison object must be invocable as const
  770 |               is_invocable_v<const _Compare&, const _Key&, const _Key&>,
      |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/ad9d89fefe1a667daa123397a072bf130bfa03a7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...e-issue-compiling-with-Visual-Studio.patch | 95 +++++++++++++++++++
 1 file changed, 95 insertions(+)
 create mode 100644 package/resiprocate/0001-Fix-some-issue-compiling-with-Visual-Studio.patch

diff --git a/package/resiprocate/0001-Fix-some-issue-compiling-with-Visual-Studio.patch b/package/resiprocate/0001-Fix-some-issue-compiling-with-Visual-Studio.patch
new file mode 100644
index 0000000000..826774ce8d
--- /dev/null
+++ b/package/resiprocate/0001-Fix-some-issue-compiling-with-Visual-Studio.patch
@@ -0,0 +1,95 @@
+From be76b10a50749e2e11dce8dcc38b414a7f9d8747 Mon Sep 17 00:00:00 2001
+From: Ben Walden <bwalden@redboxvoice.com>
+Date: Sat, 22 Aug 2020 23:14:11 +0100
+Subject: [PATCH] Fix some issue compiling with Visual Studio 16.7.0 and tidy
+ up Visual Studio 16 project files
+
+[Retrieved (and updated to keep only RendKa.cxx update) from:
+https://github.com/resiprocate/resiprocate/commit/be76b10a50749e2e11dce8dcc38b414a7f9d8747]
+SIgned-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ VisualStudioReadme.htm                        |   65 +
+ contrib/GeoIP/GeoIP_12_0.vcxproj              |  550 -------
+ contrib/GeoIP/GeoIP_16_0.vcxproj              |   93 +-
+ .../db/build_windows/db_static_12_0.vcxproj   | 1260 -----------------
+ .../db/build_windows/db_static_16_0.vcxproj   |  696 +--------
+ contrib/db/dbinc/atomic.h                     |    4 +-
+ contrib/db/mp/mp_fget.c                       |    4 +-
+ contrib/db/mp/mp_mvcc.c                       |    4 +-
+ contrib/db/mp/mp_region.c                     |    4 +-
+ contrib/db/mutex/mut_method.c                 |    2 +-
+ contrib/pcre/pcre_12_0.vcxproj                |  466 ------
+ contrib/pcre/pcre_16_0.vcxproj                |  159 +--
+ contrib/popt/popt_12_0.vcxproj                |  394 ------
+ contrib/popt/popt_16_0.vcxproj                |  120 +-
+ reSIProcate_16_0.sln                          |   58 +-
+ .../queuetostream_12_0.vcxproj                |  582 --------
+ .../queuetostream_16_0.vcxproj                |  207 ++-
+ repro/repro_12_0.vcxproj                      |  825 -----------
+ repro/repro_12_0.vcxproj.filters              |   47 -
+ repro/repro_16_0.vcxproj                      |  159 ++-
+ repro/reprocmd/reprocmd_12_0.vcxproj          |  597 --------
+ repro/reprocmd/reprocmd_16_0.vcxproj          |  139 +-
+ repro/reprolib_12_0.vcxproj                   |  596 --------
+ repro/reprolib_12_0.vcxproj.filters           |  136 --
+ repro/reprolib_16_0.vcxproj                   |  132 +-
+ resip/dum/dum_12_0.vcxproj                    |  615 --------
+ resip/dum/dum_16_0.vcxproj                    |  124 +-
+ resip/dum/test/basicCall_12_0.vcxproj         |  621 --------
+ resip/dum/test/basicCall_16_0.vcxproj         |  145 +-
+ resip/dum/test/basicClient_12_0.vcxproj       |  653 ---------
+ resip/dum/test/basicClient_16_0.vcxproj       |  158 +--
+ resip/dum/test/basicMessage_12_0.vcxproj      |  615 --------
+ resip/dum/test/basicMessage_16_0.vcxproj      |  141 +-
+ resip/dum/test/basicRegister_12_0.vcxproj     |  615 --------
+ resip/dum/test/basicRegister_16_0.vcxproj     |  137 +-
+ resip/rend/RendKa.cxx                         |    2 +-
+ resip/rend/rend_12_0.vcxproj                  |  352 -----
+ resip/rend/rend_16_0.vcxproj                  |   89 +-
+ resip/stack/resiprocate_12_0.vcxproj          |  873 ------------
+ resip/stack/resiprocate_12_0.vcxproj.filters  |  351 -----
+ resip/stack/resiprocate_16_0.vcxproj          |  165 ++-
+ resip/stack/test/test_12_0.vcxproj            |  627 --------
+ resip/stack/test/test_16_0.vcxproj            |  171 ++-
+ rutil/dns/ares/ares_12_0.vcxproj              |  488 -------
+ rutil/dns/ares/ares_12_0.vcxproj.filters      |   34 -
+ rutil/dns/ares/ares_16_0.vcxproj              |  159 +--
+ rutil/rutil_12_0.vcxproj                      |  604 --------
+ rutil/rutil_16_0.vcxproj                      |  153 +-
+ 48 files changed, 1409 insertions(+), 13782 deletions(-)
+ delete mode 100644 contrib/GeoIP/GeoIP_12_0.vcxproj
+ delete mode 100644 contrib/db/build_windows/db_static_12_0.vcxproj
+ delete mode 100644 contrib/pcre/pcre_12_0.vcxproj
+ delete mode 100644 contrib/popt/popt_12_0.vcxproj
+ delete mode 100644 repro/accountingconsumers/queuetostream_12_0.vcxproj
+ delete mode 100644 repro/repro_12_0.vcxproj
+ delete mode 100644 repro/repro_12_0.vcxproj.filters
+ delete mode 100644 repro/reprocmd/reprocmd_12_0.vcxproj
+ delete mode 100644 repro/reprolib_12_0.vcxproj
+ delete mode 100644 repro/reprolib_12_0.vcxproj.filters
+ delete mode 100644 resip/dum/dum_12_0.vcxproj
+ delete mode 100644 resip/dum/test/basicCall_12_0.vcxproj
+ delete mode 100644 resip/dum/test/basicClient_12_0.vcxproj
+ delete mode 100644 resip/dum/test/basicMessage_12_0.vcxproj
+ delete mode 100644 resip/dum/test/basicRegister_12_0.vcxproj
+ delete mode 100644 resip/rend/rend_12_0.vcxproj
+ delete mode 100644 resip/stack/resiprocate_12_0.vcxproj
+ delete mode 100644 resip/stack/resiprocate_12_0.vcxproj.filters
+ delete mode 100644 resip/stack/test/test_12_0.vcxproj
+ delete mode 100644 rutil/dns/ares/ares_12_0.vcxproj
+ delete mode 100644 rutil/dns/ares/ares_12_0.vcxproj.filters
+ delete mode 100644 rutil/rutil_12_0.vcxproj
+
+diff --git a/resip/rend/RendKa.cxx b/resip/rend/RendKa.cxx
+index 8645f17636..8321ada1ee 100644
+--- a/resip/rend/RendKa.cxx
++++ b/resip/rend/RendKa.cxx
+@@ -66,7 +66,7 @@ bool operator<(const RendKaAssoc& a, const RendKaAssoc& b)
+ 
+ struct RendKaConn 
+ {
+-   bool operator() (const RendKaAssocPtr& a, const RendKaAssocPtr& b) 
++   bool operator()(const RendKaAssocPtr& a, const RendKaAssocPtr& b) const
+    {
+       return *a < *b;
+    }
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
