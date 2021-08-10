Return-Path: <SRS0=7M6N=NB=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EED9C4338F
	for <buildroot@archiver.kernel.org>; Tue, 10 Aug 2021 19:11:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DAFAD61008
	for <buildroot@archiver.kernel.org>; Tue, 10 Aug 2021 19:11:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DAFAD61008
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=essensium.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 817EB402E1;
	Tue, 10 Aug 2021 19:11:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sMfCD2ugRfTk; Tue, 10 Aug 2021 19:11:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EDE1940335;
	Tue, 10 Aug 2021 19:11:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4B9641BF951
 for <buildroot@lists.busybox.net>; Tue, 10 Aug 2021 19:11:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A60840266
 for <buildroot@lists.busybox.net>; Tue, 10 Aug 2021 19:11:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=essensium.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vRyi6hBsghiu for <buildroot@lists.busybox.net>;
 Tue, 10 Aug 2021 19:11:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8C4EC40243
 for <buildroot@buildroot.org>; Tue, 10 Aug 2021 19:11:17 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id d6so31717250edt.7
 for <buildroot@buildroot.org>; Tue, 10 Aug 2021 12:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+i7/b9vSq5fcjzwfz9u2KP2fw4yTmPKNYDidWJ44s68=;
 b=iENJbJ0Tvk5xULWfuyfPqsEwYbX4EWunNdnP9gQpmehoqVf4wgn9ln7mMoMsg+yMzd
 zMD1e+7uMZTf8+/vk+FOwr6tV+gC1VJLPDWxRvdpO1hMuXVvVl8WeFBe93tMOdMk+ah9
 y9Jr8Kamc4u7EDu0oxElLgtnpmEx/qhaqFKbipBgEB67symXyEz57Q1yKJQA4dwAIxbV
 GXFR0bAvIqZCYcL/wNetas2HWLzNmLbXSKOE1f6tSisM3h7NhYkBJUBOxyw0hUePn1kR
 6NrVq/ppVHuV/sU25wKb/nKy2WZZSOzkImgN/r5U399rJUpJ/6pl6tsIA29oHf51+mxo
 dTwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+i7/b9vSq5fcjzwfz9u2KP2fw4yTmPKNYDidWJ44s68=;
 b=biyLamIj43cvBHwinBGYyNOhz2tXHac/0HEOSGdBeHY2+kxR0+FGjbnWRupRDro5aq
 l45yz8vEbZRtRHGC+VLCHJ+dFaAFxPbwH4awK4rUGIHdDQlQxgiwWrrNen39xwhRXVBF
 ctqWgaVbJrdSHPuCF7ItWOhXJtlIF1BJ3hJ1+LI7Pfpg801PdWIZWFOchU9cGuQ035wA
 mNzNS2oHUD6bITbZ6Z1JyXOD7X4ASC4NUDSP7MuUhafwBE1jC8h43k+RtHUY38EgfCMH
 g+oHo1CKUxVsTZ7G5iuMhRc+LRe7qUWV4TTg/GQid7W6yz+QVvWQ1DeKqrbAp7rCWgbU
 qTCA==
X-Gm-Message-State: AOAM5335d62eyFQm3jSs0BHkVgr9nFvpHqjmeCFQORxA/4W3C49r21tk
 ZHAZM5AvS3aSNDff+HLjpfTNIA==
X-Google-Smtp-Source: ABdhPJzz+e3dPlOwRielhHzcOR9ZqwyTunZ/Ef54pp+ftCWn+xkWMCt89TFLGCK2p/TdxiO9RsGjEw==
X-Received: by 2002:a05:6402:c1b:: with SMTP id
 co27mr6736943edb.147.1628622675456; 
 Tue, 10 Aug 2021 12:11:15 -0700 (PDT)
Received: from [192.168.1.45] ([109.130.26.5])
 by smtp.gmail.com with ESMTPSA id b25sm5247700edw.67.2021.08.10.12.11.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 12:11:15 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20200207141629.31586-1-raphael.melotte@essensium.com>
 <20210805000156.157c0aa2@windsurf>
From: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@essensium.com>
Message-ID: <347be964-b0b1-6fe4-57dd-07945d8b3424@essensium.com>
Date: Tue, 10 Aug 2021 21:11:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210805000156.157c0aa2@windsurf>
Content-Language: en-US
Subject: Re: [Buildroot] [PATCH 1/1] package/python-rsa: new package.
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SGVsbG8sCgpPbiA4LzUvMjEgMTI6MDEgQU0sIFRob21hcyBQZXRhenpvbmkgd3JvdGU6Cj4gQWJv
dXQgMS41IHllYXJzIGFmdGVyIHlvdXIgcGF0Y2ggd2FzIHNlbnQsIEkgZmluYWxseSBhcHBsaWVk
IGl0IHRvIG91cgo+IG5leHQgYnJhbmNoLiBJIGRpZCBhIG51bWJlciBvZiBjaGFuZ2VzLCBzZWUg
YmVsb3cuCgpUaGFua3MgZm9yIHRoZSB1c2VmdWwgY29tbWVudHMsIEknbGwgdGFrZSB0aGVtIGlu
dG8gYWNjb3VudCBmb3IgYW55IGZ1dHVyZSAKY29udHJpYnV0aW9uLgoKCj4gQWxzbywgSSd2ZSBh
ZGRlZCBhIHRlc3QgY2FzZSBpbiBzdXBwb3J0L3Rlc3RpbmcvIHNvIHRoYXQgcHl0aG9uLXJzYQo+
IGdldHMgcnVudGltZSB0ZXN0ZWQgaW4gb3VyIGluZnJhc3RydWN0dXJlLiBGZWVsIGZyZWUgdG8g
aGF2ZSBhIGxvb2sgYXQKPiB0aGUgZmluYWwgY29tbWl0IGF0Cj4gaHR0cHM6Ly9naXQuYnVpbGRy
b290Lm9yZy9idWlsZHJvb3QvY29tbWl0Lz9oPW5leHQmaWQ9NThjOTljOTU3YjAwMmE5ZDZmYTdk
ZThkZjI0Yzg3ZGYzNzljOWZhZgo+IHRvIHNlZSBob3cgdGhlIHRlc3QgY2FzZSBpcyBpbXBsZW1l
bnRlZCwgaXQgY291bGQgYmUgdXNlZnVsIGZvciB5b3VyCj4gZnV0dXJlIGNvbnRyaWJ1dGlvbnMu
CgpJbnRlcmVzdGluZyEgSSdtIGN1cmlvdXMgdG8gdHJ5IGl0IGxvY2FsbHkgYXMgd2VsbC4KClRo
YW5rcywKClJhcGhhw6tsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1c3lib3gubmV0Cmh0dHA6
Ly9saXN0cy5idXN5Ym94Lm5ldC9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
