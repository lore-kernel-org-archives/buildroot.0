Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D2FC3064D
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 13:53:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 239B782125;
	Tue,  2 Jul 2024 13:53:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YABhzS71FLML; Tue,  2 Jul 2024 13:53:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9595282115
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9595282115;
	Tue,  2 Jul 2024 13:53:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2C0BE1BF313
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 13:53:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 25D648210E
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 13:53:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5DU08QGBvxvN for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 13:53:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2431F8210C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2431F8210C
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2431F8210C
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 13:53:22 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-52cdf9f934fso4397558e87.1
 for <buildroot@buildroot.org>; Tue, 02 Jul 2024 06:53:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719928401; x=1720533201;
 h=content-transfer-encoding:subject:cc:content-language:from:to
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=nyDHIrFxrG3v3mE9/UpNq/D7bJcV5hTZcw2NZlsfH9A=;
 b=SStYWdryOtKsZgrRYUyQZhx49GhEgoDE3PssCddgf8wl1btaVj2uHpYDRBx8zYM0v6
 RCmFILukK8i2xdLYrWJX7r37AB9J/6hE75eNFYOUloSWBuxBcXqMUhOEBAWOxX8NDtoD
 uKylJCoylk5yxM9YFSO1zoC75XauH/cLfdCKsi8I26YjTp4Omelk5LGUpQmHRwiORQPy
 VJQ+mRenUXdnTeeCy+TlN+OBHzk+VaHJ6SbRhmVBOBhD9VGGpvVzLxRW+gxCxhs8eU0n
 8SEqV2QjapI8TxayfX1lJGDFUsae+ktkLnZkFdetqL/UzqGXn/5mkozMYlGV9P22GW2m
 d0AQ==
X-Gm-Message-State: AOJu0YzMmQs7n8XAC2IQvYAb0P2Zfwm8qo2JtnYGJf1gp+KmzeH5u8Eg
 G6ex0vrVqViOAPbEkOOGw/3MeIMt8w08lEAvtVR7PZj4EcQuu42hGV2gezRte3kN4I5AapHsZTG
 b
X-Google-Smtp-Source: AGHT+IGsMust8bY8i+yLX+ql35HbG3hXMw8wKwM0zs4GVvPSZRkfrF8diN1TqjImwYkT1pZYby9DMg==
X-Received: by 2002:a05:6512:2312:b0:52b:bd90:29c8 with SMTP id
 2adb3069b0e04-52e82745124mr5644868e87.60.1719928400613; 
 Tue, 02 Jul 2024 06:53:20 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256af55d0fsm197445845e9.19.2024.07.02.06.53.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 06:53:20 -0700 (PDT)
Message-ID: <80bb1c09-3932-4e4b-b6b3-3a8bc54bcaed@mind.be>
Date: Tue, 2 Jul 2024 09:58:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Content-Language: en-GB
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719928401; x=1720533201; darn=buildroot.org;
 h=content-transfer-encoding:subject:cc:content-language:from:to
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nyDHIrFxrG3v3mE9/UpNq/D7bJcV5hTZcw2NZlsfH9A=;
 b=NYd/fF1NVwRiwiB/wVHciy9sUH4OsnWFqyVB5kaZE7Qe/eHs7VySE1w/TDbYfj2wCx
 pCAREJrOyEQwQlZWCn7YNWus77uIREn61+yRdwx4DPiz3YYS6GbAY9n12GBu40A1YbpV
 vkfAmqZchpcX1AlmU1p+ZPrNSJhHJdgpYgjMjtqMCwV9zX23Ptjgz/YvF7NY4kk2pyIp
 hxp1myxax680ZORYCA6IC/cm6mDq6C6rmwk9OXsYxu+4j6ui+7D2wBagP0duEB7mesME
 4RRgboKh7jDfrioxfo1v06cBTR+4BuLJZt4n7MHLSyjxZmHoxrJQx+XSemtgdRfLLJoA
 xC1A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=NYd/fF1N
Subject: [Buildroot] Thank you for fixing the fuzz-0 fallout
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
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

IMKgSGkgRGFyaW8sCgogwqBJJ2QgbGlrZSB0byB0aGFuayB5b3UgZXhwbGljaXRseSBmb3IgZml4
aW5nIHRoZSBmYWxsb3V0IG9mIHRoZSBmdXp6LTAgY2hhbmdlLiAKVGhhdCB3YXMgYSBiaWcgY2hh
bmdlIHRoYXQgdG91Y2hlcyBhIGxvdCBvZiBwYWNrYWdlcyB0aGF0IHlvdSdyZSBwcm9iYWJseSBu
b3QgCnJlYWxseSBpbnRlcmVzdGVkIGluLCBhbmQgaXQncyBncmVhdCB0byBzZWUgeW91IHRha2Ug
c28gbXVjaCByZXNwb25zaWJpbGl0eSBmb3IgaXQuCgogwqBUaGFuayB5b3UgdmVyeSBtdWNoIQoK
CiDCoFJlZ2FyZHMsCiDCoEFybm91dAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
