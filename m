Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A546C433F5
	for <buildroot@archiver.kernel.org>; Sun, 24 Apr 2022 15:04:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8814E415F0;
	Sun, 24 Apr 2022 15:04:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yWYxbdAjpH7b; Sun, 24 Apr 2022 15:04:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 179E141527;
	Sun, 24 Apr 2022 15:03:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 409421BF841
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 15:03:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3ADAE60F49
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 15:03:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AlBWg1E6aDtK for <buildroot@lists.busybox.net>;
 Sun, 24 Apr 2022 15:03:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3F1C560E7D
 for <buildroot@buildroot.org>; Sun, 24 Apr 2022 15:03:51 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id z19so2464661edx.9
 for <buildroot@buildroot.org>; Sun, 24 Apr 2022 08:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=e6+ZyxPsH6EGOUazkE7A6blv52JLrufV4eRANwxVOo0=;
 b=M1bdqz9ey2HmuKUNZmh5rG4d1rZsaTs7ufpMhZb3eB4FXGiQMt77YuKDFpg2icqYvn
 6AKGRaGWILzSvMoncjEnX9cNMzw59nApzaPFkxE1Tb8HT8wqQ4jDu2LGQ60av77W8Xrg
 jnx/ZJJyGlgt3+Re8Td6q2OkbK9YQkdwQh0hiCT+/fqhsn2OC2q3Tu6vnNtXLxxJgaEq
 e0QvVoT0T7t9gBb41GX5t/eZyme0wQgfbbPQyC0JjAIx2rFu83unA1KZ45a7j/q5q0O5
 oXutGedVZb3lnQzG1rNxSz3SGbmAvtNAQtwtRGWgQKJER8PYkVTJwT52RtFj7HL8VLLv
 Ifxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=e6+ZyxPsH6EGOUazkE7A6blv52JLrufV4eRANwxVOo0=;
 b=vdtttuRtV+ehwo9nYSgQL5+u3VsqZC5sTKWGp80nzvvCVWWCgmqMTBJpT9HsTz/hy1
 ykLsbT3KO13BXylA/gc52LzN0Z+fVY94Dcet2fqbCJjYrLFj0yQNoKCKSb7XS3E5AN6d
 pWl6vZInlHVk+2zKepotsDlcPbRpRzcxxCtwcjGFExKngkIuUNPfBiS39odzNcos9Xlg
 BpGZBaY588F8uaxPSTsWeQam9VW0AwwajwkXV9FekwlMpHj65BIqMOR6+4bP7p8HX0r/
 rnnyIr5JKJNZDkO5dBVPS2bQmVTD8COB7L56DNnXmzKZBNJF56VVYXNLEYUaMZOHmZqU
 5tTA==
X-Gm-Message-State: AOAM533je2gJp+OUmoGUXyu/SJABSCoZ1S/Bws4flZVxDg/XAAMP/vkm
 5lBS5Ax97OCsHYnWek9iFrpWEA==
X-Google-Smtp-Source: ABdhPJyOxXEllwuK+M5i5fJG6cVdKgG4liYjr7gdL+OktmMcwJRdTqO4Ga/d6iYrS7iJaTtQmolaqw==
X-Received: by 2002:aa7:d751:0:b0:425:d38c:41a1 with SMTP id
 a17-20020aa7d751000000b00425d38c41a1mr7506721eds.162.1650812630177; 
 Sun, 24 Apr 2022 08:03:50 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 fq2-20020a1709069d8200b006efdd9baaa7sm2652554ejc.196.2022.04.24.08.03.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Apr 2022 08:03:49 -0700 (PDT)
Message-ID: <dc26f0ab-bf60-2c3b-6f79-f6c816cc3bec@mind.be>
Date: Sun, 24 Apr 2022 17:03:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220416211323.3200669-1-fontaine.fabrice@gmail.com>
 <8e85d9ce-f8d9-6f76-37f2-664b9c0db08a@mind.be>
 <CAPi7W83CD7gBa+ZY5vTBOfeq7MMhZPqkrYLY6=dpqcP9_ikMmA@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CAPi7W83CD7gBa+ZY5vTBOfeq7MMhZPqkrYLY6=dpqcP9_ikMmA@mail.gmail.com>
