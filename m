Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E45C02182
	for <buildroot@archiver.kernel.org>; Thu, 23 Jan 2025 16:47:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1813340143;
	Thu, 23 Jan 2025 16:47:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IUsTtAMCvV5s; Thu, 23 Jan 2025 16:47:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C33074254A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C33074254A;
	Thu, 23 Jan 2025 16:47:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 526F2B88
 for <buildroot@buildroot.org>; Thu, 23 Jan 2025 16:47:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2593B403E9
 for <buildroot@buildroot.org>; Thu, 23 Jan 2025 16:47:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id os0Kom2twFbd for <buildroot@buildroot.org>;
 Thu, 23 Jan 2025 16:47:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0E251404DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E251404DB
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0E251404DB
 for <buildroot@buildroot.org>; Thu, 23 Jan 2025 16:47:41 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43625c4a50dso7887905e9.0
 for <buildroot@buildroot.org>; Thu, 23 Jan 2025 08:47:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737650860; x=1738255660;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=X/pT2ZlpXegLz54Spmi3JXpA9AUB02y6rPQcLPOvk40=;
 b=EMzqmW2UaLsNarEriLf7ixoKW2vZDhHQ69XdNjDmq/WcoyssESALto5JOoKX8KWjDu
 J+Txky5a74wI5Ph9i27YOEJl7DRXwGPW5202GiUEi1ePrizyg5ZMv31HQZ4MOsVo35L/
 ycJksDAN12TCn5QWk8KNNiU+A++2srfY4dyFcwmfDX6AbsvKuwO2kKaa4w+e7ic4vtlw
 1tfxGJ/ZCOwxuN+dvnUAAh+JvfRPxJpLG9Y+nGlufJ+3mcEvZr/4v+BevL63kT22zPfU
 SsOGOdykbUjKSINXNBcD2bkgAt+yMXjT3iq0fPaNP4WxxntNLVA2i1xfk49f6frn5CyZ
 ZZIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWerZ/iE7+6vZg1/jNE2b7r4iK3gfoX5LQ1FGwVNllCprGSGDE+92v7wWtnySUM9fgcMum6COeTpjE=@buildroot.org
X-Gm-Message-State: AOJu0YzLuUhLhKtpGAGP1egf+sg4JzKYjnCf9INlxiByJWvCCgqVqXdQ
 4n/phxqVovecdvhmh9VznI6vJNUXbS1lgSZdMTTzfvvA247IQWFxSGKyaq+TgBo=
X-Gm-Gg: ASbGnct5OVa5KVkx0Cu4xnmAC+XYOZP+CCn0pXUU9yaEZwBvn48SkKRI0ZOsZbJPMLI
 x3QI3VKe824++PLmVttAnQOj2bs2CSq3hI+C9ELWO+2iG1XUraVrINj1cnV0yhdD8z9D4JBEMyO
 cqGUInUOVpXYOgHLvyITBkE71sGxs55mxH4x3PY7YeP8v5KbQjJKCNmtBXdxs+qjRZ9fg6dMpy3
 3HxVc5WQhtYoRit+gZfDUaQXDu3PF8pv8lT9M5SePQ4qkWg1QIW3P56SiOrYRj4nbfbnstQHVtN
 OdqJ0B5kLUnJYmHfK9NGMLsU5Le+HOckJEI+QDo=
X-Google-Smtp-Source: AGHT+IFzvOyU5MG3U2j2p9F2G7JE8khw1Pm9tlihm0nNrhjW7Er3ooDfakxIawPOYsjgdZqH2jOLkA==
X-Received: by 2002:a05:600c:46cb:b0:434:f1e9:afb3 with SMTP id
 5b1f17b1804b1-438913bea88mr245482535e9.3.1737650859770; 
 Thu, 23 Jan 2025 08:47:39 -0800 (PST)
Received: from [10.5.0.131] (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438b31df435sm69095675e9.34.2025.01.23.08.47.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jan 2025 08:47:39 -0800 (PST)
Message-ID: <716b05a8-c26c-4c6e-aa01-4bcb43ce4303@mind.be>
Date: Thu, 23 Jan 2025 17:47:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Neal Frager <neal.frager@amd.com>, buildroot@buildroot.org
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 brandon.maier@collins.com, ju.o@free.fr, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com
References: <20250120113405.3938838-1-neal.frager@amd.com>
Content-Language: en-GB
In-Reply-To: <20250120113405.3938838-1-neal.frager@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1737650860; x=1738255660; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=X/pT2ZlpXegLz54Spmi3JXpA9AUB02y6rPQcLPOvk40=;
 b=G0jJZPaRB/bozbpCVRza0fhy+trgqGKcXYQKlXLgvpopa3fVd+r79Eo7nZJXFsbjW5
 CwdeAUxBjD7fE4cUcnGrIy4c4SxnDBnUBNboXresGYnH1V8hiC7nq0+XbmB5z2VMzWZ1
 uFsy0VGYFZGCVZZqW96vXAb4gWJcyPLGDEh0voYCG7Pv+GkvkxoUpGQaZfozTI/ISZyV
 3zqAzSQOx8Ykw8HJLQbONrcMdzNsl9Dk2x47vQZ3GoC/ATJqpcYf5wWCcDg+Wh0ZQF7w
 9WTYiftLpkyG2GaW5kd7NHQsZ5bvnXZZc9gKQGkffqXrVuvFnSb3FdmvLh+v77v29+jf
 fD/Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=G0jJZPaR
Subject: Re: [Buildroot] [PATCH v2 1/4] boot/xilinx-embeddedsw: new boot
 package
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

  Hi Neal,

On 20/01/2025 12:34, Neal Frager via buildroot wrote:
> +XILINX_EMBEDDEDSW_LICENSE = MIT
> +XILINX_EMBEDDEDSW_LICENSE_FILES = LICENSE

  Instead of adding a patch that adds a symlink for LICENSE, you should simply set

XILINX_EMBEDDEDSW_LICENSE_FILES = license.txt

(and update the hash file accordingly of course).

  Regards,
  Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
