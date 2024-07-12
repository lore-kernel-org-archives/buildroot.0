Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B68C3DA45
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 19:51:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97B578408D;
	Fri, 12 Jul 2024 19:51:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 792kdeBxdOoy; Fri, 12 Jul 2024 19:51:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E07B840E5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E07B840E5;
	Fri, 12 Jul 2024 19:51:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 39FED1BF279
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 19:51:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 33F79840E5
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 19:51:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 78aAU9dDVbFJ for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 19:50:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D0E8E8408D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0E8E8408D
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D0E8E8408D
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 19:50:58 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3678aa359b7so2162732f8f.1
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 12:50:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720813857; x=1721418657;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nu9bInlfhgTG7xq2YgpwLlMbtPIAt97/wpSrMEsNuHk=;
 b=hZTAqAEvn6bh1ca74vFz5BIxCHnq3FwaVtuw+WouqLLeMuy0v42hFiXS1yFSvzOT4Q
 a9OcawmT7JZ5XccXrWiVnogzPI8NSp6vRVWWJ7HAOFAPv/wODYviDhnrjWMpEvnjf86J
 inPao1/4+3DR5XQntHcCzusSFpmKluY/K6gx80smrjOW4237bSHecxD8YLraPfHfsADc
 pNoMuVpUWZXiOlicHSyJO1ZoPxQONFW7uT3h+uBjuOhFhkV//6Fe1YnCOSw95ttxOaDF
 f1riFRtxRaIhl6aNgAKY6TC6JG4fvWYTK5PyxqFgmrU6ci3vx30Ql9v+N2RcRjQNs/XK
 7kww==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+uF2zl0jkWXOwfhhdgaBzkfKWEBpa96XvDXsEW7NyNS6QO34nuhYN+NuI51Wif3A+K+mOZmF3EV+CSDFJhJjIFVcJaog/8Q==
X-Gm-Message-State: AOJu0YzvSwgRl3ULZ9G1m0JrGm4l62BsSUBxTDI4BYyORppchNwouOjF
 SEkiaI736PjOVAG2CH0i4aGDffnSKNMr25f8pGC8wSURTXF05e3NacupidEdYHA=
X-Google-Smtp-Source: AGHT+IF1NmJa4CNKXhUZfoA6CmsjntmHj2BbMoReCciIbbJO/ag6jbjbg1QJ7OAcu5JNqMz6rwtCCA==
X-Received: by 2002:a05:6000:1f84:b0:367:9268:bfca with SMTP id
 ffacd0b85a97d-367ff705355mr3369517f8f.22.1720813856821; 
 Fri, 12 Jul 2024 12:50:56 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:f9c8:f443:ffd:1bed?
 (2a01cb05949d5800f9c8f4430ffd1bed.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:f9c8:f443:ffd:1bed])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f2d7955sm32454715e9.47.2024.07.12.12.50.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 12:50:56 -0700 (PDT)
Message-ID: <6ad1924f-76e2-4df1-9681-9794e7e683e1@smile.fr>
Date: Fri, 12 Jul 2024 21:50:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20240704094549.378433-1-ju.o@free.fr>
Content-Language: fr, en-US
In-Reply-To: <20240704094549.378433-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1720813857; x=1721418657; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=nu9bInlfhgTG7xq2YgpwLlMbtPIAt97/wpSrMEsNuHk=;
 b=qIlVle8ISMpjYuhEeXitKNb/9pNxzpHDI2fYg4nCxS51j1vuZvMNkymZrtHZMYJ6Y0
 6HoUpg5pagE7fl8iwENYWXhhexra4ndziH9mHQiPt+vKwAjTrj3KfKj+vozZ57S9VFGu
 WIW3x3nPbkk3lARi52YZQ7ZHX+quTMJ4iozVM=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=qIlVle8I
