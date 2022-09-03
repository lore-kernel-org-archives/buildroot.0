Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C55EFC54EE9
	for <buildroot@archiver.kernel.org>; Sat,  3 Sep 2022 12:35:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04549410C5;
	Sat,  3 Sep 2022 12:35:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04549410C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g75b7HZVkf4S; Sat,  3 Sep 2022 12:35:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8082410BE;
	Sat,  3 Sep 2022 12:35:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8082410BE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F2B391BF2C6
 for <buildroot@lists.busybox.net>; Sat,  3 Sep 2022 12:35:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD5CA404AA
 for <buildroot@lists.busybox.net>; Sat,  3 Sep 2022 12:35:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD5CA404AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ynyHadI3smNv for <buildroot@lists.busybox.net>;
 Sat,  3 Sep 2022 12:34:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B59F440105
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B59F440105
 for <buildroot@buildroot.org>; Sat,  3 Sep 2022 12:34:59 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id b16so5412764wru.7
 for <buildroot@buildroot.org>; Sat, 03 Sep 2022 05:34:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=WNVqU34GrGa8Yp8pXR5VzAdJgjxfAbcO4Dp7YdglZmU=;
 b=nOPNdf1JGXD7aPq3ykaB3FvqdQHwihSumtnxnUQMvDL18LBYfyOKpVCSADVfyvge9x
 ndOLLyXqqGZg7MgswV9TPju8+bH6zXs0Hd0tTCiq/wDUl4Z7lxLHIVCRDxCDup8UdGst
 xqkeVRZAIjzA4wUjZKcDwlwadtPU5eCWdTrIYYOR9se5UKlQTKekLb2xFN4WC+Cwu68f
 TxxEs2L9PNz8Ct/UECxeM6+giIf+TndzIt7d7iCQadKw6yXMsUqLR5hzXqW+1ByrR2Hp
 zsp1T9LKqUhRNOpbdMAqfcBwmjHYmT/dc3K2dP16iFYCejxaSo2LXuNUov8rtZoupiXW
 BcEw==
X-Gm-Message-State: ACgBeo3w21owzqfLHKtFfRhFXQSKdOBoje2/XE6IAD55ZIGHIQBpFxYC
 Qh0VbHGTzp+qJVVEhXk/0x8hkFyOpag=
X-Google-Smtp-Source: AA6agR5JFesDLGbpC7hrR5cloiRzeFU5EdLr3haDZDlXA1/GBIh1e97PRDdrcgFM1LKt95jfyEw2NA==
X-Received: by 2002:a5d:610b:0:b0:226:d241:65e8 with SMTP id
 v11-20020a5d610b000000b00226d24165e8mr19016019wrt.703.1662208497845; 
 Sat, 03 Sep 2022 05:34:57 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521?
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id
 g17-20020a5d5551000000b0022862ba216esm532671wrw.46.2022.09.03.05.34.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Sep 2022 05:34:57 -0700 (PDT)
Message-ID: <79d8c09f-a342-2049-a3e2-ac79c27fbee0@gmail.com>
Date: Sat, 3 Sep 2022 14:34:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
To: Stafford Horne <shorne@gmail.com>, Arnout Vandecappelle <arnout@mind.be>
References: <20220830210429.99DB7881AE@busybox.osuosl.org>
 <YxIiBS/gUC6pLboY@oscomms1>
Content-Language: en-US
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <YxIiBS/gUC6pLboY@oscomms1>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=WNVqU34GrGa8Yp8pXR5VzAdJgjxfAbcO4Dp7YdglZmU=;
 b=BYvSjzUD6srRmZaRzGhLf9wsZ48hdtmQqYz5m9g0NRK6gcczJtTGsfNlMZqmeKtDBr
 KnNCLDjATirqoiA8ZQMJiGs/ARrXidU8293yajdYv9QS0etSE80jsa3cYt3r8bKUttgG
 pudB9vsS0qfiHUTKdjyryJGwIJs0M8UycQY7SQyKkMRa3cwu05BUSJH8RBJDbsSTGXWe
 p/mvwgECc2qMW3YH37lmjYGEZFVm1s5m/9WZTCdrv68MPTSTEiUAoGyHk/AgYJPyWtg/
 79keSDQYzph5YKYOPmMJ/Dep55FP9p++62vQ2iPIbcVHQQTt3MzFn71RCgoghDYgA4Fc
 PddQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=BYvSjzUD
