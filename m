Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19DA8C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 13:46:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8CEA60F46
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 13:46:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C8CEA60F46
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FDA6835EF;
	Tue,  3 Aug 2021 13:46:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wmRHk2bF7nx2; Tue,  3 Aug 2021 13:46:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBB65835C6;
	Tue,  3 Aug 2021 13:46:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D1D611BF84C
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 13:46:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD440402DA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 13:46:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PihCaxfgxBXb for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 13:46:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 92F0F40270
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 13:46:44 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id h13so11924596wrp.1
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 06:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CbC2DDRF5O3m8ja5XmDRwtPvYrJrRx371pUa+JDnBxc=;
 b=XwJd6W5ViXwOpYQgoqSU0vyGZdnsgrRe8ryKe+o0/35PKnY8cnvjWI0kKZQGFRnOqM
 HFYUZHU8zkCteNZseiTBUgoOlOf9XPxxPW0aV+ek5NzKNP+vsn1lkprwPUz6bytPPH04
 JSoVrctN4B4mg7bI9Tjaq4RDepAl9IfazN1kPhj7UKYWCE5JFyIIxUsorsYoeY14be59
 h95qh/1G86tqmFc4ALrWcLyiqUzezZVgHh/SZiekR3tM3wkaFFxDUrC+KygDAX4uQU0A
 3QlSIf0rLLg+wVPkhzXNPKVb5uruKk+wYopkrE2H1bXb3clyabDP6Byv7EPYbzgKpCO1
 +4+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CbC2DDRF5O3m8ja5XmDRwtPvYrJrRx371pUa+JDnBxc=;
 b=f0DxhbYGN/jKJT9mf2m0nlQiC0ZYoh7A8BAizUFMIEQosA4nt6DT8rI2kW3AIZgRiT
 NCRoxts1BqpSX5o5lcmxDrU1q1Bd50gBqmBl0AYwGL4DKlz/3ufpbaiuJREBKWaDnpvq
 j+aBCrKuStR2LwP329eLB2DmAz1nJD1BuyeOmTKh+quPWkKuGA/yEjCf2Iv8QCY0HPCi
 m4/EAwZzuQyOg4YuVibqwkaYDL6+fnL+S43pXIaSfWh9K/tuGeX1azuQimp5H70gB2iu
 +YPa2xsREOmruxrpKEV5yTRspI2IEpt9oTyJ64LQGbGsTsa4CpaCHXQZ1FmsT166MVQM
 rV9g==
X-Gm-Message-State: AOAM531NbmdXu+kqVUeeXGbO4uJBfkyy6tcvfI2OKw2YdbNkKBJAM7B+
 Oz9zohEV/bFA6V9C6Ml/H6XXx27g/HI6Nw==
X-Google-Smtp-Source: ABdhPJy/NnYeXhIK/AJ1mCVsZU2NOvi9MBLtxjRJqeUeceAbK6Q/U8gK0YhgnHlZYI4c/F/5nBnCjQ==
X-Received: by 2002:adf:f8c8:: with SMTP id f8mr20532090wrq.204.1627998402359; 
 Tue, 03 Aug 2021 06:46:42 -0700 (PDT)
Received: from kali.home (pop.92-184-97-219.mobile.abo.orange.fr.
 [92.184.97.219])
 by smtp.gmail.com with ESMTPSA id z20sm13088387wmi.36.2021.08.03.06.46.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 06:46:41 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  3 Aug 2021 15:46:33 +0200
Message-Id: <20210803134633.4009691-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libodb-pqsql: fix build with gcc 11
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fix the following build failure with gcc 11:

configure:13698: checking for libodb
configure:13772: /tmp/instance-1/output-1/host/bin/arm-buildroot-linux-gnueabihf-g++ -c -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0 -D_FORTIFY_SOURCE=2 -D_REENTRANT  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 conftest.cpp >&5
In file included from /tmp/instance-1/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/odb/exception.hxx:15,
                 from conftest.cpp:26:
/tmp/instance-1/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/odb/details/shared-ptr/base.hxx:38:49: error: ISO C++17 does not allow dynamic exception specifications
   38 | operator new (std::size_t, odb::details::share) throw (std::bad_alloc);
      |                                                 ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/73b06d7f923e5a7294377951f212b89b6cb0946a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libodb-pgsql/libodb-pgsql.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libodb-pgsql/libodb-pgsql.mk b/package/libodb-pgsql/libodb-pgsql.mk
index 038f7878c0..014116883f 100644
--- a/package/libodb-pgsql/libodb-pgsql.mk
+++ b/package/libodb-pgsql/libodb-pgsql.mk
@@ -12,5 +12,6 @@ LIBODB_PGSQL_LICENSE = GPL-2.0
 LIBODB_PGSQL_LICENSE_FILES = LICENSE
 LIBODB_PGSQL_INSTALL_STAGING = YES
 LIBODB_PGSQL_DEPENDENCIES = postgresql libodb
+LIBODB_PGSQL_CONF_ENV = CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
 
 $(eval $(autotools-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
