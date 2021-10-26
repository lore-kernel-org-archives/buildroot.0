Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3573AC433F5
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 19:33:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B91CE60F56
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 19:33:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B91CE60F56
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A7E840242;
	Tue, 26 Oct 2021 19:33:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RjErTocQ8wfp; Tue, 26 Oct 2021 19:33:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4ECA740210;
	Tue, 26 Oct 2021 19:33:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 946461BF3CD
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 19:33:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 81D6960AC9
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 19:33:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k-yKNyEfbqbX for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 19:33:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 91D3260AC8
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 19:33:10 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id u13so781413edy.10
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 12:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=UeysD1bDlLwdwJ67p8HPu6lQePB7cxUpDT+UVui0sRs=;
 b=he1NfUS9R7F62C3TZs09YzCi0A5efi6McZ3ttk5Itd0BC0YWAC/MdL5oTRyyzpTvIN
 +K/rGCdhukAeNgDr6rS1laTKps/1aUMjs12BYMKhTZgX07PBEBcDFVoCm0W8jL8lggbc
 ewCiBFBea1e7GTasV2FRIU6KxaM0IZx0//EcLC0BHO8HCkXRZ+RvGvXe7je63Jlh8+m1
 k3UzMTG2uEUfAFaQv9Z0HZoUqz2xVAxjYy7Pa797UQ6LCLw2a3AzP/F01slfBIMPfNct
 OtiXxrHOkmToigFDfhl/9ARvmPO4WbI2oUwTASSuyEx0Kssg4BmtNKQJkHOjZlVfcan8
 OuYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=UeysD1bDlLwdwJ67p8HPu6lQePB7cxUpDT+UVui0sRs=;
 b=UIZMoLFRo2pACyi6RHr7GbJbCq5dDEYNfNx/YaTbd9K4PHUJqzrLsdpcHbt7iWxttU
 zqlf/OrNmkszFnf69Kfstiv7Y6uVk7IEuOaa5MYki5bu6irHKqOhlmeQzTMkARJgxKdD
 nljv+vj3FopLxb/jZKCkzG81PEjiYp13qHCQNLioZucMhnW20iqOlXR4QVFCckDiSHjB
 oc4/gofu3F0posHonKTKuOxYfADy0CUd94IZVO3NT7cfILxNkK63W/+tMxCp+6G9Sa2t
 chdUg9leyfa0h+TMxgjtsSoDVLPIMokD217xRkcDk4cdWgEP2Br77SZneqozU8FoG9Es
 XUEw==
X-Gm-Message-State: AOAM532axuIs4gQhzYD0cuNvWHjsbYLO39dvDPe+oO9mNXgXbD2npRbG
 krjv1UAs98x7gcS4hj/dzsQxTA==
X-Google-Smtp-Source: ABdhPJzRUk77ertz0kDRHkkZllbqUC2QxQal3CLpG6zTbvdFndicT5yy4gYz8ja9aPgyddCROTHglQ==
X-Received: by 2002:a05:6402:40f:: with SMTP id
 q15mr38094453edv.333.1635276788928; 
 Tue, 26 Oct 2021 12:33:08 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id nc7sm4977229ejc.63.2021.10.26.12.33.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 12:33:08 -0700 (PDT)
