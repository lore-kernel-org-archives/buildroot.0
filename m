Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7102C46CD2
	for <buildroot@archiver.kernel.org>; Wed, 24 Jan 2024 16:54:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B49760E19;
	Wed, 24 Jan 2024 16:54:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B49760E19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZXgtOeqy7PCP; Wed, 24 Jan 2024 16:54:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94C6D60D90;
	Wed, 24 Jan 2024 16:54:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94C6D60D90
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 132511BF3DA
 for <buildroot@lists.busybox.net>; Wed, 24 Jan 2024 16:54:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E096860D90
 for <buildroot@lists.busybox.net>; Wed, 24 Jan 2024 16:54:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E096860D90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AIWD91XebSl9 for <buildroot@lists.busybox.net>;
 Wed, 24 Jan 2024 16:54:22 +0000 (UTC)
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DD71560ACC
 for <buildroot@buildroot.org>; Wed, 24 Jan 2024 16:54:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD71560ACC
Received: by mail-wm1-x343.google.com with SMTP id
 5b1f17b1804b1-40e76626170so62947105e9.2
 for <buildroot@buildroot.org>; Wed, 24 Jan 2024 08:54:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706115260; x=1706720060;
 h=in-reply-to:from:references:to:content-language:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=7UU4xoPv8tQw/YUvbYcAd1Gxh3OF7wt8UswvtmNS9eQ=;
 b=jz2rxg6Yd4LozGw7etxqmXPW+9TEgHWDDtITkORPvrKKLGXXI/vZvMkFIpd2yyyGLA
 MPLzl6r33tD+u3MYsBIspPLxuu4vzv2JRqfUJBvA3+RvxIBIAEIZAbtn7lmFCW6UNXeb
 kTuT4xOWQVWIVM/WAZuXGHZYXVh7Fpcvzk7R1JlXFXP3+n/s/1t8ooj8g7Emt7R3T4hk
 REU4A/YJEYP332en70TutjVpXWGsyl25VsYqVVzauVDwpEhSjARWFxjtjwt3ZBPAsVpp
 pm1cKI3ckK5Hd93toLGkLw35/XHiZxYF+iwJWpp303H5bvbdxq0jGJEfe+MRSbd0x0z9
 mRww==
X-Gm-Message-State: AOJu0YxwZ4HIY/6XlqX5dGBtetNEhkxWwDmeAqvkDfpX9LF3MmBzagjh
 UBdbngfH6KDRSeUYPlRo5UnfsPdvuydokSmLIQHhWuYgzKyfTH+Opnxe49zy0aYdIKEfMKd+p6x
 HXKiKVg==
X-Google-Smtp-Source: AGHT+IFZEHOHk+1plvX6bv5WIZ/gMLdDTbxVg0jNI6VkHs4Fn38bU2nqBJw5p14jNgyqkP8qKvcSjA==
X-Received: by 2002:a05:600c:1f08:b0:40e:b30a:8756 with SMTP id
 bd8-20020a05600c1f0800b0040eb30a8756mr1264316wmb.105.1706115259877; 
 Wed, 24 Jan 2024 08:54:19 -0800 (PST)
Received: from [10.5.0.39] ([80.215.186.133]) by smtp.gmail.com with ESMTPSA id
 fj3-20020a05600c0c8300b0040d81ca11casm220696wmb.28.2024.01.24.08.54.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jan 2024 08:54:19 -0800 (PST)
Message-ID: <a5dc986e-c3fa-41f2-8514-c0ae6abc62b0@smile.fr>
Date: Wed, 24 Jan 2024 17:54:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
References: <20240117164851.384033-1-romain.naour@smile.fr>
From: Antoine Coutant <antoine.coutant@smile.fr>
In-Reply-To: <20240117164851.384033-1-romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1706115260; x=1706720060;
 darn=buildroot.org; 
 h=in-reply-to:from:references:to:content-language:subject:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7UU4xoPv8tQw/YUvbYcAd1Gxh3OF7wt8UswvtmNS9eQ=;
 b=ZqYdKE87BCQRzEiqWXnhh2MC7umcmni5lmPkiVyD6bKWvJYGCaXrTCwRqjn6OLDfRH
 69cvzrs/W2mvWlluGyasYiz0OyjEnwUk5SByJg4Qk8DSsagvtqylP+K+HI2hd+gCj8IA
 gogyiO+a2lDZRKdYbKcUIxifK6DqoniI3yUy+qbn+ZpeCjhRFa2eisy3WqhnhDa9mElV
 ZdUEUb0k4uAw6WNy0WzmC27ak864QNLsCER0Z0hvViZh7pdu4a6kS5zAYd6w7Fr/dtGN
 0Tw9ne98BokwHqKuXMCUoPKtkU88mWobHwxsS98e9ancZL6kUXbJU9atrD9VnPCh1N9l
 58Pg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=ZqYdKE87
