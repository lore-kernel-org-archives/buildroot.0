Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43B5AC61DD6
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 12:17:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B55760C06;
	Fri,  4 Sep 2026 12:17:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IaPF3VvH8Ur6; Fri,  4 Sep 2026 12:17:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 988F660D59
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788524262;
	b=tE95jzG9lBu/3+x6RtraUkdkbjucyDf4yDhrxpOTTRxUw+hlSriDfg838VhK6Je6+iej
	 tGr/D63esQAKVucX28avY2nk6lRmW1ms10wDhs+5t5UC9d6W0Rxv/55VvE7+ip7VzRbvT
	 HOUPV4AwNMblo5PH/q4JmmdGDCzYrOT/nqj0AiX+VFbe7qIIFunzyPQRGib4tLhG1fgT1
	 p0hzbmoGMSZyWmznIHxPcJnFI43VRP5S26hVA7xJQREuIXGDf4DwR8u1t3/dzwlLVPLXF
	 QHWItRMaUokyHVSNMnIBPhxk2+Xba2ox/yPu/zXmI7QuBKHQyZY3N0SVHeorfj2b3Tg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788524262;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Cl/8e8GUS5kxc2+5zsfkyE+XoKpgisIFqqZNPQDQDmo=;
	b=JickdhT9e+zVCzbhVCtIlRMsUlPxtHsaivkRNEVLxEz6Vj+lym/Hu44HQ0zl43OtWu7W
	 BQ0PIb0JaOP4BYEBMOU+CvbUGcQfs3wTIvDX2MfRSFAZT1KK/UiVy8i2v6gcu4QWYlEE6
	 Bhdjd7CVJe9YrrcqlzSkJ+ZmqF0DqpCevL0gcjQ/seIkgTl+ODcA5u08SooVk8GuCANV3
	 u/W5SXJm/ksMmR84ns3POhQPaGBEW5fLGqkjG5IW5/YIcS4qkp5JIC/wXf3ltepicT/hQ
	 kKtUD8QeFLQHD/x6SXBG4WO7e1A30dtiY3I8vnG8lGqrEU0IXvkqjj/9LJSfCPoltlQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788524262;
	bh=Cl/8e8GUS5kxc2+5zsfkyE+XoKpgisIFqqZNPQDQDmo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qjF9XcZ6NPK7936ksakUqe+tB0iCeGkQdCoWzcYIm5dt8I1rdeZZH6YSeM1V4gvLV
	 WRJjTBtMeB9/0RnfHGOlNcgy+hksG4MTLe3hAGalIRv8+ag2T1gV0b3M+SZSfQcwSb
	 W3Qu94gfw1xMswSGOwn6i4nZ4Cw70Y3rxuSui4nrHm3jz6g0DVhWM1qu6iog+/YnXM
	 vBMwGZ8GOCCxOkiYO5ofKU/4lmUQyxrl5aS/sRPPozcURytWuoQoTCcgUOVoCYxniX
	 ciymyBKQ5D77BYqDzXs8+F/xNqrmRgqyxXXkMocoUKtXK7EYzHOtUvcilXTSQjDmNJ
	 uXq+CdDfYUSng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 988F660D59;
	Fri,  4 Sep 2026 12:17:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6193A10E
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:17:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 45A2C60D4D
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:17:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iMNvM07LSRcp for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 12:17:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E9A0F60C26
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788524258;
 b=LHvOISDLs9D8ipf4/nuY9udWQ4mQ/ae1JCcKzo2bCEMjV+8mHORQXsNvKXwzkcVDQjj1
 ZTjGOHv0gx9TiYZpF/d7cVkvvqDGK3dDLHfuVltG34xYnOXD5ZcM872DuYpNN6BZ4jqvH
 C7Oj/cGLlQ8nHwLuHA1hgxkvdBftMOIbUUPPhxi2sFCrBT+Z3vV6BwgS5z9gMwGRWLwie
 q2AHCGQJJ7HnnasymUEUToJ2ZfdyW45Xyu58AvDUksMm9rMw4T8G98yKQKYk4Vl2yOWML
 LpienGZ4I7xnfU/o2YnDKKRnFds6IXal4GU1RiG5AbT3AUxBdA9heSEoUaTCC+oqEOA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788524258;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=xZteV3qPKLvGjwHe8aVQHEiIpc7o3SxiChjcE32YeAk=;
 b=pUcwA0uoV7UhpYrnk857XU1w0fpYWVhg3hmSz2cDRR+azlrc4l3xxzIEdX461Z0tEiDr
 ZLumiND7HU1tvuvVnH26LLpge9xXZ2JgoGfGuy8gmLg6hv1siHYJKqPT03wrdX3jr66vp
 qf7wh3jtOHNmmlVJD5U0GmCUkOKiuIThgBLyRtf3j7iXiCJhQYLcMm5T6PVIdxDZawaqX
 w5I8uwaR5jcGweETrsxVJzdB6dzDspjNIr0WUSGvQFuQw1GkhE0dJk9IeZtY/651pAlkB
 s/7ArTN3rtMg6+vLfPFkbOYfE1teVE4N9kmNzcdtLPlvqRDPna+2z7PQ3hM8ZIMBwRQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=R3CL0+81; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::334"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E9A0F60C26
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:17:37 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-49cf4f81d86so6774245e9.2
 for <buildroot@buildroot.org>; Fri, 04 Sep 2026 05:17:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788524255; x=1789129055;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=xZteV3qPKLvGjwHe8aVQHEiIpc7o3SxiChjcE32YeAk=;
 b=CttnUy1MgZKji63Y/BhI4PP2izbN6COqmx814LXMPD6j4BR9k6vHp2d58zfSece12j
 7YQB4VhcK3/XB8Ihzzn6xjmKl8HARNo7sgtkfGMv4aAsDHrNGlKZIs8TQBZL7ekzev78
 P2pHLLpQDmw/VIe4+apXD8R4hQQDZPHsVJS6fTugpHOkdUiTl/PQfP8Z9c/O5MNiKMRc
 xxWpPig+cTdXsZCW4llsU+GfIK6ZhNxO8IXjhzgCdK6QtAJAvzzvTN0AKsdXbF9td1RP
 4KO7wYkbFz5JwyX06QjGwW5GtXu4xg4gvd2vnIqJz8LWBLHWLlkDXUQbqYf7h+2aAf/8
 YNmg==
