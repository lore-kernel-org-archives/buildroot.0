Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE294E9A03B
	for <buildroot@archiver.kernel.org>; Wed, 18 Feb 2026 12:36:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3123A4046D;
	Wed, 18 Feb 2026 12:36:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VLGL3blVJz0T; Wed, 18 Feb 2026 12:36:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48AA940473
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771418179;
	bh=BBZcCa0aChbocMaZ32Js3g2dr3pXIyaqH2BKpCUXSfA=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OEf+AoVDyqs98jns9leGWL6NJ4pkuN8Unz1tTZy4yaOrsuFym5qg8TkcvkJXHhmur
	 erxIKdb4HSXPK3aAC8xxAUv8msfUNFEak9fiTO0q+2WL4L3JwCRodNCqqA+rkF+NS1
	 dEnF+cyJ3GOA1QvWyrN2qcZ8yHtanKx7vNNZ+kJCXVNqVPgCEKuLylg7dLXcaNL5f5
	 rEo05NG2RCk7pCPXxHwkBp/q3+wRcHPAUX8qXtXg3D0j0hOpukYF3IeqYSUPDEjyxp
	 J5iXR71dRHR5GSlKaNj877yYqHbya5wVeb8sxywuZMdKLbLlofXT/6R7G0bfbIMuRz
	 JpJWXgRfe90IA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48AA940473;
	Wed, 18 Feb 2026 12:36:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BDAB1206
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 12:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A30C640063
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 12:36:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SJTjF5SnUky5 for <buildroot@buildroot.org>;
 Wed, 18 Feb 2026 12:36:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=54.36.140.180;
 helo=5.mo533.mail-out.ovh.net; envelope-from=mooz@blockos.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 04A3440022
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04A3440022
Received: from 5.mo533.mail-out.ovh.net (5.mo533.mail-out.ovh.net
 [54.36.140.180])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 04A3440022
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 12:36:15 +0000 (UTC)
Received: from director1.derp.mail-out.ovh.net
 (director1.derp.mail-out.ovh.net [51.68.80.175])
 by mo533.mail-out.ovh.net (Postfix) with ESMTPS id 4fGG884T2zz5wNQ;
 Wed, 18 Feb 2026 12:31:04 +0000 (UTC)
Received: from director1.derp.mail-out.ovh.net
 (director1.derp.mail-out.ovh.net. [127.0.0.1])
 by director1.derp.mail-out.ovh.net (inspect_sender_mail_agent) with SMTP
 for <mooz@blockos.org>; Wed, 18 Feb 2026 12:31:04 +0000 (UTC)
Received: from mta7.priv.ovhmail-u1.ea.mail.ovh.net (unknown [10.110.0.41])
 by director1.derp.mail-out.ovh.net (Postfix) with ESMTPS id 4fGG882jHbz5vcc;
 Wed, 18 Feb 2026 12:31:04 +0000 (UTC)
Received: from mailstore13.priv.ovhmail-u1.ea.mail.ovh.net (unknown
 [10.1.8.13])
 by mta7.priv.ovhmail-u1.ea.mail.ovh.net (Postfix) with ESMTP id D763AB81383;
 Wed, 18 Feb 2026 12:31:03 +0000 (UTC)
Date: Wed, 18 Feb 2026 12:31:02 +0000 (UTC)
From: mooz@blockos.org
To: buildroot@buildroot.org
Cc: Vincent Cruz <mooz@blockos.org>, Vincent Jardin <vjardin@free.fr>
Message-ID: <1702535088.10290909.1771417862953.JavaMail.zimbra@blockos.org>
In-Reply-To: <20260217160154.2037308-1-mooz@blockos.org>
References: <20260118213120.69615-2-vjardin@free.fr>
 <20260217160154.2037308-1-mooz@blockos.org>
