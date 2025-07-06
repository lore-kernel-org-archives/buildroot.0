Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B2DC83F03
	for <buildroot@archiver.kernel.org>; Sun,  6 Jul 2025 14:42:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 660A2409CF;
	Sun,  6 Jul 2025 14:42:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id luho4mf4-CkH; Sun,  6 Jul 2025 14:42:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D573C4089F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D573C4089F;
	Sun,  6 Jul 2025 14:42:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C25F19C
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 14:42:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 624BA40936
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 14:42:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1PtLJ_bddtKg for <buildroot@buildroot.org>;
 Sun,  6 Jul 2025 14:42:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 351D440662
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 351D440662
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 351D440662
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 14:42:32 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a54700a46eso1120407f8f.1
 for <buildroot@buildroot.org>; Sun, 06 Jul 2025 07:42:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751812950; x=1752417750;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aKH5iLBxRxUtJmPnQ6e9JHqEz0AMZwiJzcH+frEoJB4=;
 b=NORWvffjg8Xqd2UxhRJ2hO/Z0rR9EEaP8jbAwOcnUgf0Z3NjQffBJ0KvzY8s0EHKUf
 Y5YfM+G+C7xje9FhRGGuwhCcgr+sgks8RV5hR9rNwGqEz6USMN/Fiqfo2H2ahiN9Cxf9
 hyeBlc67iYD3CHVmVr9qiGJUYk0RyqpIeUEeoImCUh0ZJPP2APeCalKh+YnWYq1z3/P3
 t5Je9Fd6evzCK3A3TWC2sQpJndYq0JgSphZQF1+aypAB6F9mbbkexYzBnCAaWAqYpodM
 kfzBz5P4nALgTsNRbUBqh9vi7xJfLlVVj+E5uUk4944LhATorG0yK1BU41ZeAn0Fpcd3
 /w+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeMgVEPMzjsgjZVVrKlGGZS6OFkHMn+tOBQRSa/ZAUiOLdRMcrq+CUmWB7kzIEbafUNRzCrxY337A=@buildroot.org
X-Gm-Message-State: AOJu0YwsJWQ29L9UYfJrPb+C1mM0A5062jnnIyxJSo1GAz/RJcBxVWvn
 OcbSS/daddWqSOJm5X3TxYLP5bgaFGhEJNclD9TJm1EVtgsqe3SGfgnDYd4FhMZDz0Y=
X-Gm-Gg: ASbGnctZNCeEaXRLOEOjJxGX+/MbWultZq0rQdW/SAVcNyhqdClN9YCp+NMJfjRvCgj
 i1Xg7Kx6s/9u/3b6TMxFPoFgnfwRINQFfwkJWgy0zD3A1lxmi2X9thXqmt6cYc1beav4gOTseqW
 Zm2iOaABf7oXblrewZxD2JtvdhVxfoC6GomnUqzoTNtbBxmMor3Rnm+SzWn88XZnfQS4cj4IdYH
 DhwfYLKYY3Rh7LI5j4vTCWl+t9uvFvFm9R60DaXyptaE67jTqpSRNBWJxAehwyARRYC1su3Fpnn
 Oxlf/t5C3ZvapH2+XF/AsO33Bp7FyTN1sH9evcmrDlgbYjW3v5+MKVi1XUs3Ccgfi25gt1YTd5U
 kRisj0Tl7Sgc5HdI7UnUDvDZCrTbdZ7Cs7RA3cAcSDtH/PSN9YZfoGwBI3K7b0xnRMjn5kX34k8
 ngJDKq//lH6QHQn+qbCBpJ5FDz
X-Google-Smtp-Source: AGHT+IEXuzTqu4xRWrz8zKgy8FnRyiVvXtIFGG83pUR533nszcplcAm4JoK+mWhWUTmjOIoonYcm4w==
X-Received: by 2002:a05:6000:1ace:b0:3a5:2653:7308 with SMTP id
 ffacd0b85a97d-3b49aabc77bmr3763131f8f.57.1751812950069; 
 Sun, 06 Jul 2025 07:42:30 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b47285e241sm7749432f8f.94.2025.07.06.07.42.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Jul 2025 07:42:29 -0700 (PDT)