Subject: Re: [Buildroot] [git commit] package/gdb: prevent gdbserver being
 selected for or1k builds
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgU3RhZmZvcmQsCgpMZSAwMi8wOS8yMDIyIMOgIDE3OjMyLCBTdGFmZm9yZCBIb3JuZSBhIMOp
Y3JpdMKgOgo+IE9uIFR1ZSwgQXVnIDMwLCAyMDIyIGF0IDEwOjU4OjAxUE0gKzAyMDAsIEFybm91
dCBWYW5kZWNhcHBlbGxlIHdyb3RlOgo+PiBjb21taXQ6IGh0dHBzOi8vZ2l0LmJ1aWxkcm9vdC5u
ZXQvYnVpbGRyb290L2NvbW1pdC8/aWQ9ZDE2ZGI2ZDhhNDA1Yzg0MTBmNGU4OTJhMzk5MzY4NmEz
MjY5YmRjMgo+PiBicmFuY2g6IGh0dHBzOi8vZ2l0LmJ1aWxkcm9vdC5uZXQvYnVpbGRyb290L2Nv
bW1pdC8/aWQ9cmVmcy9oZWFkcy9tYXN0ZXIKPj4KPj4gVGhlcmUgaXMgY3VycmVudGx5IG5vIHZl
cnNpb24gb2YgZ2Ric2VydmVyIGZvciBvcjFrLiBVbnRpbCB0aGlzCj4+IGlzIGltcGxlbWVudGVk
IHdlIHdpbGwgcHJldmVudCBib3RoIHRoZSBkaXJlY3QgYW5kIGluZGlyZWN0Cj4+IHNlbGVjdGlv
biBvZiBnZGJzZXJ2ZXIgZm9yIG9yMWsgYnVpbGRzLiBJbiBwcmFjdGljZSB0aGlzIG1lYW5zCj4+
IHRoYXQgJ2Nyb3NzIGdkYiBmb3IgdGhlIGhvc3QnIGNhbm5vdCBiZSBzZWxlY3RlZCBhbmQgdGhh
dAo+PiAnZnVsbCBkZWJ1Z2dlcicgbXVzdCBiZSBhdXRvbWF0aWNhbGx5IHNlbGVjdGVkIGZvciB0
aGUgZ2RiIHRhcmdldAo+PiBwYWNrYWdlLgo+Pgo+PiBUaGlzIHBhcnRpYWxseSByZXZlcnRzIGNv
bW1pdCA5OTFiN2I5OTBhZDhjZDRhMzc1NjRjZDkxZDViYjBlZTdlMWU5ZjExCj4+IHdoaWNoIGNs
YWltZWQgdGhhdCBnZGJzZXJ2ZXIgZm9yIG9yMWsgd2FzIGFscmVhZHkgc3VwcG9ydGVkIGJlZm9y
ZQo+PiB2ZXJzaW9uIDguMy4gVGhhdCBpcyBub3QgdHJ1ZSAtIHRoZSBjb21taXQgdGhhdCBhZGRz
IGdkYnNlcnZlciBzdXBwb3J0Cj4+IGZvciBvcjFrIFsxXSB3YXMgb25seSBtZXJnZWQgZm9yIHZl
cnNpb24gMTIuMSwgd2hpY2ggaGFzbid0IGJlZW4KPj4gaW50ZWdyYXRlZCBpbiBCdWlsZHJvb3Qg
eWV0Lgo+IAo+IFRoYW5rcywgc29ycnkgZm9yIHRoYXQuICBUaGUgZ2Ric2VydmVyIHN1cHBvcnQg
aXMgYSBiaXQgbmV3ZXIgKGxhc3QgeWVhcj8pCj4gY29tcGFyZWQgdG8gZ2RiIHdoaWNoIHdhcyBh
ZGRlZCBzZXZlcmFsIHllYXJzIGFnby4KCk5vIHByb2JsZW0sIEkgd291bGQgc2F5IGl0J3MgbWF0
ZXIgb2YgdGltZSB0byBmdWxseSBzdXBwb3J0IG9yMWsgaW4gZ2RiIHBhY2thZ2UgOikKVGhhbmsg
eW91IGZvciB5b3VyIHdvcmsgaW4gdXBzdHJlYW0gdG9vbGNoYWluIHByb2plY3RzIG9yMWsgdG8g
bWFrZSB0aGlzIHBvc3NpYmxlIQoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IAo+IC1TdGFmZm9y
ZAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVp
bGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
