Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3001BC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 19:43:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED1E081769;
	Fri, 12 Jul 2024 19:43:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e4a79EHGxdGq; Fri, 12 Jul 2024 19:43:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD59B84050
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD59B84050;
	Fri, 12 Jul 2024 19:43:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A4A951BF279
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 19:43:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 91B56402AA
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 19:43:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tQnEE157mg1m for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 19:43:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 71AAC401F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71AAC401F9
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 71AAC401F9
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 19:43:33 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-367b0cc6c65so1458557f8f.3
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 12:43:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720813412; x=1721418212;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/pLsiTufoqy+gijv56RIq5V7pYrCfdD0XU7WPdAw0lU=;
 b=H2893V2Ua+DmgTcRYsRR7wVjIgDnEV4jDjTw5tKE2vpFGyx6JWA7Uw3bfjY73blZgm
 Z7s/GATya9Djg+ZMcmyFMZg5neDJS9Tkl7im50a+da2jdpdbhFL01//6nCADIlHZ/2Wl
 eoW4k5snKqEzwsArMIJiSDtv3Pd9/OlPJiQwPz6YqNNl0DncWpvi4Vpl8McZHjUkQGES
 JmX/3lOCCElcXDZ6xFlMZxyYU6uo/ti5rIA/Vf+liVy3n1ReVLYaicnQzqAxCKmt0kXZ
 JeFBFlOKogNygIWUujO36igeYEAGf7z/E2ks9kdZKazjMCQILlQy5ufY0L0+6Ob+UBle
 7jnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxIK9al9945dX3pokSyuFx4vkdVSATAIHSWpOAOCEJn93XxQzxcuRi7KRxdN17aP+s3FVLuLjLOxLXqcjquPpc63c+y2hvAw==
X-Gm-Message-State: AOJu0YynS1vmuxH73OGGwznthlx9zq+rYPU0hxBHyOg1BYzk2cS1X37u
 Nc7640vOQ2HxAGMZYlm+m5lGGkxco5RHf+Utst72g/HLXJXiUi3Af2X8mX2R7FkE/NwHFeNVxjx
 m
X-Google-Smtp-Source: AGHT+IGhWPiWAJV5Grc3Bo6VTEJQ+B9flDUo31xnOdY2K2UCAQ8KTdsT6fUjjIW2eHgi7NtMu6mrjw==
X-Received: by 2002:a5d:4dc8:0:b0:367:91d6:e12e with SMTP id
 ffacd0b85a97d-367ceaca9e9mr8640459f8f.44.1720813411990; 
 Fri, 12 Jul 2024 12:43:31 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:f9c8:f443:ffd:1bed?
 (2a01cb05949d5800f9c8f4430ffd1bed.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:f9c8:f443:ffd:1bed])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cde7dedfsm10954342f8f.24.2024.07.12.12.43.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 12:43:31 -0700 (PDT)
Message-ID: <d7264400-0df0-4add-9ec7-5e648508f854@smile.fr>
Date: Fri, 12 Jul 2024 21:43:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20240705102226.3283175-1-dario.binacchi@amarulasolutions.com>
Content-Language: fr
In-Reply-To: <20240705102226.3283175-1-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1720813412; x=1721418212; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/pLsiTufoqy+gijv56RIq5V7pYrCfdD0XU7WPdAw0lU=;
 b=WAPfImVd0Wdf6j+pRQJoBDYv6vrWpk9TwRqCukLfdUpsp+klvfMXWKeAeHTF6FrbWh
 sO9bTCgA848XBT/UqHq577g7n9mId/jMVK4WfpMt0JW/I+vUJsGnnPGDldrP7EIfUyk/
 ngy4ZanVb7yHpPlzHy+HvYTxkEfKWgMaGIP9o=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=WAPfImVd
