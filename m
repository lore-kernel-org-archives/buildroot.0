Return-Path: <SRS0=GPX0=OK=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 780F1C4332F
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 17:31:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FB6361AEF
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 17:31:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1FB6361AEF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA3F1400C6;
	Mon, 20 Sep 2021 17:31:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RlZG8q9_4XZ1; Mon, 20 Sep 2021 17:31:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E2E0540364;
	Mon, 20 Sep 2021 17:31:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9A97D1BF859
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 17:31:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8198240407
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 17:31:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6U7WLHSM4lHo for <buildroot@lists.busybox.net>;
 Mon, 20 Sep 2021 17:31:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 94659403BA
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 17:31:46 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 c6-20020a9d2786000000b005471981d559so3129838otb.5
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 10:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZXAblkeD0203lJai2SoRezraEM6jEhYF8D8ODnY5MBM=;
 b=Ef4fm8Oilq6aVH5uhCP1wEIyX1GHWuQIOBJ0dIqTcVWvjl8WM9zSugL3+l/p0E4nWT
 ulTIz7qkY8b5hlRv9VacpSXKRcnZN0+sq4JyWs8/jDj75rPLieeKrm8cGkT6gUI/fGBb
 pNBFXoyU3vryg4G+L7j2BdWdfI+RGNFKYZArvi7Io4cTKV67tVJyYcY2hSjgDA1wykkY
 igbPuK0ra98N28VhOHOSvtS6yonMzgRxCOMRiApczLDsaeChHB2zkGkrlme7bm3UPWd+
 vI3NQ3uR+6iHUMgYu82rCV04vj0tbi451sC/HOJLFVk2iSWPUKQbV3Z5S/xwLrmkh2U5
 FaYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZXAblkeD0203lJai2SoRezraEM6jEhYF8D8ODnY5MBM=;
 b=V5JVnJwsd3wRZ3qezM8V+WCCS57ES01+uH8Tou9C8jjYDMc+JDmY9fPKXICJ/SuH0n
 SZqmgCa2YMuLUOA01ao3K+TeOcwgZBItZFtsY+s0newEzCLfDRhQh1kLIqmrlH9A5mz9
 0jV+hvuVDdr20+pEsqNVl7mq4wbRUSQyFM094b9busE4wCgALEKDezY6wGYmbg1Hwvlk
 OzCiDo3LyXldrxS+eQtTEAfkSWdaUOfd8xrPb8/orJKCy9ksnzjCF/j2UkGzBqXoyuEo
 Lk2a/pzdE4poKIX+yb6bh2YGhfcmhkWfeo22K6cyWtDyCX4EM4ry49W2Kt/XWAAVfhaP
 XjWg==
X-Gm-Message-State: AOAM532qCviTeJgYqeBjK8345aESk1DwwVLmbsXO8v/G5L92rYAO04kC
 Z5DfNJiSiTCLCuE2C73GUB8TZY7Ox1PAdogKB2CKlwVq2mE=
X-Google-Smtp-Source: ABdhPJxVJqqufGHUIo6q1zLbdZ5OrmxWwhYH2svG0gKB6hqIQQi8/xhA4+kYiAlRjwFu6iAnfskoBKpU/fr7Dbxvrmg=
X-Received: by 2002:a05:6830:4182:: with SMTP id
 r2mr8645735otu.242.1632159105421; 
 Mon, 20 Sep 2021 10:31:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210920173017.695537-1-aduskett@gmail.com>
In-Reply-To: <20210920173017.695537-1-aduskett@gmail.com>
From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 20 Sep 2021 10:31:34 -0700
Message-ID: <CAFSsvmoERFpbx9HkX9EgiSYDvuPKdiA2M0tZsp2Zpfpd+We-kg@mail.gmail.com>
To: buildroot <buildroot@buildroot.org>
Subject: Re: [Buildroot] [PATCH v2 1/1] package/libglib2: bump version to
 2.68.4
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

