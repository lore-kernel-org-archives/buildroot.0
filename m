Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A758C48BC3
	for <buildroot@archiver.kernel.org>; Wed, 21 Feb 2024 13:26:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17339417B0;
	Wed, 21 Feb 2024 13:26:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ci5kf4tmrjtr; Wed, 21 Feb 2024 13:26:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A841406EA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A841406EA;
	Wed, 21 Feb 2024 13:26:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 68D451BF8B4
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 13:26:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 632C7606C7
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 13:26:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4JzLv6dtCsIy for <buildroot@lists.busybox.net>;
 Wed, 21 Feb 2024 13:26:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=antoine.coutant@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 64C1F606BF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64C1F606BF
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 64C1F606BF
 for <buildroot@buildroot.org>; Wed, 21 Feb 2024 13:26:15 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-33d2710f3acso3091041f8f.0
 for <buildroot@buildroot.org>; Wed, 21 Feb 2024 05:26:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708521973; x=1709126773;
 h=in-reply-to:content-language:references:cc:to:from:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ju19MBrSfz9zjl0ntLswO7M1blI510gvLBgTrnF6Y40=;
 b=flP+keq6L0D5f8g644gECh4Dn/r/FjokV5DhR7cSnV7WDaZtSLQ0DjA+Uqa8j11AQj
 4ydnGjHyypC4isBkO3leyaUSsAK2g4qWwZPxLngz5n+lDiZ2jV2gW4DMgC9KISaHmuCS
 s4Bib28NqPNvpCGPnNUa0M+6W618OJDVltDQg0r4UqRH/ou6yNgJhftsoVz4b4IGnucK
 n7xpMG/ybZif2bgMgu/cT2/T27sboQ+50oDL2t+rdN5BskfVtc1zcdALgDswkdJ4u49A
 8ukGuco1gScjYvvJBHVkq5ioFzad42L7Y/hzUObbXgSDVSou8WvcirxoBjZZxhvx6CKe
 QO6g==
X-Gm-Message-State: AOJu0YyOnCgW5rdQZeepO8lBnn3tSU8FN0TkHw7RzkkG9WXoziO+mze6
 kAs6Br6wLSem1CfO1CcZ8iTCZZe3ZEvnlCXk4yr5dC6p+l/jz3hOCvyYFo5W8T4=
X-Google-Smtp-Source: AGHT+IHwPVJEpHogk0f6p00Q2c2ynycmrHD92XcqnEK+cRj8W+Wy4a+p0TBlBB4jQbib9TrbzmXsfQ==
X-Received: by 2002:a05:6000:1f0e:b0:33d:26bf:6a38 with SMTP id
 bv14-20020a0560001f0e00b0033d26bf6a38mr4876410wrb.15.1708521973063; 
 Wed, 21 Feb 2024 05:26:13 -0800 (PST)
Received: from [10.5.0.40] (202-122-190-109.dsl.ovh.fr. [109.190.122.202])
 by smtp.gmail.com with ESMTPSA id
 q4-20020a5d5744000000b0033b47ee01f1sm16931247wrw.49.2024.02.21.05.26.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Feb 2024 05:26:12 -0800 (PST)
