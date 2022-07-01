Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A990EC43334
	for <buildroot@archiver.kernel.org>; Fri,  1 Jul 2022 04:58:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 14E3340217;
	Fri,  1 Jul 2022 04:58:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14E3340217
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oyiXbsDK1TCw; Fri,  1 Jul 2022 04:58:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E2B440135;
	Fri,  1 Jul 2022 04:58:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E2B440135
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 63C2D1BF94D
 for <buildroot@lists.busybox.net>; Fri,  1 Jul 2022 04:58:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4BDD683E6F
 for <buildroot@lists.busybox.net>; Fri,  1 Jul 2022 04:58:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BDD683E6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jHSmpMWefGyA for <buildroot@lists.busybox.net>;
 Fri,  1 Jul 2022 04:58:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4EC9D83E6D
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4EC9D83E6D
 for <buildroot@buildroot.org>; Fri,  1 Jul 2022 04:58:16 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id f39so1918424lfv.3
 for <buildroot@buildroot.org>; Thu, 30 Jun 2022 21:58:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DpLONtsiWCVIC02h5bx41j7AdhJHsDjKo78D/ql8DI0=;
 b=HKvXT+tL71N9bJozizZ9+hZnhcJMYbVyIh3Avottws/vVPAZpEEJczRA1fOk06lMOB
 dUxF00L/eEEB8VJYazklnoWfUk5XWbVS/kghbu5oCBFhvm9DsMiTpaPz0qjARcIPzje1
 KeMmhlRSfOf0ZmmuOGNwdM0fOHBcjABcYTwql9kVR7bK7zaVvaRgYxIUMeMMHzaEnQIM
 aIn8xcs1gK+szV83UQbvgzXPSKiHdsxEZmHbz7m/HnscIYrarKXEJ05axyqf8HpcY/9z
 4+0q5bkW0ZxKe61Dzb1mCdqz7L+mSAEnuUYrbTvmG8gfJRHP01BukFZeCqhBOZFVJiyh
 3wdA==
X-Gm-Message-State: AJIora/U80+e2+nq1ZUSk6YPK5XZAclfVKJH+hswxkPXAuiK3MQR3z5U
 u7PR8DlYYJBxJ2/wHgqAIBc=
X-Google-Smtp-Source: AGRyM1sF8f34/twt3TWBJqCW9zB/bLHrwfyOhEqZHvg1bzJQKzphXP+v/odkvJsY0zZIAvgx6rwsGw==
X-Received: by 2002:a05:6512:3d9e:b0:47f:8e0a:dd78 with SMTP id
 k30-20020a0565123d9e00b0047f8e0add78mr7667175lfv.48.1656651494025; 
 Thu, 30 Jun 2022 21:58:14 -0700 (PDT)
Received: from [10.0.196.136] ([98.128.186.90])
 by smtp.googlemail.com with ESMTPSA id
 a8-20020ac25208000000b0047f74ee6a1fsm3440519lfl.63.2022.06.30.21.58.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jun 2022 21:58:13 -0700 (PDT)
Message-ID: <aa55d5de-3b21-c462-f17f-7a4f72301333@gmail.com>
Date: Fri, 1 Jul 2022 06:58:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220629203655.577286-1-fontaine.fabrice@gmail.com>
From: Joachim Wiberg <troglobit@gmail.com>
In-Reply-To: <20220629203655.577286-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=DpLONtsiWCVIC02h5bx41j7AdhJHsDjKo78D/ql8DI0=;
 b=U0EwLa+lp+yF/BW1sKJGSQ97GxSTNVIboD/fNXUqBbw82bMdmH5PsrzWpHlcNzc5s1
 UsFddG1byx4o1xNFsnWPxZUT4vAAii8t26RQAiBSFXFkX2TtBYtUVg3k14ozdiPDXIoK
 Vib3JrohZkJI9Aop2S3xxG9zQ3XVBsmIecf3theMpGdo0T296PfuDR58nlfMgRsgHPO6
 o8aV3UM+zFlAxWybDWn99ajOyMQcnowZsXyYtuI+4eg8wKFqLJv82w4DLygbXV90c3+2
 05vMJuWTcnJ6KOLLJGzywb5P5vPcRvbVaTMh9HHIjotyXGGqm8bVR74PVuDBdRRXuvnw
 XLgQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=U0EwLa+l
Subject: Re: [Buildroot] [PATCH 1/1] package/watchdogd: install to staging
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 6/29/22 22:36, Fabrice Fontaine wrote:
> Fixes:
>   - https://bugs.buildroot.org/show_bug.cgi?id=14881
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Acked-by: Joachim Wiberg <troglobit@gmail.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
