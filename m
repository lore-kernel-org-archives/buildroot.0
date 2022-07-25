Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3A29C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 10:24:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D0A4610A4;
	Mon, 25 Jul 2022 10:24:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D0A4610A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O6ey3xto_7Zo; Mon, 25 Jul 2022 10:24:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 570076101B;
	Mon, 25 Jul 2022 10:24:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 570076101B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 738B21BF371
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 10:24:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D534847FF
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 10:24:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D534847FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hNtktHuIZKtg for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 10:24:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E93D847C1
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0E93D847C1
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 10:24:38 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id h9so15333688wrm.0
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 03:24:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=se28phaDSl7HhmcxPhtXvTDE55Mu72VuIka1ggXmgUQ=;
 b=uRNL1DTc6++gN7n7nmAsmyDgTNujFEKD49F5rRZv+wruEcISYEOGwZ03uHJVpXf1ME
 wgy2bET7FqxwB0ehSgQka/9m2WfKnAvrAMG+Lqhza/Fl2LdPh/PjLaLKv/hAaLTNRWmD
 RFExr7CkT+FqIYvYGPTORWc7I++848MZwD37IhwE8ds7kPg7unV9oH6cL8mJJcsuOxwR
 sWSkRnVME2ILS7kUUuAxTYLzSLV6KVYiP4+AagQDBL0WqYzsKIsxQoE3CHh+q3Tb1+Tk
 T8yLYh6ahXyGVuBGwVCOzSChAmDH2dm7Uy2jUhm01Z2AEMonKuiYo0zt5n15FxeEzXrw
 ESLw==
X-Gm-Message-State: AJIora+bQt8NhvYT7ECr9AWTjx5OYmCgu7pHMPnzDXW5TEeH+y79SjCg
 TMVqeF9MAR0bAGKEvyycN5cLEDW+IdI2ww==
X-Google-Smtp-Source: AGRyM1tDYm6YCHK2lsPvaSb0tVwTOJJa7EWS2lPsbuwxVVYjHAwot5e5VS/ZQteNY3hoadWUPNvByA==
X-Received: by 2002:adf:fecd:0:b0:21e:61cd:713d with SMTP id
 q13-20020adffecd000000b0021e61cd713dmr6871207wrs.668.1658744676956; 
 Mon, 25 Jul 2022 03:24:36 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:86bb:8231:62d7:1874?
 ([2a01:cb19:8acf:5600:86bb:8231:62d7:1874])
 by smtp.gmail.com with ESMTPSA id
 q184-20020a1c43c1000000b003a302fb9df7sm17306052wma.21.2022.07.25.03.24.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 03:24:36 -0700 (PDT)
Message-ID: <4b407a41-7f31-01d3-ac93-61807be070be@smile.fr>
Date: Mon, 25 Jul 2022 12:24:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>,
 buildroot@buildroot.org
References: <20220725100745.2878896-1-arnout@mind.be>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20220725100745.2878896-1-arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=se28phaDSl7HhmcxPhtXvTDE55Mu72VuIka1ggXmgUQ=;
 b=BrgF4jz3pa6Gx2xwbPd14OENTey8JtxZeCFyc08CWGgZBcc9E2Cae/1pO9/NN0jgmb
 azl7kWfeTLbeCYzPdxb2N3xuWfJ7jr0PXN4AlTec4RbF7LoYMANN+/XEupRzz7eCrpQ0
 0d0H742tKunmlALJSG29KQONXt/7/zhNe52JCq59r+8eRhU6/N9QddM0Lida2s3OfrDd
 Rjy2mST5lt0fU0dvQnVoMnRegnGcZX9sEkxtQShlMW1JSOIlcMHSbiNfNSOOuHM3GzP2
 vex47Ff4WcgKblOoNxQQEfqTGNIzAAacUiWn/KxdVWkt8VDIk8hjGEFarF86djObqsZt
 +XwQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=BrgF4jz3
