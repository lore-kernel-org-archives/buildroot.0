Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7838E95360
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 09:39:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 949C460A9D;
	Wed,  4 Feb 2026 09:39:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9CMSohQKAAJy; Wed,  4 Feb 2026 09:39:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 734DA60AA0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770197955;
	bh=rt+b/yQjIwfVGEsaIogcQb+f3Hzxij6Tsf28l7fToXE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DYlkUm5KlAq34UtoL2k2rlTvoHD4B5hHjYSxy3LJnDX9ZoCC3Jmt1rs8XXUk9JtTw
	 FiR+JLkmSN2UPt0uKvbo5VUmmEMJn+fmt25MhJYxl33crDmsn12GrCJ++HazOt2sXg
	 d+/tK5WsZ8XzUU+tSn+RqOfHsr9leCDF9EikBt30Eq0bRAdTEnfqK90eTzm6sFW9Vd
	 ytWaJqxk73k9S6Ia+SR4ewYDBNqceOyCKrrxKjH5jbALE0RskL/E/JLFouFXpTrnXX
	 qcbxFyQkIiFlaKZ5HuT96vRvgbIgC0mzc5y4K4REiwVEIDysKZwOaZSfmjjLL1jf1o
	 mdckJQjnWbTkw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 734DA60AA0;
	Wed,  4 Feb 2026 09:39:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AD994F4
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 09:39:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8ACF760B74
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 09:39:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3RUKeGkAoLxr for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 09:39:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 417D960A9A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 417D960A9A
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 417D960A9A
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 09:39:11 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-47ee76e8656so88883235e9.0
 for <buildroot@buildroot.org>; Wed, 04 Feb 2026 01:39:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770197950; x=1770802750;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3cY7scZ1k9GfzO1LA3L27QwvWmets0t5ucy6pa4Bk/U=;
 b=b/K/YT0OfPwZnLpPzuLJMHz0o7OnPzK1qj7WoqctrVug1MIueCo9uwgkW8rZWY2MYD
 M/uNMn5kZguuEyk+PqwQVFJdkhPYcJff1b/uKCy1QXUGB0baTLApnSBkVRcVkNhOa182
 wK1si4E6goDLPXQyuhEdrO/Xxf1GCiMidURzVbY5qknbT9uyIyrKhpbxvVfiEovd1ZLr
 COFzUjs8mqyqUCw6XCQuc+RACLQaiPkYFfz8oRW6JBWur0kqoJQFD5qbyYtaTgFMTe6G
 1e6UaxjxZ3npWuBg+bo6lfdAgqeOKjhJyWseQawdrU9YQ07qhSRTEe7Svbab/KQt1M2w
 EbzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHVa++h51sNm2BcB1wTpZaLLixODeIEWAvr8boQTPI0r2wVCGstpF9eclrIUZVvKaQQN9ymmlNMDY=@buildroot.org
X-Gm-Message-State: AOJu0YwXcYl9qi4A5ITu9piSFNbK2ONgaqV0kwoqDwV2L3zKBlZDiFdM
 VAG+ix87vxU/GXxw6PKWegK9dPGe36o+M+nP5Q6zl07fmZc8Fv70PCW4VEaUB/ZaqA8=
X-Gm-Gg: AZuq6aJ92IzDnkasA6YwocFoMMETye7Fbq3eRx1mdR5OTOrm3v/IVeoC1oD8xv3sy+K
 0ukmFMI/Bv02ZTV4zaVzCtVOx0UYPHUEELUhXEFyZyBl+CPXgQNItnbhzk+735LWlmoDFEAesv/
 8GJ6biU/Mcbo4hDWVSvzF8tds+CI2zFsu3hqbh2ggqRyX0g8nIlUDVvuBemOOSsiC61x0nOhRvg
 LljF6mE0dVQUPSBq/pOgd9t6PpfD+34po74PaZKw8A+DAQApDXFw3zEoH1mWN4LWaOjqdvyAlBQ
 SGRM9P3wPuPHpAxJcxBOMm/cTcoNOEKyjBKCLJbQgupWU2z+BRANBA7XwTdpfxBRbasjhNYBpXn
 gJVLs32crTkrbcQ6ci4eYNvOzTQCCiP4vQFhfcFKe8dp6TA1M4M4/Olnt/2Hr8l0OULs1dk2Oc1
 +yBqDZa0KFeGo9kbKr9DTlN9oDYPXA+nEmq2ET7KHdMgYgDesK8lHd
