Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CAA0C87FD3
	for <buildroot@archiver.kernel.org>; Wed,  6 Aug 2025 15:58:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC5A0411FE;
	Wed,  6 Aug 2025 15:58:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fftt-lUNe2UA; Wed,  6 Aug 2025 15:58:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D5EB410C1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D5EB410C1;
	Wed,  6 Aug 2025 15:58:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 86E4E31
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 15:58:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 81397410C1
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 15:58:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z4Y_vobGLGsd for <buildroot@buildroot.org>;
 Wed,  6 Aug 2025 15:58:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com;
 envelope-from=fabien.lehoussel@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5CEA841040
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CEA841040
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5CEA841040
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 15:58:44 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-55b96b154bdso56473e87.0
 for <buildroot@buildroot.org>; Wed, 06 Aug 2025 08:58:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754495922; x=1755100722;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=99CdLQRQ5TiFqfi2uHZHioAsHZV5tFMOuU8jV0RYjx4=;
 b=KY65UucBOFaDxbOg2r+q9FnhdhbSzIZlpqWyBORJYOoh6XjsvESKmk21i2DTXoQxIH
 vgKX3eOlLf7bnEZKghgc+nX6A4axbIrGlTe8Vbf8OCrRxBxWGRv+/uxByIe74A0Qwp9F
 DxIZJmaVFe9wZEOY7QOO1P2yv4Ks3RYVyRTyzXlVytAGGxifTt5wDMK6uSahiSm0gWVk
 TZrN5yw4tUiI1XIB6NjsUXnGVPe8xnRT3yHjZin3KmgW6C1hL62Yf3rIuZElbXpS5qnw
 M/q2X83oDeSdrGG19ok2ZJ2MP3Ro5wvvivWQxr62+V8um5DHgumUhAgSz+DFIvB1SRjy
 eKLA==
X-Gm-Message-State: AOJu0YyIkn08th7EGmIOy+fT8JeWkdNvuo7D/xmjMsS3s+F9Gbw2yrNQ
 82BIbXxFn/Oz3FyHgsMnd+tn5Y38C0SU0MDt4JrC8jLJ41IliW1ylU1d+fn5rhPBoLxYz4CB2Mr
 21xXi++F9h4TJsF3ZVcDBd6w3Few5x9VHHsMyZo3cz5XxE4epL6jY331vJQ==
X-Gm-Gg: ASbGncvLpswq8TEiBT/uW0sxMS6tJQrGd9KVIyPy4PsZwm2hmJ14LxFLo6JWOEMeIAi
 nCYWZmTkQAmm26XXal07uuoUPrHx06Xtn9hREO2E3UMTGxxiydRlXgeQaXFAiEhQEsIXsTBl8HQ
 HYNpbCTIubg+ONrGShtZl6M2l2ZoYHwgayKsOdDCSStCj38Htyh+v19gSBKU6y8z2/0JmSYNdEO
 zudWTBXYA==
X-Google-Smtp-Source: AGHT+IF+7Ki3bM9vz1j4QHKlCeyJAi5CuBkfVeZg/nDejKtNMoCebXtw6+VshwJR0yPL7jlN7pF7ZOqX8mHOu/xgBlI=
X-Received: by 2002:a05:6512:3053:b0:55b:973b:d9bf with SMTP id
 2adb3069b0e04-55caf35e31amr1189009e87.5.1754495922006; Wed, 06 Aug 2025
 08:58:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250716093401.1213358-1-fabien.lehoussel@smile.fr>
 <20250716093401.1213358-5-fabien.lehoussel@smile.fr>
 <87ldnwilxr.fsf@dell.be.48ers.dk>
In-Reply-To: <87ldnwilxr.fsf@dell.be.48ers.dk>
Date: Wed, 6 Aug 2025 17:58:31 +0200
X-Gm-Features: Ac12FXzvBaVAMxPykQYbyd3e_oBwwshorazpoQdI_j9-Dtxm7PLb7Mq9rrz3iu8
Message-ID: <CAKWtHtx781ztPikYLoD9XZZ_ZsFXdDUwv0KMDuqpx8F0Z3jWdQ@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1754495922; x=1755100722; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=99CdLQRQ5TiFqfi2uHZHioAsHZV5tFMOuU8jV0RYjx4=;
 b=isId6heq96eIajxP5DgAM9dvaS4fCC/rrdNeivMa6VndwwyXYysiuqZquN2hs6cYt4
 /LBo1fCmfypMUpNGfSgSaQ0XG2PmnxIuB7nPXK91AT+j1zySjzU1j0p2V/d4V8q+zTXi
 UYVCVT7OqEGC/CFnGUpMedcD5VtBERJVM3Csg=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=isId6heq
