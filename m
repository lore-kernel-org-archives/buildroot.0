Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E76C77B61
	for <buildroot@archiver.kernel.org>; Tue, 11 Apr 2023 03:02:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86E5461410;
	Tue, 11 Apr 2023 03:02:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86E5461410
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cVZUFKNA-ZxK; Tue, 11 Apr 2023 03:02:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFEB36140C;
	Tue, 11 Apr 2023 03:02:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFEB36140C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E122D1BF3AA
 for <buildroot@lists.busybox.net>; Tue, 11 Apr 2023 03:02:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BAA25409A6
 for <buildroot@lists.busybox.net>; Tue, 11 Apr 2023 03:02:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BAA25409A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OxZVbxUoTbS3 for <buildroot@lists.busybox.net>;
 Tue, 11 Apr 2023 03:02:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3FD6B40222
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3FD6B40222
 for <buildroot@buildroot.org>; Tue, 11 Apr 2023 03:02:16 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 e18-20020a17090ac21200b00246952d917fso5061638pjt.4
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 20:02:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681182135;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dOqugSnsDga/aW5/DSO9OTLk9/DQojHFMpdBcQtilEQ=;
 b=UXhTo3/2hpK1XuYxY873HEPwwvjmFwjQLAYq93BpSxytX6pqekK8ZvLkWf7LX79JI2
 d11lK9LC78nWfGa9IGgtcSO4yVf48p4k9fbIcI/JQW7DpT5Spj4JfKa16mFWEpr2Kkgy
 NX/OwCy2ZCK4A+slZzdK3ShzFqxHtYjADVGHf032napE7bRhQo9+mcoFDQcA9MgWaT+r
 MX/UZhKHnPfjn7A7aRa9MF6x5UGnxOUAL80ZmQI72rzP+2IuDMwsR4kxKKUIp6Q+pd9j
 b6IN+4g04vakG6lCdBM1wxX9Y1FH9oNJzMy0xzHVRwcB4POrfz2ZPpPjemkH3qJrg537
 +cjw==
X-Gm-Message-State: AAQBX9fq8lQgpgcl2qI8nF8iVPT8DdD1c27cN/627tEdaljT9Wd+Mhvx
 BNPt3p2nqOJhV8c8bRwgH80=
X-Google-Smtp-Source: AKy350akp2qzMRQg8+Q5QRqUiIyHURgyB2WCSK/pNV1qis2Ax/ShLDUL9J0/Ml/FCKnghrYHCKz9IQ==
X-Received: by 2002:a17:902:ecc3:b0:1a2:8866:e8a4 with SMTP id
 a3-20020a170902ecc300b001a28866e8a4mr18145015plh.1.1681182135487; 
 Mon, 10 Apr 2023 20:02:15 -0700 (PDT)
Received: from [192.168.43.80] (subs02-180-214-232-80.three.co.id.
 [180.214.232.80]) by smtp.gmail.com with ESMTPSA id
 m4-20020a1709026bc400b001a1d41d1b8asm8418496plt.194.2023.04.10.20.02.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Apr 2023 20:02:15 -0700 (PDT)
Message-ID: <0e95feb2-38dc-284e-6348-191123088c2b@gmail.com>
Date: Tue, 11 Apr 2023 10:02:12 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: Alberto Fahrenkrog <Alberto.Fahrenkrog@rigtechnologies.com.au>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <ME3P282MB1347B97DF9B0E1D5E1BD718EB9959@ME3P282MB1347.AUSP282.PROD.OUTLOOK.COM>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <ME3P282MB1347B97DF9B0E1D5E1BD718EB9959@ME3P282MB1347.AUSP282.PROD.OUTLOOK.COM>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681182135;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dOqugSnsDga/aW5/DSO9OTLk9/DQojHFMpdBcQtilEQ=;
 b=g72uALG62Iq0j0Os5ClPH2FQoFCebwMZg673IFMJv0QKLz+aAQ35VsGu+lb/j+wE12
 T2E8h3kCuYV9Vdy1wsX9ZLCIy2eq/c7834T0sBlMMsPMToHo9EKTNMScZ5viKxm0Vse/
 Gghb8uFe73vRTsgX/ReC/tuOqYWGGDviOLOrJ/VtmG6JMtpAXf7kMeVc1Q6wFghRjfI2
 t54S+W2a1mpDAE9VekeGxr4R5bPsnMztVMHzusSnF5MHm1BFluii5XHlunRcfpQaP/uw
 S6b8Wvbg9cqMMmTE74K8/qwqhkH1QHbehPRvvaoSlzn4itNe+yNUNBLO/AEgpVfVLhZG
 GBLA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=g72uALG6
Subject: Re: [Buildroot] SSH Reset on Buildroot 2022.02
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

On 4/11/23 06:20, Alberto Fahrenkrog wrote:
> I'm not sure what you mean with "bisect between..."
> 
> I ended up using 2022.11.3 and all works as expected, with a new enough version of Python and no SSH issues.
> 

I need to teach you how to bisect.

First, begin the bisection specifying good and bad commit:

```
$ git bisect start
$ git bisect good 2022.11.3
$ git bisect bad master
```

Then build and test for each bisection step. If the commit is good:

```
$ git bisect good
```

If it is instead bad:

```
$ git bisect bad
```

Rinse and repeat until you found bad commit that introduces your bug,
then note that commit.

Once done, reset the repo state:

```
$ git bisect reset
```

See also git-bisect(1) man page.

Thanks.

-- 
An old man doll... just what I always wanted! - Clara

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
