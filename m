Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ABD3C5CFCF
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 14:20:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26EC340EDD;
	Fri, 14 Aug 2026 14:20:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PPo6mPilrTjL; Fri, 14 Aug 2026 14:20:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A18140EE2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786717248;
	bh=D/Es0Zzc2telimzfFGIRbie+pIaiYer1wSGdY2JVlsE=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=O5ruw2CiKrVwQyvFKLyQlUOHDDPB98yYv4l68JjeEduHDIyXIfNP5mGPTFvzThTkF
	 R4Fym+NoOnTw0PG1XB8k0UfG60wUY6eHAYCzetOYMRlqNJw0Npgsb1C9l7gALeR4+N
	 NWyt3jgeKltq0P0Sq0d7Lcz9qO53jFuLcaVB3pMLzB7iHww0zCZR8HQB0o4aECl84H
	 /+qNFs2UWDBlvsHvmM1p3kGUWWhD5OIFi6Y15QSaxRS4/EB7EtIs9SU/xut01iw+dQ
	 DfZkKe4vne5lT+m8vCThsy95IYM9oEtIVm1OnKYnlPqM/1r7e41M44K4XbI+UkVWX+
	 gmvKnQlt5BS/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A18140EE2;
	Fri, 14 Aug 2026 14:20:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 41D5823F
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:20:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 258638146C
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:20:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h2lc9wCeuHbN for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 14:20:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 311B381468
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 311B381468
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 311B381468
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:20:46 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-49954b88fffso13381025e9.0
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 07:20:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786717244; x=1787322044;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=MxgL04CzPRVaeMCRSsOyTtuFZzm2X5O8CwL70yPT+/o=;
 b=lnWMWDNEuRXSTY2OZ0JJeCkbzGFHvPEbQYqOfn/Xb3INUKZE21Um76TTf6auJThXPF
 c7xOJpyZyDo+LCCh+1Ec97VTf3RTJLG+htbHKObmIKQTdCpUkLeTgXZdiad0wA6V/HUU
 +ragCo7WEqmX0vcSopZBm0HY2/yIInIl7iR9B/zdGt6BIknM63tQ3lBgd8QUs+FNCVsT
 5ge7UU+4pIQaQg36KOrZSzhG64jxlKu0At4TWqTjFZ5drwkKQ7gyqm+0rVKK89Gr0Pmu
 GWIfFytmPiDpr6Cq5nFSr4FXxaf1ODGDN34Ga7MHRSygPxckbUd8VKacCokQBMcZkTMg
 3i2Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RrpeGcIEzqlI9A8lQAgq9FiceqVml718kuB2r8bOLxQn6JJO0PLkEcrOqMe4wdASwZdQeD1FRYlno4=@buildroot.org
X-Gm-Message-State: AOJu0YzOgBAcUWueCekDjAep8zaOPwTQP0+S9Hx11eQ2UQ4mFbX8WSkQ
 kK8ePFx+/65EEQuWB/ZO6O9PSVwggxz/h/AkSimUQGNxpmLPI5RxFZhW9xP1I9xKuY4fDyv8OoU
 +uQtKXLw=
X-Gm-Gg: AR+sD104IQSvNPH9IBg78VeTZUoQMmBJusoy2X5zkH9SQOVneWZH8r+R9nHheJHSNSk
 cy0lvHnY18f1UHJzwZ0ikRcWS63yLPliExrdzkacwB1fMghOkPqB1LpkFZyoY/d4DAzjDfZhGGG
 wghRJPs74ALB+ux+IIweK8LEyw1hsNswqxl3nT2Wwi7kjGPZJ4UD5iGVnk3rrdSBjgwOiDe00fl
 29PgVh9f/LcQg0ID0AwKsQO9T1AIRJ86ZelY6ik8AmY7jzLMAdw3F04jaNo4873IR+l5YlEttLB
 2yZ6qUcsUq6bEnOG8DSLeOR1Yno0LwHtVdYib0d8vA3w92ZD+r9Ax3tvsQdhENcOKWRe1L+ouTY
 kpkaMA7P7ryRv5W08YJJXJWgxkFXoM+3OcSD4aDBgklyaelYQhO1J6gOG9dPlAHTnyEG+X1nixT
 4kkkCDQh5uDkbbl5xXPnNYaCugbyzwxvrOLdeE+cqDVzyygXv0rYuyywlflyduDZLPemL4uQ38b
 LMbARpByJDJxJepDSREMdg+vltwSBojIBdKimxQTmD6rUo7nH0CMGCuREo=
X-Received: by 2002:a05:600c:628c:b0:499:87f3:a2a3 with SMTP id
 5b1f17b1804b1-49987f3a33emr99721485e9.15.1786717244148; 
 Fri, 14 Aug 2026 07:20:44 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a?
 ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49989ae1ef2sm29200915e9.9.2026.08.14.07.20.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2026 07:20:43 -0700 (PDT)
Message-ID: <16709f7b-d382-4b98-8cb1-92560dbcbd5b@mind.be>
Date: Fri, 14 Aug 2026 16:20:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Waldemar Brodkorb <wbx@openadk.org>, buildroot@buildroot.org
References: <anh65LhHJZT8yMcO@waldemar-brodkorb.de>
Content-Language: en-US
In-Reply-To: <anh65LhHJZT8yMcO@waldemar-brodkorb.de>
Subject: Re: [Buildroot] [PATCH] package/stunnel: security bump to 5.80
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 9/08/26 15:04, Waldemar Brodkorb wrote:
> Fixes following CVE's:
>
> CVE-2026-70368: Fixed an out-of-bounds memory
> access triggered by logging attacker-controlled protocol messages longer
> than 1,024 bytes (thanks to AISLE Research and Clemens Lang).
>
> CVE-2026-70367: Fixed a SOCKS server mode bypass of the localhost
> destination filter using alternate local-address encodings and
> interface-scoped IPv6 destinations (thanks to AISLE Research and Clemens
> Lang).
>
> Complete Changelog is here:
> https://www.stunnel.org/NEWS.html
>
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to 2025.02.x and 2026.05.x, thanks !
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
