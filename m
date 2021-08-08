Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5718C4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 21:59:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AB8660F35
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 21:59:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2AB8660F35
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6F2682CA3;
	Sun,  8 Aug 2021 21:59:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rUWEBJA1DXTJ; Sun,  8 Aug 2021 21:59:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0679882C98;
	Sun,  8 Aug 2021 21:59:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B26CB1BF281
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 21:59:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A1F7760698
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 21:59:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TF6mTnsx5RTO for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 21:59:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd02101.aruba.it (smtpcmd02101.aruba.it [62.149.158.101])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4442C600B6
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 21:59:05 +0000 (UTC)
Received: from smtpclient.apple ([146.241.149.252])
 by Aruba Outgoing Smtp  with ESMTPA
 id CqovmdAtyqG1wCqowmfzeZ; Sun, 08 Aug 2021 23:59:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1628459943; bh=tWMi4Xd/duGHwl6AzWXepmNuuOiNSpGLw/xuVGOI72c=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=JZQnVxzESw++vZfLEYHYF8+qmnM3RFq+HSzc3Ye3ZnZTpqbLl7XZdmGEnlXLCjHnX
 d3/qrZ/DrWmhn8/QrSEA2iszuVptlIGUbygOSvTRcY9yhhFGfQuAzE54VDevm03IGL
 tHT0nrgJO5Pd+RnF4XHZcp6kL6dUVsVAyY0VMGNR11mIdtukBRQLVx7ZKMXZWCdPvD
 aWv2ZMzLG7Z6jEKiB96+aZTMv0aFK7wuwNrPoz/W9ab5r0sVIVQHmrapWuNnOc9kE9
 OfwMXy4fXSYxg6wF9BbEpbl0sMf8wdTT/tNmW7oEVJxCVxbnLhjvQ8lTpAYCyhgkwD
 lj4rXMUdpTXWQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Sun, 8 Aug 2021 23:59:01 +0200
Message-Id: <36CCC7B4-E482-495D-B32C-484D882E5733@benettiengineering.com>
References: <20210808222252.622b4470@windsurf>
In-Reply-To: <20210808222252.622b4470@windsurf>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: iPhone Mail (18G82)
X-CMAE-Envelope: MS4wfPpwRbrxoULAs47MPwP3hbAhdFi6Mgn4+32/oJkYH9x5ldjLoe6EQKe8q44jj+N3+WvQTPa2e+C4MMVyuhw2Uhj7ryEyj4UKXyiOyscBB07gra4KqSxU
 uZsLhJX7bFUQYezqlo4IIqglEnlYxAFilxbJ4LvKpvKNSFQHaVmo9/FlASfbkCJW66V+cK1RndnAKKbWhJFVij+Pborkv2vymmRbKypefPPRYy08/Dro5MZx
 vtUitd52UHuTA+Z0FEzAUIeCbSQ0gZYlZu4vikrxVXXZezgxXebo+wURs2nye4uBRdH1h2ifcliil+M9Qj3qGXZg0HQ2NX0My0HNxJ8HMn4=
