Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA3AC25B74
	for <buildroot@archiver.kernel.org>; Mon, 27 May 2024 09:16:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A9ED640BC5;
	Mon, 27 May 2024 09:16:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wUnqC9dZHavm; Mon, 27 May 2024 09:16:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B19C740BE7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B19C740BE7;
	Mon, 27 May 2024 09:16:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2F5E81D1A77
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 09:16:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1BE9460717
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 09:16:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2g9r2BvHM05d for <buildroot@lists.busybox.net>;
 Mon, 27 May 2024 09:16:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1133; helo=mail-yw1-x1133.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 260E5605C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 260E5605C2
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 260E5605C2
 for <buildroot@buildroot.org>; Mon, 27 May 2024 09:16:55 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-628c1f09f5cso39958767b3.1
 for <buildroot@buildroot.org>; Mon, 27 May 2024 02:16:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716801415; x=1717406215;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5OEojT2PlbjoJ7nKMbGThHFx+b110wtSxJKnZ9o4USM=;
 b=Im5OD/JNMwrO6yM71GMWYpdm/FQWqXnIuNg2i3nQgUYv7qH8UStyhDUR0OcCJ257lX
 4i3ERPvAZOocwflfmbp4EmuURH9S5sxxQU+x8Y7dsTpuBj15xBPn0hgvCm8FqE4jf5vw
 5PV1JS2Nz1iYi/IjRSwDzSri7JbNNrRNs3CbFpo2DlDBFQAdnQy4VVEkr0tI6eDiGG40
 baj1ADkvyz39wkHbv/xAEDD81di2cDDqkqDJHSFsNpL+Nnw1QXzpze6ey8/OkWZJ6R0w
 rpM8BWd/ngRtye1p6bxIGObZCFQJBTTQfGEEqcCAaJcAk8FD69sJf3lRWlC+9PMuhvR2
 ZjzQ==
X-Gm-Message-State: AOJu0Yyuj3UWvG9lk1pmVthRlI1bLRPKXSdqQOVBuF9CiQ08ot8dxl5a
 Hr9ZQDq9tHb4TR4ZzcYYY756MInshD4H/a8GgD3eXOQf9yXjAwAtapWNv5zp+q0KxY1WafgJbni
 b2IUGGWI6ZuO4UF90+9nUQDaDmil6ovMYH5W1lQ==
X-Google-Smtp-Source: AGHT+IGhmCGtyjhYzL23rJ6F3mEvfvsFv+MqcGjMnxZwTG6xMANqApXsuYlc5Xt35+wmoN+QHJ8Vmb+Mz3VbmDiyStM=
X-Received: by 2002:a81:8443:0:b0:61b:3304:ce04 with SMTP id
 00721157ae682-62a08f8c213mr108888067b3.34.1716801414747; Mon, 27 May 2024
 02:16:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240526200110.3480893-1-dario.binacchi@amarulasolutions.com>
 <87fru3d3bd.fsf@dell.be.48ers.dk>
In-Reply-To: <87fru3d3bd.fsf@dell.be.48ers.dk>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Mon, 27 May 2024 11:16:43 +0200
Message-ID: <CABGWkvphwkA_xRbY31Fb_rH6=7ahrgMWFPh_O5D0pQ08rRsQsw@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1716801415; x=1717406215;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5OEojT2PlbjoJ7nKMbGThHFx+b110wtSxJKnZ9o4USM=;
 b=SbWnRpClW5yvfquhN6rOPJNCpbZSFta7MbLf1QYn4IvUEGwVeMNicyDYSjDJhDTBk7
 oeoyFPcGMcwoOFYUopHbq6StQKXohVyOoDfQ2PvjEz3Adkryp8maR9cFRdWPBG+/5Rn1
 3dXj7pRsY72iMcy2DVkiN7VHGWbWwsEdsxii0=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=SbWnRpCl
Subject: Re: [Buildroot] [PATCH v2] configs/at91sam9x5ek_dev_defconfig: fix
 Linux compilation errors
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
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUGV0ZXIsCgpPbiBNb24sIE1heSAyNywgMjAyNCBhdCAxMToxNOKAr0FNIFBldGVyIEtvcnNn
YWFyZCA8cGV0ZXJAa29yc2dhYXJkLmNvbT4gd3JvdGU6Cj4KPiA+Pj4+PiAiRGFyaW8iID09IERh
cmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4gd3JpdGVz
Ogo+Cj4gID4gVGhpcyBjb21taXQgYXBwbGllcyB0aGUgYmFja3BvcnQgcGF0Y2ggb2YgdXBzdHJl
YW0gY29tbWl0Cj4gID4gNzkwNzU2YzdlMDIyOWRlZGM4M2JmMDU4YWM2OTYzMzA0NWIxMDAwZSB0
byB0aGUgNC4xOS55IHN0YWJsZSBrZXJuZWwuCj4KPiAgPiBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBC
aW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4gID4gLS0tCj4g
ID4gQ2hhbmdlcyB2MSAtPiB2MjoKPiAgPiAtIFVzZSB1cHN0cmVhbSBwYXRjaAo+Cj4gQ29tbWl0
dGVkIGFmdGVyIGV4dGVuZGluZyB0aGUgY29tbWl0IGRlc2NyaXB0aW9uIHRvIG1lbnRpb24gdGhh
dCB0aGlzIGlzCj4gY2F1c2VkIGJ5IGJpbnV0aWxzIDIuNDEsIHdoaWNoIHdlIG5vdyBkZWZhdWx0
IHRvLCB0aGFua3MuCj4KPiBDb3VsZCB5b3UgYWxzbyBzZW5kIGEgcGF0Y2ggYWRkaW5nIEJSMl9E
T1dOTE9BRF9GT1JDRV9DSEVDS19IQVNIRVMgZm9yCj4gdGhlIGRlZmNvbmZpZyAoc2VlIC4vdXRp
bHMvYWRkLWN1c3RvbS1oYXNoZXMpPwoKT2ssIEkgd2lsbCBkbyBpdC4KVGhhbmtzIGFuZCByZWdh
cmRzLApEYXJpbwoKPgo+IC0tCj4gQnllLCBQZXRlciBLb3JzZ2FhcmQKCgoKLS0gCgpEYXJpbyBC
aW5hY2NoaQoKU2VuaW9yIEVtYmVkZGVkIExpbnV4IERldmVsb3BlcgoKZGFyaW8uYmluYWNjaGlA
YW1hcnVsYXNvbHV0aW9ucy5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
CgpBbWFydWxhIFNvbHV0aW9ucyBTUkwKClZpYSBMZSBDYW5ldmFyZSAzMCwgMzExMDAgVHJldmlz
bywgVmVuZXRvLCBJVAoKVC4gKzM5IDA0MiAyNDMgNTMxMAppbmZvQGFtYXJ1bGFzb2x1dGlvbnMu
Y29tCgp3d3cuYW1hcnVsYXNvbHV0aW9ucy5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
