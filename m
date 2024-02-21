Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C11C5478A
	for <buildroot@archiver.kernel.org>; Wed, 21 Feb 2024 16:55:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F18D660862;
	Wed, 21 Feb 2024 16:55:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jzVOg2ZBJMME; Wed, 21 Feb 2024 16:55:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80C0660EE4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80C0660EE4;
	Wed, 21 Feb 2024 16:55:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9BAB21BF348
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 16:55:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8838F406A0
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 16:55:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LY-ajl6A9CSV for <buildroot@lists.busybox.net>;
 Wed, 21 Feb 2024 16:55:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=antoine.coutant@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5676B40684
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5676B40684
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5676B40684
 for <buildroot@buildroot.org>; Wed, 21 Feb 2024 16:55:39 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-33d6f1f17e5so1215151f8f.3
 for <buildroot@buildroot.org>; Wed, 21 Feb 2024 08:55:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708534538; x=1709139338;
 h=in-reply-to:content-language:references:cc:to:from:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=/3GsUtaV3Y5pRfEvKnWWHDIDbBJngZmmvlkaUkrAkBY=;
 b=pZlRnr+9BK7ilXoTBO4d1aN+MBLQQrfrAM0/pla0nTikKDzMbec63TpH+WD4Kswt1T
 ZnbuZ72hnPmdjwjwdP/s6F5sgMNH0wlDSRzq4Zy8CBFOtEscI8ZzbcEonCSel6qHP6HD
 oeeybyg88MpdMkIjNf8rqtxBIRWOwI2EuX4LRdQ8VrGxENQE/SCgEOKHA59j0VRCaD6f
 hd7C3nY1/aoj38lguBZlhpiIagbPUAmZPxyMr/pLqu4arTkZzRlw9dHJ3bLmh+ZQlCUQ
 DT0Yw0AyFjCvdUibpFFE/VaKTwHdVnTHjQan8DtHrhvCMWldWDJJPO+Lh7eR9Har/u+w
 8/jg==
X-Gm-Message-State: AOJu0Ywt85gQEzQDn319PZTCsDtXSvF0yDQRjkTuJ/5Md4Wh5JtGAvQz
 B1mfh6cdHbifCfbye8eGXlcJOvB7vpSbzrshW4AySnGrO0dvGZ8LMviQdB00X8k=
X-Google-Smtp-Source: AGHT+IGs6dQxircEMSz3Ugc8c470KtM/lMqEYdJ3BTvWDU6/ZHMFusCKjqOQWWMlKIg6Ykmxa2nMaQ==
X-Received: by 2002:adf:f190:0:b0:33d:39de:630a with SMTP id
 h16-20020adff190000000b0033d39de630amr7625030wro.14.1708534537585; 
 Wed, 21 Feb 2024 08:55:37 -0800 (PST)
Received: from [10.5.0.40] (202-122-190-109.dsl.ovh.fr. [109.190.122.202])
 by smtp.gmail.com with ESMTPSA id
 ba1-20020a0560001c0100b0033d67bdce97sm6764936wrb.84.2024.02.21.08.55.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Feb 2024 08:55:37 -0800 (PST)
Message-ID: <bdb4ad30-b76e-48ad-9377-336cecff5243@smile.fr>
Date: Wed, 21 Feb 2024 17:55:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Antoine Coutant <antoine.coutant@smile.fr>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20240202093625.1409559-1-antoine.coutant@smile.fr>
 <20240202093625.1409559-5-antoine.coutant@smile.fr>
 <ZcOow6Wd11qTf8Qs@landeda> <a2e41a71-7b71-4807-9120-6c27d61b4e2c@smile.fr>