Message-ID: <f0c701bc-24fd-4043-91ba-9950ea885b24@smile.fr>
Date: Wed, 21 Feb 2024 14:26:10 +0100
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
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1708521973; x=1709126773;
 darn=buildroot.org; 
 h=in-reply-to:content-language:references:cc:to:from:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ju19MBrSfz9zjl0ntLswO7M1blI510gvLBgTrnF6Y40=;
 b=HiJIcu8e/75tyYIi7wfmrEkPL6thzuU8vKN/WaJ2oONetbv5xPJWba1N3FtT5u7+Qe
 LYjkgrI/R9aOorW1zJm1FZPw4u16RbEmeKv+AqBL1cEHiM3XqEeslix1nKKz6QCg8wNI
 Am2xQ2UZ6LdrPktRBkIvjPt23fn8V9YAjH708RaoI4cuD1vNQZPmfwWJByJ2DVlvXn3C
 7i3w0ioDD0Dp7aw165fybaJ/7kIiZ/tMkmkSowrnfr9i50Oy448tRGWxmZjukivyrfvh
 q8b+ZeNfBRJqyreRUMpO91LQjqTNvbTNabSJa35H37fl2mMhDt3vY+I9d9UC9ccdmqfg
 0aIA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=HiJIcu8e
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
Content-Type: multipart/mixed; boundary="===============1250369196669806843=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.
--===============1250369196669806843==
Content-Type: multipart/alternative;
 boundary="------------VXSrDZNGqhEs8ywJL6P0uiC0"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------VXSrDZNGqhEs8ywJL6P0uiC0
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
>> [--SNIP--]
>>> diff --git a/package/opencl-headers/Config.in b/package/opencl-headers/Config.in
>>> new file mode 100644
>>> index 0000000000..092d8a2a4d
>>> --- /dev/null
>>> +++ b/package/opencl-headers/Config.in
>>> @@ -0,0 +1,7 @@
>>> +config BR2_PACKAGE_OPENCL_HEADERS
>>> +	bool "opencl-headers"
>>> +	depends on BR2_PACKAGE_HAS_LIBOPENCL
>> BR2_PACKAGE_HAS_LIBOPENCL can be set by mesa3d when BR2_PACKAGE_MESA3D_OPENCL
>> is enabled. In this case, will mesa3d install its own headers? If so,
>> that will generate a conflict.
>
> BR2_PACKAGE_HAS_LIBOPENCL doesn't guarantee that CL headers
>
> will be installed. Mesa3d install headers if Clover is enabled and
>
> opencl-icd is disabled [1]. So you are right, it will generate conflict in
>
> case OpenCL-Headers and Clover are built without icd mode.
>
>> Furthermore, this will also conflict with mesa3d-headers, and it also
>> installs CL headers.
> Yes, this will generate the same conflict here...


Besides, the Mesa build system does not install headers if icd option

is enabled. I think the reason is that OpenCL-ICD-Loader explicitly

depends on OpenCL-Headers [1]. Thus, mesa lets users install the

headers that match opencl-icd-loader version.


Mesa build system is designed to not install CL headers when they

are installed by ICD Loader. However, Buildroot package

mesa3d-headers does not check this condition and install CL headers

as soon as libopencl is present. Thus, I think that I will add a

dependency to prevent mesa3d-headers from installing headers when

OpenCL-Headers package is selected.


[1]: 
https://github.com/KhronosGroup/OpenCL-ICD-Loader?tab=readme-ov-file#dependencies


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
--------------VXSrDZNGqhEs8ywJL6P0uiC0
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
        <pre class="moz-quote-pre" wrap="">BR2_PACKAGE_HAS_LIBOPENCL can be set by mesa3d when BR2_PACKAGE_MESA3D_OPENCL
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
    </blockquote>
    <p><br>
    </p>
    <p>Besides, the Mesa build system does not install headers if icd
      option</p>
    <p>is enabled. I think the reason is that OpenCL-ICD-Loader
      explicitly</p>
    <p>depends on OpenCL-Headers [1]. Thus, mesa lets users install the</p>
    <p>headers that match opencl-icd-loader version.<br>
    </p>
    <p><br>
    </p>
    <p>Mesa build system is designed to not install CL headers when they</p>
    <p>are installed by ICD Loader. However, Buildroot package</p>
    <p>mesa3d-headers does not check this condition and install CL
      headers</p>
    <p>as soon as libopencl is present. Thus, I think that I will add a</p>
    <p>dependency to prevent mesa3d-headers from installing headers when</p>
    <p>OpenCL-Headers package is selected.<br>
    </p>
    <p><br>
    </p>
    <p>[1]:
<a class="moz-txt-link-freetext" href="https://github.com/KhronosGroup/OpenCL-ICD-Loader?tab=readme-ov-file#dependencies">https://github.com/KhronosGroup/OpenCL-ICD-Loader?tab=readme-ov-file#dependencies</a><br>
    </p>
    <p><br>
    </p>
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
style="color: rgb(0, 0, 0); background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">package is required.</span><span
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
      <p>Antoine Coutant</p>
    </blockquote>
  </body>
</html>

--------------VXSrDZNGqhEs8ywJL6P0uiC0--

--===============1250369196669806843==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1250369196669806843==--