Subject: Re: [Buildroot] [PATCH 1/1] package/libnss: fix build on ARM big
 endian
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SGVsbG8gVGhvbWFzLCBGYWJyaWNlLAoKPiBJbCBnaW9ybm8gOCBhZ28gMjAyMSwgYWxsZSBvcmUg
MjI6MjMsIFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IGhh
IHNjcml0dG86Cj4gCj4g77u/T24gU2F0LCAgNyBBdWcgMjAyMSAyMzozMjo1NCArMDIwMAo+IEZh
YnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPiB3cm90ZToKPiAKPj4g
Rml4IHRoZSBmb2xsb3duaWcgYnVpbGQgZmFpbHVyZSBvbiBBUk0gYmlnIGVuZGlhbiByYWlzZWQg
c2luY2UgYnVtcCB0bwo+PiB2ZXJzaW9uIDMuNjggaW4gY29tbWl0IDBhNzNiOWI5NjI0MjFjZTdh
NzJjODhlNWY1YmJkODg0OWYyMWIwNDE6Cj4+IAo+PiBMaW51eDIuNl9hYXJjaDY0X2FhcmNoNjRf
YmUtbGludXgtZ251LWdjY19nbGliY19QVEhfNjRfREJHLk9CSi9MaW51eF9TSU5HTEVfU0hMSUIv
c2hhMjU2LWFybXY4Lm86IEluIGZ1bmN0aW9uIGBTSEEyNTZfQ29tcHJlc3NfTmF0aXZlJzoKPj4g
c2hhMjU2LWFybXY4LmM6KC50ZXh0LlNIQTI1Nl9Db21wcmVzc19OYXRpdmUrMHgwKTogbXVsdGlw
bGUgZGVmaW5pdGlvbiBvZiBgU0hBMjU2X0NvbXByZXNzX05hdGl2ZScKPj4gTGludXgyLjZfYWFy
Y2g2NF9hYXJjaDY0X2JlLWxpbnV4LWdudS1nY2NfZ2xpYmNfUFRIXzY0X0RCRy5PQkovTGludXhf
U0lOR0xFX1NITElCL3NoYTUxMi5vOnNoYTUxMi5jOigudGV4dC5TSEEyNTZfQ29tcHJlc3NfTmF0
aXZlKzB4MCk6IGZpcnN0IGRlZmluZWQgaGVyZQo+PiBMaW51eDIuNl9hYXJjaDY0X2FhcmNoNjRf
YmUtbGludXgtZ251LWdjY19nbGliY19QVEhfNjRfREJHLk9CSi9MaW51eF9TSU5HTEVfU0hMSUIv
c2hhMjU2LWFybXY4Lm86IEluIGZ1bmN0aW9uIGBTSEEyNTZfVXBkYXRlX05hdGl2ZSc6Cj4+IHNo
YTI1Ni1hcm12OC5jOigudGV4dC5TSEEyNTZfVXBkYXRlX05hdGl2ZSsweDApOiBtdWx0aXBsZSBk
ZWZpbml0aW9uIG9mIGBTSEEyNTZfVXBkYXRlX05hdGl2ZScKPj4gTGludXgyLjZfYWFyY2g2NF9h
YXJjaDY0X2JlLWxpbnV4LWdudS1nY2NfZ2xpYmNfUFRIXzY0X0RCRy5PQkovTGludXhfU0lOR0xF
X1NITElCL3NoYTUxMi5vOnNoYTUxMi5jOigudGV4dC5TSEEyNTZfVXBkYXRlX05hdGl2ZSsweDAp
OiBmaXJzdCBkZWZpbmVkIGhlcmUKPj4gCj4+IEZpeGVzOgo+PiAtIGh0dHA6Ly9hdXRvYnVpbGQu
YnVpbGRyb290Lm9yZy9yZXN1bHRzLzIzN2FiYTBjMTZhMzRmZWMxYjBmZTUwZmUwOGNhY2U0Mzhl
ZGExYmYKPj4gCj4+IFNpZ25lZC1vZmYtYnk6IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZh
YnJpY2VAZ21haWwuY29tPgo+PiAtLS0KPj4gLi4uMi5jLWZpeC1TSEEyNTYtcmVkZWZpbml0aW9u
LW9uLUFSTS1iLnBhdGNoIHwgNDcgKysrKysrKysrKysrKysrKysrKwo+PiAxIGZpbGUgY2hhbmdl
ZCwgNDcgaW5zZXJ0aW9ucygrKQo+PiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9saWJuc3Mv
MDAwMS1saWItZnJlZWJsLXNoYTUxMi5jLWZpeC1TSEEyNTYtcmVkZWZpbml0aW9uLW9uLUFSTS1i
LnBhdGNoCj4gCj4gSSBoYXZlIGFwcGxpZWQgdG8gbWFzdGVyLiBHaXVsaW86IEkgc2F3IHlvdXIg
Y29tbWVudHMsIGFuZCB3ZSB3aWxsCj4gZGVmaW5pdGVseSBiZSBpbnRlcmVzdGVkIGluIGhlYXJp
bmcgdXBzdHJlYW0ncyBmZWVkYmFjay4KPiAKPiBIb3dldmVyLCB3aGF0IGhhcHBlbnMgc2VlbXMg
cHJldHR5IGNsZWFyOiBvbiBBYXJjaDY0IChsaXR0bGUgZW5kaWFuIG9yCj4gYmlnIGVuZGlhbiks
IHNoYTI1Ni1hcm12OC5jIGdldHMgY29tcGlsZWQsIGFuZCBpdCBkZWZpbmVzIGEgZnVuY3Rpb24K
PiBjYWxsZWQgU0hBMjU2X0NvbXByZXNzX05hdGl2ZSgpLiBUaGlzIHNoYTI1Ni1hcm12OC5jIGNv
ZGUgaXMgaW5jbHVkZWQKPiBpbnNpZGUgYSBVU0VfSFdfU0hBMiBjb25kaXRpb25hbCwgc28gaXQg
aXMgb25seSBjb21waWxlZCBpbiBpZgo+IFVTRV9IV19TSEEyIGlzIGRlZmluZWQuCj4gCj4gc2hh
NTEyLmMsIHdoaWNoIGlzIGFyY2hpdGVjdHVyZS1pbmRlcGVuZGVudCBnZW5lcmljIGNvZGUsIGFs
c28KPiBpbXBsZW1lbnRzIGEgZnVuY3Rpb24gY2FsbGVkIFNIQTI1Nl9Db21wcmVzc19OYXRpdmUo
KS4gSXQgb25seSBkZWZpbmVzCj4gaXQgd2hlbiAhVVNFX0hXX1NIQTIsIHRvIG5vdCBjb25mbGlj
dCB3aXRoIGFyY2hpdGVjdHVyZS1vcHRpbWl6ZWQKPiB2YXJpYW50cy4uLiBidXQgZHVlIHRvIHRo
ZSBidWcgaXQgYWxzbyBkZWZpbmVzIGl0IHdoZW4gIUxJVFRMRV9FTkRJQU4uCj4gVGhpcyBkb2Vz
bid0IG1ha2Ugc2Vuc2UgYmVjYXVzZSB0aGVyZSBpcyBub3RoaW5nIHRoYXQgcHJldmVudHMgdGhl
Cj4gc2hhMjU2LWFybXY4LmMgY29kZSBmcm9tIGJlaW5nIGNvbXBpbGVkIGluIGJpZy1lbmRpYW4g
QWFyY2g2NCwgYW5kIHRoaXMKPiBpc3N1ZSB3YXMgaW50cm9kdWNlZCB3aGVuIHNvbWVvbmUgb3B0
aW1pemVkIHRoZSBzaGEyNTYgY29kZSBmb3IgeDg2LCBhcwo+IHBvaW50ZWQgYnkgRmFicmljZS4K
PiAKPiBTbyBJIGJlbGlldmUgRmFicmljZSdzIHNvbHV0aW9uIGlzIE9LLCBidXQgb2YgY291cnNl
LCB1cHN0cmVhbSB3aWxsCj4gY29uZmlybSAob3Igbm90KS4KCk9rLCBzbyBsZXTigJlzIHdhaXQg
Zm9yIGFuIHVwc3RyZWFtIGFuc3dlciwgaW4gdGhlIG1lYW53aGlsZSBpdCBidWlsZHMgZmluZSBh
bmQgZXZlbnR1YWxseSBpZiBzb21lb25lIGdpdmVzIGl0IGEgdHJ5IG9uIEFhcmNoNjQgQkUgY2Fu
IGZpbGUgYSBidWcgZm9yIGl0IG9yIG5vdC4KClRoYW5rIHlvdQpCZXN0IHJlZ2FyZHMKR2l1bGlv
Cgo+IAo+IFRoYW5rcyEKPiAKPiBUaG9tYXMKPiAtLSAKPiBUaG9tYXMgUGV0YXp6b25pLCBDVE8s
IEJvb3RsaW4KPiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCj4gaHR0cHM6
Ly9ib290bGluLmNvbQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidXN5Ym94Lm5ldAo+
IGh0dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVzeWJveC5uZXQKaHR0cDovL2xpc3RzLmJ1c3lib3gubmV0
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
