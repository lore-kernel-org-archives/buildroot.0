Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BD2FC3DA4A
	for <buildroot@archiver.kernel.org>; Tue, 20 Aug 2024 19:03:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB831605C3;
	Tue, 20 Aug 2024 19:03:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wSFHgGFtp1av; Tue, 20 Aug 2024 19:03:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1C86605D7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1C86605D7;
	Tue, 20 Aug 2024 19:03:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 838C51BF575
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 19:03:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 705C4403F5
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 19:03:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ufot0JbZUUuF for <buildroot@lists.busybox.net>;
 Tue, 20 Aug 2024 19:03:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1133; helo=mail-yw1-x1133.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2BD9D403EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BD9D403EF
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2BD9D403EF
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 19:03:12 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-6c0adbbf2eeso588907b3.0
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 12:03:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724180591; x=1724785391;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8f8s73UkV3+7peeLNMYQdVZNUfq82kw44Arx/Y/a/r8=;
 b=JwIgMYWGCWl7yD0tW0VMZ7qHUF75i3Sw9p5h25OP59S7IIcRTWJnl9p6ouwuFzKRNI
 qklM/Ccg1s7PA0xQiS/75mSWxP+KjD6a/sIotDHp/TlzsbD8rHUFao3UiLfOqL72RqKC
 85ex5A4eA3aVzZmLOqDEuhM9nRKsc+eTZEeXW5HLWy5wzMqt3hubIwozG1RHPWhbTA0R
 HKvqnsvkeebhRNLTw8k+8WcLsoNpaxHzaijNRzr5HZd8uixDCV0uTbVz23Y5uebLb41p
 d5xEEROuE0FkdTxROm1qT3XDQ9qxwVonNBIJ5J+117DI2mKiqKDJwI5ZajvmK+eXnZbC
 kSdA==
X-Gm-Message-State: AOJu0YzZXWkRbCsoDL3gpEHlRWvVxsQxXciDPGpf4pkn2NpjYE3D/0tq
 l/U61okHN7iLuRh9ToktmQ4sfOs0LOlO8nBepUpTqqkzkLQkcIRv+UnbLQmVSwtzxxtn2akgQfB
 gaPlhBlLjmNJnrcuFuUtkPmYvFeYTPu0TJilOFg==
X-Google-Smtp-Source: AGHT+IHrBqqAr052XnEpCQQUP/a3jrA7BPylBn3Kad+6N19hmm1rh9v2Y+EctQFSZIHEWI6vsxOI08JrDEvAsyG1tto=
X-Received: by 2002:a05:690c:2a8c:b0:65f:dfd9:b672 with SMTP id
 00721157ae682-6c09c59b712mr2553637b3.11.1724180591180; Tue, 20 Aug 2024
 12:03:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240803155517.3499273-1-dario.binacchi@amarulasolutions.com>
 <Zq7PpfDy10IdabJK@waldemar-brodkorb.de>
In-Reply-To: <Zq7PpfDy10IdabJK@waldemar-brodkorb.de>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 20 Aug 2024 21:03:00 +0200
Message-ID: <CABGWkvpHLJm+MOrWtoAFVtR-NZM-Q0vjq4nXGEgJY4Mwbc4zwQ@mail.gmail.com>
To: Waldemar Brodkorb <wbx@openadk.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1724180591; x=1724785391;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8f8s73UkV3+7peeLNMYQdVZNUfq82kw44Arx/Y/a/r8=;
 b=nen2P2rVwxVJI6+p0hkZSIe+voWvZxa18/7TBvxSqbnpI9cfv8FnAdCHFVYjQ091yq
 vsFOc1WSYtc28is+sdUD8YDRXiobmBxjOhBkgVtKSCooJU39lBComuCli/JjUEUPdEQW
 wkx1q7MG+cAb+ffQJXO2D8//3/dAF0YZDI+lM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=nen2P2rV
