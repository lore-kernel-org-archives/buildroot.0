Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C899DC10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 20:58:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8551F6129E;
	Thu,  9 May 2024 20:58:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ewxKRzyoAZWd; Thu,  9 May 2024 20:58:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80F9F61307
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80F9F61307;
	Thu,  9 May 2024 20:58:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4F2181BF31C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:58:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4901D414A1
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:58:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZAtwrTgRPSst for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 20:58:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E28CA40491
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E28CA40491
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E28CA40491
 for <buildroot@buildroot.org>; Thu,  9 May 2024 20:58:00 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-34e0d47bd98so1320330f8f.0
 for <buildroot@buildroot.org>; Thu, 09 May 2024 13:58:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715288279; x=1715893079;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CO3N6wiU7JKsrOp8IzkYvZWTvrNgn/c8C755qq8FyXE=;
 b=ua0LK4Av9QmSF3ZtC5COBDTzrQxrubgJ8CNWoQYnDa6+UO9nEKzfde9IYZoowIZ3um
 iB/UFLmsA1nydOKXKmVhFedkcDuzSYMl6qVaWB/pZzLnnsJ3Eoww+Nu0dmv/jdwtGJeH
 xglgtB5pz7WUkmRTHeWw3y0f1R7mV/Ihu31ybnfPxwvg0Kh+MZg/OuXLHYmwebggGDTj
 k93hjdjJzeJq95/OYEMlQWN6CN/q5x9TUqYFV70cenRr3Ud/+1lsfVy1giG+dQIL40Xv
 mQmZOb8y8+NS+0glxoTC0EIQwYuHS7vXUhlrlpgGSBIBqB+bnbGtXZglUzNVPsHnmTVG
 REDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSuYYP/njmfsqQSW0fu8QMqt2Rk3qRIe7e51hZXiwDTpI+5ZGwgkeAakrHRKCYhIQHwJ7OIUBfclHEpEfY+KWOmY5/Fil3ew==
X-Gm-Message-State: AOJu0Yxq5edcSeSAb2ESIad7FVZcRDgwMNmthyeCcjS+OqIeZQamUPzP
 GZqv3rVI++rGthCFjJf1a6f4DkqzLUp2ZGqp/b9UFcSZ/QYuRFxQ6grmA57TOFg=
X-Google-Smtp-Source: AGHT+IEcx4ujSHlMetLAtwHxF8LyCPC7IHSVyQ9TM+ubnNUfgpCDVWMPM/HKT0FrqmLG0Dq+iYGP9g==
X-Received: by 2002:a5d:4452:0:b0:34d:a37d:d383 with SMTP id
 ffacd0b85a97d-350185d8857mr3063212f8f.22.1715288278324; 
 Thu, 09 May 2024 13:57:58 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41fccbe8f9bsm37665605e9.6.2024.05.09.13.57.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 May 2024 13:57:57 -0700 (PDT)
Message-ID: <f0d2f475-9fde-4437-9ea4-c3aee6752fa5@mind.be>
Date: Thu, 9 May 2024 22:57:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Nayab Sayed via buildroot <buildroot@buildroot.org>
References: <20240426-refresh-busybox-config-v1-1-c70cb5b60243@microchip.com>
 <20240501221838.07cb2684@windsurf>
Content-Language: en-GB
In-Reply-To: <20240501221838.07cb2684@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1715288279; x=1715893079; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CO3N6wiU7JKsrOp8IzkYvZWTvrNgn/c8C755qq8FyXE=;
 b=AFWpMnWYdnfdvkc/OXeYaRiHOWScxhQP32mAjc+eWDNw2nGJb4zzzrwI5uKiu+gi7M
 NzidF4F4G2UDIlV7Ao8TCZZZ7LCKbsWPoICi8kvPJ9SMFhdHAQhH6ua68ZfL2zP8htH+
 c4+8Y78i0K/xIY41Ba490w4JyRhrdHY6hP8Q9f/KzWAJbWC6WUlEGl0j4ODOGu6BgjZA
 55GcLnljLEqOhhZEyNxzHH15slK5KoVSrwoDi7fD9iUXygA5pZUb23djoQaQmuJjSvgi
 5TwH7VrChkqZ3RwaPIEBSJikNWZmV/3LyP2RvfVpDcGscBcExEpsCTWkuldBOxA0vDg8
 HYYw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=AFWpMnWY
Subject: Re: [Buildroot] [PATCH] package/busybox: refresh busybox.config
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
Cc: Nayab Sayed <nayabbasha.sayed@microchip.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/05/2024 22:18, Thomas Petazzoni wrote:
> Hello Nayab,
> 
> +Arnout in Cc (question below).
> 
> On Fri, 26 Apr 2024 14:10:58 +0530
> Nayab Sayed via buildroot <buildroot@buildroot.org> wrote:
> 
>> Refresh busybox.config to current version (1.36.1) default values.
>>
>> Signed-off-by: Nayab Sayed <nayabbasha.sayed@microchip.com>
>> ---
>> When `make busybox-update-config` is executed, the config
>> CONFIG_UDHCPC6_DEFAULT_SCRIPT became empty. But it's updated to reuse the
>> value from earlier bump as mentioned in the commit d68b617993bd
>> (package/busybox: update to 1.36.0).
> 
> Arnout: I don't really understand the reasoning in commit d68b617993bd.

  That's from a year ago, you expect too much from me :-)

> The commit log says:
> 
>      Refresh busybox.config. All configs are set to the new defaults, except
>      for CONFIG_UDHCPC_DEFAULT_SCRIPT: for this one, reuse the script we also
>      use for DHCPv4. This is matches the behaviour previous to the bump,
>      where we had a single script handling both.
> 
> Did you mean to say CONFIG_UDHCPC6_DEFAULT_SCRIPT instead?

  I guess... Although, CONFIG_UDHCPC_DEFAULT_SCRIPT's default value is 
/usr/share/udhcpc/default.script and we set it to something different. Really 
I'm not sure what I meant there.

> 
> In the commit, you do:
> 
> +CONFIG_UDHCPC6_DEFAULT_SCRIPT="/usr/share/udhcpc/default.script"
> 
> But then, why do we do that? udhcpc6 is not enabled in our
> busybox.config. Due to this, when we refresh busybox.config, this
> CONFIG_UDHCPC6_DEFAULT_SCRIPT gets dropped.

  Uh, I guess I didn't notice that udhcpc6 wasn't enabled?

  Regards,
  Arnout

> 
>> @@ -336,7 +336,7 @@ CONFIG_TEST=y
>>   CONFIG_TEST1=y
>>   CONFIG_TEST2=y
>>   CONFIG_FEATURE_TEST_64=y
>> -# CONFIG_TIMEOUT is not set
>> +CONFIG_TIMEOUT=y
> 
> Nayab: this doesn't show up here when I refresh the file. Are you sure
> this isn't a custom change on your side, unrelated to the Busybox file
> refresh?
> 
> Best regards,
> 
> Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
