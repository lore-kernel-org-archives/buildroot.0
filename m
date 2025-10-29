Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB4FECCF9EE
	for <buildroot@archiver.kernel.org>; Wed, 29 Oct 2025 20:53:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EA88833B7;
	Wed, 29 Oct 2025 20:53:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KoKiBvaqS-rH; Wed, 29 Oct 2025 20:53:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 951AB83396
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 951AB83396;
	Wed, 29 Oct 2025 20:53:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 60F902A3
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 20:53:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 531454097F
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 20:53:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NVJuR_NfV9JD for <buildroot@buildroot.org>;
 Wed, 29 Oct 2025 20:53:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12e; helo=mail-il1-x12e.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8B2DE40339
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B2DE40339
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8B2DE40339
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 20:53:25 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-430d0d37fd7so1463665ab.0
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 13:53:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761771204; x=1762376004;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8UdGVhk12KXp9RS7P4no85ax5jw6fKJyx2z2PJ6zIrE=;
 b=Ol/FdF4/Pg7f4XnXWKEnr5SWGd+V4GSU+SOHJx/eR8Ncdvc6RdwxOyxoZqUAAi9QpC
 /sxXLYNSdJVMwelppfRpdxLK8hoVF15MoZEpkQQ3e7dG1ipmtufj+G8WUut5Ua53lNoJ
 x5GlmOgBwveLfBt8H+eevw3hAxYbx+USbiT4m0LL+ylpZXPSrWipM+P8Mf7EuGArpBAX
 Q9dC50cn5o0b1jpdjbROvcFaDRpFPBTr5rxO+2fW9xhmhThcpsxU3v8IY1ks8cBt2aeN
 IAw/UNzvY/qWAZIlsARJlI5AH6PzBYXHXbCCxrg32pYlHeBf6wgH6dmDFjaXYm2RS/ZQ
 Afsg==
X-Gm-Message-State: AOJu0YxnooCQmp4WCRlTIS1tJ7K+rDxr0JVssfnSAFklShDbABM1uPRL
 hc/tC9hjNrRMSup/OqJ5emgozVYWPnW6fw0jXDtpLlbjDsZ10x9/fKNRrW1QBITHnvtsI2Pm5p9
 KUUIv0mBb5ZsdqaBzudOAt8i1IUdrF/rVLA==
X-Gm-Gg: ASbGnctGQEZwrYffYCyE6UXmNhp5Bxo/gZxn8fR1wbQ5aQBQJqDvt/UGJdCVHpYr/p+
 4tIeUXiTmaFOCSYA1yeGychdlzjQRIJcpqwV1KC4eqhoWaYu45C4oTKh7DT+nfB2e4QaYclM3if
 cRBGv28pdu9Eqq+V3DbZDbCegpmTVq99g8oziUqKHtv5cYqKAg5L8XpdngIboZV9fV7CnDtks9+
 Gi12PDCNjvwQQWazLdfVmePFXlWzDHLX8v5U84D0oIktuibjhrkp2/rdFk=
X-Google-Smtp-Source: AGHT+IHJy20HsOUxO9/wTp0h5Sa6lUK91sFeAAZB9mBYtQAVWNIeDz8Uy5UZMsAXvTkydFaWTFWOIUeLw6XNe7Scs+k=
X-Received: by 2002:a05:6e02:370d:b0:431:d83a:9ca with SMTP id
 e9e14a558f8ab-4330122bfecmr14344965ab.12.1761771204492; Wed, 29 Oct 2025
 13:53:24 -0700 (PDT)