Subject: Re: [Buildroot] [PATCH 1/1] package/rdesktop: update the patches to
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSnVsaWVuLAoKTGUgMDQvMDcvMjAyNCDDoCAxMTo0NSwgSnVsaWVuIE9saXZhaW4gYSDD
qWNyaXTCoDoKPiBDb21taXQgOGY4OGE2NDRlZCAic3VwcG9ydC9zY3JpcHRzL2FwcGx5LXBhdGNo
ZXMuc2g6IHNldCB0aGUgbWF4aW11bQo+IGZ1enogZmFjdG9yIHRvIDAiIHJlZHVjZWQgdGhlIGZ1
enogZmFjdG9yLgo+IAo+IER1ZSB0byB0aGlzIGNoYW5nZSwgcmRlc2t0b3AgZmFpbHMgdG8gYnVp
bGQgd2l0aCBvdXRwdXQ6Cj4gCj4gICAgIEFwcGx5aW5nIDAwMDEtOGJpdC1jb2xvcnMucGF0Y2gg
dXNpbmcgcGF0Y2g6Cj4gICAgIHBhdGNoaW5nIGZpbGUgeHdpbi5jCj4gICAgIEh1bmsgIzEgc3Vj
Y2VlZGVkIGF0IDE4MDEgKG9mZnNldCAzNDAgbGluZXMpLgo+ICAgICBIdW5rICMyIEZBSUxFRCBh
dCAxNTY4Lgo+ICAgICAxIG91dCBvZiAyIGh1bmtzIEZBSUxFRCAtLSBzYXZpbmcgcmVqZWN0cyB0
byBmaWxlIHh3aW4uYy5yZWoKPiAKPiBUaGlzIGNvbW1pdCByZWZyZXNoZXMgdGhlIHBhY2thZ2Ug
cGF0Y2hlcyBvbiB0aGUgY3VycmVudCBwYWNrYWdlCj4gdmVyc2lvbi4gVGhlIG9yaWdpbmFsIHBh
dGNoIHdhcyBub3QgZ2VuZXJhdGVkIHdpdGggImdpdCBmb3JtYXQtcGF0Y2giLAo+IGFuZCBoYWQg
bm8gaW5mb3JtYXRpb24gKG5vIGNvbW1pdCBsb2csIG5vIGF1dGhvciwgbm8gZGF0ZSwgLi4uKS4g
U2luY2UKPiBpdCB3YXMgaW50cm9kdWNlZCBpbiBjb21taXQgWzFdLCB0aGUgYXV0aG9yIGFuZCBk
YXRlIGlzIHNldCB0byB0aGlzCj4gY29tbWl0LiBUaGUgIlVwc3RyZWFtOiIgdGFnIGlzIGFsc28g
YWRkZWQgdG8gdGhlIHBhdGNoLCBtZW50aW9uaW5nCj4gdGhlIHVwc3RyZWFtIHByb2plY3QgaXMg
cmVwb3J0ZWQgYXMgdW5tYWludGFpbmVkIG9uIGl0cyBob21lcGFnZSAoYXQKPiB0aGUgdGltZSBv
ZiB0aGlzIGNvbW1pdCkuIEZpbmFsbHksIHRoZSAiLmNoZWNrcGFja2FnZWlnbm9yZSIgZW50cnkg
aXMKPiByZW1vdmVkLCBzaW5jZSBpdCBpcyBubyBsb25nZXIgbmVlZGVkLgoKVGhhbmtzIGZvciB0
aGUgZXhwbGFuYXRpb24uCgo+IAo+IFsxXSBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9y
Zy9idWlsZHJvb3QvLS9jb21taXQvZTJkZGU5YzdjZGMyZjllZDg1MWFjZmI3ZGFhODU4ZmZhMTc0
NDI0Ngo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBPbGl2YWluIDxqdS5vQGZyZWUuZnI+CgpB
cHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IC0tLQo+
ICAuY2hlY2twYWNrYWdlaWdub3JlICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSAtCj4g
IHBhY2thZ2UvcmRlc2t0b3AvMDAwMS04Yml0LWNvbG9ycy5wYXRjaCAgICAgICB8IDIxIC0tLS0t
LS0tLS0KPiAgLi4uL3JkZXNrdG9wLzAwMDEtQWxsb3ctOC1iaXQtY29sb3JzLnBhdGNoICAgIHwg
MzggKysrKysrKysrKysrKysrKysrKwo+ICAzIGZpbGVzIGNoYW5nZWQsIDM4IGluc2VydGlvbnMo
KyksIDIyIGRlbGV0aW9ucygtKQo+ICBkZWxldGUgbW9kZSAxMDA2NDQgcGFja2FnZS9yZGVza3Rv
cC8wMDAxLThiaXQtY29sb3JzLnBhdGNoCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3Jk
ZXNrdG9wLzAwMDEtQWxsb3ctOC1iaXQtY29sb3JzLnBhdGNoCj4gCj4gZGlmZiAtLWdpdCBhLy5j
aGVja3BhY2thZ2VpZ25vcmUgYi8uY2hlY2twYWNrYWdlaWdub3JlCj4gaW5kZXggMGExZDI2Mjc0
NTUuLjlmNGY3ZTI5OWE3IDEwMDY0NAo+IC0tLSBhLy5jaGVja3BhY2thZ2VpZ25vcmUKPiArKysg
Yi8uY2hlY2twYWNrYWdlaWdub3JlCj4gQEAgLTEyOTMsNyArMTI5Myw2IEBAIHBhY2thZ2UvcXVv
dGF0b29sLzAwMDEtZml4LW1pc3NpbmctX19QLWRlZmluaXRpb24tZm9yLW11c2wtY29tcGlsZS5w
YXRjaCBsaWJfcGF0Cj4gIHBhY2thZ2UvcmFjZWhvdW5kLzAwMDEtRml4LW1vZHVsZS1pbnN0YWxs
LXBhdGgtbGliLWluc3RlYWQtb2YtdXNyLWxpYi1wcmVmaS5wYXRjaCBsaWJfcGF0Y2guVXBzdHJl
YW0KPiAgcGFja2FnZS9yYXBpZHhtbC8wMDAxLWVuc3VyZS1pbnRlcm5hbC1wcmludC1vcGVyYXRp
b25zLWFyZS1kZWNsYXJlZC1iZWZvcmUucGF0Y2ggbGliX3BhdGNoLlVwc3RyZWFtCj4gIHBhY2th
Z2UvcmFzcGJlcnJ5cGktdXNiYm9vdC8wMDAxLU1ha2VmaWxlLWFsbG93LXBhc3NpbmctQ0ZMQUdT
LUxERkxBR1MucGF0Y2ggbGliX3BhdGNoLlVwc3RyZWFtCj4gLXBhY2thZ2UvcmRlc2t0b3AvMDAw
MS04Yml0LWNvbG9ycy5wYXRjaCBsaWJfcGF0Y2guU29iIGxpYl9wYXRjaC5VcHN0cmVhbQo+ICBw
YWNrYWdlL3JlYWQtZWRpZC8wMDAxLUZpeC1pbnN0YWxsLWZpbGUtbGlzdC5wYXRjaCBsaWJfcGF0
Y2guVXBzdHJlYW0KPiAgcGFja2FnZS9yZWFkLWVkaWQvMDAwMi1GaXgtY29tcGlsZXItY2hlY2su
cGF0Y2ggbGliX3BhdGNoLlVwc3RyZWFtCj4gIHBhY2thZ2UvcmVhZC1lZGlkLzAwMDMtZml4LWJ1
aWxkLXdpdGgtZ2NjLTEwLnBhdGNoIGxpYl9wYXRjaC5VcHN0cmVhbQo+IGRpZmYgLS1naXQgYS9w
YWNrYWdlL3JkZXNrdG9wLzAwMDEtOGJpdC1jb2xvcnMucGF0Y2ggYi9wYWNrYWdlL3JkZXNrdG9w
LzAwMDEtOGJpdC1jb2xvcnMucGF0Y2gKPiBkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRl
eCA3MTBmOGRlYmVmMi4uMDAwMDAwMDAwMDAKPiAtLS0gYS9wYWNrYWdlL3JkZXNrdG9wLzAwMDEt
OGJpdC1jb2xvcnMucGF0Y2gKPiArKysgL2Rldi9udWxsCj4gQEAgLTEsMjEgKzAsMCBAQAo+IC1k
aWZmIC11cnBOIHJkZXNrdG9wLTEuNS4wLW9yaWcveHdpbi5jIHJkZXNrdG9wLTEuNS4wL3h3aW4u
Ywo+IC0tLS0gcmRlc2t0b3AtMS41LjAtb3JpZy94d2luLmMJMjAwNy0wMS0xNyAxMjowMToxOC4w
MDAwMDAwMDAgKzAxMDAKPiAtKysrIHJkZXNrdG9wLTEuNS4wL3h3aW4uYwkyMDA3LTAxLTE3IDEy
OjA1OjAyLjAwMDAwMDAwMCArMDEwMAo+IC1AQCAtMTQ2MSw3ICsxNDYxLDcgQEAgc2VsZWN0X3Zp
c3VhbChpbnQgc2NyZWVuX251bSkKPiAtIAkJfQo+IC0gCj4gLSAJCS8qIHdlIHVzZSBhIGNvbG91
cm1hcCwgc28gdGhlIGRlZmF1bHQgdmlzdWFsIHNob3VsZCBkbyAqLwo+IC0tCQlnX293bmNvbG1h
cCA9IFRydWU7Cj4gLSsvLwkJZ19vd25jb2xtYXAgPSBUcnVlOwo+IC0gCQlnX3Zpc3VhbCA9IHZt
YXRjaGVzWzBdLnZpc3VhbDsKPiAtIAkJZ19kZXB0aCA9IHZtYXRjaGVzWzBdLmRlcHRoOwo+IC0g
CX0KPiAtQEAgLTE1NjgsNyArMTU2OCw3IEBAIHVpX2luaXQodm9pZCkKPiAtIAl7Cj4gLSAJCWdf
eGNvbG1hcCA9Cj4gLSAJCQlYQ3JlYXRlQ29sb3JtYXAoZ19kaXNwbGF5LCBSb290V2luZG93T2ZT
Y3JlZW4oZ19zY3JlZW4pLCBnX3Zpc3VhbCwKPiAtLQkJCQkJQWxsb2NOb25lKTsKPiAtKwkJCQkJ
KGdfZGVwdGggPD0gOCkgPyBBbGxvY0FsbCA6IEFsbG9jTm9uZSk7Cj4gLSAJCWlmIChnX2RlcHRo
IDw9IDgpCj4gLSAJCQl3YXJuaW5nKCJEaXNwbGF5IGNvbG91ciBkZXB0aCBpcyAlZCBiaXQ6IHlv
dSBtYXkgd2FudCB0byB1c2UgLUMgZm9yIGEgcHJpdmF0ZSBjb2xvdXJtYXAuXG4iLCBnX2RlcHRo
KTsKPiAtIAl9Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcmRlc2t0b3AvMDAwMS1BbGxvdy04LWJp
dC1jb2xvcnMucGF0Y2ggYi9wYWNrYWdlL3JkZXNrdG9wLzAwMDEtQWxsb3ctOC1iaXQtY29sb3Jz
LnBhdGNoCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMC4uMGMyYjgy
MGE0NTMKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9yZGVza3RvcC8wMDAxLUFsbG93
LTgtYml0LWNvbG9ycy5wYXRjaAo+IEBAIC0wLDAgKzEsMzggQEAKPiArRnJvbSAyMTU5Njg0ZjEy
ODdiNmJjYTJiZDc0YzEyOWI3NTJhNjM2ZWU4MDdmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+
ICtGcm9tOiBQZXRlciBLb3JzZ2FhcmQgPHBldGVyQGtvcnNnYWFyZC5jb20+Cj4gK0RhdGU6IFdl
ZCwgMTcgSmFuIDIwMDcgMTM6NTg6MDEgKzAwMDAKPiArU3ViamVjdDogW1BBVENIXSBBbGxvdyA4
LWJpdCBjb2xvcnMKPiArCj4gK1Vwc3RyZWFtOiBSZXBvcnRlZCBhcyB1bm1haW50YWluZWQgb24g
aG9tZXBhZ2UgaHR0cDovL3d3dy5yZGVza3RvcC5vcmcvCj4gK1NpZ25lZC1vZmYtYnk6IFBldGVy
IEtvcnNnYWFyZCA8cGV0ZXJAa29yc2dhYXJkLmNvbT4KPiArW0p1bGllbjogcmVmcmVzaGVkIHRo
ZSBwYXRjaCB0byBiZSBhcHBsaWVkIHdpdGggZnV6eiBmYWN0b3IgMF0KPiArU2lnbmVkLW9mZi1i
eTogSnVsaWVuIE9saXZhaW4gPGp1Lm9AZnJlZS5mcj4KPiArLS0tCj4gKyB4d2luLmMgfCA0ICsr
LS0KPiArIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4g
Kwo+ICtkaWZmIC0tZ2l0IGEveHdpbi5jIGIveHdpbi5jCj4gK2luZGV4IGQ5NmQwZjQuLmQxMWY0
YTYgMTAwNjQ0Cj4gKy0tLSBhL3h3aW4uYwo+ICsrKysgYi94d2luLmMKPiArQEAgLTE4MDEsNyAr
MTgwMSw3IEBAIHNlbGVjdF92aXN1YWwoaW50IHNjcmVlbl9udW0pCj4gKyAJCX0KPiArIAo+ICsg
CQkvKiB3ZSB1c2UgYSBjb2xvdXJtYXAsIHNvIHRoZSBkZWZhdWx0IHZpc3VhbCBzaG91bGQgZG8g
Ki8KPiArLQkJZ19vd25jb2xtYXAgPSBUcnVlOwo+ICsrLy8JCWdfb3duY29sbWFwID0gVHJ1ZTsK
PiArIAkJZ192aXN1YWwgPSB2bWF0Y2hlc1swXS52aXN1YWw7Cj4gKyAJCWdfZGVwdGggPSB2bWF0
Y2hlc1swXS5kZXB0aDsKPiArIAl9Cj4gK0BAIC0yMDEwLDcgKzIwMTAsNyBAQCB1aV9pbml0KHZv
aWQpCj4gKyAJewo+ICsgCQlnX3hjb2xtYXAgPQo+ICsgCQkJWENyZWF0ZUNvbG9ybWFwKGdfZGlz
cGxheSwgUm9vdFdpbmRvd09mU2NyZWVuKGdfc2NyZWVuKSwgZ192aXN1YWwsCj4gKy0JCQkJCUFs
bG9jTm9uZSk7Cj4gKysJCQkJCShnX2RlcHRoIDw9IDgpID8gQWxsb2NBbGwgOiBBbGxvY05vbmUp
Owo+ICsgCQlpZiAoZ19kZXB0aCA8PSA4KQo+ICsgCQkJbG9nZ2VyKEdVSSwgV2FybmluZywKPiAr
IAkJCSAgICAgICAiRGlzcGxheSBjb2xvdXIgZGVwdGggaXMgJWQgYml0OiB5b3UgbWF5IHdhbnQg
dG8gdXNlIC1DIGZvciBhIHByaXZhdGUgY29sb3VybWFwIiwKPiArLS0gCj4gKzIuNDUuMgo+ICsK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
