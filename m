Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7332D59D99
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 17:04:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C97080D75;
	Sun, 14 Dec 2025 17:04:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id crXIMydU9wsO; Sun, 14 Dec 2025 17:04:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9AFE080D1E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765731895;
	bh=NnV1SOxg/IGgv/HQd8dbGyWrGWTyWXSWhEFSl+VmOsg=;
	h=Date:From:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:From;
	b=nHpDzunG8xxP7gPgQqc3uSp8/G+9QkaXdT2gNo8+XYsY35ZjPAppAyovYxaDjc6Pg
	 oaWa1C4KF6H1qDwVdQvnL2UuZnCGWlcHNvPoW5jIkGXT8tsShaGJXkU3W7jDB0HS81
	 NNL0n8tswKg8XCS5zq36Nf4UlfhJDdC8F+gTUF0MA8msSRb2LolUJ/WKTCB+2WipJZ
	 BmVIP1KtiKWF0+8RK3bhwN7b7YYLj8MShOTwuk6RgHia+NdXpAz62poWj9c7C+Ku83
	 31Oh2D//Rzj0BYeAX363n1FejU5RKepHn1QYvYUyXkGmoAZTZKQe0O3seqT7hY9jXB
	 gT90LP+PYkL3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AFE080D1E;
	Sun, 14 Dec 2025 17:04:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 577DB2C1
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:04:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3E11B80D0E
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:04:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nzTHgKv2eWgQ for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 17:04:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E2D6980CDF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2D6980CDF
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E2D6980CDF
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:04:52 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4779a637712so18117665e9.1
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 09:04:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765731891; x=1766336691;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:reply-to:message-id:subject:cc:to:from:date
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=glZly3RqP3HPWGVhHeWQiOSW2cKivcmDWhX+Wlu5kHg=;
 b=sAwy7rjSQPW7nCosNHJvO9HRoyG8WA3RKnzzfwTybnpQMwCaYkcPOK7VBd2804Dw3v
 flKfPbG6TfNMEUeC8etaMu7+/OpKBDFjajYyo62uZhd70P4zdWcwMvRN5EOtvcGVsJ4g
 h6WHwsFm/nbqRs4qJx3IEcCkCJ6v6VX+HNkbtQOec52Hro7/qCmGjx3AamcOLC77b8wr
 dcM0n9O4MwOZ+/GThgeXgiyDSvGZb09w860+mOCLwKWB4cEfCfyO1mcbQH1/TQoaOO/Q
 apOCunjytFlO9uD6ZGMVVJKbKca4HVGE60bZQbOihzgAwY0OAVTsO2uxrgct3YAmO2et
 Eu2w==
X-Gm-Message-State: AOJu0YzEg4DOqfkR6q2V6ETnfKGmQFKveG0ci1tCZo/pHDuNypSDWZGN
 LM0YRcaAJPgGeXqgByRwlLzVllzZ+cIUmun6Pns+N3GQwl5uA5UeP7Ry
X-Gm-Gg: AY/fxX5i26xp2LWcPZaY/yU5RqJ/vCMi/7snthdGAHcC0z4vPHsJ4k1OhGLNt6bsXyW
 wSRu05CgCop0AlH1GWAAYcDPuswsOzlrSRThbyxGyVoAfm0LyD2CcV0rnNKJL1P5lyUrZN4uhKw
 bFS62/M5HwWUAM2cTkmT+KhbuLshx+HO6fb/jBxUAjq5dn3bG39FapSBjz2Wj8oijhz6BAKDVco
 eXw6wSv1wwvlFpVdfQnnMJa16zSWXu/LVLt+nvfzb4Ub03Xi3xcmmGNLPFVvbMNvMmB6egY8dDX
 waH7BvrqqJxpY/4zqhhdbHlHTsQNn9WHyDaQTRxo76KEEObFfn8IRSQarFkADJZjoCao58jJV3D
 o7rZuuz3k1ju2KQ1+ld2xDCJlJLYPyhSA8DY5s6FiR1RJl0IJb9dZfoJ9R07VCyKdwKOSQcTzQX
 yPY7KIWh52M0lfLOHYl4KpYK8TDBoxCk+oTV00MYC6um0+J2o5
