Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF764C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 20:49:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B45E54196C;
	Fri, 12 Jul 2024 20:49:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l3wbGOC0E627; Fri, 12 Jul 2024 20:49:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B5A2408F3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B5A2408F3;
	Fri, 12 Jul 2024 20:49:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7C3801BF420
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:49:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 678D6812CB
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:49:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q8OM2rVwlFmz for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 20:49:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F28AD81292
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F28AD81292
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F28AD81292
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 20:49:38 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3678aa359b7so2183593f8f.1
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 13:49:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720817377; x=1721422177;
 h=in-reply-to:content-language:references:cc:to:from:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=+WCIZ+pywoGzSGmhoKKPPEPeT4tDk3yLBfZnG86qMb8=;
 b=tRUJkh+y6gueRtwiJIpxPRaZc48ab/LOoB5CdwuRn/wK1j8NOi6wRxUVZlUFZogsNy
 sEjqK2AkvV7g6K51V4uwMHoYWk1NHcXL3cTQMBIlNtn9aJ/6gaLtw0OSiBI41uLAs1+u
 2NEDCu6fhnDIKL4bXSdXmZ9XX3T94DNOrMZP2VE2JC0JlJxa5okodV0Aav4fEOdUcbNw
 1kfw2B3pW0UhHEvuNqOyfZmX1m9E1yORtP0RW0OOlOZeLpWPXAMJuyTKOHz/KKWthfUM
 1r4OUSNPYDJNq4Su/sW76s2KqpWIVBW6R68Zxu2P3e0adOcwssjYK99OwVlYjjTdbFuN
 q0Sg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWH3rCi3kSAA3653/IBtC/MG47W3G8EYiKP/Y6EjemLNBjMjUsCIiYXt0tVAy1UFPnQsTPkZkIcx5v5EUtdEQwOPX8EaaItcA==
X-Gm-Message-State: AOJu0Yyj8C2GwvnYBEcXoRaKLjtKbNZ7nSEmkHOYeyruzL0GsootRo/A
 XDVbYYWqvm8iiJWZBvH+o2YR879C8Z6xENlUZkh/5QHDTmKzpef3vYMv2Jth1Ys=
X-Google-Smtp-Source: AGHT+IGMZmgedCO/wAqC91yuwWChLNte8uTEDM5afIqbTuGuT0iFFVR24GEzsuD1HNKh8z1Ync4e7g==
X-Received: by 2002:a5d:55ca:0:b0:367:89ae:c204 with SMTP id
 ffacd0b85a97d-367ff6ee07emr2895138f8f.12.1720817376735; 
 Fri, 12 Jul 2024 13:49:36 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cdfab6d3sm10817681f8f.112.2024.07.12.13.49.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 13:49:36 -0700 (PDT)
Message-ID: <4e1f15ff-9611-4532-b341-5bfef16b8929@mind.be>
Date: Fri, 12 Jul 2024 22:49:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: kazemi.ms@gmail.com, buildroot@buildroot.org
References: <20230919193514.18212-1-kazemi.ms@gmail.com>
 <80bf284b-1b9c-404e-98b8-c0e11b882b7c@mind.be>
Content-Language: en-GB
In-Reply-To: <80bf284b-1b9c-404e-98b8-c0e11b882b7c@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720817377; x=1721422177; darn=buildroot.org;
 h=in-reply-to:content-language:references:cc:to:from:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+WCIZ+pywoGzSGmhoKKPPEPeT4tDk3yLBfZnG86qMb8=;
 b=ia79ndhI6cS5aQNccuDwFRg0Q5AGqDx5PAbM4dOz2yK2qDsIuPHTQ8ibYgZZ6Orobw
 woJRq74vsGbzWsrTeHB8W1QS1FeKv3/EnMqtFee0/3LsHjpjR6BpIpPgcaN4a3tT/ZpO
 dfedlMg7DmqParq4dWeaCX43UlRIkA7khb3LLHxRif/r4JTxVk3EVaM5/3HWap2IrgBa
 S7R7mcWTRpo7YBH8FuzHhNOKfciSTsR0XDFidYahnBZ4fcJ8bvhNicxMYqVZX58VLrKN
 Am5mc0RPzPrxJdoC6XfYsxxSoYgwWMXXqHJPOD6A2YpHhPhQ9LbQkqgq7ciarHFiU7SX
 m4Vw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ia79ndhI
Subject: Re: [Buildroot] [PATCH 1/1] package/mxt-app: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: multipart/mixed; boundary="===============5522028549999710630=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.
--===============5522028549999710630==
Content-Type: multipart/alternative;
 boundary="------------JMLSs2dOPH1S460d8VtAh18X"
