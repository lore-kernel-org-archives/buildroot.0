Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB80DC54798
	for <buildroot@archiver.kernel.org>; Tue, 27 Feb 2024 20:41:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48D1581A34;
	Tue, 27 Feb 2024 20:41:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kF1p_YHZKkkN; Tue, 27 Feb 2024 20:41:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A08981AA7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A08981AA7;
	Tue, 27 Feb 2024 20:41:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 09DDB1BF294
 for <buildroot@lists.busybox.net>; Tue, 27 Feb 2024 20:41:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E90E781AA7
 for <buildroot@lists.busybox.net>; Tue, 27 Feb 2024 20:41:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zQjba7iDQZEt for <buildroot@lists.busybox.net>;
 Tue, 27 Feb 2024 20:41:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b29; helo=mail-yb1-xb29.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0FEA081A8E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FEA081A8E
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0FEA081A8E
 for <buildroot@buildroot.org>; Tue, 27 Feb 2024 20:41:16 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-dcbc6a6808fso4081990276.2
 for <buildroot@buildroot.org>; Tue, 27 Feb 2024 12:41:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709066476; x=1709671276;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qNMZ3G5Axj5UBfN52f2PNPYUDNxR+lyExA+KaGSz/HE=;
 b=pGQprpusnYgm9QYpQundeP3TOOGVLVsj/ihJMcFbxtbJmzlcNIuFzW1/Of0lpmfGl3
 nfPST0zreIhRN9m3RzSRSVrJKN9LKRmwbkEY3NhntvLLZk2oFWS1QP7uF1acKg/V6uBj
 XlNAQYZRJ2rXvuix+znhRzjAU5mOzIP8xZEKfHFiaXHJWZdU/lbmng5DS6DEpq7wXKqc
 Vg/TLRNMtAOzF3IpxIH0MMNqEw8vahkOuLC89YdxgcVYNAuBqweW4Yf13r0dlU5tUuXq
 c2D85ssjkVmCBHUAzA+dLcROaEU7AbZ0/4dG2L0kdG8rOCL5V+mCtxePtChTztNQjpvH
 lgrw==
X-Gm-Message-State: AOJu0YyfCQ0bLr5ISTZuMq3D/w5FweY7L1y1g6VW6Si8gmdSk20VRsvD
 4zvkFPdhW3eRPQKuX7oR4XLThp4MMpKEmgER/KJVBUo1xeJEKrtCLdSYw/i8kbX2tv2fh4q72IK
 R9BomJgKaTkQ578fviZmZbIruEBiv2UDG6hfRPQ==
X-Google-Smtp-Source: AGHT+IEI0SYbqBfYS5P0G9JXGqzzV26qS85EATrAZ6h5CASkgIr89vvUBTk1rIEg62DotIbN1kjK1RLMxo/Zwq9SM38=
X-Received: by 2002:a25:83cf:0:b0:dcd:128:ff3b with SMTP id
 v15-20020a2583cf000000b00dcd0128ff3bmr654264ybm.38.1709066475808; Tue, 27 Feb
 2024 12:41:15 -0800 (PST)
MIME-Version: 1.0
References: <20240224205654.1546744-1-dario.binacchi@amarulasolutions.com>
 <f56ed1032d3006e56e14c57be4c077d3199ad8a8.camel@gmail.com>
In-Reply-To: <f56ed1032d3006e56e14c57be4c077d3199ad8a8.camel@gmail.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 27 Feb 2024 21:41:04 +0100
Message-ID: <CABGWkvp2axJpgMFK+_OByKxG6nw0UwjCAHDgPqqVc7bip+z_oQ@mail.gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1709066476; x=1709671276;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qNMZ3G5Axj5UBfN52f2PNPYUDNxR+lyExA+KaGSz/HE=;
 b=K6VWvf8jH9i45/Km39SduQsnCdmcRXd7j0RvuL6LA/Rf/YAsjIAI3e56lfQMjJTiF4
 67xNfSNKCXyoVjvD3FcstDRg+KFo5+4mNoe5Qt2cgQgUm6Y41vCuIprWM1lqU57EdDBV
 stmqtUMcW0heshXxSzsMKxroe4sHVZjKQ7xYY=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=K6VWvf8j
Subject: Re: [Buildroot] [PATCH v6 00/16] Add support for AM62x-SK HS-FS
 devices
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
Cc: michael@amarulasolutions.com, Asaf Kahlon <asafka7@gmail.com>,
 Xuanhao Shi <X15000177@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@smile.fr>, Anand Gadiyar <gadiyar@ti.com>,
 linux-amarula@amarulasolutions.com, bryce@redpinelabs.com,
 Andreas Dannenberg <dannenberg@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQWxleGFuZGVyLAoKT24gVHVlLCBGZWIgMjcsIDIwMjQgYXQgODo0OeKAr1BNIEFsZXhhbmRl
