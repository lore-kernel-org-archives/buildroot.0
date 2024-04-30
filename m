Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDEC9C4345F
	for <buildroot@archiver.kernel.org>; Tue, 30 Apr 2024 18:01:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CDC681852;
	Tue, 30 Apr 2024 18:01:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s5aQPhqdAKNK; Tue, 30 Apr 2024 18:01:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D2A88188D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D2A88188D;
	Tue, 30 Apr 2024 18:01:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1DEF81BF34B
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 18:01:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 09D688188D
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 18:01:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TkaI6gOVBTqT for <buildroot@lists.busybox.net>;
 Tue, 30 Apr 2024 18:01:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 51F6781852
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51F6781852
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 51F6781852
 for <buildroot@buildroot.org>; Tue, 30 Apr 2024 18:01:16 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id BACF613FA38;
 Tue, 30 Apr 2024 20:01:10 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 30 Apr 2024 20:01:10 +0200
Date: Tue, 30 Apr 2024 20:01:10 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Robert Marko <robimarko@gmail.com>
Message-ID: <ZjEx5n1J7XH2Or2Q@landeda>
References: <20240408211609.2423619-1-robimarko@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240408211609.2423619-1-robimarko@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1714500073;
 bh=JqETdaXsQdZDDFI80Snvk12GlMUk9tffhM4Ymvdzw40=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o0p69lxWzZUvphaGz4BkRT3RfazFZOzHnox7jZ0/0XOAWSqUDXNzG35YVfPE1EyGN
 i7W21wuY1MDP/KzXqcCkksFNY6IDqlIVW3QkU11fGXADnzrjPhcxaNx9LZBiHAzv2+
 CqtSHdC8owBHk/+lvkuLtpHzVXTt9A1E/c7EvOdVQiiNCsf/CCofKu0zdg33+coiWU
 gUUUfPqsohKk0HKL14jMsWaEwQU6/HpoSw3hfhJM/A5jy3rLuKl9mPwRBDafukbDzL
 1lnSY3duV3u8Ubw6/TYQ/buHvO96MG7Y67AmFeDKf/2IgYg6tzHQ4rSuiO6iEPqL4Z
 ESdsQyo4Hy1bw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=o0p69lxW
