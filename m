Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5861EC433EF
	for <buildroot@archiver.kernel.org>; Wed, 16 Feb 2022 21:33:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E57D58133E;
	Wed, 16 Feb 2022 21:33:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MisrqAZ4jXqB; Wed, 16 Feb 2022 21:33:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14351812CC;
	Wed, 16 Feb 2022 21:33:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9FDD91BF5A9
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 21:33:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8E22B607A4
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 21:33:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id syxbuAT2J1Ca for <buildroot@lists.busybox.net>;
 Wed, 16 Feb 2022 21:33:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5444260777
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 21:33:43 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id f17so6229111edd.2
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 13:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=sEcoPgA8GQddzkc3SO0AICXHa//xA+earEpkQJk7+O4=;
 b=URll0dvfnl7M1VDGOZLE7zwNfzYxPTsDDCxUHA0yb75MK3kfd0ebp4CeQVAwTcHrcO
 6VonrFDZBMnK4242xuALyylxCMDCaU9dN2nehC7J7xheBBHwlXAj99ADqZaiwI5tv6e9
 FtKWjJaRfyHrcAwG3I8g644LhsKPU2j9TgMSij+9jPrKdb7LlUCknxXN+eCiKZAgDB/M
 od31k4SwGbJD1v4KS/4RhqKp6TcFgfhTB84KB7KQpCOUGWhnKIZpvPcXfJSQgDYoWO3M
 lNNI87kLPxmk9UBtyA3WOQIt9txwSNWTO6jrqW6JtZtaOemXAfY+l1r0NwqrBqIhGdiA
 U6oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=sEcoPgA8GQddzkc3SO0AICXHa//xA+earEpkQJk7+O4=;
 b=de5tDK90DPLNA7KYQg03ka6Js5CNQw3Z9cw9A7wNVGvd8ROIvFwg2N2p7HrLkqZsXt
 /Tx6djZo038OF2P2CeJcBeVVDBvvtkMjBidiws2cRFnEenizSqGTIf3nPHUS5JgnM60k
 ECK7jjA8ZR4XveW8di8WWsDUFejkOkp7SmkN2Q1V2uwi9yWe/orU0Hd5/j82MwmSLO2Y
 CBcOp0bnSJzXCV7dIfeJYMSvfyYujItqEU5Zf+QnoMk9r0NC74n0FTTXAOUK8ot8ljyg
 /QUPj24odTZBucbuDqQtKb/D+7w0X+20JRLX1vYFDfDIH/AMcnwy6mP6/r+DsAMhZnIO
 8oPg==
X-Gm-Message-State: AOAM531qAyS2GzdpW7QK0/5IM1aipJf4e/YpT3PzapCEBUX8099/x/uf
 0cSk2arlMvqfPLdrcHbrXUsS3I/0f0wLgw==
X-Google-Smtp-Source: ABdhPJxbUehfTTvt7Fl3i+mFUno5GSiGQ/ljj9y8ml3Q8mwOwr8cZl+1wOI34dQtwcJVXetaMw0JdQ==
X-Received: by 2002:a05:6402:5108:b0:410:d312:924 with SMTP id
 m8-20020a056402510800b00410d3120924mr4965265edd.430.1645047221608; 
 Wed, 16 Feb 2022 13:33:41 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id k7sm352643eje.162.2022.02.16.13.33.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 13:33:41 -0800 (PST)
Message-ID: <560f93f2-ed19-309b-7d90-84213a3b75ed@mind.be>
Date: Wed, 16 Feb 2022 22:33:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <20220214203909.251924-1-yann.morin.1998@free.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220214203909.251924-1-yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH] utils/docker-run: improve user experience
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
Cc: Luca Ceresoli <luca@lucaceresoli.net>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/02/2022 21:39, Yann E. MORIN wrote:
> Currently, the docker-run script starts a container based on the
> reference image, in which the user has UID:GID set to 1000:1000,
> which may or may not be the same as local user uses, which may
> prevent the commands in the container from creating files, which
> foils the plan of using the container to run a build...
> 
> Additionally, the paths in the container differ from the paths
> the user expects, as the current Buildroot tree is mounted over
> the in-container user home directory. This is a bit confusing...
> 
> Finally, the container is left hanging around after the command
> finishes, and thus there are as many lingering containers as the
> user runs docker-run. This is not very nice...
> 
> We fix all of that (yeah, should be different patches, but meh):
> 
>    - we use --mount instead of -v, which allows us to bind-mount
>      the Buildroot tree at the same place in the container, as
>      Docker will create the destination if it does not exist, while
>      -v seems to expect it to exist [0].
> 
>    - as a consequence, we can also set the working directory as the
>      Buildroot top-directory;
> 
>    - use --user to force the same UID:GID in the container as the
>      local user, so that files created in the container belong to
>      the local user, and so that files from the local user are
>      accessible from the container;
> 
>    - use --rm do remove the container once it terminates; starting
>      a new container is very quick anyway, so it is as good as
>      re-using a previous container.
> 
> [0] the documentation is not clear about that. It clearly states
> that the host directory (i.e. the origin, the source) is created
> if missing, but it says nothing of the destination:
>      https://docs.docker.com/engine/reference/commandline/run/#mount-volume--v---read-only
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  Applied to master with the typo fixed, thanks.

  Regards,
  Arnout

> ---
>   utils/docker-run | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/utils/docker-run b/utils/docker-run
> index 2bca8d8e3a..bdbc979264 100755
> --- a/utils/docker-run
> +++ b/utils/docker-run
> @@ -7,4 +7,8 @@ IMAGE=$(grep ^image: "${MAIN_DIR}/.gitlab-ci.yml" | \
>           sed -e 's,^image: ,,g' | sed -e 's,\$CI_REGISTRY,registry.gitlab.com,g')
>   
>   set -x
> -exec docker run -v "${MAIN_DIR}:/home/br-user" -it "${IMAGE}" "$@"
> +exec docker run -it --rm \
> +    --user $(id -u):$(id -g) \
> +    --mount "type=bind,src=${MAIN_DIR},dst=${MAIN_DIR}" \
> +    --workdir "${MAIN_DIR}" \
> +    "${IMAGE}" "${@}"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
