Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C736C4707B
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 16:39:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1453B40468;
	Wed, 10 Jan 2024 16:39:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1453B40468
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qc656m8w0ik4; Wed, 10 Jan 2024 16:39:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 94C90404A1;
	Wed, 10 Jan 2024 16:39:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94C90404A1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 19C361BF5A5
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 16:39:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 002BB4034D
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 16:39:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 002BB4034D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qQFRN-QB_Hu1 for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 16:39:27 +0000 (UTC)
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E63AC4008C
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 16:39:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E63AC4008C
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-6ddeb09bc68so674072a34.1
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 08:39:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704904766; x=1705509566;
 h=in-reply-to:from:references:to:content-language:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=HSdeE1nIxmtWvR/PFUKlAR/SVgFoKZz8bkXeUUau5VA=;
 b=iFgE0oiKyPdPtp7/fhSWdEXrOxDI4YJ8QR3BKu6MgqprHHR4XGkbyaMwpzW5bgB+05
 aN3bVDxGWr53nw7XbDsv/pTHvVJpvI6uk81PItlQL+AjLykVlhT69AZjXl89wI78msGX
 xAC2kpl8PokEYonm3+ByP0T7wVQHUTQZFkNbJ2TFxEjRhZIr4IQie0s9e+NANriTe+m2
 7CyeL0x6BXdYj/YwAm1gv6G38/Yt+Z6QLbsmSEykIXVKABeRRHX+HXyNhGvGkeF/LItJ
 u4kz/POJReax/HrIrH5c81PqwxnJWO5Swv5E0GEV5dzykReYQGMlhRA7lHB++BEdvGNu
 d7GA==
X-Gm-Message-State: AOJu0YyAJ4Ay+fNnM2Jsos0oWpIplv/SeYTcTQQ2RGCDmwj/nEmrh9n8
 7vIwNjwjgsWG0vCx7CEL0a8felfRDuxBPko8go3N31cshWE=
X-Google-Smtp-Source: AGHT+IGVeQSXdwnBO+z8YukdwDQimLo9PF3a4OOajX15BilNDyo98PGPGLPLli5P00v21OW+S2KeHA==
X-Received: by 2002:a05:6871:4395:b0:204:21b3:992f with SMTP id
 lv21-20020a056871439500b0020421b3992fmr201869oab.50.1704904765714; 
 Wed, 10 Jan 2024 08:39:25 -0800 (PST)
Received: from [192.168.3.30] ([187.120.6.114])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a9d708d000000b006dc659f109csm783317otj.40.2024.01.10.08.39.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jan 2024 08:39:25 -0800 (PST)
Message-ID: <1e7875c8-a2dc-45cd-8be6-8c8300ace40a@newtesc.com.br>
Date: Wed, 10 Jan 2024 13:39:17 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
References: <20240110152246.1605712-1-flavio.tapajos@newtesc.com.br>
 <b8371f73-1e2f-4020-bcdf-2d96c12c5c5b@smile.fr>
From: =?UTF-8?Q?Fl=C3=A1vio_Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
In-Reply-To: <b8371f73-1e2f-4020-bcdf-2d96c12c5c5b@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=newtesc-com-br.20230601.gappssmtp.com; s=20230601; t=1704904766; x=1705509566;
 darn=buildroot.org; 
 h=in-reply-to:from:references:to:content-language:subject:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HSdeE1nIxmtWvR/PFUKlAR/SVgFoKZz8bkXeUUau5VA=;
 b=t0vLtMWk69lQZiP3SSmH7qktnTd07Rv3MOd1PNrcFWy1wPrp8UXqzLogQoSNxoa9EI
 auTKfb5rFd42SV2Dorc2AgOV8HAUvlmJAdwGBGwAywi7hsEioTFIRRxeGuL43egySKTH
 enqBFLsqU4wkFu2taoYZVkW9YOAqrr/TqUPiGI4tifza7PQhOUryFzh/ajddhZQc72aG
 qH1eaZICMobJ4R5HScLQB+gtoZN7L+E4J08e+7De5o3kvWwrFP12UnUD4AjRFtSaYIXO
 0L9aHLsB5t4uJCNu0LWTlwjHPN5apvBucwWSgZhY6Qc7OjV7f627O+yPr/BOxDI3fehV
 WVvw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=newtesc-com-br.20230601.gappssmtp.com
 header.i=@newtesc-com-br.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=t0vLtMWk
Subject: Re: [Buildroot] [PATCH 1/2] boot/uboot: bump to 2024.1
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
Content-Type: multipart/mixed; boundary="===============4597793001186940683=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.
--===============4597793001186940683==
Content-Type: multipart/alternative;
 boundary="------------L05FfBj4iTBLNQqiE16vwH1X"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------L05FfBj4iTBLNQqiE16vwH1X
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

Even though updating a package is a simple task, I only sign-off a bump commit if I can understand/test the consequences of it, which is not the case for uboot-tools
Curiously enough, even without this patch uboot-tools is already with an older version (2021.07) than uboot (2022.04)

Em 10/01/2024 12:55, Romain Naour escreveu:

