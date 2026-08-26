Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED618C5DF97
	for <buildroot@archiver.kernel.org>; Wed, 26 Aug 2026 20:12:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77A22407B9;
	Wed, 26 Aug 2026 20:12:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6fitEM0e6-0I; Wed, 26 Aug 2026 20:12:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787775129;
	bh=lko/fSINDzYT3MVozYLL4I0JDZVOjqF0V9pglFtHo9g=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=DssWDYjQEh2KEbeEe5e7dYttzE22VmzXj3gjmeUgzJMoq116zuXJ1ZfmDJvQ2c2ta
	 XcROpKU1cv//Hx7zpbQAwnAWv9Q0dFsjmWPUQVibRgKPZghR37pW8PgsY/JRvyilWV
	 ZTju4pC36i7TRpXTtiI331sUBkSMjjtM74XEhmie0OeFVJ1d6WevHOKkwJUvlsnXe5
	 Y/Rd81hgXafRzDS08xQ4aBt4uXqrvhBC5gifFxq+LWfMEjwexhxKL/E72QwJAdTGuA
	 nWP1fzaxOSJLov9cHoSVujSlnu1DDP9xc11C8vsklgNWyJKDyTF0OwBNrWnNkgrniH
	 DoSBRg1Onedrg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5400340792;
	Wed, 26 Aug 2026 20:12:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C8A3F230
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 20:12:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BAA5040123
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 20:12:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hyc4yzsCqN60 for <buildroot@buildroot.org>;
 Wed, 26 Aug 2026 20:12:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 102174024A
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 20:12:06 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-482e61a34e5so353974f8f.3
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 13:12:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787775125; x=1788379925;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=SmlpB03M/qZl0dd8G3A2XMQt4rr+FtUHZvKS0Q6eBh8=;
 b=ZpSMivNKRsVPegLKsJ4xt++TjBGY00gRN0z7YMJPyvN6XeAmD/01xt+2CRuLI3qKbt
 2XHpcs7JvKTc5X8UV/OD0eT/xwf14GWeJIqTVvxNEM3bvoWdL6Vtsztj7K0CGqKoP3vx
 2GbBxdQWe7GWTVr4Mx+4zhTnvPiZUPE3H4YGl+4Lo4c3EdZ80ACM6odpSHG1adJQcrjJ
 nVBm7lDSa5/wvzO63+3OklDW5hiaAEM/bB0b01hpZ0EYSI2TLkk1kkKBYxf0cuirSTbn
 BfX8ivYia/S/mVKcMgV6jU1Y2yvcORNf8z6HA5lbheYkhYivnKLzsRJRa+4X7p3wXC71
 +64A==
X-Forwarded-Encrypted: i=1;
 AHgh+Rqzx3Mg5dy8Jid6sK4eKjH8oZba/y14spvy7f4wwatkVuLqCBHennruYI1ROCa/6+sRKqDWpYajPGs=@buildroot.org
X-Gm-Message-State: AFuF++nEt96MP2Oqeu6XtMxLJs3lx3uhI9nnP+pK5VE/kSvKsbRcvM2t
 EWgGxvmCWlhiGOay5lJS0+cofxbJD03h0yEgwGX4b9Hy4U4hb2NyhBc1veT7iyiXQE8=
X-Gm-Gg: AR+sD11n7ZXlXBOvoa+0Iyqxs/0+uB/Wbo0oKHDBIrz8t799zfD3T5nztKxYKzazTFl
 X7P2BXxsjCrBYw7KMPcW+7IG0Q+8ZBwVisK6lHBr2HU3klutoM6qr8XbPmeGDvzdX2d2fyzQJ+n
 ayZ6D3PetLWHV/+4NcwFYf5lSRPGW2xE23Ay1Mz5M+YG87sCUbEWSA6PFC16db+oByXtW5x4TnA
 Pj9eCgzYX5/swQSp0gpIT/q9vMVBr/j7Yv77hn2HkOViK8rhSObVVkaj3+QTx5HLTMKTT9yiFZM
 A6G6P1bfVtVL1zJpBqE2BsvWo5kQn7EonY9x0mndjUYfBha25uIZ9JW5mZkl+byTM8V0O5nVZ+w
 eT9ejHhWM+qsYczfha6c3S++qKRLFQgNEXTIR3EQmfJrXd9OY1p4GW/XMe2i0eLH/SOI82uAUju
 tkkRMXoi3l2/Ta+EEUejKLFe7i5gRAUWzeC6p7q4jBFU8x5d1JtBpDBmUBSHLXK1dKeG2Fg3goQ
 hlkdOyHxOWHsOJBhk5wz1QOfKAetA7AmdPQQ3fvU22alPBq+vQvuHGZqC+KqxuQeliG5tzMZdwU
 TRFCePqtifJ7eks03N1KBUfoYNc=