Subject: Re: [Buildroot] [PATCH 1/1] package/udpcast: update the patches to
 be applied with fuzz 0
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Cc: linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRGFyaW8sCgpMZSAwNS8wNy8yMDI0IMOgIDEyOjIyLCBEYXJpbyBCaW5hY2NoaSBhIMOp
Y3JpdMKgOgo+IENvbW1pdCA4Zjg4YTY0NGVkN2Q2ICgic3VwcG9ydC9zY3JpcHRzL2FwcGx5LXBh
dGNoZXMuc2g6IHNldCB0aGUgbWF4aW11bQo+IGZ1enogZmFjdG9yIHRvIDAiKSByZWR1Y2VkIHRo
ZSBmdXp6IGZhY3Rvci4KPiAKPiBEdWUgdG8gdGhpcyBjaGFuZ2UsIHVkcGNhc3QgZmFpbHMgdG8g
YnVpbGQgd2l0aCBvdXRwdXQ6Cj4gCj4gICAgIEFwcGx5aW5nIDAwMDEtZml4LW11c2wtYnVpbGQu
cGF0Y2ggdXNpbmcgcGF0Y2g6Cj4gICAgIHBhdGNoaW5nIGZpbGUgcmVjZWl2ZWRhdGEuYwo+ICAg
ICBIdW5rICMxIEZBSUxFRCBhdCAxLgo+ICAgICAxIG91dCBvZiAxIGh1bmsgRkFJTEVEIC0tIHNh
dmluZyByZWplY3RzIHRvIGZpbGUgcmVjZWl2ZWRhdGEuYy5yZWoKPiAKPiBUaGlzIGNvbW1pdCBy
ZWZyZXNoZXMgdGhlIHBhY2thZ2UgcGF0Y2ggb24gdGhlIGN1cnJlbnQgcGFja2FnZSB2ZXJzaW9u
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFy
dWxhc29sdXRpb25zLmNvbT4KCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgpCZXN0IHJlZ2Fy
ZHMsClJvbWFpbgoKPiAtLS0KPiAgLmNoZWNrcGFja2FnZWlnbm9yZSAgICAgICAgICAgICAgICAg
ICAgICAgfCAxIC0KPiAgcGFja2FnZS91ZHBjYXN0LzAwMDEtZml4LW11c2wtYnVpbGQucGF0Y2gg
fCA3ICsrKystLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRp
b25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhLy5jaGVja3BhY2thZ2VpZ25vcmUgYi8uY2hlY2twYWNr
YWdlaWdub3JlCj4gaW5kZXggMGExZDI2Mjc0NTVlLi5hMDQ4MDU1MGI5ZTYgMTAwNjQ0Cj4gLS0t
IGEvLmNoZWNrcGFja2FnZWlnbm9yZQo+ICsrKyBiLy5jaGVja3BhY2thZ2VpZ25vcmUKPiBAQCAt
MTQ1Niw3ICsxNDU2LDYgQEAgcGFja2FnZS91Ym9vdC10b29scy8wMDAxLWRyb3AtY29uZmlnaC1m
cm9tLXRvb2xzLnBhdGNoIGxpYl9wYXRjaC5VcHN0cmVhbQo+ICBwYWNrYWdlL3Vib290LXRvb2xz
LzAwMDItdG9vbHMtb25seS1pbi1uby1kb3QtY29uZmlnLXRhcmdldHMucGF0Y2ggbGliX3BhdGNo
LlVwc3RyZWFtCj4gIHBhY2thZ2UvdWJvb3QtdG9vbHMvMDAwMy10b29scy1NYWtlZmlsZS1maXgt
Qy1MRC1GTEFHUy13aXRoLUNST1NTX0JVSUxEX1RPT0xTLnBhdGNoIGxpYl9wYXRjaC5VcHN0cmVh
bQo+ICBwYWNrYWdlL3VidXMvMDAwMS1JbnN0YWxsLXNlcnZlci1hbmQtY2xpZW50LWV4YW1wbGVz
LnBhdGNoIGxpYl9wYXRjaC5VcHN0cmVhbQo+IC1wYWNrYWdlL3VkcGNhc3QvMDAwMS1maXgtbXVz
bC1idWlsZC5wYXRjaCBsaWJfcGF0Y2guVXBzdHJlYW0KPiAgcGFja2FnZS91ZW1hY3MvMDEtY2xl
YXItaXhvbi10ZXJtaW9zLWZsYWcucGF0Y2ggbGliX3BhdGNoLlVwc3RyZWFtCj4gIHBhY2thZ2Uv
dWhkLzAwMDEtaG9zdC1DTWFrZUxpc3RzLWFkZC1ib29zdC11bml0X3Rlc3RfZnJhbWV3b3JrLXJl
cXVpci5wYXRjaCBsaWJfcGF0Y2guVXBzdHJlYW0KPiAgcGFja2FnZS91aHR0cGQvMDAwMS1SZW1v
dmUtV2Vycm9yLnBhdGNoIGxpYl9wYXRjaC5VcHN0cmVhbQo+IGRpZmYgLS1naXQgYS9wYWNrYWdl
L3VkcGNhc3QvMDAwMS1maXgtbXVzbC1idWlsZC5wYXRjaCBiL3BhY2thZ2UvdWRwY2FzdC8wMDAx
LWZpeC1tdXNsLWJ1aWxkLnBhdGNoCj4gaW5kZXggMGUyMTNiMjc5MzQ0Li5lMjRmM2U5ZTk0MGIg
MTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS91ZHBjYXN0LzAwMDEtZml4LW11c2wtYnVpbGQucGF0Y2gK
PiArKysgYi9wYWNrYWdlL3VkcGNhc3QvMDAwMS1maXgtbXVzbC1idWlsZC5wYXRjaAo+IEBAIC0x
NSw4ICsxNSw5IEBAIEZpeGVzOgo+ICAgLSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcv
cmVzdWx0cy8zMDIwOGM2ZjE3NTk2N2ZlZDZkZTY5MDQ0N2EwOWUwYzg2NTQ3YjI0Cj4gIAo+ICBT
aWduZWQtb2ZmLWJ5OiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNv
bT4KPiAtW1Vwc3RyZWFtIHN0YXR1czoKPiAtaHR0cHM6Ly91ZHBjYXN0LmxpbnV4Lmx1L21haWxt
YW4zL2h5cGVya2l0dHkvbGlzdC91ZHBjYXN0QHVkcGNhc3QubGludXgubHUvdGhyZWFkLzRNQkVT
MkNQVVNVTklaVEM3TlhDUVlTMkdBRTREUVNHL10KPiArVXBzdHJlYW06IGh0dHBzOi8vdWRwY2Fz
dC5saW51eC5sdS9tYWlsbWFuMy9oeXBlcmtpdHR5L2xpc3QvdWRwY2FzdEB1ZHBjYXN0LmxpbnV4
Lmx1L3RocmVhZC80TUJFUzJDUFVTVU5JWlRDN05YQ1FZUzJHQUU0RFFTRy8KPiArW0RhcmlvOiBt
YWtlIHRoZSBwYXRjaCB0byBiZSBhcHBsaWVkIHdpdGggZnV6eiBmYWN0b3IgMF0KPiArU2lnbmVk
LW9mZi1ieTogRGFyaW8gQmluYWNjaGkgPGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMu
Y29tPgo+ICAKPiAgZGlmZiAnLS1jb2xvcj1hdXRvJyAtTnVyYSB1ZHBjYXN0LTIwMjExMjA3Lm9y
aWcvcmVjZWl2ZWRhdGEuYyB1ZHBjYXN0LTIwMjExMjA3L3JlY2VpdmVkYXRhLmMKPiAgLS0tIHVk
cGNhc3QtMjAyMTEyMDcub3JpZy9yZWNlaXZlZGF0YS5jCTIwMjItMDgtMTMgMjE6NDg6MDYuMjI2
NTg4NjE0ICswMjAwCj4gQEAgLTI3LDUgKzI4LDUgQEAgZGlmZiAnLS1jb2xvcj1hdXRvJyAtTnVy
YSB1ZHBjYXN0LTIwMjExMjA3Lm9yaWcvcmVjZWl2ZWRhdGEuYyB1ZHBjYXN0LTIwMjExMjA3L3IK
PiAgICNpbmNsdWRlIDx1bmlzdGQuaD4KPiAgKyNpbmNsdWRlIDxzdGRkZWYuaD4KPiAgICNpbmNs
dWRlIDxzdGRsaWIuaD4KPiAtICNpbmNsdWRlIDxzeXMvdGltZS5oPgo+ICAgI2luY2x1ZGUgPGVy
cm5vLmg+Cj4gKyAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
