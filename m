Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46178C54E58
	for <buildroot@archiver.kernel.org>; Fri, 15 Mar 2024 19:38:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BDD360631;
	Fri, 15 Mar 2024 19:38:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gir-e8kMY9ij; Fri, 15 Mar 2024 19:38:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 371F460F03
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 371F460F03;
	Fri, 15 Mar 2024 19:38:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 73C231BF307
 for <buildroot@lists.busybox.net>; Fri, 15 Mar 2024 19:38:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D14F4179A
 for <buildroot@lists.busybox.net>; Fri, 15 Mar 2024 19:38:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AhmqQFe6s8xB for <buildroot@lists.busybox.net>;
 Fri, 15 Mar 2024 19:38:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F313E41795
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F313E41795
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F313E41795
 for <buildroot@buildroot.org>; Fri, 15 Mar 2024 19:38:28 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-33ec8f13c62so1499215f8f.0
 for <buildroot@buildroot.org>; Fri, 15 Mar 2024 12:38:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710531507; x=1711136307;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IyOepC4/OuiyAFvjhvxCLpKaAft0evb1zTMEY+rfwdI=;
 b=DhGAMXCVL8ygWw4PqLL7HzznJazeL+uMlZ5o3Jb7+jRNRk8cqjQnh9od6NAa2O9X6K
 XcMa8MXctSjIs+QAjF+TR1Tquk5CnZbM1urpQRytzWtBR60yALcv57B7C5E2ivdyNMco
 pYEaaJkCGmL2mO4y/j4RjTZgVG2McW+xWd4Px5807nBahDZtypwljwqvfGbT0spoiGcE
 aBW4m/YCFH0How2nXpBCokU18dKv7xVhthxgTEDSp1nxEtBiU8uFtIhyK1VQfFF+YWxD
 jgmYT8gg2jeHm60ohtulB/9WLPJjc6dJADOcOqNp7Tx7JecvhkmMA06KTwa04rD8Lgzc
 QCHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKQ5EuZLYjo10eNL8k+DPFoesaVj6DUYa849x6GdG8bc1esSyhTQEs7ap+UcYp7ApDt/sHGTnEpoJtH0Dtqn764ceuR1y8yQ==
X-Gm-Message-State: AOJu0YwCDt4G4lZvCgb3q6xKyU6LJrhMaI9BvmS6OQIHQMZcY7AKoBG3
 HMIisGts4k//svY2LE3bAELYlM2mFkRRryX3VbNorHpviTdfPj/S4nyuYh90Mns=
X-Google-Smtp-Source: AGHT+IEQ+XBWoi9cwYYur2ayeuYGIrtG3qidl5UhfbWQiqCU3f6SjAtVY6NjQ54eTrBqzRFTWzB7Zg==
X-Received: by 2002:a05:6000:1c6:b0:33d:f60e:5c6c with SMTP id
 t6-20020a05600001c600b0033df60e5c6cmr2930159wrx.53.1710531506801; 
 Fri, 15 Mar 2024 12:38:26 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 c18-20020a5d4f12000000b0033d56aa4f45sm3771084wru.112.2024.03.15.12.38.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Mar 2024 12:38:26 -0700 (PDT)
Message-ID: <e6c54c01-a3ca-4eba-805b-dc5e90a3b920@mind.be>
Date: Fri, 15 Mar 2024 20:38:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240314211117.9103-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20240314211117.9103-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1710531507; x=1711136307; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IyOepC4/OuiyAFvjhvxCLpKaAft0evb1zTMEY+rfwdI=;
 b=Y3xQrH30zqeflMXvTEE7iBnepm96GCrdXPi9zJKN9POFT35nH/SxxG64aSWfIkViEq
 SpO4QBnPcbVyUYybn4BVzPff+RRZmXjEIBToj9sLROGeA/PPAMZ2zhqBYz91ATkJUO0Q
 y9cJ4ccKbcbsm5dOyzRef1idwRPQNVkQAtBgEEsR3PvISAQe3HDe91tNW8MwZiEg6jru
 HGPfW9drgGOkzcHSx+YiKtlxPcqcChlYONW6JYphqeMXMGiPZvWmVOWQwDJlhLEcXBZr
 frLHw8/NChzte93vwy5Z1wRoNuDEtVagR/7PzLB9nN/SaS+9phISg7izzBaQfo0/FDs+
 bHBw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Y3xQrH30
Subject: Re: [Buildroot] [PATCH 1/1] package/multipath-tools: fix legal info
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
Cc: Alexander Egorenkov <egorenar-dev@posteo.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/03/2024 22:11, Fabrice Fontaine wrote:
> Commit cc363e9a93484e734313b17962b931b3df6eedaa forgot to update hash of
> README.md (changes not related to license)

  This is likely going to happen pretty often.

  I anyway don't see the point of including README.md in the LICENSE_FILES. It 
just explains that the default license is LGPL-2.0.

  So I suggest removing it from the license files.

  For now, I've applied this patch to master, thanks.

  Regards,
  Arnout
> 
> Fixes: cc363e9a93484e734313b17962b931b3df6eedaa
>   - http://autobuild.buildroot.org/results/d41b3eedb337ac7559afceed459c3e28a9bf15a2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   package/multipath-tools/multipath-tools.hash | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/multipath-tools/multipath-tools.hash b/package/multipath-tools/multipath-tools.hash
> index 0f51c38846..c1f32e7a3b 100644
> --- a/package/multipath-tools/multipath-tools.hash
> +++ b/package/multipath-tools/multipath-tools.hash
> @@ -4,4 +4,4 @@ sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENS
>   sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSES/GPL-3.0
>   sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  LICENSES/LGPL-2.0
>   sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSES/LGPL-2.1
> -sha256  5887418b2e0e595da5aca08b2dff25298f20618f9894d5e26ce852d9d1ae90c4  README.md
> +sha256  9c69bb0089aa0b82b10a25095c04a7c4aec6b5bbf0776b7129123c8459fe7725  README.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
