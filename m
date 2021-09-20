Return-Path: <SRS0=GPX0=OK=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DED39C433EF
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 09:30:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7429360F46
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 09:30:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7429360F46
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45B1F6064C;
	Mon, 20 Sep 2021 09:30:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id op7zkUM0DsKY; Mon, 20 Sep 2021 09:30:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B538E605A6;
	Mon, 20 Sep 2021 09:30:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2DC3D1BF36E
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 09:30:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 18A1940437
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 09:30:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F-dFFVuCWzOy for <buildroot@lists.busybox.net>;
 Mon, 20 Sep 2021 09:30:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9217040337
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 09:30:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7B4F960F56;
 Mon, 20 Sep 2021 09:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632130219;
 bh=iJV5NUDz2OnYoyLlZjUf4m3d3e5eUPsytOaTccJkV50=;
 h=In-Reply-To:References:Subject:Cc:To:From:Date:From;
 b=pHkA/jZ5e+KmJqnXuSX3QeA0TUg8DpKA4Ir7X9lo38yb/tUWmr5S8eRRfRa2z3yr0
 ihJHsomQjiZelBhXX3sDbKSkWLh7UpKdBEvtyfnxVb7HgQIB/acTvt6q8F1HxlQcwC
 1amJvh33zFPWBh0oMV8TXZM8pxguCNAYs1X44NMnjllYV4eLaA8eCJO0aOWEjFxoX7
 4ZWNLT6UBNum109J0psXy7LUBR/jE/IJkL7be6dZU/my2XI9QWr/4E16iQ4QXyCmGh
 3Fpz9TjcipZHUUsWHklH2rOnULHdclfAoGMYaRMdQaheDKkhgWueMRfZKM7mT3qycT
 6XspW+4MSNMVw==
MIME-Version: 1.0
In-Reply-To: <CAJPV9MrYNwrrZ34-JgRPO62Y_6yT0HZ564YuB_qFKYdsRo7nXQ@mail.gmail.com>
References: <20210830114531.2285178-1-jose.pekkarinen@unikie.com>
 <163189935709.536094.10717640766848618610@kwain>
 <CAJPV9MrYNwrrZ34-JgRPO62Y_6yT0HZ564YuB_qFKYdsRo7nXQ@mail.gmail.com>
To: José Pekkarinen <jose.pekkarinen@unikie.com>
From: Antoine Tenart <atenart@kernel.org>
Message-ID: <163213021612.4283.1135197152174473636@kwain>
Date: Mon, 20 Sep 2021 11:30:16 +0200
Subject: Re: [Buildroot] [PATCH] package/refpolicy: Treat all modules as
 custom
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

UXVvdGluZyBKb3PDqSBQZWtrYXJpbmVuICgyMDIxLTA5LTIwIDA4OjAxOjI3KQo+ICAgIE9uIEZy
aSwgU2VwIDE3LCAyMDIxIGF0IDg6MjIgUE0gQW50b2luZSBUZW5hcnQgPFsxXWF0ZW5hcnRAa2Vy
bmVsLm9yZz4KPiAgICB3cm90ZToKPiAgICAgIFF1b3RpbmcgSm9zw6kgUGVra2FyaW5lbiAoMjAy
MS0wOC0zMCAxMzo0NTozMSkKPiAgICAgID4gVGhlIGN1cnJlbnQgcHJvY2Vzc2luZyBvZiB0aGUg
bW9kdWxlcyBkb2Vzbid0IHdvcmsgZm9yCj4gICAgICA+IGN1c3RvbSBtYWRlIHBvbGljaWVzIGFw
cGVuZGVkIHRocm91Z2ggdGhlIGV4dHJhIGRpciBtZWNoYW5pc20sCj4gICAgICA+IHNpbmNlIHNl
ZCB3b24ndCBmaW5kIGEgbWF0Y2ggZm9yIGN1c3RvbSBtb2R1bGVzLCBpdCB3aWxsCj4gICAgICA+
IGNvbnRpbnVlIHdpdGhvdXQgdHJpZ2dlcmluZyBhbmQgZXJyb3IuIFRoaXMgcGF0Y2ggcmVtb3Zl
cwo+ICAgICAgPiBhbGwgdGhlIG1vZHVsZXMgZnJvbSBtb2R1bGVzLmNvbmYgYW5kIGFkZCB0aGVt
IG9uZSBieQo+ICAgICAgPiBvbmUgdXNpbmcgUkVGUE9MSUNZX01PRFVMRVMgdmFsdWVzLgo+IAo+
ICAgICAgSSdtIGZhaWxpbmcgdG8gc2VlIHdoYXQgcGFydGljdWxhciBzZXR1cCB0aGUgY2hhbmdl
IGJlbG93IHdvdWxkIGZpeC4KPiAKPiAgICAgIENvdWxkIHlvdSBlbGFib3JhdGUgb24gdGhlIGFi
b3ZlPyBNYXliZSBpbmNsdWRpbmcgY29uZmlndXJhdGlvbgo+ICAgICAgc25pcHBldHMgYW5kIGV4
YW1wbGUgb2Ygc3VjaCBhIG1vZHVsZSAod2l0aCB0aGUgZmlsZSB0cmVlLCBzdGFydGluZyBmcm9t
Cj4gICAgICBSRUZQT0xJQ1lfRVhUUkFfTU9EVUxFU19ESVJTKS4KPiAKPiAgICBBYnNvbHV0ZWx5
LCBpbiB0aGUgc2VjdXJpdHkgc2VjdGlvbiBvZiBteSAuY29uZmlnIHdlIGNhbiByZWFkIHRoZQo+
ICAgIGZvbGxvd2luZzoKPiAgICBCUjJfUEFDS0FHRV9QT0xJQ1lDT1JFVVRJTFM9eQo+ICAgIEJS
Ml9QQUNLQUdFX1JFRlBPTElDWT15Cj4gICAgQlIyX1JFRlBPTElDWV9FWFRSQV9NT0RVTEVTX0RJ
UlM9IiRPVVRQVVRfRElSL3NlbGludXgiCj4gICAgQlIyX1BBQ0tBR0VfUkVGUE9MSUNZX1BPTElD
WV9TVEFURV9FTkZPUkNJTkc9eQoKVGhpcyBzaG91bGQgd29yay4gRGlkIHlvdSBjaGVjayB0aGUg
Y29udGVudCBvZiB5b3VyIG1vZHVsZSBzaG93IHVwIGFmdGVyCmFwcGx5aW5nIHRoaXMgcGF0Y2g/
CgpJJ20gd29uZGVyaW5nIGlmIHRoaXMgaGFzIHRvIGRvIHdpdGg6CgogIEJSMl9SRUZQT0xJQ1lf
RVhUUkFfTU9EVUxFU19ESVJTPSIkT1VUUFVUX0RJUi9zZWxpbnV4IgoKV2hhdCBpcyB0aGUgdmFs
dWUgb2YgJE9VVFBVVF9ESVI/IFdoZXJlIGRvZXMgdGhpcyBjb21lIGZyb20/IENvdWxkIHlvdQp0
cnkgd2l0aG91dCB1c2luZyBhIHZhcmlhYmxlIGluIEJSMl9SRUZQT0xJQ1lfRVhUUkFfTU9EVUxF
U19ESVJTPwoKVGhhbmtzLApBbnRvaW5lCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGxpc3RzLmJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
