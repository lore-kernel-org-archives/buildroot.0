Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14F5FC48297
	for <buildroot@archiver.kernel.org>; Fri,  9 Feb 2024 13:58:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 755CC6073C;
	Fri,  9 Feb 2024 13:58:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6jfysWEsb_Tt; Fri,  9 Feb 2024 13:58:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5695260743
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5695260743;
	Fri,  9 Feb 2024 13:58:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 332D51BF98E
 for <buildroot@lists.busybox.net>; Fri,  9 Feb 2024 13:58:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F6B341598
 for <buildroot@lists.busybox.net>; Fri,  9 Feb 2024 13:58:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gcli-ZrmVk9R for <buildroot@lists.busybox.net>;
 Fri,  9 Feb 2024 13:58:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b34; helo=mail-yb1-xb34.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 72C98402BC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72C98402BC
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 72C98402BC
 for <buildroot@buildroot.org>; Fri,  9 Feb 2024 13:58:29 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id
 3f1490d57ef6-dc6e08fde11so998394276.1
 for <buildroot@buildroot.org>; Fri, 09 Feb 2024 05:58:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707487108; x=1708091908;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=00k7FkZrGlRjnzN3aceQrImDRavf4KkJ1K198y242bw=;
 b=QILsubMSUdx9U+6osIGCi+d77QwhXu4SABx+5Qdzp7+m/H3W1cdl2mkxEJ+KHn7hnH
 6oYMXFQp1kcaEx7actiEy96/cOuVFaw/IsHtZ3nDVEeRsE/iXFchBpvGjMqpgHHMq4XS
 wfAz9i06fzVQ3XyLJq+fCsa72AOnzBuJ464o7JQGNwnJnvwD3zBPb4mHzW61J6xnqVP0
 qziEiMeyzj02tvfzwAO1Cx8aOKDCNG8q253TJ8xJRkIXNQdQ++1hDg+OFv/6s+IudmC8
 N/SzsC82GO2hamui8HHvl7B2Emz1j2rQ8eM+KNvC/qPJgsbDunltazef2Wf+t6hzr+Dd
 XZLQ==
X-Gm-Message-State: AOJu0YwsVqSlWQG2Dtq8vV2VLsqN0lA2zi55f1slTfLuS9HUiKmz9g5s
 XWnCXzB7ErEzUryit9Vwegl1gVYVi8v7TWX02s5NEepBVipydUFpbVdJrNvOC0BUCHb8jW9+EOF
 s6RnmO1lLqzQLtAHAuMC5u+Nf8L5o+T2QtS395w==
X-Google-Smtp-Source: AGHT+IG0/Ct4XIojOvo8YzroLqnJmQH4QX9T16mp44vjM0mJmfROnug2ALyAvP5qPnxeFZkFPLuH6jJ38tD8D8QVIY0=
X-Received: by 2002:a25:aca4:0:b0:dc6:4b5a:410a with SMTP id
 x36-20020a25aca4000000b00dc64b5a410amr1481660ybi.12.1707487108153; Fri, 09
 Feb 2024 05:58:28 -0800 (PST)
MIME-Version: 1.0
References: <20231218081958.506691-1-dario.binacchi@amarulasolutions.com>
 <20231218081958.506691-3-dario.binacchi@amarulasolutions.com>
 <bfe1b04f-2f7c-4e3f-b6ce-d96d84905160@smile.fr>
 <3d674bd1-a53f-4f82-93c1-58cbe14ab1db@smile.fr>
