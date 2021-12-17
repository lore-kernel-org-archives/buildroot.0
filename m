Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B1AC433F5
	for <buildroot@archiver.kernel.org>; Fri, 17 Dec 2021 17:54:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F5D5417F6;
	Fri, 17 Dec 2021 17:54:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id quYXln5BZe26; Fri, 17 Dec 2021 17:54:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5606141EB9;
	Fri, 17 Dec 2021 17:54:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BCB871BF2AF
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 17:54:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B080640633
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 17:54:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uZ4x1L4OJGUi for <buildroot@lists.busybox.net>;
 Fri, 17 Dec 2021 17:54:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6F58F40616
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 17:54:12 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id z29so10741591edl.7
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 09:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=hVxGsiKJnMzNBwHqALq8K2J0lOufu2xY2TFzdD7sdnE=;
 b=Kdx0kMxgrHtexMhV15BX+fGI7cN5LJn4TsLheyeVkCSlyqYDU4Sni3sKinfFSHCW1s
 r/lb0/IXQqZL3yh4CXSdo48AsAnlJsJaHgLxmNw1ujvmslhTMTYnK1kI09FXjpvBKkWw
 4avbFpZXzJ+cjqrTnV8LLBriYodYw6hfWgkV7wuR9Jt8NfjSahQPJY90Dy2qVTgb17HJ
 R2ZkYq9S0Kg8J7IspXAdp7JPYgzK6ApGNpJn83TfEJraKa1z4Imv3nvHEw6V3VrjIPup
 +upfJ7vPkmVfLvrjp69Z9lP4znZjT7vyIyQ5PF/OIgWNuGFhKJNRH29wFoFRWQt9WfhQ
 UYMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=hVxGsiKJnMzNBwHqALq8K2J0lOufu2xY2TFzdD7sdnE=;
 b=sXoUD7hQFvB0tjhyPdSqOyUKseMZzizkvwNa5dTzjvktgB1uQuxY955xZPJEE6iUqE
 XllaLRoLEo0RjB0LA4I1nYgPMka2xu5RybwMziNhT5GMVLVJGwPTt5VzPW5wSqDiKBgO
 fyHW1GGKP6AEpTZUbgar8P3XlnQhFkEocU+qTEkh1qC3qlPhJ53b709JvU4RXNxq0D9V
 vbGwTOoKEsk4XaO2ZorvJ1LHbNZN8gagJnsvjRsPfPrcvZoSJjNeZg+1hbQ3FAcqzHnF
 xTRJ7yD9WmDCwa15lP4qci/qgauypfUQv+zLCA9mIx1E5AQePjURZAXYR7p0SFx+kk75
 CGaA==
X-Gm-Message-State: AOAM533pI0N9P5SOkyjQsI8dnC1SguuHHxJOYh4h5fkkY9SlacPmrEcA
 2A9dCyXTNc/hXOFL5067v9G1nw==
X-Google-Smtp-Source: ABdhPJzsenAbpUTCag4yamQBxvxB6N8MzjLs7CzviiTF6Ay4wgduTdMjNs0VYHBmyQ5SSYlId+0U9w==
X-Received: by 2002:a17:907:1626:: with SMTP id
 hb38mr3575250ejc.481.1639763650322; 
 Fri, 17 Dec 2021 09:54:10 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id gb4sm3051649ejc.90.2021.12.17.09.54.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 09:54:09 -0800 (PST)
Message-ID: <ee3a832d-980a-5f71-1d5d-fcfd8930e7ff@mind.be>
Date: Fri, 17 Dec 2021 18:54:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Thierry Bultel <thierry.bultel@linatsea.fr>, buildroot@buildroot.org
References: <20211215180021.274991-1-thierry.bultel@linatsea.fr>
 <c0ae5edb-ad84-ecc3-8e3e-77e0d11b34e1@mind.be>
 <45e4b674-3187-9c3b-6b7f-0fca30eae869@linatsea.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <45e4b674-3187-9c3b-6b7f-0fca30eae869@linatsea.fr>
