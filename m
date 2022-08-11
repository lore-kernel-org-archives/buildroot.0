Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F6BC19F2A
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 14:43:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 480B440C8E;
	Thu, 11 Aug 2022 14:43:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 480B440C8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nSG2zUHvZozU; Thu, 11 Aug 2022 14:43:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7369B404EE;
	Thu, 11 Aug 2022 14:43:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7369B404EE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 006F91BF3FD
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 14:43:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D53DF404EE
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 14:43:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D53DF404EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gxskHU2yVQoW for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 14:43:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7684740289
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7684740289
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 14:43:35 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id w19so33915173ejc.7
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 07:43:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=LmqbsFJD4IyuTlObPSots4B2KwF+m7A7sHf7UkRIIB8=;
 b=v8F3aOCiFlHMreowpUlmgdSGImDGF+O8ecTZxTls/9eJonATfc3gEjLf8Pzv1wmDLv
 wGS6wTCc+NiepEpskp8st7mhckHFSaOD5jMaBuZQk4AQ5ObYI1tDzKT7cUmWfC+qlJ7J
 oT/t2ekC3XLInIn45/TQcHBP/2Iiy8j++wN+p3B7sSikILbgiNYr8rw+6QB93Vs3cham
 Xwp7IqLaDOO61fHpTsXjQPSwVzrZckZgbG57EucxLDHgibc8e/EtSknC80u1cLRg+CVm
 MxdjDccyJGbDpPTZZORus6ljJ3pBwY0dqrO/jP/vVz+Z1neEBVdfhImYNSvH8ffc4gxE
 0M5Q==
X-Gm-Message-State: ACgBeo34uv3INd+dQquVvZ+ArQ3+Sr5PW9Qfni+XAe8F36ktgPGCEYUb
 jDq941vPdsAiA92x29ztaemyJA==
X-Google-Smtp-Source: AA6agR7pegDSB9iNOOhPjw2WdtZI2zPmgQrkAF/qIiU8epgcAvdmP1SjU5KKrUCv+gpmFCXz5sseqQ==
X-Received: by 2002:a17:906:7945:b0:72f:e584:10f2 with SMTP id
 l5-20020a170906794500b0072fe58410f2mr23428337ejo.534.1660229013692; 
 Thu, 11 Aug 2022 07:43:33 -0700 (PDT)
Received: from [192.168.178.20] (213.211.136.215.static.edpnet.net.
 [213.211.136.215]) by smtp.gmail.com with ESMTPSA id
 jz26-20020a17090775fa00b00731582babcasm3622802ejc.71.2022.08.11.07.43.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Aug 2022 07:43:33 -0700 (PDT)
Message-ID: <0ef988d6-36a4-2005-b00c-25cccaf781a0@mind.be>
Date: Thu, 11 Aug 2022 16:43:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.12.0
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?Q?Rapha=c3=abl_M=c3=a9lotte_via_buildroot?= <buildroot@buildroot.org>
References: <20220614190325.723977-1-raphael.melotte@mind.be>
 <20220722225426.0eb1e223@windsurf>
From: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>
In-Reply-To: <20220722225426.0eb1e223@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc;
 bh=LmqbsFJD4IyuTlObPSots4B2KwF+m7A7sHf7UkRIIB8=;
 b=giF93D9Q+fhRJkhor+NH2nla/9RDr+JoxpcuO8/qgwdH04Wp37YKO4ptYq8KzT2YL5
 IuLRgZSR+HJQWjo0AkTKKSv8oNqZlOXQ/mHoW091pCpEvXH2R969XnbidPPkSuDB5+Yf
 FNOr8md8lCgYhkQSIj94GyM5NAl83U7YKc/AzQ9FEghx4fzgDF4fSemxlxBqLRTmP0C1
 gPcVqBgEIxVLGi0V5yZx6hY62Vt69klEo9am8gLkgirDkRKPSgpj4kz/yzEVTQk7IIwJ
 NhV3ehBubSpf+tRNZtQez4di1YHB3k8WYDeYJiYZSXtgVlXUbLVSTWPY32/ABKP6971M
 3BRQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=giF93D9Q
Subject: Re: [Buildroot] [PATCH 1/2] support/testing: add new test for
 python-s3transfer
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gNy8yMi8yMiAyMjo1NCwgVGhvbWFzIFBldGF6em9uaSB3cm90ZToKPiBPbiBUdWUsIDE0IEp1
biAyMDIyIDIxOjAzOjIzICswMjAwCj4gU2VyaWVzIGFwcGxpZWQgdG8gbWFzdGVyLiBPbiB0aGUg
Zmlyc3QgcGF0Y2gsIHlvdSBzaG91bGQgaGF2ZSBhZGRlZAo+IHlvdXJzZWxmIHRvIHRoZSBERVZF
TE9QRVJTIGZpbGUsIGJ1dCBJIGhhZCBmb3Jnb3R0ZW4gdGhhdCBteXNlbGYgd2hlbgo+IHJldmll
d2luZy9hcHBseWluZywgc28gSSBwdXNoZWQgYW5vdGhlciBzZXBhcmF0ZSBwYXRjaCB0aGF0IGFk
ZHMgeW91IGluCj4gdGhlIERFVkVMT1BFUlMgZmlsZSBhcyBleHBlY3RlZC4KCldob29wcy4uClRo
YW5rcyBmb3IgZml4aW5nIGl0LCBJJ2xsIGtlZXAgaXQgaW4gbWluZCBmb3IgdGhlIG5leHQgb25l
cyEKCktpbmQgcmVnYXJkcywKClJhcGhhw6tsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
