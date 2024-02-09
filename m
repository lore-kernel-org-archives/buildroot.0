Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D5A1C4828F
	for <buildroot@archiver.kernel.org>; Fri,  9 Feb 2024 11:16:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 946F94013B;
	Fri,  9 Feb 2024 11:16:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xGwyQ8U5aPPB; Fri,  9 Feb 2024 11:16:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D2FA40C3F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D2FA40C3F;
	Fri,  9 Feb 2024 11:16:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B51A21BF2CD
 for <buildroot@lists.busybox.net>; Fri,  9 Feb 2024 11:16:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A29348456C
 for <buildroot@lists.busybox.net>; Fri,  9 Feb 2024 11:16:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VAmv9wvLOCTB for <buildroot@lists.busybox.net>;
 Fri,  9 Feb 2024 11:16:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B412984540
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B412984540
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B412984540
 for <buildroot@buildroot.org>; Fri,  9 Feb 2024 11:16:29 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5101cd91017so839162e87.2
 for <buildroot@buildroot.org>; Fri, 09 Feb 2024 03:16:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707477387; x=1708082187;
 h=content-transfer-encoding:subject:to:from:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=2s3rneSFVponTlVWYpfgzTXciwwJWcif+jBwZUwGLNQ=;
 b=fTAhVBAVRoKjhhxZWQdEcZa+kAKQFVKGTag4V5ZwekfYqPuPQu4nNF/D555SAArFz5
 YddNwTR83H5fTlSH6mow4nveW23wT9DFuzcn9Jd5vilbBPAHmwBAgKMa2saSDe0QmLbW
 LV80YaEyhXOfRvuOU9SHFYlQGf5fCOVKsAfkvM1Ggy20GId8yYq5vmf52NFL6g0PxrA5
 MlInRiAixT1i34NIcW5OHWuRG5mnL9K+gRqWHwxRCa71As0HCmPQjDt1xOUw1WX3pBMd
 FclbsxJQw5dHhlAk++IIqFVRi1W6tQlbTQXuojz5OF/xvPYY3uM2paoDWdT6XYGCXZ5R
 XFag==
X-Gm-Message-State: AOJu0YwT1sqzAG2+veuPDdGNfxkxHZIPZM/+lcrbRGVMkhSsSvt9T+E6
 OXAgFi+/bHbQ6e8O0msu4O7VYhoq4wOSqo0X5xHALrwX2whr0ve+qcu4/TnpDHqZ9S3ROE245HQ
 r
X-Google-Smtp-Source: AGHT+IE4+pjf+clDgECe/pxm2I1HbTqG8MWfKI/rD5AgW8oecYH5Azi5LLuBCe+75C3sfcu/tKuD/A==
X-Received: by 2002:ac2:5a5d:0:b0:511:5548:ad01 with SMTP id
 r29-20020ac25a5d000000b005115548ad01mr878077lfn.44.1707477386931; 
 Fri, 09 Feb 2024 03:16:26 -0800 (PST)
Received: from [10.1.0.191] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 cx8-20020a170907168800b00a3bbe53fc93sm664435ejd.44.2024.02.09.03.16.26
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Feb 2024 03:16:26 -0800 (PST)
Message-ID: <b7474768-4cd0-4893-a36f-e91d6a74fe12@mind.be>
Date: Fri, 9 Feb 2024 12:16:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Buildroot Mailing List <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707477387; x=1708082187; darn=buildroot.org;
 h=content-transfer-encoding:subject:to:from:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2s3rneSFVponTlVWYpfgzTXciwwJWcif+jBwZUwGLNQ=;
 b=CWtec7lkqwJt2JImtaT6+Dg5PBavPIcqmGw/2xdn404DpZQYQlqzJ6FdcQemyru+Hy
 4ZjkqLWqTY2sQ7V1Z66CAhNgXgdwHXWiTWIkBFlwyh9R+E3vMg6ORa4Nj2sGG62Yj3c3
 2vA3XQFOxGePiFYeDDvyp2gcG1uUz60WblfzqzgAkPyF4ONR6ZT837kh4oXFFXu9yiXG
 Tb/DekGPXaqTzJ8F4cNPiqhWxCogchV/vrvUBD9X6cPQiFm5DnWCTNc/vnMOBLu52+RW
 QbkfGy6D4M1HtdKARyo0DxmB9hnM4jETsWMQj6fZ72JqfRvbjSoPok37GQV9WBtfDhhC
 2Z7g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=CWtec7lk
Subject: [Buildroot] Buildroot on LInkedIn
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

IMKgSGVsbG8gYWxsIEJ1aWxkcm9vdCB1c2VycyEKCiDCoEluIG9yZGVyIHRvIGRvIGEgYml0IG1v
cmUgbWFya2V0aW5nIGZvciBCdWlsZHJvb3QsIHdlIGhhdmUgY3JlYXRlZCBhIExpbmtlZEluIApw
YWdlIGZvciB1cyEKCiDCoElmIHlvdSB3b3VsZCBsaWtlIHRvIHNwcmVhZCB0aGUgd29yZCBhIGxp
dHRsZSwgeW91IGNhbiByZS1wb3N0IHRoZSBhbm5vdW5jZW1lbnQ6CgpodHRwczovL3d3dy5saW5r
ZWRpbi5jb20vcG9zdHMvYnVpbGRyb290X2J1aWxkcm9vdC1maW5hbGx5LWhhcy1hLWxpbmtlZGlu
LXByZXNlbmNlLWFjdGl2aXR5LTcxNjE2Nzc3NTkxNTk3MjE5ODUtbUN6UD91dG1fc291cmNlPXNo
YXJlJnV0bV9tZWRpdW09bWVtYmVyX2Rlc2t0b3AKCkFuZCBvZiBjb3Vyc2UsIGZvbGxvdyB0aGUg
cGFnZSA6LSkgQmV0dGVyIHlldCwgdGVsbCBvdGhlciBwZW9wbGUgKHdobyBkb24ndCB3YW50IAp0
byBiZSBvbiB0aGUgbWFpbGluZyBsaXN0IC0gSSdtIHRoaW5raW5nIG1hbmFnZXIgdHlwZXMgaGVy
ZSkgdG8gZm9sbG93IHRoZSBwYWdlLgoKCiDCoE5vdyBvZiBjb3Vyc2UgdGhlIHF1ZXN0aW9uIGlz
IGlmIHRoZXJlIHdpbGwgYmUgYW55IGNvbnRlbnQgdG8gcG9zdC4uLgoKCiDCoFJlZ2FyZHMsCiDC
oEFybm91dAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