Subject: Re: [Buildroot] [PATCH 1/3] package/cross-ldd: new package
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
Cc: Adam Duskett <aduskett@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxNy8xMi8yMDIxIDExOjEwLCBUaGllcnJ5IEJ1bHRlbCB3cm90ZToKPiArwqDCoMKgIGhl
bHAKPj4+ICvCoMKgwqAgbGRkIGRyb3AtaW4gcmVwbGFjZW1lbnQgZm9yIGNyb3NzLWNvbXBpbGF0
aW9uIHRvb2xjaGFpbnMuCj4+PiArwqDCoMKgIFRoaXMgaXMgdGhlIG9mZmljaWFsbHkgc3VwcG9y
dGVkIHZlcnNpb24gbWVudGlvbmVkIGluIHRoZSBkcmFjdXQgCj4+PiBkb2N1bWVudGF0aW9uCj4+
PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9jcm9zcy1sZGQvY3Jvc3MtbGRkLm1rIGIvcGFja2FnZS9j
cm9zcy1sZGQvY3Jvc3MtbGRkLm1rCj4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+Pj4gaW5kZXgg
MDAwMDAwMDAwMC4uOTMyNmE1MDhiYgo+Pj4gLS0tIC9kZXYvbnVsbAo+Pj4gKysrIGIvcGFja2Fn
ZS9jcm9zcy1sZGQvY3Jvc3MtbGRkLm1rCj4+PiBAQCAtMCwwICsxLDIwIEBACj4+PiArIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMgCj4+Pgo+Pj4gKyMKPj4+ICsjIGNyb3NzLWxkZAo+Pj4gKyMKPj4+
ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyAKPj4+Cj4+PiArCj4+PiArQ1JPU1NfTEREX1ZFUlNJ
T04gPSA2YzljNzI0ZWJkNmEyOWMyNzljNmU1NzM0ZTQ0YzA3ZjA2NzgwOGVjCj4+PiArQ1JPU1Nf
TEREX1NPVVJDRSA9ICQoQ1JPU1NfTEREX1ZFUlNJT04pLnppcAo+Pgo+PiDCoEFGQUlDUyB0aGVy
ZSdzIG5vIHJlYXNvbiB0byB1c2UgYSB6aXAgZmlsZS4gSnVzdCByZW1vdmUgdGhpcyBsaW5lIGFu
ZCB0aGUgCj4+IEVYVFJBQ1RfQ01EUyBhbmQgaXQgc2hvdWxkIHdvcmsgYXMgd2VsbC4KPj4KPiBI
aSwKPiBVbmZvcnR1bmF0ZWx5LCB0aGlzIGlzIG5vdCB0aGF0IHNpbXBsZSwgSSBjYW5ub3QgZmlu
ZCBhIHNpbXBseSB3YXkgdG8gZG93bmxvYWQgYSAKPiBzaW5nbGUgZmxhdCBmaWxlLAo+IGJlY2F1
c2UgdGhlIGRvd25sb2FkIHN5c3RlbSBtYWtlcyBhIHN0cm9uZyBhc3N1bXB0aW9uIHRoYXQgaXQg
aXMgYSB0YXIgZmlsZS4KCiAgWWVzLCBidXQgd2h5IGlzIHRoYXQgYSBwcm9ibGVtPwoKICBUaGlz
IHdvcmtzOgoKQ1JPU1NfTEREX1ZFUlNJT04gPSA2YzljNzI0ZWJkNmEyOWMyNzljNmU1NzM0ZTQ0
YzA3ZjA2NzgwOGVjCkNST1NTX0xERF9TT1VSQ0UgPSAkKENST1NTX0xERF9WRVJTSU9OKS50YXIu
Z3oKQ1JPU1NfTEREX1NJVEUgPSAKaHR0cHM6Ly9naXN0LmdpdGh1Yi5jb20vamVyb21lLXBvdWls
bGVyL2M0MDM3ODZjMTM5NGY1M2Y0NGEzYjYxMjE0NDg5ZTZmL2FyY2hpdmUKClNvIGluZGVlZCBJ
IHdhcyB3cm9uZyBhYm91dCBqdXN0IHJlbW92aW5nIHRoZSBsaW5lLiBCdXQgYSB0YXJiYWxsIHdv
cmtzIGp1c3QgZmluZS4KCiAgUmVnYXJkcywKICBBcm5vdXQKCj4gCj4gbXkgYmVzdCBvcHRpb24g
c2VlbXMgdG8gYmUgc29tZXRoaW5nIGxpa2U6Cj4gCj4gCj4gQ1JPU1NfTEREX1ZFUlNJT04gPSA2
YzljNzI0ZWJkNmEyOWMyNzljNmU1NzM0ZTQ0YzA3ZjA2NzgwOGVjCj4gQ1JPU1NfTEREX1NPVVJD
RSA9ICQoQ1JPU1NfTEREX1ZFUlNJT04pL2Nyb3NzLWNvbXBpbGUtbGRkCj4gCj4gQ1JPU1NfTERE
X1NJVEUgPSAKPiBodHRwczovL2dpc3QuZ2l0aHVidXNlcmNvbnRlbnQuY29tL2plcm9tZS1wb3Vp
bGxlci9jNDAzNzg2YzEzOTRmNTNmNDRhM2I2MTIxNDQ4OWU2Zi9yYXcgCj4gCj4gCj4gZGVmaW5l
IEhPU1RfQ1JPU1NfTEREX0VYVFJBQ1RfQ01EUwo+ICDCoMKgwqAgIyBTaW5nbGUgZmlsZSwgbm8g
ZXh0cmFjdCBuZWVkZWQKPiAgwqDCoMKgIGNwICQoSE9TVF9DUk9TU19MRERfRExfRElSKS9jcm9z
cy1jb21waWxlLWxkZCAkKEBEKQo+IGVuZGVmCj4gCj4gUmVnYXJkcywKPiBUaGllcnJ5Cj4gCj4+
Cj4+IMKgUmVnYXJkcywKPj4gwqBBcm5vdXQgCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
