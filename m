Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A6E5C10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 20:50:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D0716131F;
	Thu,  9 May 2024 20:50:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sbwgg5v3xgW2; Thu,  9 May 2024 20:50:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C90E61331
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C90E61331;
	Thu,  9 May 2024 20:50:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E9BE71BF31C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:50:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CCACD41E5F
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:50:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6-g4H2qkXemr for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 20:50:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1497541DFE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1497541DFE
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1497541DFE
 for <buildroot@buildroot.org>; Thu,  9 May 2024 20:50:04 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-41fe54cb0e3so4504595e9.2
 for <buildroot@buildroot.org>; Thu, 09 May 2024 13:50:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715287803; x=1715892603;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RexqqrSn87N5SUfHehhLbqkUhXhGyT5Y4/+LVOVy85A=;
 b=lHvSnAB4Yhdt4k2GUU6WHZhSK66O7gXCdWxqdTau36NY9+7tOCd1l3PLCchuFHcE1K
 ILKjsCzqiuruI+ldHfkovqolODopC5zK3hVWKWeV7uSmGwAY4ZgL0C/BF2+MzNLbv+dI
 dLUp6q9htvmLSqjl4hvYhPovEecexo1ozMykeoZXJSCp5vjfhVFLwQQKFZBWD2ALNuKf
 4GsrWLxsSO5HL9p6OJdg/KdClh9nOnNw+HDM/1CFtBXwdqowEVeO19n26LkIdnCoDJMc
 y0UFRZCz8m6R3gjVEphI8t58q1ke1Z54rmpX807/IPPi7e0SbQU3heTu5QEt9W5us7lS
 S4pw==
X-Gm-Message-State: AOJu0YyF8TfhcDawsoM6RZAj4CdJX5agQbcBnFP3QtZxDIk7YPHDkxYE
 HKWqxt6voIU8R5HG1I8Yv1E0bjnc8khcWm0aUXeWjei+CYRBSJOw4BCj2rS4UEc=
X-Google-Smtp-Source: AGHT+IHQXi9b3BzjgkInoAvhysBg7mNYkXgSXXB2oetzNWvecJNpoC34tEDqdCeQHvgLpStfqs185w==
X-Received: by 2002:a05:600c:5101:b0:41a:aa6:b68c with SMTP id
 5b1f17b1804b1-41fea93a0ccmr5763685e9.6.1715287802733; 
 Thu, 09 May 2024 13:50:02 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41f87b265e8sm72083165e9.5.2024.05.09.13.50.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 May 2024 13:50:02 -0700 (PDT)
Message-ID: <f51e0c2d-efa3-46ae-8155-7b6552c6563f@mind.be>
Date: Thu, 9 May 2024 22:49:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>
References: <20240417080538.3451923-1-roy.kollen.svendsen@akersolutions.com>
 <20240417080538.3451923-3-roy.kollen.svendsen@akersolutions.com>
 <20240509164507.4682bee8@windsurf>
Content-Language: en-GB
In-Reply-To: <20240509164507.4682bee8@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1715287803; x=1715892603; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RexqqrSn87N5SUfHehhLbqkUhXhGyT5Y4/+LVOVy85A=;
 b=GOJkDlRflWKDuENWS7Lers5IuroR0fqsZy+/xBPlpznM8H5VdDzPVJ937x/etudSyx
 CKNULLfLYPKPz5aNenBc2E/f9fvpcnyNwhj2Ve6mly6PD3W1lYWJXT/6EU9LHPnLM2r+
 2Z/fyF+qz3Rw9Oy4A/2mx2nHp/10Z7ToWkVggNfKkarp9x1tS4kbn7QHWB2Aj36R/Vax
 s6na9j+5BJKJrRKZ2Putp126XZ+CjX+hBdbOn2s+zu1xz5igWTOoAXUWJhDEHJglrB4I
 4oOGOCLsNLBxyg/yHakfDoHfk7t3mHc3wZjpBblDRxJSpxcvfGmgOjio6jfa8DvIK+2H
 W4SA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=GOJkDlRf
Subject: Re: [Buildroot] [PATCH v2 03/11] package/qt6/qt6shadertools: new
 package
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>,
 Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>, Romain Naour <romain.naour@smile.fr>,
 Jesse Van Gavere <jesseevg@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/05/2024 16:45, Thomas Petazzoni wrote:
> Hello,
> 
> Added some Buildroot maintainers in Cc, for a question below.
> 
> On Wed, 17 Apr 2024 10:05:24 +0200
> Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:
> 
>> Signed-off-by: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>
>> ---
>> Changes v1 -> v2:
>>    - don't add unnecessary Config.in.host
>>    - add required BR2_PACKAGE_HOST_QT6BASE_GUI config element to qt6base/Config.in
> 
> It would be good to expand the commit log with some explanations on why
> host-qt6base needs to be built with GUI support for this package to
> build for the target. Indeed, this is a non-trivial packaging thing, so
> it makes sense to clarify it explicitly.
> 
> 
>> diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
>> index 3b15d40c83..5b598aa938 100644
>> --- a/package/qt6/qt6base/Config.in
>> +++ b/package/qt6/qt6base/Config.in
>> @@ -1,3 +1,6 @@
>> +config BR2_PACKAGE_HOST_QT6BASE_GUI
>> +	bool
> 
> My question to other maintainers: do we want this blind option that
> allows to enable GUI support in the *host* qt6base to be present in the
> Config.in file (normally reserved for options for the target package),
> or do we want a simple Config.in.host, which even if it doesn't have a
> visible option for host-qt6base would carry this blind option allowing
> to enable GUI support in host-qt6base ?

  It should be in Config.in.host. We have a few examples like that already, e.g. 
package/systemd/Config.in.host. In that case, there's also a comment in the file 
to explain when it should be selected, and I think that's appropriate here as well.

  Regards,
  Arnout

> 
> Thanks for your feedback,
> 
> Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