X-Google-Smtp-Source: AGHT+IEzW74QftCvsueoDaDFLRiVuWY0qTiUwCY4SROLGtKXSlgSX5jmYDGAohyobHkCLI3/DbqG4A==
X-Received: by 2002:a05:600c:5294:b0:479:3a86:dc1f with SMTP id
 5b1f17b1804b1-47a8f91dab0mr82849895e9.37.1765731890539; 
 Sun, 14 Dec 2025 09:04:50 -0800 (PST)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a8f776898sm138431735e9.8.2025.12.14.09.04.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Dec 2025 09:04:48 -0800 (PST)
Date: Sun, 14 Dec 2025 18:04:45 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20251214170445.GB193459@pevik>
References: <20251213214107.1893921-1-giulio.benetti@benettiengineering.com>
 <0CE22F44-19C0-480A-A2D1-D4622642380F@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0CE22F44-19C0-480A-A2D1-D4622642380F@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765731891; x=1766336691; darn=buildroot.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:reply-to:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=glZly3RqP3HPWGVhHeWQiOSW2cKivcmDWhX+Wlu5kHg=;
 b=GxQc8hz/taD0+t8I2rpoF4Gz2b6Ly5OgyXETWahteOeNP7GWWh5YjMVcxGx3vOBy8U
 NpE8feydjHIsblgZ6ls+lYlqc41FYN+fbNgp5SaaHhqX1PKjDsp6jKFY33KT7VaQrQBo
 3XNGlROpUgmSYVuDsykSwilsIi90YPliePeEOFyvgJ47Ec7KNk5XfJXIN9mJf18yHG3O
 7qyDR2zg9buW1ZUaBKAJh4pJ+DNDEAVImIIedFMntsxV37ZBS+bRXKzQZQuEbTep4wFM
 MxSj1AFVblOFbEWQwuRyeA+mfLumyU+uIseYur7Sx01yqTzOatS1KplQNGH+ETB2VDEV
 xNZw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=GxQc8hz/
Subject: Re: [Buildroot] [PATCH v3 1/3] package/libtirpc: introduce
 BR2_PACKAGE_LIBTIRPC_RPCDB
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgYWxsLAoKPiBIaSwKCj4gPiBJbCBnaW9ybm8gMTMgZGljIDIwMjUsIGFsbGUgb3JlIDIyOjQx
LCBHaXVsaW8gQmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4g
aGEgc2NyaXR0bzoKCj4gPiDvu79QYWNrYWdlIGxpYnRpcnBjIHdpdGggY29tbWl0WzFdIGV4cG9z
ZXMgLS1lbmFibGUtcnBjZGIKdmVyeSBuaXQ6IGxvb2tzIGxpa2UgeW91ciBlZGl0b3IgdXNlcyBC
T00uIE5vdCBhIGJpZyBkZWFsLCBidXQgaWYgeW91IGhhdmUgdGltZQpJdCdkIGJlIG5pY2UgdG8g
Y29uZmlndXJlIGl0IG5vdCB0byBhZGQgaXQgd2hlbiB5b3UgbW9kaWZ5IHBhdGNoZXMuCgo+IGFu
ZCBkaXNhYmxlcyBpdCBieSBkZWZhdWx0IGRpZmZlcmVudGx5IGZyb20gYmVmb3JlIHRoYXQgY29t
bWl0LgoKKzEKCj4gPiBTbyBtYWtlIGl0Cj4gPiBzZWxlY3RhYmxlIHRvIGFsbG93IHBhY2thZ2Vz
IHRoYXQgdXNlIHJwY2RiIGZ1bmN0aW9ucyB0byBlbmFibGUgaXQKPiA+IGFuZCBidWlsZCBjb3Jy
ZWN0bHkuCgo+ID4gWzFdOgo+ID4gaHR0cHM6Ly9naXQubGludXgtbmZzLm9yZy8/cD1zdGV2ZWQv
bGlidGlycGMuZ2l0O2E9Y29tbWl0O2g9N2NlYThhZDY2YWVjYzIxZTZjYWFlMzMwYjVkMzEwNzVh
ZjM5OTE5MwoKPiA+IFNpZ25lZC1vZmYtYnk6IEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0
aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPgo+ID4gLS0tCgo+IFdvdWxkIGl0IGJlIHBvc3NpYmxl
IHRvIHJld29yZCBieSBhIG1haW50YWluZXIgd2l0aCB0aGUgY2hhbmdlIGFib3ZlPwoKUmV2aWV3
ZWQtYnk6IFBldHIgVm9yZWwgPHBldHIudm9yZWxAZ21haWwuY29tPgoKS2luZCByZWdhcmRzLApQ
ZXRyCgo+IEJlc3QgcmVnYXJkcyAKPiBHaXVsaW8KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