Subject: Re: [Buildroot] [PATCH v2 1/1] kconfig/lxdialog: fix check() with
 GCC14
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
Cc: Petr Vorel <petr.vorel@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Um9iZXJ0LCBBbGwsCgpPbiAyMDI0LTA0LTA4IDIzOjE2ICswMjAwLCBSb2JlcnQgTWFya28gc3Bh
a2UgdGh1c2x5Ogo+IEdDQzE0IG5vdyB0cmVhdHMgaW1wbGljaXQgaW50IHR5cGVzIGFzIGVycm9y
IHNvIHdoZW4gY2hlY2soKSBmcm9tCj4gY2hlY2stbHhkaWFsb2cuc2ggaXMgY2FsbGVkIHRvIGNo
ZWNrIHdoZXRoZXIgd2UgY2FuIGxpbmsgYWdhaW5zdCBuY3Vyc2VzCj4gaXQgd2lsbCBmYWlsIHNp
bGVudGx5IGFuZCB0aGUgaGVscCB0ZXh0IGluZGljYXRpbmcgdG8gaW5zdGFsbCBuY3Vyc2VzIGlz
Cj4gcHJpbnRlZC4KPiAKPiBIb3dldmVyLCB0aGlzIGlzIG5vdCBkdWUgdG8gbWlzc2luZyBuY3Vy
c2VzIGJ1dCBvbmNlIHRoZSBzdGRlcnIgcmVkaXJlY3QKPiB0byAvZGV2L251bGwgaXMgcmVtb3Zl
ZCB3ZSBjYW4gc2VlIHRoZSByb290IGNhdXNlOgo+IDxzdGRpbj46MjoxOiBlcnJvcjogcmV0dXJu
IHR5cGUgZGVmYXVsdHMgdG8g4oCYaW504oCZIFstV2ltcGxpY2l0LWludF0KPiAKPiBTbywgaW4g
b3JkZXIgZm9yIG1lbnVjb25maWcgdG8gd29yayB3aXRoIEdDQzE0IGxldHMganVzdCBzcGVjaWZ5
IHRoZQo+IHJldHVybiB0eXBlIG9mIG1haW4oKSBhcyBpbnQuCgpJJ3ZlIGFsc28gYWRkZWQgYSBs
aXR0bGUgbm90ZSB0aGF0IHRoZXJlIGlzIG5vIGNvbW1pdCBmcm9tIHRoZSBrZXJuZWwKdHJlZSB0
aGF0IHdlIGNhbiBiYWNrcG9ydCwgYmVjYXVzZSB0aGUga2VybmVsIHRyZWUgbm8gbG9uZ2VyIGhh
cyB0aGF0CnNjcmlwdC4KCj4gU2lnbmVkLW9mZi1ieTogUm9iZXJ0IE1hcmtvIDxyb2JpbWFya29A
Z21haWwuY29tPgo+IFJldmlld2VkLWJ5OiBQZXRyIFZvcmVsIDxwZXRyLnZvcmVsQGdtYWlsLmNv
bT4KPiBUZXN0ZWQtYnk6IFBldHIgVm9yZWwgPHBldHIudm9yZWxAZ21haWwuY29tPgoKQXBwbGll
ZCB0byBtYXN0ZXIgd2l0aCB0aGUgbGl0dGxlIG5vdGUgYWJvdXZlIGFkZGVkLCB0aGFua3MuCgpS
ZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKPiAtLS0KPiAgc3VwcG9ydC9rY29uZmlnL2x4ZGlhbG9n
L2NoZWNrLWx4ZGlhbG9nLnNoICAgIHwgIDIgKy0KPiAgLi4uY29uZmlnLWx4ZGlhbG9nLWZpeC1j
aGVjay13aXRoLUdDQzE0LnBhdGNoIHwgNDMgKysrKysrKysrKysrKysrKysrKwo+ICBzdXBwb3J0
L2tjb25maWcvcGF0Y2hlcy9zZXJpZXMgICAgICAgICAgICAgICAgfCAgMSArCj4gIDMgZmlsZXMg
Y2hhbmdlZCwgNDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ICBjcmVhdGUgbW9kZSAx
MDA2NDQgc3VwcG9ydC9rY29uZmlnL3BhdGNoZXMvMjIta2NvbmZpZy1seGRpYWxvZy1maXgtY2hl
Y2std2l0aC1HQ0MxNC5wYXRjaAo+IAo+IGRpZmYgLS1naXQgYS9zdXBwb3J0L2tjb25maWcvbHhk
aWFsb2cvY2hlY2stbHhkaWFsb2cuc2ggYi9zdXBwb3J0L2tjb25maWcvbHhkaWFsb2cvY2hlY2st
bHhkaWFsb2cuc2gKPiBpbmRleCAxNmNkOWEzMTg2Li4yN2Q2YzMwYTU3IDEwMDc1NQo+IC0tLSBh
L3N1cHBvcnQva2NvbmZpZy9seGRpYWxvZy9jaGVjay1seGRpYWxvZy5zaAo+ICsrKyBiL3N1cHBv
cnQva2NvbmZpZy9seGRpYWxvZy9jaGVjay1seGRpYWxvZy5zaAo+IEBAIC00OCw3ICs0OCw3IEBA
IHRyYXAgInJtIC1mICR0bXAiIDAgMSAyIDMgMTUKPiAgY2hlY2soKSB7Cj4gICAgICAgICAgJGNj
IC14IGMgLSAtbyAkdG1wIDI+L2Rldi9udWxsIDw8J0VPRicKPiAgI2luY2x1ZGUgQ1VSU0VTX0xP
Qwo+IC1tYWluKCkge30KPiAraW50IG1haW4oKSB7fQo+ICBFT0YKPiAgCWlmIFsgJD8gIT0gMCBd
OyB0aGVuCj4gIAkgICAgZWNobyAiICoqKiBVbmFibGUgdG8gZmluZCB0aGUgbmN1cnNlcyBsaWJy
YXJpZXMgb3IgdGhlIiAgICAgICAxPiYyCj4gZGlmZiAtLWdpdCBhL3N1cHBvcnQva2NvbmZpZy9w
YXRjaGVzLzIyLWtjb25maWctbHhkaWFsb2ctZml4LWNoZWNrLXdpdGgtR0NDMTQucGF0Y2ggYi9z
dXBwb3J0L2tjb25maWcvcGF0Y2hlcy8yMi1rY29uZmlnLWx4ZGlhbG9nLWZpeC1jaGVjay13aXRo
LUdDQzE0LnBhdGNoCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi40
MTA4MWJiNDVkCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3N1cHBvcnQva2NvbmZpZy9wYXRjaGVz
LzIyLWtjb25maWctbHhkaWFsb2ctZml4LWNoZWNrLXdpdGgtR0NDMTQucGF0Y2gKPiBAQCAtMCww
ICsxLDQzIEBACj4gK0Zyb20gM2FlOTEzMzdiNTNmYTNjY2YwYmFkN2YxODFmY2FmNDgzZmFiMjJl
ZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiArRnJvbTogUm9iZXJ0IE1hcmtvIDxyb2JpbWFy
a29AZ21haWwuY29tPgo+ICtEYXRlOiBXZWQsIDMgQXByIDIwMjQgMTQ6MTg6MDcgKzAyMDAKPiAr
U3ViamVjdDogW1BBVENIXSBrY29uZmlnL2x4ZGlhbG9nOiBmaXggY2hlY2soKSB3aXRoIEdDQzE0
Cj4gK01JTUUtVmVyc2lvbjogMS4wCj4gK0NvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNl
dD1VVEYtOAo+ICtDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0Cj4gKwo+ICtHQ0MxNCBu
b3cgdHJlYXRzIGltcGxpY2l0IGludCB0eXBlcyBhcyBlcnJvciBzbyB3aGVuIGNoZWNrKCkgZnJv
bQo+ICtjaGVjay1seGRpYWxvZy5zaCBpcyBjYWxsZWQgdG8gY2hlY2sgd2hldGhlciB3ZSBjYW4g
bGluayBhZ2FpbnN0IG5jdXJzZXMKPiAraXQgd2lsbCBmYWlsIHNpbGVudGx5IGFuZCB0aGUgaGVs
cCB0ZXh0IGluZGljYXRpbmcgdG8gaW5zdGFsbCBuY3Vyc2VzIGlzCj4gK3ByaW50ZWQuCj4gKwo+
ICtIb3dldmVyLCB0aGlzIGlzIG5vdCBkdWUgdG8gbWlzc2luZyBuY3Vyc2VzIGJ1dCBvbmNlIHRo
ZSBzdGRlcnIgcmVkaXJlY3QKPiArdG8gL2Rldi9udWxsIGlzIHJlbW92ZWQgd2UgY2FuIHNlZSB0
aGUgcm9vdCBjYXVzZToKPiArPHN0ZGluPjoyOjE6IGVycm9yOiByZXR1cm4gdHlwZSBkZWZhdWx0
cyB0byDigJhpbnTigJkgWy1XaW1wbGljaXQtaW50XQo+ICsKPiArU28sIGluIG9yZGVyIGZvciBt
ZW51Y29uZmlnIHRvIHdvcmsgd2l0aCBHQ0MxNCBsZXRzIGp1c3Qgc3BlY2lmeSB0aGUKPiArcmV0
dXJuIHR5cGUgb2YgbWFpbigpIGFzIGludC4KPiArCj4gK1NpZ25lZC1vZmYtYnk6IFJvYmVydCBN
YXJrbyA8cm9iaW1hcmtvQGdtYWlsLmNvbT4KPiArUmV2aWV3ZWQtYnk6IFBldHIgVm9yZWwgPHBl
dHIudm9yZWxAZ21haWwuY29tPgo+ICtUZXN0ZWQtYnk6IFBldHIgVm9yZWwgPHBldHIudm9yZWxA
Z21haWwuY29tPgo+ICstLS0KPiArIGtjb25maWcvbHhkaWFsb2cvY2hlY2stbHhkaWFsb2cuc2gg
fCAyICstCj4gKyAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
PiArCj4gK2RpZmYgLS1naXQgYS9rY29uZmlnL2x4ZGlhbG9nL2NoZWNrLWx4ZGlhbG9nLnNoIGIv
a2NvbmZpZy9seGRpYWxvZy9jaGVjay1seGRpYWxvZy5zaAo+ICtpbmRleCAxNmNkOWEzMTg2Li4y
N2Q2YzMwYTU3IDEwMDc1NQo+ICstLS0gYS9rY29uZmlnL2x4ZGlhbG9nL2NoZWNrLWx4ZGlhbG9n
LnNoCj4gKysrKyBiL2tjb25maWcvbHhkaWFsb2cvY2hlY2stbHhkaWFsb2cuc2gKPiArQEAgLTQ4
LDcgKzQ4LDcgQEAgdHJhcCAicm0gLWYgJHRtcCIgMCAxIDIgMyAxNQo+ICsgY2hlY2soKSB7Cj4g
KyAgICAgICAgICRjYyAteCBjIC0gLW8gJHRtcCAyPi9kZXYvbnVsbCA8PCdFT0YnCj4gKyAjaW5j
bHVkZSBDVVJTRVNfTE9DCj4gKy1tYWluKCkge30KPiArK2ludCBtYWluKCkge30KPiArIEVPRgo+
ICsgCWlmIFsgJD8gIT0gMCBdOyB0aGVuCj4gKyAJICAgIGVjaG8gIiAqKiogVW5hYmxlIHRvIGZp
bmQgdGhlIG5jdXJzZXMgbGlicmFyaWVzIG9yIHRoZSIgICAgICAgMT4mMgo+ICstLSAKPiArMi40
NC4wCj4gKwo+IGRpZmYgLS1naXQgYS9zdXBwb3J0L2tjb25maWcvcGF0Y2hlcy9zZXJpZXMgYi9z
dXBwb3J0L2tjb25maWcvcGF0Y2hlcy9zZXJpZXMKPiBpbmRleCBlNWE2ZjY5ZDhmLi5mMTIwZTMy
M2I3IDEwMDY0NAo+IC0tLSBhL3N1cHBvcnQva2NvbmZpZy9wYXRjaGVzL3Nlcmllcwo+ICsrKyBi
L3N1cHBvcnQva2NvbmZpZy9wYXRjaGVzL3Nlcmllcwo+IEBAIC0xMCwzICsxMCw0IEBACj4gIDE5
LW1lcmdlX2NvbmZpZy5zaC1hZGQtYnIyLWV4dGVybmFsLXN1cHBvcnQucGF0Y2gKPiAgMjAtbWVy
Z2VfY29uZmlnLnNoLUFsbG93LXRvLWRlZmluZS1jb25maWctcHJlZml4LnBhdGNoCj4gIDIxLUF2
b2lkLWZhbHNlLXBvc2l0aXZlLW1hdGNoZXMtZnJvbS1jb21tZW50LWxpbmVzLnBhdGNoCj4gKzIy
LWtjb25maWctbHhkaWFsb2ctZml4LWNoZWNrLXdpdGgtR0NDMTQucGF0Y2gKPiAtLSAKPiAyLjQ0
LjAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKLS0gCi4t
LS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0u
LS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVk
ZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAz
NzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAg
ICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFgg
IEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1h
LWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3ku
ICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0t
LS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
