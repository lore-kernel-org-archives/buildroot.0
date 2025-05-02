Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C937C3ABAA
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 10:28:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0ECE41713;
	Fri,  2 May 2025 10:28:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 85ibZrvTsF4J; Fri,  2 May 2025 10:28:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 322CB4171C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 322CB4171C;
	Fri,  2 May 2025 10:28:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 569E9229
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:28:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C37B83A7B
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:28:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jxbXM1sduKue for <buildroot@buildroot.org>;
 Fri,  2 May 2025 10:28:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 59633811C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59633811C4
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 59633811C4
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:28:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 315EE1C1112; Fri,  2 May 2025 12:28:33 +0200 (CEST)
Message-ID: <9f44d7f9-149a-4378-8d51-56bd9549bbc1@rnout.be>
Date: Fri, 2 May 2025 12:28:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>,
 buildroot@buildroot.org
Cc: Dick Olsson <hi@senzilla.io>
References: <20250410153114.1374261-1-vincent.stehle@arm.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250410153114.1374261-1-vincent.stehle@arm.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746181713; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=njl1cqC2d4M8yVnISXUceRCF/WCwvyQM3sh+CWByE7Y=;
 b=IFUcOptmkEVU1M1rbjOvEZEPiIaX5cCTyb3EwUGHAVyDt7qMjPNsvprVjbgX3uzz7oKUpK
 t/Jz90Hm4AwRc4sc/sV3cfNJ83+11xp+FXkLtk2/l4SvvVesAVe8oEDEWuVOsYuhC3926Z
 vvbj1ClFJhw3FAz9eRgXgDND7RI6fm9yKonevn7ntZsJFNhowF2HveY8aevpT96rrVmEur
 ma2YQxi2pf9vLkl4S34HMFxOocm++9DdMcPRzg8o1tovhK4M9NNWPu/8ZYiF28AHkVMkej
 bhvGHXhKPBsvuxXw2eFfqj9bCIfv+1wnZn79DfbNrF7/A0wJxTjQTW8OBdArpg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=IFUcOptm
