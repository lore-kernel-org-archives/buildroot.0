Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A5C7D2F35C
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:47:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F336140DEC;
	Tue, 13 Jan 2026 19:47:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4rIt7v34b1go; Tue, 13 Jan 2026 19:47:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3DB540DE7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333638;
	bh=caey6cC6e7U67a7Bnh0z0Vv5isKwYS88b+BHcndyl68=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=c5Nr9cxkTJjmtYiJOiNGBgpfXkxNON8QHTJNEZ9hzcvrNWHZbtUxzfIWjss/Yjjxf
	 Emd9q99tC6dLBDmACxTAPynC8JnQzNoe3DoX3F1x+LVgorU9zLgkl0uk7Uj9GTXgoJ
	 6EElabd15gtfLgfJzBeZFBZSokxld/T2JMrwv9H6TdfrauEeV6qmcPlu/dDkfra1cu
	 YQtEwnFGmiNUqJVX/cfuuyOU7vy/wl5NsTDxSXjp2QA4CO6kuJZnxOgTVZsMhF+J0G
	 mRptc3sWd7lj5jQFBsvRoG6Dcf2Lqhodp2oxPPdyaHP+UvrHJXxgIu5kG2mls/AzAx
	 jrNWwEkYMlz9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3DB540DE7;
	Tue, 13 Jan 2026 19:47:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 93B1C1C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:47:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 79C5B40DDD
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:47:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0R0HBuYUD3mX for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:47:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E384640DE7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E384640DE7
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E384640DE7
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:47:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 113CCB97A863; Tue, 13 Jan 2026 20:47:13 +0100 (CET)
To: Thomas Perale <thomas.perale@mind.be>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Tue, 13 Jan 2026 20:47:11 +0100
Message-ID: <20260113194711.99564-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230081917.18676-6-thomas.perale@mind.be>
References: <20251230081917.18676-6-thomas.perale@mind.be>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768333633; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=GhUG4cYXvSIITBx/BBYxs4pewrS4KulYZJcn/hea7go=;
 b=JYXHsTwd8ZGfyKcLLOtgxjnCfYnrYkAu0rzqev07nEsgUp0gaK2HmioGOGJ18RnLsfogTN
 +PbZbetzCkxjA/lLaleAV/8ynN9T93f662799S2+xtXqM4pNQOfJ9+bU/AVxw9G0ynYfgS
 k59AxzYfoLOKA8jNPj2fGpHkkC/IdGeCdbCPQLdK7MSq8+z8bqgbFBK6Z7M6Z3/nWz312x
 NdeCJ0lLxnTGdbcNuwL2TkuKhjU/Jl8gQi+DymxIlkxKHRgMqBEMSEqeEC+vUjYTHOPDV9
 0NQv1fah6NCwl4DoRJezwm2583T/P+UthPu0DXZ4wkhFS0UPX/6gHOgJvSq0xg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=JYXHsTwd
Subject: Re: [Buildroot] [PATCH v2 05/15] package/rsyslog: remove stale
 IGNORE_CVES
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Since Buildroot commit [1] the CVEs are no longer matched to CPEs with
> versions using '-'.
> 
> The CVE-2015-3243 is then no longer matched to the rsyslog package.
> 
> For more information, see the explanation in commit [1].
> 
> [1] 35f376d88e support/scripts/cve.py: fix CPE matching
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/rsyslog/rsyslog.mk | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
> index 69128afbac..dedecdc572 100644
> --- a/package/rsyslog/rsyslog.mk
> +++ b/package/rsyslog/rsyslog.mk
> @@ -9,10 +9,6 @@ RSYSLOG_SITE = http://rsyslog.com/files/download/rsyslog
>  RSYSLOG_LICENSE = GPL-3.0, LGPL-3.0, Apache-2.0
>  RSYSLOG_LICENSE_FILES = COPYING COPYING.LESSER COPYING.ASL20
>  RSYSLOG_CPE_ID_VENDOR = rsyslog
> -# rsyslog uses weak permissions for generating log files.
> -# Ignoring this CVE as Buildroot normally doesn't have local users and a build
> -# could customize the rsyslog.conf to be more restrictive ($FileCreateMode 0640)
> -RSYSLOG_IGNORE_CVES += CVE-2015-3243
>  RSYSLOG_DEPENDENCIES = zlib libestr liblogging libfastjson host-pkgconf
>  RSYSLOG_CONF_ENV = ac_cv_prog_cc_c99='-std=c99'
>  
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
