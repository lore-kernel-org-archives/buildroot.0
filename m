Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7CA2C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 15:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 877F6405D3;
	Sat, 23 Apr 2022 15:06:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gi2UWsE2bpaj; Sat, 23 Apr 2022 15:06:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 75961400F8;
	Sat, 23 Apr 2022 15:06:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EB72C1BF421
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 15:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D994060BC8
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 15:06:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yVWtDfr1QXe0 for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 15:06:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D403760BA8
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 15:06:09 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id s18so21676031ejr.0
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 08:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=MfQ9moOMHVe4+raiZetHQB2cUN062xXSPZJ15an7Rus=;
 b=QdQZqN8JL5msANYD50rU7HTEXtZCRdzlC97i7JSrysx6uv8HSTxtmXe3k+bQ7J5guL
 ko+W5wFw5R908rIIXcmzgcBehjBLbA40iD1nudvbx8+sNTdDv4TFtTZ2Mz1EV5LLvFEu
 QKtLH+vUY1+KVUdIJaSs2K5+jGS1Je2zch/tvBo/9UDrQCpe425WszPPXZLfuSfvxB5f
 /Cvt42hC48ZVmPHXIZreOCsvobaTUJ5GxJkD+nkzAXRo77wFsTgxg51JQF+iPAQFa6P3
 0ghhUHvKQQY+U2MPG49/ADxeOqtMwx+Zyw3YbI6iHC7mQgYW0Dz7PEVF3cpmzEOVuD8S
 3jYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=MfQ9moOMHVe4+raiZetHQB2cUN062xXSPZJ15an7Rus=;
 b=PgUbd8wxTdwN54CBJnLIKgEzkiDA8aBkIvUF/1GmcOGs2BJqbBlSiHUfbDQDa3kG5t
 q6HmMjPdLHlBvGGzX2lpmDxP+tay1hOD657CyMitGr3HDv0xNDYP8y6OeWXK0uM8Q4yK
 sm8diaPJqNMYqYHeVvZCLSkhDZNc+uvjJoQu17egdvlL4rfw9afHHDnJa9zx8Dy1eDUC
 Kc7NR1BN2XqT93DL8O7AvLRzr4bDQhUqiAhF+Tu5YWkMdqoxvVStpflgvjW/EOnL7TcT
 +FRJkaPZ6kLUrfn/2aQy1Gy26NAnVdlths6hNvH+YoNtKiU3TtI0xV3PE8Z1lScLGKgk
 hWSg==
X-Gm-Message-State: AOAM530xZz7OQj7OC0pwxn4HIQxxK/l5CEWPJGDxjgKdhbf+iiCtq/xF
 Bg4bVe4J7HlBpdW8DNk4i4Kkug==
X-Google-Smtp-Source: ABdhPJym1LGKaxc0BTgf+Riy+ziFIPutwTFQ8LAoxqwukpuz+bvunL/Yb4E7GCNp3HVIYzS4j4VsCw==
X-Received: by 2002:a17:906:2991:b0:6cd:ac19:ce34 with SMTP id
 x17-20020a170906299100b006cdac19ce34mr8949407eje.746.1650726367979; 
 Sat, 23 Apr 2022 08:06:07 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 l3-20020aa7cac3000000b00422c961c8c9sm2283623edt.78.2022.04.23.08.06.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Apr 2022 08:06:07 -0700 (PDT)
Message-ID: <82880b6e-8e85-f9a2-7b98-d00034c49dc9@mind.be>
Date: Sat, 23 Apr 2022 17:06:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220419090346.2029839-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220419090346.2029839-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/2] package/expat: disable examples,
 tests and xmlwf
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



On 19/04/2022 11:03, Fabrice Fontaine wrote:
> Disable examples and tests (enabled by default) through
> --without-{examples,tests} which are available since version 2.2.7 and
> https://github.com/libexpat/libexpat/commit/1fdfd8a1b490f8ac9e7e11896298e41cc210d87d
> 
> Also disable xmlwf (a binary that determines if an XML document is
> well-formed) through --without-xmlwf which is available since version
> 2.2.4 and
> https://github.com/libexpat/libexpat/commit/9d950527a07783c104aada685384edf3f8f23f8a
> 
> This will fix the following build failure on riscv64:
> 
> ERROR: reloc type R_RISCV_SET6 unsupported in this context
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/99890c9c7ebe3266dd533c81352a3cbcf4d3d738
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied both to master, thanks.

  Someone may actually need xmlwf for something, but then they can send a patch 
to enable it (probably with a Config.in option which depends on !riscv64).

  Regards,
  Arnout

> ---
>   package/expat/expat.mk | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/expat/expat.mk b/package/expat/expat.mk
> index b29b0e1d26..92a3bfda8e 100644
> --- a/package/expat/expat.mk
> +++ b/package/expat/expat.mk
> @@ -15,8 +15,9 @@ EXPAT_LICENSE_FILES = COPYING
>   EXPAT_CPE_ID_VENDOR = libexpat_project
>   EXPAT_CPE_ID_PRODUCT = libexpat
>   
> -EXPAT_CONF_OPTS = --without-docbook
> -HOST_EXPAT_CONF_OPTS = --without-docbook
> +EXPAT_CONF_OPTS = \
> +	--without-docbook --without-examples --without-tests --without-xmlwf
> +HOST_EXPAT_CONF_OPTS = --without-docbook --without-examples --without-tests
>   
>   $(eval $(autotools-package))
>   $(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