> Hello,
>
> Le 10/01/2024 à 16:22, Flávio Tapajós a écrit :
>> All in-tree configs with the uboot bootloader use a custom version,
>> so this patch is mostly for the menuconfig default uboot version
>>
> Notice we have a uboot-tools package that was not updated since a while:
>
> https://gitlab.com/buildroot.org/buildroot/-/blob/master/package/uboot-tools/uboot-tools.mk?ref_type=heads#L7
>
> It would be great if you can update it too.
>
> Thanks!
>
> Best regards,
> Romain
>
>
>> Signed-off-by: Flávio Tapajós<flavio.tapajos@newtesc.com.br>
>> ---
>>   boot/uboot/Config.in  | 4 ++--
>>   boot/uboot/uboot.hash | 2 +-
>>   2 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
>> index 21f19db890..beafb38930 100644
>> --- a/boot/uboot/Config.in
>> +++ b/boot/uboot/Config.in
>> @@ -41,7 +41,7 @@ choice
>>   	  Select the specific U-Boot version you want to use
>>   
>>   config BR2_TARGET_UBOOT_LATEST_VERSION
>> -	bool "2022.04"
>> +	bool "2024.01"
>>   
>>   config BR2_TARGET_UBOOT_CUSTOM_VERSION
>>   	bool "Custom version"
>> @@ -85,7 +85,7 @@ endif
>>   
>>   config BR2_TARGET_UBOOT_VERSION
>>   	string
>> -	default "2022.04"	if BR2_TARGET_UBOOT_LATEST_VERSION
>> +	default "2024.01"	if BR2_TARGET_UBOOT_LATEST_VERSION
>>   	default BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE \
>>   		if BR2_TARGET_UBOOT_CUSTOM_VERSION
>>   	default "custom"	if BR2_TARGET_UBOOT_CUSTOM_TARBALL
>> diff --git a/boot/uboot/uboot.hash b/boot/uboot/uboot.hash
>> index a8bd817900..fbe5d21540 100644
>> --- a/boot/uboot/uboot.hash
>> +++ b/boot/uboot/uboot.hash
>> @@ -1,3 +1,3 @@
>>   # Locally computed:
>> -sha256  68e065413926778e276ec3abd28bb32fa82abaa4a6898d570c1f48fbdb08bcd0  u-boot-2022.04.tar.bz2
>> +sha256  b99611f1ed237bf3541bdc8434b68c96a6e05967061f992443cb30aabebef5b3  u-boot-2024.01.tar.bz2
>>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Licenses/gpl-2.0.txt
--------------L05FfBj4iTBLNQqiE16vwH1X
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">
      <pre>Hello,

Even though updating a package is a simple task, I only sign-off a bump commit if I can understand/test the consequences of it, which is not the case for uboot-tools
Curiously enough, even without this patch uboot-tools is already with an older version (2021.07) than uboot (2022.04)

Em 10/01/2024 12:55, Romain Naour escreveu:</pre>
    </div>
    <blockquote type="cite"
      cite="mid:b8371f73-1e2f-4020-bcdf-2d96c12c5c5b@smile.fr">
      <pre class="moz-quote-pre" wrap="">Hello,

Le 10/01/2024 à 16:22, Flávio Tapajós a écrit :
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">All in-tree configs with the uboot bootloader use a custom version,
so this patch is mostly for the menuconfig default uboot version

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Notice we have a uboot-tools package that was not updated since a while:

<a class="moz-txt-link-freetext" href="https://gitlab.com/buildroot.org/buildroot/-/blob/master/package/uboot-tools/uboot-tools.mk?ref_type=heads#L7">https://gitlab.com/buildroot.org/buildroot/-/blob/master/package/uboot-tools/uboot-tools.mk?ref_type=heads#L7</a>

It would be great if you can update it too.

Thanks!

Best regards,
Romain


</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Signed-off-by: Flávio Tapajós <a class="moz-txt-link-rfc2396E" href="mailto:flavio.tapajos@newtesc.com.br">&lt;flavio.tapajos@newtesc.com.br&gt;</a>
---
 boot/uboot/Config.in  | 4 ++--
 boot/uboot/uboot.hash | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 21f19db890..beafb38930 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -41,7 +41,7 @@ choice
 	  Select the specific U-Boot version you want to use
 
 config BR2_TARGET_UBOOT_LATEST_VERSION
-	bool "2022.04"
+	bool "2024.01"
 
 config BR2_TARGET_UBOOT_CUSTOM_VERSION
 	bool "Custom version"
@@ -85,7 +85,7 @@ endif
 
 config BR2_TARGET_UBOOT_VERSION
 	string
-	default "2022.04"	if BR2_TARGET_UBOOT_LATEST_VERSION
+	default "2024.01"	if BR2_TARGET_UBOOT_LATEST_VERSION
 	default BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE \
 		if BR2_TARGET_UBOOT_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_UBOOT_CUSTOM_TARBALL
diff --git a/boot/uboot/uboot.hash b/boot/uboot/uboot.hash
index a8bd817900..fbe5d21540 100644
--- a/boot/uboot/uboot.hash
+++ b/boot/uboot/uboot.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  68e065413926778e276ec3abd28bb32fa82abaa4a6898d570c1f48fbdb08bcd0  u-boot-2022.04.tar.bz2
+sha256  b99611f1ed237bf3541bdc8434b68c96a6e05967061f992443cb30aabebef5b3  u-boot-2024.01.tar.bz2
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Licenses/gpl-2.0.txt
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------L05FfBj4iTBLNQqiE16vwH1X--

--===============4597793001186940683==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4597793001186940683==--
