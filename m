Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF83EC433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 10:40:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45F938145A;
	Sun, 13 Feb 2022 10:40:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8-KnXzaTQ5jq; Sun, 13 Feb 2022 10:40:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FD1981464;
	Sun, 13 Feb 2022 10:40:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 93BCD1BF2C9
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 10:40:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 81CC960ABB
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 10:40:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dM-HgGz3D7fX for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 10:40:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B80A060A8A
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 10:40:00 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id fy20so31566854ejc.0
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 02:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=uHsPUKaEEgwq9J0so+CfnaxRl8+VjHLvMDP7bSie1xM=;
 b=fRZa8FeLSYf9NwEsoNZu5Wnf6pkZN0kmZA9/ar1Z3PhaPaG44+Hy1R40b/W6++Rpig
 CK2ZbdHnLBpN0HW/jJA9NwgIJazj4C4Z4P0ucwhHdgVGnTgcmjtsofCeewaxNwzNEihj
 MxSk0enAKFwBsbqxwh3S/dXD8/5yHeetytIJ8Ps+QNS5ax5cFFaOSQH1CZcifG0Wu6ZJ
 SEgbFyEFQNWysXKX1He5rCOMkE+Mry/vsN86C5qYYSeEQr3dZCCDh+71J1+gpkez7XSZ
 ngKFnCMFqP57VYk1vHqsqZgjezCMrfK4fgGsERbwbXFUyvTlkcDZh5y/oj98z9EywiRq
 KDRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=uHsPUKaEEgwq9J0so+CfnaxRl8+VjHLvMDP7bSie1xM=;
 b=6eqKdhVE8mGIeJuCOWLEUxQ6evy/LjFFswJhAp7cUmQAxnQfE3w+MWgvxzjFLeE0oP
 BXisD3p5U7IFM5bxEiMDLDf02zAggElUjpJsoSuv6FpfXPgVrcFJt2ABKsum+NmZ4CeA
 PvllpFWOG3uyEXeSWfcEv1j4ulrH74lWkf96sfwB6WYY0g8cqfqf/1+B3xDG2DT8eEqa
 SifnscLTajB1+PlTzeUvtR1mKUqgFzzSZCiDsKhNF99mlgf4/y5UHkWjxDJEylYT/MW5
 pQ2lFqKLgvsMQ5DslmXlXXbHeyopHKrJyUtCArANuESx6gTYIyRCb5XgaA5MEtrKf7sn
 K8nw==
X-Gm-Message-State: AOAM533LOZIqdeSYYqoav/txnRt2vP15MIE8NO7ekjhrAeyivyWlRGGD
 +iMTCr+/Kz7ru+vAxsrAotmvWw==
X-Google-Smtp-Source: ABdhPJw48EDE0TiYo9SZxqTNQOUd788b/1wfIYbOQsON7r0yXCeggJk+KAYoLFWXh1gP0+jFhS4vyw==
X-Received: by 2002:a17:906:d552:: with SMTP id
 cr18mr7291114ejc.99.1644748798535; 
 Sun, 13 Feb 2022 02:39:58 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id q19sm7976500ejm.74.2022.02.13.02.39.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Feb 2022 02:39:57 -0800 (PST)
Message-ID: <f942379b-566a-dc23-b593-968b8613ef83@mind.be>
Date: Sun, 13 Feb 2022 11:39:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Luca Ceresoli <luca@lucaceresoli.net>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <20220203235438.610277-1-giulio.benetti@benettiengineering.com>
 <eff4604f-7630-d8d3-6ebb-dfbef57b8663@lucaceresoli.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <eff4604f-7630-d8d3-6ebb-dfbef57b8663@lucaceresoli.net>