Message-ID: <889b3570-264d-f581-e5a5-2238f9df4b93@mind.be>
Date: Tue, 26 Oct 2021 21:33:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 buildroot@buildroot.org
References: <20211024181221.2608908-1-raphael.melotte@mind.be>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211024181221.2608908-1-raphael.melotte@mind.be>
Subject: Re: [Buildroot] [PATCH 1/5] support/testing: add new test for
 python-botocore
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyNC8xMC8yMDIxIDIwOjEyLCBSYXBoYcOrbCBNw6lsb3R0ZSB3cm90ZToKPiBBZGQgYSBy
dWRpbWVudGFyeSB0ZXN0IGluc3BpcmVkIGZyb20gdGhlICJVc2luZyBib3RvY29yZSIgc2VjdGlv
biBpbgo+IHRoZSBwYWNrYWdlIFJFQURNRSAoWzFdKS4KPiAKPiBOb3RlIHRoYXQgaXQgZG9lc24n
dCB0cnkgdG8gdXNlIHRoZSBpbnN0YW50aWF0ZWQgY2xpZW50LCBhcyB0aGlzIHdvdWxkCj4gcmVx
dWlyZSBhIG5ldHdvcmsgY29ubmVjdGlvbiB3aGVuIHRoZSB0ZXN0IHJ1bnMuCj4gCj4gWzFdOiBo
dHRwczovL2dpdGh1Yi5jb20vYm90by9ib3RvY29yZQo+IAo+IFNpZ25lZC1vZmYtYnk6IFJhcGhh
w6tsIE3DqWxvdHRlIDxyYXBoYWVsLm1lbG90dGVAbWluZC5iZT4KCiAgU2VyaWVzIGFwcGxpZWQg
dG8gbWFzdGVyLCB0aGFua3MuCgogIFJlZ2FyZHMsCiAgQXJub3V0Cgo+IC0tLQo+ICAgLi4uL3Rl
c3RpbmcvdGVzdHMvcGFja2FnZS9zYW1wbGVfcHl0aG9uX2JvdG9jb3JlLnB5ICB8ICAzICsrKwo+
ICAgLi4uL3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3B5dGhvbl9ib3RvY29yZS5weSAgICB8
IDEyICsrKysrKysrKysrKwo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspCj4g
ICBjcmVhdGUgbW9kZSAxMDA2NDQgc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2Uvc2FtcGxl
X3B5dGhvbl9ib3RvY29yZS5weQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHN1cHBvcnQvdGVzdGlu
Zy90ZXN0cy9wYWNrYWdlL3Rlc3RfcHl0aG9uX2JvdG9jb3JlLnB5Cj4gCj4gZGlmZiAtLWdpdCBh
L3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3NhbXBsZV9weXRob25fYm90b2NvcmUucHkg
Yi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS9zYW1wbGVfcHl0aG9uX2JvdG9jb3JlLnB5
Cj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi5jYzQwNTU5ODlmCj4g
LS0tIC9kZXYvbnVsbAo+ICsrKyBiL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3NhbXBs
ZV9weXRob25fYm90b2NvcmUucHkKPiBAQCAtMCwwICsxLDMgQEAKPiAraW1wb3J0IGJvdG9jb3Jl
LnNlc3Npb24KPiArc2Vzc2lvbiA9IGJvdG9jb3JlLnNlc3Npb24uZ2V0X3Nlc3Npb24oKQo+ICtj
bGllbnQgPSBzZXNzaW9uLmNyZWF0ZV9jbGllbnQoJ2VjMicsIHJlZ2lvbl9uYW1lPSJ1cy1lYXN0
LTEiKQo+IGRpZmYgLS1naXQgYS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3B5
dGhvbl9ib3RvY29yZS5weSBiL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfcHl0
aG9uX2JvdG9jb3JlLnB5Cj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAw
Li42MzM2YzU2NThmCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3N1cHBvcnQvdGVzdGluZy90ZXN0
cy9wYWNrYWdlL3Rlc3RfcHl0aG9uX2JvdG9jb3JlLnB5Cj4gQEAgLTAsMCArMSwxMiBAQAo+ICtm
cm9tIHRlc3RzLnBhY2thZ2UudGVzdF9weXRob24gaW1wb3J0IFRlc3RQeXRob25QYWNrYWdlQmFz
ZQo+ICsKPiArCj4gK2NsYXNzIFRlc3RQeXRob25QeTNCb3RvY29yZShUZXN0UHl0aG9uUGFja2Fn
ZUJhc2UpOgo+ICsgICAgX190ZXN0X18gPSBUcnVlCj4gKyAgICBjb25maWcgPSBUZXN0UHl0aG9u
UGFja2FnZUJhc2UuY29uZmlnICsgXAo+ICsgICAgICAgICIiIgo+ICsgICAgICAgIEJSMl9QQUNL
QUdFX1BZVEhPTjM9eQo+ICsgICAgICAgIEJSMl9QQUNLQUdFX1BZVEhPTl9CT1RPQ09SRT15Cj4g
KyAgICAgICAgIiIiCj4gKyAgICBzYW1wbGVfc2NyaXB0cyA9IFsidGVzdHMvcGFja2FnZS9zYW1w
bGVfcHl0aG9uX2JvdG9jb3JlLnB5Il0KPiArICAgIHRpbWVvdXQgPSAxMAo+IApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
