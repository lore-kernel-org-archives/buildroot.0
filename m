Return-Path: <SRS0=wdlY=MS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5361CC4338F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 06:38:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D72FA60F0F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 06:38:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D72FA60F0F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A16E94028F;
	Mon, 26 Jul 2021 06:38:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wmHvtaHaHVEt; Mon, 26 Jul 2021 06:38:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DFF9240286;
	Mon, 26 Jul 2021 06:38:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 057011BF3A8
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 06:38:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E3E20835E0
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 06:38:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A7lgVseFGKKf for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 06:38:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EA1B5835D9
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 06:38:11 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id l18so2032327wrv.5
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 23:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uY+38Sa2SroF0/TsuaQEt+pClWcvYGRp1EDwmFcq9qQ=;
 b=onuhz8WlreMqjhmITdmaythUDH1hmgdJiPn3/Y4nwriEJgEqqY4BxP9aEIVhKsny1u
 Zu/K6EzNCFPIXDnnf6aApVWQmBYp6+wgxp+LPu4mPaqiiJLlHBuJL/TYAR5W/0SgrRtK
 FnIAVunbCU/rpzNaKbdWgSkRX13QkJQqjuYJpQKQf6cosGGi0LnP1T4TvQMdDHraXoit
 0GrSoR2RtHw+pbMr0+554RwWpShTuzE7dJc8VMYFaV6iKefhd+gtMuJBNqMmkcVA7eXY
 E+/ZV5avTnMyArS4+Djy9zeV6NDBZ5zUnuRc2U+R6UlXR9lGF52dEjfoaVGZj8RM6NJO
 E8GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uY+38Sa2SroF0/TsuaQEt+pClWcvYGRp1EDwmFcq9qQ=;
 b=hAOIuQtYhIy9Nm3SzOAGZdR40x9A1d7HiUWCDKPc9J0ieGJdudvyygSnon4XjAUnyV
 HFCqONEhAwVei7fEpLXm5c+DtJz4Uxclskb3xK4NIZrrrN9oISl5GdXMvnyfZPW5caZM
 ck16v7r4c67a30b+PqSiNTe1vqrGyBAgrPF4EAi4KwxRsgGEG4fqc0Hcxhei70UiLGe3
 MfMLuAAUDoN2HDh2jjZbXImK01llD3ExrleOET6NrPiN48W2TaGyi6SLFD+mlZZJeyxZ
 /TrdPrMhzP9EOZzXbvhmeHDxo618d0ED18+ogbPotJ5SzIs5Y+o5AQJRBnSJFyAuGFFO
 6XYQ==
X-Gm-Message-State: AOAM533b9YR0QK2O3awzqVoo/u1CVIMbPrOjCtWKQHQu+oWQt0fa+9ZN
 h7mSsOjA7dpRvPd07yEgq8UK8eoEt2YG5w==
X-Google-Smtp-Source: ABdhPJwj1pHEZwQnn7Pep00vzpjTmpEPn/sF7zMc99lV2gNi1tE+ZcOhh+IbyRwx8+UidPA5RUtB8Q==
X-Received: by 2002:a05:6000:184a:: with SMTP id
 c10mr17648730wri.218.1627281489856; 
 Sun, 25 Jul 2021 23:38:09 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id u15sm3099611wmn.6.2021.07.25.23.38.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 23:38:09 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jul 2021 08:37:49 +0200
Message-Id: <20210726063750.1698302-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/libmodsecurity: fix static build
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
Cc: Frank Vanbever <frank.vanbever@essensium.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fix the following static build failure with nginx raised since bump of
libmodsecurity to version 3.0.5 in commit
464d0be380c84ac7c3f1684e49153c3868280d7e:

/home/buildroot/autobuild/instance-2/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/10.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: /home/buildroot/autobuild/instance-2/output-1/host/bin/../xtensa-buildroot-linux-uclibc/sysroot/usr/lib/libmodsecurity.a(libmodsecurity_la-transaction.o): in function `std::basic_streambuf<char, std::char_traits<char> >::sbumpc() [clone .isra.0]':
transaction.cc:(.text+0x40): undefined reference to `std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_M_dispose()'

Fixes:
 - http://autobuild.buildroot.org/results/e5a9eb8448980f1c5cafe97180b7d1f48ddf02ca

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0002-modsecurity.pc.in-add-lstdc.patch    | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/libmodsecurity/0002-modsecurity.pc.in-add-lstdc.patch

diff --git a/package/libmodsecurity/0002-modsecurity.pc.in-add-lstdc.patch b/package/libmodsecurity/0002-modsecurity.pc.in-add-lstdc.patch
new file mode 100644
index 0000000000..6511e6f1e0
--- /dev/null
+++ b/package/libmodsecurity/0002-modsecurity.pc.in-add-lstdc.patch
@@ -0,0 +1,32 @@
+From 1a84881b280eb08852d5495c57e44351a40d3f91 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 26 Jul 2021 00:24:57 +0200
+Subject: [PATCH] modsecurity.pc.in: add -lstdc++
+
+Add -lstdc++ to Libs.Private to avoid the following static build failure
+with nginx:
+
+/home/buildroot/autobuild/instance-2/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/10.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: /home/buildroot/autobuild/instance-2/output-1/host/bin/../xtensa-buildroot-linux-uclibc/sysroot/usr/lib/libmodsecurity.a(libmodsecurity_la-transaction.o): in function `std::basic_streambuf<char, std::char_traits<char> >::sbumpc() [clone .isra.0]':
+transaction.cc:(.text+0x40): undefined reference to `std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_M_dispose()'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/e5a9eb8448980f1c5cafe97180b7d1f48ddf02ca
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ modsecurity.pc.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/modsecurity.pc.in b/modsecurity.pc.in
+index 96cdf5ca..7c895ddc 100644
+--- a/modsecurity.pc.in
++++ b/modsecurity.pc.in
+@@ -8,4 +8,4 @@ Description: ModSecurity API
+ Version: @MSC_VERSION_WITH_PATCHLEVEL@
+ Cflags: -I@includedir@
+ Libs: -L@libdir@ -lmodsecurity
+-Libs.private: @CURL_LDADD@ @GEOIP_LDADD@ @MAXMIND_LDADD@ @GLOBAL_LDADD@ @LIBXML2_LDADD@ @LMDB_LDADD@ @LUA_LDADD@ @PCRE_LDADD@ @SSDEEP_LDADD@ @YAJL_LDADD@
++Libs.private: @CURL_LDADD@ @GEOIP_LDADD@ @MAXMIND_LDADD@ @GLOBAL_LDADD@ @LIBXML2_LDADD@ @LMDB_LDADD@ @LUA_LDADD@ @PCRE_LDADD@ @SSDEEP_LDADD@ @YAJL_LDADD@ -lstdc++
+-- 
+2.30.2
+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