MIME-Version: 1.0
X-Originating-IP: [213.36.7.12]
X-Authenticated-User: mooz@blockos.org
Thread-Topic: package/sysrepo: fix build on riscv32
Thread-Index: k4PLKEjQB6hvfVB4pm8RtLTFBIt/3Q==
x-ovh-tracer-id: 12756445946165185301
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTEuVuhSrSRQ+Xsctjc57voI3x4rFSkIuXUl0Gxy1Bfw1C5W5sbYb42YW1yjTNqXzHjBjjBhfUi6Xy+5mZK6rVKI77EOM0I01wJ+pQ2+3ZjgHc82xNizIH9mjcPU4lF2q2ndLSpviZC7ega2ZbjTLGpJ3Gb7dQHAmEklDn+BsUemH2HoCkYgowt3pX3kYOH1Thq9VCPx1Eco+d997EWgCj444Bn1E3i8Il6SW8TFksdDgHuM9mURn3H5oTiHXGBBGCOxpSnITkakX6EGgSq5x6LKkI6zd+tADnjREHo4eVqM62fRLyysansqtfhIL7a1Mq2MoNT6bFabwg6Z7eD/2cGtLENIS6GB29y3LPDRyr+EfJAud+5CEKgxV86AY5gJ6aFCysiyeIt5ATuYbJqKCq5lu+9P3k/v22PgJgWNbnKueUpmY5GruAsWT5jwhdMLctGocurEd3CdCFl9b+HN/aQAg316c6YPRUPCjmZ+w2owHc+iBA2jCKPtmcvvn/yBFHU3w3dy4tA9NpIMw51Q2jk3Ff2hJl+JTmGCOaLMtKM52rY7K2AtfzeRFzTMHOmi6i+fG54edLlLtTsx1STBfHTweAjNyuqP7F47lLaY35tbUCwkTnqpi5ML4EgxvOd4w5dKTEmcduxtHEVljvax6WaWk+K+V6m9i8Lxh7RkLempHQ
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=blockos.org
Subject: Re: [Buildroot] [PATCH v2 1/1] package/sysrepo: fix build on riscv32
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

