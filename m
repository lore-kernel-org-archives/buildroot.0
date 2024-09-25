Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A118CCF9E7
	for <buildroot@archiver.kernel.org>; Wed, 25 Sep 2024 18:52:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 086FB607C8;
	Wed, 25 Sep 2024 18:52:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ug_u8R8RbcwW; Wed, 25 Sep 2024 18:52:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19179611C9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19179611C9;
	Wed, 25 Sep 2024 18:52:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CF1C01BF408
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 18:52:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD300400F4
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 18:52:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dt-44RpYBVXs for <buildroot@lists.busybox.net>;
 Wed, 25 Sep 2024 18:52:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 67378400EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67378400EE
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 67378400EE
 for <buildroot@buildroot.org>; Wed, 25 Sep 2024 18:52:35 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-37cc846fbc4so81297f8f.2
 for <buildroot@buildroot.org>; Wed, 25 Sep 2024 11:52:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727290353; x=1727895153;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MDqYAOJ/QWQk93o5eGO87pIPbX5z7Ru01ySPGJjyE0A=;
 b=L4aFoYZYE8i56vxELUyFrPJDwCcO7JxjU7QwIeSMTDvJduJYANvmtvszj08xbvMT+a
 zEvuMnRiDDmE50PZgd2AAY1rxPlvZyHkdGUhT16+dShg4uynIItiMD3AP3sPN/ufIjan
 1FkiZwjmJnbPyw1Qp5BZVS6xt1WDjKMaCjHTrrzaxySRUIze8YOKgPfNw+AaqcEfmWKF
 KIfMb9T50CGotRkgit/rMfc7rcy8RSAepxyRpyyTVJrxc4EplXAN3HvrR7Q6wR/O8GOX
 jnNEzvcaWR84T61KJo1C/aS4nGyjelDMeffhkukvnBxvmFEKdhFayiQJGBeWCk2e3SsY
 Ai6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCgEnkvc12mI/1+cekcYE8MK7yaTfzgCn7LgoqLkQoqEv/AsB0+xuNToeksj3z3vCQAFNY35pUC8o=@buildroot.org
X-Gm-Message-State: AOJu0Ywk6xgg7pee2st2Up87pCxX2or0phXoT3JbWwEW1wRqhs6PMcQL
 HnbKrJkJjuPyiT5jsTiZi6kcgxPLV1NH0exPgZ2e/YNkhSlV6tN6jlbg0rYzfkNr7CWzaeByeg9
 z
X-Google-Smtp-Source: AGHT+IGKTv7Ifkc0fHL2EkUqUgqxcKlI4pD5DoUK8FQNSHlqFQGOJfh0Qia2RCEmUl0/lU2xHXNZlg==
X-Received: by 2002:a5d:4fcf:0:b0:37c:ccd6:7513 with SMTP id
 ffacd0b85a97d-37cccd67550mr924426f8f.22.1727290353055; 
 Wed, 25 Sep 2024 11:52:33 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37cbc2cd263sm4627992f8f.48.2024.09.25.11.52.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Sep 2024 11:52:32 -0700 (PDT)
Message-ID: <c9b2da46-99f4-4c50-9f57-792a5747c058@mind.be>
Date: Wed, 25 Sep 2024 20:52:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <20240924122406.1125261-1-peter@korsgaard.com>
 <20240924122406.1125261-17-peter@korsgaard.com>
Content-Language: en-GB
In-Reply-To: <20240924122406.1125261-17-peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1727290353; x=1727895153; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MDqYAOJ/QWQk93o5eGO87pIPbX5z7Ru01ySPGJjyE0A=;
 b=eu2Zui0kzZMs1l65ySXzJu46CCkQc4yD760atTw5OcYgFRHYY7WRRQzRNgIVvxd6j4
 ADdW31wW2XWMt2dxjE3yntKeGmtMWipTLgKxbzP+PHJJ9UiUOjUrKp8zCuGvhXxfNHbu
 sIQTWSo4iBBnMdV/MThZcp39hANDEop1/hEUfsb5WVo7a3wLVWdqQJIyln59f6Kbk+3W
 yBxl4S8brkcdvdKlbBTYVRNSgyKFwq3kLpu9uzFXPMsQjbqxdoNexE3UVMyQhU+Af3LP
 axm/txL+m6NDz2SPq7al+3itWlbsgJegmqi4aeagBlsacbb0z9rBDqUwJev48bDciamC
 m7GA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=eu2Zui0k
Subject: Re: [Buildroot] [PATCH 17/22] package/softether: fix typos in patch
 description
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



On 24/09/2024 14:24, Peter Korsgaard wrote:
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>   package/softether/0003-use-fhs-install-directories.patch | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/softether/0003-use-fhs-install-directories.patch b/package/softether/0003-use-fhs-install-directories.patch
> index ba00d9b676..f3da52c44f 100644
> --- a/package/softether/0003-use-fhs-install-directories.patch
> +++ b/package/softether/0003-use-fhs-install-directories.patch
> @@ -7,8 +7,8 @@ Install to `/usr/sbin`, `/usr/lib`, and `/var/lib` according to the Linux
>   filesystem hierarchy standard if SoftEther is built through autotools.
>   
>   In a managed installation, the FHS stipulates that the application must
> -accomodate a read-only installation path.  This requires a new `GetStateDir`
> -function that substitues `GetExeDir` in some parts of the code.
> +accommodate a read-only installation path.  This requires a new `GetStateDir`
> +function that substitutes `GetExeDir` in some parts of the code.
>   
>   Taken from Github at
>   https://github.com/dajhorn/SoftEtherVPN/commit/b9420c3bfc2a8b9d35d0c8e5f6849007c2bc21fa.

  Since this looked like an upstream patch, I doubted if we should modify it 
(other than adding things at the end).

  However, turns out that that is not the actual upstream, so it should be fine.

  Applied to master, thanks.

  Regards,
  Arnout


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
