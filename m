Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE36C3F6B0
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 17:57:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72C71823F6;
	Mon,  1 Aug 2022 17:57:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72C71823F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T2L0PkDlCL1E; Mon,  1 Aug 2022 17:57:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB703827CE;
	Mon,  1 Aug 2022 17:57:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB703827CE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 355271BF33D
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 17:56:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E7E24094E
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 17:56:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E7E24094E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5bSOQqJjaWYe for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 17:56:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E83AC40940
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E83AC40940
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 17:56:57 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id f5so8940639eje.3
 for <buildroot@buildroot.org>; Mon, 01 Aug 2022 10:56:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=e8W6wLwxtrzRSr2WDefAD+VOjL048EFOXmIFvji5W8s=;
 b=utk2esLBBhjkh+mpvzux2K8nN1N3tk3Thkxxmt/QwBmFhJQSd7y5iS0zsYJQggkxeV
 cw4E61V8cjAyHCaO0UyhHxg1QidmIxyJC2ih304XR7uXJyZdpNK8hJKBao5q4CeWVE5N
 1RZ6fP/wnLrE9YS3BklhAo5/+ahaLdH9BfTMx4M3rBNOdAofFJDf+c4OLmhuzkOZcNxt
 mu0u+fVkTpqH4c4aKhuGaqmKX98fSLMofHdIi3PS6XW7PA7O0pJ9S9CkeuAi0M38twJj
 2gi3fn2swi4XLMhOIAUZKtbsTVflaZqagfiiT6w8mYmH+vzgJfGU3rUwoqBGVQ+XJnhv
 NHow==
X-Gm-Message-State: AJIora/V/SVedjq2kn9N8PDNcR95urRlr4BNEZS1rtw0aWY8qX6SV6Rk
 ITFrnMVkS3PWrrJlcGwFfBXG4qzowjDlOA==
X-Google-Smtp-Source: AGRyM1ubLv/ZteRMv+9tEn95DUx1PUQHMvnEM77A6iLPjPa+KRw6QFukl4m+ZAMSNiucqKR6i0+rTA==
X-Received: by 2002:a17:907:2894:b0:72b:3554:353d with SMTP id
 em20-20020a170907289400b0072b3554353dmr13624043ejc.297.1659376615966; 
 Mon, 01 Aug 2022 10:56:55 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 f7-20020a056402068700b0043adc6552d6sm7091075edy.20.2022.08.01.10.56.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Aug 2022 10:56:55 -0700 (PDT)
Message-ID: <31fb8cf8-02e4-8bc6-a7b9-c6f9cd0845bc@mind.be>
Date: Mon, 1 Aug 2022 19:56:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20220731111240.12145-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220731111240.12145-1-bernd.kuhls@t-online.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=e8W6wLwxtrzRSr2WDefAD+VOjL048EFOXmIFvji5W8s=;
 b=ckuJg+ZardSSI6HswMWxgUkenCS0zY3AReb8nE4DCnHDSI1qW6pT0koA8S/e4FlIBw
 0shea5iJasIZlDUz2fmABhDd49EveDKgCyE2862AYI952dXWTDv2tXzX1nRwwkcsGXnv
 kQ3jjfc31Yu6n/buq2UiUZ2O84Dj+Bd2o0v1k23OJQgFhurMPalLyWYo+8mLNR2TOL0z
 gqlQqG/PNvSP94b9YxKRc3JQPHfSnvr2zQWoYTqjOkgI1imM8oCY+yvgBvTlNqv63LdU
 LeJqxHrq/Sit8TPYkCHxJmsYqyBgWu+Dsa9EVnD9r1rCRpGKlC0XXFtp2zgW4GROKIvr
 pHEQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ckuJg+Za
Subject: Re: [Buildroot] [PATCH 1/1] package/apache: ignore various CVEs
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 31/07/2022 13:12, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>   package/apache/apache.mk | 27 +++++++++++++++++++++++++++
>   1 file changed, 27 insertions(+)
> 
> diff --git a/package/apache/apache.mk b/package/apache/apache.mk
> index 315282baac..e199194e84 100644
> --- a/package/apache/apache.mk
> +++ b/package/apache/apache.mk
> @@ -11,6 +11,33 @@ APACHE_LICENSE = Apache-2.0
>   APACHE_LICENSE_FILES = LICENSE
>   APACHE_CPE_ID_VENDOR = apache
>   APACHE_CPE_ID_PRODUCT = http_server
> +# only Windows affected
> +APACHE_IGNORE_CVES += CVE-1999-0289
> +# only Debian affected
> +APACHE_IGNORE_CVES += CVE-1999-0678
> +# unrelated to Linux
> +APACHE_IGNORE_CVES += CVE-1999-1412
> +# disputed CVE

  That's a bit a weak reason, but OK.

> +APACHE_IGNORE_CVES += CVE-2007-0086
> +# unrelated to Apache
> +APACHE_IGNORE_CVES += CVE-2007-0450
> +# fixed in version 2.2.5

  Then why do we need to exclude it? Is there something wrong with the CVE's CPE 
information? Or with our own CPE information? Or with our cpedb script?

  There should be no need to have exclusions for CVEs that are fixed in a 
version <= the current one - unless it re-surfaced in a newer version.

  Regards,
  Arnout

> +APACHE_IGNORE_CVES += CVE-2007-4465 CVE-2008-2168
> +# fixed in version 2.2.7
> +APACHE_IGNORE_CVES += CVE-2007-5000 CVE-2007-6420 CVE-2007-6420 \
> +	CVE-2007-6421 CVE-2007-6422 CVE-2007-6423 CVE-2008-0455
> +# fixed in version 2.2.10
> +APACHE_IGNORE_CVES += CVE-2008-2939
> +# fixed in version 2.2.12
> +APACHE_IGNORE_CVES += CVE-2009-1195 CVE-2009-1890 CVE-2009-1891
> +# fixed in version 2.2.14
> +APACHE_IGNORE_CVES += CVE-2009-2699
> +# fixed in version 2.2.15
> +APACHE_IGNORE_CVES += CVE-2010-0408 CVE-2010-0425 CVE-2010-0434
> +# fixed in version 2.2.16
> +APACHE_IGNORE_CVES += CVE-2010-1452
> +# fixed in version 2.4.10
> +APACHE_IGNORE_CVES += CVE-2014-0231
>   APACHE_SELINUX_MODULES = apache
>   # Needed for mod_php
>   APACHE_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
