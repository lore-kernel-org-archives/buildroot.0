Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4018D103A9BD
	for <buildroot@archiver.kernel.org>; Wed, 25 Mar 2026 14:12:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 148A761373;
	Wed, 25 Mar 2026 14:11:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jPaM3w9ENDRp; Wed, 25 Mar 2026 14:11:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE13C60A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774447916;
	bh=NqhZBPZpFRXKFkM0Hr+PjJcsChPKHRsP2WUOFNSBx2g=;
	h=Date:To:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rjgl9HFPYBnBkOasVuLBnoBDIfxj2dH8WEZarN0HcR7pCLxgGbzkQMUKtkyYK/ycK
	 n2RMbr5yzRLdTl6i3VSv47EJ8+ge0y66xUGiII9/jt8cf3PUckSOSaiU040pB+x1kD
	 Z/UiF8HlIwNBa0W5kLsIasibefjcrAFE8S7WN8xcBGSw4ggy/XVvnI34e11LwxMDOW
	 0S2YQaICnvYo73f52wL0sWNX5KYbjaG9u9XzT5GvYGilJXaym73Nzca0Ev8SB/G3Bq
	 46OQpAcVpeaO6AUUMofnyjvLmELxVIDlHNeV6ltoXnyhs+tzH8NmMIiLhJbugwFd4w
	 mlpkdh7a3mu4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE13C60A4A;
	Wed, 25 Mar 2026 14:11:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 641A2F5
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 14:11:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A0B940984
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 14:11:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2LLiTN2H9awO for <buildroot@buildroot.org>;
 Wed, 25 Mar 2026 14:11:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::132d; helo=mail-dy1-x132d.google.com;
 envelope-from=lancethepants@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9C3B540962
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C3B540962
Received: from mail-dy1-x132d.google.com (mail-dy1-x132d.google.com
 [IPv6:2607:f8b0:4864:20::132d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9C3B540962
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 14:11:54 +0000 (UTC)
Received: by mail-dy1-x132d.google.com with SMTP id
 5a478bee46e88-2c15849aa2cso1688844eec.0
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 07:11:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774447913; x=1775052713;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=toe+8JbnNBxW0USBY9tyusOHIe/fPMYcTCFL+RUtXIQ=;
 b=fp8tEACglRO6RfhCENbi9ats9oYqv4E8Fdm5FnG4Os6d5cNCKFLViVbDWEFcIL3KMe
 G+5/oR/5x8hosv8JJdthl7L/tjcE7W3u+eCE9NUw5ta+ed1pp6NGc0xcAcwbr1DyUV5b
 S8TulipEIL98Z6QSpAs+zU+/Xlf1C2jTEA3XVtmnnF/cxnVLrIw1S3SzzYhq9Ja/RBrp
 TF6TyEDH/RfGd4qux3uOOQ5mEoyxW0I+lNQi5bKWQ2XnHuoKVlVLvqCGeF26zX5nwX9+
 x16AuH5LbP1/ZOFYCvqgxWjmsNCTGW/SQhyVk40j51Gkv66/gyBrWIy7DQvmqV2CrlzP
 1ZPQ==
X-Gm-Message-State: AOJu0YyA90fubtRnXqopSBeuOjqz3qKV/Vy2Ocvtnb8sCty8XMEEWazY
 c3lWUOmvlBHQwW+DAZFXEKkdGrEZCov71YYwkr6QezLABtLO5G08bsUk4uu8WWFN
X-Gm-Gg: ATEYQzygXiaz9Xg7XnL7FvfENbIybRek8+eWGpxGd/D5W8fHNajt5tWCSD7dMQ3uxRq
 /yCt/dDmseh9fzTPz+4VIiOjKwGDJ65OQjlsuITfJCsdZqyoDSSi+OBPNra06R1rZkaaS43mWsF
 VjPSrMfdNGo37nQmGM3gSsvpIbf7fCvV9UKgMn7Adeu+FINng2gs3Luck+W26JSxhwSbKrkHs4S
 4vI3XUSNdcJDNXTNhXOMEkTgPdeRqtjDHOxCWzms1HtFhTIvwUSRFuUaIa/awVEHGEJVTxHnDVo
 WTs5rGZ0VCFgn9lCO+lFrUF8f6rV4Ez518siLra7a7lVEPPi3zB0WiC02pMGZni2uqMmkiMF32L
 CfqycucJOh08DKmtZ29+eR/kKyUxLs9VAQipODdPxf1VwAJ4MnAzf9ina05YoHG3+U7GS+Bv6yC
 UHCjPhw5vvU4DuMD5Y9tvUmLQ5RqC3v2N+mJ8ymqY=
X-Received: by 2002:a05:7301:4084:b0:2b7:35c8:32cf with SMTP id
 5a478bee46e88-2c15d4a621emr2280914eec.28.1774447913197; 
 Wed, 25 Mar 2026 07:11:53 -0700 (PDT)
Received: from [10.0.0.72] ([76.8.199.226]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2c10b29d28csm22586272eec.19.2026.03.25.07.11.52
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Mar 2026 07:11:52 -0700 (PDT)
Message-ID: <21475312-d791-4719-9759-b4f04b54a956@gmail.com>
Date: Wed, 25 Mar 2026 08:11:51 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <dpzpiofmvjr7qshzhveo3ebyu5igb2rv3u25ti56huo4axz3m3@mqub7vltk6uv>
Content-Language: en-US
From: Lance Fredrickson <lancethepants@gmail.com>
In-Reply-To: <dpzpiofmvjr7qshzhveo3ebyu5igb2rv3u25ti56huo4axz3m3@mqub7vltk6uv>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774447913; x=1775052713; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=toe+8JbnNBxW0USBY9tyusOHIe/fPMYcTCFL+RUtXIQ=;
 b=lQZ1+gTkw0K/Fw2U6Dlz1G6OA6hbcjzdaGYDXyrTLwWiIwlZ8BpLc0W127yUmZO7As
 Y32P0V8dbHVrDZQWU9LJvNo63Yrd5X4erPikisDyT5vtWVu7hDJsEdIxllYkPGEkTLI/
 sTTbsFRCADHv18h4Wo1PzmVS/GN5VyIy4XgTV117IGlaT3riw/TAvgW00SCgnLmetOz9
 iWAHDJiupiV3cVeI8IZMHWhq7TRuKVTO3bSuKmkFvuO0VSIYFJJQrONohv84mmdqyaSW
 C4gxjgUYsJOGSrw/rQ0lEFqsRxAUr25R5NeODXpDULqEda52i+2EcKNqu9Os5p5bZF8z
 qcLA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=lQZ1+gTk
Subject: Re: [Buildroot] [PATCH] package/libcurl: Use certificate bundle
 conditionally
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIEJSMl9QQUNLQUdFX0NBX0NFUlRJRklDQVRFUyBwYWNrYWdlIHVuY29uZGl0aW9uYWxseSBp
bnN0YWxscyBhbGwgdGhlIAppbmRpdmlkdWFsIGNlcnRzIGFuZCB0aGUgY2VydGlmaWNhdGUgYnVu
ZGxlLCB3aHkgZ2F0ZSBqdXN0IHRoZSBidW5kbGU/CgpPbiAzLzI1LzIwMjYgNToyNiBBTSwgSWdu
YWN5IEdhd8SZZHpraSB3cm90ZToKPiBDb25maWd1cmUgd2l0aCAtLXdpdGgtY2EtYnVuZGxlIG9w
dGlvbiBvbmx5IGlmIHBhY2thZ2UgY2EtY2VydGlmaWNhdGVzCj4gaXMgc2VsZWN0ZWQsIG90aGVy
d2lzZSBjdXJsIHdpbGwgZmFpbCBjb25uZWN0aW5nIHdpdGggSFRUUFMsIHNpbmNlIHRoZQo+IHNw
ZWNpZmllZCAvZXRjL3NzbC9jZXJ0cy9jYS1jZXJ0aWZpY2F0ZXMuY3J0IGZpbGUgZG9lcyBub3Qg
ZXhpc3QuCj4KPiBTaWduZWQtb2ZmLWJ5OiBJZ25hY3kgR2F3xJlkemtpIDxpZ25hY3kuZ2F3ZWR6
a2lAZ3JlZW4tY29tbXVuaWNhdGlvbnMuZnI+Cj4gLS0tCj4gICBwYWNrYWdlL2xpYmN1cmwvbGli
Y3VybC5tayB8IDYgKysrKy0tCj4gICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGliY3VybC9saWJjdXJsLm1r
IGIvcGFja2FnZS9saWJjdXJsL2xpYmN1cmwubWsKPiBpbmRleCAzZDAwYTRhMzNhLi4zNDEwMzE3
YjZkIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbGliY3VybC9saWJjdXJsLm1rCj4gKysrIGIvcGFj
a2FnZS9saWJjdXJsL2xpYmN1cmwubWsKPiBAQCAtNTgsOCArNTgsMTAgQEAgZW5kaWYKPiAgIGlm
ZXEgKCQoQlIyX1BBQ0tBR0VfTElCQ1VSTF9PUEVOU1NMKSx5KQo+ICAgTElCQ1VSTF9ERVBFTkRF
TkNJRVMgKz0gb3BlbnNzbAo+ICAgTElCQ1VSTF9DT05GX09QVFMgKz0gLS13aXRoLW9wZW5zc2w9
JChTVEFHSU5HX0RJUikvdXNyIFwKPiAtCS0td2l0aC1jYS1wYXRoPS9ldGMvc3NsL2NlcnRzIFwK
PiAtCS0td2l0aC1jYS1idW5kbGU9L2V0Yy9zc2wvY2VydHMvY2EtY2VydGlmaWNhdGVzLmNydAo+
ICsJLS13aXRoLWNhLXBhdGg9L2V0Yy9zc2wvY2VydHMKPiAraWZlcSAoJChCUjJfUEFDS0FHRV9D
QV9DRVJUSUZJQ0FURVMpLHkpCj4gK0xJQkNVUkxfQ09ORl9PUFRTICs9IC0td2l0aC1jYS1idW5k
bGU9L2V0Yy9zc2wvY2VydHMvY2EtY2VydGlmaWNhdGVzLmNydAo+ICtlbmRpZgo+ICAgZWxzZQo+
ICAgTElCQ1VSTF9DT05GX09QVFMgKz0gLS13aXRob3V0LW9wZW5zc2wKPiAgIGVuZGlmCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