Content-Language: en-GB

This is a multi-part message in MIME format.
--------------JMLSs2dOPH1S460d8VtAh18X
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12/07/2024 22:48, Arnout Vandecappelle wrote:
>
>
> On 19/09/2023 21:35, kazemi.ms@gmail.com wrote:
>> From: Saeed Kazemi <kazemi.ms@gmail.com>
>>
>> mxt-app is a utility for managing Atmel maXTouch touch controllers
>> and other devices that support Atmel Object Based Protocol.
>>
>> Signed-off-by: Saeed Kazemi <kazemi.ms@gmail.com>
>
>  Applied to master, thanks.

  Forgot to mention the changes I still made:

     - drop BR2_PACKAGE_MXT_APP_DEBUG option, instead use
       BR2_ENABLE_RUNTIME_DEBUG;
     - also explicitly disable debug;
     - add comment to explain AUTORECONF.


  Regards,
  Arnout

>
>  Regards,
>  Arnout
>
>> ---
>>   DEVELOPERS                   |  3 +++
>>   package/Config.in            |  1 +
>>   package/mxt-app/Config.in    | 20 ++++++++++++++++++++
>>   package/mxt-app/mxt-app.hash |  3 +++
>>   package/mxt-app/mxt-app.mk   | 19 +++++++++++++++++++
>>   5 files changed, 46 insertions(+)
>>   create mode 100644 package/mxt-app/Config.in
>>   create mode 100644 package/mxt-app/mxt-app.hash
>>   create mode 100644 package/mxt-app/mxt-app.mk
>>
>> diff --git a/DEVELOPERS b/DEVELOPERS
>> index e8b78a8d46..19d637d847 100644
>> --- a/DEVELOPERS
>> +++ b/DEVELOPERS
>> @@ -2604,6 +2604,9 @@ F:    package/agent-proxy/
>>   N:    Ryan Wilkins <ryan@deadfrog.net>
>>   F:    package/biosdevname/
>>   +N:    Saeed Kazemi <kazemi.ms@gmail.com>
>> +F:    package/mxt-app/
>> +
>>   N:    Sam Lancia <sam@gpsm.co.uk>
>>   F:    package/lrzip/
>>   diff --git a/package/Config.in b/package/Config.in
>> index e8dbadadf3..e8d39b74b8 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -556,6 +556,7 @@ endmenu
>>       source "package/mhz/Config.in"
>>       source "package/minicom/Config.in"
>>       source "package/msr-tools/Config.in"
>> +    source "package/mxt-app/Config.in"
>>       source "package/nanocom/Config.in"
>>       source "package/neard/Config.in"
>>       source "package/nvidia-driver/Config.in"
>> diff --git a/package/mxt-app/Config.in b/package/mxt-app/Config.in
>> new file mode 100644
>> index 0000000000..2b153901de
>> --- /dev/null
>> +++ b/package/mxt-app/Config.in
>> @@ -0,0 +1,20 @@
>> +config BR2_PACKAGE_MXT_APP
>> +    bool "mxt-app"
>> +    depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
>> +    depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
>> +    select BR2_PACKAGE_LIBUSB
>> +    help
>> +      mxt-app is a utility for managing Atmel maXTouch touch
>> +      controllers and other devices that support Atmel Object Based
>> +      Protocol.
>> +
>> + https://github.com/atmel-maxtouch/mxt-app/
>> +
>> +config BR2_PACKAGE_MXT_APP_DEBUG
>> +    bool "mxt-app debugging"
>> +    help
>> +      Compile mxt-app with debug enabled
>> +
>> +comment "mxt-app needs a toolchain w/ threads, gcc >= 4.9"
>> +    depends on !BR2_TOOLCHAIN_HAS_THREADS || \
>> +        !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
>> diff --git a/package/mxt-app/mxt-app.hash b/package/mxt-app/mxt-app.hash
>> new file mode 100644
>> index 0000000000..b7851cea37
>> --- /dev/null
>> +++ b/package/mxt-app/mxt-app.hash
>> @@ -0,0 +1,3 @@
>> +# Locally calculated
>> +sha256 3639720ae1ea033bd982d68c5cab84432ce046fe14a66d9b2de07f115b642722 
>> mxt-app-1.36.tar.gz
>> +sha256 3682b125a40a4da00b6ab69bdbd38c25ed4beae69b3fe32458d2e32638477c4c LICENSE
>> diff --git a/package/mxt-app/mxt-app.mk b/package/mxt-app/mxt-app.mk
>> new file mode 100644
>> index 0000000000..da0aa65328
>> --- /dev/null
>> +++ b/package/mxt-app/mxt-app.mk
>> @@ -0,0 +1,19 @@
>> +################################################################################ 
>>
>> +#
>> +# mxt-app
>> +#
>> +################################################################################ 
>>
>> +
>> +MXT_APP_VERSION = 1.36
>> +MXT_APP_SITE = $(call github,atmel-maxtouch,mxt-app,v$(MXT_APP_VERSION))
>> +MXT_APP_LICENSE = BSD-2-Clause
>> +MXT_APP_LICENSE_FILES = LICENSE
>> +MXT_APP_DEPENDENCIES = libusb
>> +MXT_APP_INSTALL_STAGING = YES
>> +MXT_APP_AUTORECONF = YES
>> +
>> +ifeq ($(BR2_PACKAGE_MXT_APP_DEBUG),y)
>> +MXT_APP_CONF_OPTS += --enable-debug
>> +endif
>> +
>> +$(eval $(autotools-package))
--------------JMLSs2dOPH1S460d8VtAh18X
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 12/07/2024 22:48, Arnout
      Vandecappelle wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:80bf284b-1b9c-404e-98b8-c0e11b882b7c@mind.be">
      <br>
      <br>
      On 19/09/2023 21:35, <a class="moz-txt-link-abbreviated" href="mailto:kazemi.ms@gmail.com">kazemi.ms@gmail.com</a> wrote:
      <br>
      <blockquote type="cite">From: Saeed Kazemi
        <a class="moz-txt-link-rfc2396E" href="mailto:kazemi.ms@gmail.com">&lt;kazemi.ms@gmail.com&gt;</a>
        <br>
        <br>
        mxt-app is a utility for managing Atmel maXTouch touch
        controllers
        <br>
        and other devices that support Atmel Object Based Protocol.
        <br>
        <br>
        Signed-off-by: Saeed Kazemi <a class="moz-txt-link-rfc2396E" href="mailto:kazemi.ms@gmail.com">&lt;kazemi.ms@gmail.com&gt;</a>
        <br>
      </blockquote>
      <br>
       Applied to master, thanks.
      <br>
    </blockquote>
    <p> Forgot to mention the changes I still made:</p>
    <p><span style="font-family:monospace"><span
          style="color:#000000;background-color:#ffffff;">     - drop
          BR2_PACKAGE_MXT_APP_DEBUG option, instead use
        </span><br>
              BR2_ENABLE_RUNTIME_DEBUG;
        <br>
            - also explicitly disable debug;
        <br>
            - add comment to explain AUTORECONF.<br>
        <br>
        <br>
         Regards,<br>
         Arnout<br>
      </span></p>
    <blockquote type="cite"
      cite="mid:80bf284b-1b9c-404e-98b8-c0e11b882b7c@mind.be">
      <br>
       Regards,
      <br>
       Arnout
      <br>
      <br>
      <blockquote type="cite">---
        <br>
          DEVELOPERS                   |  3 +++
        <br>
          package/Config.in            |  1 +
        <br>
          package/mxt-app/Config.in    | 20 ++++++++++++++++++++
        <br>
          package/mxt-app/mxt-app.hash |  3 +++
        <br>
          package/mxt-app/mxt-app.mk   | 19 +++++++++++++++++++
        <br>
          5 files changed, 46 insertions(+)
        <br>
          create mode 100644 package/mxt-app/Config.in
        <br>
          create mode 100644 package/mxt-app/mxt-app.hash
        <br>
          create mode 100644 package/mxt-app/mxt-app.mk
        <br>
        <br>
        diff --git a/DEVELOPERS b/DEVELOPERS
        <br>
        index e8b78a8d46..19d637d847 100644
        <br>
        --- a/DEVELOPERS
        <br>
        +++ b/DEVELOPERS
        <br>
        @@ -2604,6 +2604,9 @@ F:    package/agent-proxy/
        <br>
          N:    Ryan Wilkins <a class="moz-txt-link-rfc2396E" href="mailto:ryan@deadfrog.net">&lt;ryan@deadfrog.net&gt;</a>
        <br>
          F:    package/biosdevname/
        <br>
          +N:    Saeed Kazemi <a class="moz-txt-link-rfc2396E" href="mailto:kazemi.ms@gmail.com">&lt;kazemi.ms@gmail.com&gt;</a>
        <br>
        +F:    package/mxt-app/
        <br>
        +
        <br>
          N:    Sam Lancia <a class="moz-txt-link-rfc2396E" href="mailto:sam@gpsm.co.uk">&lt;sam@gpsm.co.uk&gt;</a>
        <br>
          F:    package/lrzip/
        <br>
          diff --git a/package/Config.in b/package/Config.in
        <br>
        index e8dbadadf3..e8d39b74b8 100644
        <br>
        --- a/package/Config.in
        <br>
        +++ b/package/Config.in
        <br>
        @@ -556,6 +556,7 @@ endmenu
        <br>
              source "package/mhz/Config.in"
        <br>
              source "package/minicom/Config.in"
        <br>
              source "package/msr-tools/Config.in"
        <br>
        +    source "package/mxt-app/Config.in"
        <br>
              source "package/nanocom/Config.in"
        <br>
              source "package/neard/Config.in"
        <br>
              source "package/nvidia-driver/Config.in"
        <br>
        diff --git a/package/mxt-app/Config.in
        b/package/mxt-app/Config.in
        <br>
        new file mode 100644
        <br>
        index 0000000000..2b153901de
        <br>
        --- /dev/null
        <br>
        +++ b/package/mxt-app/Config.in
        <br>
        @@ -0,0 +1,20 @@
        <br>
        +config BR2_PACKAGE_MXT_APP
        <br>
        +    bool "mxt-app"
        <br>
        +    depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
        <br>
        +    depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
        <br>
        +    select BR2_PACKAGE_LIBUSB
        <br>
        +    help
        <br>
        +      mxt-app is a utility for managing Atmel maXTouch touch
        <br>
        +      controllers and other devices that support Atmel Object
        Based
        <br>
        +      Protocol.
        <br>
        +
        <br>
        +      <a class="moz-txt-link-freetext" href="https://github.com/atmel-maxtouch/mxt-app/">https://github.com/atmel-maxtouch/mxt-app/</a>
        <br>
        +
        <br>
        +config BR2_PACKAGE_MXT_APP_DEBUG
        <br>
        +    bool "mxt-app debugging"
        <br>
        +    help
        <br>
        +      Compile mxt-app with debug enabled
        <br>
        +
        <br>
        +comment "mxt-app needs a toolchain w/ threads, gcc &gt;= 4.9"
        <br>
        +    depends on !BR2_TOOLCHAIN_HAS_THREADS || \
        <br>
        +        !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
        <br>
        diff --git a/package/mxt-app/mxt-app.hash
        b/package/mxt-app/mxt-app.hash
        <br>
        new file mode 100644
        <br>
        index 0000000000..b7851cea37
        <br>
        --- /dev/null
        <br>
        +++ b/package/mxt-app/mxt-app.hash
        <br>
        @@ -0,0 +1,3 @@
        <br>
        +# Locally calculated
        <br>
        +sha256 
        3639720ae1ea033bd982d68c5cab84432ce046fe14a66d9b2de07f115b642722 
        mxt-app-1.36.tar.gz
        <br>
        +sha256 
        3682b125a40a4da00b6ab69bdbd38c25ed4beae69b3fe32458d2e32638477c4c 
        LICENSE
        <br>
        diff --git a/package/mxt-app/mxt-app.mk
        b/package/mxt-app/mxt-app.mk
        <br>
        new file mode 100644
        <br>
        index 0000000000..da0aa65328
        <br>
        --- /dev/null
        <br>
        +++ b/package/mxt-app/mxt-app.mk
        <br>
        @@ -0,0 +1,19 @@
        <br>
+################################################################################
        <br>
        +#
        <br>
        +# mxt-app
        <br>
        +#
        <br>
+################################################################################
        <br>
        +
        <br>
        +MXT_APP_VERSION = 1.36
        <br>
        +MXT_APP_SITE = $(call
        github,atmel-maxtouch,mxt-app,v$(MXT_APP_VERSION))
        <br>
        +MXT_APP_LICENSE = BSD-2-Clause
        <br>
        +MXT_APP_LICENSE_FILES = LICENSE
        <br>
        +MXT_APP_DEPENDENCIES = libusb
        <br>
        +MXT_APP_INSTALL_STAGING = YES
        <br>
        +MXT_APP_AUTORECONF = YES
        <br>
        +
        <br>
        +ifeq ($(BR2_PACKAGE_MXT_APP_DEBUG),y)
        <br>
        +MXT_APP_CONF_OPTS += --enable-debug
        <br>
        +endif
        <br>
        +
        <br>
        +$(eval $(autotools-package))
        <br>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------JMLSs2dOPH1S460d8VtAh18X--

--===============5522028549999710630==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5522028549999710630==--
