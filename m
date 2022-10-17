Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B205CC4332F
	for <buildroot@archiver.kernel.org>; Mon, 17 Oct 2022 18:30:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DE4460F79;
	Mon, 17 Oct 2022 18:30:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4DE4460F79
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BrZh1ybbR5UI; Mon, 17 Oct 2022 18:30:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 332D360F75;
	Mon, 17 Oct 2022 18:30:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 332D360F75
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9FCAE1BF31C
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 18:30:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8685240232
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 18:30:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8685240232
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id idvU9ymZb_Xz for <buildroot@lists.busybox.net>;
 Mon, 17 Oct 2022 18:30:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 583BA40245
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 583BA40245
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 18:30:31 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id g27so17273428edf.11
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 11:30:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:from:references:cc:to:content-language:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=TMWvqo1D7kIWQQTB9YvhJpNqLuwnpVj2ERvKGXobj8s=;
 b=mkCV9+lzO91xxrcjzao8EV61Cd1ofnnxkcf8fV23mrLZZHpaMJUWMey3kXAMQWQIxJ
 PiAB23MxhbM07UykF3q6dSFG3qKXXm/pVkQf8/V9IoybyIZVNFgj0yrIM9xt75yOJVOH
 kadt8rR0DcJ1oX3UDhLyW/mXhKwDco6fpX9YGAEtxiDePJQkFj6BaCLp7K8DwW/o5MHY
 7VcNeRFnIzQPU0ohcrioJSxVREBLthLsFwYLL1pYDXaQu1nllsBGB3a3ogbsHkLaRa1H
 AcaNCeXLfd4bGFV6FH1S41Zc+g6+q92Qxt2ajiofeDEO7hSJV6eBlYv2yOrS98ZrURhM
 XuJw==
X-Gm-Message-State: ACrzQf1r4bwhSnJEcZiO7ctoYRP9ht+N11O8bySRTs8m5ldwcKiHz4F0
 j+/fZU/X3DcW5RRYtNydPMwRCA==
X-Google-Smtp-Source: AMsMyM4ACFBoy36noSW3vu9sTkFJn4LOczI4ExXkP0ZYBf3aZ6+aNKeY9kzfNRdrrbs23Evgxc7GOA==
X-Received: by 2002:aa7:da03:0:b0:458:e117:28d8 with SMTP id
 r3-20020aa7da03000000b00458e11728d8mr11523321eds.387.1666031429360; 
 Mon, 17 Oct 2022 11:30:29 -0700 (PDT)
Received: from ?IPV6:2a02:2788:1a4:785::9? ([2a02:2788:1a4:785::9])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a1709060cd200b00734bfab4d59sm6564676ejh.170.2022.10.17.11.30.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Oct 2022 11:30:28 -0700 (PDT)
Message-ID: <42635550-c5eb-fcc9-dfc2-18c2776111ca@essensium.com>
Date: Mon, 17 Oct 2022 20:30:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Christian Stewart <christian@paral.in>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20221017142849.41399-1-thomas.perale@mind.be>
 <20221017142849.41399-2-thomas.perale@mind.be>
 <CA+h8R2qwa-bzHzogQoVRubbapo1EwKmzyPML_hJQww144DWv6g@mail.gmail.com>
 <20221017175500.GB3666@scaer>
 <CA+h8R2poqGOachEBUhQjiVmXwqMJJXxD3RrzeDKVAe_7PSSZJA@mail.gmail.com>
In-Reply-To: <CA+h8R2poqGOachEBUhQjiVmXwqMJJXxD3RrzeDKVAe_7PSSZJA@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google;
 h=in-reply-to:from:references:cc:to:content-language:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TMWvqo1D7kIWQQTB9YvhJpNqLuwnpVj2ERvKGXobj8s=;
 b=YzlZgIM9h0LcrlgDONYY1qug8RvKsTnnUoAzZbQ6Yi7v2JbIJsGWh8Ng06+Pu7Zqx1
 hqgFnPOrDnOJbkQ9/8WiZmCFvcB8IOzMDjnS3KU2900L7blNl9zSPjzULNhBcwkXQQwN
 Sfy/KQik01P2wCQkFopGqD6AMaXyTu8yA/h3xZncYTOzZyCsadSii151bBxHB8UaizyD
 7w4JhNaxCRUMWVDNKCTeNXNwagwvXU5OeDN6ifB1L5eqHwANLhzG23oAXrxCY1qNI72V
 eS7LTzqtHPlG/NwRT9pR/V614+41hbLhCXGQW4fc7ak8L1CcewsBg1YNYN3p39CJfryF
 U/nA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=YzlZgIM9
