Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A97C433EF
	for <buildroot@archiver.kernel.org>; Mon, 20 Dec 2021 22:35:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1290C409AD;
	Mon, 20 Dec 2021 22:35:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id shYsczeZDe7u; Mon, 20 Dec 2021 22:35:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 27EF5409AC;
	Mon, 20 Dec 2021 22:35:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 397C31BF5A6
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 22:35:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 265AC40321
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 22:35:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YRBIJcXyOdzg for <buildroot@lists.busybox.net>;
 Mon, 20 Dec 2021 22:35:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 27677402FF
 for <buildroot@buildroot.org>; Mon, 20 Dec 2021 22:35:33 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id y22so44422326edq.2
 for <buildroot@buildroot.org>; Mon, 20 Dec 2021 14:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=a6xmsG8P4KkGfeLqnGkGBBBWmPVzjmOIzwRg/EUQR0c=;
 b=G6gX9a8kmpQiahyj9EyoANSf1yuku6pH/kYqnxNq+aRy/hGWAa8achcmUa5o7P9wVy
 L6UkEVDCPyBDR6lLPDKBF4g3reKoS9bOPNnldU/ZPl2JCwQ1yjEcvMJmP9gRP3Rth3IV
 8uLHkH3cH1cp7djkA0RwJBD5tG1jMlHpniAeOJhD5xGpBQ/OqUMFHAKQJylTfr5I8LVX
 xXaDKG4U2QVnt12yqmviC74Sa7fQRoP8ipbZhLgGW3ShnlGkjoSRRmnO8VlXattzf3WQ
 QGZ9s/7DqXmGl1JmnvJjA6wHdADD7Oe+HoH3T/n5TAy6jZr5FvsbTPaEJe8O7PotZV7G
 uJLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=a6xmsG8P4KkGfeLqnGkGBBBWmPVzjmOIzwRg/EUQR0c=;
 b=BoQLMy3daXAyw9MxDRI0eF6i04khSd8TgO3HRkcicKy1ltGZM6oQgstCkyCldSF5Vo
 g0b/TOxRuNNdDE/W/rZaPCMKUmz7H5kIHEQMLwG83/+SpxMuFdYxUNX0RMZOHEur1j3Q
 CuUIKMyV987fve7Qz93vLgHeLBkF1uxgsk6vGmeyyVWana0M6jbq2VaahHfogeGq8wLj
 0f8R/kgu55OxVTTRkiRI+Rqz90nWZ+VtCRXVyVBsBqSIQdXqCHCpXVW5SnzSnCGQot1k
 XEu9zqMUvc8/kEwtIKD2VZHjZ+WntL5cUBBQXsR03dUh9xZ43Vd+EjFUcvD2e1eUd6WL
 t7lA==
X-Gm-Message-State: AOAM531/Q7Mny3SJvSgcysFzZ+gGN1cLMslctdN7Wi1OvcXIXBfmkyDq
 pIw1uPybxXkFwa5NTCbI5Q+h3mPdUZXm5A==
X-Google-Smtp-Source: ABdhPJzTG87YGN3Av3wQ5fivI5aDDRc1nR1pOiZnLEy+axpkA3u8Fbj5zO3/65vXD3MBLii5o3WHNg==
X-Received: by 2002:a05:6402:21c6:: with SMTP id
 bi6mr238940edb.209.1640039731470; 
 Mon, 20 Dec 2021 14:35:31 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id zh8sm4529621ejb.1.2021.12.20.14.35.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Dec 2021 14:35:31 -0800 (PST)
Message-ID: <8d31f07f-8562-960d-9c9e-39567a5a4d84@mind.be>
Date: Mon, 20 Dec 2021 23:35:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211217191144.24775-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211217191144.24775-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libmbim: bump to version 1.26.2
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
Cc: Aleksander Morgado <aleksander@aleksander.es>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 17/12/2021 20:11, Fabrice Fontaine wrote:
> Drop patches (already in version)
> 
> https://gitlab.freedesktop.org/mobile-broadband/libmbim/-/blob/1.26.2/NEWS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

[snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
