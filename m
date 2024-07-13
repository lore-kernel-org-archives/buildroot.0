Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 960D5C3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 14:37:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE445415DB;
	Sat, 13 Jul 2024 14:37:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MITfFoclCEWC; Sat, 13 Jul 2024 14:37:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65CDC41588
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65CDC41588;
	Sat, 13 Jul 2024 14:37:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 93ACE1BF41B
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:37:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 87DF58208F
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:37:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LsjvlqZubZT4 for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 14:37:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3DB4980F6D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3DB4980F6D
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3DB4980F6D
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 14:37:04 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4279c10a40eso16792395e9.3
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 07:37:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720881423; x=1721486223;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=27YDNnV6sadurXbc1CGg2SUvv0w2b/WTor5yUs5oNPA=;
 b=lEpqkZ+MAb+qmus9nPdKgNkoBvQAjee5/pWad/xvnjPgMhI7dbUArOrcg7mFuJ+nJG
 JWmj24tZvM8zUBZ5I26zCfVvM0SXIxfYlGBD/78doCwKTb1P0wxAeTwwDYnDBOfPz6Ts
 EhKBsNqGhjK2Mpe431Nf7l5dslob7EhFZIwgyKIe4PsM0CecPNhcZ18njALit2AuFpBt
 WRGob8wrh++w9vsUYcvsBNXvQUW+ij/Cze4/6JJE1nuCnAbl7AZhEHHYvUcDk3spSfoK
 cFyMRO5hKGvug3Hjyn973S2kPf9zfV+GDTiprBTpAhdQERZXXR+CQtGS8QByYEkwpVz8
 TEUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCLfXC4h1RupO+d8lKHZXgeeAiqSYZwt1OSbKD/nVyb8CNYNEB1/zDOGAGDbBikFlUjWoQdYUHmOIJDkZGwNt40eEkXxTfNA==
X-Gm-Message-State: AOJu0YxwqbNbv8lCOmINfgLzbUUclkzOg5xY50iEoSI0R2cw+//hii0D
 xa6kuOPzX0Qst1OpKTlyZWLk39mexkywb1OC4yyusDepwFQsoARS5ge370itzfAh4LQlJ7Dfuzy
 Ejdc=
X-Google-Smtp-Source: AGHT+IFNs3QJ/hhIzloHFCrFcvNM7/5WvgGygSYSTcmDrGiDYlxauFpdjE09xQhh+cZ+9gTNAAd+vw==
X-Received: by 2002:a05:600c:5347:b0:426:597d:d8d7 with SMTP id
 5b1f17b1804b1-426706c63a4mr92516175e9.1.1720881422724; 
 Sat, 13 Jul 2024 07:37:02 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680dabf151sm1556080f8f.29.2024.07.13.07.37.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Jul 2024 07:37:02 -0700 (PDT)
Message-ID: <ae7df766-114c-4b14-82ba-54528af7edc1@mind.be>
Date: Sat, 13 Jul 2024 16:37:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
References: <20240713115244.848755-1-fiona.klute@gmx.de>
Content-Language: en-GB
In-Reply-To: <20240713115244.848755-1-fiona.klute@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720881423; x=1721486223; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=27YDNnV6sadurXbc1CGg2SUvv0w2b/WTor5yUs5oNPA=;
 b=hEzmSFpVg06XVeRLZaSq+E2gPZLQp7HgrOGkifM4Z/29SnDHxg/6Gzh8pf68F4eTRj
 Og1xqbz1dPdjgsCRrywCevKlR+P0x5WvbSq2w/77mu4Ncs67j5QXS49qSM+p8wyvtHDZ
 jLsOTeBbs6o+utO3oV/cw36VXG7xnjmF+bvMZjRuFRkfNlxXcXJEWg0KEaQznkGZnJAw
 6Jhcb5o3ABl9DmTrchqCj5iWg5sDOcJgpumNwHBh0Hi+lQmwy/it1bja02Tsy01TH3g6
 kDN+w9UcCcKjS30F91Ph9QxcTHZQisGAMQhLrqbaXzDJGk2MVSQYH6/CLinkuzxtkQHl
 ggrQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=hEzmSFpV
Subject: Re: [Buildroot] [PATCH v2 1/2] utils/docker-run: mount and pass
 BR2_EXTERNAL dirs
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
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Brandon Maier <brandon.maier@collins.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Fiona,

On 13/07/2024 13:52, Fiona Klute via buildroot wrote:
> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> The BR2_EXTERNAL environment variable is passed into the container,
> and each path listed in it mounted. This allows using external trees
> when running a build using utils/docker-run. Testing the existence of
> the variable instead of a non-empty value allows passing an empty
> BR2_EXTERNAL variable to disable currently set external trees.

  I haven't looked at your patches yet, but I had a series prepared (that I 
apparently forgot to send so I just sent it out now with your in Cc) that has 
the same purpose. Perhaps you can see if there's any commonality and which 
approach of the two works best. I already forgot how my approach worked so I 
make absolutely no claim that it would be better.

  Oh, now I see that they're in fact complementary - I don't handle BR2_EXTERNAL 
as a variable, and you don't handle calling docker-run from an output directory 
that already has the .br2_external.mk file. So they're complementary!

  Regards,
  Arnout

> 
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
> ---
> Changes v1 -> v2:
> * Correctly handle spaces in external tree paths
> 
>   utils/docker-run | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/utils/docker-run b/utils/docker-run
> index 1adb02d74e..8024c2d3a3 100755
> --- a/utils/docker-run
> +++ b/utils/docker-run
> @@ -90,10 +90,21 @@ if [ "${BR2_DL_DIR}" ]; then
>       docker_opts+=( --env BR2_DL_DIR )
>   fi
> 
> +if [ -v BR2_EXTERNAL ]; then
> +    IFS=":" read -r -a br2_ext_arr <<< "${BR2_EXTERNAL}"
> +    for br2_ext in "${br2_ext_arr[@]}"; do
> +        mountpoints+=( "${br2_ext}" )
> +    done
> +    docker_opts+=( --env BR2_EXTERNAL )
> +fi
> +
> +# dir names might contain spaces, so split only on linebreaks for this loop
> +IFS=$'\n'
>   # shellcheck disable=SC2013 # can't use while-read because of the assignment
>   for dir in $(printf '%s\n' "${mountpoints[@]}" |LC_ALL=C sort -u); do
>       docker_opts+=( --mount "type=bind,src=${dir},dst=${dir}" )
>   done
> +unset IFS
> 
>   if tty -s; then
>       docker_opts+=( -t )
> --
> 2.45.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
