Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0656FC77B7D
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 12:41:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 91ADF4050C;
	Sun,  7 May 2023 12:41:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91ADF4050C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Oe4I2n9xMb6E; Sun,  7 May 2023 12:41:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C7346404FE;
	Sun,  7 May 2023 12:41:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7346404FE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1B25F1BF391
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 12:41:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 01AB881E3C
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 12:41:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01AB881E3C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3a3n5Tio7Wit for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 12:41:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 195CF81BC2
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 195CF81BC2
 for <buildroot@buildroot.org>; Sun,  7 May 2023 12:41:02 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:5f9f:2ea:ec9d:3930])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 5580819F57B;
 Sun,  7 May 2023 14:40:56 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 May 2023 14:40:56 +0200
Date: Sun, 7 May 2023 14:40:56 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Message-ID: <20230507124056.GO252090@scaer>
References: <20230429124731.4014394-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230429124731.4014394-1-j.neuschaefer@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683463259;
 bh=N8eg8jpLCDUdPfXtYiSrbAPy+t4jD44Fww++UCawniQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SxXJevCBhTmQ4ulUnLtdc7jM2m+xVr13hfNdEUaKMXcTX2N6gowjkgeLk4KSjmgzm
 Kww5yN8PeQnRAEEVXZ5s0ctLOX8p9Y95Skx57PsKYa2lFr4bQ+rRUoUKKFsE62RMzO
 Lz4CCRPwM8y5EEIxxcMWoXGTMVuinsXYK467SEZqiR6512gQmHdoD7XNyDQTVHT8lq
 6F8LR2v53ueyjHoERBtTyCq1isVXCd88Z5+ZsrGgyDIh4sh//Tpo1U2E6E2LMQrLX8
 6Et+f14g3WI5yWRlE+Y/aMrZusOZ5hCxybHybMrwpp4gY6PkiwDLpl29jZwEb6Q8ur
 Tg3ykE80nqeBw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SxXJevCB
Subject: Re: [Buildroot] [PATCH] package/micropython: pass $TARGET_LDFLAGS
 to build
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
Cc: Chris Packham <judge.packham@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Sm9uYXRoYW4sIEFsbCwKCk9uIDIwMjMtMDQtMjkgMTQ6NDcgKzAyMDAsIEpvbmF0aGFuIE5ldXNj
aMOkZmVyIHNwYWtlIHRodXNseToKPiBMREZMQUdTIG5lZWQgdG8gYmUgcGFzc2VkIHRvIHRoZSBt
aWNyb3B5dGhvbiBidWlsZCBzeXN0ZW0gdmlhIHRoZQo+IExERkxBR1NfRVhUUkEgdmFyaWFibGUs
IHdoaWNoIHdhcyBzbyBmYXIgbWlzc2luZy4gVGhpcyBwYXRjaCBhZGRzIGl0LgoKSXMgdGhpcyBm
aXhpbmcgYW4gYWN0dWFsIGlzc3VlLCBvciBkaWQgeW91IGp1c3QgaGFwcGVuIHRvIG5vdGljZSBi
eQpjaGFuY2U/Cgo+IFNpZ25lZC1vZmYtYnk6IEpvbmF0aGFuIE5ldXNjaMOkZmVyIDxqLm5ldXNj
aGFlZmVyQGdteC5uZXQ+CgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKUmVnYXJkcywKWWFu
biBFLiBNT1JJTi4KCj4gLS0tCj4gCj4gKHJlc2VuZGluZyBkdWUgdG8gZW1haWwgaXNzdWVzKQo+
IC0tLQo+ICBwYWNrYWdlL21pY3JvcHl0aG9uL21pY3JvcHl0aG9uLm1rIHwgMSArCj4gIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL21pY3Jv
cHl0aG9uL21pY3JvcHl0aG9uLm1rIGIvcGFja2FnZS9taWNyb3B5dGhvbi9taWNyb3B5dGhvbi5t
awo+IGluZGV4IDUxYjQ1ZTVlOTkuLjVmNjg3YzczYjkgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9t
aWNyb3B5dGhvbi9taWNyb3B5dGhvbi5tawo+ICsrKyBiL3BhY2thZ2UvbWljcm9weXRob24vbWlj
cm9weXRob24ubWsKPiBAQCAtMzYsNiArMzYsNyBAQCBNSUNST1BZVEhPTl9NQUtFX09QVFMgKz0g
XAo+ICAJTUlDUk9QWV9QWV9VU1NMPTAgXAo+ICAJQ1JPU1NfQ09NUElMRT0kKFRBUkdFVF9DUk9T
UykgXAo+ICAJQ0ZMQUdTX0VYVFJBPSQoTUlDUk9QWVRIT05fQ0ZMQUdTKSBcCj4gKwlMREZMQUdT
X0VYVFJBPSIkKFRBUkdFVF9MREZMQUdTKSIgXAo+ICAJQ1dBUk49Cj4gCj4gIGRlZmluZSBNSUNS
T1BZVEhPTl9CVUlMRF9DTURTCj4gLS0KPiAyLjM5LjIKPiAKPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0t
LS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlh
bm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVy
aWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVy
IHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkg
NDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJl
IGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhU
TUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0n
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
