Return-Path: <SRS0=sHoS=NS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3250C432BE
	for <buildroot@archiver.kernel.org>; Fri, 27 Aug 2021 20:48:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DDDB60EFE
	for <buildroot@archiver.kernel.org>; Fri, 27 Aug 2021 20:48:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2DDDB60EFE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE8894021D;
	Fri, 27 Aug 2021 20:48:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vMJedha3unUV; Fri, 27 Aug 2021 20:48:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DD9D40318;
	Fri, 27 Aug 2021 20:48:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E4E6D1BF4D6
 for <buildroot@lists.busybox.net>; Fri, 27 Aug 2021 20:48:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE85B40318
 for <buildroot@lists.busybox.net>; Fri, 27 Aug 2021 20:48:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qBk_nNGXIhM9 for <buildroot@lists.busybox.net>;
 Fri, 27 Aug 2021 20:48:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EFB6E4021D
 for <buildroot@buildroot.org>; Fri, 27 Aug 2021 20:48:28 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:a574:2179:f8:908b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id DB902B004FF;
 Fri, 27 Aug 2021 22:48:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1630097306;
 bh=3yHcYVUZLrTG7zbivP8CSKMIrL3hg5wviwliZyYFsmo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=I5ZKvp6AWJm6cjF8hJHNAuW5mktAgNmRlVhMjPh+o/Yt51V0Xa4OsES01qgWcmFU3
 gSc2zf/TjEXaqzDNhXlIOjdcPPqIebO8HC2jbFultBqf0iUFxaZ/opEFGGwSQimo8W
 mDQW+TAefrqRtcwE6s50iH5drfTNU3S+zj5XiqRYjdak6WeelCJavfwKwZRisWCJnW
 FaFk/6x9BTmDSDC50V4muqPKJkrYA7l1rO8CK55Xv4+9nuz/btrAKMeurEJL+oKwJA
 wWoicHb/sCfpErlxVmgCRpwLPM1cLrfSMTCC97zLiyKSRtA0vT5R7VC6qwZq5Dcg9o
 JWYocHdutYLxA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 27 Aug 2021 22:48:19 +0200
