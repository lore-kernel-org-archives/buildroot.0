Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FDD1C77B75
	for <buildroot@archiver.kernel.org>; Tue, 18 Apr 2023 21:58:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73A6540060;
	Tue, 18 Apr 2023 21:58:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73A6540060
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IEjRjzmVFhuO; Tue, 18 Apr 2023 21:58:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52655414CA;
	Tue, 18 Apr 2023 21:58:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52655414CA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 400E21BF2FC
 for <buildroot@lists.busybox.net>; Tue, 18 Apr 2023 21:58:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 194EC40160
 for <buildroot@lists.busybox.net>; Tue, 18 Apr 2023 21:58:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 194EC40160
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vuKh0ZNyHkEs for <buildroot@lists.busybox.net>;
 Tue, 18 Apr 2023 21:58:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC3F1400E2
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DC3F1400E2
 for <buildroot@buildroot.org>; Tue, 18 Apr 2023 21:58:25 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id
 5614622812f47-38e465291bbso310726b6e.2
 for <buildroot@buildroot.org>; Tue, 18 Apr 2023 14:58:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681855105; x=1684447105;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xpJbvPTnkz3EZLQiV/+bzEWarLTQQ4Fh3VkgH3JUd7E=;
 b=MVhXopLXZpvmlQBCHwlEyMXflRbkwGCXt2jWWxg5oUMlytXkzigIW0oGOBljlEw5J+
 cciIPmyEOp1XZ6RiMSgu1MeF2aNGGXy5gi+ssuh+I/v9ZuhioRXsDPQU1ybbV19i45Y6
 B4d6c2mgglj4qFDc9ylndlKaorvfqrYaMqR2jk4Vv5DqRQJi4Chj1mya8rZNi3hvVl+7
 yRYuLy2+c5EuOFMrYJKaZAi0yg40Jw49QyFcygz6X1wJIQi/9DFGNvbJGJa6JFI/irfW
 ltqZM90JwC6H/COXV/WW3xjdDuAmSc05HDKl6Ye4T1P24il+RzaTVBiWwvkk2Y4c5Or0
 yMSg==
X-Gm-Message-State: AAQBX9f+PJw11laGo434Ga58YvC7T1HqQmLYZif+ZftMUwOhwXqXeTIM
 1f7Qs/0yo5d+JO+umDcXMBiN4d57gyjnznQcCpT5RY+FolGhkw==
X-Google-Smtp-Source: AKy350Zgr9REcCA17SRyP5A2nj219uidqh323apU14pvqSAmhQfX3sBBaXvN/seRgTH6pIHPdPWEXLhTqfTgNMYXpqc=
X-Received: by 2002:aca:bc0b:0:b0:38b:c1ae:cb0b with SMTP id
 m11-20020acabc0b000000b0038bc1aecb0bmr1068715oif.4.1681855104700; Tue, 18 Apr
 2023 14:58:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220812101718.47491-1-fontaine.fabrice@gmail.com>
 <20230415212933.GU2819@scaer>
 <CADvTj4o4dPhWnKiQ0dvm6cJSqwY+ZtbyE0Gwhh8A5Nc5dKPYOQ@mail.gmail.com>
 <20230416082556.GW2819@scaer> <20230416111659.GY2819@scaer>
 <CADvTj4q-qJ6EiYxOcNfgQRL1q7UPNp9SC7s_CwBVeCk=6PrMqw@mail.gmail.com>
 <20230418174452.GP2819@scaer>
