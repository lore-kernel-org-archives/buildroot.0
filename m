Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8CB0CF9C69
	for <buildroot@archiver.kernel.org>; Tue, 24 Sep 2024 19:09:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6E02440E0C;
	Tue, 24 Sep 2024 19:09:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QHiP26evrEKc; Tue, 24 Sep 2024 19:09:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 478B140E0D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 478B140E0D;
	Tue, 24 Sep 2024 19:09:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E7D331BF3CB
 for <buildroot@lists.busybox.net>; Tue, 24 Sep 2024 19:09:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D6CCB40390
 for <buildroot@lists.busybox.net>; Tue, 24 Sep 2024 19:09:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kG5_6yhoCo0n for <buildroot@lists.busybox.net>;
 Tue, 24 Sep 2024 19:09:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com;
 envelope-from=festevam@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 080324035F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 080324035F
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 080324035F
 for <buildroot@buildroot.org>; Tue, 24 Sep 2024 19:09:46 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-5356bb55224so8022675e87.0
 for <buildroot@buildroot.org>; Tue, 24 Sep 2024 12:09:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727204985; x=1727809785;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AMtCcEZC1cF/p3yqvDTDAWKnHT1R/cfvnNZpuYpW3A0=;
 b=YVi5D8sU79Q1lVYhYLFjVVbug2DjU8yQ2njwqE3uqsp/nNzKG2fbSUQYmntOPrPQvA
 MyZggx2YwxmZC42piCs/YGF8g19oXDKEwPMU7NaFxgEdO6Vq8kVhmY6eeHcTlILZklOd
 1xk2FIYLOeFh4d1uLBLvENnbiA2Mwj+CRu5ckQ8DzYv8TYoS9kLzaSeKwut/vH2D+YKQ
 FuBLdPqJxwa/RDjRKVf/B7FWN/bKCRNcHShxx8rqEl4vOLHQYlAYt/Iawm+WCVu+iR+F
 3a10ikSUKPBx0fu/Oy243p0O9SEup2P2zP/CsFcop+6Uy5hWXQ+yPY3LINzaniMpK2b3
 agWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzJW/t0dbHfJSN6Tg/fGjmy8HZ9W7YfKIHorY8EwpA48puD6303R36/wRQTGYG7WwA5FwFWz+NAhQ=@buildroot.org
X-Gm-Message-State: AOJu0YxFeQ7CduS8kpn1uAPrcgX6+l9LQD3sekNanqRgOvpik0Pf05dc
 V8OrZaiuSe5PC8AFXXnG4SEmMbS0mrAOyPYXi57bFLR67bei29cq+fgQ/fvbMtA6kCqD2LNxI8Q
 ei4gJetthgsUYLHeCEQs7lxs0Z34=
X-Google-Smtp-Source: AGHT+IGHbeTO5VQO27HwBPDENpkFxNJaHCxGD1wS2viip1djDuIwehdSbVpqGj9oSWGGfY6zFHQY7Qr4SOw1NOmJr9c=
X-Received: by 2002:a05:6512:e8c:b0:533:4817:7280 with SMTP id
 2adb3069b0e04-53877537533mr64541e87.35.1727204984449; Tue, 24 Sep 2024
 12:09:44 -0700 (PDT)
MIME-Version: 1.0
References: <bf3a752a-6954-44dc-b805-c7850be85539@tungstencollaborative.com>
 <216539b9-4730-4adc-b400-655d287a082a@mind.be>
 <a9c3d961-ceda-4092-9830-27e3c4bd114b@gmail.com>
 <9d0c3fb8-a4ac-40f1-9608-a14ab281a861@mind.be>
 <f9a209f6-cca2-4f37-83d4-faa6ab86ac36@gmail.com>
 <e52f4b06-392d-42ce-be58-3987f85b4caf@mind.be>
 <5294b549-5641-49ba-b586-4e444494f599@gmail.com>
 <07c7a1e9-fa5b-4c4e-8d97-3175d9b4a454@mind.be>
 <7be9c48f-2504-40c7-98f3-236fc205b27e@gmail.com>
 <59faceb2-6814-432b-a888-a17549fd0bf4@gmail.com>
 <f7bf494a-a398-4f29-b730-a69ac46570f2@gmail.com>
In-Reply-To: <f7bf494a-a398-4f29-b730-a69ac46570f2@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 24 Sep 2024 16:09:32 -0300
Message-ID: <CAOMZO5CyhAAAvP1cViv=xdu14h4GjZ=S8eV=xO0SzcRJFPj1Pw@mail.gmail.com>
To: Neil Webster <jarraneil@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727204985; x=1727809785; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AMtCcEZC1cF/p3yqvDTDAWKnHT1R/cfvnNZpuYpW3A0=;
 b=KED+d3/BeFw28FfA9jfBQJghCpTcFfxKC8B7J1YMg63n7HGqj6M9rrPWsREWBmvPUt
 YNMP+Lm5+3+aDhJurAQ5XcDmRHwhR3md750+lWeIn/YTrxdqcPTk8EokuNJZ0v9Ds/bi
 hyOOrCfMsVkvVvAmGyfsN30FpJgqDmMb+3Kj8NTweBZr1RC0MtXFt+jT6DHMEfc6rr8H
 fJMknYKRTJq2bN0KQhfwg+K3JvXQpqBqiSpUl5kgYfbkjBIN+f4aHoUOPqgpyEynBh/E
 PDbarmypDRqWXJ9YzuSstrG18XXBad/h6JFC/kn46xKKEljmrreCEbUrUUe2iSRhQgGm
 /FRw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=KED+d3/B
Subject: Re: [Buildroot] Variscite Dart
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCBTZXAgMjQsIDIwMjQgYXQgNDowNeKAr1BNIE5laWwgV2Vic3RlciA8amFycmFuZWls
QGdtYWlsLmNvbT4gd3JvdGU6Cgo+IEJSMl9UQVJHRVRfVUJPT1RfQk9BUkRfREVGQ09ORklHPSJp
bXg4bW1fZXZrIgoKWW91IGNhbm5vdCB1c2UgdGhlIFUtQm9vdCBpbXg4bW1fZXZrX2RlZmNvbmZp
ZyBmb3IgdGhlIGkuTVg4TU0KVmFyaXNjaXRlIERhcnQgYm9hcmQuCgpZb3UgbXVzdCB1c2UgYSBz
cGVjaWZpYyBpLk1YOE1NIFZhcmlzY2l0ZSBEYXJ0IFUtQm9vdCBkZWZjb25maWcgaW5zdGVhZC4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