X-Forwarded-Encrypted: i=1;
 AKwUvBywZFUp4mHqVDZ0k3jrSd1zNyh0Ly98+ASjgOjwcP77YidqkO3gAA8afrgZyBZPoT9Ip/FAgzWA3C0=@buildroot.org
X-Gm-Message-State: AFuF++nv+rSw4cYi+5+OAWqrhCFvir8gbowxPZ6lun+SNESRGRM8ZfSl
 G7hbntz3ae1MJQdcGAsun1C469t3b6lY3mzel8yN6OoNOF5GFwagkEJZxoyMzZIKDfw=
X-Gm-Gg: AYBFou0xqAHt3Ls3YZb4W/tS2w+ooqzk4jSIwkaJ6pqMkTepzVg8YlCKsblNxaQLrdr
 vg2ff6XC6j3nJL0hx3eMg2InJAIW/ccVoSM/2ByQBl5t2YEJ65znN6GaWuXgilQ+AYxt58WnBlU
 +CvHJK9lvWAK/3kxMfXJKyZ/ypF36r2CePoHcM0zILxlY8WpyoppTowA8ds14lFsR1tJdpP6cdU
 69ihGSyd8fb/x5qIQpk+v5B0BSBrh89EP8YlzFlEDFzKoZ189xUsUX4BVxZF2wmLE33N8cmFqTC
 5bYp7VxvnMDiLWh9W1njrjyZh6KhA8CI0JdmPPOWdBdsXleerGB54aFm+hTg/zs8d5Ykk7DwJva
 WuFRtCnknBYDWYBP8ZTcFk7CE1Q3VBGxN3StmySRGeXDzd1qqh2BMxErwLFymOZ2oxhmrpDPK/K
 /usbBTTeCCZgg7QwmF17TXAqyTybKqXdzWugkzE/M2kwgh72FHp1lssw==
X-Received: by 2002:a05:600c:8b04:b0:49c:fc6c:be11 with SMTP id
 5b1f17b1804b1-49cfc6cc0c3mr26776485e9.23.1788524255262; 
 Fri, 04 Sep 2026 05:17:35 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48588394fa1sm6030009f8f.8.2026.09.04.05.17.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 05:17:35 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Sep 2026 14:17:34 +0200
Message-ID: <20260904121734.403913-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826163955.37127-1-thomas.petazzoni@bootlin.com>
References: <20260826163955.37127-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/olsr: fix build with GCC >= 15
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
> This commit introduces a patch, submitted upstream, that fixes the
> build of OLSR with GCC >= 15.
> 
> Fixes:
> 
>   https://autobuild.buildroot.net/results/650edf74dec513ad540f80f4d3ef8c8222dfd711/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2026.05.x. Thanks

> ---
>  ...es.h-fix-boolean-type-check-with-C23.patch | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 package/olsr/0007-src-olsr_types.h-fix-boolean-type-check-with-C23.patch
> 
> diff --git a/package/olsr/0007-src-olsr_types.h-fix-boolean-type-check-with-C23.patch b/package/olsr/0007-src-olsr_types.h-fix-boolean-type-check-with-C23.patch
> new file mode 100644
> index 0000000000..dbb167fe96
> --- /dev/null
> +++ b/package/olsr/0007-src-olsr_types.h-fix-boolean-type-check-with-C23.patch
> @@ -0,0 +1,35 @@
> +From 6d7aab6d01ffa68f79b0b238d812a074051d94c4 Mon Sep 17 00:00:00 2001
> +From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +Date: Wed, 26 Aug 2026 00:00:00 +0000
> +Subject: [PATCH] src/olsr_types.h: fix boolean type check with C23
> +
> +GCC 15 defaults to GNU C23. In C23, bool, true and false are keywords,
> +and <stdbool.h> no longer defines __bool_true_false_are_defined. Therefore
> +the existing preprocessor check incorrectly rejects a valid C23 environment.
> +
> +Keep the check for older C standards, where these identifiers must be
> +provided as macros by <stdbool.h> or by the GNU C fallback.
> +
> +Upstream: https://github.com/OLSR/olsrd/pull/139
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + src/olsr_types.h | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/olsr_types.h b/src/olsr_types.h
> +index 36d2b723..ce2a0559 100644
> +--- a/src/olsr_types.h
> ++++ b/src/olsr_types.h
> +@@ -82,7 +82,8 @@ typedef signed int int32_t;
> + 
> + /* add some safe-gaurds */
> + #ifndef _MSC_VER
> +-#if !defined bool || !defined true || !defined false || !defined __bool_true_false_are_defined
> ++#if (!defined __STDC_VERSION__ || __STDC_VERSION__ < 202311L) && \
> ++    (!defined bool || !defined true || !defined false || !defined __bool_true_false_are_defined)
> + #error You have no C99-like boolean types. Please extend src/olsr_type.h!
> + #endif /* !defined bool || !defined true || !defined false || !defined __bool_true_false_are_defined */
> + #endif /* _MSC_VER */
> +-- 
> +2.55.0
> +
> -- 
> 2.55.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
