Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91283C3ABAA
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 10:23:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 601C2410B6;
	Fri,  2 May 2025 10:23:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5TKIAAqW771A; Fri,  2 May 2025 10:23:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B0C34115B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B0C34115B;
	Fri,  2 May 2025 10:23:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CA74EE
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:23:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1DC4D409C7
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:23:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tWZBi2xulOdP for <buildroot@buildroot.org>;
 Fri,  2 May 2025 10:23:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 440C540519
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 440C540519
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 440C540519
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:23:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 35FCF1C0D8C; Fri,  2 May 2025 12:23:48 +0200 (CEST)
Message-ID: <ae09be80-c40c-44be-a36a-b6b2a4f62e50@rnout.be>
Date: Fri, 2 May 2025 12:23:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>
References: <20250414133235.987304-1-raphael.melotte@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250414133235.987304-1-raphael.melotte@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746181428; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=1YBu70g1IFnP/06CY2zaVL7XqKD389BQV8evOSKeS0A=;
 b=izurXg19aogFG3pCOOEGA2BjDwLGoLor49Do8aFmxO/AV8+bm9HaIJM6ixCxreRY8WMM/G
 76r1Y34rVdbnlu3V9jV/b7jRv/g6vSg4Kg4PHT96gBwI3F9nm2U3yHdvo91hrzpEe52T2g
 d1+VCi4y2ah4y3fJhrKwiiUWlrQW3NGl5Ab9UpJbOcw5DPNH4P5MlfcisKULxj9EVNuyZ5
 LroNjCXb3S5zg08IO6hOmLORRgBD7GPsSwXAgAa+9yJNe17wQQCm05IeuI9EdRmTnK8Z5x
 lHF4KrMJG+JWHlf1lpgkV6x3lCXZrNpJjxLVCLCIg0VdbHinJyytSmqHIdyOlw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=izurXg19
Subject: Re: [Buildroot] [PATCH 1/1] package/libopenh264: ignore
 CVE-2025-27091
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

CgpPbiAxNC8wNC8yMDI1IDE1OjMyLCBSYXBoYcOrbCBNw6lsb3R0ZSB2aWEgYnVpbGRyb290IHdy
b3RlOgo+IEJvdGggb3BlbmgyNjQgMi42LjAgYW5kIDIuNS4xIGNvbnRhaW4gdGhlIGZpeCBmb3Ig
dGhpcyBDVkUgKHNlZSB0aGUKPiByZWxlYXNlIG5vdGVzIGF0IFsxXSkuCj4gCj4gSW4gb3RoZXIg
d29yZHMgdGhlIHZlcnNpb24gd2UgaGF2ZSBpcyBubyBsb25nZXIgdnVsbmVyYWJsZSBzaW5jZQo+
IGE3YWViNWE0NmVhYWY4YTM5NTYwYzg2NjQ1OTMwMThjZjI1MzgzNWEgKCJwYWNrYWdlL2xpYm9w
ZW5oMjY0Ogo+IHNlY3VyaXR5IGJ1bXAgdG8gdmVyc2lvbiAyLjUuMSIpIGJ1dCBwa2ctc3RhdHMg
c3RpbGwgcmVwb3J0cyBpdC4KPiAKPiBBbiBlbWFpbCB3YXMgc2VudCB0byB0aGUgTlZEIHRvIGZp
eCB0aGUgQ1BFIHZlcnNpb24gbnVtYmVyLCBidXQgaW4gdGhlCj4gbWVhbnRpbWUgbGV0J3MgaWdu
b3JlIGl0IHRvIHJlZHVjZSB0aGUgbm9pc2UgaW4gb3VyIENWRSBjaGVja2VyLgo+IAo+IFsxXTog
aHR0cHM6Ly9naXRodWIuY29tL2Npc2NvL29wZW5oMjY0L3JlbGVhc2VzL3RhZy8yLjUuMQo+IAo+
IFNpZ25lZC1vZmYtYnk6IFJhcGhhw6tsIE3DqWxvdHRlIDxyYXBoYWVsLm1lbG90dGVAbWluZC5i
ZT4KCiAgQXBwbGllZCB0byAyMDI1LjAyLngsIHRoYW5rcy4KCiAgUmVnYXJkcywKICBBcm5vdXQK
Cj4gLS0tCj4gICBwYWNrYWdlL2xpYm9wZW5oMjY0L2xpYm9wZW5oMjY0Lm1rIHwgMyArKysKPiAg
IDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS9saWJvcGVuaDI2NC9saWJvcGVuaDI2NC5tayBiL3BhY2thZ2UvbGlib3BlbmgyNjQvbGlib3Bl
bmgyNjQubWsKPiBpbmRleCBmOWE1MGU0YzYxLi45YWU5OTZmZWUxIDEwMDY0NAo+IC0tLSBhL3Bh
Y2thZ2UvbGlib3BlbmgyNjQvbGlib3BlbmgyNjQubWsKPiArKysgYi9wYWNrYWdlL2xpYm9wZW5o
MjY0L2xpYm9wZW5oMjY0Lm1rCj4gQEAgLTEyLDYgKzEyLDkgQEAgTElCT1BFTkgyNjRfQ1BFX0lE
X1ZFTkRPUiA9IGNpc2NvCj4gICBMSUJPUEVOSDI2NF9DUEVfSURfUFJPRFVDVCA9IG9wZW5oMjY0
Cj4gICBMSUJPUEVOSDI2NF9JTlNUQUxMX1NUQUdJTkcgPSBZRVMKPiAgIAo+ICsjIFRoZSBmb2xs
b3dpbmcgQ1ZFIGlzIGZpeGVkIGluIDIuNS4xLCB0aGUgTlZEIENQRSBpcyBub3QgdXAgdG8gZGF0
ZQo+ICtMSUJPUEVOSDI2NF9JR05PUkVfQ1ZFUyArPSBDVkUtMjAyNS0yNzA5MQo+ICsKPiAgIGlm
ZXEgKCQoQlIyX2FhcmNoNjQpLHkpCj4gICBMSUJPUEVOSDI2NF9BUkNIID0gYWFyY2g2NAo+ICAg
ZWxzZSBpZmVxICgkKEJSMl9hcm0pJChCUjJfYXJtZWIpLHkpCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
