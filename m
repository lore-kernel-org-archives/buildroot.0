Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E902DC48BC3
	for <buildroot@archiver.kernel.org>; Mon, 19 Feb 2024 10:15:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C9F034095A;
	Mon, 19 Feb 2024 10:15:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HupH8a_pXfvx; Mon, 19 Feb 2024 10:15:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A5F940929
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A5F940929;
	Mon, 19 Feb 2024 10:15:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CF3381BF3DB
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 10:15:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C874D81200
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 10:15:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iTrkiS0aiwFR for <buildroot@lists.busybox.net>;
 Mon, 19 Feb 2024 10:15:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6E58F82090
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E58F82090
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6E58F82090
 for <buildroot@buildroot.org>; Mon, 19 Feb 2024 10:15:33 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-33d0a7f2424so2256012f8f.0
 for <buildroot@buildroot.org>; Mon, 19 Feb 2024 02:15:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708337731; x=1708942531;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=je7ZVoRez69g/JWffjlDXyjxw17MENQYi8ocMrVNKaA=;
 b=DtAwKamVgZINEa6GTWJ2UCbm3BBcn5EmwLGrMyh0AwPT+U5NK6Q8q0+D78aC3dC9ia
 wjX8urUTRyec5W/OhVj8fHWBTcBAvltioUZ9XFSON2je2YTY8C8rIZyGhPbyBiMcr9yd
 Zv32KleK+2oQWWz+v+pswQ+piO+pR3tLpEwqQ+nuv7aWCIPKQ2vxYV/WPpp9avNSrjXh
 gb2R+n+zsvLmKfeegBwESjKiOW4GEvhzvh3DsbF53+rOtTdM0yviOOahd+zvP9JFfIYU
 jnemHa8rk/n1rpwFzW3mbfL+QXbysx+z5/WyGib+oo6ebYwlDub1zpvDm5P+mKZ4OJmf
 rDZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBTHlaqPEpac2qHRj3THALJk1bJQ7IiNLlyjie0OpK01cU6pNYv4v/OADWvlHbKV7I3f6tDLw1M1PQOk3t1uYGbF7yiYrVHw==
X-Gm-Message-State: AOJu0YwR/nJfhHFoXILFzVLjXuhwEasQj82pagtl9p07I/4sJilSOCVa
 BjBLfPy7oDHm1F9rBJSNaW3cIiBpsjVf8z+QL5C6/tXi6SIGPvmaZGSGe7u4bBk=
X-Google-Smtp-Source: AGHT+IFnIP26H1+q0lKUjOuvd7ZxIQ1CkCfKYhNtSj+daOKZG3d/brooYE9YK5aKoBYSNOTrWBUPsg==
X-Received: by 2002:a05:6000:1204:b0:33d:147c:8a64 with SMTP id
 e4-20020a056000120400b0033d147c8a64mr6133586wrx.59.1708337731418; 
 Mon, 19 Feb 2024 02:15:31 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 g1-20020a056000118100b00337d5cd0d8asm9866077wrx.90.2024.02.19.02.15.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Feb 2024 02:15:31 -0800 (PST)
Message-ID: <af65f8aa-c746-4933-859b-1724d8653e91@smile.fr>
Date: Mon, 19 Feb 2024 11:15:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: fr, en-US
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
 <20240217160244.1320482-14-dario.binacchi@amarulasolutions.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20240217160244.1320482-14-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1708337731; x=1708942531;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=je7ZVoRez69g/JWffjlDXyjxw17MENQYi8ocMrVNKaA=;
 b=uih7QSgIf1PNKxj1DfDQoySQQr1RLsgoPg49suXg/HgnCJgyEp/nTaPgc2292DbI49
 3Vjh5jYaAjm5qSrumfvy5eMD9ykbWk3t+fdQ2Pdm0qORQrdJMdUrMotd05pb7T0uxfTf
 UDloaMGdbWruxTg3j4QTULa/S1otEfsaIaUcO8SPowXQSPdY4j2xqdcS130oAKR/j+aU
 G7KnjhguF8kTw2dhSJisHiqTDwBxWyfCz/Z5HKzNOBSr78OHb0ZhO+l+cR4p5qLHxsGZ
 IeZzttqvje9Vgk3Pugy6onKnLoEsa9eWjRBbaCbIqS4/8NGl70eI7G9y6ORfybScrNOW
 0l1A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=uih7QSgI
