Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CDE7C433EF
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 02:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D91C419C7;
	Mon, 30 May 2022 02:01:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u-0d7jBcSGy0; Mon, 30 May 2022 02:01:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A975419BB;
	Mon, 30 May 2022 02:01:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D26B71BF352
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 02:01:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF64184159
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 02:01:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=iki.fi
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XKZ-xUBFphzO for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 02:01:06 +0000 (UTC)
X-Greylist: delayed 00:06:09 by SQLgrey-1.8.0
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6EA2784157
 for <buildroot@buildroot.org>; Mon, 30 May 2022 02:01:06 +0000 (UTC)
Received: from localhost (91-154-92-55.elisa-laajakaista.fi [91.154.92.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: sakkinen)
 by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 96FE21B0004B;
 Mon, 30 May 2022 04:54:51 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu; 
 t=1653875691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8eUqSzMfFIU+uBUQUmPhOqgv9y+SEI4IoMUmnxwq+2s=;
 b=HFzF6L8/Ko++hrqlK3BfBa9XhhZYPdz9HY9A/n8DWogR6Bn2mWa+7yiif1J2sJ5242rqCM
 JKqPC7C75EFMBFc0jQHng4yf+jIt2RcRRZygEVc/Zx+WWjBAPtjSf/9pV8rE7SIZzgON96
 ZTYMXtUAdj0sCNUjvbSLyd8iVbtyHJkJjLA0IbcVQsCcuun0z9ybtLmD0CV5IkZqJJI4H9
 yn2wjBsATdCYk59hG0EDa/0IZmbGO2vvU0wqjMyBFU10frDfm/QVjbexZwE4K7o4LPLt6E
 gF3JPmZC6/iNLKHLpq/kAZG6kIdxDdYRcvNVFEmNx+JiN7Ssa8AK8x45k8UBrg==
Message-ID: <bdc4cbe5ecffc4bffc805945fd51aea97de1245a.camel@iki.fi>
From: Jarkko Sakkinen <jarkko.sakkinen@iki.fi>
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
Date: Mon, 30 May 2022 04:53:05 +0300
In-Reply-To: <469edce9-3d4d-0339-5974-bd553c7d3460@mind.be>
References: <20220517172110.22265-1-jarkko.sakkinen@iki.fi>
 <469edce9-3d4d-0339-5974-bd553c7d3460@mind.be>
User-Agent: Evolution 3.44.2 
MIME-Version: 1.0
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1653875691; a=rsa-sha256; cv=none;
 b=tVhEyBS8IZUL3mQzOuwO8XWlyCxSSF0hdF8Wksl0gQGeV8rOF+SE3uB8tJtZrq7DGPxt48
 mzZ/tYkcI7z8En0Ne2j4A5+MGNZYdpDD8oA2YklaQseCcSBzUfC8t3ABVwoH3ZUYlKyif9
 Y6p6bWbedGCW+mTN8/vTWp+wNZJTn/AnJgC4+UZ1yX4+mx/fF/HFggAs5k3127Y370fzUZ
 nbLwzSD8DR+Z04eog823i1rtInMpEOdLjAJgQdU7wqOPfhvHZ9/Vgcy1Z3TzRvJ3s3yTbk
 Xubbc6z5509MBEXO93e3rKY5tRV+BoT+iitvo1ieMNRDKrvY4BziSJFhIjTSzA==
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=sakkinen smtp.mailfrom=jarkko.sakkinen@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
 s=lahtoruutu; t=1653875691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8eUqSzMfFIU+uBUQUmPhOqgv9y+SEI4IoMUmnxwq+2s=;
 b=YRAUUw5rr6B+GpIscR2fZHUtITH03dArJsUMbGEfhZQSD0oX3ILxeGv9rFBcHT2H1IXDkO
 c4jUou/uxeMxj2wTrcdbcu2keI6AX/9Oj9YYJEl9BWd4ZVNU5f+XHGsVTKBb3VpU0hMdjH
 KvjW+ZWOGQmq6zc9QeQnm3VH+aZIYckAU3T8l44PPmZok2ztyOw8+teSK02/TiSKZtTv33
 73eRpiDvisrY6XmBxfVSPSDQW785HVa4hfJgtCFyT8X3nl3/J7zPtzZbOrcGgyx4a9bKyW
 4/vSbSelQln/WAFx9aVzf5VZ44W1WO3aTL1J7ARwXVnqmvOiK3RnWIVhrrwEaQ==
Subject: Re: [Buildroot] [PATCH RFC] package/enarx: add
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCAyMDIyLTA1LTE4IGF0IDIwOjIzICswMjAwLCBBcm5vdXQgVmFuZGVjYXBwZWxsZSB3
cm90ZToKPiBpZmVxICgkKEJSMl9QQUNLQUdFX0hPU1RfUlVTVENfTklHSFRMWSkseSkKPiBSVVNU
X1ZFUlNJT04gPSAyMDIyLTA1LTE3Cj4gUlVTVF9TT1VSQ0UgPSBydXN0Yy1uaWdodGx5LXNyYy50
YXIueHo/dmVyc2lvbj0kKFJVU1RfVkVSU0lPTikKPiBSVVNUX1NJVEUgPSBodHRwczovL3N0YXRp
Yy5ydXN0LWxhbmcub3JnL2Rpc3QvJChSVVNUX1ZFUlNJT04pCj4gZWxzZQo+IFJVU1RfVkVSU0lP
TiA9IDEuNjAuMAo+IFJVU1RfU09VUkNFID0gcnVzdGMtJChSVVNUX1ZFUlNJT04pLXNyYy50YXIu
eHoKPiBSVVNUX1NJVEUgPSBodHRwczovL3N0YXRpYy5ydXN0LWxhbmcub3JnL2Rpc3QKPiBlbmRp
Zgo+IAo+IMKgIFRoZSA/dmVyc2lvbj0gdGhpbmcgaXMgbmVlZGVkIHRvIGJlIGFibGUgdG8gdXBk
YXRlIHRoZSBuaWdodGx5IHZlcnNpb24uIFdoZW4gCj4geW91IHVwZGF0ZSBpdCwgaXRzIGhhc2gg
d2lsbCBjaGFuZ2UsIHNvIHdlIG5lZWQgdG8gbWFrZSBzdXJlIGl0IGFsc28gaGFzIGEgCj4gZGlm
ZmVyZW50IGZpbGVuYW1lLiBTdHVmZiBhZnRlciA/IGlzIGlnbm9yZWQgYnkgdGhlIHNlcnZlciwg
YnV0IHdpbGwgYmUgYWRkZWQgdG8gCj4gdGhlIGxvY2FsIGZpbGVuYW1lLiBBZnRlciB1cGRhdGlu
ZywgdGhhdCB2ZXJzaW9uIGNoYW5nZXMgc28gdGhlIGZpbGVuYW1lIGNoYW5nZXMgCj4gc28gaXQg
bm8gbG9uZ2VyIGNvbmZsaWN0cyB3aXRoIHRoZSBoYXNoLgoKVGhhbmtzIGEgbG90IGZvciB0aGUg
c3VnZ2VzdGlvbi4gSSdtIHdvcmtpbmcgb24KYSBwYXRjaCBiYXNlZCBvbiB0aGlzLiBUcnlpbmcg
dG8gbWFrZSBpdCBhdmFpbGFibGUKc29vbi4KCkJSLCBKYXJra28KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
