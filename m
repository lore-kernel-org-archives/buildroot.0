Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B2CCD6E57
	for <buildroot@archiver.kernel.org>; Tue,  2 Jun 2026 22:50:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6ACAC42191;
	Tue,  2 Jun 2026 22:50:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RA_c0KM4MKA1; Tue,  2 Jun 2026 22:50:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 640894217A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780440623;
	bh=qTQ2wgId7jub4RsLNh6KowxYrJ8F7SSrg/X09Apk068=;
	h=References:In-Reply-To:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WNlENkAxndU4Z+4NVz043BH+RTpe50jSNWIb011Fa+VOdTKvkPD9l0tSboIti6uIP
	 IsaDFhQhVAQHCXzvjAhY3n3KZQgJ05GJkWFjN9qlak5O/swmDEH+6ZRav/dTyMOQoA
	 CVcrCLUdn5EQGT8S51+xIf12qsHamox3eU0pmMqoVGUef7+5dgHRztMCnqGas95Xw0
	 stEPwk7mwOosM5fg8SdArwsjMiMU2O+qNlhMRNmV45NqlPyml1+EQdvIcsHWBGny5W
	 mH+o72jROITBJVNqRWyIHItPc3+hl8BxSEoPZw5AsuvELPeFGciRjgjqYY0EAbD3Qw
	 xG90APSiCkQ4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 640894217A;
	Tue,  2 Jun 2026 22:50:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D22F9192
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 22:50:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C3EC742182
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 22:50:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5aYOagNnKQqv for <buildroot@buildroot.org>;
 Tue,  2 Jun 2026 22:50:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::234; helo=mail-lj1-x234.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A31E74217E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A31E74217E
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A31E74217E
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 22:50:20 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-3967725a77fso31012221fa.1
 for <buildroot@buildroot.org>; Tue, 02 Jun 2026 15:50:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780440618; x=1781045418;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4a+IECgZoKi/N8MitR0xdxt7ro6AzoNJ5euL3fICbyU=;
 b=jeSB5bjXoCq72SE3j0bHExWF5Ewa6t/QhSW50jeJfyIrAqcIPQxmyOzjWrLotKYJwp
 vZ3c0QbhKyG+BMaqdpqsTnv9EciHNkOZBpsVWgtUSEzJOhVrmry8eDwgnROFbOALP+bK
 UDjEQczXYDLCX2cKpxPxW57e6B934k0Ilgc4RJn+nGYrHmBEG8wEMTwFOh27lSdrkQM0
 TxTVfRIzjaWDBWocrS0tS3J6Kv+ZwG7u4lsVipdmVYu0ZQ9ULhXkm2l412tPb2prL7SS
 HcMLV0hzW9fvExtqdeaIhPhdwaol6xBkLimE+StXe4lBlL50x1P3oqHrX0RkJdj25Heg
 bEUQ==
X-Gm-Message-State: AOJu0Yyer6nQOa1kGuQHZw7/R6FjLs+bIDWM0zT+gSWK1G61XxU+N4Uw
 wJM3T9FzWrmnJ5OhMbpBBwtUzEK9ZxH9nkrzQLbjcPoS2yhFYvuI3ewwChPSLTCi8RXuRMYrTzw
 0VwM9v1cU8A==
X-Gm-Gg: Acq92OF7dyaTlKP084C4ETK3VJ6JzWBV8NOXC4iNPdOrmOF2CmmzqZiCVCH+1eUebNC
 hjwR7PzWH0k0mfZgBdY/4OCo5ZGg7sU4rDsKN4oyMEjVx9AsFUYH8URTCEe29hf6SfHimIsOO1g
 r1JrzfYziAwqlH34Qqzsyb2lZ0L7iC1fM77FsNmFOhAcn5WLOZwbfiVPLSV4fEIlCbqsNDI+TTt
 slzPtytQDykN6R6f4BhfAtrDhQJFVAM/GpIkZP+3n0zfWoEi1LsfFHbcvM3/HSh3reRG29H1kej
 rZWULd7YovVbOr/mubUSslQWxbUa9bmK7lodnQyapYQZb3Gff9CPg3pXh+e9bBbfizToxrwculA
 4LTtnTgR1BT8YwfRjjUEm205PmToTNzpm4bnSViQXAMIuDWJrn1Mz9OFFw4yWTnPF8NAjTeRmIB
 1fvA1Ywm+8Rqfe4KeVMdkghFjpBnxnAmzlESqFv3jUv1eRQHvmeYS7CXgxG3+bCplvrU0Jqohf
X-Received: by 2002:a05:651c:b25:b0:395:6085:a15f with SMTP id
 38308e7fff4ca-396af172808mr1558931fa.9.1780440618018; 
 Tue, 02 Jun 2026 15:50:18 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com.
 [209.85.167.44]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-396ac2d5a98sm3685611fa.35.2026.06.02.15.50.14
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2026 15:50:15 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-5aa68cf03bfso3493682e87.0
 for <buildroot@buildroot.org>; Tue, 02 Jun 2026 15:50:14 -0700 (PDT)
X-Received: by 2002:a05:6512:1296:b0:5aa:6c7c:65d2 with SMTP id
 2adb3069b0e04-5aa7c09a963mr273464e87.11.1780440614341; Tue, 02 Jun 2026
 15:50:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260602210756.2837692-1-peter@korsgaard.com>
