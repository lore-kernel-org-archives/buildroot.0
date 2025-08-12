Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F05BCA0EC4
	for <buildroot@archiver.kernel.org>; Tue, 12 Aug 2025 07:32:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02FAF41BFE;
	Tue, 12 Aug 2025 07:32:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 23A309p2orAf; Tue, 12 Aug 2025 07:32:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FB4841DE5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FB4841DE5;
	Tue, 12 Aug 2025 07:32:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DA56E158
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 07:32:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C0A608451B
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 07:32:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FUXsVY22bZ8Q for <buildroot@buildroot.org>;
 Tue, 12 Aug 2025 07:32:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B5E9484514
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5E9484514
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B5E9484514
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 07:32:41 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-55b7454c6b0so5654951e87.3
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 00:32:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754983959; x=1755588759;
 h=user-agent:mime-version:date:content-transfer-encoding:organization
 :references:in-reply-to:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yyhdzNczdQXwIzq91sDFzu2TzcxaFjaBBteCm8j7ZJA=;
 b=XsVGweQV2BC3FRl3pAwvpDTmpI6DQDnyKDqazii+0wVgs+kvz0Igfeum5Wfh5Gb0n8
 k6z8oqKtnGQC0MrpQzms+giXZjQU/+pXyEdwLuiFkNc8Pc33PbKA1j9FD53YV7eRq8+b
 nAaKirtAXrWqr/sJUobBwCzl02YYyk0Od6ESMbN45p+tA3hKJT6XrDrzBkjBgWDclWsQ
 g52R4HFcPh7E2WYtkDKXDw5v0ofhNVDZJcIwTnHhaiQnJFHcBSXkaStJutAqp9NFbBEF
 zt3NDou3z8DEYCJR31tc/4UqCDa/onMk6Foz8N3FA0x+XNZYQopU1cy4QtEaxC9yAvCm
 R3FQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgdNP6a1kPYkWPkryzFJP3KqHh15LXVd6DyntWwrIK5b9/vpfBOOntBbnuov7a3yoBSGHmaf99MFk=@buildroot.org
X-Gm-Message-State: AOJu0YwwLBsbgjKEBljEdj0GNQntAtIO5Kl5siZ+/BDJ4uYJ2H+Ae1FZ
 0tZ7JtCRPaIWIKpbRnA2mS7S2VjxNtm+eYe/pSd4rj292mpMpf7LgxBc2BhsbDcX
X-Gm-Gg: ASbGnctpebxvdHrY+EOGH2Ybzg7xcSJEI/3JVSChS0e9GgEWVjmI2t/8XZyNJH78jFG
 g9YH7bcMt8bpfccsAXvh1PrUBydVtZDi5mfpvIwRscFoQgbZm0fUcJJDnF88SXFmjHNQmpG1cB4
 QcPPVXS5ARD9mD1QI8KC6J2lDWQCF4eEOxpuF8mwop7nq/U9leYx3g2kjw2S7zLbENTCE+ceDKm
 4gpqgIwyCLdqUTPsAB6b8+/mLbRgyru2hNycQS6nWuhgMOLD2WU3OPD7UlbwJY0CBmwdk0UFG/d
 QksktXluLwQaBsASMkPzp08MAksW7n/Zgek9r9C6k9NZUI5r+3u/EUNL5WKit3aYeB6zp9gvqXa
 b
X-Google-Smtp-Source: AGHT+IEsQFPqZqhKBBD9b0j37sTykhiM8rUxN3iauK9bp2V0EKbQdoAurDruCrq5ik8SVun5iQuNxA==
X-Received: by 2002:a05:6512:ad1:b0:55b:7bbd:672d with SMTP id
 2adb3069b0e04-55cd7658440mr813475e87.51.1754983958636; 
 Tue, 12 Aug 2025 00:32:38 -0700 (PDT)
Received: from gimli.lan ([2001:9b0:214:3500::522])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b88c9912dsm4658348e87.108.2025.08.12.00.32.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Aug 2025 00:32:37 -0700 (PDT)
Message-ID: <b66f2693c33bfae0e80e950063a3122616429ae4.camel@gmail.com>
From: Joachim Wiberg <troglobit@gmail.com>
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
In-Reply-To: <c6fab884-3590-411b-8f3a-257ba882ee15@smile.fr>
References: <20250811203206.1506378-1-romain.naour@smile.fr>
 <c6fab884-3590-411b-8f3a-257ba882ee15@smile.fr>
