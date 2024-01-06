Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E0B8C46CD2
	for <buildroot@archiver.kernel.org>; Sat,  6 Jan 2024 21:30:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EAED283D81;
	Sat,  6 Jan 2024 21:30:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EAED283D81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZSxrffHJ2KER; Sat,  6 Jan 2024 21:30:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BB4983D84;
	Sat,  6 Jan 2024 21:30:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BB4983D84
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 209741BF295
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 21:29:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED1B160BC6
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 21:29:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED1B160BC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9-6lpL_KrzoG for <buildroot@lists.busybox.net>;
 Sat,  6 Jan 2024 21:29:57 +0000 (UTC)
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C529060B3B
 for <buildroot@buildroot.org>; Sat,  6 Jan 2024 21:29:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C529060B3B
Received: by mail-qt1-x82c.google.com with SMTP id
 d75a77b69052e-4298c18d796so868891cf.3
 for <buildroot@buildroot.org>; Sat, 06 Jan 2024 13:29:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704576595; x=1705181395;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=457aYE6M4b/6Uun9en75PUa4jpvv7W2A3YThGCt+VGE=;
 b=m6KUMVxQo+nfPZVKT8+udJEefRmyMqNDoRR6czF3R6NwSh/7/zJAiWwuxCfmI3rjOv
 TSG73f3QBKdEF74bYsqoAbz7bzBKJbB6gl2Z8p4J0iF0Td363c50i0ForPLhIwan7L4J
 7z+yElKeWkaUzdS8EYjZSl69ktdUNRdmEqWVSooRoC98cS4t0dcBlSPJjyF8elZRSaor
 2BcwfCVOcRPydTeOE957SAqzMgzFoWF2t/HXn9mvXEeLH8smfskJZCKTRRZkvHYQKXHA
 hb6GDhgDasTBWJsT6DW5MxTWAsTbEbd4pp4QTykonuva8cvxNuQ+Yzk7FbY4Dgl/j4av
 IJWQ==
X-Gm-Message-State: AOJu0Yz16VG1jkLxWPLaLt+Wj363U46hxawt/4ta9wdsYJkp/rvPQwY1
 Rx+futff3wg0fjFOp4LlyYPkeDZaV/m+OI0NnvU=
X-Google-Smtp-Source: AGHT+IHTu0wG6AhkqoxEed3b1vqvOzb3Wqi5/ZMn9+udLr4DaDU80u7ySyntlRqAYXGzIdM0VGecQ+QCwDX7SpegUlw=
X-Received: by 2002:ac8:5fd1:0:b0:429:8e3a:d67 with SMTP id
 k17-20020ac85fd1000000b004298e3a0d67mr95692qta.117.1704576595390; Sat, 06 Jan
 2024 13:29:55 -0800 (PST)
MIME-Version: 1.0
References: <20240106113627.627714-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20240106113627.627714-1-fontaine.fabrice@gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 6 Jan 2024 14:29:43 -0700
Message-ID: <CADvTj4pKSCFQeUKE+MoCfFzB5TrCtkQXPdA7Ta4RYQziG4ZQSQ@mail.gmail.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704576595; x=1705181395; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=457aYE6M4b/6Uun9en75PUa4jpvv7W2A3YThGCt+VGE=;
 b=aLVmvNeETL49XxRdDkEIMZ28irHg7Ww09a6zgX9RK/mdPr9g/J8ti3L4ZZA3eEcBmv
 UURyAB5qrbcW+ByMZzo9n88B1q/4Lrqme+bjOA20j5MCuNfXN7GwTn3I4b3VDhgGKPqT
 FpEPvhbqzZkGmUlDs6bPh35DUXnd8P+fxlKHRj1xzey2zKlk+mphOtFn7SL/1x0B2oJ7
 2MbVA3BYjSBuAl7UGbjTnEFCfVNCuYcdXqZbKVVcATUlAqEAQzDVl+Np5NtOWon/D8YQ
 E+4QhhNwNlaLSNls/SsYPKB4m2tAl07eJ934M93Vq/xR0HS98CTr80wJsYj+sqSHJffu
 NPpQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=aLVmvNeE