Date: Fri, 27 Aug 2021 22:48:19 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20210827204819.GE2661@scaer>
References: <20210827091743.2516027-1-romain.naour@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210827091743.2516027-1-romain.naour@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCHv2] package/zfs: Fix
 cross-platform-compilations
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
Cc: =?utf-8?B?Sm9zw6k=?= Luis Salvador Rufo <salvador.joseluis@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Um9tYWluLCBKb3PDqSwgQWxsLAoKT24gMjAyMS0wOC0yNyAxMToxNyArMDIwMCwgUm9tYWluIE5h
b3VyIHNwYWtlIHRodXNseToKPiBGcm9tOiBKb3PDqSBMdWlzIFNhbHZhZG9yIFJ1Zm8gPHNhbHZh
ZG9yLmpvc2VsdWlzQGdtYWlsLmNvbT4KPiAKPiBUaGlzIHBhdGNoIGZpeGVzIHRoZSBgbWFrZWAg
ZXhlY3V0ZWQgZnJvbSB0aGUgYGtlcm5lbC5tNGAgaW4KPiBjcm9zcy1wbGF0Zm9ybS1jb21waWxh
dGlvbnMgZW52aXJvbm1lbnRzOgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuemZzL3pmcy9ibG9i
L3pmcy0yLjAuNS9jb25maWcva2VybmVsLm00I0w1ODgKPiAKPiBGaXhlczoKPiBodHRwczovL2dp
dGxhYi5jb20va3VidTkzL2J1aWxkcm9vdC8tL2pvYnMvMTUyMjg0ODQ4Mwo+IAo+IFNpZ25lZC1v
ZmYtYnk6IEpvc8OpIEx1aXMgU2FsdmFkb3IgUnVmbyA8c2FsdmFkb3Iuam9zZWx1aXNAZ21haWwu
Y29tPgo+IFNpZ25lZC1vZmYtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQGdtYWlsLmNv
bT4KPiAtLS0KPiB2MjogYWRkIGEgcGF0Y2ggdG8gcmVtb3ZlIERFU1RESVIgdXNlZCB3aXRoIElO
U1RBTExfTU9EX1BBVEgKPiAgICAgVXNlIExJTlVYX01BS0VfRkxBR1MgZm9yIFpGU19NQUtFX0VO
ViBhbmQgWkZTX0NPTkZfRU5WCj4gICAgIGh0dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9waXBlcm1h
aWwvYnVpbGRyb290LzIwMjEtQXVndXN0LzYyMTM1MC5odG1sCgpJJ3ZlIG9ubHkgaGFkIGEgY3Vy
c29yeSBsb29rIGF0IHRoZSBwcmV2aW91cyBkaXNjdXNzaW9uLCBzb3JyeS4uLgoKSG93ZXZlciwg
SSBiZWxpZXZlIHRoaXMgaXMgaW5jb3JyZWN0IHRvIHBhc3MgJChMSU5VWF9NQUtFX0ZMQUdTKSBp
biB0aGUKZW52aXJvbm1lbnQgZm9yIGNvbmZpZ3VyZSBhbmQgbWFrZS4KCkluZGVlZCwgJChMSU5V
WF9NQUtFX0ZMQUdTKSBzaG91bGQgcmVhbGx5IG9ubHkgYmUgdXNlZCB3aGVuIGFjdHVhbGx5CmJ1
aWxkaW5nIGtlcm5lbCBtb2R1bGVzLCBub3QgdXNlcmxhbmQgc3R1ZmYsIGJlY2F1c2UgaXQgY29u
dGFpbnMKdmFyaWFibGVzIHRoYXQgYXJlIG5vdCB2YWxpZCBvdGhlcndpc2UuCgpGb3IgZXhhbXBs
ZSwgaXQgb3ZlcnJpZGVzIEhPU1RDQyB3aXRoIGEgdmFsdWUgdGhhdCBpcyBub3QgY29ycmVjdApv
dXRzaWRlIG9mIGJ1bGRpbmcgdGhlIGtlcm5lbC4gSXQgYWxzbyBjb25kaXRpb25hbGx5IGNvbnRh
aW5zIHRoZQp1bnNjb3BlZCB2YXJpYWJsZSBMT0FEQUREUiwgd2hpY2ggbmFtZSBpcyB0b28gZ2Vu
ZXJpYy4KCkFsc28sIEkgZG9uJ3QgdW5kZXJzdGFuZCB3aHkgd2UgbmVlZCB0aGVzZSBhdCBjb25m
aWd1cmUgdGltZSwgYmVjYXVzZSB3ZQphcmUgdXNpbmcgdGhlIGtlcm5lbC1tb2R1bGUgaW5mcmEg
dG8gYnVpbGQgdGhlIGtlcm5lbCBtb2R1bGUuLi4gQW5kCmJhc2ljYWxseSwgdGhlIHR3byBhcmUg
bW9zdGx5IG11dHVhbGx5IGV4Y2x1c2l2ZS4uLgoKPiAtLS0KPiAgLi4uaW4tZG9uLXQtdXNlLURF
U1RESVItYW5kLUlOU1RBTExfTU9ELnBhdGNoIHwgNDQgKysrKysrKysrKysrKysrKysrKwo+ICBw
YWNrYWdlL3pmcy96ZnMubWsgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNSArKysKPiAg
MiBmaWxlcyBjaGFuZ2VkLCA0OSBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBw
YWNrYWdlL3pmcy8wMDAxLW1vZHVsZS1NYWtlZmlsZS5pbi1kb24tdC11c2UtREVTVERJUi1hbmQt
SU5TVEFMTF9NT0QucGF0Y2gKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS96ZnMvMDAwMS1tb2R1
bGUtTWFrZWZpbGUuaW4tZG9uLXQtdXNlLURFU1RESVItYW5kLUlOU1RBTExfTU9ELnBhdGNoIGIv
cGFja2FnZS96ZnMvMDAwMS1tb2R1bGUtTWFrZWZpbGUuaW4tZG9uLXQtdXNlLURFU1RESVItYW5k
LUlOU1RBTExfTU9ELnBhdGNoCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAw
MDAwLi5lMWQwZjkxNTMzCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvemZzLzAwMDEt
bW9kdWxlLU1ha2VmaWxlLmluLWRvbi10LXVzZS1ERVNURElSLWFuZC1JTlNUQUxMX01PRC5wYXRj
aAo+IEBAIC0wLDAgKzEsNDQgQEAKPiArRnJvbSAxMjg1MWE4ZGJjMGFlYjhlNDhmMjFmMWUwY2I3
YjMxMjMwMjk1OTRlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+ICtGcm9tOiBSb21haW4gTmFv
dXIgPHJvbWFpbi5uYW91ckBnbWFpbC5jb20+Cj4gK0RhdGU6IFRodSwgMjYgQXVnIDIwMjEgMjM6
MTI6MzEgKzAyMDAKPiArU3ViamVjdDogW1BBVENIXSBtb2R1bGUvTWFrZWZpbGUuaW46IGRvbid0
IHVzZSBERVNURElSIGFuZCBJTlNUQUxMX01PRF9QQVRICj4gKyB0b2dldGhlcgo+ICsKPiArREVT
VERJUiBhbmQgSU5TVEFMTF9NT0RfUEFUSCBhcmUgdXN1YWxseSBzZXQgd2l0aCBhYnNvbHV0ZSBw
YXRoCj4gK2J5IGJ1aWxkIHN5c3RlbSAoQnVpbGRyb290KSwgc28gd2hlbiB1c2VkIHRvZ2V0aGVy
IGl0IGNvbmNhdGVuYXRlcwo+ICt0d28gYWJzb2x1dGUgcGF0aC4KPiArCj4gK0tlZXAgSU5TVEFM
TF9NT0RfUEFUSCBzaW5jZSBpdCdzIHNldCB3aGVuIGJ1aWxkaW5nIGFuIG91dCBvZiB0cmVlCj4g
K2tlcm5lbCBtb2R1bGUuCj4gKwo+ICtTaWduZWQtb2ZmLWJ5OiBSb21haW4gTmFvdXIgPHJvbWFp
bi5uYW91ckBnbWFpbC5jb20+CgpUaGF0IHBhdGNoIG9uIGl0cyBvd24gaXMgY29ycmVjdCwgdGhv
dWdoLiBJdCBzaG91bGQgYmUgcHVzaGVkIHVwc3RyZWFtLgoKPiArLS0tCj4gKyBtb2R1bGUvTWFr
ZWZpbGUuaW4gfCA2ICsrKy0tLQo+ICsgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkKPiArCj4gK2RpZmYgLS1naXQgYS9tb2R1bGUvTWFrZWZpbGUuaW4gYi9t
b2R1bGUvTWFrZWZpbGUuaW4KPiAraW5kZXggNjljYWY0ODU3Li4wNDNmMmJkZWEgMTAwNjQ0Cj4g
Ky0tLSBhL21vZHVsZS9NYWtlZmlsZS5pbgo+ICsrKysgYi9tb2R1bGUvTWFrZWZpbGUuaW4KPiAr
QEAgLTc2LDE1ICs3NiwxNSBAQCBjbGVhbjogY2xlYW4tQGFjX3N5c3RlbUAKPiArIG1vZHVsZXNf
aW5zdGFsbC1MaW51eDoKPiArIAlAIyBJbnN0YWxsIHRoZSBrZXJuZWwgbW9kdWxlcwo+ICsgCSQo
TUFLRSkgLUMgQExJTlVYX09CSkAgTT1gcHdkYCBtb2R1bGVzX2luc3RhbGwgXAo+ICstCQlJTlNU
QUxMX01PRF9QQVRIPSQoREVTVERJUikkKElOU1RBTExfTU9EX1BBVEgpIFwKPiArKwkJSU5TVEFM
TF9NT0RfUEFUSD0kKElOU1RBTExfTU9EX1BBVEgpIFwKPiArIAkJSU5TVEFMTF9NT0RfRElSPSQo
SU5TVEFMTF9NT0RfRElSKSBcCj4gKyAJCUtFUk5FTFJFTEVBU0U9QExJTlVYX1ZFUlNJT05ACj4g
KyAJQCMgUmVtb3ZlIGV4dHJhbmVvdXMgYnVpbGQgcHJvZHVjdHMgd2hlbiBwYWNrYWdpbmcKPiAr
LQlrbW9kZGlyPSQoREVTVERJUikkKElOU1RBTExfTU9EX1BBVEgpL2xpYi9tb2R1bGVzL0BMSU5V
WF9WRVJTSU9OQDsgXAo+ICsrCWttb2RkaXI9JChJTlNUQUxMX01PRF9QQVRIKS9saWIvbW9kdWxl
cy9ATElOVVhfVkVSU0lPTkA7IFwKPiArIAlpZiBbIC1uICIkKERFU1RESVIpIiBdOyB0aGVuIFwK
PiArIAkJZmluZCAkJGttb2RkaXIgLW5hbWUgJ21vZHVsZXMuKicgfCB4YXJncyAkKFJNKTsgXAo+
ICsgCWZpCj4gKy0Jc3lzbWFwPSQoREVTVERJUikkKElOU1RBTExfTU9EX1BBVEgpL2Jvb3QvU3lz
dGVtLm1hcC1ATElOVVhfVkVSU0lPTkA7IFwKPiArKwlzeXNtYXA9JChJTlNUQUxMX01PRF9QQVRI
KS9ib290L1N5c3RlbS5tYXAtQExJTlVYX1ZFUlNJT05AOyBcCj4gKyAJaWYgWyAtZiAkJHN5c21h
cCBdOyB0aGVuIFwKPiArIAkJZGVwbW9kIC1hZSAtRiAkJHN5c21hcCBATElOVVhfVkVSU0lPTkA7
IFwKPiArIAlmaQo+ICstLSAKPiArMi4zMS4xCj4gKwo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3pm
cy96ZnMubWsgYi9wYWNrYWdlL3pmcy96ZnMubWsKPiBpbmRleCAzYjFhZmI0MTlhLi41MzdkNGVj
ZTE1IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvemZzL3pmcy5tawo+ICsrKyBiL3BhY2thZ2UvemZz
L3pmcy5tawo+IEBAIC0xMyw2ICsxMywxMSBAQCBaRlNfQ1BFX0lEX1BST0RVQ1QgPSBvcGVuemZz
Cj4gIAo+ICBaRlNfQVVUT1JFQ09ORiA9IFlFUwo+ICAKPiArIyBjcm9zcyBjb21waWxlIGVudmly
b25tZW50IGZvciBsaW51eCBrZXJuZWwgbW9kdWxlCj4gK1pGU19NQUtFX0VOViA9ICQoTElOVVhf
TUFLRV9GTEFHUykKPiArIyBgLi9jb25maWd1cmVgIHdpbGwgZXhlY3V0ZSBhIGBtYWtlIG1vZHVs
ZXNgIHRlc3QgY2FzZQo+ICtaRlNfQ09ORl9FTlYgPSAkKExJTlVYX01BS0VfRkxBR1MpCgpUaGlz
IGh1bmsgSSBhbSBub3QgdG9vIGhhcHB5IGFib3V0Li4uIDotLwoKUmVnYXJkcywKWWFubiBFLiBN
T1JJTi4KCj4gIFpGU19ERVBFTkRFTkNJRVMgPSBsaWJhaW8gb3BlbnNzbCB1ZGV2IHV0aWwtbGlu
dXggemxpYgo+ICAKPiAgIyBzeXN2aW5pdCBpbnN0YWxscyBvbmx5IGEgY29tbWVudGVkLW91dCBt
b2R1bGVzLWxvYWQuZC8gY29uZmlnIGZpbGUKPiAtLSAKPiAyLjMxLjEKPiAKPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKPiBidWlsZHJvb3RAYnVzeWJveC5uZXQKPiBodHRwOi8vbGlzdHMuYnVzeWJveC5uZXQv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0t
LS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8
ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04g
fCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNp
Z25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEg
MDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBU
aGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8g
XCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0t
LS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidXN5Ym94Lm5ldApodHRwOi8vbGlzdHMuYnVz
eWJveC5uZXQvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
