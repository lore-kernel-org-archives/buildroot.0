Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4D5DC4829B
	for <buildroot@archiver.kernel.org>; Mon, 12 Feb 2024 13:44:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 31D2C40025;
	Mon, 12 Feb 2024 13:44:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AK2hXGcABqXw; Mon, 12 Feb 2024 13:44:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7453A400EF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7453A400EF;
	Mon, 12 Feb 2024 13:44:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1C8FB1BF2B0
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 13:44:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 00D96400EF
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 13:44:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9kz4adocJraO for <buildroot@lists.busybox.net>;
 Mon, 12 Feb 2024 13:44:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com;
 envelope-from=antoine.coutant@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1115640025
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1115640025
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1115640025
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 13:44:29 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2d0f7585d89so12116371fa.3
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 05:44:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707745467; x=1708350267;
 h=in-reply-to:from:content-language:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=f0fXpWva4edLXKors2GgfrO/o4i6oXegv3PF39oxdRM=;
 b=sIzpXG4fiVXDwNx7HADp0FJcz8EADrxioIyN55n7g6hnkRVLXu1DaP2sPO2HAoi6oh
 Lu7cBXGZwV3yLxyHr8/XY6uWxCUev0MdNxGlh68kyh70HEpkymTJ0jfVTds238ZHeX4J
 bBuv1pDJJrXnX3Bfmmhth7FSZnFAX6X9IbTnTOUaHROwR+ccsA38wNxigBXwX8h/skN8
 5i1ht97ZeAa8/iiRGvlWD8K0259E8YBLerPCdRqdKuYd5mmyksj04OfOwOt3FXbW5M6o
 javCAmMils7zl1zozVl0X+jdfLGZIvP92f61cOLf4TC0Y7p1USQSU+sx1liqwtioGtQP
 Wxjg==
X-Gm-Message-State: AOJu0YxvqXIBGRvqms0bdb1SJWbeWN+WYTibqWTvEFTcnJdoKBUyV3vj
 hUDhznZQxML5UQV/TyfZlDIR/FN/lY0QOk2GplWCusRo2sf4hlX5o9DFCy5kv+Q=
X-Google-Smtp-Source: AGHT+IGEHCVO27vQjA9b75VDYzRHdot0ZF1cBaRKK5RtoIqSCZn5MrrYqvVA+Hp70sCWJg7hh4WX2w==
X-Received: by 2002:ac2:4579:0:b0:511:87b7:6d88 with SMTP id
 k25-20020ac24579000000b0051187b76d88mr2690293lfm.32.1707745467084; 
 Mon, 12 Feb 2024 05:44:27 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUSQjOJzrVtyg5vuaWbixPhvwseUH5Z7m3aa5NmygRkkPNsh2t7om/ntmrBrl+gAv/eAFxF0tyGfnKkrRiu4MiQk8ZlzKTN6/5Ijw8hw6dyHhvNs6rNln9v5sCJA2EYz84Ec0d9J1VQU0c7BJko3usC
Received: from ?IPV6:2a01:cb08:8680:f100:ee18:d70:d8d8:5591?
 (2a01cb088680f100ee180d70d8d85591.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8680:f100:ee18:d70:d8d8:5591])
 by smtp.gmail.com with ESMTPSA id
 iv15-20020a05600c548f00b004107686650esm8779525wmb.36.2024.02.12.05.44.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Feb 2024 05:44:26 -0800 (PST)
Message-ID: <a2e41a71-7b71-4807-9120-6c27d61b4e2c@smile.fr>
Date: Mon, 12 Feb 2024 14:44:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20240202093625.1409559-1-antoine.coutant@smile.fr>
 <20240202093625.1409559-5-antoine.coutant@smile.fr>
 <ZcOow6Wd11qTf8Qs@landeda>
Content-Language: en-US
From: Antoine Coutant <antoine.coutant@smile.fr>
In-Reply-To: <ZcOow6Wd11qTf8Qs@landeda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707745467; x=1708350267;
 darn=buildroot.org; 
 h=in-reply-to:from:content-language:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f0fXpWva4edLXKors2GgfrO/o4i6oXegv3PF39oxdRM=;
 b=lRfJ6Y4OglG+KkCu7iZILRG1hwG2pj9XxcuSa4BJVtVRLkCEJHCZmiXfP+QZD3iaTs
 KapEwlqV53dxcULLyHoaXOeS3iY7L+KLF9CLndWtR4wWg+hRxptl1EEsIJdseSzI8g2p
 /G2D9+XV0Gq2jpSf3hsT8H/gz31Bu4cQFIA06VqObNT0yCvMlC6Z3D8eEFPj8gTd16k9
 +ntgkzFZxrInnVPw491Q58+FE04UimqJPVROH31XY/pOWM8txS1ekIQfatSzQTICc8uW
 VSqLCb5CgGdMU5txpLOX4N7CyzEg5dz789zBWKZcVKOn2aQ5pxFBCUoaRvaMXOy1QhGC
 1CJg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=lRfJ6Y4O