Subject: Re: [Buildroot] [PATCH v4 13/20] boot/ti-k3-r5-loader: set binman
 environment
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
Cc: michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Andreas Dannenberg <dannenberg@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRGFyaW8sCgpMZSAxNy8wMi8yMDI0IMOgIDE3OjAyLCBEYXJpbyBCaW5hY2NoaSBhIMOp
Y3JpdMKgOgo+IFJlY2VudCB2ZXJzaW9uIG9mIFUtQm9vdCB1c2UgYmlubWFuIHRvIHByb3ZpZGUg
YSBtZWNoYW5pc20gZm9yIGJ1aWxkaW5nCj4gaW1hZ2VzLCBmcm9tIHNpbXBsZSBTUEwgKyBVLUJv
b3QgY29tYmluYXRpb25zLCB0byBtb3JlIGNvbXBsZXgKPiBhcnJhbmdlbWVudHMgd2l0aCBtYW55
IHBhcnRzLgo+IAo+IFRoZSBwYXRjaCBzZXQgdGhlIEJJTk1BTl9JTkRJUlMgZW52aXJvbm1lbnQg
dmFyaWFibGUgdG8gcHJvdmlkZSB0aGUKPiBkaXJlY3RvcnkgdG8gc2VhcmNoIGZvciBiaW5hcnkg
YmxvYnMgYW5kIHNlbGVjdCB0aGUgcGFja2FnZXMgcmVxdWlyZWQgYnkKPiBiaW5tYW4uCj4gCj4g
Q28tZGV2ZWxvcGVkLWJ5OiBNaWNoYWVsIFRyaW1hcmNoaSA8bWljaGFlbEBhbWFydWxhc29sdXRp
b25zLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIFRyaW1hcmNoaSA8bWljaGFlbEBhbWFy
dWxhc29sdXRpb25zLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8u
YmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4gCj4gLS0tCj4gCj4gQ2hhbmdlcyBpbiB2
NDoKPiAtIERyb3AgdGhlIEJSMl9UQVJHRVRfVElfSzNfUjVfTE9BREVSX1VTRV9CSU5NQU4gb3B0
aW9uCj4gCj4gQ2hhbmdlcyBpbiB2MjoKPiAtIENoYW5nZSBjb21taXQgbWVzc2FnZQo+IC0gQWRk
IEJSMl9UQVJHRVRfVElfSzNfUjVfTE9BREVSX1VTRV9CSU5NQU4gb3B0aW9uCj4gLSBTZWxlY3Qg
cGFja2FnZXMgcmVxdWlyZWQgYnkgYmlubWFuIGlmCj4gICBCUjJfVEFSR0VUX1RJX0szX1I1X0xP
QURFUl9VU0VfQklOTUFOIGlzIGVuYWJsZWQKPiAKPiBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBCaW5h
Y2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4gLS0tCj4gIGJvb3Qv
dGktazMtcjUtbG9hZGVyL3RpLWszLXI1LWxvYWRlci5tayB8IDEzICsrKysrKysrKysrKy0KPiAg
MSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZm
IC0tZ2l0IGEvYm9vdC90aS1rMy1yNS1sb2FkZXIvdGktazMtcjUtbG9hZGVyLm1rIGIvYm9vdC90
aS1rMy1yNS1sb2FkZXIvdGktazMtcjUtbG9hZGVyLm1rCj4gaW5kZXggMGZmY2I4MjM1ZjJlLi4y
YTEwMDI0YWVkYWEgMTAwNjQ0Cj4gLS0tIGEvYm9vdC90aS1rMy1yNS1sb2FkZXIvdGktazMtcjUt
bG9hZGVyLm1rCj4gKysrIGIvYm9vdC90aS1rMy1yNS1sb2FkZXIvdGktazMtcjUtbG9hZGVyLm1r
Cj4gQEAgLTM5LDcgKzM5LDEzIEBAIFRJX0szX1I1X0xPQURFUl9ERVBFTkRFTkNJRVMgPSBcCj4g
IAlob3N0LXBrZ2NvbmYgXAo+ICAJJChCUjJfTUFLRV9IT1NUX0RFUEVOREVOQ1kpIFwKPiAgCWhv
c3QtYXJtLWdudS10b29sY2hhaW4gXAo+IC0JaG9zdC1vcGVuc3NsCj4gKwlob3N0LW9wZW5zc2wg
XAo+ICsJaG9zdC1weXRob24tYXR0cnMgXAo+ICsJaG9zdC1weXRob24tanNvbnNjaGVtYSBcCj4g
Kwlob3N0LXB5dGhvbi1qc29uc2NoZW1hLXNwZWNpZmljYXRpb25zIFwKPiArCWhvc3QtcHl0aG9u
LXB5eWFtbCBcCj4gKwlob3N0LXB5dGhvbi1yZWZlcmVuY2luZyBcCj4gKwlob3N0LXB5dGhvbi1y
cGRzLXB5CgpNb3N0IG9mIHRoZXNlcyBuZXcgZGVwZW5kZW5jaWVzIGFyZSBub3QgdGktazMtcjUt
bG9hZGVyIGRlcGVuZGVuY2llcyBidXQKaG9zdC1weXRob24tanNvbnNjaGVtYSBydW50aW1lIGRl
cGVuZGVuY2llcy4KCk5vdGU6IGhvc3QtcHl0aG9uLWpzb25zY2hlbWEgZGVwZW5kcyBvbgpCUjJf
UEFDS0FHRV9IT1NUX1JVU1RDX1RBUkdFVF9BUkNIX1NVUFBPUlRTIGR1ZSB0byBpdHMgcnVudGlt
ZSBkZXBlbmRlbmN5IG9uCmhvc3QtcHl0aG9uLXJwZHMtcHkuCgo+ICAKPiAgVElfSzNfUjVfTE9B
REVSX01BS0UgPSAkKEJSMl9NQUtFKQo+ICBUSV9LM19SNV9MT0FERVJfTUFLRV9FTlYgPSAkKFRB
UkdFVF9NQUtFX0VOVikKPiBAQCAtNDksNiArNTUsMTAgQEAgVElfSzNfUjVfTE9BREVSX0tDT05G
SUdfREVQRU5ERU5DSUVTID0gXAo+ICAJJChCUjJfQklTT05fSE9TVF9ERVBFTkRFTkNZKSBcCj4g
IAkkKEJSMl9GTEVYX0hPU1RfREVQRU5ERU5DWSkKPiAgCj4gK2lmZXEgKCQoQlIyX1RBUkdFVF9V
Qk9PVF9ORUVEU19QWUxJQkZEVCkseSkKCkl0J3MgYSB1LWJvb3QgcGFja2FnZSBjb25maWcgb3B0
aW9uLiBqdXN0IGFkZCBob3N0LXB5dGhvbi1weWxpYmZkdCB0aGUgZGVwZW5kZW5jeS4KCj4gK1RJ
X0szX1I1X0xPQURFUl9ERVBFTkRFTkNJRVMgKz0gaG9zdC1weXRob24tcHlsaWJmZHQKPiArZW5k
aWYKPiArCj4gIGlmZXEgKCQoQlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVJfVVNFX0RFRkNPTkZJ
RykseSkKPiAgVElfSzNfUjVfTE9BREVSX0tDT05GSUdfREVGQ09ORklHID0gJChjYWxsIHFzdHJp
cCwkKEJSMl9UQVJHRVRfVElfSzNfUjVfTE9BREVSX0JPQVJEX0RFRkNPTkZJRykpX2RlZmNvbmZp
Zwo+ICBlbHNlIGlmZXEgKCQoQlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVJfVVNFX0NVU1RPTV9D
T05GSUcpLHkpCj4gQEAgLTU4LDYgKzY4LDcgQEAgVElfSzNfUjVfTE9BREVSX01BS0VfT1BUUyA9
IFwKPiAgCUNST1NTX0NPTVBJTEU9JChIT1NUX0RJUikvYmluL2FybS1ub25lLWVhYmktIFwKPiAg
CUFSQ0g9YXJtIFwKPiAgCUhPU1RDQz0iJChIT1NUQ0MpICQoc3Vic3QgLUkvLC1pc3lzdGVtIC8s
JChzdWJzdCAtSSAvLC1pc3lzdGVtIC8sJChIT1NUX0NGTEFHUykpKSIgXAo+ICsJQklOTUFOX0lO
RElSUz0kKEJJTkFSSUVTX0RJUikgXAoKSSBzdWdnZXN0ZWQgdG8gYWRkIEJSMl9UQVJHRVRfVElf
SzNfUjVfTE9BREVSX1VTRV9CSU5NQU4gYnV0IGluZGVlZCB3ZSBzaG91bGQKdXNlIGJpbm1hbiB1
bmNvbmRpdGlvbmFsbHkgZm9yIHRpLWszLXI1LWxvYWRlciBwYWNrYWdlLgoKaHR0cDovL3BhdGNo
d29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjQwMjEzMTcyODE3LjI4
NzI4NDktMTEtcm9tYWluLm5hb3VyQHNtaWxlLmZyLwoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+
ICAJSE9TVExERkxBR1M9IiQoSE9TVF9MREZMQUdTKSIKPiAgCj4gIGRlZmluZSBUSV9LM19SNV9M
T0FERVJfQlVJTERfQ01EUwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