Subject: Re: [Buildroot] [PATCH] support/testing: TestPythonPy3SciPy:
 increase rootfs size to 250M
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
Content-Type: multipart/mixed; boundary="===============2193197438351918401=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.
--===============2193197438351918401==
Content-Type: multipart/alternative;
 boundary="------------fIs8BOCDhDTkZqDayK8Utdqu"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------fIs8BOCDhDTkZqDayK8Utdqu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 17/01/2024 17:48, Romain Naour wrote:
> The rootfs generated TestPythonPy3SciPy by doesn't fit anymore in 120M.
>
> Increase the rootfs size to 250M and checking the amount of space
> available on the file system.
>
>    Filesystem                Size      Used Available Use% Mounted on
>    /dev/root               232.3M    134.5M     85.3M  61% /
>
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/5880448601
>
> Signed-off-by: Romain Naour<romain.naour@smile.fr>
> ---
>   support/testing/tests/package/test_python_scipy.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/support/testing/tests/package/test_python_scipy.py b/support/testing/tests/package/test_python_scipy.py
> index 06297763c3..fb51f25d79 100644
> --- a/support/testing/tests/package/test_python_scipy.py
> +++ b/support/testing/tests/package/test_python_scipy.py
> @@ -10,7 +10,7 @@ class TestPythonPy3SciPy(TestPythonPackageBase):
>           BR2_PACKAGE_PYTHON3=y
>           BR2_PACKAGE_PYTHON_SCIPY=y
>           BR2_TARGET_ROOTFS_EXT2=y
> -        BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
> +        BR2_TARGET_ROOTFS_EXT2_SIZE="250M"
>           # BR2_TARGET_ROOTFS_TAR is not set
>           """
>       sample_scripts = ["tests/package/sample_python_scipy.py"]

Reviewed-by: Antoine Coutant <antoine.coutant@smile.fr>


Regards,

Antoine Coutant.

--------------fIs8BOCDhDTkZqDayK8Utdqu
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 17/01/2024 17:48, Romain Naour
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20240117164851.384033-1-romain.naour@smile.fr">
      <pre class="moz-quote-pre" wrap="">The rootfs generated TestPythonPy3SciPy by doesn't fit anymore in 120M.

Increase the rootfs size to 250M and checking the amount of space
available on the file system.

  Filesystem                Size      Used Available Use% Mounted on
  /dev/root               232.3M    134.5M     85.3M  61% /

Fixes:
<a class="moz-txt-link-freetext" href="https://gitlab.com/buildroot.org/buildroot/-/jobs/5880448601">https://gitlab.com/buildroot.org/buildroot/-/jobs/5880448601</a>

Signed-off-by: Romain Naour <a class="moz-txt-link-rfc2396E" href="mailto:romain.naour@smile.fr">&lt;romain.naour@smile.fr&gt;</a>
---
 support/testing/tests/package/test_python_scipy.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_python_scipy.py b/support/testing/tests/package/test_python_scipy.py
index 06297763c3..fb51f25d79 100644
--- a/support/testing/tests/package/test_python_scipy.py
+++ b/support/testing/tests/package/test_python_scipy.py
@@ -10,7 +10,7 @@ class TestPythonPy3SciPy(TestPythonPackageBase):
         BR2_PACKAGE_PYTHON3=y
         BR2_PACKAGE_PYTHON_SCIPY=y
         BR2_TARGET_ROOTFS_EXT2=y
-        BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+        BR2_TARGET_ROOTFS_EXT2_SIZE="250M"
         # BR2_TARGET_ROOTFS_TAR is not set
         """
     sample_scripts = ["tests/package/sample_python_scipy.py"]
</pre>
    </blockquote>
    <br>
    <p><span class="il">Reviewed</span>-<span class="il">by</span>:
      Antoine Coutant <a class="moz-txt-link-rfc2396E" href="mailto:antoine.coutant@smile.fr">&lt;antoine.coutant@smile.fr&gt;</a></p>
    <p><br>
    </p>
    <p>Regards,</p>
    <p>Antoine Coutant.</p>
  </body>
</html>

--------------fIs8BOCDhDTkZqDayK8Utdqu--

--===============2193197438351918401==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2193197438351918401==--