ciBTdmVyZGxpbgo8YWxleGFuZGVyLnN2ZXJkbGluQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBIZWxs
byBEYXJpbywKPgo+IE9uIFNhdCwgMjAyNC0wMi0yNCBhdCAyMTo1NiArMDEwMCwgRGFyaW8gQmlu
YWNjaGkgd3JvdGU6Cj4gPiBUaGUgU0stQU02MkItUDEgaXMgdGhlIG5ld2VzdCB2ZXJzaW9uIG9m
IFNLLUFNNjIgd2hpY2ggaW5jbHVkZXMKPiA+IGhpZ2gtc2VjdXJpdHkgZmllbGQtc2VjdXJhYmxl
IChIUy1GUykgc2lsaWNvbiB0byBvcHRpb25hbGx5IGN1c3RvbWl6ZSBrZXlzCj4gPiBhbmQgZW5j
cnlwdGlvbiBmb3Igc2VjdXJpdHkgYXBwbGljYXRpb25zLgo+ID4gVGhpcyByZXF1aXJlcyBlbmFi
bGluZyB0aGUgQlIyX1RBUkdFVF9USV9LM19JTUFHRV9HRU5fU0VDVFlQRV9IU19GUyBvcHRpb24s
Cj4gPiB3aGljaCwgaG93ZXZlciwgd2FzIGJ1Z2d5LiBUaGlzIHNlcmllcyBmaXhlcyB0aGUgZXJy
b3JzIGFuZCBidW1wcyB0aGUgTGludXgKPiA+IGtlcm5lbCBhbmQgVS1Cb290IHJlcXVpcmVkIGZv
ciBzdWNoIGEgbmV3IGRldmljZS4KPgo+IGluIGNvbnRyYXN0IHRvIHlvdXIgdGVzdHMgYW5kIG15
IGxhc3QgdGVzdHMgb24gU0stQU02MkIgdGhpcyB0aW1lIEkndmUgdHJpZWQKPiBvbiBHUCBib2Fy
ZCAoU0stQU02MikgYW5kIHRoZSBidWlsZCAoZm9yIEdQKSBkaWRuJ3QgYm9vdCBvdXQgb2YgdGhl
IGJveC4KPgo+IEkndmUgYnJpZWZseSBjaGVja2VkIHRpYm9vMy5iaW4gYW5kIGl0J3MgdGhlIHNt
YWxsZXIgb25lIG9mIGFsbCwgc28gdGhpcwo+IHBhcnQgbG9va3MgY29ycmVjdC4gTWF5YmUgd2Ug
bmVlZCB0byBjaGVjayBpZiB0aGUgRmlybXdhcmUgYmxvYnMgYXJlIGNvcnJlY3QKPiBpbiBHUCBj
YXNlLi4uCgpJIGhhdmUgdGVzdGVkIGFsbCA3IHZlcnNpb25zIG9uIFNLLUFNNjJCIHN1Y2Nlc3Nm
dWxseSwgYnV0IEkgZG9uJ3QKaGF2ZSBhIEdQIGJvYXJkLgpDb3VsZCBpdCBiZSBhbiBvcHRpb24g
Zm9yIHlvdSB0byBmaW5kIG91dCB3aGljaCBpcyB0aGUgbGF0ZXN0IHZlcnNpb24KdGhhdCBhbHNv
IHdvcmtzIGZvciBHUD8KQSBzb3J0IG9mIHNlcmllcyBiaXNlY3Q/CgpUaGFua3MgYW5kIHJlZ2Fy
ZHMsCkRhcmlvCj4KPiAtLQo+IEFsZXhhbmRlciBTdmVyZGxpbi4KPgoKCi0tIAoKRGFyaW8gQmlu
YWNjaGkKClNlbmlvciBFbWJlZGRlZCBMaW51eCBEZXZlbG9wZXIKCmRhcmlvLmJpbmFjY2hpQGFt
YXJ1bGFzb2x1dGlvbnMuY29tCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCgoK
QW1hcnVsYSBTb2x1dGlvbnMgU1JMCgpWaWEgTGUgQ2FuZXZhcmUgMzAsIDMxMTAwIFRyZXZpc28s
IFZlbmV0bywgSVQKClQuICszOSAwNDIgMjQzIDUzMTAKaW5mb0BhbWFydWxhc29sdXRpb25zLmNv
bQoKd3d3LmFtYXJ1bGFzb2x1dGlvbnMuY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