Organization: wires.se
Date: Tue, 12 Aug 2025 09:32:37 +0200
MIME-Version: 1.0
User-Agent: Evolution 3.52.3-0ubuntu1 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754983959; x=1755588759; darn=buildroot.org;
 h=user-agent:mime-version:date:content-transfer-encoding:organization
 :references:in-reply-to:to:from:subject:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yyhdzNczdQXwIzq91sDFzu2TzcxaFjaBBteCm8j7ZJA=;
 b=e9eFE1axRwgqpAJ7Cwiy6em8xT+aMI/a2cqqkF0gjj1kiXvmXtsFzwSvweM02xXZSA
 WurKolIvURTnaz3W/6bagcyYUhPKtMOJbHZJWe+tyAcTQ1YQegT6eXKcAS63rQSGJ8iy
 Dz8cbAshnRqMGWryBlAXW3NO1tNEJzmvX6Tqv+8HTFoDMEWfYEDLrhzVXbvUgCGnfZ3c
 bn7c2Y8P7IZRnwIPUrmMjh+jnPrc5GrYadaXdNpF200y2Ec+0mSUIuALGmb1SquycNPS
 BxKbV842vkWrEHkyVHcDvv+QBAPt0pZmrM06erInKXVBqq01by51z974OnQ8egKImBWI
 c53Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=e9eFE1ax
Subject: Re: [Buildroot] [PATCH 1/2] package/thttpd: port to C99
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUm9tYWluIQoKT24gTW9uLCAyMDI1LTA4LTExIGF0IDIyOjQ3ICswMjAwLCBSb21haW4gTmFv
dXIgd3JvdGU6Cj4gTGUgMTEvMDgvMjAyNSDDoCAyMjozMiwgUm9tYWluIE5hb3VyIGEgw6ljcml0
wqA6Cj4gPiBBcHBseSBjaGFuZ2VzIGZyb20gRmVkb3JhIHRvIGZpeCBnY2MtMTUgaXNzdWVzLgo+
ID4gLS0tCj4gPiB0aHR0cGQgcGFja2FnZSBpcyB1c2VkIGJ5IFRlc3RXZ2V0IGFuZCBUZXN0TGli
Q3VybCwgc28gd2UgY2FuJ3QKPiA+IHJlbW92ZSBpdCByaWdodCBub3cuCj4gSm9hY2hpbSwgZG8g
eW91IGtub3cgaWYgeW91ciBpbXBsZW1lbnRhdGlvbiAibWVyZWNhdCIgWzFdIGNhbiByZXBsYWNl
Cj4gdGh0dHBkPyAgSW5kZWVkLCB0aGUgd2lraXBlZGlhIFsyXSByZXBvcnQgIm1lcmVjYXQiIGFz
IGEgZm9yayBvZgo+IHRodHRwZC4KCkhlaCwgZnVubnkgd2l0aCBvcGVuIHNvdXJjZSBwcm9qZWN0
cywgc3VkZGVuIGJ1cnN0cyBvZiBpbnRlcmVzdCBpbiB0aGlzCm9sZCBwcm9qZWN0IG9mIG1pbmUg
ZnJvbSBtYW55IGRpZmZlcmVudCBwZW9wbGUgYXQgYXJvdW5kIHRoZSBzYW1lIHRpbWUuCvCfmYIK
CkluIHRoZW9yeSBJIGd1ZXNzIGl0IHdvdWxkIGJlIHBvc3NpYmxlLCBhIGxvdCBvZiBwYXRjaGVz
IHdlcmUgbWVyZ2VkIGluCnRoZSBiZWdpbm5pbmcsIGFuZCBJIGRpZCBhIHYyLjMwIHJlbGVhc2Ug
ZWFybHkgb24gdGhhdCBjb3VsZCB3b3JrLiAgQnV0CkkgZG9uJ3QgcmVtZW1iZXIgaWYgdGhhdCBh
bHNvIGhhZCBjb21tYW5kIGxpbmUgb3B0aW9ucyBjaGFuZ2VkIC4uLiBhIGxvdApvZiB0aGUgd29y
ayBhZnRlciB0aGF0IHBvaW50IChzb21ld2hlcmUpIGluIHRpbWUgd2VudCBpbnRvIGFkZGluZyBj
b25maWcKZmlsZSBhbmQgbmF0aXZlIGh0dHBzIHN1cHBvcnQsIHdoaWNoIHdvdWxkIGNoYW5nZSBh
IGxvdCBtb3JlLgoKVGhlIHByb2plY3QgaGFzIGFsc28gYmVlbiBkb3JtYW50IGZvciBhIGZldyB5
ZWFycyBub3cgd2l0aCBhICJsYXN0IHNldCIKb2YgZmVhdHVyZXMgYmxvY2tpbmcgYSBuZXcgcmVs
ZWFzZS4gIEJ1dCBpdCdzIGEgY29vbCBsaXR0bGUgcHJvamVjdCwgc28KbWF5YmUgSSBzaG91bGQg
cGljayBpdCB1cCBhZ2Fpbj8KCkR1bm5vIGlmIHRoaXMgYW5zd2VycyB5b3VyIHF1ZXN0aW9uLCBi
dXQgaW1vIG1heWJlIGl0IHdvdWxkIGJlIGJldHRlciB0bwpzd2l0Y2ggdG8gbWluaV9odHRwZCAo
YWxzbyBieSBKZWYpIG9yIEJ1c3lCb3ggaHR0cGQgZm9yIHRoZSBhYm92ZSB0ZXN0cz8KCkJlc3Qg
cmVnYXJkcwogL0pvYWNoaW0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