X-Received: by 2002:a05:600c:4fd0:b0:47a:9560:ec28 with SMTP id
 5b1f17b1804b1-4830e93060bmr32355465e9.13.1770197949947; 
 Wed, 04 Feb 2026 01:39:09 -0800 (PST)
Received: from [172.16.2.208] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4830fe86a7bsm13910285e9.8.2026.02.04.01.39.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Feb 2026 01:39:09 -0800 (PST)
Message-ID: <0b37c737-cc12-4853-98dc-5ef481b4e292@smile.fr>
Date: Wed, 4 Feb 2026 10:39:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>
References: <20260203193937.2682994-1-bernd@kuhls.net>
Content-Language: fr, en-US
In-Reply-To: <20260203193937.2682994-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1770197950; x=1770802750; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3cY7scZ1k9GfzO1LA3L27QwvWmets0t5ucy6pa4Bk/U=;
 b=IX+xqPwvKR/li2FEWmjNswGH8QJmSw4qJ/XGyLPiuqSLszXmIzCEZwbD6czs55KXpD
 IMZayxmptONKkQUwoZ/AhoyFZK1LYWxSFmSTJmyLQLrsaJstctXlOzpY/0/y1NEH6PaF
 H7kQ4CsCd0MJNAOo3OcqUE2w7moT8UtfFG+bw=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=IX+xqPwv
Subject: Re: [Buildroot] [PATCH 1/1] package/mesa3d: fix aarch64_be build
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