SGVsbG8sCgogIEkgcmVhbGl6ZWQgdGhhdCBJIHNob3VsZCBoYXZlIHNlbnQgdGhpcyBwYXRjaCBh
cyBhIG5ldyBvbmUgYW5kIG5vdCBhcyBhIHJlcGx5IHRvIGFuIGV4aXN0aW5nIHRocmVhZC4KSSBh
bHNvIGZvcmdvdCB0byBpbmNsdWRlIHRoZSBwYWNrYWdlIGRldmVsb3BlcnMuCgpJIHdpbGwgcmUt
c3VibWl0IHRoaXMgcGF0Y2guCgpTb3JyeSBmb3IgdGhlIGluY29udmVuaWVuY2UuClZpbmNlbnQg
Q3J1egoKLS0tLS1NZXNzYWdlIG9yaWdpbmFsLS0tLS0KRGU6IFZpbmNlbnQgPG1vb3pAYmxvY2tv
cy5vcmc+CsOgOiBidWlsZHJvb3QgPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPgpDYzogVmluY2Vu
dCA8bW9vekBibG9ja29zLm9yZz47IFZpbmNlbnQgPHZqYXJkaW5AZnJlZS5mcj4KRW52b3nDqTog
bWFyZGkgMTcgZsOpdnJpZXIgMjAyNiAxNzowMyBDRVQKU3VqZXQgOiBbUEFUQ0ggdjIgMS8xXSBw
YWNrYWdlL3N5c3JlcG86IGZpeCBidWlsZCBvbiByaXNjdjMyCgoKRml4ZXM6CiAgaHR0cHM6Ly9h
dXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzL2IwZi9iMGYzMGZlZWRkYWQxYThkNTFhYzg3
YWY4YjdjNTZmZDlhOWI1ZmY2L2J1aWxkLWVuZC5sb2cKClVwc3RyZWFtOiBodHRwczovL2dpdGh1
Yi5jb20vc3lzcmVwby9zeXNyZXBvL2NvbW1pdC9hMDY2MWI3ZTZhN2IyZjc4NGZlMzIyMjA0ODA2
NmMzMTE4N2M2ZjkyCgpTaWduZWQtb2ZmLWJ5OiBWaW5jZW50IEphcmRpbiA8dmphcmRpbkBmcmVl
LmZyPgpTaWduZWQtb2ZmLWJ5OiBWaW5jZW50IENydXogPG1vb3pAYmxvY2tvcy5vcmc+Ci0tLQp2
MSAtPiB2MjoKICAgLSBCYWNrcG9ydCB1cHN0cmVhbSBwYXRjaC4KClRlc3RlZCB3aXRoIEJ1aWxk
cm9vdCBnaXRsYWIgQ0k6CiAgaHR0cHM6Ly9naXRsYWIuY29tL3ZfY3ovYnVpbGRyb290Ly0vcGlw
ZWxpbmVzLzIzMzE3MzY3OTUKCiAuLi4tc3JfY29uZF9mdXRleC1vbmx5LWlmLVNZU19mdXRleC1z
eXMucGF0Y2ggfCAzMyArKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMzMgaW5z
ZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2Uvc3lzcmVwby8wMDAxLWNtYWtl
LVVQREFURS11c2Utc3JfY29uZF9mdXRleC1vbmx5LWlmLVNZU19mdXRleC1zeXMucGF0Y2gKCmRp
ZmYgLS1naXQgYS9wYWNrYWdlL3N5c3JlcG8vMDAwMS1jbWFrZS1VUERBVEUtdXNlLXNyX2NvbmRf
ZnV0ZXgtb25seS1pZi1TWVNfZnV0ZXgtc3lzLnBhdGNoIGIvcGFja2FnZS9zeXNyZXBvLzAwMDEt
Y21ha2UtVVBEQVRFLXVzZS1zcl9jb25kX2Z1dGV4LW9ubHktaWYtU1lTX2Z1dGV4LXN5cy5wYXRj
aApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi5kMWQyZWFjNzU4Ci0tLSAv
ZGV2L251bGwKKysrIGIvcGFja2FnZS9zeXNyZXBvLzAwMDEtY21ha2UtVVBEQVRFLXVzZS1zcl9j
b25kX2Z1dGV4LW9ubHktaWYtU1lTX2Z1dGV4LXN5cy5wYXRjaApAQCAtMCwwICsxLDMzIEBACitG
cm9tIDY5MTdlMDBmYjZjOTlhOTdkYWNkYWU3MDQwZTVjNGM1Mzc1MmIxMGYgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tOiBWaW5jZW50IENydXogPG1vb3pAYmxvY2tvcy5vcmc+CitEYXRl
OiBUdWUsIDE3IEZlYiAyMDI2IDE0OjE0OjA2ICswMTAwCitTdWJqZWN0OiBbUEFUQ0ggMS8xXSBj
bWFrZSBVUERBVEUgdXNlIHNyX2NvbmRfZnV0ZXggb25seSBpZiBTWVNfZnV0ZXggc3lzY2FsbAor
IGlzIGF2YWlsYWJsZQorCitTb21lIGFyY2hpdGVjdHVyZXMgKGZvciBleC4gcmlzY3YzMikgbWF5
IG5vdCBzdXBwb3J0IFNZU19mdXRleCBzeXN0ZW0KK2NhbGwsIGV2ZW4gdGhvdWdoIGxpbnV4L2Z1
dGV4LmggaW5jbHVkZSBmaWxlIGlzIHByZXNlbnQuCisKK1Vwc3RyZWFtOiBodHRwczovL2dpdGh1
Yi5jb20vc3lzcmVwby9zeXNyZXBvL2NvbW1pdC9hMDY2MWI3ZTZhN2IyZjc4NGZlMzIyMjA0ODA2
NmMzMTE4N2M2ZjkyCisKK1NpZ25lZC1vZmYtYnk6IFZpbmNlbnQgQ3J1eiA8bW9vekBibG9ja29z
Lm9yZz4KKy0tLQorIENNYWtlTGlzdHMudHh0IHwgMyArKy0KKyAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCisKK2RpZmYgLS1naXQgYS9DTWFrZUxpc3RzLnR4
dCBiL0NNYWtlTGlzdHMudHh0CitpbmRleCA5YjM2ZGU0NC4uZTFiMzljOGMgMTAwNjQ0CistLS0g
YS9DTWFrZUxpc3RzLnR4dAorKysrIGIvQ01ha2VMaXN0cy50eHQKK0BAIC0xNjMsNyArMTYzLDgg
QEAgc2V0KE5BQ01fU1JNT05fREFUQV9QRVJNICI2MDAiIENBQ0hFIFNUUklORyAiTkFDTSBtb2R1
bGVzIGlldGYtbmV0Y29uZi1hY20gYW5kIHMKKyAjIHNyX2NvbmQgaW1wbGVtZW50YXRpb24KKyBp
ZihOT1QgU1JfQ09ORF9JTVBMKQorICAgICBjaGVja19pbmNsdWRlX2ZpbGUoImxpbnV4L2Z1dGV4
LmgiIEhBU19GVVRFWCkKKy0gICAgaWYoSEFTX0ZVVEVYKQorKyAgICBjaGVja19zeW1ib2xfZXhp
c3RzKFNZU19mdXRleCAic3lzL3N5c2NhbGwuaCIgSEFTX1NZU19GVVRFWCkKKysgICAgaWYoSEFT
X0ZVVEVYIEFORCBIQVNfU1lTX0ZVVEVYKQorICAgICAgICAgc2V0KFNSX0NPTkRfSU1QTCAic3Jf
Y29uZF9mdXRleCIpCisgICAgIGVsc2UoKQorICAgICAgICAgc2V0KFNSX0NPTkRfSU1QTCAic3Jf
Y29uZF9wdGhyZWFkIikKKy0tIAorMi41MS4wCisKLS0gCjIuNTEuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
