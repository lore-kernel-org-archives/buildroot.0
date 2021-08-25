Return-Path: <SRS0=vKZi=NQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EADB9C432BE
	for <buildroot@archiver.kernel.org>; Wed, 25 Aug 2021 19:45:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99002610A7
	for <buildroot@archiver.kernel.org>; Wed, 25 Aug 2021 19:45:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 99002610A7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D3008105C;
	Wed, 25 Aug 2021 19:45:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WzzCS4kaa51q; Wed, 25 Aug 2021 19:45:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E6A3817C0;
	Wed, 25 Aug 2021 19:45:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 800BD1BF588
 for <buildroot@lists.busybox.net>; Wed, 25 Aug 2021 19:45:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E0BB404F8
 for <buildroot@lists.busybox.net>; Wed, 25 Aug 2021 19:45:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6LxCIRUCbNDj for <buildroot@lists.busybox.net>;
 Wed, 25 Aug 2021 19:45:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 020CE400EE
 for <buildroot@buildroot.org>; Wed, 25 Aug 2021 19:45:28 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id z19so784514edi.9
 for <buildroot@buildroot.org>; Wed, 25 Aug 2021 12:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=g0uTOyc6saN+cqUoDrH/0LhOVNkA/oJZTs/coC+iWK0=;
 b=HZa+N9Thb7pOFAgKa+95QVBE/CkTbSiKmYoYRclmuIo/GrGo8Q8dwkWFc4+4cpLcEd
 oizmxQi9HotLauHv+scbo1VysIAKMZSPt73HATDfZl5eeevA2tQwm/al4qiYklzVcok1
 w2MkeRPDdDvOElvhTX0GS1AOK7+7VqpZU6vxQabK6Q1IkH8sAdYGpv0Vjp1AG+XsExHU
 S+C9mvk2YWk3rOQsBZMegP9mS0yt3C97bY+vlvcL0Ds3P4r2Rt3B2FiLEzwQGfSt8nMT
 PE/OCtmpzx4DRncGa7SGSFyzjA3LzR7D10QjLGYr+e1fzmdfbudJf/8c0zSLafINf8sL
 qrIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=g0uTOyc6saN+cqUoDrH/0LhOVNkA/oJZTs/coC+iWK0=;
 b=lmv5MwzMiaQjE0cq6gjTKF3dP3hG6OwkIOo/cKXDPDOpL1YuJla+0bhO8FnlT0cxC8
 9HjHsxOUQEPOdlD/DxZPiETLVRMvhoMZXG13jJ8UgmWXaDL9KJ3e6RkbvC2P5dFA+Gmg
 6gwuHmzNIS5FmW6+XCTcK3zCX3Fx2og5dZ3DHPD8Xb8qiuSgeLohLrZcDMrLv3SEFKfg
 rdXD2Ae2U0jqTf9wk/cfTpUliJnhonEp5C0yoC8X1D4e+vwMAl9VLiLsf3Zpy0z/jaE2
 VLdvGoSqpTg31ltoIvTEIfvDj/09wZaz1211g0tORMWNdCNnH3Et9/8skeIS9yj0pOsO
 HcLg==
X-Gm-Message-State: AOAM531fMRYWUpNMPEYFW0RgqkkL1UZ/UocwLuAJk4+yHhU9Apc8JjqY
 cLWbWRT6E4M7hSKd83TmMwbWQjdo2ymd6w==
X-Google-Smtp-Source: ABdhPJyMuWxmuYu7FDznALgWqN0hDWfufPQcbBQbdAB6XdXLw+Wm8MO0dGXRtlMnjDnEqVz9hL91Ow==
X-Received: by 2002:aa7:d3c2:: with SMTP id o2mr234643edr.238.1629920727235;
 Wed, 25 Aug 2021 12:45:27 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id d23sm510169eds.88.2021.08.25.12.45.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Aug 2021 12:45:26 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210822093428.2018189-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <f77649d8-b475-2584-200a-3f4c3d16d03f@mind.be>
Date: Wed, 25 Aug 2021 21:45:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210822093428.2018189-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-pam: add libxcrypt
 optional dependency
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 22/08/2021 11:34, Fabrice Fontaine wrote:
> Add libxcrypt optional dependency and fix the following build failure
> with libxcrypt and uclibc-ng raised since the addition of libxcrypt in
> commit 464bbe26ff5fb9e5bfe26a26ea65c700b90598f5:
> 
> /home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabihf/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabihf/bin/ld: unix_chkpwd-passverify.o: in function `verify_pwd_hash':
> passverify.c:(.text+0xab4): undefined reference to `crypt_checksalt'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/65d68b7c9c7de1c7cb0f941ff9982f93a49a56f8
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

[snip]
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
