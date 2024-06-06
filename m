Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DC87C27C65
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 14:21:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6AFD60874;
	Thu,  6 Jun 2024 14:21:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DkC4hnMp24Zu; Thu,  6 Jun 2024 14:21:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89C5A6088B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89C5A6088B;
	Thu,  6 Jun 2024 14:21:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 746411BF588
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 14:21:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6119240153
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 14:21:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nn4h7-FMY9US for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 14:21:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0540740102
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0540740102
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0540740102
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 14:21:29 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id ED59513F8D5;
 Thu,  6 Jun 2024 16:21:21 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 06 Jun 2024 16:21:21 +0200
Date: Thu, 6 Jun 2024 16:21:21 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?B?R2HDq2w=?= PORTAY <gael.portay@rtone.fr>
Message-ID: <ZmHF4fZb6N9kZ8OR@landeda>
References: <20240427020431.415608-1-gael.portay@rtone.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240427020431.415608-1-gael.portay@rtone.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717683687;
 bh=/JwZnJnP3IqfBFNE9WBophhKTfZEU4arRB6tGQXBl9k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ONfQmXnvvRKiwZKNWfeG0UxFyqD+akp0gvapY6e7SvUFJ8a4kTuUJ6ELd0gPk4wIw
 Fn3S5FQQEihdZrDDNa9FX63DDzBJEbcms8n6X4E7IuowRMvBgRMM0yhPZ8eINXr+tK
 33mdH39VrScoLyXHPoL+iqw7KRo5M/wya+JfhVJvpdK/i2KWOKF8AVr+MKIMNknZXJ
 ZwMWiarSmDpNLBg4nLLOQQwXGhPXL6AdVM8gPXflR9fBMArZJHjrUoHPnSaHbUQ93V
 YdH9axpGkmxzfhhWVN7P7xgY1IdR+Gy9qv8LtVPgpUMBOzotw7h7ogc3s1mYDGhx+n
 lAQCeThjzFyDQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ONfQmXnv
Subject: Re: [Buildroot] [RESEND PATCH v3 1/1] configs: add raspberrypi 5
 defconfig
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

