Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E150C5B572
	for <buildroot@archiver.kernel.org>; Sat, 22 Aug 2026 12:07:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C945180DA1;
	Sat, 22 Aug 2026 12:07:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7j3iXt0Wesz2; Sat, 22 Aug 2026 12:07:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787400448;
	bh=ITnzT68u+bUdoWo3PzfA+na9RpdWQcNw7G7LKOY0mfs=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=owHQhBAvQkW3EkJ99YOPlWpdBrNnY8MhBywvg3tse7dzOp/HexFlf1m+F7417yFBB
	 ZFieYAAbsutbusZSLDLkYseVPtpGecCMQu65nuz5759p5xUUE2aQbfIc2OG6KwD2do
	 TlMq6tSl2rfhBh80sJgAxiumJi/oukj1DU+FJxMPyFd3VZs46W4tqasgA2wNS7AMCz
	 Tt1IHnpoSU2BnptwA0V+8/SJnsdvptCC8iHyk6KA4L3JMbCrhub99xe7VOG/n6t4rr
	 O8/AxxhtQ3GzzLZd282FpWwjxxhtKeBPPR/3nmT4eL/2VtTo7rbP4ZSAHueSBk4B3U
	 JiUP9OXX7oPBQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0E0880D39;
	Sat, 22 Aug 2026 12:07:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BBB81476
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:07:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ADCD6605D9
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:07:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L2Rs47RuGYBQ for <buildroot@buildroot.org>;
 Sat, 22 Aug 2026 12:07:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C7CF6605D7
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:07:24 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-6a38098734bso3452023a12.1
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 05:07:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787400443; x=1788005243;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=LfSFOhcyt1QlYNW7dhISLvpE7OCwB7qCYK7fiFEsHFg=;
 b=kP7ZqcBvUYbV2IH7N9Ayo7iRQZS/9XlKQFJcJuPw5zj1rNnv3vcu4GSpCfHA7blfQh
 VgSZcx6wqdjTwkbNH7XH1J4SsY4bTiDH4O+y+3n92Q28HLRGPQI9atFQSKak7s3p6xk7
 GCkd+6XpuOf5KYLzE7GG4lm4zzRklhhQJI3pR9fKcwt5HCd8KY2E4+eph2sBl2wVXKMH
 z6FvmVFDQYcDmiOGaC6in3UGOmxZq5bQN96dT/nG3uhsNQuRFYaW9rB6yVr9+A/FuizM
 VAqGu0lcGCiko60xAoTrA5gM+HJzjqtO0bPe5rIg6/P0OmPb7PszfIhELaw5YzRXioK5
 uC6w==
X-Forwarded-Encrypted: i=1;
 AHgh+Rrvldi4NhpooMf2BHoLcEcUZRqSX2LvTdxdH2LSw5zgsJOeBpXDOEFdzRIE9q5R2lrQWHsJDhxKOrw=@buildroot.org
X-Gm-Message-State: AFuF++llukNz0dp8M1pLvXjyD4eh/dAShRGZ+oW24Vu45qsdSI3xcRSg
 lczAV9KZ8NCPU/3933fHtuSSC3XMQDOXKFN1MojTqyXoyCWUpoZ538RkDeoAtl2vGt2EOWHY8nL
 b8vCn
X-Gm-Gg: AR+sD11BOWkd37ggqqHcJmfBZuYedlaW/bQLCnPz+RIktYwE2E6qFD92eW4oUgLFrIG
 +DUzrTqjP/ldKWpAu/EAw5FLr7GxSJZAjr4ZgXADea3qVxFI03aOYSfRVaMWvMcEAl4QJb4d5kv
 3L0r7JsoFj1ciSlizhg7DjDK8tlnEzCG78jZI2SyOFmSD/V5q9yccdi0hfkEuT1+Az1QiX+2k0e
 CkrIcl5eUm5hildwNS+MA1QY3kN/k/dsYAI+R+9OaY8+k9iiTRcw2TPECZiw13mkm81DKmypv71
 jP+4yyPmVD9rThj9fAsGEhdsdauqF+VYouEfNcc7sD/Ekg0RXPBE9HtG9Qrldq0+OR+u5rJgteO
 Uy/LnutaihD2Yd+9JG90mB7r2iGHLutDivkbu/jppJtxRAnAGDvpVzYIgQjLZMFxAiaH+bqw7kY
 lrGGm4v06Tfqq2Cxnxr3RG03Q/1fV1+JBt8l6LS6MHLOnkdde+Meg+HyTyNNDBS22xI0IeOZyfT
 vtcCL5J+0NcEasSuByEC78bwHvZZgm23XikKoU6vz1U3Kq+
X-Received: by 2002:a05:6402:4607:b0:6a0:e963:f546 with SMTP id
 4fb4d7f45d1cf-6a42f27960bmr13323545a12.15.1787400441313; 
 Sat, 22 Aug 2026 05:07:21 -0700 (PDT)
Received: from [192.168.129.33] (154.186-200-80.adsl-dyn.isp.belgacom.be.
 [80.200.186.154]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a3fec280e9sm12929511a12.0.2026.08.22.05.07.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Aug 2026 05:07:20 -0700 (PDT)
Message-ID: <7ab22d6f-8755-4be8-b260-aabc4349e709@mind.be>
Date: Sat, 22 Aug 2026 14:07:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
References: <20260811114250.116254-1-thomas.perale@mind.be>
Content-Language: en-US
In-Reply-To: <20260811114250.116254-1-thomas.perale@mind.be>
Subject: Re: [Buildroot] [PATCH 2025.02.x RESEND 1/5] package/busybox:
 re-introduce IGNORE_CVES for CVE-2023-42366
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 11/08/26 13:42, Thomas Perale via buildroot wrote:
> The patch `0008-awk.c-fix-CVE-2023-42366-bug-15874.patch` was introduced
> in [1]. The IGNORE_CVES entry was removed while the patch is still
> present in [2].
>
> Re-introduce this IGNORE_CVES entry.
>
> [1] 75c594d446 package/busybox: fix pending CVEs
> [2] f88537c46b package/busybox: drop stale IGNORE_CVES entries
>
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Series applied to 2025.02.x, thanks !

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
