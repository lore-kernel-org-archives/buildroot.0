Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD2BEEA719A
	for <buildroot@archiver.kernel.org>; Sun, 19 Apr 2026 17:10:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D784640F1B;
	Sun, 19 Apr 2026 17:10:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gFfd220pE8_p; Sun, 19 Apr 2026 17:10:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4741E40F12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776618633;
	bh=EKFQt1HzLMl//QiSoitiK4DEzgHMC6uvK03wL3HtfuA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EQzi7+YqxjkSmOHJfNx8dPnxpetB6yNveNUcHnWCWRhJ2tP9q0U12WNKmyqo5xdP1
	 z/r+iBhlZjbzjDywG6GPrvaAFB1WQkfhBD6M+dj51mSZWL0gPMLIckWim5tg8xIUab
	 4z3p0mlrUfhtVqmwn9ZS/uMv77IYoyJjK//3ut0CiRysl8hg7uXQZMQvkD+rSNg4I4
	 na8jmJC1rA/tbXFO8u0a7G9DJw5YN5ygpoO8wLb3e8HC8lT9u5D9cXW2Ei5UB82sF1
	 fw69RoExbtZcEz62jRDxspi8y0laxGiN04qlzQ/jDjlZIXTeP32/i7M/Cy4kt+3TrQ
	 mWACQzWJJc79A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4741E40F12;
	Sun, 19 Apr 2026 17:10:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 55099259
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 17:10:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 475AC40F12
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 17:10:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rva8AmXO-q_g for <buildroot@buildroot.org>;
 Sun, 19 Apr 2026 17:10:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4D33E40F08
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D33E40F08
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4D33E40F08
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 17:10:31 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 61BF913F8B9;
 Sun, 19 Apr 2026 19:10:27 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 19 Apr 2026 19:10:27 +0200
MIME-Version: 1.0
Date: Sun, 19 Apr 2026 19:10:27 +0200
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org
In-Reply-To: <b51dc808-9b4c-49a8-8e5d-b759f2ddd856@bubu1.eu>
References: <20260418144531.706692-1-ju.o@free.fr>
 <b51dc808-9b4c-49a8-8e5d-b759f2ddd856@bubu1.eu>
User-Agent: Webmail Free/1.6.14
Message-ID: <32a990a972991101fae28210e5d26645@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776618628;
 bh=GLAM9t7HD1vVKkkkPs0Okqr0oo08nnM0u1p9p44q0xs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=emnYgi8ripgRep8rSCd+dXxWQn3Y7e8xmSGsGFxTD3X5oa6gYjldSF/6LUCMbHwmZ
 5p71zvtgEBc2rifkAyvzW9Gu9bNmF8Wzj+LYTFm5dXdJAqMd+fSq+SNEyuIjOn0CZc
 WOO3wz7Cz0hsQ+TfhdumfHuf/PKJaogJ1T52IQjElTb6b1ihfy6Wlm6ccrOHEv/umh
 QF9cU4pCHiinKAVTdH7WbFkgZvkg7pPTLCiM/Q7QSzISPw56ThYzWcYRmT2DC+qBpf
 4MvIhSrwQb64X6IYKKzV1YCHrwNiY0Cz0n+Ox2K8CcOmTK6qCLgWdtENmGOQ9DtrC3
 XEjJ6vch4rKPQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=emnYgi8r
