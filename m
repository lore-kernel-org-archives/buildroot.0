Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47BC1CCD1BB
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 19:35:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07E5940CC8;
	Wed, 22 Oct 2025 19:35:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bk278YfaqyK1; Wed, 22 Oct 2025 19:35:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D6A140CC9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D6A140CC9;
	Wed, 22 Oct 2025 19:35:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 45770DE
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 19:35:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 36E5D83E50
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 19:35:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AYHY0BFoayJQ for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 19:35:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2b; helo=mail-io1-xd2b.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5FE9D83E49
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FE9D83E49
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5FE9D83E49
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 19:35:19 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-930cfdfabb3so70831839f.1
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 12:35:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761161718; x=1761766518;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0Xp/ZVfXLmyzm3mmIlta9XTomJdAW82LzHZHezLI0xM=;
 b=Baj0Hi+K6DQ73bxnZ9QEqwNajDpajW9bK0uVnZLDF120aeAQ4jFuVNyHjwcyNo/VoZ
 8/VOvP99wr0t+aDDKFEgWM2K7MWD765Q/0+YCqhjUb9/k3lshQuf0DF1nbKvED9MWy/o
 x9fHVdEJITfAvIqji7qqbPpKubv1m+24c2Uk2rAM2HVZ7nwq2S1Il+j8X82IuXRFusmK
 rd/LgyX8LP8sYAQNkoFXCdA4TmcEPvknDg42XpRlUbQE/EPayEPEKYJwENriJ6GC3bnT
 FUxp1eAyIhGN1oFVDzkJCoaUfpoqj+Eva1hAS+pbaSLwvpaPXeoVKuipcW1eAOdsB9gV
 7GgQ==
X-Gm-Message-State: AOJu0YxqznSYcM9W2fB8WyWeothE2GmFJj3aqC9SqeMgYIe3efrWTrfE
 AM7vMLGtSlvgcTKehzfW0ITA8wLXTlSsKi55J8M6Vah+oWkP08cxVUjPJfqnlZopTkABzBHpM+L
 +QcQYma6XlsWoL4u3aTuv8YC3jmHkAL8IKpiy
X-Gm-Gg: ASbGncvzQxO4TG2xKvjgqRASyhB4oN3GHjV5CU1cdiNuSQnYRxdajG9VKnFqLVh3LAu
 HlTLDvRJaLX7mFkQR1KeveKr8y7xYlc6fyk8ZSFNJHrDqaymk+F4v3SbvwUuXB+TgTqM/Ztcdkw
 DxIWERSfb6SM+ggPM2KeA4pSgHtG/2wS9GwelLMKC+x5X0Vo6WapFxFmnirQsk+7i/tNqz58pSm
 9uqEVuktSz7Sbwvim9f0Yo4M8y5wL3qxmUsUOYyMWg8cXAm/I+cp5PfaGsmuA2Xb2tx4g==
X-Google-Smtp-Source: AGHT+IHJUb29m/upV5hrrl2WM4SIWNJ+OAeMb1MNQeAYeAAKdEqszjAixvzA3zhnX7W2h8djy1dBjDtZwq/xTTYaVlc=
X-Received: by 2002:a05:6e02:3307:b0:430:ab1a:6708 with SMTP id
 e9e14a558f8ab-431d72bcfe0mr36325805ab.1.1761161718164; Wed, 22 Oct 2025
 12:35:18 -0700 (PDT)
MIME-Version: 1.0
References: <20251021-bash-5-3-v1-1-b28c4c46a3a3@gmail.com>
 <32a24b32628e6fd22aa5035c95ff52f1@free.fr>