MIME-Version: 1.0
References: <20251029202331.16192-1-ju.o@free.fr>
In-Reply-To: <20251029202331.16192-1-ju.o@free.fr>
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Wed, 29 Oct 2025 13:52:47 -0700
X-Gm-Features: AWmQ_bmH_XCqYx2jQe_atZkzb5gmJPRNViaFynQZdGM9dJU2Nz993sm-MTeskYQ
Message-ID: <CAMWSM7gopCKKywUNDPL+b7_JJEU0ykXYJE90=k70qFN6XMV-3Q@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761771204; x=1762376004; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8UdGVhk12KXp9RS7P4no85ax5jw6fKJyx2z2PJ6zIrE=;
 b=S7hYCzWzIet+nFrxED1Y7lot1hWi/WMD552ocadJcF2lGSyTw42jI2SYqQcwZ8quU5
 SFbRMTDd9G9pMsmV4KbqEYRk6OYrCE08wiEhCOazuWttkEaHPmBbTqKn7WdUmPvCvsRS
 DZx8Bkzr8I0Lm92m1lku6kNE0/wEThpC8pgzxQ+KlisEyyLmOzQBXBRSi1+a8yXsYGNL
 jWhvqLCk5vxp9nH8JWgXzPa53MBFyYApBZWT0tWdLPx3QLmF83M+xDODqGPyJ1kLr++P
 q+etY87BP0p8ivqukcBIQnLkCfd41JzMWJy6cjk1v2FgaizxH1rjwc/j5mWC2W9Lbhtg
 7fYg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=S7hYCzWz
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: llama-cpp: new runtime
 test
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