X-Received: by 2002:a05:600c:638d:b0:499:8c68:a3aa with SMTP id
 5b1f17b1804b1-499dc8306e5mr93972675e9.13.1787775124781; 
 Wed, 26 Aug 2026 13:12:04 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482e279ecaesm3913876f8f.6.2026.08.26.13.12.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Aug 2026 13:12:04 -0700 (PDT)
Message-ID: <b66264b2-351c-4163-9c99-c1deefd2affd@smile.fr>
Date: Wed, 26 Aug 2026 22:12:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20260824184502.676800-1-ju.o@free.fr>
Content-Language: fr
In-Reply-To: <20260824184502.676800-1-ju.o@free.fr>
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: php: fix test by
 switching to "Debian" filesystem layout
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

SGVsbG8gSnVsaWVuLAoKTGUgMjQvMDgvMjAyNiDDoCAyMDo0NSwgSnVsaWVuIE9saXZhaW4gdmlh
IGJ1aWxkcm9vdCBhIMOpY3JpdMKgOgo+IEJ1aWxkcm9vdCBjb21taXQgWzFdIChwYWNrYWdlL2Fw
YWNoZTogdXNlICJEZWJpYW4iIGZpbGVzeXN0ZW0KPiBsYXlvdXQgdG8gZml4IHJlYWQtb25seSBy
b290ZnMpIGNoYW5nZWQgdGhlIGZpbGVzeXN0ZW0gbGF5b3V0Lgo+IFRoaXMgaGFkIHRoZSBlZmZl
Y3Qgb2YgaW5zdGFsbGluZyBmaWxlcyB0byBkaWZmZXJlbnQgbG9jYXRpb25zCj4gYW5kIGJyZWFr
aW5nIHRoZSB0ZXN0X3BocCBydW50aW1lIHRlc3QuCj4gCj4gVGhpcyBjb21taXQgZml4ZXMgdGhl
IGlzc3VlIGJ5IHVwZGF0aW5nIHRoZSBmaWxlIHBhdGhzIHRvIHRoZWlyCj4gcmlnaHQgbG9jYXRp
b25zLiBUaGUgImh0dHBkLmNvbmYiIHdhcyB1cGRhdGVkIGJ5IGZvbGxvd2luZyB0aGUKPiBzYW1l
IHJlY2lwZSBkZXNjcmliZWQgaW4gdGhlIGNvbW1lbnQgKHN0YXJ0aW5nIGZyb20gYSBjb25maWcK
PiBmaWxlIGFzIGluc3RhbGxlZCBieSB0aGUgYXBhY2hlIEJ1aWxkcm9vdCBwYWNrYWdlKS4KPiAK
PiBGaXhlczoKPiBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9q
b2JzLzE2MDYwMTUyOTc5Cj4gCj4gWzFdIGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3Jn
L2J1aWxkcm9vdC8tL2NvbW1pdC8xMDA2NjY2ZjY3YmEyODM3YmE0Y2YxMDE0MTg2ZjNiMWNjOGYz
NDE1CgpUZXN0ZWQtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPgoKQmVz
dCByZWdhcmRzLApSb21haW4KCgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBPbGl2YWluIDxq
dS5vQGZyZWUuZnI+Cj4gLS0tCj4gUGF0Y2ggdGVzdGVkIGluOgo+IGh0dHBzOi8vZ2l0bGFiLmNv
bS9qb2xpdmFpbi9idWlsZHJvb3QvLS9qb2JzLzE2MDc1NTAwNjc5Cj4gLS0tCj4gIC4uLi9yb290
ZnMtb3ZlcmxheS9ldGMvYXBhY2hlMi9odHRwZC5jb25mICAgICB8IDIyICsrKysrKysrKy0tLS0t
LS0tLS0KPiAgLi4uL2FwYWNoZTIvZGVmYXVsdC1zaXRlfS9odGRvY3Mvc2NyaXB0LnBocCAgIHwg
IDAKPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkK
PiAgcmVuYW1lIHN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfcGhwL3Jvb3Rmcy1v
dmVybGF5L3Vzci97ID0+IHNoYXJlL2FwYWNoZTIvZGVmYXVsdC1zaXRlfS9odGRvY3Mvc2NyaXB0
LnBocCAoMTAwJSkKPiAKPiBkaWZmIC0tZ2l0IGEvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2th
Z2UvdGVzdF9waHAvcm9vdGZzLW92ZXJsYXkvZXRjL2FwYWNoZTIvaHR0cGQuY29uZiBiL3N1cHBv
cnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfcGhwL3Jvb3Rmcy1vdmVybGF5L2V0Yy9hcGFj
aGUyL2h0dHBkLmNvbmYKPiBpbmRleCAxMDkyNDc1MTRiLi43NWJhZDE2M2RiIDEwMDY0NAo+IC0t
LSBhL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfcGhwL3Jvb3Rmcy1vdmVybGF5
L2V0Yy9hcGFjaGUyL2h0dHBkLmNvbmYKPiArKysgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFj
a2FnZS90ZXN0X3BocC9yb290ZnMtb3ZlcmxheS9ldGMvYXBhY2hlMi9odHRwZC5jb25mCj4gQEAg
LTUsMTQgKzUsMTQgQEAKPiAgIyAtICJTZXJ2ZXJOYW1lIGxvY2FsaG9zdDo4MCIgYWRkZWQgdG8g
cmVtb3ZlIHN0YXJ0dXAgd2FybmluZywKPiAgIyAtICJBZGRUeXBlIGFwcGxpY2F0aW9uL3gtaHR0
cGQtcGhwIC5waHAiIGFkZGVkIHRvIGVuYWJsZSBwaHAuCj4gIAo+IC1TZXJ2ZXJSb290ICIvdXNy
Igo+ICtTZXJ2ZXJSb290ICIvIgo+ICBMaXN0ZW4gODAKPiAgCj4gLUxvYWRNb2R1bGUgYXV0aHpf
Y29yZV9tb2R1bGUgbW9kdWxlcy9tb2RfYXV0aHpfY29yZS5zbwo+IC1Mb2FkTW9kdWxlIG1pbWVf
bW9kdWxlIG1vZHVsZXMvbW9kX21pbWUuc28KPiAtTG9hZE1vZHVsZSBsb2dfY29uZmlnX21vZHVs
ZSBtb2R1bGVzL21vZF9sb2dfY29uZmlnLnNvCj4gLUxvYWRNb2R1bGUgdW5peGRfbW9kdWxlIG1v
ZHVsZXMvbW9kX3VuaXhkLnNvCj4gLUxvYWRNb2R1bGUgcGhwX21vZHVsZSBtb2R1bGVzL2xpYnBo
cC5zbwo+ICtMb2FkTW9kdWxlIGF1dGh6X2NvcmVfbW9kdWxlIHVzci9saWIvYXBhY2hlMi9tb2R1
bGVzL21vZF9hdXRoel9jb3JlLnNvCj4gK0xvYWRNb2R1bGUgbWltZV9tb2R1bGUgdXNyL2xpYi9h
cGFjaGUyL21vZHVsZXMvbW9kX21pbWUuc28KPiArTG9hZE1vZHVsZSBsb2dfY29uZmlnX21vZHVs
ZSB1c3IvbGliL2FwYWNoZTIvbW9kdWxlcy9tb2RfbG9nX2NvbmZpZy5zbwo+ICtMb2FkTW9kdWxl
IHVuaXhkX21vZHVsZSB1c3IvbGliL2FwYWNoZTIvbW9kdWxlcy9tb2RfdW5peGQuc28KPiArTG9h
ZE1vZHVsZSBwaHBfbW9kdWxlIHVzci9saWIvYXBhY2hlMi9tb2R1bGVzL2xpYnBocC5zbwo+ICAK
PiAgPElmTW9kdWxlIHVuaXhkX21vZHVsZT4KPiAgVXNlciBkYWVtb24KPiBAQCAtMjcsOCArMjcs
OCBAQCBTZXJ2ZXJOYW1lIGxvY2FsaG9zdDo4MAo+ICAgICAgUmVxdWlyZSBhbGwgZGVuaWVkCj4g
IDwvRGlyZWN0b3J5Pgo+ICAKPiAtRG9jdW1lbnRSb290ICIvdXNyL2h0ZG9jcyIKPiAtPERpcmVj
dG9yeSAiL3Vzci9odGRvY3MiPgo+ICtEb2N1bWVudFJvb3QgIi91c3Ivc2hhcmUvYXBhY2hlMi9k
ZWZhdWx0LXNpdGUvaHRkb2NzIgo+ICs8RGlyZWN0b3J5ICIvdXNyL3NoYXJlL2FwYWNoZTIvZGVm
YXVsdC1zaXRlL2h0ZG9jcyI+Cj4gICAgICBPcHRpb25zIEluZGV4ZXMgRm9sbG93U3ltTGlua3MK
PiAgICAgIEFsbG93T3ZlcnJpZGUgTm9uZQo+ICAgICAgUmVxdWlyZSBhbGwgZ3JhbnRlZAo+IEBA
IC0zOCw3ICszOCw3IEBAIERvY3VtZW50Um9vdCAiL3Vzci9odGRvY3MiCj4gICAgICBSZXF1aXJl
IGFsbCBkZW5pZWQKPiAgPC9GaWxlcz4KPiAgCj4gLUVycm9yTG9nICIvdmFyL2xvZ3MvZXJyb3Jf
bG9nIgo+ICtFcnJvckxvZyAidmFyL2xvZy9hcGFjaGUyL2Vycm9yX2xvZyIKPiAgTG9nTGV2ZWwg
d2Fybgo+ICAKPiAgPElmTW9kdWxlIGxvZ19jb25maWdfbW9kdWxlPgo+IEBAIC00OSwxMCArNDks
MTAgQEAgTG9nTGV2ZWwgd2Fybgo+ICAgICAgICBMb2dGb3JtYXQgIiVoICVsICV1ICV0IFwiJXJc
IiAlPnMgJWIgXCIle1JlZmVyZXJ9aVwiIFwiJXtVc2VyLUFnZW50fWlcIiAlSSAlTyIgY29tYmlu
ZWRpbwo+ICAgICAgPC9JZk1vZHVsZT4KPiAgCj4gLSAgICBDdXN0b21Mb2cgIi92YXIvbG9ncy9h
Y2Nlc3NfbG9nIiBjb21tb24KPiArICAgIEN1c3RvbUxvZyAidmFyL2xvZy9hcGFjaGUyL2FjY2Vz
c19sb2ciIGNvbW1vbgo+ICA8L0lmTW9kdWxlPgo+ICAKPiAgPElmTW9kdWxlIG1pbWVfbW9kdWxl
Pgo+IC0gICAgVHlwZXNDb25maWcgL2V0Yy9hcGFjaGUyL21pbWUudHlwZXMKPiArICAgIFR5cGVz
Q29uZmlnIGV0Yy9hcGFjaGUyL21pbWUudHlwZXMKPiAgICAgIEFkZFR5cGUgYXBwbGljYXRpb24v
eC1odHRwZC1waHAgLnBocAo+ICA8L0lmTW9kdWxlPgo+IGRpZmYgLS1naXQgYS9zdXBwb3J0L3Rl
c3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3BocC9yb290ZnMtb3ZlcmxheS91c3IvaHRkb2NzL3Nj
cmlwdC5waHAgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3BocC9yb290ZnMt
b3ZlcmxheS91c3Ivc2hhcmUvYXBhY2hlMi9kZWZhdWx0LXNpdGUvaHRkb2NzL3NjcmlwdC5waHAK
PiBzaW1pbGFyaXR5IGluZGV4IDEwMCUKPiByZW5hbWUgZnJvbSBzdXBwb3J0L3Rlc3RpbmcvdGVz
dHMvcGFja2FnZS90ZXN0X3BocC9yb290ZnMtb3ZlcmxheS91c3IvaHRkb2NzL3NjcmlwdC5waHAK
PiByZW5hbWUgdG8gc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9waHAvcm9vdGZz
LW92ZXJsYXkvdXNyL3NoYXJlL2FwYWNoZTIvZGVmYXVsdC1zaXRlL2h0ZG9jcy9zY3JpcHQucGhw
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