In-Reply-To: <32a24b32628e6fd22aa5035c95ff52f1@free.fr>
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Wed, 22 Oct 2025 12:34:42 -0700
X-Gm-Features: AS18NWB36QJWYvGGJ1R_GgSX-zvnV64Brw7076pR96tkkk4JtLLSBgDpY1zvpSs
Message-ID: <CAMWSM7jXViS5t4LA15n4JtjuSx_6TcrD=Po2Uue8ouEtJFOVQg@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761161718; x=1761766518; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0Xp/ZVfXLmyzm3mmIlta9XTomJdAW82LzHZHezLI0xM=;
 b=Gp47GUK0L6dZTg9wSB91griLh/5uCgzCGe7zfyJ8Osz2+nyNh0p3AbSnyL8NOFo0fe
 cnkkbAeouFYCpwnraBqzTzeYZMgHVI3q3LQZCJ50R5BZwkyorRn4C80CJDDzr1Hq12Ij
 jSQK/kyRRKJi8dUT1584a4M2IhCksgQNBWSaSM7hoJ3pzom6vBdZ7iGLENv4qQEBnPGT
 jnLXAZ9kyKY259NxkkrG30cAm2fsNS0HBWT1VJ11Ma7UL0lFvXJ3HWRRP7R77UXa/5r3
 yzfHt7mO8hk8SOhAM6TkkDNUi3FixJ+3z879FojpSQ3HSUMvfkwNvjRMso+Qm18Pwc5v
 8Jtg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Gp47GUK0
Subject: Re: [Buildroot] [PATCH] package/bash: bump to v5.3
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