Subject: Re: [Buildroot] [PATCH 1/4] package/goc: new virtual package
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@essensium.com>
Cc: Geoff Levand <geoff@infradead.org>, Anisse Astier <anisse@astier.eu>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>,
 Romain Naour <romain.naour@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Thomas Perale <thomas.perale@mind.be>
Content-Type: multipart/mixed; boundary="===============2969036316661785907=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.
--===============2969036316661785907==
Content-Type: multipart/alternative;
 boundary="------------wWpGf2wjVwV0r0rxrj8kkUMW"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------wWpGf2wjVwV0r0rxrj8kkUMW
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Dear Christian, Yann,

Thank you for responses.

As Yann said my idea behing "goc" was to keep the structure the same as
the already existing case of 'rustc'. But I do agree with you Christian
the 'goc' name is confusing and don't make much sense. Right now I'm
already working on a second patch that will put every "go" related
packages in a sub-directory:

> package/
> ├─ go/
> │  ├─ go/
> │  ├─ go-bin/
> │  ├─ go-bootstrap/
> │  ├─ go.mk
> │  ├─ Config.in

This will remove the dependency to 'goc' virtual package because I will
move it to 'package/go/go.mk' with the common variable between every
'go*' package. I just want to keep the same structure as Rust from now
and if I do the modification of moving it to a subdir I also want to do
the modification for rust packages.

PERALE Thomas

