Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13498C3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 08:19:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E8458144D;
	Sat, 13 Jul 2024 08:19:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TDRBZwD50U3T; Sat, 13 Jul 2024 08:19:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A377813EE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A377813EE;
	Sat, 13 Jul 2024 08:19:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CD78F1BF405
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 08:19:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB13F40190
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 08:19:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sju_Gshpi9dG for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 08:19:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 32FDF400D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32FDF400D1
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 32FDF400D1
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 08:19:36 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4266ea6a488so21351325e9.1
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 01:19:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720858775; x=1721463575;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vfhC9nM+w2uXhuqZOvCaZuLmpB7N9yfDjxNbhtmnlrY=;
 b=fLxjDfasqjFqGNt6ZN4EhAVBogloFzsKZZbegC9f5IIdbYeg51m9gznaH/2cOdYC5W
 XZZLHWUyC8jx9JS/6kM9erg1K6qfw3K0rs/5kF8ldlAfmij+NnYpJJPV5Bz03bTlFKnb
 aju+i2uH3scTyGgi8Og8xJxtb1QnfY6i+I5V2z51yJiTWUqaib58F3Y+2GDYVgU0Qa2o
 35NFU2GdKFK8cq9doU61nmqPwD2ZjmW5GZLTEzuYJkbYLHMCPN6kIn5t+PTFTHVc2OTi
 gIc00nv5fJMU2rG7/vTz/IkrWA/8KpTOLqrRcvhX9mtaX3fLFgO+Z1wG7OytNWjCnj2r
 3AuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmok2VJi9aSZvXn8Zs6GTFq7PBoyUehzVJBlrmQoYyOGauDCbesEKwgYMnIX3n4Bcq20WPviXuSi/3/16h+P/4nycxjnHwLg==
X-Gm-Message-State: AOJu0YwTT0KwaJF2+qvHtBWROHIZjKVgyByc+LQN4HVVbXnDqCRNm5Zz
 zRO6whtKFEjX9mGgHak0JIrwsF5HLIRvCKlHCHgx5/Ovvn3tdLJehLKngOfDF8I=
X-Google-Smtp-Source: AGHT+IHuFtiM69OKm8PdR96sDO1AyDh0+0n31oh26HR3JyDWL8E9OeDkoXNDNuSkmJq/CaOfzVngjw==
X-Received: by 2002:a7b:c052:0:b0:426:5c81:2538 with SMTP id
 5b1f17b1804b1-426707cf827mr103246355e9.14.1720858774810; 
 Sat, 13 Jul 2024 01:19:34 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f23984fsm46960815e9.7.2024.07.13.01.19.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Jul 2024 01:19:34 -0700 (PDT)
Message-ID: <e2428e3c-23e0-41c9-a11c-1537e320a074@mind.be>
Date: Sat, 13 Jul 2024 10:19:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Anisse Astier <anisse@astier.eu>, buildroot@buildroot.org
References: <20221127164533.1075407-1-anisse@astier.eu>
Content-Language: en-GB
In-Reply-To: <20221127164533.1075407-1-anisse@astier.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720858775; x=1721463575; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vfhC9nM+w2uXhuqZOvCaZuLmpB7N9yfDjxNbhtmnlrY=;
 b=HmQmqYE+hNPx+Kf4K8XStcbEMTOi4O1GdiQ9QwgeX3RPNGsVH+OETtWuw+nj2GhMNH
 Xy6M3vOY2bV1VUmZpCGHh95d2/A4Z59wAJP+uul9LD0ro7kVBpovM+uWzGf8a7U1G6BE
 7KoJjw4MeMNqIg4cLeyThePUePS/NOz2KcBGwONucO49QZekuFissaQ7n+qw2eHT0K/v
 BQB/4d3vwKuMFuLuqvaLa+8XOspMvCizxChogkx1Gr1fv5p04YZuheneJ6yqW4lYuKyE
 uUQvaZiKQXDGMBCBnSGjlTy8DrIOHTMcQ1nWEYRsloBZVdQNKFQY42AflbLAtaFYIoIA
 Kd2Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=HmQmqYE+