VGhpcyB0aW1lIHdpdGggMTAwJSBsZXNzIG5leHQgYnJhbmNoIGFuZCAxMDAlIG1vcmUgbWFzdGVy
IGJyYW5jaC4KCk9uIE1vbiwgU2VwIDIwLCAyMDIxIGF0IDEwOjMwIEFNIEFkYW0gRHVza2V0dCA8
YWR1c2tldHRAZ21haWwuY29tPiB3cm90ZToKPgo+IFNpZ25lZC1vZmYtYnk6IEFkYW0gRHVza2V0
dCA8YWR1c2tldHRAZ21haWwuY29tPgo+IC0tLQo+IENoYW5nZXMgVjEgLT4gVjI6Cj4gICAtIFJl
ZmFjdG9yIGFnYWluc3QgbWFzdGVyIGJyYW5jaCBpbnN0ZWFkIG9mIG5leHQuCj4KPiAgLi4uLzAw
MDItcmVtb3ZlLWNwcC1yZXF1aXJlbWVudC5wYXRjaCAgICAgICAgIHwgIDIgKy0KPiAgLi4udGx5
LXVzZS0zLXBhcmFtZXRlcnMtZm9yLWNsb3NlX3JhbmdlLnBhdGNoIHwgMzMgLS0tLS0tLS0tLS0t
LS0tLS0tLQo+ICBwYWNrYWdlL2xpYmdsaWIyL2xpYmdsaWIyLmhhc2ggICAgICAgICAgICAgICAg
fCAgNCArLS0KPiAgcGFja2FnZS9saWJnbGliMi9saWJnbGliMi5tayAgICAgICAgICAgICAgICAg
IHwgIDIgKy0KPiAgNCBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDM3IGRlbGV0aW9u
cygtKQo+ICBkZWxldGUgbW9kZSAxMDA2NDQgcGFja2FnZS9saWJnbGliMi8wMDA0LWNvcnJlY3Rs
eS11c2UtMy1wYXJhbWV0ZXJzLWZvci1jbG9zZV9yYW5nZS5wYXRjaAo+Cj4gZGlmZiAtLWdpdCBh
L3BhY2thZ2UvbGliZ2xpYjIvMDAwMi1yZW1vdmUtY3BwLXJlcXVpcmVtZW50LnBhdGNoIGIvcGFj
a2FnZS9saWJnbGliMi8wMDAyLXJlbW92ZS1jcHAtcmVxdWlyZW1lbnQucGF0Y2gKPiBpbmRleCA5
MzkzYmQyNThhLi5jNDAyY2JhZmE1IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbGliZ2xpYjIvMDAw
Mi1yZW1vdmUtY3BwLXJlcXVpcmVtZW50LnBhdGNoCj4gKysrIGIvcGFja2FnZS9saWJnbGliMi8w
MDAyLXJlbW92ZS1jcHAtcmVxdWlyZW1lbnQucGF0Y2gKPiBAQCAtMzUsNyArMzUsNyBAQCBpbmRl
eCA0YmJmNGMyLi5hYzU5ZjRlIDEwMDY0NAo+ICBAQCAtMSw0ICsxLDQgQEAKPiAgLXByb2plY3Qo
J2dsaWInLCAnYycsICdjcHAnLAo+ICArcHJvamVjdCgnZ2xpYicsICdjJywKPiAtICAgdmVyc2lv
biA6ICcyLjY4LjInLAo+ICsgICB2ZXJzaW9uIDogJzIuNjguNCcsCj4gICAgICMgTk9URTogV2Ug
a2VlcCB0aGlzIHBpbm5lZCBhdCAwLjQ5IGJlY2F1c2UgdGhhdCdzIHdoYXQgRGViaWFuIDEwIHNo
aXBzCj4gICAgIG1lc29uX3ZlcnNpb24gOiAnPj0gMC40OS4yJywKPiAgQEAgLTEwLDcgKzEwLDYg
QEAgcHJvamVjdCgnZ2xpYicsICdjJywgJ2NwcCcsCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGli
Z2xpYjIvMDAwNC1jb3JyZWN0bHktdXNlLTMtcGFyYW1ldGVycy1mb3ItY2xvc2VfcmFuZ2UucGF0
Y2ggYi9wYWNrYWdlL2xpYmdsaWIyLzAwMDQtY29ycmVjdGx5LXVzZS0zLXBhcmFtZXRlcnMtZm9y
LWNsb3NlX3JhbmdlLnBhdGNoCj4gZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggYmZj
YTRiMTRlZi4uMDAwMDAwMDAwMAo+IC0tLSBhL3BhY2thZ2UvbGliZ2xpYjIvMDAwNC1jb3JyZWN0
bHktdXNlLTMtcGFyYW1ldGVycy1mb3ItY2xvc2VfcmFuZ2UucGF0Y2gKPiArKysgL2Rldi9udWxs
Cj4gQEAgLTEsMzMgKzAsMCBAQAo+IC1Gcm9tIGI3MTExN2Q4OTQzNGRiODNkMzRiYzFiOTgxY2Ew
M2Q0YmUyOTk1NzYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4gLUZyb206IEtoZW0gUmFqIDxy
YWoua2hlbUBnbWFpbC5jb20+Cj4gLURhdGU6IFRodSwgOCBKdWwgMjAyMSAxNzoyNjo0MyAtMDcw
MAo+IC1TdWJqZWN0OiBbUEFUQ0hdIGNvcnJlY3RseSB1c2UgMyBwYXJhbWV0ZXJzIGZvciBjbG9z
ZV9yYW5nZQo+IC0KPiAtbGliYyBpbXBsZW1lbnRhdGlvbiBoYXMgMyBwYXJhbWV0ZXIgZS5nLgo+
IC1odHRwczovL3d3dy5mcmVlYnNkLm9yZy9jZ2kvbWFuLmNnaT9xdWVyeT1jbG9zZV9yYW5nZSZz
ZWt0aW9uPTImZm9ybWF0PWh0bWwKPiAtCj4gLVNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWou
a2hlbUBnbWFpbC5jb20+Cj4gLQo+IC1bUmV0cmlldmVkIGZyb206Cj4gLWh0dHBzOi8vZ2l0bGFi
Lmdub21lLm9yZy9HTk9NRS9nbGliLy0vY29tbWl0L2I3MTExN2Q4OTQzNGRiODNkMzRiYzFiOTgx
Y2EwM2Q0YmUyOTk1NzZdCj4gLVNpZ25lZC1vZmYtYnk6IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRh
aW5lLmZhYnJpY2VAZ21haWwuY29tPgo+IC0tLS0KPiAtIGdsaWIvZ3NwYXduLmMgfCAyICstCj4g
LSAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAtCj4gLWRp
ZmYgLS1naXQgYS9nbGliL2dzcGF3bi5jIGIvZ2xpYi9nc3Bhd24uYwo+IC1pbmRleCA4OTk2NDdj
MmYuLjMwNzNhMTBhNCAxMDA2NDQKPiAtLS0tIGEvZ2xpYi9nc3Bhd24uYwo+IC0rKysgYi9nbGli
L2dzcGF3bi5jCj4gLUBAIC0xNTIwLDcgKzE1MjAsNyBAQCBzYWZlX2Nsb3NlZnJvbSAoaW50IGxv
d2ZkKQo+IC0gICAgKgo+IC0gICAgKiBIYW5kbGUgRU5PU1lTIGluIGNhc2UgaXTigJlzIHN1cHBv
cnRlZCBpbiBsaWJjIGJ1dCBub3QgdGhlIGtlcm5lbDsgaWYgc28sCj4gLSAgICAqIGZhbGwgYmFj
ayB0byBzYWZlX2Zkd2FsaygpLiAqLwo+IC0tICBpZiAoY2xvc2VfcmFuZ2UgKGxvd2ZkLCBHX01B
WFVJTlQpICE9IDAgJiYgZXJybm8gPT0gRU5PU1lTKQo+IC0rICBpZiAoY2xvc2VfcmFuZ2UgKGxv
d2ZkLCBHX01BWFVJTlQsIDApICE9IDAgJiYgZXJybm8gPT0gRU5PU1lTKQo+IC0gI2VuZGlmICAv
KiBIQVZFX0NMT1NFX1JBTkdFICovCj4gLSAgICh2b2lkKSBzYWZlX2Zkd2FsayAoY2xvc2VfZnVu
YywgR0lOVF9UT19QT0lOVEVSIChsb3dmZCkpOwo+IC0gI2VuZGlmCj4gLS0tCj4gLUdpdExhYgo+
IC0KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJnbGliMi9saWJnbGliMi5oYXNoIGIvcGFja2Fn
ZS9saWJnbGliMi9saWJnbGliMi5oYXNoCj4gaW5kZXggMTVlMDA4NWY3OC4uZDQyMWUwMjVmZiAx
MDA2NDQKPiAtLS0gYS9wYWNrYWdlL2xpYmdsaWIyL2xpYmdsaWIyLmhhc2gKPiArKysgYi9wYWNr
YWdlL2xpYmdsaWIyL2xpYmdsaWIyLmhhc2gKPiBAQCAtMSw0ICsxLDQgQEAKPiAtIyBodHRwczov
L2Rvd25sb2FkLmdub21lLm9yZy9zb3VyY2VzL2dsaWIvMi42OC9nbGliLTIuNjguMi5zaGEyNTZz
dW0KPiAtc2hhMjU2ICBlY2M3Nzk4YTljYzAzNGVhYmRmZDdmMjQ2ZTZkZDQ2MWNkYmYxMTc1ZmNj
MmU5ODY3Y2M3ZGE3YjczMDllMGZiICBnbGliLTIuNjguMi50YXIueHoKPiArIyBodHRwczovL2Rv
d25sb2FkLmdub21lLm9yZy9zb3VyY2VzL2dsaWIvMi42OC9nbGliLTIuNjguNC5zaGEyNTZzdW0K
PiArc2hhMjU2ICA2MmZkMDYxZDA4YTc1NDkyNjE3ZTYyNWE3M2UyYzA1ZTI1OWY4MzFhY2JiOGUx
ZjhiOWM4MWYyM2Y3OTkzYTNiICBnbGliLTIuNjguNC50YXIueHoKPiAgIyBMaWNlbnNlIGZpbGVz
LCBsb2NhbGx5IGNhbGN1bGF0ZWQKPiAgc2hhMjU2ICBkYzYyNjUyMGRjZDUzYTIyZjcyN2FmM2Vl
NDJjNzcwZTU2Yzk3YTY0ZmUzYWRiMDYzNzk5ZDhhYjAzMmZlNTUxICBDT1BZSU5HCj4gZGlmZiAt
LWdpdCBhL3BhY2thZ2UvbGliZ2xpYjIvbGliZ2xpYjIubWsgYi9wYWNrYWdlL2xpYmdsaWIyL2xp
YmdsaWIyLm1rCj4gaW5kZXggNGYxMzYyMmUzNi4uYWY3M2FlYjNiZiAxMDA2NDQKPiAtLS0gYS9w
YWNrYWdlL2xpYmdsaWIyL2xpYmdsaWIyLm1rCj4gKysrIGIvcGFja2FnZS9saWJnbGliMi9saWJn
bGliMi5tawo+IEBAIC01LDcgKzUsNyBAQAo+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+Cj4g
IExJQkdMSUIyX1ZFUlNJT05fTUFKT1IgPSAyLjY4Cj4gLUxJQkdMSUIyX1ZFUlNJT04gPSAkKExJ
QkdMSUIyX1ZFUlNJT05fTUFKT1IpLjIKPiArTElCR0xJQjJfVkVSU0lPTiA9ICQoTElCR0xJQjJf
VkVSU0lPTl9NQUpPUikuNAo+ICBMSUJHTElCMl9TT1VSQ0UgPSBnbGliLSQoTElCR0xJQjJfVkVS
U0lPTikudGFyLnh6Cj4gIExJQkdMSUIyX1NJVEUgPSBodHRwOi8vZnRwLmdub21lLm9yZy9wdWIv
Z25vbWUvc291cmNlcy9nbGliLyQoTElCR0xJQjJfVkVSU0lPTl9NQUpPUikKPiAgTElCR0xJQjJf
TElDRU5TRSA9IExHUEwtMi4xKwo+IC0tCj4gMi4zMC4yCj4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAbGlzdHMuYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