Content-Language: en-US
In-Reply-To: <a2e41a71-7b71-4807-9120-6c27d61b4e2c@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1708534538; x=1709139338;
 darn=buildroot.org; 
 h=in-reply-to:content-language:references:cc:to:from:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/3GsUtaV3Y5pRfEvKnWWHDIDbBJngZmmvlkaUkrAkBY=;
 b=tEyVHfzo+1ljAO814gWs2QI6g9Qxq+42OlPBOwhZLHspRchrDcb57nWP/Jnz2NeVwe
 lHlb5s9/WIDWsOHHaOUuhDBPuGtCD5mDi4rXJroJaLVl2a7NwtdBYTC/tvgCzUL/KoaY
 ypSxHEk3e0Ap/V/DK28PdkWt+kuZiEoaVzYWQNW5RmCqWL3oQ878AW3au7+kPnvB1L62
 cT6uNBrq0fvO7htA8htAPng1BX/S7knXBG6HqoPeaNm+bTRLIyIGGQVVOKVM9hLehgcu
 XCQjw/kpgQns2O9XkWR8oXWeVw/2Ql9RLA9V+lC9DYpRqNrb91QQxTQNZIBmg7aYu1Xq
 Z8/w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=tEyVHfzo
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
Content-Type: multipart/mixed; boundary="===============4283951866827660059=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.
--===============4283951866827660059==
Content-Type: multipart/alternative;
 boundary="------------gHYd0AvudXHwpGKOpRcLusKp"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------gHYd0AvudXHwpGKOpRcLusKp
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Yann, All,

On 12/02/2024 14:44, Antoine Coutant wrote:
>
> Yann, All,
>
> On 07/02/2024 16:58, Yann E. MORIN wrote:
>> Antoine, All,
>>
>> On 2024-02-02 10:36 +0100, Antoine Coutant spake thusly:
>>> From: Sebastian Weyer<sebastian.weyer@smile.fr>
>>>
>>> These headers provide the C language API bindings. It is a complement to
>>> the C++ bindings already available in opencl-clhpp. This package is
>>> required to build opencl-icd-loader:
>>>
>>> https://github.com/KhronosGroup/OpenCL-ICD-Loader#dependencies
>>>
>>> Signed-off-by: Sebastian Weyer<sebastian.weyer@smile.fr>
>>> Signed-off-by: Antoine Coutant<antoine.coutant@smile.fr>
>>> ---

[--SNIP--]

>> So, why do we need opencl-headers and can't rely on the existing
>> mesa3d-headers package?
>
> The problem is that the headers installed by mesa differ from those
>
> in the OpenCL-Headers package.
>
> $ diff -q OpenCL-Headers/CL/cl_icd.h mesa/include/CL/cl_icd.h
> Files OpenCL-Headers/CL/cl_icd.h and mesa/include/CL/cl_icd.h differ
>
> This diff was performed using OpenCL-Headers v2023.12.14 and
>
> mesa-23.3.4. Moreover, cl_layer.h, cl_half.h and cl_function_types.h 
> files are
>
> missing from mesa headers. These differences causes errors when building
>
> opencl-icd-loader:
>
> ...
>
> ./build/opencl-icd-loader-2023.12.14/loader/icd.c:23:10: fatal error: 
> CL/cl_layer.h: No such file or directory
>
>    23 | #include <CL/cl_layer.h>
>
> | ^~~~~~~~~~~~~~~
>
> compilation terminated.
>
> ./build/opencl-icd-loader-2023.12.14/loader/icd_dispatch.c:26:8: 
> error: unknown type name ‘clGetICDLoaderInfoOCLICD_t’
>
>    26 | static clGetICDLoaderInfoOCLICD_t clGetICDLoaderInfoOCLICD;
>
> | ^~~~~~~~~~~~~~~~~~~~~~~~~~
>
> ...
>
> This is why we cannot rely on mesa3d headers and why OpenCL-Headers
>
> package is required.
>

Besides, mesa3d CL headers regroups headers from OpenCL-Headers

and OpenCL-CLHPP [1][2][3]. The opencl-clhpp package already exist.

It have been added in commit 2ae78f1c794c145486baf5c39703443207fead4c

[4] when adding clpeak. Indeed, clpeak was downloading opencl-clhpp

