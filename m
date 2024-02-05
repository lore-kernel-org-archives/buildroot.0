Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 466C5C48291
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 09:36:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA06360F03;
	Mon,  5 Feb 2024 09:36:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA06360F03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 20a6JA3vyzgl; Mon,  5 Feb 2024 09:36:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E67860E7B;
	Mon,  5 Feb 2024 09:36:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E67860E7B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2994A1BF40B
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 09:36:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F23B60E7B
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 09:36:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F23B60E7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cE4FXeJXmP14 for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 09:36:49 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 29A5560792
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 09:36:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29A5560792
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40fb63c40c0so37313695e9.2
 for <buildroot@buildroot.org>; Mon, 05 Feb 2024 01:36:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707125806; x=1707730606;
 h=in-reply-to:from:references:to:content-language:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Ayifuh0zxbW1G+S+cPO2E8b7SpJf+noPKnH6/Kqx9JA=;
 b=ll8o80Ifs5MFyP9nPmXzliwcDNssdA/Vj6uG7WQFvPQ6pnUqXH5UdM7bJoOqZoUlgZ
 waJ9CBoyVviU5PDPDimPN/WHaoS+fE1O2ZifM5tbFleJkCPihX436ivSbnLGYxrKne5i
 29FIJklbn8kvAi5A4m2Hu2yC5msB0MxeZtHbVF2kSSdruVZuyG1x2Ukldo5RQbf1WiNA
 Y/HhsyU9aRvp38qQRKxLC1Y5f5j9eDva2Hve3J8gqVM6AOXKidPiDkXkuLt+25paWv2d
 KimTupz3fdQorom69wLC6p730L5ENm5XiMo/hCQzb0OiUtv/z3RwUvvmBnD/s90r8wos
 6l0w==
X-Gm-Message-State: AOJu0Yzaw+r+mSbS/tf9zvn+19DpP8QwQR8FnFEFgotdynyn6W5448G4
 i4MKZkwvhYk5e65Dej2KlMyllbhYmsV+ntuesS+DY3YPfuiDJ/IxOo5TMdkok+rSsly5pBi9mYK
 9
X-Google-Smtp-Source: AGHT+IHku+VspoVcu1QHI2Jb6wi9i7iksJAs8W7Ayy5sOVPW1vlukxtFk0PFnrnzcSoMuRo2pE7aDA==
X-Received: by 2002:a05:600c:35cd:b0:40e:490f:3f31 with SMTP id
 r13-20020a05600c35cd00b0040e490f3f31mr4558597wmq.35.1707125806430; 
 Mon, 05 Feb 2024 01:36:46 -0800 (PST)
Received: from [192.168.68.114] (lfbn-nan-1-1117-126.w90-12.abo.wanadoo.fr.
 [90.12.67.126]) by smtp.gmail.com with ESMTPSA id
 l30-20020a05600c1d1e00b0040e541ddcb1sm8014801wms.33.2024.02.05.01.36.46
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 01:36:46 -0800 (PST)
Message-ID: <73fc1bce-0fd8-4799-994f-6299dda87f70@smile.fr>
Date: Mon, 5 Feb 2024 10:36:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: buildroot@buildroot.org
References: <cover.1707060159.git.yann.morin.1998@free.fr>
 <a72d15ae3beda3fbdd4fb1be78ddcdf5023219ee.1707060159.git.yann.morin.1998@free.fr>
From: Antoine Coutant <antoine.coutant@smile.fr>
In-Reply-To: <a72d15ae3beda3fbdd4fb1be78ddcdf5023219ee.1707060159.git.yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707125806; x=1707730606;
 darn=buildroot.org; 
 h=in-reply-to:from:references:to:content-language:subject:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ayifuh0zxbW1G+S+cPO2E8b7SpJf+noPKnH6/Kqx9JA=;
 b=Y/3IN30wUxyW3Rz7XqvEz7J8lBo+wSF51YMhHQVU0NWjPplV24PT77Axx0tgh29KrK
 qvR80NdZlPKlxQaEZDYQsA5vxuTZUHnjFnrkN2FewPijf1/Rokqb0+cNOEd0qKzfT9TU
 eFnpYe7n/18FN0gYlAWt9/KUtSbb68qRwdcF7LtK2h4BZ3H0ocejJ+CI+KU2f1H6s+Yy
 qrmdVQmoYam40UJYvYonmBMEqbMbePvgvhDxvB51qxikpupKWVw2L43Fm3HFEyWz1lOs
 AT1aPe4gbPFJOJM8qkwiP1oMO4k+pkXiltsZHxo/KOBcNZGqU6FbIXpPnHYhU1V+QjOh
 oh7w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=Y/3IN30w
