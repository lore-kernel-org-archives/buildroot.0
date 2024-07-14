Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC7A9C2BD09
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 07:45:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 758C881158;
	Mon, 15 Jul 2024 07:45:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5HnoAD5aVkDJ; Mon, 15 Jul 2024 07:44:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE54C81098
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE54C81098;
	Mon, 15 Jul 2024 07:44:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 744781BF2B9
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 07:44:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61045403B5
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 07:44:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gcw7GacfYAEb for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 07:44:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::133; helo=mail-lf1-x133.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3C03D403A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C03D403A1
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3C03D403A1
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 07:44:34 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-52e98087e32so4659168e87.2
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 00:44:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721029473; x=1721634273;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J82trq+P/0qlr7kr8HWHrRVpr/wKNFqeguaSnymDxc4=;
 b=HLpbdYYRgP2w57SDaFxNMadCtqxY0n68xC8EGl3mcL36V+oN7TTzXsPPPYaScE/xyN
 Y/i7hcjVQHXa7ikRbMXEQJR7hhhFPxO+WgLJ/LqiNVAGnEG5Wuj+/9GEmtrYPspSkdMm
 UQ16o5lZgyfPjUzGQKY7qU1nlwoZzjRNpohCHAwW1Rj6bo3Zcw+hdUBxQrXq/2lS30ba
 vT7gml1fsvh5cXxQGRPuoGVgNh3z584f986PpkEEWsIP6CXqtVGmVFG+pWeqX3B7pTB7
 K/89FZh7zqCnoeXs/EHvanabsdfi9rb9pfgce4PVrUMxmeWNEYJkx6TVvuMzjvhXuluO
 FM9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwxh/wbauEPc/wtaUCH6nBiXeQqNp/3W6jIhBMDg27MpcpPow53ZBfAzedNydOKwg44j59w3D7wTNHbQT9j3RXeBC71GGaXw==
X-Gm-Message-State: AOJu0YwJqmXCQ2lXA5CPeTga1e0EGuqLAzvocakk6t6dUD0KMCpzmPHF
 1TgHEQy7QI+zqTT3Md3lf565MbiGGB7vujyL6k2AxB/2nA0Hu2otoXyoFoC7e+A=
X-Google-Smtp-Source: AGHT+IH3oxXForgVmFgfrSejLpDBrWc/FtB3JifIrWeByxJxKGEl1W8NeQO/6Yf3KLt9AmF+f562KQ==
X-Received: by 2002:a05:6512:ea8:b0:52e:7b75:7ca7 with SMTP id
 2adb3069b0e04-52eb99d28f8mr12961517e87.61.1721029472776; 
 Mon, 15 Jul 2024 00:44:32 -0700 (PDT)
Received: from [10.3.160.38]
 (laubervilliers-656-1-158-76.w82-127.abo.wanadoo.fr. [82.127.106.76])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427a5e7751asm75899585e9.3.2024.07.15.00.44.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jul 2024 00:44:32 -0700 (PDT)
Message-ID: <4c379f7e-52e3-4c83-b85b-fb3ecfe01cad@mind.be>
Date: Sun, 14 Jul 2024 22:50:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <cover.1710027863.git.yann.morin.1998@free.fr>
 <e792b64d76fdc94756698d5c757a545acf418b53.1710027863.git.yann.morin.1998@free.fr>
Content-Language: en-GB
In-Reply-To: <e792b64d76fdc94756698d5c757a545acf418b53.1710027863.git.yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1721029473; x=1721634273; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=J82trq+P/0qlr7kr8HWHrRVpr/wKNFqeguaSnymDxc4=;
 b=aVzCsP4TUljM8xHjZVyqNywj3UkX589gaLJnWXFBEKZC0vph7U7ijLyrGtUEHqAGx1
 X+Y7Dc/pfFfec+aOK64DlIcy8rEkDkNjhNIpzRF1JTXDSoj7R8U2Gp+0U6RbGD2hxCQd
 5UkxK9dHlbpc4Ccvau4ESZdf8i/AhxVWmRNCdh7+oKFr03t/IOFKsbygw0odGDtvrUtj
 piCrs4rHC2EumtajlPI0Mtnq/RnsE/wWxpeQ/oGjsB/aiFNuT/tiSN4rBetyzpAX0bp5
 87P1u9Egr9hTrHPeRJB5eFYBWR4IR64jm/hFDBB5p+1hdpHgm7GrzmEe572QKKZuf7li
 0tFA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=aVzCsP4T
Subject: Re: [Buildroot] [PATCH 3/5] support/scripts/mkusers: accept user
 tables without terminating \n
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10/03/2024 00:44, Yann E. MORIN wrote:
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

  Applied to master, thanks.

> ---
>   support/scripts/mkusers | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/support/scripts/mkusers b/support/scripts/mkusers
> index ee09bbd1f2..08f3344518 100755
> --- a/support/scripts/mkusers
> +++ b/support/scripts/mkusers
> @@ -409,9 +409,8 @@ main() {
>       fi
>   
>       # Read in all the file in memory, exclude empty lines and comments
> -    while read -r line; do
> -        ENTRIES+=( "${line}" )
> -    done < <( sed -r -e 's/#.*//; /^[[:space:]]*$/d;' "${USERS_TABLE}" )
> +    # mapfile reads all lines, even the last one if it is missing a \n

  I don't think this comment is very useful (if you wonder about why mapfile is 
used instead of read, you can check the git history). But I was too lazy ro 
remove it :-)

  Regards,
  Arnout

> +    mapfile -t ENTRIES < <( sed -r -e 's/#.*//; /^[[:space:]]*$/d;' "${USERS_TABLE}" )
>   
>       # We first create groups whose gid is positive, and then we create groups
>       # whose gid is automatic, so that, if a group is defined both with
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
