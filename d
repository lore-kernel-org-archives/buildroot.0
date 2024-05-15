Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4982BC04FFE
	for <buildroot@archiver.kernel.org>; Tue, 14 May 2024 09:36:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 09AF1416F4;
	Tue, 14 May 2024 09:36:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rhrTHYHIEARH; Tue, 14 May 2024 09:36:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96097416CD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 96097416CD;
	Tue, 14 May 2024 09:36:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 473B51BF293
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 09:36:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B536782733
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 09:36:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mHfv_4GnWYzN for <buildroot@lists.busybox.net>;
 Tue, 14 May 2024 09:36:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::536; helo=mail-pg1-x536.google.com;
 envelope-from=gnijieb@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 751B682EB6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 751B682EB6
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 751B682EB6
 for <buildroot@buildroot.org>; Tue, 14 May 2024 09:36:00 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-61be599ab77so2419368a12.1
 for <buildroot@buildroot.org>; Tue, 14 May 2024 02:36:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715679360; x=1716284160;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AIG9UFxgo/R6Na2llMOBPsWuyq1kdtzvtLHCKs5yKRE=;
 b=daugBSfseagV9D38h2eMG1BNGLn5csKP0LtFguTj7ajurl7wL/RZGT4rBEvuE/6M79
 eaamdCHwL9gUNx4S+MfWDLMdkAdnLjYJLq1YlPnICv5QKK5j0gwZRTtgr+pb5aMopCgT
 8wRCuKoIdBObmDGsurtpUDD1bWCVFbMPpWaigy0Tofu5kRuw+MQ5SPQNHAK+gRJYuDgC
 eqN14GrxvvT5vW1kTXuUu6aFbJBvfQAPPua3ts2KNiPvp/4QOTtEmP4MZNyT9zW7UOMz
 JOuSgPouSaB8uNgdUHqWZQk+Q4+huIKRV83r6kDgQzPKSRREphsjBBojKBBm4fTVtL1x
 FDJw==
X-Gm-Message-State: AOJu0Yz8O4B1puebUy6sOxI/L0b63Lm9xMhf6MO6drs47yYjP/H1yEfr
 ScoPnFqEvKu6Sf9k5BzXSHyBwy6rZ1nNb0X9S9oxbAcc0g9ivcNoP8bz+tO0CP+b3DvFCLW7Ftj
 mE+1InVa2DZWS/DqcGoMfx5Kpb0xQag==
X-Google-Smtp-Source: AGHT+IFS5r8czj3IEDDH1xBVhWH0ai1/qfHyPKziUgxHYUgAseVdClhUNLJPJLPCRwsdTrKC7xW6o82/+z0QugQoNwA=
X-Received: by 2002:a05:6a20:96d2:b0:1af:d810:9d0e with SMTP id
 adf61e73a8af0-1afde1c57dfmr11052116637.49.1715679359658; Tue, 14 May 2024
 02:35:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240327140125.154985-1-andreas.hilse@gmail.com>
 <20240513231942.2dd93919@windsurf>
 <CANabuZd8jPu9hGAcTFKOcCoC1w_uA3gZAXvfb=CqeUgRy7d+VA@mail.gmail.com>
In-Reply-To: <CANabuZd8jPu9hGAcTFKOcCoC1w_uA3gZAXvfb=CqeUgRy7d+VA@mail.gmail.com>
Date: Tue, 14 May 2024 11:35:48 +0200
Message-ID: <CANabuZcCbpoacwk5sfOMy-Ec0NK+sqS4kFR7UGaPL=HtTQ0P2Q@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1715679360; x=1716284160; darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AIG9UFxgo/R6Na2llMOBPsWuyq1kdtzvtLHCKs5yKRE=;
 b=S3wJHBJr7sXMwecFFl1E6FfxIg4m0c/PJ6Ea86NtCYRs+gGbnnqe7lBmby8yiEbdxF
 xci6JICp1Zlt7498r7p47/WM5vrAeQroMZnp+sWSeP1ew5KpXILXvKuGsEvs8yaRc3dZ
 abpu8LTG5SloR2lJDEImQtR+CCbii6XFZUKFijcv9P7Dx0M/tdLK53o4H/xop2dJv0Ic
 LuUba1NhHypVGcfaYlNRNd5EE1IQhk4mAQjRroc3MAxmjU4KXax98sN5rr0F7cAJtSMg
 F49qWkvxNiBjZ9L2+W44Sm9woHqxER2YiWOgk6ZREMaiXgmwH1s3hWGwkdfmVFlvCxoN
 R2xg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=S3wJHBJr
Subject: Re: [Buildroot] [PATCH] linux-pam: add patch for spurious password
 expires in 0 days warning
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
From: Andreas Hilse via buildroot <buildroot@buildroot.org>
Reply-To: Andreas Hilse <andreas.hilse@googlemail.com>
Cc: Andreas Hilse via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLAoKSWdub3JlIG15IGxhc3QgbWFpbCwgdGhlIHZlcnNpb24gYnVtcCB0byAx
LjYuMSBoYXMgYWxyZWFkeSBiZWVuCmNvbW1pdHRlZCB0byBtYXN0ZXIuCgpUaGFua3MhCgpPbiBU
dWUsIE1heSAxNCwgMjAyNCBhdCAxMTozM+KAr0FNIEFuZHJlYXMgSGlsc2UKPGFuZHJlYXMuaGls
c2VAZ29vZ2xlbWFpbC5jb20+IHdyb3RlOgo+Cj4gSGVsbG8gVGhvbWFzLAo+Cj4gVGhlcmUgaXMg
YWxyZWFkeSBhIG5ldyB2ZXJzaW9uIDEuNi4xIHJlbGVhc2VkIGJ5IGxpbnV4LXBhbSB0aGF0Cj4g
Y29udGFpbnMgdGhlIGJ1Z2ZpeC4gSSBndWVzcyB1cGRhdGluZyBkaXJlY3RseSB3b3VsZCBiZSBi
ZXR0ZXIuCj4gV2hhdCBkbyB5b3UgdGhpbms/Cj4KPiBUaGFua3MhCgoKCi0tIApNaXQgZnJldW5k
bGljaGVuIEdydWVzc2VuCkFuZHJlYXMgSGlsc2UKCkhlaW5yaWNoLUtpcmNobmVyLVN0cmFzc2Ug
MzIsIDkxMDU2IEVybGFuZ2VuLCBHZXJtYW55Ck1vYmlsZSArNDkgKDE3NikgMTA1MDI2MTgKbWFp
bHRvOmFuZHJlYXMuaGlsc2VAZ29vZ2xlbWFpbC5jb20KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