Subject: Re: [Buildroot] [PATCH 2/4] package/libcurl: drop
 LIBCURL_CPE_ID_PRODUCT
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
Content-Type: multipart/mixed; boundary="===============8902961752365457787=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.
--===============8902961752365457787==
Content-Type: multipart/alternative;
 boundary="------------jqIEaeeDYkWuB009qMdKXuyH"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------jqIEaeeDYkWuB009qMdKXuyH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 04/02/2024 16:22, Yann E. MORIN wrote:
> From: Fabrice Fontaine<fontaine.fabrice@gmail.com>
>
> Commit 4b6202f721f2f5ab36153ba44de65286f7811ef9 set
> LIBCURL_CPE_ID_PRODUCT to libcurl but this is not needed as
> LIBCURL_CPE_ID_PRODUCT will be set to the package name
> (i.e. libcurl) by default
>
> Signed-off-by: Fabrice Fontaine<fontaine.fabrice@gmail.com>
> Signed-off-by: Yann E. MORIN<yann.morin.1998@free.fr>
> ---
>   package/libcurl/libcurl.mk | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
> index 3ecc587a52..83845b8e87 100644
> --- a/package/libcurl/libcurl.mk
> +++ b/package/libcurl/libcurl.mk
> @@ -13,7 +13,6 @@ LIBCURL_DEPENDENCIES = host-pkgconf \
>   LIBCURL_LICENSE = curl
>   LIBCURL_LICENSE_FILES = COPYING
>   LIBCURL_CPE_ID_VENDOR = haxx
> -LIBCURL_CPE_ID_PRODUCT = libcurl
>   LIBCURL_INSTALL_STAGING = YES
>   
>   # We disable NTLM delegation to winbinds ntlm_auth ('--disable-ntlm-wb')

Looks good to me.


Reviewed-by: Antoine Coutant <antoine.coutant@smile.fr> 
<mailto:antoine.coutant@smile.fr>


Regards,

Antoine Coutant.

--------------jqIEaeeDYkWuB009qMdKXuyH
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
    <div class="moz-cite-prefix">On 04/02/2024 16:22, Yann E. MORIN
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:a72d15ae3beda3fbdd4fb1be78ddcdf5023219ee.1707060159.git.yann.morin.1998@free.fr">
      <pre class="moz-quote-pre" wrap="">From: Fabrice Fontaine <a class="moz-txt-link-rfc2396E" href="mailto:fontaine.fabrice@gmail.com">&lt;fontaine.fabrice@gmail.com&gt;</a>

Commit 4b6202f721f2f5ab36153ba44de65286f7811ef9 set
LIBCURL_CPE_ID_PRODUCT to libcurl but this is not needed as
LIBCURL_CPE_ID_PRODUCT will be set to the package name
(i.e. libcurl) by default

Signed-off-by: Fabrice Fontaine <a class="moz-txt-link-rfc2396E" href="mailto:fontaine.fabrice@gmail.com">&lt;fontaine.fabrice@gmail.com&gt;</a>
Signed-off-by: Yann E. MORIN <a class="moz-txt-link-rfc2396E" href="mailto:yann.morin.1998@free.fr">&lt;yann.morin.1998@free.fr&gt;</a>
---
 package/libcurl/libcurl.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 3ecc587a52..83845b8e87 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -13,7 +13,6 @@ LIBCURL_DEPENDENCIES = host-pkgconf \
 LIBCURL_LICENSE = curl
 LIBCURL_LICENSE_FILES = COPYING
 LIBCURL_CPE_ID_VENDOR = haxx
-LIBCURL_CPE_ID_PRODUCT = libcurl
 LIBCURL_INSTALL_STAGING = YES
 
 # We disable NTLM delegation to winbinds ntlm_auth ('--disable-ntlm-wb')
</pre>
    </blockquote>
    <p>Looks good to me.</p>
    <p><span><span class="il"><br>
        </span></span></p>
    <p><span><span class="il">Reviewed</span></span>-<span><span
          class="il">by</span></span>: <span class="il">Antoine</span>
      <span class="il">Coutant</span> <a
        href="mailto:antoine.coutant@smile.fr" target="_blank">&lt;<span
          class="il">antoine</span>.<span class="il">coutant</span>@smile.fr&gt;</a></p>
    <p><br>
    </p>
    <p>Regards,</p>
    <p><span class="il">Antoine</span> <span class="il">Coutant</span>.</p>
  </body>
</html>

--------------jqIEaeeDYkWuB009qMdKXuyH--

--===============8902961752365457787==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8902961752365457787==--
