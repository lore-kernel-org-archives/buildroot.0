Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18502EF99D0
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:37:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5EEF84687;
	Fri, 13 Feb 2026 19:37:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bsPSxujTn1EA; Fri, 13 Feb 2026 19:37:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47239846C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011435;
	bh=hx1N9E0i97mjQeH7+MqxPiu/ZvZiUJB0kG7xzvttpTk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=L8cXUmMPULATw6yJ/tEUnQ+R5S2dbBBbb3uS9thyAyICzORyOM9/ho4Qd97zX9QYy
	 8BX2dpiJJytFVqTlVJCw4SrhAneRXLSeLW9Cus38AkdjHg3MbNRKZD28Xm/CDEVcTL
	 ACQDTluhTxupq4NDJgFBkCR89GgDLfZr9yPp8FKJ9w7XNXkDM8mqmzBXaYxk++PWte
	 j9geCnymoRkWqwPRDr8H2FhRMNI84hScGHNYeK/4GfwzGzmnG1x9byQW1UlEPN+dO3
	 q9oOg8yAQM+ZO83FuhlMoXXhJupfbZpfaBGXi0eu+fnvjzfSXOggtGS0vxhMJvb3Fg
	 XjR1WnQkX2CMA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47239846C4;
	Fri, 13 Feb 2026 19:37:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 119C6EC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:36:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E123984678
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:36:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sc4b9znKa8md for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:36:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 99D3B845A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99D3B845A4
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 99D3B845A4
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:36:43 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-483487335c2so11594035e9.2
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:36:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011401; x=1771616201;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=70GVyp80t+RBTmCTBkNFYoC0Q5Gy+nvJ+gdRH6qJgKM=;
 b=t1Wjly5oysCfa1sQQ05M8e5ZyYYda8n4aYKicMJyUmdALO2O6g8lEXVyeo4p00Iw5C
 ZZRJHbWYwVjSKd4VVPrGH3ejcuZ8d3wg2BhgC2T1LhgKva4tnybTiHPegKTznupZM55k
 SNCaLxV8OIVb4hzP972Ds63IuTU8xrS3DIZ/BYP7IWPXJ/vAWciogg5chBb8OSJ3csVs
 e1uVWVF/oH6MLcUCGZwmJzbQAQzANgECGMN7s2ToVI0TudEqE1YgC8/D6Rzdd2ZygQjl
 Jmsel28dYTHxJT8Jrkk65fedJ0BT3B3jr9xjMz3b6DawzU1DsF38hn479e6iDb3mg3Ol
 JOJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXus4YLohdxhoqtoACOus1sE89BhUJqvwLSjVpWGBh9XclEH930ImRqd33LOvPqjxj8jl1QdR2Z6Y=@buildroot.org
X-Gm-Message-State: AOJu0YyIrJZEc1WkjxCZN1guPFm6u5S/j+zDOWmZk8Jpu90+8DRhmo48
 sPdtFE/zEvkjw+og7sRc3Yib1X5Q17RLSyQX0JLpqGdimnO0h9OUhJeAhvrfngZLpZvmw/cdL0c
 rWGWr
X-Gm-Gg: AZuq6aLh4VZbEDYu3phkv2kucfL4abPiw+ATxfJ2ERtdZhmnebPS8+bSV+G50oAGWi8
 7deoy262o2furvaAfPIuyiPA9XyH3NcWTl0p/GbbiI2NsumvIBm5EQUrS0OEzHCXW9B4LJY6j5K
 4rL67nBhBkRH4pNXfgUxEJRmhZRQVmvo+WQnaixQ9QY4ky+2uuB3sfl/h7UoSdqcy18PxMy/mBt
 BEb2gJrvlCPr26wICQgkwpSaysNFHhQxLfPUZ4uA6WIcf8VmxIO4dwXyg/+PgBq6d9F0PQks2fi
 B40q9ONhctlHpaWlj53vfztYQJV3GMvqEI+y9x7uY4IXO6wt/ccweDlrMsjYswioFHsO/Babm2D
 XFCjme2FBRWnF8xUI3tgpovq8aOWv6bYjXHXwxUpK8NAqvHKK2BiSDlHuZmP6HHHWpZdOGLyL+A
 9+q0V6pV6q05WFSDg=
X-Received: by 2002:a05:600c:458a:b0:479:2f95:5179 with SMTP id
 5b1f17b1804b1-48373a0c663mr45027885e9.15.1771011401540; 
 Fri, 13 Feb 2026 11:36:41 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796a5ac7csm7022468f8f.7.2026.02.13.11.36.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:36:41 -0800 (PST)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:36:40 +0100
Message-ID: <20260213193640.37838-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251201192849.3195425-1-bernd@kuhls.net>
References: <20251201192849.3195425-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011401; x=1771616201; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=70GVyp80t+RBTmCTBkNFYoC0Q5Gy+nvJ+gdRH6qJgKM=;
 b=Q9G24LnexFBAt9dq3dqkJI3oqb3WnjKuV/f6YMPdlGphsWpsDv9Hbq07+9VSCCCP4M
 JPc0EswQuob6uGZXgIEgnCX5g6n1ASg/lcflUcEim/o34lxXOMigNFpKKpWk/PrzEPzg
 XmBzK96dsj5Gq4W4EfKPVbHxTJURCQEEZJWd1XsAxIbTUkzziMkgpNNnkjxspZ6kfb6f
 KrpcFDdgLc5AseOtsTMvOxYgR4sXuwl61O4d7mSwiSqa9QpUgdhsd3NehR/xI7T8NIfl
 Xud3YnIZhXgQoiLv/jcQiEBrtwEZZY3PfA8I60cS+XeNPlAxyG1DrnrO8D/YBXNdQRg8
 7cSA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Q9G24Lne
Subject: Re: [Buildroot] [PATCH 1/1] package/parprouted: fix build with gcc
 15.x
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
> Fixes:
> https://autobuild.buildroot.net/results/572/572669fe1f9a77083a361fee7c8acdf38d7375ae/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.11.x. Thanks

> ---
>  package/parprouted/0001-gcc-15.patch | 38 ++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 package/parprouted/0001-gcc-15.patch
> 
> diff --git a/package/parprouted/0001-gcc-15.patch b/package/parprouted/0001-gcc-15.patch
> new file mode 100644
> index 0000000000..2090506491
> --- /dev/null
> +++ b/package/parprouted/0001-gcc-15.patch
> @@ -0,0 +1,38 @@
> +Description: Fix FTBFS with GCC 15
> +Author: Adrian Bunk <bunk@debian.org>
> +Bug-Debian: https://bugs.debian.org/1097548
> +
> +Downloaded from
> +https://sources.debian.org/src/parprouted/0.70-6/debian/patches/gcc-15.patch
> +
> +Upstream: dead (last update 2008)
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +
> +--- parprouted-0.70.orig/parprouted.c
> ++++ parprouted-0.70/parprouted.c
> +@@ -330,7 +330,7 @@ void parseproc()
> +     }
> + }
> + 
> +-void cleanup() 
> ++void cleanup(void *arg)
> + {
> +     /* FIXME: I think this is a wrong way to do it ... */
> +     
> +@@ -346,13 +346,13 @@ void cleanup()
> +     exit(1);
> + }
> + 
> +-void sighandler()
> ++void sighandler(int sig)
> + {
> +     /* FIXME: I think this is a wrong way to do it ... */
> +     perform_shutdown=1;
> + }
> + 
> +-void *main_thread()
> ++void *main_thread(void *arg)
> + {
> +     time_t last_refresh;
> + 
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