SGVsbG8gQmVybmQsIEFsbCwKCkxlIDAzLzAyLzIwMjYgw6AgMjA6MzksIEJlcm5kIEt1aGxzIGEg
w6ljcml0wqA6Cj4gQnVpbGRyb290IGNvbW1pdCAxYjhkN2U3YmVkYjIwNGI2ZmIxMDk0YTU3ODIy
YTQ2NTIyMDZiNDRhIGJ1bXBlZCB0aGUKPiBwYWNrYWdlIHRvIHZlcnNpb24gMjMuMi4xIHRoYXQg
Y29udGFpbnMgdGhlIHVwc3RyZWFtIGNvbW1pdAo+IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9w
Lm9yZy9tZXNhL21lc2EvLS9jb21taXQvNzc4MjZlODM1MjQzMjkxZGY2NjRjY2YyYTdiODQwNTI4
N2I3MjM4NyNlNjU3NDQzNTRmZGQ3ZGQzODM0MmIxMzhlNTllNDA3NjdjZmNkYWE5Cj4gd2hpY2gg
Y2F1c2VzIGJ1aWxkIGVycm9ycyBvbiBhYXJjaDY0X2JlLgo+IAo+IFRoZSBidWlsZCBlcnJvciB3
YXMgZmlyc3Qgc2VlbiBieSB0aGUgYXV0b2J1aWxkZXJzIHdpdGggbWVzYTNkLTIzLjMuMzoKPiBo
dHRwczovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvYjYyL2I2MmViYTIxNTViMDgw
ZWQwMmZkZTc3NDk5NGYyZmZmYzhhNmVmNTEvCj4gYWNjb3JkaW5nIHRvIGh0dHBzOi8vYXV0b2J1
aWxkLmJ1aWxkcm9vdC5uZXQvP3JlYXNvbj1tZXNhM2QlJmFyY2g9YWFyY2g2NF9iZQoKSSBqdXN0
IGZpeHVwIHRoZSBsYXN0IGxpbmsgdG86Cmh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQv
P3JlYXNvbj1tZXNhM2QtMjUuMy40JmFyY2g9YWFyY2g2NF9iZQoKT3RoZXJ3aXNlIHRoZSBsaXN0
IGlzIGVtcHR5LgoKPiAKPiBBIGJhY2twb3J0IHRvIExUUyBicmFuY2hlcyBzaG91bGQgYmUgY29u
c2lkZXJlZC4KPiAKPiBGaXhlczoKPiBodHRwczovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jl
c3VsdHMvZWZkL2VmZDA3ZDk3ZGY0ZTBjMWNlYjA3ZmMyNmUxNzg5OGFmZWY1NDM1YjkvCgpJc3N1
ZSByZXByb2R1Y2VkIGxvY2FsbHksIGFuZCB1cHN0cmVhbSByZXZpZXdlZCBhbHJlYWR5IHlvdXIg
TVIuCgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+
IAo+IFNpZ25lZC1vZmYtYnk6IEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+Cj4gLS0tCj4g
IC4uLjNfbmVvbi5jLW9ubHktZm9yLWxpdHRsZS1lbmRpYW4tYXJjaC5wYXRjaCB8IDQ3ICsrKysr
KysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDQ3IGluc2VydGlvbnMoKykKPiAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvbWVzYTNkLzAwMDQtYmxha2UzLWFkZC1ibGFrZTNfbmVv
bi5jLW9ubHktZm9yLWxpdHRsZS1lbmRpYW4tYXJjaC5wYXRjaAo+IAo+IGRpZmYgLS1naXQgYS9w
YWNrYWdlL21lc2EzZC8wMDA0LWJsYWtlMy1hZGQtYmxha2UzX25lb24uYy1vbmx5LWZvci1saXR0
bGUtZW5kaWFuLWFyY2gucGF0Y2ggYi9wYWNrYWdlL21lc2EzZC8wMDA0LWJsYWtlMy1hZGQtYmxh
a2UzX25lb24uYy1vbmx5LWZvci1saXR0bGUtZW5kaWFuLWFyY2gucGF0Y2gKPiBuZXcgZmlsZSBt
b2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjVlNGM4OWI3MTQKPiAtLS0gL2Rldi9udWxs
Cj4gKysrIGIvcGFja2FnZS9tZXNhM2QvMDAwNC1ibGFrZTMtYWRkLWJsYWtlM19uZW9uLmMtb25s
eS1mb3ItbGl0dGxlLWVuZGlhbi1hcmNoLnBhdGNoCj4gQEAgLTAsMCArMSw0NyBAQAo+ICtGcm9t
IGM0MjkyY2M1YWYzMjc4YjI5NGMyYmFhNTQ2NGM5OTg1MjI4MjA1ZmUgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCj4gK0Zyb206IEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+Cj4gK0RhdGU6
IFR1ZSwgMyBGZWIgMjAyNiAyMDoxMzo0OSArMDEwMAo+ICtTdWJqZWN0OiBbUEFUQ0hdIGJsYWtl
MzogYWRkIGJsYWtlM19uZW9uLmMgb25seSBmb3IgbGl0dGxlIGVuZGlhbiBhcmNocwo+ICsKPiAr
Rml4ZXMgYnVpbGQgZXJyb3Igb24gYmlnIGVuZGlhbiBhcmNoczoKPiArCj4gK0J1aWxkIG1hY2hp
bmUgY3B1IGZhbWlseTogeDg2XzY0Cj4gK0J1aWxkIG1hY2hpbmUgY3B1OiB4ODZfNjQKPiArSG9z
dCBtYWNoaW5lIGNwdSBmYW1pbHk6IGFhcmNoNjQKPiArSG9zdCBtYWNoaW5lIGNwdTogY29ydGV4
LWE1Mwo+ICtUYXJnZXQgbWFjaGluZSBjcHUgZmFtaWx5OiBhYXJjaDY0Cj4gK1RhcmdldCBtYWNo
aW5lIGNwdTogY29ydGV4LWE1Mwo+ICtbLi4uXQo+ICsuLi9zcmMvdXRpbC9ibGFrZTMvYmxha2Uz
X25lb24uYzo2OjI6IGVycm9yOiAjZXJyb3IgIlRoaXMgaW1wbGVtZW50YXRpb24gb25seSBzdXBw
b3J0cyBsaXR0bGUtZW5kaWFuIEFSTS4iCj4gKyAgICA2IHwgI2Vycm9yICJUaGlzIGltcGxlbWVu
dGF0aW9uIG9ubHkgc3VwcG9ydHMgbGl0dGxlLWVuZGlhbiBBUk0uIgo+ICsKPiArYXMgZGV0ZWN0
ZWQgYnkgYnVpbGRyb290IGF1dG9idWlsZGVyczoKPiAraHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRy
b290Lm5ldC9yZXN1bHRzL2VmZC9lZmQwN2Q5N2RmNGUwYzFjZWIwN2ZjMjZlMTc4OThhZmVmNTQz
NWI5L2J1aWxkLWVuZC5sb2cKPiArCj4gK0ZvciByZWZlcmVuY2U6Cj4gKyQgZ3JlcCAtaSBlbmRp
YW4gb3V0cHV0L2J1aWxkL21lc2EzZC0yNS4zLjQvYnVpbGRyb290LWJ1aWxkL2Nyb3NzLWNvbXBp
bGF0aW9uLmNvbmYKPiArZW5kaWFuID0gJ2JpZycKPiArCj4gK1Vwc3RyZWFtOiBodHRwczovL2dp
dGxhYi5mcmVlZGVza3RvcC5vcmcvbWVzYS9tZXNhLy0vbWVyZ2VfcmVxdWVzdHMvMzk2ODEKPiAr
Cj4gK1NpZ25lZC1vZmYtYnk6IEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+Cj4gKy0tLQo+
ICsgc3JjL3V0aWwvYmxha2UzL21lc29uLmJ1aWxkIHwgMiArLQo+ICsgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gKwo+ICtkaWZmIC0tZ2l0IGEvc3JjL3V0
aWwvYmxha2UzL21lc29uLmJ1aWxkIGIvc3JjL3V0aWwvYmxha2UzL21lc29uLmJ1aWxkCj4gK2lu
ZGV4IGJkNTFjZmI2OGMzLi43NjdkYTJjNmVjMyAxMDA2NDQKPiArLS0tIGEvc3JjL3V0aWwvYmxh
a2UzL21lc29uLmJ1aWxkCj4gKysrKyBiL3NyYy91dGlsL2JsYWtlMy9tZXNvbi5idWlsZAo+ICtA
QCAtMzUsNyArMzUsNyBAQCBlbGlmIGNwdV9mYW1pbHkgPT0gJ3g4NicKPiArICAgIyBUaGVyZSBh
cmUgbm8gYXNzZW1ibHkgdmVyc2lvbnMgZm9yIDMyLWJpdCB4ODYuIENvbXBpbGluZyB0aGUgQyB2
ZXJzaW9ucyByZXF1aXJlIGEgZGlmZmVyZW50IGNvbXBpbGF0aW9uIGZsYWcgcGVyCj4gKyAgICMg
ZmlsZSwgd2hpY2ggaXMgbm90IHdlbGwgc3VwcG9ydGVkIGJ5IE1lc29uLiBMZWF2ZSBTSU1EIHN1
cHBvcnQgb3V0IGZvciBub3cuCj4gKyAgIGJsYWtlM19kZWZzICs9IGJsYWtlM194ODZfbm9fc2lt
ZF9kZWZzCj4gKy1lbGlmIGNwdV9mYW1pbHkgPT0gJ2FhcmNoNjQnCj4gKytlbGlmIGNwdV9mYW1p
bHkgPT0gJ2FhcmNoNjQnIGFuZCB0YXJnZXRfbWFjaGluZS5lbmRpYW4oKSA9PSAnbGl0dGxlJwo+
ICsgICBmaWxlc19ibGFrZTMgKz0gWydibGFrZTNfbmVvbi5jJ10KPiArIGVuZGlmCj4gKyAKPiAr
LS0gCj4gKzIuNDcuMwo+ICsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
