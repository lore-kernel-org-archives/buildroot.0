Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6631C02193
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 11:37:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65AD560814;
	Mon,  3 Feb 2025 11:37:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RoSA2UllTxFr; Mon,  3 Feb 2025 11:37:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 841CC6081A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 841CC6081A;
	Mon,  3 Feb 2025 11:37:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 814471A1
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 11:37:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D9BE6081A
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 11:37:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FEDJb4euAOtO for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 11:37:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 83E0C60814
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83E0C60814
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 83E0C60814
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 11:37:24 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-38a25d4b9d4so2155598f8f.0
 for <buildroot@buildroot.org>; Mon, 03 Feb 2025 03:37:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738582642; x=1739187442;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XAJy7cv7ESVZYPXCLEcYxv5FOCU+ER3tSk/VbrI/hXw=;
 b=cMw6f7E6rsit+mEZNaZwvjvoL5tI6gmItQQzumuZTaMGhC2y+YKzteZbys3dfNXTzJ
 hK3Hp1/tvrUzX9nuREc0jO1nXrUieHZUR/jcUMOvbTUNzH91sqUzkN92mr+wuQj/tCUK
 i8anDiuwpu/y42V+yMom3Z0jF8HGUeprFnnfpdZDba79GjNEoSHwm8/1cAteoG+Xhx96
 AjyibKQIdxx2AlIqY0q4jDo1Sh55Cw/KrtTAYdxjk+iq3Uj8Jdi7pt8oFkCUswS7eVli
 9MISjDSTenTz8L1CNFfKZLsRdn4cL/Dtx4Rwv0FRsLHOZJ82LG87LwP8PokeUUpd8RUk
 V21w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXX7GqOtSnrpX5KWCw5I8QUw/0JIWggTGL3JtmeSBlH3wNpigV2K1nnm0jZ4Lk2XgoQwXk5u8LuliQ=@buildroot.org
X-Gm-Message-State: AOJu0YzEYu3GQCqUfI15m9L1HKWOqHcxeV0nWKNdo6HLwieDVkw+jnj+
 1jlXSHZCRIBFxGiWMNwBN9RwPK5KOhn8EWU85I6f9CHtBC2SxZQJueMMvq3upGs=
X-Gm-Gg: ASbGncsdXPcgG7t2b9LwKvTlgG1WUJM8+OW+0tSwDfx6552/RLVIzcOtVXJBI75xzsK
 Zhv20qIV4BdTTVYFxDricb9USrh42aD6WP05bQ8stmY03XbgKB0d79qttCEQ5YTQ0YCJ/yUKzQ8
 ezhnEXm1XjCoE5Vnw0dNgYrkkJHgnbrt9Hx4RtIsTxzaNkegA35uYku+VDfY2otbwsUmOFBxJsb
 5g3mUiNlPY8Cn++WaKD3/HgoBIiBYt4w2fRugx/+ObVNnX8fNZGTQqUpnVovEgYPWm5B1ljNDQt
 TAu9JZx260MPPRlLr5pdclh03sAZdDsNktDSqZvK8Vqxrns=
X-Google-Smtp-Source: AGHT+IEvVTdUfTT+Lb1w1Legt4wEXLL2u52r/s1KeIsQZHYnSkH5/hUDrTXpT4LqxvI7KmSS+z1EXw==
X-Received: by 2002:a05:6000:1f87:b0:38a:88bc:ace1 with SMTP id
 ffacd0b85a97d-38c520965abmr17151809f8f.34.1738582642304; 
 Mon, 03 Feb 2025 03:37:22 -0800 (PST)
Received: from [172.16.2.111] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc27125sm185259675e9.15.2025.02.03.03.37.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2025 03:37:21 -0800 (PST)
Message-ID: <9b44f888-b884-4de8-9737-a16bf481d1c4@mind.be>
Date: Mon, 3 Feb 2025 12:37:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Liam Hupfer <lhupfer@xes-inc.com>, buildroot@buildroot.org
References: <0682724078f4516c3f7992d4c16588a5d1381013.1731702127.git.lhupfer@xes-inc.com>
Content-Language: en-GB
In-Reply-To: <0682724078f4516c3f7992d4c16588a5d1381013.1731702127.git.lhupfer@xes-inc.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1738582642; x=1739187442; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XAJy7cv7ESVZYPXCLEcYxv5FOCU+ER3tSk/VbrI/hXw=;
 b=e0/XbFGz6GME/I4Qfj9WFatjAApe6ZzO+CXZQDmzSVWyOinblRvRINft81807d1oIs
 jZLjadsFmd3FdVWyuTJ9b3tVN6VEW+wpHFy1j0IdPESQP4KC1yL+gMW8/JCppPUzuD0+
 IKLl7Jk03wzG1G6Np4551bhEGTOXeyti0+b6A0G9olV0hETGSVr7VoPqqCgn0IQ8Ahxx
 GTaHC2X1v87rB4mlGc5j/+GOu995xogt6TfmazVOYHqEVE+QSOa6a8CKUo6afKiOmWS1
 NUXKxXV9V8qdq2uN1yhM6SSNjEANSw7qwZa33jXxM8ixdMAOmMVQQ8Q0eV/ImQojkxOb
 pA9A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=e0/XbFGz
Subject: Re: [Buildroot] [PATCH] package/python3: select host Python 3
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

  Hi Liam,

On 15/11/2024 21:23, Liam Hupfer wrote:
> Building Python for the target requires host Python via
> PYTHON3_DEPENDENCIES. Host Python is exposed as a standalone Kconfig
> option, so when BR2_PACKAGE_PYTHON3=y, it is possible for host Python to
> be built even when BR2_PACKAGE_HOST_PYTHON3=n.

  We have plenty of host packages where this is the case, and it's not practical 
to do this correctly for all of them (cfr. e.g. BR2_PACKAGE_HOST_CMAKE which 
would need to be selected for all cmake packages).

  However, in this particular case, there is a good reason to do the `select`: 
host-python3 has sub-options, which means that a package that requires one of 
those sub-optoins needs to add the select, which is also annoying.

  Therefore, applied to master, thanks.

  Regards,
  Arnout

> 
> Select host Python 3 via Kconfig to expose why it is built, similar to
> libffi.
> 
> Signed-off-by: Liam Hupfer <lhupfer@xes-inc.com>
> ---
>   package/python3/Config.in | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/python3/Config.in b/package/python3/Config.in
> index 38f0580aa4..cfc08bad86 100644
> --- a/package/python3/Config.in
> +++ b/package/python3/Config.in
> @@ -11,6 +11,7 @@ config BR2_PACKAGE_PYTHON3
>   	depends on !BR2_STATIC_LIBS
>   	select BR2_PACKAGE_LIBFFI
>   	select BR2_PACKAGE_BLUEZ5_UTILS_HEADERS if BR2_PACKAGE_BLUEZ5_UTILS
> +	select BR2_PACKAGE_HOST_PYTHON3
>   	help
>   	  The python language interpreter.
>   
> 
> base-commit: d571951c67d63824fcdf96cba8b59c80876a827a

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
