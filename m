Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CD96C433F5
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 19:28:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1469F60EE0
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 19:28:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1469F60EE0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D5EFE40121;
	Wed, 22 Sep 2021 19:28:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PaCldRdidvBJ; Wed, 22 Sep 2021 19:28:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B74C3401FD;
	Wed, 22 Sep 2021 19:28:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 547781BF321
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 19:27:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50CB841596
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 19:27:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i-mVRAGiLDcG for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 19:27:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 07A3441594
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 19:27:57 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id y89so3383185ede.2
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 12:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=CRhL2sOQEnb3n+4HMIcXR6j06oMmk6d+/1AFHwnYa+I=;
 b=G1ZzhILZWT74pQf7ZKcC4OYPgjNtU7DEE0By8+KfQbt+MYJ3ilHLV4y45xLzfXxmle
 FAGQo8GDtWASqL/BOtLGHveyTcr3sU6sYeASY9pOit0svQAZ+DpaM6Urt/vqgeVup554
 5YFfZhlgGt0sQxSySq/agav3TfpBI9xop3Q5xM8UHf8FnzJN7xo/epABBQHhsroGoh+M
 K7+mDhQcQkWKJAqisflSBO3WQT1RafeZ2mxust7w+vEIBWr1YWDnROSaWt92EfJDXj36
 f4JMA7kVIDLRSHOvgIn2A9Bf8LVKuf1ZD7mta/T5ucp4uwleuJTI88N9hvqpNHuOI1Vu
 7v7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=CRhL2sOQEnb3n+4HMIcXR6j06oMmk6d+/1AFHwnYa+I=;
 b=AhTRtt+pzmLxv0y2TRvQa5BAvr8qdpHXid20GZBZQ+Q10LejqhU2n8NzJ+CytXJNNq
 QRZIcIQ0zGM9aC/UncsSuFoti45Ae9V+G9xTRoaZCMPZ1q5ZqJJ12I+fQg92J6G8hXdr
 DuYdEYWUTBS5bp7aJ78QW0JKSYJriSb0epiChyG9d1NczJsaHAyyScbziiJ8ZZ3RpGmA
 DCRMqTyNA2M1odxlKLiAloFp1CW7e9Q/oDWYnDXq2HcrMhaKhZ1Y9nttkp7RzACqzCY8
 Jk4LgV84PsMCu9VJEBwA0dHD8TQVOC27mxjjYcCGDCd0ICQhvRUgzoA9y2E28KLm10kp
 zQow==
X-Gm-Message-State: AOAM531fvxpidU9Gmt+rB9BXPUzNQERzW9mWU0litl+0qML+tbgHrdEi
 2jmUxtZqqHHCIQ8tB0rbxkDjIg==
X-Google-Smtp-Source: ABdhPJwLFZizwbApeMxJuFdT3m59FBPFJBrPFM7xLUsOOt0d5f0d5UnzdppJ3Wk4T6Pd5UvgVZD3Ww==
X-Received: by 2002:a17:907:33ce:: with SMTP id
 zk14mr1019274ejb.84.1632338876102; 
 Wed, 22 Sep 2021 12:27:56 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id w5sm1464830ejz.25.2021.09.22.12.27.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 12:27:55 -0700 (PDT)
Message-ID: <9646cf85-2fb2-b0bc-fae8-64eb7576d860@mind.be>
Date: Wed, 22 Sep 2021 21:27:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <20210922085308.17902-1-peter@korsgaard.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210922085308.17902-1-peter@korsgaard.com>
Subject: Re: [Buildroot] [PATCH] package/libcurl: security bump to version
 7.79.1
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
Cc: Matt Weber <matthew.weber@collins.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 22/09/2021 10:53, Peter Korsgaard wrote:
> Fixes the following security issues:
> 
> - CVE-2021-22945: UAF and double-free in MQTT sending
>    When sending data to an MQTT server, libcurl could in some circumstances
>    erroneously keep a pointer to an already freed memory area and both use
>    that again in a subsequent call to send data and also free it again.
> 
>    https://curl.se/docs/CVE-2021-22945.html
> 
> - CVE-2021-22946: Protocol downgrade required TLS bypassed
>    A user can tell curl to require a successful upgrade to TLS when speaking
>    to an IMAP, POP3 or FTP server (--ssl-reqd on the command line or
>    CURLOPT_USE_SSL set to CURLUSESSL_CONTROL or CURLUSESSL_ALL with libcurl).
>    This requirement could be bypassed if the server would return a properly
>    crafted but perfectly legitimate response.
> 
>    This flaw would then make curl silently continue its operations without
>    TLS contrary to the instructions and expectations, exposing possibly
>    sensitive data in clear text over the network.
> 
>    https://curl.se/docs/CVE-2021-22946.html
> 
> - CVE-2021-22947: STARTTLS protocol injection via MITM
>    When curl connects to an IMAP, POP3, SMTP or FTP server to exchange data
>    securely using STARTTLS to upgrade the connection to TLS level, the server
>    can still respond and send back multiple responses before the TLS upgrade.
>    Such multiple "pipelined" responses are cached by curl.  curl would then
>    upgrade to TLS but not flush the in-queue of cached responses and instead
>    use and trust the responses it got before the TLS handshake as if they
>    were authenticated.
> 
>    Using this flaw, it allows a Man-In-The-Middle attacker to first inject
>    the fake responses, then pass-through the TLS traffic from the legitimate
>    server and trick curl into sending data back to the user thinking the
>    attacker's injected data comes from the TLS-protected server.
> 
>    Over POP3 and IMAP an attacker can inject fake response data.
> 
>    https://curl.se/docs/CVE-2021-22947.html
> 
> In addition, 7.79.1 fixes a number of regressions in 7.79.0:
> https://daniel.haxx.se/blog/2021/09/22/curl-7-79-1-patched-up-and-ready/
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libcurl/libcurl.hash | 4 ++--
>   package/libcurl/libcurl.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
> index 5e5776d1e3..b13f01c874 100644
> --- a/package/libcurl/libcurl.hash
> +++ b/package/libcurl/libcurl.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated after checking pgp signature
> -# https://curl.se/download/curl-7.78.0.tar.xz.asc
> +# https://curl.se/download/curl-7.79.1.tar.xz.asc
>   # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
> -sha256  be42766d5664a739c3974ee3dfbbcbe978a4ccb1fe628bb1d9b59ac79e445fb5  curl-7.78.0.tar.xz
> +sha256  0606f74b1182ab732a17c11613cbbaf7084f2e6cca432642d0e3ad7c224c3689  curl-7.79.1.tar.xz
>   sha256  6fd1a1c008b5ef4c4741dd188c3f8af6944c14c25afa881eb064f98fb98358e7  COPYING
> diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
> index 4e3c6d4523..a70ebe4113 100644
> --- a/package/libcurl/libcurl.mk
> +++ b/package/libcurl/libcurl.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBCURL_VERSION = 7.78.0
> +LIBCURL_VERSION = 7.79.1
>   LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
>   LIBCURL_SITE = https://curl.se/download
>   LIBCURL_DEPENDENCIES = host-pkgconf \
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
