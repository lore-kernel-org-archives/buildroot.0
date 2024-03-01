Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F2CC5475B
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 15:24:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDE736072A;
	Fri,  1 Mar 2024 15:24:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4UetJ38Cy7sR; Fri,  1 Mar 2024 15:24:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15D7960762
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15D7960762;
	Fri,  1 Mar 2024 15:24:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 210C71BF326
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 15:24:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0ED0781EEE
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 15:24:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CM8kJaoIOZF1 for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 15:24:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com;
 envelope-from=lancethepants@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8548781EEC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8548781EEC
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8548781EEC
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 15:24:39 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-6e5a232fe80so1174923b3a.0
 for <buildroot@buildroot.org>; Fri, 01 Mar 2024 07:24:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709306678; x=1709911478;
 h=content-transfer-encoding:subject:from:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=5umwaaReqN6SEEgp/gMxPJYiiVN7/rFhQljqI7tFXdQ=;
 b=Ms4ggZxn8fG6i86VDAoyymdWXPKOOEZ1R/sOmnNCnhfLD/GbsRq9z3jZVCNxIZ59LM
 N4uvIWlhUBJOU1u/yrz0dREIn9G5ESXFvguPDXmk1ijqBzrZiv8De7C6EViSBzysGj/0
 ind0uhBMrOQEA8E4xKJ4J6am6wo4lQTAet3pwYEkCjjxGvx1nCynETGyKmVIjKAFudgy
 3XcJLdysZXHum1gjcb2pbEj2Gg7IFWJSbbzWq7NbnYZn0bA9DPP6d7CfBsI3i/Doaid+
 3BF7fyLaAWq7RPOf5J2ZcgJjU+pDa8AsUTM+0e2zwseO37pu9J4nT9YAmaPDUr539sjl
 OjXg==
X-Gm-Message-State: AOJu0YxchGpHW2yBlhdJ/Bx3RIj0O2ICu7+YpXnDFC50I0ms/sNkg8V9
 ErTay5YK3l3S6YY8ZbffD5DrTwwRoWaipPosmyf7dl1jtFRQ83vlwe8wzqeB
X-Google-Smtp-Source: AGHT+IGN20QCbS0QIRFimplCEFvc6QI864uYHsOtB5eCg7MiGg21vSKnrVh2vIfyrMASybcTsKXE7Q==
X-Received: by 2002:a05:6a20:2591:b0:1a1:43b6:c9c1 with SMTP id
 k17-20020a056a20259100b001a143b6c9c1mr217890pzd.13.1709306678415; 
 Fri, 01 Mar 2024 07:24:38 -0800 (PST)
Received: from [10.0.0.73] ([76.8.199.226]) by smtp.gmail.com with ESMTPSA id
 r21-20020a63d915000000b005d8b89bbf20sm3076593pgg.63.2024.03.01.07.24.37
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Mar 2024 07:24:38 -0800 (PST)
Message-ID: <f1ff1df6-8bb9-443c-bc23-ed139c608072@gmail.com>
Date: Fri, 1 Mar 2024 08:24:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: buildroot@buildroot.org
From: Lance Fredrickson <lancethepants@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709306678; x=1709911478; darn=buildroot.org;
 h=content-transfer-encoding:subject:from:to:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5umwaaReqN6SEEgp/gMxPJYiiVN7/rFhQljqI7tFXdQ=;
 b=CIXJuSU2QMC9Rxbc0J5GrXaYrtLUQz+NECBQpfNSRI9VkqolKXrVma48m5xPVocg1M
 CujTD9Nxe+FOOmGN+0LFRyaU1pCeNqX+uhC85bTYx9f+MjRupkb6s245XUz6L0yeQyZ/
 Lt8eh8zMYCRB9aWJ9O/Cu0VTMLfzs7VyIN2iGn+E8W24bgFoFHMxdUI13111JV6M4ujD
 w3YPoklQyk82mYyFitxkN5zcSiXyKBoKJVc+L4zJTMdg8XEF4V1MD9WvgrH1kbF/SyEZ
 J4y0O6tA6iNbeJwjTlqpe18VPG0khqQxLim2OK955ori5TWZLYnQdHQWuUxTNA/xCSw6
 Qr+w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=CIXJuSU2
Subject: Re: [Buildroot] [PATCH 1/1] package/heimdal: Fix build with
 autoconf-2.72
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SSBhbHNvIHJhbiBpbnRvIHRoaXMgaXNzdWUgd2hpbGUgdGVzdGluZyAyMDI0LjAyLXJjMS7CoCBU
aGlzIHBhdGNoIGFsc28gCmZpeGVzIHRoZSBpc3N1ZSBmb3IgbWUgYW5kIHVsdGltYXRlbHkgbGV0
cyBtZSBjb21waWxlIHNhbWJhLiBIb3BlZnVsbHkgCnNvbWUgZm9ybSBvZiB0aGlzIGNhbiBtYWtl
IGl0IGludG8gdGhlIHJlbGVhc2UuCgpMYW5jZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
