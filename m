Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA1E1106ACD6
	for <buildroot@archiver.kernel.org>; Thu, 12 Mar 2026 18:41:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF2B14072C;
	Thu, 12 Mar 2026 18:41:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A-YcHVDTS39z; Thu, 12 Mar 2026 18:41:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70ECF406F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773340899;
	bh=KuTosk7jCJrDmj+im9I5cnPGpAT4+y8HWKXEGcnEPfI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SOZR/2T5Um5kV8rs/L2JvW22MHbXMGLxC+kwIS3zMBXvtncTAZ8lziast6zcYtHwm
	 taKJKhkkL67ykCcC75Q1h1nTvYK3BG4GOHn3BZ15gD6Zt7o6/F1phbV990faM5xQ2f
	 wA/K+lEl4h6UC+djU3VEW4gGHYcMuRrwH9SJt1pWQuMyMiA9V3ALLtnI+o/z0mihei
	 IQDgig5iQ08KUh9UGZ3Owpk3qMHtAcVXZqeA7hrZwa14yCPIrvYKdyjJu+BUyhAv0h
	 QidfXJ3ark7iiv54Hr6/dL5p6sRSn+Dmu5dEvjJO5UPmoVgdPaOspcWiyq2Xh0Sq8g
	 T8TrczlzxgsqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70ECF406F3;
	Thu, 12 Mar 2026 18:41:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E70BB201
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 18:41:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CCDAC40119
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 18:41:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ett4FO4a49jH for <buildroot@buildroot.org>;
 Thu, 12 Mar 2026 18:41:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 72C3F4010C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72C3F4010C
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 72C3F4010C
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 18:41:36 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 11DC713F88D;
 Thu, 12 Mar 2026 19:41:31 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 12 Mar 2026 19:41:31 +0100
MIME-Version: 1.0
Date: Thu, 12 Mar 2026 19:41:31 +0100
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Dick Olsson <hi@senzilla.io>
In-Reply-To: <abLgnUw4NQAuAgAx@debian>
References: <20260227215711.1232099-1-ju.o@free.fr> <abLgnUw4NQAuAgAx@debian>
User-Agent: Webmail Free/1.6.13
Message-ID: <7f2db297b5fd1ebe061d6176896c05e9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1773340894;
 bh=BCqOJG0ZqAL7ziv2doob/3eCMgz8az4y/8JGTuJ9pOM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Ihw+riGDY30UOftvETSbQn4b9faqeJafxLUIjlHVLXeBlnBhxbGEB3f4c9N5wTm9M
 Fpkj3ciKgxoU0nQdxdph/pn9XntAtl/mmCRghY0jmi/XCQ+HhGE8nk+JxdC3YNXxaJ
 IhnbZR5JddIpQllOiZU+rTDT7FVVFoF3FHYfUy4rLdGcJqJgWRbM+op4+OuFe4x6lh
 DjldeqzCwaso38VcCudXRwwJinxKlD4UPANiUms1LoXUvmGFgkHEfLWzv1yL1CWX8L
 DIPMkrB3hyjA0qkhy1K3RutRwz7te1DBcEW0ll2LCtxiEGOAXRZ8aDHWXH5KG31SD8
 jQh/Ihf6BtsXA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Ihw+riGD
Subject: Re: [Buildroot] [PATCH next 1/3] configs/aarch64_efi: switch to
 external toolchain
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVmluY2VudCwKCk9uIDEyLzAzLzIwMjYgMTY6NDksIFZpbmNlbnQgU3RlaGzDqSB3cm90ZToK
PiBPbiBGcmksIEZlYiAyNywgMjAyNiBhdCAxMDo1NzowOVBNICswMTAwLCBKdWxpZW4gT2xpdmFp
biB2aWEgYnVpbGRyb290IAo+IHdyb3RlOgo+IAo+IEhpIEp1bGllbiwKPiAKPiBUaGFua3MgZm9y
IHJlZnJlc2hpbmcgYWFyY2g2NC1lZmkuCj4gCj4gSSB2ZXJpZmllZCB0aGF0IHRoaXMgcGF0Y2gg
c2VyaWVzIGRvZXMgaW5kZWVkIHdvcmsgZmluZSBvbiBDb21wdWxhYgo+IElPVC1HQVRFLWlNWDgg
KGVNTUMpLCBST0NLUHJvNjQgKFNEIGNhcmQpLCBRZW11IHZpcnQsIFFlbXUgU0JTQSBhbmQgRlZQ
IAo+IEJhc2UKPiBSZXZDLgo+IAo+IEZlZWwgZnJlZSB0byBhZGQgKG9yIG5vdCk6Cj4gCj4gICBU
ZXN0ZWQtYnk6IFZpbmNlbnQgU3RlaGzDqSA8dmluY2VudC5zdGVobGVAYXJtLmNvbT4KClRoYW5r
cyBmb3IgdGVzdGluZy4gSSBhcHBsaWVkIG9uIG1hc3Rlci4KCj4gCj4gQmVzdCByZWdhcmRzLAo+
IFZpbmNlbnQuCj4gCj4+IFRoaXMgY29tbWl0IHN3aXRjaGVzIHRoZSBhYXJjaDY0X2VmaV9kZWZj
b25maWcgdG8gYW4gZXh0ZXJuYWwgZ2xpYmMKPj4gc3RhYmxlIEJvb3RsaW4gdG9vbGNoYWluLCB0
byBmb2xsb3cgcmVjb21tZW5kYXRpb24gZnJvbSBbMV0uCj4+IAo+PiBTaW5jZSBhbiBleHRlcm5h
bCB0b29sY2hhaW4gaXMgdXNlZCwgdGhlIGxpbnV4LWhlYWRlcnMuaGFzaCBjdXN0b20KPj4gaGFz
aCBmaWxlIGlzIG5vIGxvbmdlciBuZWVkZWQgYW5kIGlzIHJlbW92ZWQuCj4+IAo+PiBbMV0gCj4+
IGh0dHBzOi8vZWxpbnV4Lm9yZy9CdWlsZHJvb3Q6RGV2ZWxvcGVyRGF5c0VMQ0UyMDI0I1J1bGVz
X2Zvcl9kZWZjb25maWdzCj4+IAo+PiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gT2xpdmFpbiA8anUu
b0BmcmVlLmZyPgoKQmVzdCByZWdhcmRzLAoKSnVsaWVuLgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
