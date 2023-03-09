Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A78C6FD1C
	for <buildroot@archiver.kernel.org>; Thu,  9 Mar 2023 21:30:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54BF2821FE;
	Thu,  9 Mar 2023 21:30:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54BF2821FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j2dsVhWyzq8u; Thu,  9 Mar 2023 21:30:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38DA08220B;
	Thu,  9 Mar 2023 21:30:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38DA08220B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CE4DB1BF366
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 21:30:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B5A29404C9
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 21:30:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5A29404C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BIqekwO-ZwCu for <buildroot@lists.busybox.net>;
 Thu,  9 Mar 2023 21:29:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 651D040278
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 651D040278
 for <buildroot@buildroot.org>; Thu,  9 Mar 2023 21:29:59 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id da10so12692883edb.3
 for <buildroot@buildroot.org>; Thu, 09 Mar 2023 13:29:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678397397;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EWzDeeKYaM4yKQsnZodQzJBbKGXoa7eRP6UbSnuzvy8=;
 b=b7/B0ssuk6t6Yhy7pSsCuKXymzj4aQDItXpiJoAfVlTqUrNZJHZ0tp6y0TLL2dGGkd
 UACnqrPmm8aLX7EHvW56gBuQtqbrb2SWEHPyf4bkjNiXSXU1nDYOipwIZ3YfSig9FvMB
 m/2DZdtA1QBG1GOOJ492pWPZ5APIfMlSszbuwJZKX0Vsfq5OZjpWQuFwjvaR55AIPZjL
 uKOzGi2SMwORv/mhGZi5TDLavjapvh33pChTk5KQvgVfz/wjyLD2ymH7xFaPQxU66qjn
 DM4+gtSoLLpK8vPXvqTsttAM8sglxm7vDiZsPwE8Cc0FaMPgd3xUua9U+X6LPoT2I2e6
 tmmw==
X-Gm-Message-State: AO0yUKVAN/RkQuagt83/0V5wtmN9BwYCpAYp/6ecTsflbNv2kEkZWQGB
 /NNkALMSLZ89gUyH1PDOppPxpX7h8aghBNxYmFg=
X-Google-Smtp-Source: AK7set8LOuFhQpUCaBSrbsG+45cp4cRLKC3rEKkprdh5wh/d9izK5DJM3OQcnxnHhR+FxXGtbQVzKw==
X-Received: by 2002:a17:907:9618:b0:8b0:fbd1:1a61 with SMTP id
 gb24-20020a170907961800b008b0fbd11a61mr14275599ejc.52.1678397397487; 
 Thu, 09 Mar 2023 13:29:57 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 g13-20020a50d0cd000000b004bbc90e1fa3sm190220edf.93.2023.03.09.13.29.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 13:29:56 -0800 (PST)
Message-ID: <d8133748-1767-7565-2aab-52687862a145@mind.be>
Date: Thu, 9 Mar 2023 22:29:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-GB
To: Lang Daniel <d.lang@abatec.at>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <VI1P190MB04939E8E4F73C4D9027F26809FA89@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <VI1P190MB04939E8E4F73C4D9027F26809FA89@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1678397397;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EWzDeeKYaM4yKQsnZodQzJBbKGXoa7eRP6UbSnuzvy8=;
 b=S3rSGW8GWChwTzNG07xHwbefOaedQGwk0k85Vnm0S4QhN/AjEAH7CamDV4/X1hDIVR
 afX58WA2XaO10HRO864JKq0lOown4+95RPnUlGIbTXMAkLlxpEKajp6sZbrizZ21gPVz
 G4r3mFs7ouzgNFwIt1EeA7OFLMVrMn5sMOWgqHfYgQ1bQ9Et2f9u2+FOP091AvBeQQ9K
 H61lEwEk805KMe+L8tavfwGJNoUjrX3NU4hAHUII70ZMSPsITfZ+Maxw575RUwDAPfEK
 nCci+kQumZ+IhltggnoeEk1908CtXTo9GXI8HKBMuQDeP4fNVkLln2G8gO0QZ/NQILKF
 tyYg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=S3rSGW8G
Subject: Re: [Buildroot] [PATCH 0/6] package/gtkmm3: duplicate needed
 packages
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