Subject: [Buildroot] Removing BR2_SHARED_STATIC_LIBS [was: [PATCH 1/1]
 package/pkgconf: fix BR2_SHARED_STATIC_LIBS build]
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Thomas De Schampheleire <patrickdepinguin@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 =?UTF-8?Q?J=c3=b6rg_Krause?= <joerg.krause@embedded.rocks>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>,
 Romain Naour <romain.naour@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, Adam Duskett <aduskett@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyMy8wNC8yMDIyIDE4OjQ5LCBGYWJyaWNlIEZvbnRhaW5lIHdyb3RlOgo+IExlIHNhbS4g
MjMgYXZyLiAyMDIyIMOgIDE2OjQwLCBBcm5vdXQgVmFuZGVjYXBwZWxsZSA8YXJub3V0QG1pbmQu
YmU+IGEgw6ljcml0IDoKPj4KPj4KPj4KPj4gT24gMTYvMDQvMjAyMiAyMzoxMywgRmFicmljZSBG
b250YWluZSB3cm90ZToKPj4+IEFkZCAtLXN0YXRpYyB3aGVuIGNhbGxpbmcgcGtnLWNvbmZpZyB3
aXRoIEJSMl9TSEFSRURfU1RBVElDX0xJQlMgdG8KPj4+IGF2b2lkIHRoZSBmb2xsb3dpbmcgYnVp
bGQgZmFpbHVyZSBpZiBhIHBhY2thZ2UgKGUuZy4gZGFzaCBvciB6YWJiaXgpCj4+PiBkZWNpZGUg
dG8gdXNlIHRoZSBzdGF0aWMgbGlicmFyeSBvZiBvZiBpdHMgZGVwZW5kZW5jeSBpbnN0ZWFkIG9m
IHRoZQo+Pj4gc2hhcmVkIGxpYnJhcnkgKGUuZy4gZWRpdCBvciBvcGVuc3NsKSByZXN1bHRpbmcg
aW4gdGhlIGZvbGxvd2luZyBidWlsZAo+Pj4gZmFpbHVyZXM6CltzbmlwXQo+Pj4gLWlmZXEgKCQo
QlIyX1NUQVRJQ19MSUJTKSx5KQo+Pj4gLUhPU1RfUEtHQ09ORl9QT1NUX0lOU1RBTExfSE9PS1Mg
Kz0gSE9TVF9QS0dDT05GX1NUQVRJQwo+Pj4gLWVsc2UKPj4+ICtpZmVxICgkKEJSMl9TSEFSRURf
TElCUykseSkKPj4+ICAgIEhPU1RfUEtHQ09ORl9QT1NUX0lOU1RBTExfSE9PS1MgKz0gSE9TVF9Q
S0dDT05GX1NIQVJFRAo+Pj4gK2Vsc2UKPj4+ICtIT1NUX1BLR0NPTkZfUE9TVF9JTlNUQUxMX0hP
T0tTICs9IEhPU1RfUEtHQ09ORl9TVEFUSUMKPj4KPj4gICAgRXJyLCBzbyB0aGlzIHdvdWxkIG1l
YW4gdGhhdCB3ZSBhbG1vc3QgYWx3YXlzIGxpbmsgc3RhdGljYWxseSBpbiB0aGUKPj4gU0hBUkVE
X1NUQVRJQyBjYXNlPyBJIGRvbid0IHRoaW5rIHRoYXQgdGhhdCdzIHdoYXQgd2Ugd2FudCwgcmVh
bGx5Li4uCj4+Cj4+ICAgIElmIGEgcGFja2FnZSB3YW50cyB0byBsaW5rIHN0YXRpY2FsbHkgYW5k
IGlzIHVzaW5nIHBrZy1jb25maWcsIHdoeSBpcyBub3QKPj4gY2FsbGluZyBwa2ctY29uZmlnIHdp
dGggLS1zdGF0aWM/IFNvbWV0aGluZyBzZWVtcyB0byBiZSByZWFsbHkgb2ZmIGhlcmUuLi4KPiAK
PiBUbyBteSBrbm93bGVkZ2UgbW9zdCBwYWNrYWdlcyBhcmUgbm90IGFkZGluZyAtLXN0YXRpYyB3
aGVuIGNhbGxpbmcgcGtnLWNvbmZpZy4KPiAtLXN0YXRpYyBpcyBhZGRlZCBieSBidWlsZHJvb3Qg
dGhyb3VnaCBIT1NUX1BLR0NPTkZfUE9TVF9JTlNUQUxMX0hPT0tTLgo+IAo+IGRhc2ggZmFpbHMg
dG8gYnVpbGQgYmVjYXVzZSAtc3RhdGljIGlzIHBhc3NlZCB0byBnY2MuCj4gLXN0YXRpYyBpcyBw
YXNzZWQgdG8gZ2NjIGJlY2F1c2UgcGFja2FnZS9NYWtlZmlsZS5pbiBpcyBzZXR0aW5nCj4gLS1l
bmFibGUtc3RhdGljIChhbmQgLS1lbmFibGUtc2hhcmVkKToKPiAKPiAvaG9tZS9mYWJyaWNlL2J1
aWxkcm9vdC9vdXRwdXQvaG9zdC9iaW4vcG93ZXJwYzY0LWJ1aWxkcm9vdC1saW51eC1nbnUtZ2Nj
Cj4gLVdhbGwgLURfTEFSR0VGSUxFX1NPVVJDRSAtRF9MQVJHRUZJTEU2NF9TT1VSQ0UgLURfRklM
RV9PRkZTRVRfQklUUz02NAo+ICAgLU8xIC1nMCAtRF9GT1JUSUZZX1NPVVJDRT0xICAtc3RhdGlj
IC1XbCwtLWZhdGFsLXdhcm5pbmdzIC1vIGRhc2gKPiBhbGlhcy5vIGFyaXRoX3lhY2MubyBhcml0
aF95eWxleC5vIGNkLm8gZXJyb3IubyBldmFsLm8gZXhlYy5vIGV4cGFuZC5vCj4gaGlzdGVkaXQu
byBpbnB1dC5vIGpvYnMubyBtYWlsLm8gbWFpbi5vIG1lbWFsbG9jLm8gbWlzY2JsdGluLm8KPiBt
eXN0cmluZy5vIG9wdGlvbnMubyBwYXJzZXIubyByZWRpci5vIHNob3cubyB0cmFwLm8gb3V0cHV0
Lm8KPiBibHRpbi9wcmludGYubyBzeXN0ZW0ubyBibHRpbi90ZXN0Lm8gYmx0aW4vdGltZXMubyB2
YXIubyBidWlsdGlucy5vCj4gaW5pdC5vIG5vZGVzLm8gc2lnbmFtZXMubyBzeW50YXgubyAtbGVk
aXQKPiAvaG9tZS9mYWJyaWNlL2J1aWxkcm9vdC9vdXRwdXQvaG9zdC9saWIvZ2NjL3Bvd2VycGM2
NC1idWlsZHJvb3QtbGludXgtZ251LzEwLjMuMC8uLi8uLi8uLi8uLi9wb3dlcnBjNjQtYnVpbGRy
b290LWxpbnV4LWdudS9iaW4vbGQ6Cj4gL2hvbWUvZmFicmljZS9idWlsZHJvb3Qvb3V0cHV0L2hv
c3QvcG93ZXJwYzY0LWJ1aWxkcm9vdC1saW51eC1nbnUvc3lzcm9vdC91c3IvbGliLy4uL2xpYjY0
L2xpYmVkaXQuYSh0ZXJtaW5hbC5vKToKPiBpbiBmdW5jdGlvbiBgdGVybWluYWxfdHB1dHMnOgo+
IHRlcm1pbmFsLmM6KC50ZXh0KzB4MWQ0KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgdHB1dHMn
Cj4gCj4gZGFzaCBkb2Vzbid0IG5vdCBoYW5kbGUgLS1lbmFibGUtc2hhcmVkLgo+IEl0IGFkZHMg
LXN0YXRpYyB0byBnY2MgY2FsbCBkZXBlbmRpbmcgb24gLS17ZW4sZGlzfWFibGUtc3RhdGljLgo+
IAo+IFNvLCB0aGUgJ29ubHl5JyBvdGhlciBvcHRpb24gd291bGQgYmUgdG8gYWRkCj4gREFTSF9D
T05GX09QVFMgKz0gLS1kaXNhYmxlLXN0YXRpYwo+IHRvIG92ZXJyaWRlIHdoYXQgaXMgc2V0IGJ5
IHBhY2thZ2UvTWFrZWZpbGUuaW4KCiAgVGhpcyBpcyB3aGF0IHdhcyBkb25lIGZvciBkcm9wYmVh
ciA0IHllYXJzIGFnbyBpbiBjb21taXQgYzk5MjJhNGQyZmM3OWUuCgoKPiBJIGNhbiBzZW5kIGEg
djIgaWYgeW91IHRoaW5rIHRoYXQgdGhpcyBzb2x1dGlvbiBpcyBiZXR0ZXIuCj4gSG93ZXZlciwg
aXQnbGwgaGF2ZSB0byBiZSBhcHBsaWVkIHRvIGRhc2ggYW5kIHphYmJpeCBidXQgcGVyaGFwcyB0
byBhCj4gbGFyZ2UgbnVtYmVyIG9mICJhcHBsaWNhdGlvbiIgcGFja2FnZXMgLi4uCgoKICBWZXJ5
IGdvb2QgcG9pbnQuCgogIEkgdGhpbmsgcGVyaGFwcyB3ZSBzaG91bGQgc2ltcGx5IHJlbW92ZSBC
UjJfU0hBUkVEX1NUQVRJQyBjb21wbGV0ZWx5LiBUaGUgaWRlYSAKaXMgdG8gYnVpbGQgYm90aCBz
dGF0aWMgYW5kIHNoYXJlZCBsaWJyYXJpZXMsIGJ1dCBsaW5rIHdpdGggc2hhcmVkIGxpYnJhcmll
cyBieSAKZGVmYXVsdC4gSG93ZXZlciwgaXQgdHVybnMgb3V0IG5vdCB0byBiZSB3b3JraW5nOiBj
bWFrZSBhbmQgbWVzb24gcGFja2FnZXMgZG9uJ3QgCnN1cHBvcnQgaXQsIGZvciBhbGwgdGhlIG5v
bi1DIGxhbmd1YWdlcyBpdCdzIG5vdCByZWxldmFudCwgYW5kIGV2ZW4gZm9yIAphdXRvdG9vbHMg
cGFja2FnZXMgaXQgZG9lc24ndCB3b3JrIGNvbnNpc3RlbnRseSwgYXMgc2hvd24gYnkgdGhlc2Ug
aXNzdWVzLiBTbyBJIAp0aGluayB0aGlzIG9wdGlvbiBpcyBqdXN0IGNyZWF0aW5nIHByb2JsZW1z
IGZvciB1cyB3aXRob3V0IGFkZGVkIHZhbHVlLgoKICBJJ3ZlIHB1dCBhIGJ1bmNoIG9mIG90aGVy
IEJ1aWxkcm9vdCBjb250cmlidXRvcnMgaW4gQ2MgdG8gd2VpZ2ggaW4gaW4gdGhpcyAKcXVlc3Rp
b24uIEJ1dCBmb3IgbWUsIGl0IGlzIGNyZWF0aW5nIHByb2JsZW1zIHdpdGhvdXQgYWRkaW5nIG11
Y2ggdmFsdWUuCgoKICBSZWdhcmRzLAogIEFybm91dAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