Message-ID: <a40a377b-d4dd-4339-ae6e-62c73d8bdd34@smile.fr>
Date: Sun, 6 Jul 2025 16:42:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>
References: <20250705100055.31613-1-ju.o@free.fr>
Content-Language: fr
In-Reply-To: <20250705100055.31613-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1751812950; x=1752417750; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aKH5iLBxRxUtJmPnQ6e9JHqEz0AMZwiJzcH+frEoJB4=;
 b=hQKoLqmR9W3HAHjNtO6kW9vNH+6A/KlYBMsQAzPLdFE5hcjZYAbwdBJaiTkfPqITH/
 ERztu0heb72pRT9hEBNDMP4CHSmKqzYf9OkrHEKUgich7r4Eilt9lFkMVMX7GS74nxN2
 oU4rv5jwHo11tNl0dbH1+qicDvA5NwE0yeKUQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=hQKoLqmR
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-firmware: bump version to
 20250627
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSnVsaWVuLCBBbGwsCgpMZSAwNS8wNy8yMDI1IMOgIDEyOjAwLCBKdWxpZW4gT2xpdmFp
biB2aWEgYnVpbGRyb290IGEgw6ljcml0wqA6Cj4gVXBkYXRpbmcgdGhlIGhhc2ggb2YgdGhlIFdI
RU5DRSBmaWxlLCBkdWUgdG8gZmlybXdhcmUgYWRkaXRpb25zIGFuZAo+IGZpcm13YXJlIGNoYW5n
ZXMsIGJ1dCBubyBjaGFuZ2VzIHRvIHRoZSByZWRpc3RyaWJ1dGlvbi9saWNlbnNpbmcKPiBjb25k
aXRpb25zLgo+IAo+IEFsc28sIHNvbWUgbGljZW5zZXMgd2VyZSBleHRyYWN0ZWQgZnJvbSBXSEVO
Q0UgdG8gc2VwYXJhdGUgZmlsZXMgaW4KPiB1cHN0cmVhbSBjb21taXQgWzFdLiBUaGlzIGNvbW1p
dCBhZGRzIHRob3NlIG5ldyBmaWxlcyBmb3IgZmlybXdhcmVzCj4gc3VwcG9ydGVkIGluIEJ1aWxk
cm9vdC4KPiAKPiBbMV0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5l
bC9naXQvZmlybXdhcmUvbGludXgtZmlybXdhcmUuZ2l0L2NvbW1pdC8/aWQ9Y2I4MjZjNzBlOTEy
OGU2YTQwNjllYTg0NjgwYTM3OWViZTk2MDI2MgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4K
CkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gT2xpdmFp
biA8anUub0BmcmVlLmZyPgo+IC0tLQo+ICBwYWNrYWdlL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZp
cm13YXJlLmhhc2ggfCAgNyArKysrKy0tCj4gIHBhY2thZ2UvbGludXgtZmlybXdhcmUvbGludXgt
ZmlybXdhcmUubWsgICB8IDExICsrKystLS0tLS0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgOSBpbnNl
cnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xpbnV4
LWZpcm13YXJlL2xpbnV4LWZpcm13YXJlLmhhc2ggYi9wYWNrYWdlL2xpbnV4LWZpcm13YXJlL2xp
bnV4LWZpcm13YXJlLmhhc2gKPiBpbmRleCAwN2YzZDdiMzFhLi5jOWM2NzNmN2UyIDEwMDY0NAo+
IC0tLSBhL3BhY2thZ2UvbGludXgtZmlybXdhcmUvbGludXgtZmlybXdhcmUuaGFzaAo+ICsrKyBi
L3BhY2thZ2UvbGludXgtZmlybXdhcmUvbGludXgtZmlybXdhcmUuaGFzaAo+IEBAIC0xLDUgKzEs
NSBAQAo+ICAjIEZyb20gaHR0cHM6Ly9taXJyb3JzLmVkZ2Uua2VybmVsLm9yZy9wdWIvbGludXgv
a2VybmVsL2Zpcm13YXJlL3NoYTI1NnN1bXMuYXNjCj4gLXNoYTI1NiAgZjJjNjBkNjZmMjI2YTI4
MTMwY2I1NjQzZTZlNTQ0ZDMyMjk2NzM0NjBlMTI3YzkxYmEwM2YxMDgwY2JkNzAzZSAgbGludXgt
ZmlybXdhcmUtMjAyNTA1MDkudGFyLnh6Cj4gK3NoYTI1NiAgZWRlZmIxZDJhNTM4MzY3YWJmOTU1
ODgwMmZlZTNjZDEzNWViYjE5YTRhNTg5MGM4ZWVmYjM0MTZhOTJhNmI4OSAgbGludXgtZmlybXdh
cmUtMjAyNTA2MjcudGFyLnh6Cj4gIAo+ICAjIEhhc2ggZm9yIGxpY2Vuc2UgZmlsZXMKPiAgc2hh
MjU2ICA4MTE2NDMzZjQwMDRmYzBjMjRkNzJiM2Q5ZTQ5NzgwOGI3MjRhYTBlNWUxY2Q2M2ZjMWJm
NjZiNzE1YjFlMmU5ICBMSUNFTkNFLkFiaWxpcwo+IEBAIC0xMCw2ICsxMCw4IEBAIHNoYTI1NiAg
ODAyYjcwMTRiMjZjNjA2Y2Y2MjQ4YWU4YjBhYjFjZTZkMmQxYjBkYjIzNmQzOGRkMjY5ZTY3NmNk
NzA3MTBmMiAgTElDRU5DCj4gIHNoYTI1NiAgM2I1ZWIzOTJiMmQ5ZDhjNDZkNmFhZTI2ZDA2YzE4
N2U1ZWEzMDI5YjEyZDEzYmMyYjhkZWI4YjNjZTZiZmE1MyAgYXRoMTBrL1FDQTYxNzQvaHczLjAv
bm90aWNlX2F0aDEwa19maXJtd2FyZS00LnR4dAo+ICBzaGEyNTYgIDYzMTA2NTcwMzA1NWQxMWIw
OTk0NzdjNTA4NTA4ZjIwYTgwYjIwMmFhZDU0OGE3NzI2NTY0YmZhNTlhOTZjOTEgIGF0aDEway9R
Q0E2MTc0L2h3Mi4xL25vdGljZV9hdGgxMGtfZmlybXdhcmUtNS50eHQKPiAgc2hhMjU2ICA4Y2U1
YzZlYTA1NDJiZjRhYWMzMWZjM2FlMTZhMzk3OTJhZDIyZDBlYWU0NTQzMDYzZmFjNTZmYjMzODBm
MDIxICBhdGgxMGsvUUNBNjE3NC9odzMuMC9ub3RpY2VfYXRoMTBrX2Zpcm13YXJlLTYudHh0Cj4g
K3NoYTI1NiAgYmYxY2I4OTE0MGZlN2UxMzhmZWMyMjliMjZmYTQ1ZDJmYjQ2ZjQxNmFiNTU5OTE2
YzZlNTZjMDIyNGRmMmU4ZSAgTElDRU5DRS5ibngyCj4gK3NoYTI1NiAgNjkxZjJiNWUzZTk0ZTA2
YWE4OTQ1MGM5OWZmMDhjODMzMzZjNzdmZTRhZDY0YTYwOWIxY2RkZWE0YmY5ODcyNyAgTElDRU5D
RS5ibngyeAo+ICBzaGEyNTYgIGIxNjA1NmZjOTFiODJhMGUzZThkZThmODZjMmRhYzk4MjAxYWE5
ZGMzY2JkMzNlOGQzOGYxYjA4N2ZjZWMzMGQgIExJQ0VOQ0UuYnJvYWRjb21fYmNtNDN4eAo+ICBz
aGEyNTYgIGE1Nzc3ZjllODBhY2EwNjAzYjA2NDg0NTRkZTk5NjE2OGIxYzUzMDMyMjU1MGNjZGE5
NGQ2ZDc4YmNmNmMwNjEgIExJQ0VOQ0UuY2hlbHNpb19maXJtd2FyZQo+ICBzaGEyNTYgIGFlMGRi
NmNjNGRiMzM5NDExNDhkZjBmNjdkZTUzZTc2YTc3YjFiNWE0NmIzMTY1ZWRiNzA0MGFhMjc1MDAx
NWYgIExJQ0VOQ0UuY3lwcmVzcwo+IEBAIC0zMCw2ICszMiw3IEBAIHNoYTI1NiAgZDdiZWM3MDY2
OGRkZDRhYWU4ZmI0YWEzMjg3MGU1NGI0OWZjZGIwYjliMDA3YWE5ZjU0YjUzYTFhYzc0NjFiZCAg
TElDRU5DCj4gIHNoYTI1NiAgODU2ODM1MmI1N2YzNTc0ZjlkNWIyNzUzY2RiN2M2ZTVlYjJiNzll
ODJmYmI5YzliYTY1NjY5NDc0NjdlZjUwOCAgTElDRU5DRS5yYWxpbmtfYV9tZWRpYXRla19jb21w
YW55X2Zpcm13YXJlCj4gIHNoYTI1NiAgYTYxMzUxNjY1YjRmMjY0ZjZjNjMxMzY0Zjg1YjkwN2Q4
ZjhmNDFmOGIzNjk1MzNlZjQwMjE3NjVmOWYzYjYyZSAgTElDRU5DRS5ydGx3aWZpX2Zpcm13YXJl
LnR4dAo+ICBzaGEyNTYgIDE5MGZkZjEwMzI3OGNkNjlmNDg5ZGMwZDFkNGRhODFkOWEzNmFmOGI1
YmFlYTMzNjU2N2ZjYjFkZjUxYTE5NzMgIExJQ0VOQ0UudGktY29ubmVjdGl2aXR5Cj4gK3NoYTI1
NiAgYTI1NWQ0YTkwYzQ1N2JiYzg0MGE4MzlkMDA5ZmU1Nzc2NWVkODUyMjM5NjVhMmU0ZTVlY2I4
M2IzNDhlNWVjOCAgTElDRU5DRS50aWdvbgo+ICBzaGEyNTYgIDhlYTlmNGFlZTVmNTNhZDg3NzA0
MWZmMDg5ZThjOTVkMzRkNjE1Y2UxOWEzMTExZTVlMWVhNzBkOTkwZWQ3ZmYgIExJQ0VOQ0UueGM0
MDAwCj4gIHNoYTI1NiAgMzBlYzhhNjY1MDNkYzczZjgzOTM3NTY0YWU3MGNhMjNhYTAzMjU5ZTY0
NzI3ZmY0MTk1YjViNmY2OTVlNzgyZiAgTElDRU5DRS54YzUwMDAKPiAgc2hhMjU2ICBmODgyMjA0
OWYzMmZlZjJlOTBhMTk3YmQ4Y2YyNTlmNDc2ZGI3NWQ1NDk0NTZiZGNhODU2NzYxNmE5YzA3YWNl
ICBMSUNFTkNFLnhjNTAwMGMKPiBAQCAtNDEsNyArNDQsNyBAQCBzaGEyNTYgIDg1NDJhZWFiZjI3
NjE5MzUxMjJkNjkzNTYxZTE2NzY2Y2UxYmNjMmIwZDAwMzIwNGY5MDQwYjdkNmQ5MjlmMmUgIExJ
Q0VOUwo+ICBzaGEyNTYgIGJlOTA0Y2QyOGNiMjkyYjgwY2RiNmNmNDEyYWIwZDkxNTlkNDMxNjcx
ZTk4N2FkNDMzYzFmNjJlMDk4OGE5YmMgIExJQ0VOU0UucWNvbQo+ICBzaGEyNTYgIGZjNjIyM2Q0
YmZlOWYyZjllMmVkZGM0NGI5ZmU1NzIxZDBjYWY0OWYwMWNiMDhkNjAyOTA2YWRkNjg2ZDhjNmYg
IExJQ0VOU0UucmFkZW9uCj4gIHNoYTI1NiAgMmJkZDJlNzE2ZjA1ZDk3MzdkM2Y5YTIwZjlhM2Ez
YzBjYWVlMGU4NjYxMDBkZGIwNjczZjExNzhlNDJmOTJiOSAgTElDRU5TRS5zZG1hX2Zpcm13YXJl
Cj4gLXNoYTI1NiAgNDc2Mzc5ZDdmMjUyMDRkMmE1OTg3ZWNkNjE0ZmQwZmFkYWE5ZDY0Nzc1Yzky
NmYwNjc0NjFmZGZkZmY5YjBjOSAgV0hFTkNFCj4gK3NoYTI1NiAgOGYyYThlY2IzMzU4NjQ0Y2Fj
M2MxZjM3ZGIzYzYxYTkyNTIxYmNhZjQ0NTdhYzcyNmM1OTdiM2I4MTc5NmFhNCAgV0hFTkNFCj4g
IHNoYTI1NiAgZmE0M2UxYjlhMTNiMzQxYTA3YWRjYTlkYmU3M2QwZjkwNzJkNzk2NmZkZmU4MTFj
MDFmMGRkMjg3MmQ3MzA5YSAgcWNvbS9OT1RJQ0UudHh0Cj4gIHNoYTI1NiAgYmVmOWM4MjhlODRm
MjFlNzgzNWI0ZGU3ZGFmOTU0YTMyN2UxZmY3Nzc4NzFiNThlMTE2MDM5YjY4NGMwZDYwNCAgTElD
RU5DRS5lMTAwCj4gIHNoYTI1NiAgMjZiM2M5NDZmMWYzNzhmZjI1YmIzYmI3YzM2NWQxMDhhMmJj
MGJmMDg2MTllNWUwOGJjMGU0ZjlhYWE2ZWUxZSAgTElDRU5TRS54ZQo+IGRpZmYgLS1naXQgYS9w
YWNrYWdlL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJlLm1rIGIvcGFja2FnZS9saW51eC1m
aXJtd2FyZS9saW51eC1maXJtd2FyZS5tawo+IGluZGV4IDA3ZDdmZTRlYTEuLjM4MjEyZTEyYWMg
MTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2FyZS5tawo+
ICsrKyBiL3BhY2thZ2UvbGludXgtZmlybXdhcmUvbGludXgtZmlybXdhcmUubWsKPiBAQCAtNCw3
ICs0LDcgQEAKPiAgIwo+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICAKPiAtTElOVVhfRklS
TVdBUkVfVkVSU0lPTiA9IDIwMjUwNTA5Cj4gK0xJTlVYX0ZJUk1XQVJFX1ZFUlNJT04gPSAyMDI1
MDYyNwo+ICBMSU5VWF9GSVJNV0FSRV9TT1VSQ0UgPSBsaW51eC1maXJtd2FyZS0kKExJTlVYX0ZJ
Uk1XQVJFX1ZFUlNJT04pLnRhci54ego+ICBMSU5VWF9GSVJNV0FSRV9TSVRFID0gJChCUjJfS0VS
TkVMX01JUlJPUikvbGludXgva2VybmVsL2Zpcm13YXJlCj4gIExJTlVYX0ZJUk1XQVJFX0lOU1RB
TExfSU1BR0VTID0gWUVTCj4gQEAgLTYzMSwyMCArNjMxLDE3IEBAIGVuZGlmCj4gIAo+ICBpZmVx
ICgkKEJSMl9QQUNLQUdFX0xJTlVYX0ZJUk1XQVJFX0JST0FEQ09NX1RJR09OMykseSkKPiAgTElO
VVhfRklSTVdBUkVfRklMRVMgKz0gdGlnb24vKgo+IC0jIE5vIGxpY2Vuc2UgZmlsZTsgdGhlIGxp
Y2Vuc2UgaXMgaW4gdGhlIGZpbGUgV0hFTkNFCj4gLSMgd2hpY2ggaXMgaW5zdGFsbGVkIHVuY29u
ZGl0aW9uYWxseQo+ICtMSU5VWF9GSVJNV0FSRV9BTExfTElDRU5TRV9GSUxFUyArPSBMSUNFTkNF
LnRpZ29uCj4gIGVuZGlmCj4gIAo+ICBpZmVxICgkKEJSMl9QQUNLQUdFX0xJTlVYX0ZJUk1XQVJF
X0JOWDIpLHkpCj4gIExJTlVYX0ZJUk1XQVJFX0ZJTEVTICs9IGJueDIvKgo+IC0jIE5vIGxpY2Vu
c2UgZmlsZTsgdGhlIGxpY2Vuc2UgaXMgaW4gdGhlIGZpbGUgV0hFTkNFCj4gLSMgd2hpY2ggaXMg
aW5zdGFsbGVkIHVuY29uZGl0aW9uYWxseQo+ICtMSU5VWF9GSVJNV0FSRV9BTExfTElDRU5TRV9G
SUxFUyArPSBMSUNFTkNFLmJueDIKPiAgZW5kaWYKPiAgCj4gIGlmZXEgKCQoQlIyX1BBQ0tBR0Vf
TElOVVhfRklSTVdBUkVfQk5YMlgpLHkpCj4gIExJTlVYX0ZJUk1XQVJFX0ZJTEVTICs9IGJueDJ4
LyoKPiAtIyBObyBsaWNlbnNlIGZpbGU7IHRoZSBsaWNlbnNlIGlzIGluIHRoZSBmaWxlIFdIRU5D
RQo+IC0jIHdoaWNoIGlzIGluc3RhbGxlZCB1bmNvbmRpdGlvbmFsbHkKPiArTElOVVhfRklSTVdB
UkVfQUxMX0xJQ0VOU0VfRklMRVMgKz0gTElDRU5DRS5ibngyeAo+ICBlbmRpZgo+ICAKPiAgaWZl
cSAoJChCUjJfUEFDS0FHRV9MSU5VWF9GSVJNV0FSRV9DWEdCNF9UNCkseSkKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