Subject: Re: [Buildroot] [PATCH] manual: board support: add instructions to
 test defconfig in the official docker
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/02/2022 23:56, Luca Ceresoli wrote:
> Hi Giulio,
> 
> On 04/02/22 00:54, Giulio Benetti wrote:
>> Often new boards have not been tested with official docker so let's add
>> instructions to do it.
> 
> Thank you, I think this is a very useful addition to the documentation!
> However I would suggest some changes for it to look more "professional".
> 
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>>   docs/manual/adding-board-support.txt | 22 ++++++++++++++++++++++
>>   1 file changed, 22 insertions(+)
>>
>> diff --git a/docs/manual/adding-board-support.txt b/docs/manual/adding-board-support.txt
>> index 33ed709535..f5fb3af371 100644
>> --- a/docs/manual/adding-board-support.txt
>> +++ b/docs/manual/adding-board-support.txt
>> @@ -46,3 +46,25 @@ create a directory +board/<manufacturer>+ and a subdirectory
>>   +board/<manufacturer>/<boardname>+. You can then store your patches
>>   and configurations in these directories, and reference them from the main
>>   Buildroot configuration. Refer to xref:customize[] for more details.
>> +
>> +Before submitting patches for new boards it would be better to test it
> 
> "it would be better" -> "it is recommended".
> 
>> +by building it using .gitlab-ci.yml specified docker. For example at the
> 
> I think this should be reworded in a simpler way: "by building it using
> the docker specified in .gitlab-ci.yml".
> 
> BTW as I am a docker newbie: is it common to say "the docker"? Or would
> "the docker container" be more correct? -- By comparison, I would never
> say "using the virtualbox" but rather "using the virtualbox machine".

  I would say "the container" since you can use it with any container manager 
that follows the OCI spec.

> 
>> +time of this writing the docker is:
> 
> Remove the ':' from this line, or you'll have multiple ':' per line,
> which looks awkward.
> 
>> +$CI_REGISTRY/buildroot.org/buildroot/base:20220105.2314
> 
> Hm, this string is already old.

  Actually, this part of the documentation is already superseded since we now 
have utils/docker-run that does everything.

> There's no sane way to keep docs and
> .yml in sync. I wonder whether we should have in the manual a command
> line that always use the current string, such as:
> 
> DOCKER_IMAGE=$(cat .gitlab-ci.yml | \
>                 sed -n '/^image/s/^.*CI_REGISTRY/registry.gitlab.com/p')
> docker pull $DOCKER_IMAGE
> sudo docker run -it  $DOCKER_IMAGE
> 
> However I must admit this is not very readable in the docs... :( What
> about adding a simple script (utils/run-docker?) that does the trick and
> just mention that in the docs?
> 
>> +so:
> 
> Add an empty line here, so that the output separates from the next line.
> 
>> +Pull the docker:
>> +--------------------
>> + $ docker pull registry.gitlab.com/buildroot.org/buildroot/base:20220105.2314
> 
> Missing 'sudo'?

  Docker access is usually managed through the "docker" group rather than sudo.

  And if you use podman as docker replacement, it can even be done in an 
unprivileged container. Not that I tried it, but I think so.

  Oh BTW, the pull is in fact not needed, both podman and docker pull 
automatically when you start a container. That's the reason the container name 
is so convoluted.

> 
>> +--------------------
> 
> Add an empty line here. This has no effect on the output but makes
> source code more readable.
> 
>> +Run the docker:
>> +--------------------
>> + $ sudo docker run -it registry.gitlab.com/buildroot.org/buildroot/base:20220105.2314 /bin/bash
>> +--------------------
> 
> As above, add an empty line here.
> 
>> +Inside the docker hint:
>> +--------------------
>> + $ git clone git://git.busybox.net/buildroot
>> + $ cd buildroot
>> + $ make +<boardname>_defconfig+
>> + $ make
>> +--------------------
> 
> As above, add an empty line here.
> 
>> +Wait until build finishes and eventually add host dependencies.
> 
> If I understand what you mean here, it should be "and add host
> dependencies if needed" ("eventually" is not the english translation of
> italian "eventualmente"). If my understanding is correct, I don't find
> this sentence very useful: a docker newbie perhaps doesn't know how to
> add a host dependency (and maybe not even how to understand that they
> are missing one).
> 
> I would just remove this line, but if you think it is very important I'd
> clarify it, maybe with some examples.

  Yes, I think this is what triggered the addition of this documentation. If you 
have e.g. libopenssl-dev installed on your build host, then you usually won't 
notice in your test builds that a dependency on host-openssl is needed. So test 
builds should be done in a minimal container.

  Unfortunately, the buildroot/base container is not exactly minimal. It's 
really what is meant to be used for running CI tests, not exactly what is needed 
for build tests. Ideally, we'd have

- an absolutely minimal container that can be used for build tests - ideally in 
a couple of variants for different distros;
- a container for CI;
- a more complete container you could use for development, though I can't 
immediately think of extra stuff you'd want in there (but then, I wouldn't use a 
container for development).


  Regards,
  Arnout

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
