Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 818D4C433F5
	for <buildroot@archiver.kernel.org>; Fri, 10 Dec 2021 14:54:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 395AD61454;
	Fri, 10 Dec 2021 14:54:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0JYCPH5P7me6; Fri, 10 Dec 2021 14:54:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81CBB6142E;
	Fri, 10 Dec 2021 14:54:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3F7391BF4DB
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 14:54:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F30283298
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 14:54:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hhyoomNcix3k for <buildroot@lists.busybox.net>;
 Fri, 10 Dec 2021 14:54:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd12131.aruba.it (smtpcmd12131.aruba.it [62.149.156.131])
 by smtp1.osuosl.org (Postfix) with ESMTP id F3C23831CA
 for <buildroot@buildroot.org>; Fri, 10 Dec 2021 14:54:46 +0000 (UTC)
Received: from [192.168.50.18] ([146.241.138.59])
 by Aruba Outgoing Smtp  with ESMTPSA
 id vhILmWlw8YYTXvhILmGo4g; Fri, 10 Dec 2021 15:54:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1639148085; bh=wO0QNmz8p/hoGNykAUzYvi5ffoQ+ObgB3UzcMytQON0=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=Rw/ZxwlPEMFcqBTBxJL6nI9dgS4w0iERTy0eQobqjcFYHi0z8Oim/RgjeJd1Ndgzc
 iph8qWpVltfF9zvXhhS4l38gbMDyijsHSOJSN83WrTTCcFiUEczZ6tTdJefPxEyIYW
 oXWrPwNxDC7RBntl5WIs598KRCTYku4awU2pA/eRfLSIBP0GtfBJWfktxJ6KIfXDKb
 v7PFlLEroEr1GTcSvvsskF7Pq/fYC7H0gwra7vIg/8hNuimJJj7DwrtIgXq2hRMwkx
 yYqX7O4o9v1ughfSCnAi9zWIlCO5BwY/scapGHevwbkHvHIS7xN5Xj4LkZoIqX5hkr
 dBzUYbQ/9SlgA==
To: =?UTF-8?Q?Jos=c3=a9_Pekkarinen?= <jose.pekkarinen@unikie.com>,
 buildroot@buildroot.org
References: <20211210141209.1812043-1-jose.pekkarinen@unikie.com>
 <20211210141209.1812043-4-jose.pekkarinen@unikie.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <01edd63a-9dff-1eff-00b5-47d9bc1f6cf3@benettiengineering.com>
Date: Fri, 10 Dec 2021 15:54:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211210141209.1812043-4-jose.pekkarinen@unikie.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfIJAyHO/ekcdTCBPGTJz9zP6WgE7ZkDq2xxiZfIawUkuYuNAlkhwrb/iC7cToToBSgvXOst83nxAoWCXwiZM8nw+jdJcymUQtRmZdxS2soMdYQNhM4uN
 Bk34LIkztFAzsRRofxTnJdrlFnKJkbbkWlYEEtcDw6ZiHCI8vpfhtPdt7poZvxtS7fhhF451bA5bAJFZvltcu9wJEV+ayg6vVD0uXWfgYx93i3Wmp52vKWug
 ssxnpEzH1QKKlDB1+Qo+2w==