In-Reply-To: <20230418174452.GP2819@scaer>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 18 Apr 2023 15:58:13 -0600
Message-ID: <CADvTj4o9KPC3_knDp4KjKwyyFQZ4HPsbSj4n21dqT6bhtWM9pw@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681855105; x=1684447105;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xpJbvPTnkz3EZLQiV/+bzEWarLTQQ4Fh3VkgH3JUd7E=;
 b=E+sgPz08bQf7HIl4qB5XgvbSuYDWdjujUMdBLAlU64CQmpFW5pTX4fiRBatjCAzHR7
 /Ef/IywI9KVkcagV7T8z0kTvyciOGFXmLW7q5IGzL9Q/X/zOV1IF6OwGnqAf7aL0jbpU
 7z+reqgZTYZx1U0NsBEaqA6FQvx1/fdvyyhyvlwAKWnUZ3/xV8WEqxdMOk6owfellRHb
 JpZDoNgIFGkNoz8JzsaHM+xQNH/KT0UTDd++CdMV9knWfsJ1UXTstgW+KjIGmGo8Zock
 LZ5eVWXIlaTSuNdPrM4N6+gEbxvSBFRxRUBlRI6y4qHvwutgbLAn4EVR7MGR70bDQCyh
 fXag==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=E+sgPz08
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/poppler: fix introspection build
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
Cc: Olivier Schonken <olivier.schonken@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCBBcHIgMTgsIDIwMjMgYXQgMTE6NDTigK9BTSBZYW5uIEUuIE1PUklOIDx5YW5uLm1v
cmluLjE5OThAZnJlZS5mcj4gd3JvdGU6Cj4KPiBKYW1lcywgQWxsLAo+Cj4gT24gMjAyMy0wNC0x
OCAwMjowMyAtMDYwMCwgSmFtZXMgSGlsbGlhcmQgc3Bha2UgdGh1c2x5Ogo+ID4gT24gU3VuLCBB
cHIgMTYsIDIwMjMgYXQgNToxN+KAr0FNIFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9yaW4uMTk5OEBm
cmVlLmZyPiB3cm90ZToKPiA+ID4gT24gMjAyMy0wNC0xNiAxMDoyNSArMDIwMCwgWWFubiBFLiBN
T1JJTiBzcGFrZSB0aHVzbHk6Cj4gPiA+ID4gT24gMjAyMy0wNC0xNSAyMDo0NCAtMDYwMCwgSmFt
ZXMgSGlsbGlhcmQgc3Bha2UgdGh1c2x5Ogo+ID4gPiA+ID4gT24gU2F0LCBBcHIgMTUsIDIwMjMg
YXQgMzozMOKAr1BNIFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPiB3cm90
ZToKPiA+ID4gPiBbLS1TTklQLS1dCj4gPiA+ID4gPiA+IEhvd2V2ZXIsIEkgd291bGQgcmVhbGx5
IGxpa2UgdG8gdW5kZXJzdGFuZCB3aHkgd2UgZG9uJ3QgaGF2ZSBtb3JlCj4gPiA+ID4gPiA+IHBh
Y2thZ2VzIHRoYXQgYXJlIGJyb2tlbi4gSXMgaXQgYmVjYXVzZSBwb3BwbGVyIGlzIHRoZSBvbmx5
IG9uZSB3aXRoCj4gPiA+ID4gPiA+IGluY2x1ZGUgZGlyZWN0aXZlcyBpbiBoaXMgZ2lyIGZpbGUs
IHdoaWNoIG1lYW5zIGl0IG5lZWRzIGFjY2VzcyB0byB0aGUKPiA+ID4gPiA+ID4gaW5zdGFsbGVk
IGdpciBmaWxlcyBmcm9tIG90aGVyIHBhY2thZ2VzICh0aG9zZSBmcm9tIGdvaSk/Cj4gPiA+ID4g
PiA+Cj4gPiA+ID4gPiA+IE9yIGlzIGl0IGJlY2F1c2UgaXQgaXMgdGhlIG9ubHkgb25lIHRoYXQg
YWxyZWFkeSBwYXNzZXMgYW4gZXhwbGljaXQKPiA+ID4gPiA+ID4gLS1pbmNsdWRlZGlyIG9wdGlv
biB0byBnLWlyLWNvbXBpbGVyLCBhbmQgdGhhdCBkaXNhYmxlcyBzZWFyY2hpbmcgdGhlCj4gPiA+
ID4gPiA+IHN0YW5kYXJkIGRpcmVjdG9yeT8KPiA+ID4gPiA+IEZyb20gdGhlIGxvb2tzIG9mIGl0
IG1vc3Qgb2Ygb3VyIHBhY2thZ2VzIHdpdGggYSBnb2JqZWN0LWludHJvc3BlY3Rpb24KPiA+ID4g
PiA+IGRlcGVuZGVuY3kgYXJlIG1lc29uIGJhc2VkIHdoaWNoIHVzZSB0aGUgbmF0aXZlIG1lc29u
IGludGVncmF0aW9uLgo+ID4gPiA+IEFoLCBnb29kIHBvaW50LCB0aGF0IHdvdWxkIGV4cGxhaW4u
Cj4gPiA+IFVuZm9ydHVhbnRlbHksIHRoYXQgYXNzdW1wdGlvbiBpcyB3cm9uZzogZ3Jhbml0ZSB1
c2VzIG1lc29uLCBidXQgZmFpbHMKPiA+ID4gaW4gdGhlIHNhbWUgd2F5Ogo+ID4gV2hpbGUgaXQn
cyB0cnVlIGl0IGRvZXMgdXNlIG1lc29uLi4uaXQgZG9lcyBub3QgaW4gZmFjdCB1c2UgdGhlIG5h
dGl2ZSBtZXNvbgo+ID4gaW50ZWdyYXRpb24gYnV0IHJhdGhlciB1c2VzIGEgcHJvamVjdCBzcGVj
aWZpYyBnb2JqZWN0LWludHJvc3BlY3Rpb24gZ2VuZXJhdG9yOgo+ID4gaHR0cHM6Ly9naXRodWIu
Y29tL2VsZW1lbnRhcnkvZ3Jhbml0ZS9ibG9iLzYuMC4wL2xpYi9tZXNvbi5idWlsZCNMMTAyLUwx
MjEKPgo+IFN1cmUsIGJ1dCB0aGVuIG1heWJlIGl0IGJlZ3MgZm9yIGEgZ2VuZXJpYyBzb2x1dGlv
biwgdGhhdCB3b3JrcyBmb3IgYWxsCj4gcGFja2FnZXM/CgpJIHJlcG9ydGVkIHRoaXMgaXNzdWUg
dXBzdHJlYW0gdG8gZ3Jhbml0ZToKaHR0cHM6Ly9naXRodWIuY29tL2VsZW1lbnRhcnkvZ3Jhbml0
ZS9pc3N1ZXMvNjQ1Cgo+Cj4gTWF5YmUgc29tZXRoaW5nIGxpa2Ugd2UgdXNlZCBHSVJfRVhUUkFf
TElCU19QQVRIIGZyb20gdGhlIGVudmlyb25tZW50LAo+IHdlIGNvdWxkIGFsbG93IHBhY2xhZ2Vz
IHRvIHNwZWNpZnkgYWRkaXRpb25hbCBpbmNsdWRlIGRpcmVjdG9yaWVzIHdpdGgKPiBHSVJfRVhU
UkFfSU5DTFVERV9QQVRIID8KCkknbSBub3QgcmVhbGx5IHN1cmUgaWYgdGhpcyBtYWtlcyBzZW5z
ZSB0byBkbyBmb3IgYWxsIHBhY2thZ2VzIGFzIGl0CmNvdWxkIGhhdmUgc2lkZQplZmZlY3RzIHdo
aWNoIG1heSBpbnRlcmZlcmUgd2l0aCBtZXNvbidzIG5hdGl2ZSBnb2JqZWN0LWludHJvc3BlY3Rp
b24KaW50ZWdyYXRpb24uCgo+Cj4gUmVnYXJkcywKPiBZYW5uIEUuIE1PUklOLgo+Cj4gLS0KPiAu
LS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0t
Li0tLS0tLS0tLS0tLS0tLS0tLS0tLgo+IHwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVt
YmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8Cj4gfCArMzMg
NjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9f
XyAgICAgICAgICAgICAgIHwKPiB8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0t
LS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAo+IHwgaHR0cDovL3lt
b3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNv
bnNwaXJhY3kuICB8Cj4gJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0t
LS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