SGVsbG8gSnVsaWVuLAoKT24gV2VkLCBPY3QgMjIsIDIwMjUgYXQgMTI6MjfigK9QTSBKdWxpZW4g
T2xpdmFpbiA8anUub0BmcmVlLmZyPiB3cm90ZToKPgo+IEhpIEpvc2VwaCwKPgo+IFRoYW5rcyBm
b3IgdGhlIHBhdGNoLiBJIGhhdmUgZmV3IGNvbW1lbnRzLCBzZWUgYmVsb3cuCj4KPiBPbiAyMi8x
MC8yMDI1IDAyOjM3LCBKb3NlcGggS29ndXQgd3JvdGU6Cj4gPiBTZWUgdGhlIHJlbGV2YW50IGFu
bm91bmNlbWVudDoKPiA+IGh0dHBzOi8vbGlzdHMuZ251Lm9yZy9hcmNoaXZlL2h0bWwvYnVnLWJh
c2gvMjAyNS0wNy9tc2cwMDAwNS5odG1sCj4gPgo+ID4gQ2hhbmdlczoKPiA+IC0gUmVtb3ZlZCB1
cHN0cmVhbWVkIG11bHRpYnl0ZSBjb21waWxhdGlvbiBmaXgKPiA+IC0gUmViYXNlZCBtaXNzaW5n
IGluY2x1ZGUgcGF0Y2ggdGhhdCByZW1haW5zIHVubWVyZ2VkCj4gPgo+ID4gRml4ZXM6Cj4gPiAt
Cj4gPiBodHRwczovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvNGQ3LzRkNzQ3ZTY3
ZTY0MDIwYjRhYWZiYzY2NWViMGQxNThlMjAxOWRmNTMKPiA+IC0KPiA+IGh0dHBzOi8vYXV0b2J1
aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy9jZjUvY2Y1NGE0OTE3NTUzMTM3MmY3OTg4YzEwZGQ2
NDQxMWI4NTg5MTA4OAo+ID4gLQo+ID4gaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9y
ZXN1bHRzL2YxMy9mMTM1YTk3ZmE4YmQyNzUwZmZjOWExMGFlMjE1MjRmNjY2ODg4OGI4Cj4gPiAt
Cj4gPiBodHRwczovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvZWQzL2VkMzliZWZk
ZDczZjNjMTA3ZDdlZTI1MWQ4ODEyN2QxZDQ5M2ZkNWQKPiA+IC0KPiA+IGh0dHBzOi8vYXV0b2J1
aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy85NWQvOTVkODZmYTgxYWM2MmZmY2UwNDExMDE4Mjgx
ZWMxNWM2YTliNWUwOAo+ID4gLQo+ID4gaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9y
ZXN1bHRzLzZkZS82ZGUzZTEwNmQwNjIyNTI1NzRlZDMxODM1YWNhY2U2MjA0NTc5N2UyCj4KPiBJ
IGNhbm5vdCByZXByb2R1Y2UgdGhvc2UgYnVpbGQgZmFpbHVyZXMgYW55bW9yZSAoYXMgb2YgbWFz
dGVyIGF0Cj4gZTFlZjRiZTcwKS4KPiBJdCBzZWVtcyBtb3N0IG9mIHRob3NlIGJ1aWxkIGZhaWx1
cmVzIHdlcmUgYWxyZWFkeSBmaXhlZCBieToKPiBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290
Lm9yZy9idWlsZHJvb3QvLS9jb21taXQvMDBmYTYwMDMwMzhiNGM0NDgzZjUyZGRlZDFmOGI5Y2Yy
ZmE1N2U1YQo+IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2Nv
bW1pdC82ZDA5YjI1ZDA4ZmU3MmU5NzgxNTc4ZmI1MTJkNWFhMzkxYjA4YzNmCj4KPiBDYW4geW91
IHJlbW92ZSB0aG9zZSAiRml4ZXM6IiBsaW5rcywgcGxlYXNlPyAob3IgcHJvdmlkZSBhIG1pbmlt
YWwKPiBjb25maWcgcmVwcm9kdWNpbmcKPiB0aG9zZSBpc3N1ZSBvbiB0aGUgbWFzdGVyIEhFQUQp
Lgo+Cj4gQWxzbywgdGhlIGNvbW1lbnQgYWRkZWQgYnkgdGhlIGNvbW1pdCBJIGxpbmsgc2F5cyB0
aGUgIi1zdGQ9Z251MTciIGZsYWdzCj4gZm9yIHRhcmdldAo+IGFuZCBob3N0IGNhbiBiZSByZW1v
dmVkIHdoZW4gYnVtcGluZyB0byA1LjMuIENvdWxkIHlvdSByZW1vdmUgdGhvc2UsCj4gcGxlYXNl
PyBTZWU6Cj4gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vYmxv
Yi8yMDI1LjA4LjEvcGFja2FnZS9iYXNoL2Jhc2gubWsjTDI5Cj4KPiBGaW5hbGx5LCAgdGhlICJt
YWtlIGNoZWNrLXBhY2thZ2UiIGNvbW1hbmQgaXMgZ2VuZXJhdGluZyBlcnJvcnM6Cj4KPiAuY2hl
Y2twYWNrYWdlaWdub3JlOjIzMjogaWdub3JlZCBmaWxlCj4gcGFja2FnZS9iYXNoLzAwMDItcGFy
c2UueS1maXgtY29tcGlsYXRpb24tZm9yLW5vbi1tdWx0aWJ5dGUtYnVpbGRzLnBhdGNoCj4gaXMg
bWlzc2luZwo+IHBhY2thZ2UvYmFzaC8wMDAxLWlucHV0LmgtYWRkLW1pc3NpbmctaW5jbHVkZS1v
bi1zdGRpby5oLnBhdGNoOjA6Cj4gbGliX3BhdGNoLlVwc3RyZWFtIHdhcyBleHBlY3RlZCB0byBm
YWlsLCBkaWQgeW91IGZpeCB0aGUgZmlsZSBhbmQgZm9yZ2V0Cj4gdG8gdXBkYXRlIC9ob21lL2p1
bGllbi93b3JrL2J1aWxkcm9vdC8uY2hlY2twYWNrYWdlaWdub3JlPwo+Cj4gQ291bGQgeW91IHJl
bW92ZSB0aG9zZSAiLmNoZWNrcGFja2FnZWlnbm9yZSIgZW50cmllcywgd2hpY2ggYSBubyBsb25n
ZXIKPiBuZWVkZWQ/Cj4KCkFic29sdXRlbHksIHRoYW5rcyBmb3IgdGhlIHJldmlldy4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