Subject: Re: [Buildroot] [PATCH 1/1] package/libjxl: security bump to
 version 0.11.2
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMTkvMDQvMjAyNiAxNTowNSwgTWFyY3VzIEhvZmZtYW5uIHdyb3RlOgo+IEhpIEp1bGllbiwK
PiAKPiB3aGlsZSB0ZXN0aW5nIHRoaXMgeWVzdGVyZGF5LCBJIG5vdGljZWQgdGhhdCBpbiB0aGUg
aW5pdGlhbCBjb25maWcgSSAKPiB0cmllZCB0aGlzLCB0aGUgYnVpbGQgb2YgaGlnaHdheSBmYWls
ZWQ6Cj4gCj4gQlIyX2FhcmNoNjQ9eQo+IEJSMl9jb3J0ZXhfYTcyPXkKPiBCUjJfQVJNX0ZQVV9W
RlBWND15Cj4gQlIyX1RPT0xDSEFJTl9FWFRFUk5BTD15Cj4gQlIyX1RPT0xDSEFJTl9FWFRFUk5B
TF9CT09UTElOPXkKPiBCUjJfVE9PTENIQUlOX0VYVEVSTkFMX0JPT1RMSU5fQUFSQ0g2NF9HTElC
Q19TVEFCTEU9eQo+IEJSMl9QQUNLQUdFX0xJQkpYTD15Cj4gCj4gVGhlIGVycm9yczoKPiBhYXJj
aDY0LWxpbnV4LWcrKy5icl9yZWFsOiBlcnJvcjogdW5yZWNvZ25pemVkIGNvbW1hbmQtbGluZSBv
cHRpb24gCj4g4oCYLW1mcHU9bmVvbi12ZnB2NOKAmQo+IGFhcmNoNjQtbGludXgtZysrLmJyX3Jl
YWw6IGVycm9yOiB1bnJlY29nbml6ZWQgY29tbWFuZC1saW5lIG9wdGlvbiAKPiDigJgtbWZwdT1u
ZW9uLXZmcHY04oCZCj4gYWFyY2g2NC1saW51eC1nKysuYnJfcmVhbDogZXJyb3I6IHVucmVjb2du
aXplZCBjb21tYW5kLWxpbmUgb3B0aW9uIAo+IOKAmC1tZnB1PW5lb24tdmZwdjTigJkKPiBhYXJj
aDY0LWxpbnV4LWcrKy5icl9yZWFsOiBlcnJvcjogdW5yZWNvZ25pemVkIGNvbW1hbmQtbGluZSBv
cHRpb24gCj4g4oCYLW1mcHU9bmVvbi12ZnB2NOKAmQo+IGFhcmNoNjQtbGludXgtZysrLmJyX3Jl
YWw6IGVycm9yOiB1bnJlY29nbml6ZWQgY29tbWFuZC1saW5lIG9wdGlvbiAKPiDigJgtbWZwdT1u
ZW9uLXZmcHY04oCZCj4gYWFyY2g2NC1saW51eC1nKysuYnJfcmVhbDogZXJyb3I6IHVucmVjb2du
aXplZCBjb21tYW5kLWxpbmUgb3B0aW9uIAo+IOKAmC1tZnB1PW5lb24tdmZwdjTigJkKPiBhYXJj
aDY0LWxpbnV4LWcrKy5icl9yZWFsOiBlcnJvcjogdW5yZWNvZ25pemVkIGNvbW1hbmQtbGluZSBv
cHRpb24gCj4g4oCYLW1mcHU9bmVvbi12ZnB2NOKAmQo+IGFhcmNoNjQtbGludXgtZysrLmJyX3Jl
YWw6IGVycm9yOiB1bnJlY29nbml6ZWQgY29tbWFuZC1saW5lIG9wdGlvbiAKPiDigJgtbWZsb2F0
LWFiaT1oYXJk4oCZCj4gYWFyY2g2NC1saW51eC1nKysuYnJfcmVhbDogZXJyb3I6IHVucmVjb2du
aXplZCBjb21tYW5kLWxpbmUgb3B0aW9uIAo+IOKAmC1tZmxvYXQtYWJpPWhhcmTigJkKPiBhYXJj
aDY0LWxpbnV4LWcrKy5icl9yZWFsOiBlcnJvcjogdW5yZWNvZ25pemVkIGNvbW1hbmQtbGluZSBv
cHRpb24gCj4g4oCYLW1mbG9hdC1hYmk9aGFyZOKAmQo+IGFhcmNoNjQtbGludXgtZysrLmJyX3Jl
YWw6IGVycm9yOiB1bnJlY29nbml6ZWQgY29tbWFuZC1saW5lIG9wdGlvbiAKPiDigJgtbWZsb2F0
LWFiaT1oYXJk4oCZCj4gYWFyY2g2NC1saW51eC1nKysuYnJfcmVhbDogZXJyb3I6IHVucmVjb2du
aXplZCBjb21tYW5kLWxpbmUgb3B0aW9uIAo+IOKAmC1tZmxvYXQtYWJpPWhhcmTigJkKPiBhYXJj
aDY0LWxpbnV4LWcrKy5icl9yZWFsOiBlcnJvcjogdW5yZWNvZ25pemVkIGNvbW1hbmQtbGluZSBv
cHRpb24gCj4g4oCYLW1mbG9hdC1hYmk9aGFyZOKAmQo+IGFhcmNoNjQtbGludXgtZysrLmJyX3Jl
YWw6IGVycm9yOiB1bnJlY29nbml6ZWQgY29tbWFuZC1saW5lIG9wdGlvbiAKPiDigJgtbWZsb2F0
LWFiaT1oYXJk4oCZCj4gYWFyY2g2NC1saW51eC1nKysuYnJfcmVhbDogZXJyb3I6IHVucmVjb2du
aXplZCBjb21tYW5kLWxpbmUgb3B0aW9uIAo+IOKAmC1tZnB1PW5lb24tdmZwdjTigJkKPiBhYXJj
aDY0LWxpbnV4LWcrKy5icl9yZWFsOiBlcnJvcjogdW5yZWNvZ25pemVkIGNvbW1hbmQtbGluZSBv
cHRpb24gCj4g4oCYLW1mcHU9bmVvbi12ZnB2NOKAmQo+IGFhcmNoNjQtbGludXgtZysrLmJyX3Jl
YWw6IGVycm9yOiB1bnJlY29nbml6ZWQgY29tbWFuZC1saW5lIG9wdGlvbiAKPiDigJgtbWZwMTYt
Zm9ybWF0PWllZWXigJkKPiBtYWtlWzNdOiAqKiogW0NNYWtlRmlsZXMvaHd5LmRpci9idWlsZC5t
YWtlOjEyMTogCj4gQ01ha2VGaWxlcy9od3kuZGlyL2h3eS9wZXJfdGFyZ2V0LmNjLm9dIEVycm9y
IDEKPiBtYWtlWzNdOiAqKiogV2FpdGluZyBmb3IgdW5maW5pc2hlZCBqb2JzLi4uLgo+IGFhcmNo
NjQtbGludXgtZysrLmJyX3JlYWw6IGVycm9yOiB1bnJlY29nbml6ZWQgY29tbWFuZC1saW5lIG9w
dGlvbiAKPiDigJgtbWZwMTYtZm9ybWF0PWllZWXigJkKPiBtYWtlWzNdOiAqKiogW0NNYWtlRmls
ZXMvaHd5LmRpci9idWlsZC5tYWtlOjEzNTogCj4gQ01ha2VGaWxlcy9od3kuZGlyL2h3eS9wZXJm
X2NvdW50ZXJzLmNjLm9dIEVycm9yIDEKPiBhYXJjaDY0LWxpbnV4LWcrKy5icl9yZWFsOiBlcnJv
cjogdW5yZWNvZ25pemVkIGNvbW1hbmQtbGluZSBvcHRpb24gCj4g4oCYLW1mcDE2LWZvcm1hdD1p
ZWVl4oCZCj4gYWFyY2g2NC1saW51eC1nKysuYnJfcmVhbDogZXJyb3I6IHVucmVjb2duaXplZCBj
b21tYW5kLWxpbmUgb3B0aW9uIAo+IOKAmC1tZnAxNi1mb3JtYXQ9aWVlZeKAmQo+IG1ha2VbM106
ICoqKiBbQ01ha2VGaWxlcy9od3kuZGlyL2J1aWxkLm1ha2U6MTA3OiAKPiBDTWFrZUZpbGVzL2h3
eS5kaXIvaHd5L25hbm9iZW5jaG1hcmsuY2Mub10gRXJyb3IgMQo+IG1ha2VbM106ICoqKiBbQ01h
a2VGaWxlcy9od3kuZGlyL2J1aWxkLm1ha2U6MTYzOiAKPiBDTWFrZUZpbGVzL2h3eS5kaXIvaHd5
L3Byb2ZpbGVyLmNjLm9dIEVycm9yIDEKPiBhYXJjaDY0LWxpbnV4LWcrKy5icl9yZWFsOiBlcnJv
cjogdW5yZWNvZ25pemVkIGNvbW1hbmQtbGluZSBvcHRpb24gCj4g4oCYLW1mcDE2LWZvcm1hdD1p
ZWVl4oCZCj4gYWFyY2g2NC1saW51eC1nKysuYnJfcmVhbDogZXJyb3I6IHVucmVjb2duaXplZCBj
b21tYW5kLWxpbmUgb3B0aW9uIAo+IOKAmC1tZnAxNi1mb3JtYXQ9aWVlZeKAmQo+IG1ha2VbM106
ICoqKiBbQ01ha2VGaWxlcy9od3kuZGlyL2J1aWxkLm1ha2U6MTQ5OiAKPiBDTWFrZUZpbGVzL2h3
eS5kaXIvaHd5L3ByaW50LmNjLm9dIEVycm9yIDEKPiBtYWtlWzNdOiAqKiogW0NNYWtlRmlsZXMv
aHd5LmRpci9idWlsZC5tYWtlOjc5OiAKPiBDTWFrZUZpbGVzL2h3eS5kaXIvaHd5L2Fib3J0LmNj
Lm9dIEVycm9yIDEKPiBhYXJjaDY0LWxpbnV4LWcrKy5icl9yZWFsOiBlcnJvcjogdW5yZWNvZ25p
emVkIGNvbW1hbmQtbGluZSBvcHRpb24gCj4g4oCYLW1mcDE2LWZvcm1hdD1pZWVl4oCZCj4gbWFr
ZVszXTogKioqIFtDTWFrZUZpbGVzL2h3eS5kaXIvYnVpbGQubWFrZToxOTE6IAo+IENNYWtlRmls
ZXMvaHd5LmRpci9od3kvdGltZXIuY2Mub10gRXJyb3IgMQo+IGFhcmNoNjQtbGludXgtZysrLmJy
X3JlYWw6IGVycm9yOiB1bnJlY29nbml6ZWQgY29tbWFuZC1saW5lIG9wdGlvbiAKPiDigJgtbWZs
b2F0LWFiaT1oYXJk4oCZCj4gYWFyY2g2NC1saW51eC1nKysuYnJfcmVhbDogZXJyb3I6IHVucmVj
b2duaXplZCBjb21tYW5kLWxpbmUgb3B0aW9uIAo+IOKAmC1tZmxvYXQtYWJpPWhhcmTigJkKPiBh
YXJjaDY0LWxpbnV4LWcrKy5icl9yZWFsOiBlcnJvcjogdW5yZWNvZ25pemVkIGNvbW1hbmQtbGlu
ZSBvcHRpb24gCj4g4oCYLW1mcDE2LWZvcm1hdD1pZWVl4oCZCj4gYWFyY2g2NC1saW51eC1nKysu
YnJfcmVhbDogZXJyb3I6IHVucmVjb2duaXplZCBjb21tYW5kLWxpbmUgb3B0aW9uIAo+IOKAmC1t
ZnAxNi1mb3JtYXQ9aWVlZeKAmQo+IG1ha2VbM106ICoqKiBbQ01ha2VGaWxlcy9od3kuZGlyL2J1
aWxkLm1ha2U6OTM6IAo+IENNYWtlRmlsZXMvaHd5LmRpci9od3kvYWxpZ25lZF9hbGxvY2F0b3Iu
Y2Mub10gRXJyb3IgMQo+IG1ha2VbM106ICoqKiBbQ01ha2VGaWxlcy9od3kuZGlyL2J1aWxkLm1h
a2U6MTc3OiAKPiBDTWFrZUZpbGVzL2h3eS5kaXIvaHd5L3RhcmdldHMuY2Mub10gRXJyb3IgMQo+
IG1ha2VbMl06ICoqKiBbQ01ha2VGaWxlcy9NYWtlZmlsZTI6OTM6IENNYWtlRmlsZXMvaHd5LmRp
ci9hbGxdIEVycm9yIDIKPiBtYWtlWzFdOiAqKiogW01ha2VmaWxlOjEzNjogYWxsXSBFcnJvciAy
Cj4gbWFrZVsxXTogTGVhdmluZyBkaXJlY3RvcnkgCj4gJy9ob21lL2J1YnUvcHJvamVjdHMvb3Nz
L2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQvaGlnaHdheS0xLjMuMCcKPiBtYWtlOiAqKiogW3BhY2th
Z2UvcGtnLWdlbmVyaWMubWs6MjczOiAKPiAvaG9tZS9idWJ1L3Byb2plY3RzL29zcy9idWlsZHJv
b3Qvb3V0cHV0L2J1aWxkL2hpZ2h3YXktMS4zLjAvLnN0YW1wX2J1aWx0XSAKPiBFcnJvciAyCj4g
Cj4gCj4gSXQgd29ya3Mgd2hlbiBzZWxlY3RpbmcgYXJtdjgtZnAgaW5zdGVhZCBvZiB2ZnB2NCwg
c28gSSBzdXBwb3NlIGhpZ2h3YXkgCj4gaXMganVzdCBub3QgY29tcGF0aWJsZSB3aXRoIHZmcHY0
PyBJIGNvdWxkbid0IHJlYWxseSBmaW5kIGFueSBkb2NzIAo+IGFib3V0IHRoaXMgdGhvdWdoLiBJ
IHN1cHBvc2Ugd2Ugc2hvdWxkIG1ha2UgaXQgZGVwZW5kIG9uIGFybXY4LWZwIHdoZW4gCj4gYnVp
bGRpbmcgZm9yIGFhcmNoNjQgdGhvdWdoPwoKRm9yIGEgQ29ydGV4LUE3MiwgbmVvbi1mdnB2NCBj
YW4gYmUgdXNlZCBvbmx5IGluIEFhcmNoMzIuIFNlZToKaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxk
cm9vdC5vcmcvYnVpbGRyb290Ly0vYmxvYi8yMDI2LjAyL2FyY2gvQ29uZmlnLmluLmFybT9yZWZf
dHlwZT10YWdzI0wzMTQKVGhpcyBmYWlsdXJlIGhhcHBlbnMgYmVjYXVzZSB0aGlzIGNvbmZpZyBp
cyBpbiBmYWN0IEFhcmNoNjQuCgpJdCBzZWVtcyB0aGF0IHRoZSB0ZXN0IGF0OgpodHRwczovL2dp
dGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9ibG9iLzIwMjYuMDIvcGFja2FnZS9o
aWdod2F5L2hpZ2h3YXkubWsjTDM1CnNob3VsZCBiZSByYXRoZXIgYmUgb24gQlIyX0FSTV9GUFVf
TkVPTl9WRlBWNC4gVGhhdCB3YXksCm9uIEFhcmNoNjQsIGhpZ2h3YXkgd2lsbCBjb25maWd1cmUg
d2l0aCAtREhXWV9DTUFLRV9BUk03PU9GRi4KCkJlc3QgcmVnYXJkcywKCkp1bGllbi4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
