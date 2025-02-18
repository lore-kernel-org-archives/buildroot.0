Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22881C021AD
	for <buildroot@archiver.kernel.org>; Tue, 18 Feb 2025 20:23:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACBFC83670;
	Tue, 18 Feb 2025 20:23:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LbWZbhYxoEh3; Tue, 18 Feb 2025 20:23:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C276483668
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C276483668;
	Tue, 18 Feb 2025 20:23:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F745C8
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 20:23:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6420383668
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 20:23:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KAcc1Mkf-izT for <buildroot@buildroot.org>;
 Tue, 18 Feb 2025 20:23:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AE0BF8364F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE0BF8364F
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AE0BF8364F
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 20:23:31 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4398e3dfc66so18410935e9.0
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 12:23:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739910209; x=1740515009;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sF73iI6uSQQEYgq+L8dkBF6hgO7mUmlykDZeG/0q/pk=;
 b=bntIu2HLv73gobPc89MvQVUK4wczWo16MB8LHo0L0YrXxpTHQ7iM92lJ7FjeFx3wXg
 wF5oT7IHD5jGsqL9bVCkQmyRu1bv/1Dqu0MK8pAdbEQoTzXr9nKAOzKfhyYk1ZHAvn3D
 uGD+GSjVisz2da5KjegUIwDo+KiA5HjZduPoMDjzyONdr2HHLw7K/H/A2yH+LF8uhgSY
 V6lCo/6zxMY1WrQXNfSut1ot8PcZplnOMg/k/qUzo94udA+uY+8jZ9dCY7VoPNgtonYh
 ivtNyNtorAhzM7NozsToXycqzVuRB3gkL3W8MMbKH+CR+Q/lytEPRVhY4oD6XBsJGYjl
 u19g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXN2LWxCayoUJ76BHVb1tq87UquFDJPhW+BmhdyjZXkAfc0IupnANOCvyleTNfIf/6m3lu6k+fw95Y=@buildroot.org
X-Gm-Message-State: AOJu0YytYFdux7g/+uiwG/6xqWufv6CRzd0obntqVIrF/21qNCmmWPgA
 G2hE40Xh3T8PY0t1oeHwR/nxcQkONfiLV6FKbvs3VwVYErpbTQMO+ng1EQYYsyU=
X-Gm-Gg: ASbGncs3e+rCCIzbYJajVtaj9U1S6HKwP4hR/377VoDzLIVpC1GUO+k2Seq89saOf1A
 awRDzyFRkXLwXd+Zc+uZ5AiT+qiw8OaTSUSEaZou14pgnO2ML24dKiNUhA2tCrXNAjvzePOIJ6t
 XRVYL/PBo9XukTo54qW3rm904dIE/LysLVxmv9cBj8rH3scl2U+t4LJm+XT6JqUUO0nNz0bkyeF
 SaaunqKhWrfD6+Ri/4k8SBhGCXNppApJOHoOq7eNRqftmkcBYxc/Pst73UzSWRPv6Slq/sGAVwj
 dTOEgwt/yikVRryioNjPHTC5uaUJcgLb0WW2oTGEfzXP8mA4URTIjaBuIixTEw3Y84He4QKYZoi
 9Jqs3ciWNZ/WFAK9WFHq5PWPuTLpgLvhA22wigD9bDkX4GQ==
X-Google-Smtp-Source: AGHT+IGx/V7OWTdH3qaGEC/xKXKPooIoimQ5kOld9wyuMvfQ7SrP6Vgu0YEl1XLULru95tfoMfiXXA==
X-Received: by 2002:a05:600c:5124:b0:439:6ab6:5d45 with SMTP id
 5b1f17b1804b1-43999ddae20mr9735305e9.28.1739910209472; 
 Tue, 18 Feb 2025 12:23:29 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259d8dd6sm16103393f8f.62.2025.02.18.12.23.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Feb 2025 12:23:29 -0800 (PST)
Message-ID: <17855b40-bee0-483b-b8ea-e346a7401f9f@mind.be>
Date: Tue, 18 Feb 2025 21:23:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Julien Olivain <ju.o@free.fr>, Fiona Klute <fiona.klute@gmx.de>
References: <20250216170350.397879-1-yann.morin.1998@free.fr>
Content-Language: en-GB
In-Reply-To: <20250216170350.397879-1-yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1739910209; x=1740515009; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sF73iI6uSQQEYgq+L8dkBF6hgO7mUmlykDZeG/0q/pk=;
 b=Ol0uAxXhx2myfsEBC9a2ynM4H44iJ3HOvLz99/8eZCjChilpWf1wTr3m/dwMAkEFEH
 I4LkpnrWgResLLlj8wgpFCppE1iNXH/+LCrpebYSZOTUpLKPd9EiEoO82/ZAefSS2Ahg
 xNK+blHgNpJO+A51W8bTIILAkcG1NYY9vbIVMvoNuYm6TkllJB9tcE1FzsgLs43dGamk
 NSLr5hW5PmwJJTk+6XaZNtXXMMCaQ1VM+AqI/fUxhcm9AdMcs28G79EVlzBPOczoHqky
 R6Rc6CLq0GGpYrwAXGCTouvF2edhWnSUCfU6VWt/gjR+bCHSRQ8yXjv9W0UX4TGfUIV1
 bsVg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Ol0uAxXh
Subject: Re: [Buildroot] [PATCH] utils/docker-run: allow explicitly setting
 of docker/podman/...
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 16/02/2025 18:03, Yann E. MORIN wrote:
> Currently, our docker-run helper will decide on its own whether it
> should use docker (preferred) or podman (fallback). s introduced in
> 9a629f5129d6 (utils/docker-run: allow running with Podman). In case
> both are installed, it is not possible to exercise the podman case.
> 
> Allow the user to force the one to use, by setting the BR2_DOCKER
> environment variable. If that is set and does not exist, exit with
> an explicit error message (rather than rely on the failure when
> eventually exec-ing the specified command).
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
> Cc: Julien Olivain <ju.o@free.fr>
> Cc: Fiona Klute <fiona.klute@gmx.de>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   utils/docker-run | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/utils/docker-run b/utils/docker-run
> index 849df66d54..27c169db72 100755
> --- a/utils/docker-run
> +++ b/utils/docker-run
> @@ -35,7 +35,14 @@ declare -a mountpoints=(
>   # compatibility command.
>   export PODMAN_USERNS="keep-id"
>   
> -if command -v docker >/dev/null; then
> +if [ "${BR2_DOCKER}" ]; then
> +    if command -v "${BR2_DOCKER}" >/dev/null; then
> +        DOCKER="${BR2_DOCKER}"
> +    else
> +        printf 'ERROR: Command "%s" (from env BR2_DOCKER) not found.\n' "${BR2_DOCKER}" >&2
> +        exit 1
> +    fi
> +elif command -v docker >/dev/null; then
>       DOCKER="docker"
>   elif command -v podman >/dev/null; then
>       DOCKER="podman"

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