In-Reply-To: <3d674bd1-a53f-4f82-93c1-58cbe14ab1db@smile.fr>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Fri, 9 Feb 2024 14:58:17 +0100
Message-ID: <CABGWkvoQEN81R6Z0S-c9CX1S+BAt_LPjk=pS6-ZsV3_sXhd1FQ@mail.gmail.com>
To: Romain Naour <romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1707487108; x=1708091908;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=00k7FkZrGlRjnzN3aceQrImDRavf4KkJ1K198y242bw=;
 b=aTCbsGgHEaebgBDyN+SappkbqgH8584ESGoGwJxJAriV+CqGzg69jEyskjw8PTmFxy
 S5+vEYI7K8HKMI/mnbtKz+h8Gyl5tUdwe8oSZNdaH2zD+ZNzVblft0oEFDwVD3ubGZgu
 IIaN5WDuGK0mB0fiooG90/iYTIO5r8NZKH5cA=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=aTCbsGgH
Subject: Re: [Buildroot] [PATCH v3 02/11] boot/ti-k3-image-gen: manage HS
 hardware
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
Cc: Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 bryce@redpinelabs.com, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUm9tYWluLCBBbGwKCk9uIFdlZCwgRmViIDcsIDIwMjQgYXQgMTE6MDTigK9BTSBSb21haW4g
TmFvdXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4gd3JvdGU6Cj4KPiBIZWxsbyBEYXJpbywgQWxs
LAo+Cj4gTGUgMDYvMDIvMjAyNCDDoCAxODo1MCwgUm9tYWluIE5hb3VyIGEgw6ljcml0IDoKPiA+
IEhlbGxvIERhcmlvLAo+ID4KPiA+IExlIDE4LzEyLzIwMjMgw6AgMDk6MTksIERhcmlvIEJpbmFj
Y2hpIGEgw6ljcml0IDoKPiA+PiBUaGUgcGF0Y2ggc2V0cyB0aGUgY29uZmlndXJhdGlvbnMgcmVx
dWlyZWQgYnkgVEkgSFMgc3lzdGVtcy4gU29tZSBvZiB0aGVzZQo+ID4+IGNvbmZpZ3VyYXRpb25z
IChpLiBlLiBIUyBTWVNGVyBpbWFnZSBzaWduaW5nIGtleSwgSFMgU29mdHdhcmUgUmV2aXNpb24p
Cj4gPj4gYXJlIHByb3ZpZGVkIGJ5IHRoZSB0aS1rMy1jb3JlLXNlY2RldiBwYWNrYWdlIGluIHRo
ZSBiaW5hcmllcyBkaXJlY3RvcnkuCj4gPgo+ID4gQUZBSUsgdGhlIHRpLWszLWltYWdlLWdlbiB0
b29sIGlzIGRlcHJlY2F0ZWQgYW5kIG11c3QgYmUgcmVwbGFjZWQgYnkgYmlubWFuIHRvb2wKPiA+
IHByb3ZpZGVkIGJ5IHVwc3RyZWFtIHUtYm9vdC4KPiA+Cj4gPiBJcyBhbGwgazMgU29DIG1pZ3Jh
dGVkIHRvIGJpbm1hbiBpbiB0aGUgbGF0ZXN0IHUtYm9vdCByZWxlYXNlIDIwMjQuMDE/Cj4gPgo+
ID4gU2VlIHRoZSBGT1NERU0gdGFsazoKPiA+Cj4gPiBodHRwczovL2Zvc2RlbS5vcmcvMjAyNC9l
dmVudHMvYXR0YWNobWVudHMvZm9zZGVtLTIwMjQtMzA2Ny1zdGFuZGFyZGl6aW5nLXRoZS1nZW5l
cmF0aW9uLWFuZC1zaWduaW5nLW9mLWJvb3QtaW1hZ2VzL3NsaWRlcy8yMTkxOS9GT1NERU0yNF9T
cGVha2VyX1NsaWRlc195N0ZzSUtNLnBkZgo+ID4KPiA+IEJlc3QgcmVnYXJkcywKPiA+IFJvbWFp
bgo+ID4KPiA+Cj4gPj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8u
YmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4gPj4gLS0tCj4gPj4gIGJvb3QvdGktazMt
aW1hZ2UtZ2VuL0NvbmZpZy5pbiAgICAgICAgICB8ICAxICsKPiA+PiAgYm9vdC90aS1rMy1pbWFn
ZS1nZW4vdGktazMtaW1hZ2UtZ2VuLm1rIHwgMTYgKysrKysrKysrKysrKystLQo+ID4+ICAyIGZp
bGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPj4KPiA+PiBk
aWZmIC0tZ2l0IGEvYm9vdC90aS1rMy1pbWFnZS1nZW4vQ29uZmlnLmluIGIvYm9vdC90aS1rMy1p
bWFnZS1nZW4vQ29uZmlnLmluCj4gPj4gaW5kZXggZDc2Y2VmODJlOTExLi4zOGQxNTk4ZDlmYzAg
MTAwNjQ0Cj4gPj4gLS0tIGEvYm9vdC90aS1rMy1pbWFnZS1nZW4vQ29uZmlnLmluCj4gPj4gKysr
IGIvYm9vdC90aS1rMy1pbWFnZS1nZW4vQ29uZmlnLmluCj4gPj4gQEAgLTIsNiArMiw3IEBAIGNv
bmZpZyBCUjJfVEFSR0VUX1RJX0szX0lNQUdFX0dFTgo+ID4+ICAgICAgYm9vbCAidGktazMtaW1h
Z2UtZ2VuIgo+ID4+ICAgICAgZGVwZW5kcyBvbiBCUjJfVEFSR0VUX1RJX0szX1I1X0xPQURFUgo+
ID4+ICAgICAgc2VsZWN0IEJSMl9UQVJHRVRfVElfSzNfQk9PVF9GSVJNV0FSRQo+ID4+ICsgICAg
c2VsZWN0IEJSMl9UQVJHRVRfVElfSzNfQ09SRV9TRUNERVYgaWYgQlIyX1RBUkdFVF9USV9LM19J
TUFHRV9HRU5fU0VDVFlQRV9IU19GUyB8fCBCUjJfVEFSR0VUX1RJX0szX0lNQUdFX0dFTl9TRUNU
WVBFX0hTCj4KPiBEb2VzIGl0IG1lYW5zIHRoYXQgY3VycmVudGx5IFRJIEhTIGNvbmZpZ3VyYXRp
b24gYXJlIG1pc3NpbmcgdGhlCj4gdGktazMtY29yZS1zZWNkZXYgdG9vbCB0byBidWlsZCBwcm9w
ZXJseT8KClllcywgeW91IGFyZSByaWdodC4gQ3VycmVudGx5LCB0aGUgY29tcGlsYXRpb24gd2l0
aApCUjJfVEFSR0VUX1RJX0szX0lNQUdFX0dFTl9TRUNUWVBFX0hTX0ZTIGVuYWJsZWQgaXMgYnJv
a2VuOgoKLi90b29scy9rM19nZW5feDUwOV9jZXJ0LnNoIC1jIDE2IC1iIHNwbC91LWJvb3Qtc3Bs
LmJpbiBcCi1vIHRpYm9vdDMuYmluIC1sIDB4NDNjMDAwMDAgLXIgMSAtayAiIgogU1dSViA9IDEK
Pj4+IHRpLWszLXI1LWxvYWRlciAyMDIyLjEwIEluc3RhbGxpbmcgdG8gdGFyZ2V0Cj4+PiB0aS1r
My1yNS1sb2FkZXIgMjAyMi4xMCBJbnN0YWxsaW5nIHRvIGltYWdlcyBkaXJlY3RvcnkKY3AgL2hv
bWUvZGFyaW8vcHJvamVjdHMvYnVpbGRyb290L291dHB1dC9idWlsZC90aS1rMy1yNS1sb2FkZXIt
MjAyMi4xMC9zcGwvdS1ib290LXNwbC5iaW4KL2hvbWUvZGFyaW8vcHJvamVjdHMvYnVpbGRyb290
L291dHB1dC9pbWFnZXMvcjUtdS1ib290LXNwbC5iaW4KazMtaW1hZ2UtZ2VuLTA4LjA2LjAwLjAw
Ny50YXIuZ3o6IE9LIChzaGEyNTY6CmY4OWVhNGIxZjVjOTkyNDU1YjFhNjgyZmRlNDgzNTkyMjFi
NTNmMzI5NDEzNWRmNGJmMjBmZWVhNmFlYTkwZTQpCj4+PiB0aS1rMy1pbWFnZS1nZW4gMDguMDYu
MDAuMDA3IEV4dHJhY3RpbmcKZ3ppcCAtZCAtYyAvaG9tZS9kYXJpby9wcm9qZWN0cy9idWlsZHJv
b3QvZGwvdGktazMtaW1hZ2UtZ2VuL2szLWltYWdlLWdlbi0wOC4wNi4wMC4wMDcudGFyLmd6Cnwg
dGFyIC0tc3RyaXAtY29tcG9uZW50cz0xIC1DCi9ob21lL2RhcmlvL3Byb2plY3RzL2J1aWxkcm9v
dC9vdXRwdXQvYnVpbGQvdGktazMtaW1hZ2UtZ2VuLTA4LjA2LjAwLjAwNwogIC14ZiAtCj4+PiB0
aS1rMy1pbWFnZS1nZW4gMDguMDYuMDAuMDA3IFBhdGNoaW5nCj4+PiB0aS1rMy1pbWFnZS1nZW4g
MDguMDYuMDAuMDA3IENvbmZpZ3VyaW5nCmNwIC9ob21lL2RhcmlvL3Byb2plY3RzL2J1aWxkcm9v
dC9vdXRwdXQvaW1hZ2VzL3RpLXN5c2Z3L3RpLWZzLWZpcm13YXJlLWFtNjJ4LWhzLWZzLmJpbgov
aG9tZS9kYXJpby9wcm9qZWN0cy9idWlsZHJvb3Qvb3V0cHV0L2J1aWxkL3RpLWszLWltYWdlLWdl
bi0wOC4wNi4wMC4wMDcKY3A6IGNhbm5vdCBzdGF0CicvaG9tZS9kYXJpby9wcm9qZWN0cy9idWls
ZHJvb3Qvb3V0cHV0L2ltYWdlcy90aS1zeXNmdy90aS1mcy1maXJtd2FyZS1hbTYyeC1ocy1mcy5i
aW4nOgpObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5Cm1ha2VbMV06ICoqKiBbcGFja2FnZS9wa2ct
Z2VuZXJpYy5tazoyNzM6Ci9ob21lL2RhcmlvL3Byb2plY3RzL2J1aWxkcm9vdC9vdXRwdXQvYnVp
bGQvdGktazMtaW1hZ2UtZ2VuLTA4LjA2LjAwLjAwNy8uc3RhbXBfY29uZmlndXJlZF0KRXJyb3Ig
MQptYWtlOiAqKiogW01ha2VmaWxlOjgyOiBfYWxsXSBFcnJvciAyCgpXaGF0IGRvIHlvdSB0aGlu
ayBpZiwgZm9yIHRoaXMgc2VyaWVzLCBJIGZpeCB0aGUgY29tcGlsYXRpb24gaXNzdWUgZm9yCkhT
IGNvbmZpZ3VyYXRpb25zIGJ5IGNvbnRpbnVpbmcgdG8gdXNlIHRoZSBgdGktazMtaW1hZ2UtZ2Vu
YCBwYWNrYWdlLAphbmQgdGhlbgpvbmNlIHRoZSBzZXJpZXMgaXMgbWVyZ2VkLCBJIHRyeSBhbmQg
dGVzdCB0aGUgdGhlIGJ1bXAgb2YgdS1ib290IHRvCnZlcnNpb24gMjAyNC4wMSB0byBzZWUgaWYg
aXQgaXMgaW5kZWVkIHBvc3NpYmxlIHRvIGRvIHdpdGhvdXQKYHRpLWszLWltYWdlLWdlbmA/Ck1l
YW53aGlsZSwgbGV0J3MgYXQgbGVhc3QgZml4IHRoaXMgcHJvYmxlbSBpbW1lZGlhdGVseS4KClRo
YW5rcyBhbmQgcmVnYXJkcywKRGFyaW8KCj4KPiBJdCBzZWVtcyB0aGlzIHBhdGNoIHNob3VsZCBm
aXhlcyB0aGVtLgo+Cj4gQmVzdCByZWdhcmRzLAo+IFJvbWFpbgo+Cj4gPj4gICAgICAjIFdlIG5l
ZWQgRklUIHN1cHBvcnQgaW4gdWJvb3QtdG9vbHMsIHdoaWNoIGlzIHdoeSB3ZSBzZWxlY3QgYQo+
ID4+ICAgICAgIyBob3N0IHBhY2thZ2UKPiA+PiAgICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9IT1NU
X1VCT09UX1RPT0xTCj4gPj4gZGlmZiAtLWdpdCBhL2Jvb3QvdGktazMtaW1hZ2UtZ2VuL3RpLWsz
LWltYWdlLWdlbi5tayBiL2Jvb3QvdGktazMtaW1hZ2UtZ2VuL3RpLWszLWltYWdlLWdlbi5tawo+
ID4+IGluZGV4IDY0YmU5YTE4ZjJjNC4uOTFhZWQ2M2JhYjg0IDEwMDY0NAo+ID4+IC0tLSBhL2Jv
b3QvdGktazMtaW1hZ2UtZ2VuL3RpLWszLWltYWdlLWdlbi5tawo+ID4+ICsrKyBiL2Jvb3QvdGkt
azMtaW1hZ2UtZ2VuL3RpLWszLWltYWdlLWdlbi5tawo+ID4+IEBAIC0yOSwxMCArMjksMjEgQEAg
VElfSzNfSU1BR0VfR0VOX0ZXX1RZUEUgPSAkKGNhbGwgcXN0cmlwLCQoQlIyX1RBUkdFVF9USV9L
M19JTUFHRV9HRU5fRldfVFlQRSkpCj4gPj4gIFRJX0szX0lNQUdFX0dFTl9TT0MgPSAkKGNhbGwg
cXN0cmlwLCQoQlIyX1RBUkdFVF9USV9LM19JTUFHRV9HRU5fU09DKSkKPiA+PiAgVElfSzNfSU1B
R0VfR0VOX1NFQ1RZUEUgPSAkKGNhbGwgcXN0cmlwLCQoQlIyX1RBUkdFVF9USV9LM19JTUFHRV9H
RU5fU0VDVFlQRSkpCj4gPj4KPiA+PiAtVElfSzNfSU1BR0VfR0VOX1NZU0ZXID0gJChUSV9LM19J
TUFHRV9HRU5fRldfVFlQRSktZmlybXdhcmUtJChUSV9LM19JTUFHRV9HRU5fU09DKS0kKFRJX0sz
X0lNQUdFX0dFTl9TRUNUWVBFKS5iaW4KPiA+PiAraWZlcSAoJChCUjJfVEFSR0VUX1RJX0szX0lN
QUdFX0dFTl9TRUNUWVBFX0dQKSx5KQo+ID4+ICtUSV9LM19JTUFHRV9HRU5fU1lTRlcgPSBcCj4g
Pj4gKyAgICAkKFRJX0szX0lNQUdFX0dFTl9GV19UWVBFKS1maXJtd2FyZS0kKFRJX0szX0lNQUdF
X0dFTl9TT0MpLSQoVElfSzNfSU1BR0VfR0VOX1NFQ1RZUEUpLmJpbgo+ID4+ICtlbHNlCj4gPj4g
K1RJX0szX0lNQUdFX0dFTl9ERVBFTkRFTkNJRVMgKz0gdGktazMtY29yZS1zZWNkZXYKPiA+PiAr
Cj4gPj4gK1RJX0szX0lNQUdFX0dFTl9TWVNGVyA9IFwKPiA+PiArICAgICQoVElfSzNfSU1BR0Vf
R0VOX0ZXX1RZUEUpLWZpcm13YXJlLSQoVElfSzNfSU1BR0VfR0VOX1NPQyktJChUSV9LM19JTUFH
RV9HRU5fU0VDVFlQRSktZW5jLmJpbiBcCj4gPj4gKyAgICAkKFRJX0szX0lNQUdFX0dFTl9GV19U
WVBFKS1maXJtd2FyZS0kKFRJX0szX0lNQUdFX0dFTl9TT0MpLSQoVElfSzNfSU1BR0VfR0VOX1NF
Q1RZUEUpLWNlcnQuYmluCj4gPj4gK2VuZGlmCj4gPj4KPiA+PiAgZGVmaW5lIFRJX0szX0lNQUdF
X0dFTl9DT05GSUdVUkVfQ01EUwo+ID4+IC0gICAgY3AgJChCSU5BUklFU19ESVIpL3RpLXN5c2Z3
LyQoVElfSzNfSU1BR0VfR0VOX1NZU0ZXKSAkKEBEKQo+ID4+ICsgICAgJChmb3JlYWNoIHQsJChU
SV9LM19JTUFHRV9HRU5fU1lTRlcpLFwKPiA+PiArICAgICAgICAgICAgY3AgJChCSU5BUklFU19E
SVIpL3RpLXN5c2Z3LyQodCkgJChARCkvCj4gPj4gKyAgICApCj4gPj4gIGVuZGVmCj4gPj4KPiA+
PiAgZGVmaW5lIFRJX0szX0lNQUdFX0dFTl9CVUlMRF9DTURTCj4gPj4gQEAgLTQwLDYgKzUxLDcg
QEAgZGVmaW5lIFRJX0szX0lNQUdFX0dFTl9CVUlMRF9DTURTCj4gPj4gICAgICAkKEJSMl9NQUtF
KSAtQyAkKEBEKSBcCj4gPj4gICAgICAgICAgICAgIFNPQz0kKFRJX0szX0lNQUdFX0dFTl9TT0Mp
IFwKPiA+PiAgICAgICAgICAgICAgU09DX1RZUEU9JChUSV9LM19JTUFHRV9HRU5fU0VDVFlQRSkg
XAo+ID4+ICsgICAgICAgICAgICBUSV9TRUNVUkVfREVWX1BLRz0kKEJJTkFSSUVTX0RJUikgXAo+
ID4+ICAgICAgICAgICAgICBDT05GSUc9ZXZtIFwKPiA+PiAgICAgICAgICAgICAgQ1JPU1NfQ09N
UElMRT0kKEhPU1RfRElSKS9iaW4vYXJtLW5vbmUtZWFiaS0gXAo+ID4+ICAgICAgICAgICAgICBT
Qkw9JChCSU5BUklFU19ESVIpL3I1LXUtYm9vdC1zcGwuYmluIFwKPiA+Cj4KCgotLSAKCkRhcmlv
IEJpbmFjY2hpCgpTZW5pb3IgRW1iZWRkZWQgTGludXggRGV2ZWxvcGVyCgpkYXJpby5iaW5hY2No
aUBhbWFydWxhc29sdXRpb25zLmNvbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwoKCkFtYXJ1bGEgU29sdXRpb25zIFNSTAoKVmlhIExlIENhbmV2YXJlIDMwLCAzMTEwMCBUcmV2
aXNvLCBWZW5ldG8sIElUCgpULiArMzkgMDQyIDI0MyA1MzEwCmluZm9AYW1hcnVsYXNvbHV0aW9u
cy5jb20KCnd3dy5hbWFydWxhc29sdXRpb25zLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