On 10/17/22 20:10, Christian Stewart wrote:
> Yann,
>
> On Mon, Oct 17, 2022 at 10:55 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>> Christian, All,
>>
>> On 2022-10-17 09:06 -0700, Christian Stewart spake thusly:
>>> On Mon, Oct 17, 2022, 7:29 AM Thomas Perale < [1]thomas.perale@essensium.com> wrote:
>>>   This virtual package implement the already existing go compiler compiled
>>>   from source and shows it on the host package menu.
>>>   The usage of a virtual package on top of the go compiler enable the
>>>   supports of for multiple providers for the Go compiler.
>>> Is it not possible to continue using the existing host-go target and
>>> simply add a parameter which enables downloading the precompiled
>>> version instead?
>>> Rather than add a new package.
>> In fact, we want to have a similar implementation for rust, go, nodejs,
>> so (without looking at the details of this series), I guess Thomas
>> Perale took the same approach as the existing rust situation, like
>> Thomas Petazzoni did in the recent host-nodejs series:
>>
>>     https://patchwork.ozlabs.org/project/buildroot/list/?series=319967
> Thomas changed host-nodejs to be a metapackage:
>
> https://patchwork.ozlabs.org/project/buildroot/patch/20220925204030.1661583-3-thomas.petazzoni@bootlin.com/
>
> This is not what this series does, which is to add a new host-goc
> package and refactor all Go packages to point to this new one.
>
> Sidenote: having a rust-bin and nodejs-bin makes sense, as those take
> a /very long/ time to compile. Having a go-bin on the other hand does
> not make as much sense, because compiling the Go compiler is fast
> (about 1 minute vs. Rust's 1 hour).
>
> In my opinion:
>
>  - Do not add a new host-goc package.
>  - Add parameter to host-go to select which compiler to use:
>    - bin
>    - src
>    - host go compiler (see patch linked below)
>  - If src is buildable: default to it
>  - If src is not buildable: default to host Go compiler
>  - Or if the parameter is set: use bin download
>
> This patch already solves the issue of selecting when to use the host
> go compiler or not:
>
> https://patchwork.ozlabs.org/project/buildroot/patch/20220725011322.1301684-1-christian@paral.in/
>
> ... it would be straightforward to add the Config parameter + binary
> download to host-go after applying that commit.
>
> My reasoning for why:
>
>  - Avoid refactoring all Go packages across the tree.
>  - Avoid confusing "goc" name (not used in Go ecosystem)
>  - Backwards compatible with existing configs.
>  - Fewer packages to maintain, easier to understand structure.
>
> I'll have a look at submitting a RFC series adjusting this one to the
> above structure.
>
> Thanks,
> Christian Stewart
--------------wWpGf2wjVwV0r0rxrj8kkUMW
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Dear Christian, Yann,</p>
    <p>Thank you for responses.</p>
    <p>As Yann said my idea behing "goc" was to keep the structure the
      same as the already existing case of 'rustc'. But I do agree with
      you Christian the 'goc' name is confusing and don't make much
      sense. Right now I'm already working on a second patch that will
      put every "go" related packages in a sub-directory:<br>
      <br>
      <blockquote type="cite">
        <pre class="leading-relaxed"><pre class="leading-relaxed">package/
├─ go/
│  ├─ go/
│  ├─ go-bin/
│  ├─ go-bootstrap/
│  ├─ go.mk
│  ├─ Config.in
</pre></pre>
      </blockquote>
    </p>
    <p>This will remove the dependency to 'goc' virtual package because
      I will move it to 'package/go/go.mk' with the common variable
      between every 'go*' package. I just want to keep the same
      structure as Rust from now and if I do the modification of moving
      it to a subdir I also want to do the modification for rust
      packages.</p>
    <p>PERALE Thomas<br>
    </p>
    <div class="moz-cite-prefix">On 10/17/22 20:10, Christian Stewart
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CA+h8R2poqGOachEBUhQjiVmXwqMJJXxD3RrzeDKVAe_7PSSZJA@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">Yann,

On Mon, Oct 17, 2022 at 10:55 AM Yann E. MORIN <a class="moz-txt-link-rfc2396E" href="mailto:yann.morin.1998@free.fr">&lt;yann.morin.1998@free.fr&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Christian, All,

On 2022-10-17 09:06 -0700, Christian Stewart spake thusly:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On Mon, Oct 17, 2022, 7:29 AM Thomas Perale &lt; [<a class="moz-txt-link-abbreviated" href="mailto:1]thomas.perale@essensium.com">1]thomas.perale@essensium.com</a>&gt; wrote:
  This virtual package implement the already existing go compiler compiled
  from source and shows it on the host package menu.
  The usage of a virtual package on top of the go compiler enable the
  supports of for multiple providers for the Go compiler.
Is it not possible to continue using the existing host-go target and
simply add a parameter which enables downloading the precompiled
version instead?
Rather than add a new package.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
In fact, we want to have a similar implementation for rust, go, nodejs,
so (without looking at the details of this series), I guess Thomas
Perale took the same approach as the existing rust situation, like
Thomas Petazzoni did in the recent host-nodejs series:

    <a class="moz-txt-link-freetext" href="https://patchwork.ozlabs.org/project/buildroot/list/?series=319967">https://patchwork.ozlabs.org/project/buildroot/list/?series=319967</a>
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Thomas changed host-nodejs to be a metapackage:

<a class="moz-txt-link-freetext" href="https://patchwork.ozlabs.org/project/buildroot/patch/20220925204030.1661583-3-thomas.petazzoni@bootlin.com/">https://patchwork.ozlabs.org/project/buildroot/patch/20220925204030.1661583-3-thomas.petazzoni@bootlin.com/</a>

This is not what this series does, which is to add a new host-goc
package and refactor all Go packages to point to this new one.

Sidenote: having a rust-bin and nodejs-bin makes sense, as those take
a /very long/ time to compile. Having a go-bin on the other hand does
not make as much sense, because compiling the Go compiler is fast
(about 1 minute vs. Rust's 1 hour).

In my opinion:

 - Do not add a new host-goc package.
 - Add parameter to host-go to select which compiler to use:
   - bin
   - src
   - host go compiler (see patch linked below)
 - If src is buildable: default to it
 - If src is not buildable: default to host Go compiler
 - Or if the parameter is set: use bin download

This patch already solves the issue of selecting when to use the host
go compiler or not:

<a class="moz-txt-link-freetext" href="https://patchwork.ozlabs.org/project/buildroot/patch/20220725011322.1301684-1-christian@paral.in/">https://patchwork.ozlabs.org/project/buildroot/patch/20220725011322.1301684-1-christian@paral.in/</a>

... it would be straightforward to add the Config parameter + binary
download to host-go after applying that commit.

My reasoning for why:

 - Avoid refactoring all Go packages across the tree.
 - Avoid confusing "goc" name (not used in Go ecosystem)
 - Backwards compatible with existing configs.
 - Fewer packages to maintain, easier to understand structure.

I'll have a look at submitting a RFC series adjusting this one to the
above structure.

Thanks,
Christian Stewart
</pre>
    </blockquote>
  </body>
</html>

--------------wWpGf2wjVwV0r0rxrj8kkUMW--

--===============2969036316661785907==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2969036316661785907==--
