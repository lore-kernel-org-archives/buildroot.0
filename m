Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A66C433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Apr 2022 16:17:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6960611F4;
	Fri, 22 Apr 2022 16:16:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CY2SiJaVIZ9o; Fri, 22 Apr 2022 16:16:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F242B612EE;
	Fri, 22 Apr 2022 16:16:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5B4DC1BF842
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 16:15:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 54B3582796
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 16:15:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id psDUk_chG_QU for <buildroot@lists.busybox.net>;
 Fri, 22 Apr 2022 16:15:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 407E582894
 for <buildroot@busybox.net>; Fri, 22 Apr 2022 16:15:39 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id r19so5385755wmq.0
 for <buildroot@busybox.net>; Fri, 22 Apr 2022 09:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mM5QateBFLIUoy5e1FdCikyjb3CwSgJISFg2It/ZfA4=;
 b=XgH5tWBKR+3yXcWOcZZzimOmstTDaXs8XDWJ4IQbJ6rI05f0uqf3Bys/US70zi5X5L
 UYe07hxuVB9oYLMdFE9kQyCP5HVx7IpiBQjlXJdrw/EvfRRzyhq4H7dwbRNnIyKvtb19
 1xFmkczI44+hesfo6lxACi0UKtBHFg5ixPvTMTmyLEQR/D5jcLs6oZCTHAHafYdwjpqZ
 DllVtkv6IkaVZ3fEIG70x+Sc/P7+JtLzhDcwm+ijSGTp9AfSqKQdFKL4ZEmDbTGHydvX
 q8rg0LhXBDbSCwMBrrAe244Ar0fixckme6FMqYqfxtq8+Ffb+Ao5HPCsbMO2wbklDQRB
 lf/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mM5QateBFLIUoy5e1FdCikyjb3CwSgJISFg2It/ZfA4=;
 b=lwz1rpNixy0es0wI5UI/nbgi2vA8tndgr1/9otjNz1B521bSj/ULbiVl7inHygcQlr
 BqnFnquiOau4pufUAI6WtQLsb72hXDBrNOCVl2MDJhgEeG4+WZ1hR2+kPxO2pxu/qLsY
 CAkk55SNh3/7hoHyeHBGHV5eYWPJFtID0PlzYCc4CYyFcCCybsxpeF2A7uP5p55TmV9i
 lMjOqyZ3+xDe/R5SSeIEZmligKeoocDFMApaeHUKeIQ+ObbOwz+uchEwZf8chuJQNIHB
 Ttx7ASWoKsjmuKNRlUThb4nVWOUpj9w7m/ikeCxa4FmFr2VCmrSHl+ionklwtys97X+2
 P4aQ==
X-Gm-Message-State: AOAM533/5kF4BqLDTRrEF+3juRtZ+gm3J0UqtUyiXprqDZnLuiWZ+nqN
 H5luCZmMbpNLzgGYAqRWDmrPq2UVA3g=
X-Google-Smtp-Source: ABdhPJycuIDHJJaGv00jsebAKXO0ot6PuE8yWT98Xx2ESYL0/EWefq2eexdQkAxDtJlpuG9SzDsXRw==
X-Received: by 2002:a7b:c844:0:b0:37b:b986:7726 with SMTP id
 c4-20020a7bc844000000b0037bb9867726mr5062611wml.160.1650644137469; 
 Fri, 22 Apr 2022 09:15:37 -0700 (PDT)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 c186-20020a1c35c3000000b0038e6c6fc860sm2010671wma.37.2022.04.22.09.15.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 09:15:37 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri, 22 Apr 2022 18:15:13 +0200
Message-Id: <20220422161514.3449177-7-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220422161514.3449177-1-francois.perrad@gadz.org>
References: <20220422161514.3449177-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 7/8] package/perl-net-http: bump to version 6.22
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

diff LICENSE:
-This software is copyright (c) 2001-2017 by Gisle Aas.
+This software is copyright (c) 2001 by Gisle Aas.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-net-http/perl-net-http.hash | 6 +++---
 package/perl-net-http/perl-net-http.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-net-http/perl-net-http.hash b/package/perl-net-http/perl-net-http.hash
index 85ddad6ee..f02fd9080 100644
--- a/package/perl-net-http/perl-net-http.hash
+++ b/package/perl-net-http/perl-net-http.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  dbe27483034a79a7d43f61cc48540641  Net-HTTP-6.21.tar.gz
-sha256  375aa35b76be99f06464089174d66ac76f78ce83a5c92a907bbfab18b099eec4  Net-HTTP-6.21.tar.gz
+md5  1d46019fb8559070a5ec1d838b690657  Net-HTTP-6.22.tar.gz
+sha256  62faf9a5b84235443fe18f780e69cecf057dea3de271d7d8a0ba72724458a1a2  Net-HTTP-6.22.tar.gz
 
 # computed by scancpan
-sha256  49fbcc80e17295888b909176a0029f275a8c17b6cbfaf8867fe571ebe9a9ca79  LICENSE
+sha256  0ed700a4bfc022e999d83407f71ab62ead96662d8f7bbebfd857376bf3ed6528  LICENSE
diff --git a/package/perl-net-http/perl-net-http.mk b/package/perl-net-http/perl-net-http.mk
index de0809d0b..b4cef6188 100644
--- a/package/perl-net-http/perl-net-http.mk
+++ b/package/perl-net-http/perl-net-http.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_NET_HTTP_VERSION = 6.21
+PERL_NET_HTTP_VERSION = 6.22
 PERL_NET_HTTP_SOURCE = Net-HTTP-$(PERL_NET_HTTP_VERSION).tar.gz
 PERL_NET_HTTP_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_NET_HTTP_LICENSE = Artistic or GPL-1.0+
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
