Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40BD3C47DD9
	for <buildroot@archiver.kernel.org>; Wed, 27 Mar 2024 21:59:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA182811AA;
	Wed, 27 Mar 2024 21:59:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id igUitRtq-tAZ; Wed, 27 Mar 2024 21:59:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0CAF8208F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0CAF8208F;
	Wed, 27 Mar 2024 21:59:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6DEDE1BF279
 for <buildroot@lists.busybox.net>; Wed, 27 Mar 2024 21:59:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A83140903
 for <buildroot@lists.busybox.net>; Wed, 27 Mar 2024 21:59:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GX6xHI5LKFQl for <buildroot@lists.busybox.net>;
 Wed, 27 Mar 2024 21:59:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CE7FA408FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE7FA408FF
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CE7FA408FF
 for <buildroot@buildroot.org>; Wed, 27 Mar 2024 21:59:50 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-341b01dbebbso193043f8f.0
 for <buildroot@buildroot.org>; Wed, 27 Mar 2024 14:59:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711576788; x=1712181588;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gO/w69yNofijvtnWnjuJkUMGo1MfwPjmz7izm3rJ2lM=;
 b=nBqp1fsTr6AAHtWSsZql31OWHT5YABf7UrKLtlywVGW3CHmCWyCPE2KJLpQyMFkMmf
 gf9JiDXSwvyd0StOn78TuFi6GL75GcQLV+uiF+KSobRbu/InAkPlhLyMKX8pWQko6nKU
 Vqv5vLS/kk8rvD8RoYw7Dbl4O7gyjYHp8IOKPypkoKrOXgJHqdqn2G64sb0PZGGDRfyN
 u2DNGkNufTSncro4JWtpp+T5/H8G6jOKr7qNeSPbWCq8/jzTlsSDtuV6pfxCKRslGoZ+
 vpdl8I8/VD6aMhRk3vyXi6RlZLRLxr0gBbhUXjFlgKmLxmfEBC7wkKrb3svmR8Ee1P1s
 r0YQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAf3/GLfRV65xaKKLm3Pmhm4ZA3x/jyj0zuNu/hdqEA6+OSB229KElL8+fCm2u5ysHlg9GrCsdXKbcynS9p2Z+/QUcLaSRmg==
X-Gm-Message-State: AOJu0Yz7ZQJloven+PpbQsJ4qSOw3UwoJ9XFmF/Yq5o0k0cNRSC2ZtFB
 einIgpNsYS32emL+BtK/gGvVmmGp+DbSqbIjxq2EYOe3rUBEGH4ekuBtPb/kTl4=
X-Google-Smtp-Source: AGHT+IEUNYkOZq0ye+UnBFoHkBCqj9pqiJIsb1O1KPsC/s6zf6gSQx5eqUTkHpt4uqAuhQhmutNEag==
X-Received: by 2002:a05:6000:1ca:b0:33e:c264:8ad2 with SMTP id
 t10-20020a05600001ca00b0033ec2648ad2mr1072773wrx.59.1711576788386; 
 Wed, 27 Mar 2024 14:59:48 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 y13-20020a5d4acd000000b00341e5f487casm84168wrs.46.2024.03.27.14.59.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Mar 2024 14:59:47 -0700 (PDT)
Message-ID: <746c9f33-197b-4004-a02f-4c95fdacab85@mind.be>
Date: Wed, 27 Mar 2024 22:59:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240213211512.3918044-1-james.hilliard1@gmail.com>
 <20240213211512.3918044-3-james.hilliard1@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240213211512.3918044-3-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711576788; x=1712181588; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gO/w69yNofijvtnWnjuJkUMGo1MfwPjmz7izm3rJ2lM=;
 b=EsHiaJ3Ukhs/IHy2O5e8Pec9CD59yL5XNR9sodoEApNiRelYPUMDBEnn9j0trohlwz
 MvLxgxmWUbKiF9vg3/Xtbh30i8a8LrPlfgoURKoZbKSByH5Jx7uKmA1jDS+G3UJtRbeA
 QLFiAcWp+TMMQju6qlN9WPjlb4+N3BcoMVlfcfd3cn1SxTsGJuTVuJX2CEoLZY+mUEgJ
 w5rAV2eIvlhZhbhHkadYSIbjbOjoXnZAqmIsyST2kdYVZPkG8b7fJxw+lFT7OxDkZzy3
 hKUEHHAUGyTreos05hjTtQnIBEu5xBQ90uZgy6yWrW8IVpictV8MQAPNDhBQ43shjr3v
 0lPg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=EsHiaJ3U
Subject: Re: [Buildroot] [PATCH v8 03/26] package/python-setuptools-rust:
 add host setuptools-scm dependency
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
Cc: Geoffrey Ragot <geoffreyragot@gmail.com>,
 Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Gustavo Heinz <gustavo@gsthnz.com>,
 =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 Attila Wagner <attila.wagner@onyxinsight.com>,
 =?UTF-8?Q?Fl=C3=A1vio_Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Louis Aussedat <aussedat.louis@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Joris Offouga <offougajoris@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Christian Kellermann <christian.kellermann@solectrix.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Lionel Flandrin <lionel@svkt.org>, Mauro Condarelli <mc5686@mclink.it>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/02/2024 22:14, James Hilliard wrote:
> We need host-python-setuptools-scm for python-setuptools-rust to build
> correctly when using a pep517 frontend.
> 
> Fixes:
> * Getting build dependencies for wheel...
> running egg_info
> writing setuptools_rust.egg-info/PKG-INFO
> writing dependency_links to setuptools_rust.egg-info/dependency_links.txt
> writing entry points to setuptools_rust.egg-info/entry_points.txt
> writing requirements to setuptools_rust.egg-info/requires.txt
> writing top-level names to setuptools_rust.egg-info/top_level.txt
> reading manifest file 'setuptools_rust.egg-info/SOURCES.txt'
> reading manifest template 'MANIFEST.in'
> adding license file 'LICENSE'
> writing manifest file 'setuptools_rust.egg-info/SOURCES.txt'
> 
> ERROR Missing dependencies:
> 	setuptools_scm
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   package/python-setuptools-rust/python-setuptools-rust.mk | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/package/python-setuptools-rust/python-setuptools-rust.mk b/package/python-setuptools-rust/python-setuptools-rust.mk
> index f07263becf..e664a5604f 100644
> --- a/package/python-setuptools-rust/python-setuptools-rust.mk
> +++ b/package/python-setuptools-rust/python-setuptools-rust.mk
> @@ -10,6 +10,9 @@ PYTHON_SETUPTOOLS_RUST_SITE = https://files.pythonhosted.org/packages/f2/40/f1e9
>   PYTHON_SETUPTOOLS_RUST_SETUP_TYPE = setuptools
>   PYTHON_SETUPTOOLS_RUST_LICENSE = MIT
>   PYTHON_SETUPTOOLS_RUST_LICENSE_FILES = LICENSE
> -HOST_PYTHON_SETUPTOOLS_RUST_DEPENDENCIES = host-rustc host-python-semantic-version
> +HOST_PYTHON_SETUPTOOLS_RUST_DEPENDENCIES = \
> +	host-rustc \
> +	host-python-semantic-version \
> +	host-python-setuptools-scm

  I've taken the occasion to also order the dependencies alphabetically.

  Applied to master, thanks.

  Regards,
  Arnout

>   
>   $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
