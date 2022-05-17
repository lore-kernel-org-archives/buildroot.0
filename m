Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7044EC43219
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 17:08:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF11241937;
	Tue, 17 May 2022 17:08:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gAuJ1sq9tMbL; Tue, 17 May 2022 17:08:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D13741914;
	Tue, 17 May 2022 17:08:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7A2F01BF5E0
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 17:08:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 687C983EEC
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 17:08:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=iki.fi
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4Sw_MLFHHKop for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 17:08:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5AA8483EDF
 for <buildroot@buildroot.org>; Tue, 17 May 2022 17:08:28 +0000 (UTC)
Received: from localhost (91-154-92-55.elisa-laajakaista.fi [91.154.92.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: sakkinen)
 by lahtoruutu.iki.fi (Postfix) with ESMTPSA id A4CF21B00240;
 Tue, 17 May 2022 20:08:24 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu; 
 t=1652807304;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bG80HbxtOY/9DRSJXnfamPJU6Z8gGKHwKvzf5Hapbfw=;
 b=Kb+td/RDy7E1KtlECaqSEfiOxn61v3YitNYyApK2lgIsLFgJG8E0N0BV4jDFWbY2Yqp/gd
 qpU84KLIdon19vugG3TNc8R9u3kA3vdrBN+nZ+nohp/ZQB94WO4JYnHx4zBl+B/EAnQw+E
 /u/RPBkIwZC/IrdR23pKE4inr0LTSNPSwCRY3vLNQw2gM31AiA20++VmEke35pDHn292ky
 F/C7/QvNGeo2/Ez/0bOSS3V3iiwZjsMiWhEmBRuD913oIHS8CYZX7YastuH7gcboMBYK+e
 qd9NbzxUtJmZaIODgyTttquXXVxlz7fTrBqPGDOKlWCeFepUlDm9CSHGraPjMg==
Message-ID: <1332b2a553298d899b231f0cc47de7600a5a4aa5.camel@iki.fi>
From: Jarkko Sakkinen <jarkko.sakkinen@iki.fi>
To: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 17 May 2022 20:06:51 +0300
In-Reply-To: <20220508233809.61d5d2a2@gmx.net>
References: <379b85295cffd8c19ca02051849d946a24a915de.camel@iki.fi>
 <20220508233809.61d5d2a2@gmx.net>
User-Agent: Evolution 3.44.1 
MIME-Version: 1.0
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1652807304; a=rsa-sha256; cv=none;
 b=lmPsKejrbjHqYi9/goVj4XPAWheapFcAEvnsYoqlzRU52xuBpZd981EfXTWPWUmIFWuMlF
 G3boBFjW7uF6PXpH7uSogoWasg+mNYH33n/5fz9Q+YZOiKWlM/quBFA4Y7UHKKEKBDfm6h
 5W0HaLapCdhT/EoZ6tjlswrwxyHBL1kHU4YurE0OBpceaJ3HP2DlOlkEHWhwGmdMDDuN+Y
 EK/3xlZDCIOtBDnuE5YaoCxZu04zUsKYGoL+sp2iFdNgjuLTH29QQqbTxPmCPNQ5N5lebp
 //cNePjR+FeV5Ag6iEb+I9fQ7ETdIVtbeXUnHNCsKXpObHJ+ItBLfNIDx+ptvQ==
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=sakkinen smtp.mailfrom=jarkko.sakkinen@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
 s=lahtoruutu; t=1652807304;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bG80HbxtOY/9DRSJXnfamPJU6Z8gGKHwKvzf5Hapbfw=;
 b=oTdLN8wqRN7fx9fgewMeFukj4w1w2K6fimndA5FPSApuXRI+yQu9JulNWFR/QZdv4ABh6l
 Lr0VEtQ92URPcdW8dUn6bacYd0vEpo802e/4SCU6q6/zoJHQ5UdoZdRET4vnB8yWGzH8L0
 76HB4Jlp1b2Y4eG4OKuDUwsMZjPHP8xYjLW1PYM4zWyfyUZ2EXMP5kn7xVglwOzQZLWAUs
 lk1WL7ahXtqBLIp2Qxq0JDuyRnrR5D4C9rU4dOp4vzNa6CG91ixCO+8NBFz9VTdGiTtf4e
 Mv0QAb5hwUKRJhS00oQlPxsleBL7aI7xaSR0ReQ7Pcpy1n7NMGt4erw/K/wO7A==
Subject: Re: [Buildroot] selftests/sgx
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU3VuLCAyMDIyLTA1LTA4IGF0IDIzOjM4ICswMjAwLCBQZXRlciBTZWlkZXJlciB3cm90ZToK
PiBIZWxsbyBKYXJra28sCj4gCj4gT24gU2F0LCAwNyBNYXkgMjAyMiAyMzowMzo1NyArMDMwMCwg
SmFya2tvIFNha2tpbmVuIDxqYXJra28uc2Fra2luZW5AaWtpLmZpPiB3cm90ZToKPiAKPiA+IEhp
LAo+ID4gCj4gPiBXaGVuIHNwZWNpZnlpbmcgIkJSMl9QQUNLQUdFX0xJTlVYX1RPT0xTX1NFTEZU
RVNUUz15IiwgZm9yIHNvbWUgcmVhc29uCj4gPiB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9zZ3gv
IGJ1aWxkIHJlc3VsdHMsIGkuZS4gInNneDp0ZXN0X3NneCIsIGRvZXMKPiA+IG5vdCBnZXQgaW5j
bHVkZWQgdG8gdGhlIHJvb3RmcyBpbWFnZSwgbm9yIGlzIGl0IGxpc3RlZCBpbsKgCj4gPiBrc2Vs
ZnRlc3QtbGlzdC50eHQuCj4gPiAKPiA+IElmIEkgbWFudWFsbHkgY29tcGlsZSBhbmQgaW5zdGFs
bCBzZWxmdGVzdHMsIGl0IGRvZXMgZ2V0IGluY2x1ZGVkLiBBbnkKPiA+IGlkZWFzIHdoYXQgY291
bGQgYmUgd3Jvbmc/Cj4gCj4gRm9yIHdoaWNoIGFyY2hpdGVjdHVyZSBkbyB5b3UgKGNyb3NzKSBj
b21waWxlICh3aGF0IGlzIHlvdXIgdGFyZ2V0IGFyY2hpdGVjdHVyZSk/Cj4gCj4gQWNjb3JkaW5n
IHRvIGUuZy4gWzFdOgo+IAo+IFsuLi5dCj4gwqAgNyBDQU5fQlVJTERfWDg2XzY0IDo9ICQoc2hl
bGwgLi4veDg2L2NoZWNrX2NjLnNoICQoQ0MpIFwKPiDCoCA4wqDCoCAKPiBbLi4uXQo+IMKgMTkg
VEVTVF9DVVNUT01fUFJPR1MgOj0gJChPVVRQVVQpL3Rlc3Rfc2d4Cj4gwqAyMCAKPiDCoDIxIGlm
ZXEgKCQoQ0FOX0JVSUxEX1g4Nl82NCksIDEpCj4gwqAyMiBhbGw6ICQoVEVTVF9DVVNUT01fUFJP
R1MpICQoT1VUUFVUKS90ZXN0X2VuY2wuZWxmCj4gwqAyMyBlbmRpZgo+IFsuLi5dCgpIaSwKCk15
IGNvbmZpZyBpcyBjb250YWluZWQgZnVsbHkgaGVyZToKCmh0dHBzOi8vZ2l0aHViLmNvbS9qYXJr
a29qcy9idWlsZHJvb3Qtc2d4L2Jsb2IvbWFzdGVyL2NvbmZpZ3Mvc2d4X3g4Nl82NF9kZWZjb25m
aWcKCkFuZCBteSBrZXJuZWwgY29uZmlnIGlzIGhlcmU6CgpodHRwczovL2dpdGh1Yi5jb20vamFy
a2tvanMvYnVpbGRyb290LXNneC9ibG9iL21hc3Rlci9ib2FyZC9zZ3gveDg2XzY0L2xpbnV4LmNv
bmZpZwoKSS5lLiBjYW4gYmUgYnVpbHQgd2l0aCAibWFrZSBzZ3hfeDg2XzY0X2RlZmNvbmZpZyAm
JiBtYWtlIi4KCj4gdGVzdF9zZ3ggaXMgb25seSBjb21waWxlZCBmb3IgeDg2XzY0IChhbmQvb3Ig
Q0FOX0JVSUxEX1g4Nl82NCBpcyB0cnVlKS4uLgo+IAo+IFJlZ2FyZHMsCj4gUGV0ZXIKCkJSLCBK
YXJra28KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