Subject: Re: [Buildroot] [PATCH 4/7] package/alfred: new package
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMTAvMTIvMjEgMTU6MTIsIEpvc8OpIFBla2thcmluZW4gd3JvdGU6Cj4gVGhpcyAgcGF0Y2gg
d2lsbCBwcm92aWRlIHRoZSBpbml0aWFsCj4gcGFja2FnZSBmb3IgYWxmcmVkIHByb2plY3QuCgpS
ZXdvcmQgXl5eCgo+IFNpZ25lZC1vZmYtYnk6IEpvc8OpIFBla2thcmluZW4gPGpvc2UucGVra2Fy
aW5lbkB1bmlraWUuY29tPgo+IC0tLQo+ICAgREVWRUxPUEVSUyAgICAgICAgICAgICAgICAgfCAg
MSArCj4gICBwYWNrYWdlL0NvbmZpZy5pbiAgICAgICAgICB8ICAxICsKPiAgIHBhY2thZ2UvYWxm
cmVkL0NvbmZpZy5pbiAgIHwgMjAgKysrKysrKysrKysrKysrKysrKysKPiAgIHBhY2thZ2UvYWxm
cmVkL2FsZnJlZC5oYXNoIHwgIDQgKysrKwo+ICAgcGFja2FnZS9hbGZyZWQvYWxmcmVkLm1rICAg
fCAyNSArKysrKysrKysrKysrKysrKysrKysrKysrCj4gICA1IGZpbGVzIGNoYW5nZWQsIDUxIGlu
c2VydGlvbnMoKykKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2FsZnJlZC9Db25maWcu
aW4KPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2FsZnJlZC9hbGZyZWQuaGFzaAo+ICAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvYWxmcmVkL2FsZnJlZC5tawo+IAo+IGRpZmYgLS1n
aXQgYS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUwo+IGluZGV4IGUzZTQ4NTIyYWEuLjBlNGRiODM1
ZDMgMTAwNjQ0Cj4gLS0tIGEvREVWRUxPUEVSUwo+ICsrKyBiL0RFVkVMT1BFUlMKPiBAQCAtMTQ2
NCw2ICsxNDY0LDcgQEAgRjoJcGFja2FnZS96ZnMvCj4gICBGOglzdXBwb3J0L3Rlc3RpbmcvdGVz
dHMvcGFja2FnZS90ZXN0X3pmcy5weQo+ICAgCj4gICBOOglKb3PDqSBQZWtrYXJpbmVuIDxqb3Nl
LnBla2thcmluZW5AdW5pa2llLmNvbT4KPiArRjoJcGFja2FnZS9hbGZyZWQvCj4gICBGOglwYWNr
YWdlL2JteDcvCj4gICBGOglwYWNrYWdlL21pbmlqYWlsLwo+ICAgRjoJcGFja2FnZS9vcGVuc2Mv
Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvQ29uZmlnLmluIGIvcGFja2FnZS9Db25maWcuaW4KPiBp
bmRleCA1NWJhMGRlZDEzLi5iODU3ZTE4OTc2IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvQ29uZmln
LmluCj4gKysrIGIvcGFja2FnZS9Db25maWcuaW4KPiBAQCAtMjExMiw2ICsyMTEyLDcgQEAgZW5k
bWVudQo+ICAgCj4gICBtZW51ICJOZXR3b3JraW5nIGFwcGxpY2F0aW9ucyIKPiAgIAlzb3VyY2Ug
InBhY2thZ2UvYWlyY3JhY2stbmcvQ29uZmlnLmluIgo+ICsJc291cmNlICJwYWNrYWdlL2FsZnJl
ZC9Db25maWcuaW4iCj4gICAJc291cmNlICJwYWNrYWdlL2FvZXRvb2xzL0NvbmZpZy5pbiIKPiAg
IAlzb3VyY2UgInBhY2thZ2UvYXBhY2hlL0NvbmZpZy5pbiIKPiAgIAlzb3VyY2UgInBhY2thZ2Uv
YXJndXMvQ29uZmlnLmluIgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2FsZnJlZC9Db25maWcuaW4g
Yi9wYWNrYWdlL2FsZnJlZC9Db25maWcuaW4KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4
IDAwMDAwMDAwMDAuLjVmOWM2ZjJhNmUKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9h
bGZyZWQvQ29uZmlnLmluCj4gQEAgLTAsMCArMSwyMCBAQAo+ICtjb25maWcgQlIyX1BBQ0tBR0Vf
QUxGUkVECj4gKwlib29sICJhbGZyZWQiCj4gKwlkZXBlbmRzIG9uICFCUjJfU1RBVElDX0xJQlMg
IyBkbG9wZW4oKQo+ICsJc2VsZWN0IEJSMl9QQUNLQUdFX0xJQk5MCj4gKwlzZWxlY3QgQlIyX1BB
Q0tBR0VfTElCQ0FQCj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfR1BTRAo+ICsJaGVscAo+ICsJICBB
bGZyZWQgaXMgYSB1c2VyIHNwYWNlIGRhZW1vbiBmb3IgZGlzdHJpYnV0aW5nCj4gKwkgIGFyYml0
cmFyeSBsb2NhbCBpbmZvcm1hdGlvbiBvdmVyIHRoZSBtZXNoL25ldHdvcmsgaW4KPiArCSAgYSBk
ZWNlbnRyYWxpemVkIGZhc2hpb24uCj4gKwkgIFRoaXMgZGF0YSBjYW4gYmUgYW55dGhpbmcgd2hp
Y2ggYXBwZWFycyB0byBiZSB1c2VmdWwKPiArCSAgLSBvcmlnaW5hbGx5IGRlc2lnbmVkIHRvIHJl
cGxhY2UgdGhlIGJhdG1hbi1hZHYKPiArCSAgdmlzdWFsaXphdGlvbiAodmlzKSwgeW91IG1heSBk
aXN0cmlidXRlIGhvc3RuYW1lcywKPiArCSAgcGhvbmUgYm9va3MsIGFkbWluaXN0cmF0aW9uIGlu
Zm9ybWF0aW9uLCBETlMKPiArCSAgaW5mb3JtYXRpb24sIHRoZSBsb2NhbCB3ZWF0aGVyIGZvcmVj
YXN0IC4uLgo+ICsKPiArCSAgaHR0cHM6Ly93d3cub3Blbi1tZXNoLm9yZy9wcm9qZWN0cy9hbGZy
ZWQvd2lraQo+ICsKPiArY29tbWVudCAiYWxmcmVkIG5lZWRzIGEgdG9vbGNoYWluIHdpdGggZHlu
YW1pYyBsaWJyYXJ5IHN1cHBvcnQiCj4gKwlkZXBlbmRzIG9uIEJSMl9TVEFUSUNfTElCUwo+IGRp
ZmYgLS1naXQgYS9wYWNrYWdlL2FsZnJlZC9hbGZyZWQuaGFzaCBiL3BhY2thZ2UvYWxmcmVkL2Fs
ZnJlZC5oYXNoCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi5hMmRk
MDExNmQ3Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvYWxmcmVkL2FsZnJlZC5oYXNo
Cj4gQEAgLTAsMCArMSw0IEBACj4gKyMgRnJvbSBodHRwczovL2Rvd25sb2Fkcy5vcGVuLW1lc2gu
b3JnL2JhdG1hbi9zdGFibGUvc291cmNlcy9hbGZyZWQKCnNoYTI1NiBmaWxlIF5eXgoKPiArc2hh
MjU2ICA0Yzc5YjZjNDVkZTRiY2M4Y2JmZTY0Y2JhOWEwZjhiNGVmMzA0Y2E4NGMxOTQ2MjJmMmJm
YTQxZTAxZTJjYjk1ICBhbGZyZWQtMjAyMS40LnRhci5nego+ICsjIExvY2FsbHkgY29tcHV0ZWQK
PiArc2hhMjU2ICBjZWNiZjUzZDExNDhlMTMyNTZhYzI5ZjhiOTAwNjU1YjdmYzhkYzEyZDU5OTM5
YTk1YmMyMzIzZWExNzQ3MDI1ICBMSUNFTlNFUy9wcmVmZXJyZWQvR1BMLTIuMAo+IGRpZmYgLS1n
aXQgYS9wYWNrYWdlL2FsZnJlZC9hbGZyZWQubWsgYi9wYWNrYWdlL2FsZnJlZC9hbGZyZWQubWsK
PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjRlMzhkZGFkOTIKPiAt
LS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9hbGZyZWQvYWxmcmVkLm1rCj4gQEAgLTAsMCAr
MSwyNSBAQAo+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICsjCj4gKyMgYWxmcmVkCj4gKyMK
PiArIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiArCj4gK0FMRlJFRF9WRVJTSU9OID0gMjAyMS40
Cj4gK0FMRlJFRF9TSVRFID0gaHR0cHM6Ly9kb3dubG9hZHMub3Blbi1tZXNoLm9yZy9iYXRtYW4v
c3RhYmxlL3NvdXJjZXMvYWxmcmVkCj4gK0FMRlJFRF9MSUNFTlNFID0gR1BMLTIKPiArQUxGUkVE
X0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFUy9wcmVmZXJyZWQvR1BMLTIuMAo+ICtBTEZSRURfREVQ
RU5ERU5DSUVTID0gbGlibmwgbGliY2FwIGdwc2QKPiArCj4gK2RlZmluZSBBTEZSRURfQlVJTERf
Q01EUwo+ICsJKGNkICQoQEQpOyBcCj4gKwkkKFRBUkdFVF9NQUtFX0VOVikgJChNQUtFKSAtQyAk
KEBEKS8kKGQpIENDPSIkKFRBUkdFVF9DQykiKQo+ICtlbmRlZgo+ICsKPiArZGVmaW5lIEFMRlJF
RF9JTlNUQUxMX1RBUkdFVF9DTURTCj4gKwkkKElOU1RBTEwpIC1tIDA3NTUgLUQgJChARCkvYWxm
cmVkIFwKPiArCQkkKFRBUkdFVF9ESVIpL3Vzci9iaW4vYWxmcmVkCj4gKwkkKElOU1RBTEwpIC1t
IDA3NTUgLUQgJChARCkvdmlzL2JhdGFkdi12aXMgXAo+ICsJCSQoVEFSR0VUX0RJUikvdXNyL2Jp
bi9iYXRhZHYtdmlzCj4gK2VuZGVmCj4gKwo+ICskKGV2YWwgJChnZW5lcmljLXBhY2thZ2UpKQo+
IAoKQmVzdCByZWdhcmRzCi0tIApHaXVsaW8gQmVuZXR0aQpCZW5ldHRpIEVuZ2luZWVyaW5nIHNh
cwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