Subject: Re: [Buildroot] [PATCH 1/1] package/python-grpcio: needs C++
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU2F0LCBKYW4gNiwgMjAyNCBhdCA0OjM24oCvQU0gRmFicmljZSBGb250YWluZQo8Zm9udGFp
bmUuZmFicmljZUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gRml4IHRoZSBmb2xsb3dpbmcgYnVpbGQg
ZmFpbHVyZSByYWlzZWQgc2luY2UgdGhlIGFkZGl0aW9uIG9mIHRoZSBwYWNrYWdlCj4gaW4gY29t
bWl0IGVhNDViOTVjMGU1NDg2NjEzNGM2M2U4OGU2MDQ4OWEwMTJiM2QxMzQ6Cj4KPiAvaG9tZS9h
dXRvYnVpbGQvYXV0b2J1aWxkL2luc3RhbmNlLTEyL291dHB1dC0xL2J1aWxkL3B5dGhvbi1ncnBj
aW8tMS42MC4wL3NldHVwLnB5OjQwOiBEZXByZWNhdGlvbldhcm5pbmc6IHBrZ19yZXNvdXJjZXMg
aXMgZGVwcmVjYXRlZCBhcyBhbiBBUEkuIFNlZSBodHRwczovL3NldHVwdG9vbHMucHlwYS5pby9l
bi9sYXRlc3QvcGtnX3Jlc291cmNlcy5odG1sCj4gICBpbXBvcnQgcGtnX3Jlc291cmNlcwo+IFRy
YWNlYmFjayAobW9zdCByZWNlbnQgY2FsbCBsYXN0KToKPiAgIEZpbGUgIi9ob21lL2F1dG9idWls
ZC9hdXRvYnVpbGQvaW5zdGFuY2UtMTIvb3V0cHV0LTEvYnVpbGQvcHl0aG9uLWdycGNpby0xLjYw
LjAvc2V0dXAucHkiLCBsaW5lIDI4OSwgaW4gPG1vZHVsZT4KPiAgICAgaWYgY2hlY2tfbGlua2Vy
X25lZWRfbGliYXRvbWljKCk6Cj4gICAgICAgIF5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5e
Cj4gICBGaWxlICIvaG9tZS9hdXRvYnVpbGQvYXV0b2J1aWxkL2luc3RhbmNlLTEyL291dHB1dC0x
L2J1aWxkL3B5dGhvbi1ncnBjaW8tMS42MC4wL3NldHVwLnB5IiwgbGluZSAyMjMsIGluIGNoZWNr
X2xpbmtlcl9uZWVkX2xpYmF0b21pYwo+ICAgICBjcHBfdGVzdCA9IHN1YnByb2Nlc3MuUG9wZW4o
Cj4gICAgICAgICAgICAgICAgXl5eXl5eXl5eXl5eXl5eXl4KPiAgIEZpbGUgIi9ob21lL2F1dG9i
dWlsZC9hdXRvYnVpbGQvaW5zdGFuY2UtMTIvb3V0cHV0LTEvaG9zdC9zcGFyYzY0LWJ1aWxkcm9v
dC1saW51eC1nbnUvc3lzcm9vdC91c3IvbGliL3B5dGhvbjMuMTEvc3VicHJvY2Vzcy5weSIsIGxp
bmUgMTAyNiwgaW4gX19pbml0X18KPiAgICAgc2VsZi5fZXhlY3V0ZV9jaGlsZChhcmdzLCBleGVj
dXRhYmxlLCBwcmVleGVjX2ZuLCBjbG9zZV9mZHMsCj4gICBGaWxlICIvaG9tZS9hdXRvYnVpbGQv
YXV0b2J1aWxkL2luc3RhbmNlLTEyL291dHB1dC0xL2hvc3Qvc3BhcmM2NC1idWlsZHJvb3QtbGlu
dXgtZ251L3N5c3Jvb3QvdXNyL2xpYi9weXRob24zLjExL3N1YnByb2Nlc3MucHkiLCBsaW5lIDE5
NTAsIGluIF9leGVjdXRlX2NoaWxkCj4gICAgIHJhaXNlIGNoaWxkX2V4Y2VwdGlvbl90eXBlKGVy
cm5vX251bSwgZXJyX21zZywgZXJyX2ZpbGVuYW1lKQo+IEZpbGVOb3RGb3VuZEVycm9yOiBbRXJy
bm8gMl0gTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeTogJ25vJwo+Cj4gRml4ZXM6Cj4gIC0gaHR0
cDovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvNThhYzI1YjRlNDI2NzEyMjY5YzVm
YzE0NDEyMWM5NTViNzE0Yzc2MAo+Cj4gU2lnbmVkLW9mZi1ieTogRmFicmljZSBGb250YWluZSA8
Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+ClJldmlld2VkLWJ5OiBKYW1lcyBIaWxsaWFyZCA8
amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KPiAtLS0KPiAgcGFja2FnZS9weXRob24tZ3JwYy1y
ZXF1ZXN0cy9Db25maWcuaW4gICAgIHwgNCArKysrCj4gIHBhY2thZ2UvcHl0aG9uLWdycGNpby1y
ZWZsZWN0aW9uL0NvbmZpZy5pbiB8IDQgKysrKwo+ICBwYWNrYWdlL3B5dGhvbi1ncnBjaW8vQ29u
ZmlnLmluICAgICAgICAgICAgfCA0ICsrKysKPiAgMyBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRp
b25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tZ3JwYy1yZXF1ZXN0cy9Db25m
aWcuaW4gYi9wYWNrYWdlL3B5dGhvbi1ncnBjLXJlcXVlc3RzL0NvbmZpZy5pbgo+IGluZGV4IDNj
MjY2ZTU5NzYuLjNhMjc0MGYwZjcgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9weXRob24tZ3JwYy1y
ZXF1ZXN0cy9Db25maWcuaW4KPiArKysgYi9wYWNrYWdlL3B5dGhvbi1ncnBjLXJlcXVlc3RzL0Nv
bmZpZy5pbgo+IEBAIC0xLDYgKzEsNyBAQAo+ICBjb25maWcgQlIyX1BBQ0tBR0VfUFlUSE9OX0dS
UENfUkVRVUVTVFMKPiAgICAgICAgIGJvb2wgInB5dGhvbi1ncnBjLXJlcXVlc3RzIgo+ICAgICAg
ICAgZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9IT1NUX1JVU1RDX1RBUkdFVF9BUkNIX1NVUFBPUlRT
ICMgcHl0aG9uLWNyeXB0b2dyYXBoeQo+ICsgICAgICAgZGVwZW5kcyBvbiBCUjJfSU5TVEFMTF9M
SUJTVERDUFAgIyBweXRob24tZ3JwY2lvCj4gICAgICAgICBzZWxlY3QgQlIyX1BBQ0tBR0VfUFlU
SE9OX0NSWVBUT0dSQVBIWSAjIHJ1bnRpbWUKPiAgICAgICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9Q
WVRIT05fR09PR0xFX0FQSV9DT1JFICMgcnVudGltZQo+ICAgICAgICAgc2VsZWN0IEJSMl9QQUNL
QUdFX1BZVEhPTl9HUlBDSU8gIyBydW50aW1lCj4gQEAgLTksMyArMTAsNiBAQCBjb25maWcgQlIy
X1BBQ0tBR0VfUFlUSE9OX0dSUENfUkVRVUVTVFMKPiAgICAgICAgICAgZ3JwYyBmb3IgSHVtYW5z
LiBncnBjIHJlZmxlY3Rpb24gc3VwcG9ydCBjbGllbnQuCj4KPiAgICAgICAgICAgaHR0cHM6Ly9n
aXRodWIuY29tL3dlc2t5OTMvZ3JwY19yZXF1ZXN0cwo+ICsKPiArY29tbWVudCAicHl0aG9uLWdy
cGNpby1yZXF1ZXN0cyBuZWVkcyBhIHRvb2xjaGFpbiB3LyBDKysiCj4gKyAgICAgICBkZXBlbmRz
IG9uICFCUjJfSU5TVEFMTF9MSUJTVERDUFAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24t
Z3JwY2lvLXJlZmxlY3Rpb24vQ29uZmlnLmluIGIvcGFja2FnZS9weXRob24tZ3JwY2lvLXJlZmxl
Y3Rpb24vQ29uZmlnLmluCj4gaW5kZXggZDJlZTAzOWM1Zi4uYWZlODk4ODE2NSAxMDA2NDQKPiAt
LS0gYS9wYWNrYWdlL3B5dGhvbi1ncnBjaW8tcmVmbGVjdGlvbi9Db25maWcuaW4KPiArKysgYi9w
YWNrYWdlL3B5dGhvbi1ncnBjaW8tcmVmbGVjdGlvbi9Db25maWcuaW4KPiBAQCAtMSw4ICsxLDEy
IEBACj4gIGNvbmZpZyBCUjJfUEFDS0FHRV9QWVRIT05fR1JQQ0lPX1JFRkxFQ1RJT04KPiAgICAg
ICAgIGJvb2wgInB5dGhvbi1ncnBjaW8tcmVmbGVjdGlvbiIKPiArICAgICAgIGRlcGVuZHMgb24g
QlIyX0lOU1RBTExfTElCU1REQ1BQICMgcHl0aG9uLWdycGNpbwo+ICAgICAgICAgc2VsZWN0IEJS
Ml9QQUNLQUdFX1BZVEhPTl9HUlBDSU8gIyBydW50aW1lCj4gICAgICAgICBzZWxlY3QgQlIyX1BB
Q0tBR0VfUFlUSE9OX1BST1RPQlVGICMgcnVudGltZQo+ICAgICAgICAgaGVscAo+ICAgICAgICAg
ICBTdGFuZGFyZCBQcm90b2J1ZiBSZWZsZWN0aW9uIFNlcnZpY2UgZm9yIGdSUEMuCj4KPiAgICAg
ICAgICAgaHR0cHM6Ly9ncnBjLmlvCj4gKwo+ICtjb21tZW50ICJweXRob24tZ3JwY2lvLXJlZmxl
Y3Rpb24gbmVlZHMgYSB0b29sY2hhaW4gdy8gQysrIgo+ICsgICAgICAgZGVwZW5kcyBvbiAhQlIy
X0lOU1RBTExfTElCU1REQ1BQCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLWdycGNpby9D
b25maWcuaW4gYi9wYWNrYWdlL3B5dGhvbi1ncnBjaW8vQ29uZmlnLmluCj4gaW5kZXggZTYzYWMy
YWUzNC4uNTI0MmViNDYxZSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3B5dGhvbi1ncnBjaW8vQ29u
ZmlnLmluCj4gKysrIGIvcGFja2FnZS9weXRob24tZ3JwY2lvL0NvbmZpZy5pbgo+IEBAIC0xLDYg
KzEsMTAgQEAKPiAgY29uZmlnIEJSMl9QQUNLQUdFX1BZVEhPTl9HUlBDSU8KPiAgICAgICAgIGJv
b2wgInB5dGhvbi1ncnBjaW8iCj4gKyAgICAgICBkZXBlbmRzIG9uIEJSMl9JTlNUQUxMX0xJQlNU
RENQUAo+ICAgICAgICAgaGVscAo+ICAgICAgICAgICBIVFRQLzItYmFzZWQgUlBDIGZyYW1ld29y
ay4KPgo+ICAgICAgICAgICBodHRwczovL2dycGMuaW8KPiArCj4gK2NvbW1lbnQgInB5dGhvbi1n
cnBjaW8gbmVlZHMgYSB0b29sY2hhaW4gdy8gQysrIgo+ICsgICAgICAgZGVwZW5kcyBvbiAhQlIy
X0lOU1RBTExfTElCU1REQ1BQCj4gLS0KPiAyLjQzLjAKPgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