In-Reply-To: <20260602210756.2837692-1-peter@korsgaard.com>
Date: Tue, 2 Jun 2026 15:50:01 -0700
X-Gmail-Original-Message-ID: <CA+h8R2oGJC0UaHWJJXviFq-WVonw5j+TMXe6X5wzW_0GQpWdhw@mail.gmail.com>
X-Gm-Features: AVHnY4LMvhrOCXceJFEJZicmDZE6BWzvIW3A4guyT-0pupdsAZoBZTmi-LK1ft8
Message-ID: <CA+h8R2oGJC0UaHWJJXviFq-WVonw5j+TMXe6X5wzW_0GQpWdhw@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1780440618; x=1781045418; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4a+IECgZoKi/N8MitR0xdxt7ro6AzoNJ5euL3fICbyU=;
 b=xv32tqrSKh37yiOCnsHGmVswxgUmKlAfJt3rujVsRoljkripyMXcwlIAejp/rlmbzt
 kenttZvF0d34kBNRgnY/TkWfhZHxkN9bcvhzI2If0iirjnjAcZwEnLSuPFdp4Uup85hr
 xltrQIwUQzVe/U8S8KvgftgoCtI5gQCcO/j8uJdpWUolm/O3jfFwHcAsmFsFHLpBnlyb
 i5yjOz8TMHg+8/UtoUTt5vtNZ0i6HMExDcI/fCBe29GOQk+CHMYnxO5+d/ssKsaBU2s8
 6rnkYWzgddymFp0FZ7XJZNu+0/aLJdCo1vbIU5MEsWxuo1yrDhhv3/fCk3w9tgIPW4kj
 GPFg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=xv32tqrS
Subject: Re: [Buildroot] [PATCH] package/runc: security bump to version 1.3.5
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUGV0ZXIsCgpPbiBUdWUsIEp1biAyLCAyMDI2IGF0IDI6MDfigK9QTSBQZXRlciBLb3JzZ2Fh
cmQgPHBldGVyQGtvcnNnYWFyZC5jb20+IHdyb3RlOgo+Cj4gRml4ZXMgdGhlIGZvbGxvd2luZyBz
ZWN1cml0eSBpc3N1ZXMgKDEuMy4zKToKPgo+IC0gQ1ZFLTIwMjUtMzExMzM6IGNvbnRhaW5lciBl
c2NhcGUgdmlhICJtYXNrZWQgcGF0aCIgYWJ1c2UgZHVlIHRvIG1vdW50IHJhY2UKPiAgIGNvbmRp
dGlvbnMKPiAgIGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuY29udGFpbmVycy9ydW5jL3NlY3VyaXR5
L2Fkdmlzb3JpZXMvR0hTQS05NDkzLWgyOXAtcmZtMgo+Cj4gLSBDVkUtMjAyNS01MjU2NTogY29u
dGFpbmVyIGVzY2FwZSB3aXRoIG1hbGljaW91cyBjb25maWcgZHVlIHRvIC9kZXYvY29uc29sZQo+
ICAgbW91bnQgYW5kIHJlbGF0ZWQgcmFjZXMKPiAgIGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuY29u
dGFpbmVycy9ydW5jL3NlY3VyaXR5L2Fkdmlzb3JpZXMvR0hTQS1xdzl4LWNxcjMtd2M3cgo+Cj4g
LSBDVkUtMjAyNS01Mjg4MTogY29udGFpbmVyIGVzY2FwZSBhbmQgZGVuaWFsIG9mIHNlcnZpY2Ug
ZHVlIHRvIGFyYml0cmFyeQo+ICAgd3JpdGUgZ2FkZ2V0cyBhbmQgcHJvY2ZzIHdyaXRlIHJlZGly
ZWN0cwo+ICAgaHR0cHM6Ly9naXRodWIuY29tL29wZW5jb250YWluZXJzL3J1bmMvc2VjdXJpdHkv
YWR2aXNvcmllcy9HSFNBLWNncngtbWM4Zi0ycHJtCj4KPiBJbiBhZGRpdGlvbiwgMS4zLjQgYW5k
IDEuMy41IGZpeGVzIGEgbnVtYmVyIG9mIHJlZ3Jlc3Npb25zLiAgRm9yIGRldGFpbHMsCj4gc2Vl
IHRoZSByZWxlYXNlIG5vdGVzOgo+Cj4gaHR0cHM6Ly9naXRodWIuY29tL29wZW5jb250YWluZXJz
L3J1bmMvcmVsZWFzZXMvdGFnL3YxLjMuMQo+IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuY29udGFp
bmVycy9ydW5jL3JlbGVhc2VzL3RhZy92MS4zLjIKPiBodHRwczovL2dpdGh1Yi5jb20vb3BlbmNv
bnRhaW5lcnMvcnVuYy9yZWxlYXNlcy90YWcvdjEuMy4zCj4gaHR0cHM6Ly9naXRodWIuY29tL29w
ZW5jb250YWluZXJzL3J1bmMvcmVsZWFzZXMvdGFnL3YxLjMuNAo+IGh0dHBzOi8vZ2l0aHViLmNv
bS9vcGVuY29udGFpbmVycy9ydW5jL3JlbGVhc2VzL3RhZy92MS4zLjUKPgo+IFNpZ25lZC1vZmYt
Ynk6IFBldGVyIEtvcnNnYWFyZCA8cGV0ZXJAa29yc2dhYXJkLmNvbT4KCkxndG0sClJldmlld2Vk
LWJ5OiBDaHJpc3RpYW4gU3Rld2FydCA8Y2hyaXN0aWFuQGFwZXJ0dXJlLnVzPgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
