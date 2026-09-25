Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B626C98321
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 14:45:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 689528136F;
	Fri, 25 Sep 2026 14:45:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vH5r5wP_A6_P; Fri, 25 Sep 2026 14:45:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 8694E8135A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790347552;
	b=RAP9ZhNox9HrVacli9ayTdrqPVkeZKgLsFZcDQmw016VIgw/5vOdJNnTj7Jy03H0uL5f
	 hWwUFuA+JCqeKkCHdUMk0ZxVANbUlmX17vccfIzGJLCE5dLgtbByUc1eMMuZ7fuY/KG/P
	 yHjlhlnYlXF5aD0wjykwIhkChiAYJ4XDsYTSbnyL3NevZD2Pa0/eyCzGb4W9i0IdZdLvF
	 9S9edJAUlJoOxL2fsPpY8To8iew2RHV/9GEJmNw4/7E3hCprkSn1ayXkor9EfAY7DnI7O
	 +NLEa4ihZIqP4KtSwyLjLk9e5cFg5DgMJ9M9NtOnO8J+6NTaaVEITcBnQsS6rf+Pz0Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790347552;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=hjHujvyv7EheyLg5NxniG7HHI3kCtA6rmUNmfbZWvfs=;
	b=XfHypxC0aNzJcIbfXQJ3dEZa5iOi3UMIUF/PDDHdK/vZPKxHDz1j5WLC0Q7CQnigAObO
	 I0PCmQ/VBGGCDjNotIrusVYZkLbNnkBy1V2T6zqRfdqGeO7ZAann4+A8yfGmu1kdLOMEu
	 867ZnF57Ojdw7G7P3WyzYjahM598bBwMqE+NKRzOttgHFkwsho1/I133495bEYgWsKHC0
	 H2Q7ItfGCZ7RfKVJ993pE986KYbovMM8hQY1ERzwxOHmpu2l+Sy3LM8+WFccrN54/HZl5
	 1gJIsIsPX4MB7IS95UhEhpglcpRlwkLlInSIG2zpta1co8tWUoEe3KV9SRl08EFMv5A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790347552;
	bh=hjHujvyv7EheyLg5NxniG7HHI3kCtA6rmUNmfbZWvfs=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PGcfl56RIkBcZNAC5aYP6RdBj+zmJTG7ufY3XEnMh82bLlEJsxKkmEtaiR5b7coVg
	 pVGuZUm4zzFHYMAkbfCS7bK56qk8AQKxeVN296TBE2LW0v6Plbn1GbJ0TFP7niB9dK
	 OsJYPzK28Ngj75rvMtmaoraBTGtsdq6nuzeD1V40H9eg8BOgrKTBqpYl/5cJHcyka9
	 w2LPh58VbsEkMbybjNVf1MZvzMc6VNleLN8ui+RB4HoXb3535h4hkGZay/uFib5W7W
	 YxiPOjBRwDfbEVpojwS9tAjFZPrtij7Vm9QkvCy+s1oHnwPcxh/TIoFKZHlnY+Ul1e
	 aNr/H5hHM37Qw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8694E8135A;
	Fri, 25 Sep 2026 14:45:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 17F51332
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:45:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F21ED60DC6
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:45:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MUEWeBM6dzm0 for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 14:45:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 6D03960DA7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790347549;
 b=Y9nTTV/9mRrCay4FCIgMKA4MVFPf/IqclX4MUxbJ5mt5K9gWiq+ZIRdKauBBvMRTOPs1
 pi6U6bB/cWXvXWcLn75nXTz5Oz/gclDPYqNmqjSP8XXCo+Y1kOTSidxW1rawD9dIaoQx5
 lXbVJBxVKBQgJkK8RMiSGF5oc3wwQPPKlUDieN6NbbKgfYtBQ3hWqy/W6wRNPijQgp5j8
 FpPyqXYScAjN8qt9UJ7HFGSqqbRFqOC3zQoP4zVuxtNi414i1GdbgfkMqc59Fh3Ou/DWu
 /67h8hJs8v4HP83/gk5bT0TPu+lBZDBdVsO8sMGVoc1WX5RgShRkc/OYYSpRh6nHE+g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790347549;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=yDvswH/dH1cbTU5bfR8VbThHDImkdNF63wkdThncnJA=;
 b=Pvehux2LV2y/0NaSZxeIydKQvOnASaLEyEW/0i4pF/4iGcpm89N4nfiykP2rO7PCbzi5
 6NA6vHZenrzVSCPT72Vheq+FAKiwJ4fVWZsY49BWBORiqR6LzfQxgLgp4DlYgGGJzPbdh
 +PmKfuSeYmZdf6I7tBsFA4nfZnRSyAVPSIH0Jlr7tX6UO86W2N2UoryMTFnUO6ngjYhGh
 dV+TO/hNF3RK3CE0hye5TY4tpRFTUVshXg4wLfaDMezvoadhFH6/gz4olokynVXtU3K7U
 Z2+EmZEOi0DaN1Alx0PMNmWAc6lugmSmW5+dsTHOflhd7Hgv+8Wg5IF3GQtfgYAktdA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Ja9NzZrG; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com
 [IPv6:2a00:1450:4864:31::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6D03960DA7
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:45:49 +0000 (UTC)
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49e69b9e16aso10643825e9.1
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 07:45:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790347547; x=1790952347;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=yDvswH/dH1cbTU5bfR8VbThHDImkdNF63wkdThncnJA=;
 b=UB6XWcoOji9lJiUeRWxXPpm86YkBNMlYk5N669e18hRVf8aqjw9vOiZqq7VYQWN6Oy
 AY5dlSIhNM8xhFMutYCjpZwCoBFmPwh9IehkKBninXYeXCWLqlZocHxRaj/r5MnuSMB+
 oH4V0yGaON6MjQyQKhw9cSh4OafoKGRCQ5XWFz4r5RVrEUgD2MPtQOyFbhEpUyYR4/z+
 qyMMA8bdqz0uSy6jByFsLvWwj+R8I8hpRTw6KfjOGkvNU4pw4MlKLiOA1ybnGT1sxs+a
 dc5GlNf5rB7eCmnPcoQMG9MsrSqHVZUScb7j6NvD/KqkBuMPc1lJ4viS1xByYydHRAs/
 1a5Q==
X-Gm-Message-State: AFuF++l4qunnTjutYF/xgSK5Ey+nnx34MfsZYpHtXnbJ5VlHovpMadFu
 9Nl47iR71Sau6moxoM2/c2Flanlf3lFel0G3bG4O57AlGJ4JhejE6polzVzjw9Expoyme3lganQ
 LSpMdUvnsog==
X-Gm-Gg: AYBFou1L+8B8GFTMT2BnJ5V15Vm/3n7wlTYlibB0Zq9+7e0of/7O3h+JbZ0L6N/ZNtr
 Ar7nZnA5NIxReGpRrhdgWPH8QmgSAS9g1hvew9G/6MqtpX+m78XLHqyuIAbhpqqiRXg5OsGDLSO
 w1Iwz+sZLGkVoY/nfb4VM2xDq0EFc35F/HBQzuQJXsqvrstWsxdzX9Fx5nUVT6e04GEznFhl5PJ
 eYcgkHHxNfpkOXU8uwItZ79GDFkazYrlhmlQuAA5D7gCtNDLF/VAlQsCAsCLndaN9hiVsKaauvY
 u1KFBOAdgE4xVpzHI3fwYyia55+J3JjSWCQoC+yH9dUQwJv1s9HpA88wa2qX/6e3AtOgty109lW
 dX+tq+8v4Ti3H7YCk92CUCUx5/yEvLIYNNvWyGmrczrDvglkS3zaLtreFz80fj1aLKHbPY6oOOL
 QAHpyRal/a5XuTk6GDSv6TFVSGEOQSkaY5hEe26Kc8LQQFNtN4+kTHpl8tFmg2onG9g6eHb3dro
 C7+vBorlzCU7kMXL3X1VoBZ6KQsLU1H6PdOWvTdLA==
X-Received: by 2002:a05:600c:8b86:b0:49f:ce73:4a with SMTP id
 5b1f17b1804b1-49fe7bd8efcmr89986195e9.34.1790347546767; 
 Fri, 25 Sep 2026 07:45:46 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fe5ce4941sm153293155e9.6.2026.09.25.07.45.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 07:45:46 -0700 (PDT)
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 25 Sep 2026 16:45:44 +0200
Message-ID: <20260925144545.4098239-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260915215100.2031555-1-thomas.petazzoni@bootlin.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/tensorflow-lite: propagate
 libabseil-cpp dependency
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> BR2_PACKAGE_TENSORFLOW_LITE selects BR2_PACKAGE_LIBABSEIL_CPP without
> propagating its depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS,
> which this commit fixes.
> 
> Note that this doesn't create any functional change: tensorflow-lite
> is anyway limited to ARM, ARM64, x86 32-bit and x86 64-bit, all of
> which are supported by libabseil-cpp.
> 
> Fixes: fd29fee3a3ac0ce45404ed256d2059836c352728 ("package/tensorflow-lite: new package")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/tensorflow-lite/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/tensorflow-lite/Config.in b/package/tensorflow-lite/Config.in
> index 751b963b22..604a1ea9ec 100644
> --- a/package/tensorflow-lite/Config.in
> +++ b/package/tensorflow-lite/Config.in
> @@ -5,6 +5,7 @@ config BR2_PACKAGE_TENSORFLOW_LITE_ARCH_SUPPORTS
>  	default y if BR2_i386
>  	default y if BR2_x86_64
>  	depends on BR2_PACKAGE_CPUINFO_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
>  
>  config BR2_PACKAGE_TENSORFLOW_LITE
>  	bool "tensorflow-lite"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