Subject: Re: [Buildroot] [PATCH v4 4/7] package/opencl-headers: new package
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
Cc: sebastian.weyer@smile.fr, bernd@kuhls.net, romain.naour@smile.fr,
 buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============3995979541987964549=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.
--===============3995979541987964549==
Content-Type: multipart/alternative;
 boundary="------------aknPGgQxYHLWf198OBqxNShr"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------aknPGgQxYHLWf198OBqxNShr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Yann, All,

On 07/02/2024 16:58, Yann E. MORIN wrote:
> Antoine, All,
>
> On 2024-02-02 10:36 +0100, Antoine Coutant spake thusly:
>> From: Sebastian Weyer<sebastian.weyer@smile.fr>
>>
>> These headers provide the C language API bindings. It is a complement to
>> the C++ bindings already available in opencl-clhpp. This package is
>> required to build opencl-icd-loader:
>>
>> https://github.com/KhronosGroup/OpenCL-ICD-Loader#dependencies
>>
>> Signed-off-by: Sebastian Weyer<sebastian.weyer@smile.fr>
>> Signed-off-by: Antoine Coutant<antoine.coutant@smile.fr>
>> ---
> [--SNIP--]
>> diff --git a/package/opencl-headers/Config.in b/package/opencl-headers/Config.in
>> new file mode 100644
>> index 0000000000..092d8a2a4d
>> --- /dev/null
>> +++ b/package/opencl-headers/Config.in
>> @@ -0,0 +1,7 @@
>> +config BR2_PACKAGE_OPENCL_HEADERS
>> +	bool "opencl-headers"
>> +	depends on BR2_PACKAGE_HAS_LIBOPENCL
> BR2_PACKAGE_HAS_LIBOPENCL can be set by mesa3d when BR2_PACKAGE_MESA3D_OPENCL
> is enabled. In this case, will mesa3d install its own headers? If so,
> that will generate a conflict.

BR2_PACKAGE_HAS_LIBOPENCL doesn't guarantee that CL headers

will be installed. Mesa3d install headers if Clover is enabled and

opencl-icd is disabled [1]. So you are right, it will generate conflict in

case OpenCL-Headers and Clover are built without icd mode.

> Furthermore, this will also conflict with mesa3d-headers, and it also
> installs CL headers.
Yes, this will generate the same conflict here...
>
> So, why do we need opencl-headers and can't rely on the existing
> mesa3d-headers package?

The problem is that the headers installed by mesa differ from those

in the OpenCL-Headers package.

$ diff -q OpenCL-Headers/CL/cl_icd.h mesa/include/CL/cl_icd.h
Files OpenCL-Headers/CL/cl_icd.h and mesa/include/CL/cl_icd.h differ

This diff was performed using OpenCL-Headers v2023.12.14 and

mesa-23.3.4. Moreover, cl_layer.h, cl_half.h and cl_function_types.h 
files are

missing from mesa headers. These differences causes errors when building

opencl-icd-loader:

...

./build/opencl-icd-loader-2023.12.14/loader/icd.c:23:10: fatal error: 
CL/cl_layer.h: No such file or directory

    23 | #include <CL/cl_layer.h>

| ^~~~~~~~~~~~~~~

compilation terminated.

./build/opencl-icd-loader-2023.12.14/loader/icd_dispatch.c:26:8: error: 
unknown type name ‘clGetICDLoaderInfoOCLICD_t’

    26 | static clGetICDLoaderInfoOCLICD_t clGetICDLoaderInfoOCLICD;

| ^~~~~~~~~~~~~~~~~~~~~~~~~~

...

This is why we cannot rely on mesa3d headers and why OpenCL-Headers

package is required.

> Regards,
> Yann E. MORIN.

I will add guards to prevent conflicts in the v5. And add some lines

in the commit log to explain why mesa3d headers can't be used to

build OpenCL-ICD-Loader.


Thanks for your feedback !


[1]: 
https://gitlab.freedesktop.org/mesa/mesa/-/blob/23.3/include/meson.build?ref_type=heads#L135


