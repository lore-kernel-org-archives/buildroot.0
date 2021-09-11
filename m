Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65DB9C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 18:56:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1210D6103D
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 18:56:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1210D6103D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD0EB40533;
	Sat, 11 Sep 2021 18:56:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DOCTZjDP38ix; Sat, 11 Sep 2021 18:56:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 393CA4052B;
	Sat, 11 Sep 2021 18:56:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5FB9B1BF2C2
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 18:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F3398243B
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 18:55:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CC2sIii9ttfS for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 18:55:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4123B82438
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 18:55:51 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id qq21so5498071ejb.10
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 11:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=C69Co4+wvINUr5iWNkNfCpDGvyQ43u5gtw+PuRDjY9g=;
 b=V2fJ96onN5h0+P7qVxcpE5WE1QsKr8/Y0vfu3qvHuLnwYnsvtsKmjZpZMksjFzE0UQ
 yf8CC2kz+e5gOLw4i7Ivzf3/kW9qNrRx6xohoJPitGFrMi7O2eRSKUPaon19XRZrgbop
 JocdlT0tFGRJ0fWzmEnVXOiXWJzUoBss7kQwldVmect9JOrWn0QoQp9IifQQ9XC1sFkU
 e6PN/2M9PwAbsZRhe2k42aIx64vg7nGF/jm3/+I3QJQBQw282T0el8LUCF+4hRfEenLu
 L7mgWAB/eMS4Wdn+mOI6TXTOlhrEepVHszB3o7N+ewpAGC6J76XL+Ppx0Jw5l3LTETwV
 R+PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=C69Co4+wvINUr5iWNkNfCpDGvyQ43u5gtw+PuRDjY9g=;
 b=TQeMv+g+Xgsglnc65P7JKhqViiI0yz0Q/w0KtGTUedDv6ERHuzLo8XXf9Bj8901Gl+
 AJOoFh4URGUZ60AJEcfZR7pr+d5HOwGgbZvsiKlxH3LHCcHnucyaW40N+88RY3fWnhgm
 TKQSJ6B3eRZCYVwlZoPFJbFUa3buQ6nxe4DbwwyGOK0uzF8xo4DrY7qWF5/qPCvdKgye
 JOXTIcLTrzcinoCAHp34zqTV3LyJE7LfJfinxjadN65a1Ff24wkmwlEzeNe38DcCWotC
 RfAojjQqpQJZMuWavBBhDDJcBAXcgKAtJ0DSGBZoWIUIwFF8+55VMSEHcZf/ilF+sduR
 5lPA==
X-Gm-Message-State: AOAM533fHr24isW5MIrfuLsHZTqLUjKPEeHgvTPPKJ1Ice/IpiFBtJqs
 0SvxWgU2MN8kieI+ffm+n4tXkTh39RPysw==
X-Google-Smtp-Source: ABdhPJyDDj/ftfIZQ0Yr4hLnd9GfuKw9EPxp4nSBZC/ejN+8EtY+CWEh34D/4T1YhKpEr4pvmXLYoQ==
X-Received: by 2002:a17:906:1615:: with SMTP id
 m21mr4242667ejd.279.1631386549130; 
 Sat, 11 Sep 2021 11:55:49 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id o7sm1289119edt.68.2021.09.11.11.55.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Sep 2021 11:55:48 -0700 (PDT)
To: Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
References: <20210903162027.1935040-1-aduskett@gmail.com>
 <20210903162027.1935040-2-aduskett@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <532256c5-38da-797b-88a6-5e05acd7e29b@mind.be>
Date: Sat, 11 Sep 2021 20:55:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210903162027.1935040-2-aduskett@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH/master 1/7] g-ir-scanner-qemuwrapper.in: Fix
 latent bug in
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>, Anisse Astier <anisse@astier.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

 Applied to master, thanks.

 I've tried to fix the summary line.

On 03/09/2021 18:20, Adam Duskett wrote:
> If GIR_EXTRA_LIBS_PATH is empty, the LD_LIBRARY_PATH variable is
> ":.libs:$(dirname $0)/../lib:$(dirname $0)/../../lib".
> 
> As discussed with Yann Morin, add a new variable, "GOI_LIBRARY_PATH" and
> prepend ${GIR_EXTRA_LIBS_PATH:+${GIR_EXTRA_LIBS_PATH}:} to the path to fix the
> above bug.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>  package/gobject-introspection/g-ir-scanner-qemuwrapper.in | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/gobject-introspection/g-ir-scanner-qemuwrapper.in b/package/gobject-introspection/g-ir-scanner-qemuwrapper.in
> index cad7ef875e..ec066062e2 100644
> --- a/package/gobject-introspection/g-ir-scanner-qemuwrapper.in
> +++ b/package/gobject-introspection/g-ir-scanner-qemuwrapper.in
> @@ -4,10 +4,11 @@
>  # is older than the target kernel.
>  # Use a modules directory which does not exist so we don't load random things
>  # which may then get deleted (or their dependencies) and potentially segfault
> +GOI_LIBRARY_PATH="${GIR_EXTRA_LIBS_PATH:+${GIR_EXTRA_LIBS_PATH}:}.libs:$(dirname "$0")/../lib:$(dirname "$0")/../../lib"

 Since the comment above is not related to this assignment, I moved the
assignment above the comment.

 I haven't tested the result so I hope I made no mistakes :-)

 Regards,
 Arnout

>  GIO_MODULE_DIR=$(dirname $0)/../lib/gio/modules-dummy \
>  @QEMU_USER@ -r @TOOLCHAIN_HEADERS_VERSION@ \
>  -L $(dirname $0)/../../ \
> --E LD_LIBRARY_PATH=${GIR_EXTRA_LIBS_PATH}:.libs:$(dirname $0)/../lib:$(dirname $0)/../../lib \
> +-E LD_LIBRARY_PATH="${GOI_LIBRARY_PATH}" \
>  "$@"
>  
>  if [[ $? -ne 0 ]]; then
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