On 24/02/2023 09:42, Lang Daniel via buildroot wrote:
> As discussed some time ago [0], gtkmm3 doesn't support newer versions of the
> other C++ binding packages. According to the gtkmm mailing list [1] there were
> no plans to every support them, back then the API change was introduced in all
> the other packages. gtkmm4, which targets libgtk4 supports them.
> 
> Recent interest in gtkmm3 let me to try and put together a series that would
> duplicate the needed packages. The alternative to this series would be to drop
> gtkmm3.
> 
> All of them support installing and using both versions side-by-side.
> 
> [0]: https://lists.buildroot.org/pipermail/buildroot/2021-October/625850.html
> [1]: https://mail.gnome.org/archives/gtkmm-list/2021-May/msg00000.html
> [2]: https://lists.buildroot.org/pipermail/buildroot/2023-February/661803.html
> 
> Daniel Lang (6):
>    package/libsigc2: new package
>    package/glibmm2_66: new package
>    package/atkmm2_28: new package
>    package/cairomm1_14: new package
>    package/pangomm2_46: new package
>    package/gtkmm3: use correct versions of mm packages

  Since the final patch actually fixes things, and since the rest adds new 
packages which is low risk, I applied the series to master, thanks.

  By the way, there are two small annoyances with the series you send (which I 
think are due to Exchange so probably not much you can do about it).

* The From line is "Lang Daniel" while the Signoff is "Daniel Lang". I have a 
git hook that checks that the From line appears as a signoff, so it's a bit 
annoying that these are different. I suspect there is really not much you can do 
about this.

* The mails are not sent threaded, (or at least, they don't appear as such in my 
mailer (thunderbird); patchwork does seem to pick up the threads). Normally git 
send-email takes care of threading, but you can do it at level of format-patch 
by passing the --thread option.

  As I said, small annoyances, don't worry if you can't fix them.

  Regards,
  Arnout


> 
>   DEVELOPERS                           | 10 ++++++++++
>   package/Config.in                    |  5 +++++
>   package/atkmm/Config.in              |  2 +-
>   package/atkmm2_28/Config.in          | 23 +++++++++++++++++++++++
>   package/atkmm2_28/atkmm2_28.hash     |  5 +++++
>   package/atkmm2_28/atkmm2_28.mk       | 16 ++++++++++++++++
>   package/cairomm/Config.in            |  2 +-
>   package/cairomm1_14/Config.in        | 22 ++++++++++++++++++++++
>   package/cairomm1_14/cairomm1_14.hash |  3 +++
>   package/cairomm1_14/cairomm1_14.mk   | 16 ++++++++++++++++
>   package/glibmm/Config.in             |  2 +-
>   package/glibmm2_66/Config.in         | 21 +++++++++++++++++++++
>   package/glibmm2_66/glibmm2_66.hash   |  5 +++++
>   package/glibmm2_66/glibmm2_66.mk     | 23 +++++++++++++++++++++++
>   package/gtkmm3/Config.in             | 16 ++++++++--------
>   package/gtkmm3/gtkmm3.mk             |  2 +-
>   package/libsigc/Config.in            |  2 +-
>   package/libsigc2/Config.in           | 17 +++++++++++++++++
>   package/libsigc2/libsigc2.hash       |  5 +++++
>   package/libsigc2/libsigc2.mk         | 19 +++++++++++++++++++
>   package/pangomm/Config.in            |  2 +-
>   package/pangomm2_46/Config.in        | 25 +++++++++++++++++++++++++
>   package/pangomm2_46/pangomm2_46.hash |  5 +++++
>   package/pangomm2_46/pangomm2_46.mk   | 16 ++++++++++++++++
>   24 files changed, 250 insertions(+), 14 deletions(-)
>   create mode 100644 package/atkmm2_28/Config.in
>   create mode 100644 package/atkmm2_28/atkmm2_28.hash
>   create mode 100644 package/atkmm2_28/atkmm2_28.mk
>   create mode 100644 package/cairomm1_14/Config.in
>   create mode 100644 package/cairomm1_14/cairomm1_14.hash
>   create mode 100644 package/cairomm1_14/cairomm1_14.mk
>   create mode 100644 package/glibmm2_66/Config.in
>   create mode 100644 package/glibmm2_66/glibmm2_66.hash
>   create mode 100644 package/glibmm2_66/glibmm2_66.mk
>   create mode 100644 package/libsigc2/Config.in
>   create mode 100644 package/libsigc2/libsigc2.hash
>   create mode 100644 package/libsigc2/libsigc2.mk
>   create mode 100644 package/pangomm2_46/Config.in
>   create mode 100644 package/pangomm2_46/pangomm2_46.hash
>   create mode 100644 package/pangomm2_46/pangomm2_46.mk
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