SGkgSnVsaWVuLAoKT24gV2VkLCBPY3QgMjksIDIwMjUgYXQgMToyM+KAr1BNIEp1bGllbiBPbGl2
YWluIDxqdS5vQGZyZWUuZnI+IHdyb3RlOgo+Cj4gQ2M6IEpvc2VwaCBLb2d1dCA8am9zZXBoLmtv
Z3V0QGdtYWlsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gT2xpdmFpbiA8anUub0BmcmVl
LmZyPgo+IC0tLQo+ICBERVZFTE9QRVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgMSArCj4gIC4uLi90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9sbGFtYV9jcHAucHkg
ICB8IDc5ICsrKysrKysrKysrKysrKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCA4MCBpbnNlcnRp
b25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2Fn
ZS90ZXN0X2xsYW1hX2NwcC5weQo+Cj4gZGlmZiAtLWdpdCBhL0RFVkVMT1BFUlMgYi9ERVZFTE9Q
RVJTCj4gaW5kZXggZjVjOGI4MzJmOC4uMzM3YjJjN2JhMyAxMDA2NDQKPiAtLS0gYS9ERVZFTE9Q
RVJTCj4gKysrIGIvREVWRUxPUEVSUwo+IEBAIC0xOTQzLDYgKzE5NDMsNyBAQCBGOiAgICAgICAg
c3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9saWJqeGwucHkKPiAgRjogICAgIHN1
cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfbGlnaHR0cGQucHkKPiAgRjogICAgIHN1
cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfbGlua3MucHkKPiAgRjogICAgIHN1cHBv
cnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfbGlua3MvCj4gK0Y6ICAgICBzdXBwb3J0L3Rl
c3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X2xsYW1hX2NwcC5weQo+ICBGOiAgICAgc3VwcG9ydC90
ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9scnppcC5weQo+ICBGOiAgICAgc3VwcG9ydC90ZXN0
aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9scnpzei5weQo+ICBGOiAgICAgc3VwcG9ydC90ZXN0aW5n
L3Rlc3RzL3BhY2thZ2UvdGVzdF9sdHBfdGVzdHN1aXRlLnB5Cj4gZGlmZiAtLWdpdCBhL3N1cHBv
cnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfbGxhbWFfY3BwLnB5IGIvc3VwcG9ydC90ZXN0
aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9sbGFtYV9jcHAucHkKPiBuZXcgZmlsZSBtb2RlIDEwMDY0
NAo+IGluZGV4IDAwMDAwMDAwMDAuLjQ0NjJiZTBhNWIKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIv
c3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9sbGFtYV9jcHAucHkKPiBAQCAtMCww
ICsxLDc5IEBACj4gK2ltcG9ydCBvcwo+ICsKPiAraW1wb3J0IGluZnJhLmJhc2V0ZXN0Cj4gKwo+
ICsKPiArY2xhc3MgVGVzdExsYW1hQ3BwKGluZnJhLmJhc2V0ZXN0LkJSVGVzdCk6Cj4gKyAgICBj
b25maWcgPSAiIiIKPiArICAgICAgICBCUjJfYWFyY2g2ND15Cj4gKyAgICAgICAgQlIyX1RPT0xD
SEFJTl9FWFRFUk5BTD15Cj4gKyAgICAgICAgQlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9CT09UTElO
PXkKPiArICAgICAgICBCUjJfU1lTVEVNX0RIQ1A9ImV0aDAiCj4gKyAgICAgICAgQlIyX0xJTlVY
X0tFUk5FTD15Cj4gKyAgICAgICAgQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTj15Cj4g
KyAgICAgICAgQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iNi4xMi41NSIK
PiArICAgICAgICBCUjJfTElOVVhfS0VSTkVMX1VTRV9DVVNUT01fQ09ORklHPXkKPiArICAgICAg
ICBCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9DT05GSUdfRklMRT0iYm9hcmQvcWVtdS9hYXJjaDY0
LXZpcnQvbGludXguY29uZmlnIgo+ICsgICAgICAgIEJSMl9QQUNLQUdFX0NBX0NFUlRJRklDQVRF
Uz15Cj4gKyAgICAgICAgQlIyX1BBQ0tBR0VfT1BFTlNTTD15Cj4gKyAgICAgICAgQlIyX1BBQ0tB
R0VfTElCQ1VSTD15Cj4gKyAgICAgICAgQlIyX1BBQ0tBR0VfTElCQ1VSTF9DVVJMPXkKPiArICAg
ICAgICBCUjJfUEFDS0FHRV9MTEFNQV9DUFA9eQo+ICsgICAgICAgIEJSMl9QQUNLQUdFX0xMQU1B
X0NQUF9UT09MUz15Cj4gKyAgICAgICAgQlIyX1RBUkdFVF9HRU5FUklDX0dFVFRZX1BPUlQ9InR0
eUFNQTAiCj4gKyAgICAgICAgQlIyX1RBUkdFVF9ST09URlNfRVhUMj15Cj4gKyAgICAgICAgQlIy
X1RBUkdFVF9ST09URlNfRVhUMl9TSVpFPSIxMDI0TSIKPiArICAgICAgICAjIEJSMl9UQVJHRVRf
Uk9PVEZTX1RBUiBpcyBub3Qgc2V0Cj4gKyAgICAiIiIKPiArCj4gKyAgICBkZWYgbG9naW4oc2Vs
Zik6Cj4gKyAgICAgICAgaW1nID0gb3MucGF0aC5qb2luKHNlbGYuYnVpbGRkaXIsICJpbWFnZXMi
LCAicm9vdGZzLmV4dDIiKQo+ICsgICAgICAgIGtlcm4gPSBvcy5wYXRoLmpvaW4oc2VsZi5idWls
ZGRpciwgImltYWdlcyIsICJJbWFnZSIpCj4gKyAgICAgICAgc2VsZi5lbXVsYXRvci5ib290KAo+
ICsgICAgICAgICAgICBhcmNoPSJhYXJjaDY0IiwKPiArICAgICAgICAgICAga2VybmVsPWtlcm4s
Cj4gKyAgICAgICAgICAgIGtlcm5lbF9jbWRsaW5lPVsicm9vdD0vZGV2L3ZkYSIsICJjb25zb2xl
PXR0eUFNQTAiXSwKPiArICAgICAgICAgICAgb3B0aW9ucz1bCj4gKyAgICAgICAgICAgICAgICAi
LU0iLCAidmlydCIsCj4gKyAgICAgICAgICAgICAgICAiLWNwdSIsICJjb3J0ZXgtYTU3IiwKPiAr
ICAgICAgICAgICAgICAgICItc21wIiwgIjQiLAo+ICsgICAgICAgICAgICAgICAgIi1tIiwgIjJH
IiwKPiArICAgICAgICAgICAgICAgICItZHJpdmUiLCBmImZpbGU9e2ltZ30saWY9dmlydGlvLGZv
cm1hdD1yYXciLAo+ICsgICAgICAgICAgICAgICAgIi1uZXQiLCAibmljLG1vZGVsPXZpcnRpbyIs
Cj4gKyAgICAgICAgICAgICAgICAiLW5ldCIsICJ1c2VyIgo+ICsgICAgICAgICAgICBdCj4gKyAg
ICAgICAgKQo+ICsgICAgICAgIHNlbGYuZW11bGF0b3IubG9naW4oKQo+ICsKPiArICAgIGRlZiB0
ZXN0X3J1bihzZWxmKToKPiArICAgICAgICBzZWxmLmxvZ2luKCkKPiArCj4gKyAgICAgICAgIyBD
aGVjayB0aGUgcHJvZ3JhbSBjYW4gZXhlY3V0ZS4KPiArICAgICAgICBzZWxmLmFzc2VydFJ1bk9r
KCJsbGFtYS1jbGkgLS12ZXJzaW9uIikKPiArCj4gKyAgICAgICAgIyBXZSBkZWZpbmUgYSBIdWdn
aW5nIEZhY2UgbW9kZWwgdG8gYmUgZG93bmxvYWRlZC4KPiArICAgICAgICAjIFdlIGNob29zZSBh
IHJlbGF0aXZlbHkgc21hbGwgbW9kZWwsIGZvciB0ZXN0aW5nLgo+ICsgICAgICAgIGhmX21vZGVs
ID0gImdnbWwtb3JnL2dlbW1hLTMtMjcwbS1pdC1HR1VGIgo+ICsKPiArICAgICAgICAjIFdlIGRl
ZmluZSBhIGNvbW1vbiBrbm93bGVkZ2UgcXVlc3Rpb24gdG8gYXNrIHRvIHRoZSBtb2RlbC4KPiAr
ICAgICAgICBwcm9tcHQgPSAiV2hhdCBpcyB0aGUgY2FwaXRhbCBvZiB0aGUgVW5pdGVkIEtpbmdk
b20/Igo+ICsKPiArICAgICAgICAjIFdlIGRlZmluZSBhbiBleHBlY3RlZCBrZXl3b3JkLCB0byBi
ZSBwcmVzZW50IGluIHRoZSBhbnN3ZXIuCj4gKyAgICAgICAgZXhwZWN0ZWRfYW5zd2VyID0gImxv
bmRvbiIKPiArCj4gKyAgICAgICAgIyBXZSBzZXQgZmV3IGxsYW1hLWNsaSBvcHRpb25zOgo+ICsg
ICAgICAgICMgV2UgZG9uJ3Qgd2FudCBhbiBpbnRlcmFjdGl2ZSBzZXNzaW9uCj4gKyAgICAgICAg
bGxhbWFfb3B0cyA9ICItLXNpbmdsZS10dXJuIgo+ICsgICAgICAgIGxsYW1hX29wdHMgKz0gIiAt
LW5vLWRpc3BsYXktcHJvbXB0Igo+ICsgICAgICAgICMgV2Ugc2V0IGEgZml4ZWQgc2VlZCwgdG8g
cmVkdWNlIHZhcmlhYmlsaXR5IG9mIHRoZSB0ZXN0Cj4gKyAgICAgICAgbGxhbWFfb3B0cyArPSAi
IC0tc2VlZCAxMjM0NTY3ODkiCj4gKyAgICAgICAgbGxhbWFfb3B0cyArPSBmIiAtLWhmLXJlcG8g
e2hmX21vZGVsfSIKPiArICAgICAgICBsbGFtYV9vcHRzICs9IGYiIC0tcHJvbXB0ICd7cHJvbXB0
fSciCj4gKwo+ICsgICAgICAgICMgUnVuIHRoZSBjb21tYW5kLiBXZSBzdXBwcmVzcyBhbGwgc3Rk
ZXJyIG91dHB1dCBsb2dzIHRvIGdldAo+ICsgICAgICAgICMgb25seSB0aGUgYW5zd2VyLiBSZW1v
dmUgdGhlIHJlZGlyZWN0aW9uIGZvciBkZWJ1Z2dpbmcuCj4gKyAgICAgICAgY21kID0gZiJsbGFt
YS1jbGkge2xsYW1hX29wdHN9IDI+L2Rldi9udWxsIgo+ICsgICAgICAgIG91dCwgcmV0ID0gc2Vs
Zi5lbXVsYXRvci5ydW4oY21kLCB0aW1lb3V0PTYwKQo+ICsgICAgICAgIHNlbGYuYXNzZXJ0RXF1
YWwocmV0LCAwKQo+ICsgICAgICAgIG91dF9zdHIgPSAiXG4iLmpvaW4ob3V0KS5sb3dlcigpCj4g
KyAgICAgICAgc2VsZi5hc3NlcnRJbihleHBlY3RlZF9hbnN3ZXIsIG91dF9zdHIpCj4gLS0KPiAy
LjUxLjEKPgoKVGhhbmsgeW91IGZvciBhZGRpbmcgdGhpcywgaXQncyB3ZWxsIHRob3VnaHQgYW5k
IGNvbXByZWhlbnNpdmUuIEl0CndvdWxkIGJlIGludGVyZXN0aW5nIHRvIGFsc28gYWRkIGEgdGVz
dCBjYXNlIGZvciBWdWxrYW4gYWNjZWxlcmF0aW9uCmluIHRoZSBmdXR1cmUsIHV0aWxpemluZyB2
aXJnbHJlbmRlcmVyIGFuZCBWZW51cyBvdmVyIHZpcnRpby1ncHUuIFRoYXQKd291bGQgaGVscCB0
ZXN0IG1vcmUgb2YgdGhlIGdyYXBoaWNzIHN0YWNrIHRoYW4ganVzdCBsbHZtcGlwZSwgd2hlbgp0
aGUgaG9zdCBoYXMgYSBHUFUgYXZhaWxhYmxlLgoKJCBzdXBwb3J0L3Rlc3RpbmcvcnVuLXRlc3Rz
IC1kIHRlc3QvZGwvIC1vIHRlc3Qvb3V0cHV0Lwp0ZXN0cy5wYWNrYWdlLnRlc3RfbGxhbWFfY3Bw
LlRlc3RMbGFtYUNwcAoxMzo0MDoxOSBUZXN0TGxhbWFDcHAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFN0YXJ0aW5nCjEzOjQwOjE5IFRlc3RMbGFtYUNwcCAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgQnVpbGRpbmcKMTM6NDc6NTcgVGVzdExsYW1hQ3BwICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBCdWlsZGluZyBkb25lCjEzOjQ4OjA5IFRlc3RMbGFtYUNwcCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgQ2xlYW5pbmcgdXAKLgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClJhbiAxIHRlc3Qg
aW4gNDcxLjc2NnMKCk9LCgpSZXZpZXdlZC1ieTogSm9zZXBoIEtvZ3V0IDxqb3NlcGgua29ndXRA
Z21haWwuY29tPgpUZXN0ZWQtYnk6IEpvc2VwaCBLb2d1dCA8am9zZXBoLmtvZ3V0QGdtYWlsLmNv
bT4KCkJlc3QsCkpvc2VwaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
