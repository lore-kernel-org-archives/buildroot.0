Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 520DBE7E367
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 10:28:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 265E481B58;
	Fri,  3 Apr 2026 10:28:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D6RbqPrIy3s0; Fri,  3 Apr 2026 10:27:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9F3281BBD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775212079;
	bh=7UMcxeNjX3qlf3tIMN8LLiAhB41/kAlRQkXyo+nzP0A=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ECLlUOexjgOPBzsjhEGg1LOl4Yf+ZtfWuHp+tXrr4M/Rw6FApZ7uMZe4NSWS7RHWd
	 Qx0tVRjf7UBHghZ8eezl20CWZHrtjLxhQlFF4KTbSQUeC7a4EkGmU+YdPItEUlNMMJ
	 ih1o3a/orYXEQo1wdWTdXS0d6XmXZ6fyyeKo1oFe748rbV5+zBVF3Xlb0G/TCXyyJH
	 1rV4UyB5bFEF1nJMrFDPaUxm4/bnAsJ2SSxRXv5N4hHSEicrSWil5Y11vlzP9oIYez
	 2eFdzzXsmJ3tfAduIwdm7UfYdWJGmVcUWHysrQln1lS99zSvPY5GdTyrqnejUYXigg
	 Ri6eU/2bkstGg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9F3281BBD;
	Fri,  3 Apr 2026 10:27:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D4632CC
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:27:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 337934020D
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:27:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j3qBaayuskqV for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 10:27:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 14E0940055
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14E0940055
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 14E0940055
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:27:54 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-43cf8fe9c2aso978888f8f.2
 for <buildroot@buildroot.org>; Fri, 03 Apr 2026 03:27:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775212073; x=1775816873;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=eM1BdaX1pglAlAMYkU4IymabnJ89oNcHmlR2BZNaTeU=;
 b=HFX8z9iF7mnpCUqRiLuAEmDfpna3IlJWGqw/y5MJ7DJsPs1r0Tk455SM6bACW956Fj
 39A7a7pW3y2Dycd94O0Gbk25ZDN2+2ZiAyLYaKIr9fOBOv5XNdVrLFrnKmePMJ0iZ6fW
 Wzl0lzjlMi2mitm6mOUxjavuKSemwdCL5Y+btsYKXLMsf4Z9cJpCLawPxGnp2f1i4AfO
 La7K1uh1bw1mb7pV0W8WpDKFVKSIqYNJIeENvw856ui/5g6F/+pJbIPqad/RSJs8kXwq
 rBbR6S2rmwxOXmr8CerNmR9fWG3crBy+/IOWho52WQckRozPnXHVi9IlMGLqyDrK8WB4
 wz0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6ie5dO+Koq6M/Q85jLlpW1qtxcGETGCGcU3k+VRoZ5SZNDxzSRf4urmSXgdY9C5bxKaVgsYHqfec=@buildroot.org
X-Gm-Message-State: AOJu0Yz0rQXgLmLnMC7BqOp2RIuYQ/btWSTClrjtiH7+WaRoqlc+5bIq
 5hfnliOg5aW7TbjPduXyyvaRJPYInTJ/lj8SAVyBo9rgpbzPXuqtjehH+v0zpzO24OJcOewbnTk
 ycKBL+uM=
X-Gm-Gg: AeBDieukQPVuBcAU0p3OHNPKy6Mjqz7BAUhf2W0xJmyPeQ8SUQKBKxUFZeTeiDpi4GJ
 ZceskykeGuWFBVCRTNOM0klc56vmKlalnCaGsM9m1q8GHJgnsj31pj3yTSXEcsrGjzw5kj+SBjw
 NbHs9rbIKPbBKciImkA0JYlhexdVMse+wBb5Q3kGhbqBtPagwvJppfQw3R6TAmKMRE4f8Hc89XE
 WcLDRSyRjEiwda4xKaUgjuhnHcgi/l1p53kBG7OVPDrFhGblTppouECk/ne+fZthb5IlcaE/PE5
 3BQbpeAtsrEfI264sUyEExOE6EgH/qug7d8+SuphoibRkBjcap7XKpGViYcvh4KvrIligYcPT8T
 Lmm0sdL/m3bCWIRCoX3+Tm56DBqknX1LB8E9cBT1xSTgpW25D/B7slDPQUbpeuxQteu5Z0O6UUJ
 dDesIH39koZP5DQTJBuNTuQlddnMg=