during the configuration phase [5].


It appears that nothing prevent conflicts between opencl-clhpp headers

and mesa3d headers (installed by mesa3d-headers and mesa3d packages).

Moreover, both files are different:

$ md5sum OpenCL-CLHPP/include/CL/opencl.hpp
784d2b2283d605b30ad6c663a08ff71f OpenCL-CLHPP/include/CL/opencl.hpp

$ md5sum mesa/include/CL/opencl.hpp
6afa428040ec96709fc009fe514ef750  mesa/include/CL/opencl.hpp

With opencl-clhpp v2.0.16 and mesa-23.3.5 (versions used in buildroot

when this mail is sent).


I will check if it is possible to rely on mesa3d headers. If it's 
possible I will

remove this package (only used by clpeak) and rely on mesa3d headers.

If it's not possible, i will add guards to prevent the conflict.


[1]: https://gitlab.freedesktop.org/mesa/mesa/-/tree/24.0/include/CL

[2]: https://github.com/KhronosGroup/OpenCL-Headers/tree/v2023.12.14/CL

[3]: 
https://github.com/KhronosGroup/OpenCL-CLHPP/tree/v2023.12.14/include/CL

[4]: 
http://patchwork.ozlabs.org/project/buildroot/patch/20220116175320.453041-1-gilles.talis@gmail.com/

[5]: 
http://patchwork.ozlabs.org/project/buildroot/patch/20211024113654.88720-1-gilles.talis@gmail.com/