Subject: Re: [Buildroot] [PATCH v3] package/go: disable cgo support with
 static libs
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyNy8xMS8yMDIyIDE3OjQ1LCBBbmlzc2UgQXN0aWVyIHdyb3RlOgo+IFRoZSBnbyBzdGRs
aWIgInBsdWdpbiLigK9wYWNrYWdlIHJlbGllcyBvbiBkbGZjbi5oIHdoaWNoIGlzbid0IGF2YWls
YWJsZQo+IHdoZW4gd2UgaGF2ZSBCUjJfU1RBVElDX0xJQlM9eS4KPiAKPiBDb25jZW50cmF0ZSBh
bGwgY2dvIGRlY2lzaW9uIHVuZGVyIHRoZSBjb25maWcgb3B0aW9uCj4gQlIyX1BBQ0tBR0VfSE9T
VF9HT19UQVJHRVRfQ0dPX0xJTktJTkdfU1VQUE9SVFMgdGhhdCBoYXMgdGhlIHByb3Blcgo+IGRl
cGVuZHMuCj4gCj4gVGhpcyBzaG91bGQgZml4IHRoaXMgYnVpbGQgZXJyb3IgZnJvbSBhdXRvYnVp
bGRlcnM6Cj4gCj4gL2J1aWxkcm9vdC9idWlsZC9ob3N0LWdvLTEuMTkuMy9zcmMvcGx1Z2luL3Bs
dWdpbl9kbG9wZW4uZ286MTE6MTA6IGZhdGFsIGVycm9yOiBkbGZjbi5oOiBObyBzdWNoIGZpbGUg
b3IgZGlyZWN0b3J5Cj4gICAgIDExIHwgI2luY2x1ZGUgPGRsZmNuLmg+Cj4gCj4gU2lnbmVkLW9m
Zi1ieTogQW5pc3NlIEFzdGllciA8YW5pc3NlQGFzdGllci5ldT4KPiAtLS0KPiBDaGFuZ2VzIHNp
bmNlIHYyOgo+ICAgLSBhZGQgbW9yZSBjb21tZW50cwo+ICAgLSBjb25zb2xpZGF0ZSBhbGwgZGVj
aXNpb24gdW5kZXIgYSBzaW5nbGUgY29uZmlnIG9wdGlvbiBhcyBzdWdnZXN0ZWQgYnkKPiAgICAg
WWFubgo+IAo+IC0tLQo+ICAgcGFja2FnZS9nby9Db25maWcuaW4uaG9zdCB8ICA0ICsrKysKPiAg
IHBhY2thZ2UvZ28vZ28ubWsgICAgICAgICAgfCAzMSArKysrKysrKysrKysrKysrKy0tLS0tLS0t
LS0tLS0tCj4gICAyIGZpbGVzIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9u
cygtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2dvL0NvbmZpZy5pbi5ob3N0IGIvcGFja2Fn
ZS9nby9Db25maWcuaW4uaG9zdAo+IGluZGV4IGRlZDAyZDNiM2EuLmFjYzFhZGUxNzEgMTAwNjQ0
Cj4gLS0tIGEvcGFja2FnZS9nby9Db25maWcuaW4uaG9zdAo+ICsrKyBiL3BhY2thZ2UvZ28vQ29u
ZmlnLmluLmhvc3QKPiBAQCAtMjMsNiArMjMsMTAgQEAgY29uZmlnIEJSMl9QQUNLQUdFX0hPU1Rf
R09fVEFSR0VUX0NHT19MSU5LSU5HX1NVUFBPUlRTCj4gICAJIyBHbyBkb2Vzbid0IHN1cHBvcnQg
Q0dPIGxpbmtpbmcgb24gTUlQUzY0eCBwbGF0Zm9ybXMKPiAgIAkjIFNlZTogaHR0cHM6Ly9naXRo
dWIuY29tL2thcmFsYWJlL3hnby9pc3N1ZXMvNDYKPiAgIAlkZXBlbmRzIG9uICFCUjJfbWlwczY0
ICYmICFCUjJfbWlwczY0ZWwKPiArCSMgZ28gdXNlcyBkbGZjbi5oICsgY2dvIGZvciBpdHMgcGx1
Z2luIG1vZHVsZQo+ICsJZGVwZW5kcyBvbiAhQlIyX1NUQVRJQ19MSUJTCj4gKwkjIGNnbyBzdXBw
b3J0cyB1c2VzIHRocmVhZHMKPiArCWRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9IQVNfVEhSRUFE
Uwo+ICAgCj4gICAjIEhvc3QgZ28gcGFja2FnZXMgc2hvdWxkIGRlcGVuZCBvbiBCUjJfUEFDS0FH
RV9IT1NUX0dPX0hPU1RfQVJDSF9TVVBQT1JUUwo+ICAgY29uZmlnIEJSMl9QQUNLQUdFX0hPU1Rf
R09fSE9TVF9BUkNIX1NVUFBPUlRTCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvZ28vZ28ubWsgYi9w
YWNrYWdlL2dvL2dvLm1rCj4gaW5kZXggZmQ0Y2FhMmU1YS4uZTgwMjNkYTI2MCAxMDA2NDQKPiAt
LS0gYS9wYWNrYWdlL2dvL2dvLm1rCj4gKysrIGIvcGFja2FnZS9nby9nby5tawo+IEBAIC04Mywx
NiArODMsNiBAQCBIT1NUX0dPX1RBUkdFVF9FTlYgPSBcCj4gICAJQ0dPX0xERkxBR1M9IiQoVEFS
R0VUX0xERkxBR1MpIiBcCj4gICAJR09UT09MRElSPSIkKEhPU1RfR09fVE9PTERJUikiCj4gICAK
PiAtIyBUaGUgZ28gY29tcGlsZXIncyBjZ28gc3VwcG9ydCB1c2VzIHRocmVhZHMuICBJZiBCUjJf
VE9PTENIQUlOX0hBU19USFJFQURTIGlzCj4gLSMgc2V0LCBidWlsZCBpbiBjZ28gc3VwcG9ydCBm
b3IgYW55IGdvIHByb2dyYW1zIHRoYXQgbWF5IG5lZWQgaXQuICBOb3RlIHRoYXQKPiAtIyBhbnkg
dGFyZ2V0IHBhY2thZ2UgbmVlZGluZyBjZ28gc3VwcG9ydCBtdXN0IGluY2x1ZGUKPiAtIyAnZGVw
ZW5kcyBvbiBCUjJfVE9PTENIQUlOX0hBU19USFJFQURTJyBpbiBpdHMgY29uZmlnIGZpbGUuCj4g
LWlmZXEgKCQoQlIyX1RPT0xDSEFJTl9IQVNfVEhSRUFEUykseSkKPiAtSE9TVF9HT19DR09fRU5B
QkxFRCA9IDEKPiAtZWxzZQo+IC1IT1NUX0dPX0NHT19FTkFCTEVEID0gMAo+IC1lbmRpZgo+IC0K
PiAgIEhPU1RfR09fQ1JPU1NfRU5WID0gXAo+ICAgCUNDX0ZPUl9UQVJHRVQ9IiQoVEFSR0VUX0ND
KSIgXAo+ICAgCUNYWF9GT1JfVEFSR0VUPSIkKFRBUkdFVF9DWFgpIiBcCj4gQEAgLTEwMSwxMiAr
OTEsMjUgQEAgSE9TVF9HT19DUk9TU19FTlYgPSBcCj4gICAJJChpZiAkKEdPX0dPMzg2KSxHTzM4
Nj0kKEdPX0dPMzg2KSkgXAo+ICAgCSQoaWYgJChHT19HT0FSTSksR09BUk09JChHT19HT0FSTSkp
IFwKPiAgIAlHT19BU1NVTUVfQ1JPU1NDT01QSUxJTkc9MQo+ICtlbmRpZiAjIEJSMl9QQUNLQUdF
X0hPU1RfR09fVEFSR0VUX0FSQ0hfU1VQUE9SVFMKPiAgIAo+IC1lbHNlICMgIUJSMl9QQUNLQUdF
X0hPU1RfR09fVEFSR0VUX0FSQ0hfU1VQUE9SVFMKPiAtIyBob3N0LWdvIGNhbiBzdGlsbCBiZSB1
c2VkIHRvIGJ1aWxkIHBhY2thZ2VzIGZvciB0aGUgaG9zdC4gTm8gbmVlZCB0byBzZXQgYWxsCj4g
LSMgdGhlIGFyY2ggc3R1ZmYgc2luY2Ugd2Ugd2lsbCBub3QgYmUgY3Jvc3MtY29tcGlsaW5nLgo+
ICsjIFRoZSBnbyBjb21waWxlcidzIGNnbyBzdXBwb3J0IHVzZXMgdGhyZWFkcy4gSWYgQlIyX1RP
T0xDSEFJTl9IQVNfVEhSRUFEUyBpcwo+ICsjIHNldCwgYnVpbGQgaW4gY2dvIHN1cHBvcnQgZm9y
IGFueSBnbyBwcm9ncmFtcyB0aGF0IG1heSBuZWVkIGl0Lgo+ICsjCj4gKyMgSWYgdGhlIHdlIGFy
ZSB1c2luZyBzdGF0aWMgbGlicywgZHluYW1pYyBsb2FkaW5nIG9mIGxpYnJhcmllcyB3b24ndCBi
ZQo+ICsjIGF2YWlsYWJsZSwgYW5kIGdvIHdvbid0IGJlIGFibGUgdG8gdXNlIGRsZmNuLmggZm9y
IGl0cyBwbHVnaW4gcGFja2FnZS4KPiArIyBEaXNhYmxlIGNnbyBhcyB3ZWxsLgo+ICsjCj4gKyMg
SWYgdGhlIHRhcmdldCBhcmNoIGRvZXMgbm90IHN1cHBvcnQgZ28sIGhvc3QtZ28gY2FuIHN0aWxs
IGJlIHVzZWQgdG8gYnVpbGQKPiArIyBwYWNrYWdlcyBmb3IgdGhlIGhvc3QsIGFuZCBlbmFibGUg
Y2dvLgo+ICsjCj4gKyMgTm90ZSB0aGF0IGFueSB0YXJnZXQgcGFja2FnZSBuZWVkaW5nIGNnbyBz
dXBwb3J0IG11c3QgaW5jbHVkZSAnZGVwZW5kcyBvbgo+ICsjIEJSMl9QQUNLQUdFX0hPU1RfR09f
VEFSR0VUX0NHT19MSU5LSU5HX1NVUFBPUlRTJyBpbiBpdHMgY29uZmlnIGZpbGUuCj4gK2lmZXEg
KCQoQlIyX1BBQ0tBR0VfSE9TVF9HT19UQVJHRVRfQ0dPX0xJTktJTkdfU1VQUE9SVFMpLHkpCgog
IFRoaXMgZG9lc24ndCBhY3R1YWxseSBlbmFibGUgY2dvIHN1cHBvcnQgaWYgdGhlIHRhcmdldCBp
c24ndCBzdXBwb3J0ZWQgKGxpa2UgCnRoZSBjb21tZW50IGFib3ZlIGNsYWltcykuIFNvIEkgcmV2
ZXJ0ZWQgYSBiaXQgdG8gdGhlIHByZXZpb3VzIHZlcnNpb24sIHdpdGggYW4gCmV4cGxpY2l0IEhP
U1RfR09fQ0dPX0VOQUJMRUQgPSAxIGluIHRoZSBlbHNlIGJyYW5jaCBvZiB0aGUgCkJSMl9QQUNL
QUdFX0hPU1RfR09fVEFSR0VUX0FSQ0hfU1VQUE9SVFMgY29uZGl0aW9uLgoKICBBcHBsaWVkIHRv
IG1hc3RlciwgdGhhbmtzLgoKICBSZWdhcmRzLAogIEFybm91dAoKPiAgIEhPU1RfR09fQ0dPX0VO
QUJMRUQgPSAxCj4gLWVuZGlmICMgQlIyX1BBQ0tBR0VfSE9TVF9HT19UQVJHRVRfQVJDSF9TVVBQ
T1JUUwo+ICtlbHNlCj4gK0hPU1RfR09fQ0dPX0VOQUJMRUQgPSAwCj4gK2VuZGlmCj4gICAKPiAg
ICMgRm9yIHRoZSBjb252ZW5pZW5jZSBvZiBob3N0IGdvbGFuZyBwYWNrYWdlcwo+ICAgSE9TVF9H
T19IT1NUX0VOViA9IFwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