X-Received: by 2002:a05:6000:40cc:b0:43c:dc99:771c with SMTP id
 ffacd0b85a97d-43d292ff698mr3901940f8f.42.1775212072972; 
 Fri, 03 Apr 2026 03:27:52 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e4e52a0sm14557780f8f.30.2026.04.03.03.27.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2026 03:27:52 -0700 (PDT)
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  3 Apr 2026 12:27:52 +0200
Message-ID: <20260403102752.210028-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260403-fix_faketime-v1-1-3e35e7b9c419@bootlin.com>
References: <20260403-fix_faketime-v1-1-3e35e7b9c419@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1775212073; x=1775816873; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eM1BdaX1pglAlAMYkU4IymabnJ89oNcHmlR2BZNaTeU=;
 b=DEYLEZH42J9s7//US2zNNUdjkKM7QfeIMWBQkKdr2okNqPGk8RP1xusfns7zJlUduv
 Gu1Yicdmz8eMrVhFo/NDGgWZD43MOz2SKrzlPCfCctEaga+WGScPyBcSLkfG1c86yse+
 vYXkVFP64+SDHjMUMs8RK4suyQLRFETjBC8OOrXFl3YgM2bqZe152I01QEz0ahWvXzCB
 vfs4qE2cCkDv+REYrC+RqUFJZoftGqiVYkcnyQHWMZYh1oga8nP3d7Yu+IO96Z+CnYM1
 IEgMMZHNYQKXgKOW5+GVzPqydPvxxDtPvKQEJwNJc4kMboSHp6awAPMSethBBhqGWOtG
 +zvQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=DEYLEZH4
Subject: Re: [Buildroot] [PATCH 2025.02.x] package/faketime: rebase patch on
 v0.9.10
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> As of glibc 2.43, faketime build was broken in buildroot because of a
> missing const qualifier. A patch was applied to it in master to fix this
> issue.
> Sadly, due to a difference in faketime version between master (v0.9.12) and
> 2025.02.x (v0.9.10), the patch didn't apply properly in 2025.02.x.
> 
> Rebase the faketime patch on v0.9.10.
> Fixes:
> https://autobuild.buildroot.org/results/761/761250e8cbb2602abdc7752d182a44b6f7de5e11
> 
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>

Applied to 2025.02.x. Thanks

> ---
>  ...onst-qualifiers-to-fix-build-with-ISO-C23.patch | 23 ++++++++--------------
>  1 file changed, 8 insertions(+), 15 deletions(-)
> 
> diff --git a/package/faketime/0001-Add-const-qualifiers-to-fix-build-with-ISO-C23.patch b/package/faketime/0001-Add-const-qualifiers-to-fix-build-with-ISO-C23.patch
> index ce84d40699..c889dfae29 100644
> --- a/package/faketime/0001-Add-const-qualifiers-to-fix-build-with-ISO-C23.patch
> +++ b/package/faketime/0001-Add-const-qualifiers-to-fix-build-with-ISO-C23.patch
> @@ -1,4 +1,4 @@
> -From dbe865dfdba0145d993d70b7fd4ec88b2f47554b Mon Sep 17 00:00:00 2001
> +From 1f4f260977a7fcd09fb71b83ee64c4d87b868441 Mon Sep 17 00:00:00 2001
>  From: Tomas Korbar <tkorbar@redhat.com>
>  Date: Mon, 15 Dec 2025 11:03:21 +0100
>  Subject: [PATCH] Add const qualifiers to fix build with ISO C23
> @@ -8,15 +8,17 @@ Fix https://github.com/wolfcw/libfaketime/issues/524
>  Upstream: https://github.com/wolfcw/libfaketime/commit/dbe865dfdba0145d993d70b7fd4ec88b2f47554b
>  
>  Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +[Thomas: Rebased for version v0.9.10]
> +Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
>  ---
> - src/libfaketime.c | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> + src/libfaketime.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
>  
>  diff --git a/src/libfaketime.c b/src/libfaketime.c
> -index ef1dca9..02839c8 100644
> +index e632395..955cf3c 100644
>  --- a/src/libfaketime.c
>  +++ b/src/libfaketime.c
> -@@ -2666,7 +2666,7 @@ int timespec_get(struct timespec *ts, int base)
> +@@ -2365,7 +2365,7 @@ int timespec_get(struct timespec *ts, int base)
>   static void parse_ft_string(const char *user_faked_time)
>   {
>     struct tm user_faked_time_tm;
> @@ -25,15 +27,6 @@ index ef1dca9..02839c8 100644
>     char * nstime_str;
>   
>     if (!strncmp(user_faked_time, user_faked_time_saved, BUFFERLEN))
> -@@ -3338,7 +3338,7 @@ static void prepare_config_contents(char *contents)
> - bool str_array_contains(const char *haystack, const char *needle)
> - {
> -   size_t needle_len = strlen(needle);
> --  char *pos = strstr(haystack, needle);
> -+  const char *pos = strstr(haystack, needle);
> -   while (pos) {
> -     if (pos == haystack || *(pos - 1) == ',') {
> -       char nextc = *(pos + needle_len);
>  -- 
> -2.47.3
> +2.53.0
>  
> 
> ---
> base-commit: 894ab931e1edcb2171e6c09c8efc70dd546ab52e
> change-id: 20260403-fix_faketime-2b9ddfbe192e
> 
> Best regards,
> --  
> Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