>> Regards,
>> Yann E. MORIN.
>
> I will add guards to prevent conflicts in the v5. And add some lines
>
> in the commit log to explain why mesa3d headers can't be used to
>
> build OpenCL-ICD-Loader.
>
>
> Thanks for your feedback !
>
>
> [1]: 
> https://gitlab.freedesktop.org/mesa/mesa/-/blob/23.3/include/meson.build?ref_type=heads#L135
>
>
> Regards,
>
> Antoine Coutant
>
>>> +	help
>>> +	  C language headers for the OpenCL API
>>> +
>>> +	https://github.com/KhronosGroup/OpenCL-Headers
>>> diff --git a/package/opencl-headers/opencl-headers.hash b/package/opencl-headers/opencl-headers.hash
>>> new file mode 100644
>>> index 0000000000..802ed05450
>>> --- /dev/null
>>> +++ b/package/opencl-headers/opencl-headers.hash
>>> @@ -0,0 +1,3 @@
>>> +#Locally generated
>>> +sha256  407d5e109a70ec1b6cd3380ce357c21e3d3651a91caae6d0d8e1719c69a1791d  OpenCL-Headers-2023.12.14.tar.gz
>>> +sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
>>> diff --git a/package/opencl-headers/opencl-headers.mk b/package/opencl-headers/opencl-headers.mk
>>> new file mode 100644
>>> index 0000000000..7aa0e0d168
>>> --- /dev/null
>>> +++ b/package/opencl-headers/opencl-headers.mk
>>> @@ -0,0 +1,22 @@
>>> +################################################################################
>>> +#
>>> +# opencl-headers
>>> +#
>>> +################################################################################
>>> +
>>> +OPENCL_HEADERS_VERSION = 2023.12.14
>>> +OPENCL_HEADERS_SOURCE = OpenCL-Headers-$(OPENCL_HEADERS_VERSION).tar.gz
>>> +OPENCL_HEADERS_SITE = $(call github,KhronosGroup,OpenCL-Headers,v$(OPENCL_HEADERS_VERSION))
>>> +OPENCL_HEADERS_LICENSE = Apache-2.0
>>> +OPENCL_HEADERS_LICENSE_FILES = LICENSE
>>> +OPENCL_HEADERS_INSTALL_STAGING = YES
>>> +
>>> +OPENCL_HEADERS_INSTALL_TARGET = NO
>>> +
>>> +define OPENCL_HEADERS_INSTALL_STAGING_CMDS
>>> +	mkdir -p $(STAGING_DIR)/usr/include/CL
>>> +	$(INSTALL) -D -m 0644 $(@D)/CL/* \
>>> +		$(STAGING_DIR)/usr/include/CL
>>> +endef
>>> +
>>> +$(eval $(generic-package))
>>> -- 
>>> 2.25.1
>>>
>>> _______________________________________________
>>> buildroot mailing list
>>> buildroot@buildroot.org
>>> https://lists.buildroot.org/mailman/listinfo/buildroot
--------------gHYd0AvudXHwpGKOpRcLusKp
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
    <div class="moz-cite-prefix">On 12/02/2024 14:44, Antoine Coutant
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:a2e41a71-7b71-4807-9120-6c27d61b4e2c@smile.fr">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
          <pre class="moz-quote-pre" wrap="">From: Sebastian Weyer <a
          class="moz-txt-link-rfc2396E"
          href="mailto:sebastian.weyer@smile.fr" moz-do-not-send="true">&lt;sebastian.weyer@smile.fr&gt;</a>

These headers provide the C language API bindings. It is a complement to
the C++ bindings already available in opencl-clhpp. This package is
required to build opencl-icd-loader:

<a class="moz-txt-link-freetext"
href="https://github.com/KhronosGroup/OpenCL-ICD-Loader#dependencies"
          moz-do-not-send="true">https://github.com/KhronosGroup/OpenCL-ICD-Loader#dependencies</a>

Signed-off-by: Sebastian Weyer <a class="moz-txt-link-rfc2396E"
          href="mailto:sebastian.weyer@smile.fr" moz-do-not-send="true">&lt;sebastian.weyer@smile.fr&gt;</a>
Signed-off-by: Antoine Coutant <a class="moz-txt-link-rfc2396E"
          href="mailto:antoine.coutant@smile.fr" moz-do-not-send="true">&lt;antoine.coutant@smile.fr&gt;</a>
---
</pre>
        </blockquote>
      </blockquote>
    </blockquote>
    <br>
    <pre class="moz-quote-pre" wrap=""><span
    style="white-space: pre-wrap">[--SNIP--]</span></pre>
    <blockquote type="cite"
      cite="mid:a2e41a71-7b71-4807-9120-6c27d61b4e2c@smile.fr">
      <blockquote type="cite" cite="mid:ZcOow6Wd11qTf8Qs@landeda">
        <pre class="moz-quote-pre" wrap="">So, why do we need opencl-headers and can't rely on the existing
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
style="color: rgb(0, 0, 0); background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">package is required.</span></p>
    </blockquote>
    <p><br>
    </p>
    <p>Besides, mesa3d CL headers regroups headers from OpenCL-Headers</p>
    <p>and OpenCL-CLHPP [1][2][3]. The opencl-clhpp package already
      exist.</p>
    <p>It have been added in commit
      2ae78f1c794c145486baf5c39703443207fead4c</p>
    <p>[4] when adding clpeak. Indeed, clpeak was downloading
      opencl-clhpp</p>
    <p>during the configuration phase [5].</p>
    <p><br>
    </p>
    <p>It appears that nothing prevent conflicts between opencl-clhpp
      headers</p>
    <p>and mesa3d headers (installed by mesa3d-headers and mesa3d
      packages).</p>
    <p>Moreover, both files are different:</p>
    <p>$ md5sum OpenCL-CLHPP/include/CL/opencl.hpp <br>
      784d2b2283d605b30ad6c663a08ff71f 
      OpenCL-CLHPP/include/CL/opencl.hpp</p>
    <p>$ md5sum mesa/include/CL/opencl.hpp <br>
      6afa428040ec96709fc009fe514ef750  mesa/include/CL/opencl.hpp<br>
    </p>
    <p>With opencl-clhpp v2.0.16 and mesa-23.3.5 (versions used in
      buildroot</p>
    <p>when this mail is sent).</p>
    <p><br>
    </p>
    <p>I will check if it is possible to rely on mesa3d headers. If it's
      possible I will</p>
    <p>remove this package (only used by clpeak) and rely on mesa3d
      headers.</p>
    <p>If it's not possible, i will add guards to prevent the conflict.<br>
    </p>
    <p><br>
    </p>
    <p>[1]:
      <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/mesa/mesa/-/tree/24.0/include/CL">https://gitlab.freedesktop.org/mesa/mesa/-/tree/24.0/include/CL</a></p>
    <p>[2]:
      <a class="moz-txt-link-freetext" href="https://github.com/KhronosGroup/OpenCL-Headers/tree/v2023.12.14/CL">https://github.com/KhronosGroup/OpenCL-Headers/tree/v2023.12.14/CL</a><br>
    </p>
    <p>[3]:
      <a class="moz-txt-link-freetext" href="https://github.com/KhronosGroup/OpenCL-CLHPP/tree/v2023.12.14/include/CL">https://github.com/KhronosGroup/OpenCL-CLHPP/tree/v2023.12.14/include/CL</a></p>
    <p>[4]:
<a class="moz-txt-link-freetext" href="http://patchwork.ozlabs.org/project/buildroot/patch/20220116175320.453041-1-gilles.talis@gmail.com/">http://patchwork.ozlabs.org/project/buildroot/patch/20220116175320.453041-1-gilles.talis@gmail.com/</a></p>
    <p>[5]:
<a class="moz-txt-link-freetext" href="http://patchwork.ozlabs.org/project/buildroot/patch/20211024113654.88720-1-gilles.talis@gmail.com/">http://patchwork.ozlabs.org/project/buildroot/patch/20211024113654.88720-1-gilles.talis@gmail.com/</a><br>
    </p>
    <blockquote type="cite"
      cite="mid:a2e41a71-7b71-4807-9120-6c27d61b4e2c@smile.fr">
      <p><span
style="font-family: Arial, sans-serif; color: rgb(0, 0, 0); background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
</span></p>
      <blockquote type="cite" cite="mid:ZcOow6Wd11qTf8Qs@landeda">
        <pre class="moz-quote-pre" wrap="">Regards,
Yann E. MORIN.</pre>
      </blockquote>
      <p>I will add guards to prevent conflicts in the v5. And add some
        lines</p>
      <p>in the commit log to explain why mesa3d headers can't be used
        to</p>
      <p>build OpenCL-ICD-Loader.</p>
      <p><br>
      </p>
      <p>Thanks for your feedback !</p>
      <p><br>
      </p>
      <p>[1]:
        <a class="moz-txt-link-freetext"
href="https://gitlab.freedesktop.org/mesa/mesa/-/blob/23.3/include/meson.build?ref_type=heads#L135"
          moz-do-not-send="true">https://gitlab.freedesktop.org/mesa/mesa/-/blob/23.3/include/meson.build?ref_type=heads#L135</a></p>
      <p><br>
      </p>
      <p>Regards,</p>
      <p>Antoine Coutant<br>
      </p>
      <blockquote type="cite" cite="mid:ZcOow6Wd11qTf8Qs@landeda">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">+	help
+	  C language headers for the OpenCL API
+
+	  <a class="moz-txt-link-freetext"
          href="https://github.com/KhronosGroup/OpenCL-Headers"
          moz-do-not-send="true">https://github.com/KhronosGroup/OpenCL-Headers</a>
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
<a class="moz-txt-link-abbreviated moz-txt-link-freetext"
          href="mailto:buildroot@buildroot.org" moz-do-not-send="true">buildroot@buildroot.org</a>
<a class="moz-txt-link-freetext"
          href="https://lists.buildroot.org/mailman/listinfo/buildroot"
          moz-do-not-send="true">https://lists.buildroot.org/mailman/listinfo/buildroot</a>
</pre>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------gHYd0AvudXHwpGKOpRcLusKp--

--===============4283951866827660059==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4283951866827660059==--