Subject: Re: [Buildroot] [PATCH 0/3] tinit and stm32f746_disco_sd_defconfig
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
Cc: Damien Le Moal <dlemoal@kernel.org>, linux-amarula@amarulasolutions.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gV2FsZGVtYXIsCgpJIGFwb2xvZ2l6ZSBmb3IgdGhlIGRlbGF5ZWQgcmVzcG9uc2UuCgpP
biBTdW4sIEF1ZyA0LCAyMDI0IGF0IDI6NDfigK9BTSBXYWxkZW1hciBCcm9ka29yYiA8d2J4QG9w
ZW5hZGsub3JnPiB3cm90ZToKPgo+IEhpIERhcmlvLAo+IERhcmlvIEJpbmFjY2hpIHdyb3RlLAo+
Cj4gPiBUaGlzIHNlcmllcyBpcyBpbnNwaXJlZCBieSByZWFkaW5nIHRoZSBmb2xsb3dpbmcgdG9w
aWM6Cj4gPgo+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnVpbGRyb290LzIwMjMwMjA2MjMw
MjAzLjcwZTJkYmQ4QHdpbmRzdXJmL1QKPiA+Cj4gPiBTdGFydGluZyBmcm9tIHRoYXQgcGF0Y2gs
IGFuZCBmb2xsb3dpbmcgVGhvbWFzIFBldGF6em9uaSdzIHN1Z2dlc3Rpb25zCj4gPiByZWdhcmRp
bmcgdGhlIHBvc3NpYmlsaXR5IG9mIHVzaW5nIGEgc2luZ2xlIG1pbmltYWwgc2NyaXB0IHdpdGhv
dXQKPiA+IGR1cGxpY2F0aW5nIGl0IHdpdGhpbiBCdWlsZHJvb3QsIEkgZGV2ZWxvcGVkIHRoZXNl
IHRocmVlIHBhdGNoZXMuCj4gPiBNZWFud2hpbGUsIHRoZSBjb25maWd1cmF0aW9uIGZvciB0aGUg
c3RtMzJmNzQ2X2Rpc2NvIGJvYXJkIHdhcyB1c2VmdWwKPiA+IGZvciBkZXZlbG9waW5nIHRoZSBk
aXNwbGF5IHN1cHBvcnQgZm9yIHRoZSBib2FyZCwgd2hpY2ggd2FzIGxhdGVyCj4gPiBtZXJnZWQg
aW50byBMaW51eC4KPiA+Cj4gPiBEYXJpbyBCaW5hY2NoaSAoMyk6Cj4gPiAgIHBhY2thZ2UvdGlu
aXQ6IG5ldyBwYWNrYWdlCj4gPiAgIGNvbmZpZ3Mvc3RtMzJmNzQ2X2Rpc2NvX3NkX2RlZmNvbmZp
ZzogbmV3IGRlZmNvbmZpZwo+ID4gICBib2FyZC9jYW5hYW4vazIxMC1zb2M6IHVzZSB0aW5pdCBh
cyBMaW51eCBpbml0IHByb2Nlc3MKPgo+IFlvdSBjYW4gYWRkIGEKPiBUZXN0ZWQtYnk6IFdhbGRl
bWFyIEJyb2Rrb3JiIDx3YnhAb3BlbmFkay5vcmc+Cj4gZm9yIHlvdXIgbmV4dCBwYXRjaCBzdWJt
aXNzaW9uLgo+IEkgYnVpbGQgYW5kIHJ1bnRpbWUgdGVzdGVkIHRoZSBzdG0zMmY3NDYgY29uZmln
LgoKVGhhbmsgeW91IGZvciB0aGUgdGVzdC4KCj4KPiBJbiB3aGljaCB2ZXJzaW9uIHdlIHdpbGwg
aGF2ZSBkaXNwbGF5IHN1cHBvcnQgZm9yIHRoZSBib2FyZD8KClNvbWUgcGF0Y2hlcyBoYXZlIGJl
ZW4gbWVyZ2VkIGluIHZlcnNpb24gNi41OgoxM2NkZDEyYTlmOTM0MSAoImRybS9wYW5lbDogc2lt
cGxlOiBhZGQgc3VwcG9ydCBmb3IgUm9ja3RlY2ggUkswNDNGTjQ4SCBwYW5lbCIpCmJ1dCB0aGUg
ZGlzcGxheSBpcyBhY3R1YWxseSBzdXBwb3J0ZWQgaW4gdmVyc2lvbiA2LjY6CjEwYTk3MGJjM2Vi
ZmEgKCJBUk06IGR0czogc3RtMzI6IHN1cHBvcnQgZGlzcGxheSBvbiBzdG0zMmY3NDYtZGlzY28g
Ym9hcmQiKS4KCj4gQXJlIHlvdSBhbHNvIHdvcmtpbmcgb24gdGhlIG1pc3NpbmcgZXRoZXJuZXQg
cGFydD8KTm8sIGJ1dCB3aG8ga25vd3MsIG1heWJlIGluIHRoZSBmdXR1cmUuClRoYW5rcyBmb3Ig
dGhlIHN1Z2dlc3Rpb24KCj4KPiBUaGFua3MgZm9yIHRoZSBnb29kIHdvcmsuCj4KPiBUaGlzIGJv
YXJkIGlzIHVzZWQgdG8gdGVzdCB1Q2xpYmMtbmcgQVJNIEZEUElDIHN1cHBvcnQuCj4gU2FkbHkg
RkRQSUMgc3VwcG9ydCBpbiBidWlsZHJvb3QgbmV2ZXIgbWFkZSBpdCB1cHN0cmVhbS4gKGhpbnQg
Oj0pICkKCkRvIHlvdSBoYXZlIGFueSBkb2N1bWVudHMvbGlua3MgdG8gc3VnZ2VzdCBvbiB0aGlz
IHRvcGljPwoKVGhhbmtzIGFuZCByZWdhcmRzLApEYXJpbwoKPgo+IGJlc3QgcmVnYXJkcwo+ICBX
YWxkZW1hcgoKCgotLSAKCkRhcmlvIEJpbmFjY2hpCgpTZW5pb3IgRW1iZWRkZWQgTGludXggRGV2
ZWxvcGVyCgpkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwoKCkFtYXJ1bGEgU29sdXRpb25zIFNSTAoKVmlhIExlIENh
bmV2YXJlIDMwLCAzMTEwMCBUcmV2aXNvLCBWZW5ldG8sIElUCgpULiArMzkgMDQyIDI0MyA1MzEw
CmluZm9AYW1hcnVsYXNvbHV0aW9ucy5jb20KCnd3dy5hbWFydWxhc29sdXRpb25zLmNvbQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