Subject: Re: [Buildroot] [PATCH] boot/edk2: drop dependency on tf-a for
 macchiatobin
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxMC8wNC8yMDI1IDE3OjMxLCBWaW5jZW50IFN0ZWhsw6kgd3JvdGU6Cj4gV2hlbiBidWls
ZGluZyBhIGZpcm13YXJlIGZvciB0aGUgTUFDQ0hJQVRPYmluIHdpdGggZWRrMiBhbmQKPiBhcm0t
dHJ1c3RlZC1maXJtd2FyZSwgdGhlIGJ1aWxkIGZhaWxzIHdpdGggdGhlIGZvbGxvd2luZyBtYWtl
IGVycm9yOgo+IAo+ICAgIG1ha2VbMV06IENpcmN1bGFyIG91dHB1dC9idWlsZC9lZGsyLWVkazIt
c3RhYmxlMjAyNDExLy5zdGFtcF9jb25maWd1cmVkIDwtIGFybS10cnVzdGVkLWZpcm13YXJlIGRl
cGVuZGVuY3kgZHJvcHBlZC4KPiAKPiBJbiBmYWN0LCBvbmx5IFRGLUEgZGVwZW5kcyBvbiBFREsg
SUkgKHBhc3NlZCBhcyBCTDMzKSBmb3IgYnVpbGRpbmcgYW5kCj4gbm90IHZpY2UgdmVyc2EuIFsx
XQo+IAo+IERyb3AgdGhlIGZhbHNlIGRlcGVuZGVuY3kgb24gVEYtQSB0byBmaXggdGhlIGJ1aWxk
Lgo+IAo+IFsxXSBodHRwczovL2dpdGh1Yi5jb20vU2VtaWhhbGYvZWRrMi1wbGF0Zm9ybXMvd2lr
aS9CdWlsZF9maXJtd2FyZQo+IAo+IFNpZ25lZC1vZmYtYnk6IFZpbmNlbnQgU3RlaGzDqSA8dmlu
Y2VudC5zdGVobGVAYXJtLmNvbT4KPiBDYzogRGljayBPbHNzb24gPGhpQHNlbnppbGxhLmlvPgoK
ICBBcHBsaWVkIHRvIDIwMjUuMDIueCwgdGhhbmtzLgoKICBSZWdhcmRzLAogIEFybm91dAoKPiAt
LS0KPiAKPiAKPiBIaSwKPiAKPiBXZSBoYXZlIG5vdGhpbmcgaW4tdHJlZSB0byBidWlsZCBlZGsy
IGZvciB0aGUgTUFDQ0hJQVRPYmluOyBoZXJlIGlzIGFuCj4gYWQtaG9jIGRlZmNvbmZpZyBjYW4g
YmUgdXNlZCBmb3IgYnVpbGQtdGVzdGluZzoKPiAKPiAgICBCUjJfYWFyY2g2ND15Cj4gICAgQlIy
X1RPT0xDSEFJTl9FWFRFUk5BTD15Cj4gICAgQlIyX0lOSVRfTk9ORT15Cj4gICAgQlIyX1NZU1RF
TV9CSU5fU0hfTk9ORT15Cj4gICAgIyBCUjJfUEFDS0FHRV9CVVNZQk9YIGlzIG5vdCBzZXQKPiAg
ICAjIEJSMl9QQUNLQUdFX0lGVVBET1dOX1NDUklQVFMgaXMgbm90IHNldAo+ICAgICMgQlIyX1RB
UkdFVF9ST09URlNfVEFSIGlzIG5vdCBzZXQKPiAgICBCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJ
Uk1XQVJFPXkKPiAgICBCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX1BMQVRGT1JNPSJh
ODB4MF9tY2JpbiIKPiAgICBCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX0VESzJfQVNf
QkwzMz15Cj4gICAgQlIyX1RBUkdFVF9CSU5BUklFU19NQVJWRUxMPXkKPiAgICBCUjJfVEFSR0VU
X0VESzI9eQo+ICAgIEJSMl9UQVJHRVRfRURLMl9QTEFURk9STV9TT0xJRFJVTl9BUk1BREE4MFgw
TUNCSU49eQo+ICAgIEJSMl9UQVJHRVRfTVZfRERSX01BUlZFTEw9eQo+IAo+IFRoZW4gdG8gYnVp
bGQsIHR3byBvcHRpb25zOgo+IAo+IDEuIFVzZSB0aGUgaW4tZmxpZ2h0IFRGLUEgYnVpbGQgZml4
LiBbNzc2MzcwXQo+IDIuIEJ1aWxkIG9ubHkgYGVkazInLgo+IAo+IEJlc3QgcmVnYXJkcywKPiBW
aW5jZW50Lgo+IAo+IFs3NzYzNzBdIGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9waXBlcm1h
aWwvYnVpbGRyb290LzIwMjUtQXByaWwvNzc2MzcwLmh0bWwKPiAKPiAKPiAgIGJvb3QvZWRrMi9l
ZGsyLm1rIHwgMiArLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2Jvb3QvZWRrMi9lZGsyLm1rIGIvYm9vdC9lZGsyL2Vk
azIubWsKPiBpbmRleCAzOTQxZDAxODgzLi5iYzQwNDliMmRlIDEwMDY0NAo+IC0tLSBhL2Jvb3Qv
ZWRrMi9lZGsyLm1rCj4gKysrIGIvYm9vdC9lZGsyL2VkazIubWsKPiBAQCAtMTE1LDcgKzExNSw3
IEBAIGVuZGVmCj4gICAKPiAgIGVsc2UgaWZlcSAoJChCUjJfVEFSR0VUX0VESzJfUExBVEZPUk1f
U09MSURSVU5fQVJNQURBODBYME1DQklOKSx5KQo+ICAgRURLMl9BUkNIID0gQUFSQ0g2NAo+IC1F
REsyX0RFUEVOREVOQ0lFUyArPSBob3N0LWR0YyBhcm0tdHJ1c3RlZC1maXJtd2FyZSBlZGsyLW5v
bi1vc2kKPiArRURLMl9ERVBFTkRFTkNJRVMgKz0gaG9zdC1kdGMgZWRrMi1ub24tb3NpCj4gICBF
REsyX1BBQ0tBR0VfTkFNRSA9IFBsYXRmb3JtL1NvbGlkUnVuL0FybWFkYTgweDBNY0Jpbgo+ICAg
RURLMl9QTEFURk9STV9OQU1FID0gQXJtYWRhODB4ME1jQmluCj4gICBFREsyX0JVSUxEX0RJUiA9
ICQoRURLMl9QTEFURk9STV9OQU1FKS0kKEVESzJfQVJDSCkKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
