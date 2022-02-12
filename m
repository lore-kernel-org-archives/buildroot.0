Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A984FC433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 14:33:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F26DB61C48;
	Sat, 12 Feb 2022 14:33:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5NhIjlIcIYAf; Sat, 12 Feb 2022 14:33:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B466061B90;
	Sat, 12 Feb 2022 14:33:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AB8831BF5A1
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 14:32:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A7E2D83E75
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 14:32:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wu0dEC4kTgNB for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 14:32:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E9BC283E6D
 for <buildroot@busybox.net>; Sat, 12 Feb 2022 14:32:54 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id g7so4502375edb.5
 for <buildroot@busybox.net>; Sat, 12 Feb 2022 06:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=wbgz4VYEDWADPr9sn1ayQtPtxuVMgKdd8Dto7w75umg=;
 b=ST8Ki/kpocuL4VL3e2PfwmYBL2TMVYdB1+XVBVr4bGv+0UZxglpwP5uRvvyEzFWo9a
 WcuY4gjYSOC3z7IgA9jL39ShLkifOfujN65TjSMtx0cDgYbprGAjqt6F4jajCyBKxMxa
 C39h6SpHvKclensry8/vEBi/aoBOlsna6B0ahakMK6q4ASNMO9yqvclr/F/TkUWBVOwd
 Jw/MxmvjLjXXPLPISCyNpTOoNmDJj4s1DZdRjg/FuUqAoNKOOeyfnmu4om5xqCN663TO
 CAcrR/ZLse7sE8XHq0/ddA4eVCCYNwsiOuAoOtw6zV5ln6bPyWe9XDoV5PHYHUjVFkI+
 b2XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=wbgz4VYEDWADPr9sn1ayQtPtxuVMgKdd8Dto7w75umg=;
 b=rBM4XIEELqJSw8nBpkQMHSJHwx9Ydkpl8h1mgMyj8n9aF9H1Jaan0kVkdB6oZsCL+T
 5NP/6GzTyYmx31AnQq2ChCqaiXt1W27ZXEhlvpsh9QelVUB+ARP8plFn778KgDCNldBd
 gNDYR4kcnClH+ftxXA66x0lmOvu+cNxbr6dQQd8abT7yr69hLMxXLT+U+cc7f5vxkZ58
 mD1mSzp/AgrvhjBvuxExAO2boJXxuz9O+mR9JqRPeOdmVITNEKW1xHc3u023rdIOhjBY
 zNgQo2Tv00UbPXUsJbwqOrFm3pXQO0eu1qfPJtYnLfQJBYp6S4ywUzmeqhvywH5pKkzB
 wA7w==
X-Gm-Message-State: AOAM533h/KAAEkCGbg0LHK48SKf6NBQbTfZgKjqlS0aZnch2l1EWtWs4
 xtg6dIHiTvIy93NIhmhOqGlBvWn3MC8NyQ==
X-Google-Smtp-Source: ABdhPJyPzJ9wDLdExi4FiyxaAoUm9GsnjF4BK84Zx8Oym4JERL4wnu+xx/bGn4s69Cy/30PJdXDD/g==
X-Received: by 2002:a05:6402:11c7:: with SMTP id
 j7mr7003852edw.124.1644676373207; 
 Sat, 12 Feb 2022 06:32:53 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id i5sm1428637ejo.49.2022.02.12.06.32.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Feb 2022 06:32:52 -0800 (PST)
Message-ID: <78653596-5ab1-a080-ebf3-22fcbdff7ec5@mind.be>
Date: Sat, 12 Feb 2022 15:32:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Michael Fischer <mf@go-sys.de>, buildroot@busybox.net
References: <20220126231554.0fcc106d@windsurf>
 <20220127121824.32092-1-mf@go-sys.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220127121824.32092-1-mf@go-sys.de>
Subject: Re: [Buildroot] [PATCH v2 1/1] package/busybox: bump version to
 1.35.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 27/01/2022 13:18, Michael Fischer wrote:
> Updating the busybox configuration files by loading and saving it back.
> 
> Signed-off-by: Michael Fischer <mf@go-sys.de>

  Applied to master, thanks.

  Regards,
  Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