R2HDq2wsIEFsbCwKCk9uIDIwMjQtMDQtMjcgMDQ6MDQgKzAyMDAsIEdhw6tsIFBPUlRBWSBzcGFr
ZSB0aHVzbHk6Cj4gVGhpcyBjb25maWd1cmF0aW9uIGJ1aWxkcyBhbiBpbWFnZSBmb3IgdGhlIFJh
c3BiZXJyeVBpIDUuCj4gCj4gQ2M6IEFkYW0gRHVza2V0dCA8YWRhbS5kdXNrZXR0QGFtYXJ1bGFz
b2x1dGlvbnMuY29tPgo+IENjOiBZYW5uIEUuIE1PUklOIDx5YW5uLm1vcmluLjE5OThAZnJlZS5m
cj4KPiBTaWduZWQtb2ZmLWJ5OiBHYcOrbCBQT1JUQVkgPGdhZWwucG9ydGF5QHJ0b25lLmZyPgo+
IC0tLQpbLS1TTklQLS1dCj4gZGlmZiAtLWdpdCBhL2NvbmZpZ3MvcmFzcGJlcnJ5cGk1X2RlZmNv
bmZpZyBiL2NvbmZpZ3MvcmFzcGJlcnJ5cGk1X2RlZmNvbmZpZwo+IG5ldyBmaWxlIG1vZGUgMTAw
NjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uZDA3NjA4MjRiZAo+IC0tLSAvZGV2L251bGwKPiArKysg
Yi9jb25maWdzL3Jhc3BiZXJyeXBpNV9kZWZjb25maWcKPiBAQCAtMCwwICsxLDQ3IEBACj4gK0JS
Ml9hYXJjaDY0PXkKPiArQlIyX2NvcnRleF9hNzZfYTU1PXkKPiArQlIyX0FSTV9GUFVfVkZQVjQ9
eQo+ICsKPiArQlIyX1RPT0xDSEFJTl9CVUlMRFJPT1RfQ1hYPXkKPiArCj4gK0JSMl9TWVNURU1f
REhDUD0iZXRoMCIKPiArCj4gKyMgTGludXggaGVhZGVycyBzYW1lIGFzIGtlcm5lbCwgYSA2LjEg
c2VyaWVzCj4gK0JSMl9QQUNLQUdFX0hPU1RfTElOVVhfSEVBREVSU19DVVNUT01fNl8xPXkKPiAr
Cj4gK0JSMl9MSU5VWF9LRVJORUw9eQo+ICtCUjJfTElOVVhfS0VSTkVMX0NPTkZJR19GUkFHTUVO
VF9GSUxFUz0iYm9hcmQvcmFzcGJlcnJ5cGkvbGludXgtNGstcGFnZS1zaXplLmZyYWdtZW50Igo+
ICtCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9UQVJCQUxMPXkKPiArQlIyX0xJTlVYX0tFUk5FTF9D
VVNUT01fVEFSQkFMTF9MT0NBVElPTj0iJChjYWxsIGdpdGh1YixyYXNwYmVycnlwaSxsaW51eCwx
N2YxMzViNzQyYzRlZGIzNDBhZmIzNjU4NzNjM2E1NzRmN2UxNmNiKS9saW51eC0xN2YxMzViNzQy
YzRlZGIzNDBhZmIzNjU4NzNjM2E1NzRmN2UxNmNiLnRhci5neiIKPiArQlIyX0xJTlVYX0tFUk5F
TF9ERUZDT05GSUc9ImJjbTI3MTIiCj4gKwo+ICsjIEJ1aWxkIHRoZSBEVEIgZnJvbSB0aGUga2Vy
bmVsIHNvdXJjZXMKPiArQlIyX0xJTlVYX0tFUk5FTF9EVFNfU1VQUE9SVD15Cj4gK0JSMl9MSU5V
WF9LRVJORUxfSU5UUkVFX0RUU19OQU1FPSJicm9hZGNvbS9iY20yNzEyLXJwaS01LWIiCj4gKwo+
ICtCUjJfTElOVVhfS0VSTkVMX05FRURTX0hPU1RfT1BFTlNTTD15Cj4gKwo+ICtCUjJfUEFDS0FH
RV9SUElfRklSTVdBUkU9eQo+ICtCUjJfUEFDS0FHRV9SUElfRklSTVdBUkVfQ09ORklHX0ZJTEU9
ImJvYXJkL3Jhc3BiZXJyeXBpNS9jb25maWdfNS50eHQiCj4gK0JSMl9QQUNLQUdFX1JQSV9GSVJN
V0FSRV9DTURMSU5FX0ZJTEU9ImJvYXJkL3Jhc3BiZXJyeXBpNS9jbWRsaW5lXzUudHh0Igo+ICsj
IEJSMl9QQUNLQUdFX1JQSV9GSVJNV0FSRV9JTlNUQUxMX0RUQl9PVkVSTEFZUyBpcyBub3Qgc2V0
Cj4gKwo+ICsjIFJlcXVpcmVkIHRvb2xzIHRvIGNyZWF0ZSB0aGUgU0QgaW1hZ2UKPiArQlIyX1BB
Q0tBR0VfSE9TVF9ET1NGU1RPT0xTPXkKPiArQlIyX1BBQ0tBR0VfSE9TVF9HRU5JTUFHRT15Cj4g
K0JSMl9QQUNLQUdFX0hPU1RfTVRPT0xTPXkKPiArCj4gKyMgRmlsZXN5c3RlbSAvIGltYWdlCj4g
K0JSMl9UQVJHRVRfUk9PVEZTX0VYVDI9eQo+ICtCUjJfVEFSR0VUX1JPT1RGU19FWFQyXzQ9eQo+
ICtCUjJfVEFSR0VUX1JPT1RGU19FWFQyX1NJWkU9IjEyME0iCj4gKyMgQlIyX1RBUkdFVF9ST09U
RlNfVEFSIGlzIG5vdCBzZXQKPiArQlIyX1JPT1RGU19QT1NUX0JVSUxEX1NDUklQVD0iYm9hcmQv
cmFzcGJlcnJ5cGk1L3Bvc3QtYnVpbGQuc2giCj4gK0JSMl9ST09URlNfUE9TVF9JTUFHRV9TQ1JJ
UFQ9ImJvYXJkL3Jhc3BiZXJyeXBpNS9wb3N0LWltYWdlLnNoIgo+ICsKPiArIyBFbmFibGUgY29t
cHJlc3NlZCBrZXJuZWwgbW9kdWxlIHN1cHBvcnQKPiArQlIyX1BBQ0tBR0VfQlVTWUJPWF9TSE9X
X09USEVSUz15Cj4gK0JSMl9QQUNLQUdFX0tNT0RfVE9PTFM9eQo+ICtCUjJfUEFDS0FHRV9YWj15
Cj4gK0JSMl9QQUNLQUdFX0tNT0Q9eQo+ICtCUjJfUEFDS0FHRV9IT1NUX0tNT0RfWFo9eQoKICAg
ICQgLi91dGlscy9kb2NrZXItcnVuIG1ha2UgY2hlY2stcGFja2FnZQogICAgY29uZmlncy9yYXNw
YmVycnlwaTVfZGVmY29uZmlnOjA6IG1pc3NpbmcgQlIyX0RPV05MT0FEX0ZPUkNFX0NIRUNLX0hB
U0hFUwoKU2luY2UgaXQgdXNlcyB0aGUgc2FtZSB2ZXJzaW9ucyBhcyB0aGUgb3RoZXIgUmFzcGJl
cnJ5IFBpIGJvYXJkcywgSSd2ZQplbmFibGVkIGNoZWNraW5nIGhhc2hlcyBhbmQgdXNlZCB0aGUg
ZXhpc3RpbmcgaGFzaCBmaWxlcy4KCkFwcGxpZWQgdG8gbmV4dCwgdGhhbmtzLgoKUmVnYXJkcywK
WWFubiBFLiBNT1JJTi4KCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0t
LS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1P
UklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29u
c3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBD
QU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0t
LS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAg
fAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwg
ICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
Xi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