Subject: Re: [Buildroot] [PATCH v2 5/5] utils/generate-cyclonedx: add source
 field to CVE entries
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
From: Fabien LEHOUSSEL via buildroot <buildroot@buildroot.org>
Reply-To: Fabien LEHOUSSEL <fabien.lehoussel@smile.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
 Fabien Lehoussel via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgbWVyLiA2IGFvw7t0IDIwMjUgw6AgMTY6MDYsIFBldGVyIEtvcnNnYWFyZCA8cGV0ZXJAa29y
c2dhYXJkLmNvbT4gYSDDqWNyaXQgOgo+Cj4gPj4+Pj4gIkZhYmllbiIgPT0gRmFiaWVuIExlaG91
c3NlbCB2aWEgYnVpbGRyb290IDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JpdGVzOgo+Cj4g
ID4gTWFuZGF0b3J5IGZvciBEZXBlbmRlbmN5VHJhY2sgY29tcGF0aWJpbGl0eQo+ICA+IFNpZ25l
ZC1vZmYtYnk6IEZhYmllbiBMZWhvdXNzZWwgPGZhYmllbi5sZWhvdXNzZWxAc21pbGUuZnI+Cj4K
PiBBcm5vdXQgbWVudGlvbmVkIGluCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnVpbGRyb290
L2Q4NWE5NTg3LWExZjAtNGJkZC04NzZkLTkzOTE2MDEwMjc0NkBybm91dC5iZS8KPiB0aGF0IGl0
IGlzIG1hcmtlZCBhcyBvcHRpb25hbCBpbiB0aGUgY3ljbG9uZWR4IHNwZWMuIENhbiB5b3UgY2xh
cmlmeQo+IHdoYXQgaXMgdGhlIGRpZmZlcmVuY2UgaW4gYmVoYXZpb3VyIGluIERlcGVuZGVuY3lU
cmFjayBpZiB0aGlzIGlzCj4gaW5jbHVkZWQ/CgpJJ2xsIHJ1biBhIGZldyBtb3JlIHRlc3RzLCBi
dXQgSSByZW1lbWJlciB0aGF0IHRoZSBpZGVudGlmaWVkIENWRXMKd2VyZSBub3QgcmVjb2duaXpl
ZCB3aXRob3V0IHRoaXMgZmllbGQgaW4gRFQgdjQuMTIuMQoKPiA+IC0tLQo+ICA+ICB1dGlscy9n
ZW5lcmF0ZS1jeWNsb25lZHggfCA0ICsrKysKPiAgPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKQo+Cj4gID4gZGlmZiAtLWdpdCBhL3V0aWxzL2dlbmVyYXRlLWN5Y2xvbmVkeCBiL3V0
aWxzL2dlbmVyYXRlLWN5Y2xvbmVkeAo+ICA+IGluZGV4IGQyODc1MDczNWYuLjVlZmZhMDI4MmMg
MTAwNzU1Cj4gID4gLS0tIGEvdXRpbHMvZ2VuZXJhdGUtY3ljbG9uZWR4Cj4gID4gKysrIGIvdXRp
bHMvZ2VuZXJhdGUtY3ljbG9uZWR4Cj4gID4gQEAgLTIyOCw2ICsyMjgsMTAgQEAgZGVmIGN5Y2xv
bmVkeF92dWxuZXJhYmlsaXRpZXMoc2hvd19pbmZvX2RpY3QpOgo+Cj4gID4gICAgICByZXR1cm4g
W3sKPiAgPiAgICAgICAgICAiaWQiOiBjdmUsCj4gID4gKyAgICAgICAgInNvdXJjZSI6IHsKPiAg
PiArICAgICAgICAgICAgIm5hbWUiOiAiTlZEIiwKPiAgPiArICAgICAgICAgICAgInVybCI6ICJo
dHRwczovL252ZC5uaXN0Lmdvdi92dWxuL2RldGFpbC8iICsgY3ZlCj4gID4gKyAgICAgICAgfSwK
PiAgPiAgICAgICAgICAiYW5hbHlzaXMiOiB7Cj4gID4gICAgICAgICAgICAgICJzdGF0ZSI6ICJp
bl90cmlhZ2UiLAo+ICA+ICAgICAgICAgICAgICAiZGV0YWlsIjogZiJUaGUgQ1ZFICd7Y3ZlfScg
aGFzIGJlZW4gbWFya2VkIGFzIGlnbm9yZWQgYnkgQnVpbGRyb290Igo+ICA+IC0tCj4KPiAgPiAy
LjQzLjAKPgo+ICA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gID4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+ICA+IGJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCj4gID4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cj4KPgo+IC0tCj4gQnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
