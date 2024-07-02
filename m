Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86113C30658
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 19:43:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5613181132;
	Tue,  2 Jul 2024 19:43:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BuXlMq8pBeX8; Tue,  2 Jul 2024 19:43:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6865283F6B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6865283F6B;
	Tue,  2 Jul 2024 19:43:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BDDF71BF303
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 19:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AADCA412F3
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 19:43:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 92ogNxVvyt23 for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 19:43:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4A0A6405CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A0A6405CC
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4A0A6405CC
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 19:43:10 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-36789d19ffbso409392f8f.1
 for <buildroot@buildroot.org>; Tue, 02 Jul 2024 12:43:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719949388; x=1720554188;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZJ1li0KAgP6AcRfJxrr/5MULrTx2VmGGqjhPDSTS8qg=;
 b=fxhwiW0to9uRw6uKhNHdmvSgsXZjzfqtpWPhqyB1bjxuxisICft7Xic4cZrtfCPgN+
 ZBpPu6Bmq1AXR3aPOuJFUO/8gnz+SAp9ep+ufQeyzJh23sONMNg4KAqpNBnPdnTx5icA
 EfG/81S88AaLAkf2V7KLvDI9DZ2zoxVNJX81hTXu4B9nm0UySIGS01VQoZj6wR0eLCVg
 nQqOOJE3I3QiwUVUf3Jjycebjbqm9+7AjxeKrlEtjIzllEYwbpGQev9yu201zKX73/tC
 bGzAcO5TI9D5Q1uZQfFQHsV71rFbBqC6w+NvLs1Ewd/g/QRnp8h2w6hB3Pkbyn4ARbEA
 12kg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWf/NJYv5K8JOMoydAa7SjkgGBZ8GlSIwzTGJWtaU/rJAfjxidmTXrB5gIVqg6PUiIeSIfBRlya1NCQxGr7fOERACYauagXww==
X-Gm-Message-State: AOJu0YxyerqbVBAIQSyl4Y2JufM5y6Ix5vR6vMOpVXtOoHRCFaWahiCu
 RjpVj6lwPI6T4tgwt86foyHPGQQhEKZgTGZVFN0JW7vcRcNU9hkc5RuJqNrCiThlu4Jk10YfIJ7
 h
X-Google-Smtp-Source: AGHT+IELDpe8iH3DN7W6jbHTXxhDLT8iAbwMKbC3I33cQLHJTHpSXrQ3bXrn3XiVjFt7Sz9aTShxbw==
X-Received: by 2002:adf:f64b:0:b0:367:8aa3:4237 with SMTP id
 ffacd0b85a97d-3678aa343a0mr1086698f8f.39.1719949388373; 
 Tue, 02 Jul 2024 12:43:08 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a1030c8sm14025413f8f.98.2024.07.02.12.43.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 12:43:07 -0700 (PDT)
Message-ID: <ba1e7a01-ace6-4b70-b851-a1dea14ff753@mind.be>
Date: Tue, 2 Jul 2024 21:43:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20240702192340.2473137-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-GB
In-Reply-To: <20240702192340.2473137-1-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719949388; x=1720554188; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZJ1li0KAgP6AcRfJxrr/5MULrTx2VmGGqjhPDSTS8qg=;
 b=ejKl7Yteznu500CkmKdWEhmbjKsp7VgEnx/iJcVOu+VnXz0UoZcKSnUKGgEe3YORqW
 1cGpXNY+mUq62ZaICc0oIq5YAZsd0Y/z8zKlXV0RF9xkSfHljd29co0zuGbGPTWldfrU
 3L9/TVaEBgpoPVKG25goAtYQkJkVUei28th4OomfCi6qJjKharXxpv9OLGisYCXUrm36
 w0H9n8NK82+//jRv/nVgOa0hPBIAWT3lMX8m14d0zIonQ+VDh+70ILJynmWm3IMGaa8K
 yvaQTKsH2W8H0FPQMKzngYVSxGpLy7xxlQd51jqRhtDkr2fMF+AoSdotzAQ8ZmmeciMq
 aHCw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ejKl7Yte
Subject: Re: [Buildroot] [PATCH 1/1] package/libhid: update the patches to
 be applied with fuzz 0
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
Cc: linux-amarula@amarulasolutions.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 02/07/2024 21:23, Dario Binacchi wrote:
> Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
> fuzz factor to 0") reduced the fuzz factor.
> 
> Due to this change, libhid fails to build with output:
> 
>      Applying 0003-uclinux.patch using patch:
>      patching file configure.ac
>      Hunk #1 FAILED at 80.
>      1 out of 1 hunk FAILED -- saving rejects to file configure.ac.rej
> 
> This commit refreshes the package patch on the current package version.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libhid/0003-uclinux.patch | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libhid/0003-uclinux.patch b/package/libhid/0003-uclinux.patch
> index cb3c45216a09..a81c3dc0a1fa 100644
> --- a/package/libhid/0003-uclinux.patch
> +++ b/package/libhid/0003-uclinux.patch
> @@ -5,9 +5,9 @@ Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
>   diff -Nura libhid-0.2.16.orig/configure.ac libhid-0.2.16/configure.ac
>   --- libhid-0.2.16.orig/configure.ac	2014-06-22 09:35:50.277261742 -0300
>   +++ libhid-0.2.16/configure.ac	2014-06-22 09:36:10.688951947 -0300
> -@@ -80,6 +80,7 @@
> +@@ -79,6 +79,7 @@
> + AC_C_STRINGIZE
>    
> - MD_CONF_DEBUGGING
>    MD_CONF_COMPILER
>   +AM_CONDITIONAL(OS_LINUX, test "$MD_OS" = "uclinux")
>    AM_CONDITIONAL(OS_LINUX, test "$MD_OS" = "linux")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
