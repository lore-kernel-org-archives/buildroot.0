Return-Path: <SRS0=2n7N=M5=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 016B8C4338F
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 17:27:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A198061102
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 17:27:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A198061102
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 47F214014A;
	Fri,  6 Aug 2021 17:27:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EU9WnceYA4J1; Fri,  6 Aug 2021 17:27:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E22C40243;
	Fri,  6 Aug 2021 17:27:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E036C1BF3FC
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 17:27:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD19883A8C
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 17:27:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kWX80VQg2Ea1 for <buildroot@lists.busybox.net>;
 Fri,  6 Aug 2021 17:27:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EB39983A6D
 for <buildroot@buildroot.org>; Fri,  6 Aug 2021 17:27:11 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 i10-20020a05600c354ab029025a0f317abfso9490789wmq.3
 for <buildroot@buildroot.org>; Fri, 06 Aug 2021 10:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g0UC19yeXWyoD51l7e37UGjw+TyJ9Fu87AB3/WF4xUQ=;
 b=HZS6Lisfm9Hnw2iJtsHTMqn3OAWcJ7gtEPbxcgPOUP5a555X12+wJ1EfPPF7sy4/9x
 zwIGcAyd6Hsf56iWe06rR2UZdnHOuBAsKwHZ58r1XJf6Cdoy21N6peO7Le6qGEVu2DJs
 xxYncGIz23l8APKHWRMbciydpt7NPzexzZwaW7Rlta52yloMF+3pK7aSRPPB6xvdegLZ
 wjIP6ZDsNdLNyJDEaCKRm4nwtAcVZtf0Sl6hyHEFPDKdWStSnBrT8lFcLaxzQfkcYiK7
 O83EuaTw1PiT1ZgO2BupmnSUOfVvEFSqmxw8triZAFxq/iDjZbp+PL+bCcRmu7QJtW3r
 cPfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g0UC19yeXWyoD51l7e37UGjw+TyJ9Fu87AB3/WF4xUQ=;
 b=gkWBBofu9+TRnCmbzah6Co9PNqywvyuKb6LmusAoPO3ONBUF9UALshsn0/aX/bEx1f
 lrGGmjLWGNptjCNOncyXt2bjjjQ03asYA8SIqWSc3kdIIjxMDfCAXfuwoA7AgWc1gWrq
 bT+tEqC2f0ZXOpKg8SUEgVIeP6oSDd6jplvvUog9PNd30KCWJ5ciuOiL6u25/bYk4RZf
 M4c0JN9tvyRUgg9EY4vIxder4QLmx64jwQ4e5PgUEX9P59uvhbJiJKUTD3PzxtlXEfRD
 BrsszDVEOqBZLDGkj5zuBxpBsGYe+3xpJMyTz6crcPbjIkhVgmsJJ/B6T9dmoIVJfgNp
 0SQg==
X-Gm-Message-State: AOAM532APrUZMSD52nm8/MhapuSB0x7uiCODdmx7q/u7m7hxQgk/LtZd
 sppEAAYmk8AoBqhW7V8CNlzpMQbWFdP+lA==
X-Google-Smtp-Source: ABdhPJwCxKLcFs3jspDdRl0UMYxdP8l9GhhHZSUOrZjlrxqGYzNn4tlO/CkGqyIgvGSNMgs1pmN68g==
X-Received: by 2002:a05:600c:2942:: with SMTP id
 n2mr4347515wmd.161.1628270829898; 
 Fri, 06 Aug 2021 10:27:09 -0700 (PDT)
Received: from kali.home (pop.92-184-97-157.mobile.abo.orange.fr.
 [92.184.97.157])
 by smtp.gmail.com with ESMTPSA id n18sm10325972wrt.78.2021.08.06.10.27.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 10:27:09 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Aug 2021 19:26:38 +0200
Message-Id: <20210806172638.3566272-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/mutt: link with -latomic if needed
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

Link with -latomic if needed to avoid the following build failure with
openssl:

configure:10549: checking for X509_STORE_CTX_new in -lcrypto
configure:10574: /tmp/instance-0/output-1/host/bin/sparc-linux-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -static -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I/tmp/instance-0/output-1/host/sparc-buildroot-linux-uclibc/sysroot/usr/include  -static -L/tmp/instance-0/output-1/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib conftest.c -lcrypto -lz  >&5
/tmp/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/9.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /tmp/instance-0/output-1/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libcrypto.a(x509cset.o): in function `X509_CRL_up_ref':
x509cset.c:(.text+0xfc): undefined reference to `__atomic_fetch_add_4'

Ideally, mutt should use pkg-config but upstream don't want to use it:
https://gitlab.com/muttmua/mutt/-/merge_requests/25

Fixes:
 - http://autobuild.buildroot.org/results/e357984853f8ca879156245717fadbeaa9b0dbae

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mutt/mutt.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index a8734855f8..66616f032c 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -12,6 +12,10 @@ MUTT_CPE_ID_VENDOR = mutt
 MUTT_DEPENDENCIES = ncurses
 MUTT_CONF_OPTS = --disable-doc --disable-smtp
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+MUTT_CONF_ENV += LIBS=-latomic
+endif
+
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 MUTT_DEPENDENCIES += libiconv
 MUTT_CONF_OPTS += --enable-iconv
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