Regards,

Antoine Coutant

>
>> +	help
>> +	  C language headers for the OpenCL API
>> +
>> +	https://github.com/KhronosGroup/OpenCL-Headers
>> diff --git a/package/opencl-headers/opencl-headers.hash b/package/opencl-headers/opencl-headers.hash
>> new file mode 100644
>> index 0000000000..802ed05450
>> --- /dev/null
>> +++ b/package/opencl-headers/opencl-headers.hash
>> @@ -0,0 +1,3 @@
>> +#Locally generated
>> +sha256  407d5e109a70ec1b6cd3380ce357c21e3d3651a91caae6d0d8e1719c69a1791d  OpenCL-Headers-2023.12.14.tar.gz
>> +sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
>> diff --git a/package/opencl-headers/opencl-headers.mk b/package/opencl-headers/opencl-headers.mk
>> new file mode 100644
>> index 0000000000..7aa0e0d168
>> --- /dev/null
>> +++ b/package/opencl-headers/opencl-headers.mk
>> @@ -0,0 +1,22 @@
>> +################################################################################
>> +#
>> +# opencl-headers
>> +#
>> +################################################################################
>> +
>> +OPENCL_HEADERS_VERSION = 2023.12.14
>> +OPENCL_HEADERS_SOURCE = OpenCL-Headers-$(OPENCL_HEADERS_VERSION).tar.gz
>> +OPENCL_HEADERS_SITE = $(call github,KhronosGroup,OpenCL-Headers,v$(OPENCL_HEADERS_VERSION))
>> +OPENCL_HEADERS_LICENSE = Apache-2.0
>> +OPENCL_HEADERS_LICENSE_FILES = LICENSE
>> +OPENCL_HEADERS_INSTALL_STAGING = YES
>> +
>> +OPENCL_HEADERS_INSTALL_TARGET = NO
>> +
>> +define OPENCL_HEADERS_INSTALL_STAGING_CMDS
>> +	mkdir -p $(STAGING_DIR)/usr/include/CL
>> +	$(INSTALL) -D -m 0644 $(@D)/CL/* \
>> +		$(STAGING_DIR)/usr/include/CL
>> +endef
>> +
>> +$(eval $(generic-package))
>> -- 
>> 2.25.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
--------------aknPGgQxYHLWf198OBqxNShr
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Yann, All,<br>
    </p>
    <div class="moz-cite-prefix">On 07/02/2024 16:58, Yann E. MORIN
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:ZcOow6Wd11qTf8Qs@landeda">
      <pre class="moz-quote-pre" wrap="">Antoine, All,

On 2024-02-02 10:36 +0100, Antoine Coutant spake thusly:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">From: Sebastian Weyer <a class="moz-txt-link-rfc2396E" href="mailto:sebastian.weyer@smile.fr">&lt;sebastian.weyer@smile.fr&gt;</a>

These headers provide the C language API bindings. It is a complement to
the C++ bindings already available in opencl-clhpp. This package is
required to build opencl-icd-loader:

<a class="moz-txt-link-freetext" href="https://github.com/KhronosGroup/OpenCL-ICD-Loader#dependencies">https://github.com/KhronosGroup/OpenCL-ICD-Loader#dependencies</a>

Signed-off-by: Sebastian Weyer <a class="moz-txt-link-rfc2396E" href="mailto:sebastian.weyer@smile.fr">&lt;sebastian.weyer@smile.fr&gt;</a>
Signed-off-by: Antoine Coutant <a class="moz-txt-link-rfc2396E" href="mailto:antoine.coutant@smile.fr">&lt;antoine.coutant@smile.fr&gt;</a>
---
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">[--SNIP--]
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">diff --git a/package/opencl-headers/Config.in b/package/opencl-headers/Config.in
new file mode 100644
index 0000000000..092d8a2a4d
--- /dev/null
+++ b/package/opencl-headers/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_OPENCL_HEADERS
+	bool "opencl-headers"
+	depends on BR2_PACKAGE_HAS_LIBOPENCL
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
BR2_PACKAGE_HAS_LIBOPENCL can be set by mesa3d when BR2_PACKAGE_MESA3D_OPENCL
is enabled. In this case, will mesa3d install its own headers? If so,
that will generate a conflict.</pre>
    </blockquote>
    <p>BR2_PACKAGE_HAS_LIBOPENCL doesn't guarantee that CL headers</p>
    <p>will be installed. Mesa3d install headers if Clover is enabled
      and</p>
    <p>opencl-icd is disabled [1]. So you are right, it will generate
      conflict in</p>
    <p>case OpenCL-Headers and Clover are built without icd mode<span
      style="white-space: pre-wrap">.
</span><span style="white-space: pre-wrap">
</span></p>
    <blockquote type="cite" cite="mid:ZcOow6Wd11qTf8Qs@landeda">
      <pre class="moz-quote-pre" wrap="">Furthermore, this will also conflict with mesa3d-headers, and it also
installs CL headers.</pre>
    </blockquote>
    Yes, this will generate the same conflict here...<br>
    <blockquote type="cite" cite="mid:ZcOow6Wd11qTf8Qs@landeda">
      <pre class="moz-quote-pre" wrap="">

So, why do we need opencl-headers and can't rely on the existing
mesa3d-headers package?</pre>
    </blockquote>
    <p>The problem is that the headers installed by mesa differ <span
        class="HwtZe" lang="en"><span class="jCAhz ChMk0b"><span
            class="ryNqvb"> from those</span></span></span></p>
    <p><span class="HwtZe" lang="en"><span class="jCAhz ChMk0b"><span
            class="ryNqvb">in the OpenCL-Headers package.</span></span></span><br>
    </p>
    <p>$ diff -q OpenCL-Headers/CL/cl_icd.h mesa/include/CL/cl_icd.h <br>
      Files OpenCL-Headers/CL/cl_icd.h and mesa/include/CL/cl_icd.h
      differ</p>
    <p>This diff was performed using OpenCL-Headers v2023.12.14 and <br>
    </p>
    <p>mesa-23.3.4. Moreover, <span
style="color: rgb(0, 0, 0); background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"
      id="docs-internal-guid-5b3621eb-7fff-e850-ee6c-bf935e9d0caf">cl_layer.h, </span><span
style="color: rgb(0, 0, 0); background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"
      id="docs-internal-guid-87b3d705-7fff-0b31-2fee-2794221ab283">cl_half.h and </span><span
style="color: rgb(0, 0, 0); background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"
      id="docs-internal-guid-2e385c92-7fff-2fcd-a6ef-43f2a6496c0a">cl_function_types.h files are</span></p>
    <p><span
style="color: rgb(0, 0, 0); background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"
      id="docs-internal-guid-2e385c92-7fff-2fcd-a6ef-43f2a6496c0a">missing from mesa headers. These differences causes errors when building</span></p>
    <p><span
style="color: rgb(0, 0, 0); background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"
      id="docs-internal-guid-2e385c92-7fff-2fcd-a6ef-43f2a6496c0a">opencl-icd-loader:</span></p>
    <p><span
style="color: rgb(0, 0, 0); background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"
      id="docs-internal-guid-2e385c92-7fff-2fcd-a6ef-43f2a6496c0a">...</span></p>
    <p><span
style="color: rgb(0, 0, 0); background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">./build/opencl-icd-loader-2023.12.14/loader/icd.c:23:10: fatal error: CL/cl_layer.h: No such file or directory</span></p>
    <p dir="ltr"
      style="line-height:1.2;margin-top:0pt;margin-bottom:0pt;"><span
style="color: rgb(0, 0, 0); background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">   23 | #include &lt;CL/cl_layer.h&gt;</span></p>
    <p dir="ltr"
      style="line-height:1.2;margin-top:0pt;margin-bottom:0pt;"><span
style="color: rgb(0, 0, 0); background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">  </span><span
style="color: rgb(0, 0, 0); background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"><span
      class="Apple-tab-span" style="white-space:pre;">	</span></span><span
style="color: rgb(0, 0, 0); background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">|      </span><span
style="color: rgb(0, 0, 0); background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"><span
      class="Apple-tab-span" style="white-space:pre;">	</span></span><span
style="color: rgb(0, 0, 0); background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">^~~~~~~~~~~~~~~</span></p>
    <p dir="ltr"
      style="line-height:1.2;margin-top:0pt;margin-bottom:0pt;"><span
style="color: rgb(0, 0, 0); background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">compilation terminated.</span></p>
    <p dir="ltr"
      style="line-height:1.2;margin-top:0pt;margin-bottom:0pt;"><span
style="color: rgb(0, 0, 0); background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">./build/opencl-icd-loader-2023.12.14/loader/icd_dispatch.c:26:8: error: unknown type name ‘clGetICDLoaderInfoOCLICD_t’</span></p>
    <p dir="ltr"
      style="line-height:1.2;margin-top:0pt;margin-bottom:0pt;"><span
style="color: rgb(0, 0, 0); background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">   26 | static clGetICDLoaderInfoOCLICD_t clGetICDLoaderInfoOCLICD;</span></p>
    <p><span
style="color: rgb(0, 0, 0); background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">  </span><span
style="color: rgb(0, 0, 0); background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"><span
      class="Apple-tab-span" style="white-space:pre;">	</span></span><span
style="color: rgb(0, 0, 0); background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">|    </span><span
style="color: rgb(0, 0, 0); background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"><span
      class="Apple-tab-span" style="white-space:pre;">	</span></span><span
style="color: rgb(0, 0, 0); background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">^~~~~~~~~~~~~~~~~~~~~~~~~~</span></p>
    <p><span
style="color: rgb(0, 0, 0); background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">...</span></p>
    <p><span
style="color: rgb(0, 0, 0); background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span
style="color: rgb(0, 0, 0); background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">This is why we cannot rely on mesa3d headers and why OpenCL-Headers</span></p>
    <p><span
style="color: rgb(0, 0, 0); background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">package is required.</span><span
style="font-family: Arial, sans-serif; color: rgb(0, 0, 0); background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
</span></p>
    <p></p>
    <blockquote type="cite" cite="mid:ZcOow6Wd11qTf8Qs@landeda">
      <pre class="moz-quote-pre" wrap="">
Regards,
Yann E. MORIN.</pre>
    </blockquote>
    <p>I will add guards to prevent conflicts in the v5. And add some
      lines</p>
    <p>in the commit log to explain why mesa3d headers can't be used to</p>
    <p>build OpenCL-ICD-Loader.</p>
    <p><br>
    </p>
    <p>Thanks for your feedback !</p>
    <p><br>
    </p>
    <p>[1]:
<a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/mesa/mesa/-/blob/23.3/include/meson.build?ref_type=heads#L135">https://gitlab.freedesktop.org/mesa/mesa/-/blob/23.3/include/meson.build?ref_type=heads#L135</a></p>
    <p><br>
    </p>
    <p>Regards,</p>
    <p>Antoine Coutant<br>
    </p>
    <blockquote type="cite" cite="mid:ZcOow6Wd11qTf8Qs@landeda">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+	help
+	  C language headers for the OpenCL API
+
+	  <a class="moz-txt-link-freetext" href="https://github.com/KhronosGroup/OpenCL-Headers">https://github.com/KhronosGroup/OpenCL-Headers</a>
diff --git a/package/opencl-headers/opencl-headers.hash b/package/opencl-headers/opencl-headers.hash
new file mode 100644
index 0000000000..802ed05450
--- /dev/null
+++ b/package/opencl-headers/opencl-headers.hash
@@ -0,0 +1,3 @@
+#Locally generated
+sha256  407d5e109a70ec1b6cd3380ce357c21e3d3651a91caae6d0d8e1719c69a1791d  OpenCL-Headers-2023.12.14.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/opencl-headers/opencl-headers.mk b/package/opencl-headers/opencl-headers.mk
new file mode 100644
index 0000000000..7aa0e0d168
--- /dev/null
+++ b/package/opencl-headers/opencl-headers.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# opencl-headers
+#
+################################################################################
+
+OPENCL_HEADERS_VERSION = 2023.12.14
+OPENCL_HEADERS_SOURCE = OpenCL-Headers-$(OPENCL_HEADERS_VERSION).tar.gz
+OPENCL_HEADERS_SITE = $(call github,KhronosGroup,OpenCL-Headers,v$(OPENCL_HEADERS_VERSION))
+OPENCL_HEADERS_LICENSE = Apache-2.0
+OPENCL_HEADERS_LICENSE_FILES = LICENSE
+OPENCL_HEADERS_INSTALL_STAGING = YES
+
+OPENCL_HEADERS_INSTALL_TARGET = NO
+
+define OPENCL_HEADERS_INSTALL_STAGING_CMDS
+	mkdir -p $(STAGING_DIR)/usr/include/CL
+	$(INSTALL) -D -m 0644 $(@D)/CL/* \
+		$(STAGING_DIR)/usr/include/CL
+endef
+
+$(eval $(generic-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
<a class="moz-txt-link-abbreviated" href="mailto:buildroot@buildroot.org">buildroot@buildroot.org</a>
<a class="moz-txt-link-freetext" href="https://lists.buildroot.org/mailman/listinfo/buildroot">https://lists.buildroot.org/mailman/listinfo/buildroot</a>
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------aknPGgQxYHLWf198OBqxNShr--

--===============3995979541987964549==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3995979541987964549==--