Subject: Re: [Buildroot] [PATCH] package/glibc: fix struct stat for
 microblaze with largefile
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQXJub3V0LAoKTGUgMjUvMDcvMjAyMiDDoCAxMjowNywgQXJub3V0IFZhbmRlY2FwcGVs
bGUgKEVzc2Vuc2l1bS9NaW5kKSBhIMOpY3JpdMKgOgo+IE9uIG1pY3JvYmxhemUsIHRoZXJlIGlz
IGEgc2VwYXJhdGUgdmVyc2lvbiBvZiBzdHJ1Y3Qgc3RhdCBmb3IgbGFyZ2VmaWxlCj4gYW5kIGZv
ciBub24tbGFyZ2VmaWxlLiBXaGVuIHRoZSBzdHJ1Y3Qgd2FzIHVwZGF0ZWQgdG8gaW5jbHVkZSB0
aGUKPiBzdF9tdGltLCBzdF9hdGltIGFuZCBzdF9jdGltIG1lbWJlcnMgZm9yIFBPU0lYLCB0aGUg
bGFyZ2VmaWxlIHZlcnNpb24KPiB3YXMgZm9yZ290dGVuLiBTaW5jZSB3ZSBvbmx5IHVzZSBsYXJn
ZWZpbGUgaW4gQnVpbGRyb290LCB0aGF0IG1lYW5zIHRoYXQKPiBtaWNyb2JsYXplIGRpZG4ndCBo
YXZlIHRoZXNlIG1lbWJlcnMgaW4gc3RydWN0IHN0YXQuIFRoaXMgYnJlYWtzIHRoZQo+IGJ1aWxk
IG9mIHNvbWUgcGFja2FnZXMuCj4gCj4gQ2hhbmdlIHRoZSBkZWZpbmUgYXJvdW5kIHN0X210aW0g
ZXRjLiB0byBfX1VTRV9YT1BFTjJLOCB0byBlbmFibGUgaXQgaW4KPiBwb3NpeCBjb250ZXh0IChp
LmUuIGJ5IGRlZmF1bHQpLgoKSXQgbWVhbnMgdGhhdCBnbGliYyBmb3IgbWljcm9ibGF6ZSB3aXRo
IGxhcmdlZmlsZSBzdXBwb3J0IGZhaWwgdG8gYnVpbGQgc29tZQpwYWNrYWdlcyBzaW5jZSAyLjIy
IChyZWxlYXNlZCBpbiAyMDE1KS4KClJldmlld2VkLWJ5OiBSb21haW4gTmFvdXIgPHJvbWFpbi5u
YW91ckBzbWlsZS5mcj4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgo+IAo+IEZpeGVzOgo+ICAtIGh0
dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzL2RkOTQ0YTNiZDRhYzBjOTRiMmJl
YzhhYzIwOTEwMGRhYWY0MzkwM2QgKHpzdGQpCj4gIC0gaHR0cDovL2F1dG9idWlsZC5idWlsZHJv
b3Qub3JnL3Jlc3VsdHMvNDYwOWM4ZTJhZjI0ZDk1MzZlYjMzMzk3YTQ2NTlhZDc0MGFjYTc0MiAo
ZGllaGFyZGVyKQo+IAo+IFNpZ25lZC1vZmYtYnk6IEFybm91dCBWYW5kZWNhcHBlbGxlIChFc3Nl
bnNpdW0vTWluZCkgPGFybm91dEBtaW5kLmJlPgo+IENjOiBGYWJyaWNlIEZvbnRhaW5lIDxmb250
YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KPiBDYzogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJA
Z21haWwuY29tPgo+IC0tLQo+ICAuLi5vdC1wb3NpeC1jb25mb3JtYW50LW9uLW1pY3JvYmxhemUt
d2kucGF0Y2ggfCAzNyArKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAzNyBp
bnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2dsaWJjLzAwMDItc3Ry
dWN0LXN0YXQtaXMtbm90LXBvc2l4LWNvbmZvcm1hbnQtb24tbWljcm9ibGF6ZS13aS5wYXRjaAo+
IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2dsaWJjLzAwMDItc3RydWN0LXN0YXQtaXMtbm90LXBv
c2l4LWNvbmZvcm1hbnQtb24tbWljcm9ibGF6ZS13aS5wYXRjaCBiL3BhY2thZ2UvZ2xpYmMvMDAw
Mi1zdHJ1Y3Qtc3RhdC1pcy1ub3QtcG9zaXgtY29uZm9ybWFudC1vbi1taWNyb2JsYXplLXdpLnBh
dGNoCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi45Nzk3ZjNhOTM1
Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvZ2xpYmMvMDAwMi1zdHJ1Y3Qtc3RhdC1p
cy1ub3QtcG9zaXgtY29uZm9ybWFudC1vbi1taWNyb2JsYXplLXdpLnBhdGNoCj4gQEAgLTAsMCAr
MSwzNyBAQAo+ICtGcm9tIDg3ZDQxNWNjMTMzZmY0OTNjY2QwMjQ2NGMwNjFjYjE3MWQxMWVmMmYg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4gK0Zyb206ICJBcm5vdXQgVmFuZGVjYXBwZWxsZSAo
RXNzZW5zaXVtL01pbmQpIiA8YXJub3V0QG1pbmQuYmU+Cj4gK0RhdGU6IE1vbiwgMjUgSnVsIDIw
MjIgMTE6MjU6MTUgKzAyMDAKPiArU3ViamVjdDogW1BBVENIXSBzdHJ1Y3Qgc3RhdCBpcyBub3Qg
cG9zaXggY29uZm9ybWFudCBvbiBtaWNyb2JsYXplIHdpdGgKPiArIF9fVVNFX0ZJTEVfT0ZGU0VU
NjQKPiArCj4gK0NvbW1pdCBhMDZiNDBjZGY1YmEwZDJhYjRmOWI0Yzc3ZDIxZTQ1ZmYyODRmYWM3
IHVwZGF0ZWQgc3RhdC5oIHRvIHVzZQo+ICtfX1VTRV9YT1BFTjJLOCBpbnN0ZWFkIG9mIF9fVVNF
X01JU0MgdG8gYWRkIHRoZSBzdF9hdGltLCBzdF9tdGltIGFuZAo+ICtzdF9jdGltIG1lbWJlcnMg
dG8gc3RydWN0IHN0YXQuIEhvd2V2ZXIsIGZvciBtaWNyb2JsYXplLCB0aGVyZSBhcmUgdHdvCj4g
K2RlZmluaXRpb25zIG9mIHN0cnVjdCBzdGF0LCBkZXBlbmRpbmcgb24gdGhlIF9fVVNFX0ZJTEVf
T0ZGU0VUNjQgbWFjcm8uCj4gK1RoZSBzZWNvbmQgb25lIHdhcyBub3QgdXBkYXRlZC4KPiArCj4g
K0NoYW5nZSBfX1VTRV9NSVNDIHRvIF9fVVNFX1hPUEVOMks4IGluIHRoZSBfX1VTRV9GSUxFX09G
RlNFVDY0IHZlcnNpb24KPiArb2Ygc3RydWN0IHN0YXQgZm9yIG1pY3JvYmxhemUuCj4gKwo+ICtV
cHN0cmVhbTogaHR0cHM6Ly9zb3VyY2V3YXJlLm9yZy9idWd6aWxsYS9zaG93X2J1Zy5jZ2k/aWQ9
Mjk0MDMKPiArU2lnbmVkLW9mZi1ieTogQXJub3V0IFZhbmRlY2FwcGVsbGUgKEVzc2Vuc2l1bS9N
aW5kKSA8YXJub3V0QG1pbmQuYmU+Cj4gKy0tLQo+ICsgc3lzZGVwcy91bml4L3N5c3YvbGludXgv
bWljcm9ibGF6ZS9iaXRzL3N0cnVjdF9zdGF0LmggfCAyICstCj4gKyAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiArCj4gK2RpZmYgLS1naXQgYS9zeXNkZXBz
L3VuaXgvc3lzdi9saW51eC9taWNyb2JsYXplL2JpdHMvc3RydWN0X3N0YXQuaCBiL3N5c2RlcHMv
dW5peC9zeXN2L2xpbnV4L21pY3JvYmxhemUvYml0cy9zdHJ1Y3Rfc3RhdC5oCj4gK2luZGV4IGEy
Nzg3ZTg4MzQzLi44NTA2OTdmNGZhNiAxMDA2NDQKPiArLS0tIGEvc3lzZGVwcy91bml4L3N5c3Yv
bGludXgvbWljcm9ibGF6ZS9iaXRzL3N0cnVjdF9zdGF0LmgKPiArKysrIGIvc3lzZGVwcy91bml4
L3N5c3YvbGludXgvbWljcm9ibGF6ZS9iaXRzL3N0cnVjdF9zdGF0LmgKPiArQEAgLTg5LDcgKzg5
LDcgQEAgc3RydWN0IHN0YXQKPiArICAgICAgICAgX19ibGtzaXplX3QgICAgICAgICAgICAgc3Rf
Ymxrc2l6ZTsgLyogT3B0aW1hbCBibG9jayBzaXplIGZvciBJL08uICAqLwo+ICsgICAgICAgICBp
bnQgICAgICAgICAgICAgICAgICAgICBfX3BhZDM7Cj4gKyAgICAgICAgIF9fYmxrY250NjRfdCAg
ICAgICAgICAgIHN0X2Jsb2NrczsgIC8qIE51bWJlciA1MTItYnl0ZSBibG9ja3MgYWxsb2NhdGVk
LiAgKi8KPiArLSMgaWZkZWYgX19VU0VfTUlTQwo+ICsrIyBpZmRlZiBfX1VTRV9YT1BFTjJLOAo+
ICsgICAgICAgICAvKiBOYW5vc2Vjb25kIHJlc29sdXRpb24gdGltZXN0YW1wcyBhcmUgc3RvcmVk
IGluIGEgZm9ybWF0Cj4gKyAgICAgICAgICAqIGVxdWl2YWxlbnQgdG8gJ3N0cnVjdCB0aW1lc3Bl
YycuIFRoaXMgaXMgdGhlIHR5cGUgdXNlZAo+ICsgICAgICAgICAgKiB3aGVuZXZlciBwb3NzaWJs
ZSBidXQgdGhlIFVuaXggbmFtZXNwYWNlIHJ1bGVzIGRvIG5vdCBhbGxvdyB0aGUKPiArLS0gCj4g
KzIuMzUuMwo+ICsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
