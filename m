Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F8FDECD6D1
	for <buildroot@archiver.kernel.org>; Wed, 11 Feb 2026 18:02:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3EF6613D4;
	Wed, 11 Feb 2026 18:02:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lC48F5PVid_w; Wed, 11 Feb 2026 18:02:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B444F61393
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770832929;
	bh=FCjqrOsb5vXHPQw3ZZJHH0bY0bhcyNqHJVnzFTBNeqA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=j4ki9sZAMv+QqKOCYY24veG6X9vYC8MyHuGq3QksZ7eefo9zo6QGB4AHsn0Fx0oMS
	 YStXefojwRriMTxkHTU/M6ZwfXHiCXsUbnPuzxvuHLJIr49+nyZQmy1HpxF8ci+rEw
	 yGQDpHGz04mRt4eZntx3aRBCzGJqgDffcCkrhaXxW5mqUbxLwZyhn0eJfNmgAxZST8
	 e1XKzzHIs502/o+jiW4ws4dPQ1T7ztgTfTQw7OZkc65GOM3PdKBHWzmOoqZUrFN8C2
	 prSLeQn8AyBSwpQcQFdEwX8UOlt8V7kau3vechxtx8kBkPXI4RuX/zwxsWufly929f
	 9KLANphdLOmCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B444F61393;
	Wed, 11 Feb 2026 18:02:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 747BE1F6
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 18:02:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 64399807C6
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 18:02:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2HhOQmoKL5GG for <buildroot@buildroot.org>;
 Wed, 11 Feb 2026 18:02:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C7CFD83503
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7CFD83503
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C7CFD83503
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 18:02:05 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 99268B0056A;
 Wed, 11 Feb 2026 19:02:01 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 11 Feb 2026 19:01:56 +0100
MIME-Version: 1.0
Date: Wed, 11 Feb 2026 19:01:56 +0100
To: Matthew Weber <matthew.l.weber@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <CAFt09wPMWuxLvd0FMDcoMcc3iZAQfVXt3hiqvQws0Xfwjf=Sxg@mail.gmail.com>
References: <20260211055138.719459-1-matthew.l.weber@gmail.com>
 <CAFt09wPMWuxLvd0FMDcoMcc3iZAQfVXt3hiqvQws0Xfwjf=Sxg@mail.gmail.com>
User-Agent: Webmail Free/1.6.13
Message-ID: <bd4459a95438736c58b6b15e69e2c345@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770832922;
 bh=13nIxLb+CrYgaAde5Ayt5dvaVRu64lIypL5AgutpxQM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gorRwzPQdcp7J0Z+Ey35ITeazJ7QVpdublrJosB5R3mhEbU1VkCtPUcuUazG/s9BV
 TeWBjZbg4ekAqoZqKOmQ5geTXyU/u7aYKNP9hVhpU1uHadHKppS2dnSRGja1bBG8Ie
 aDh/TX2nOVs7R/1LJbJwII1XD1HQx0bcetwpng0OcdTt6gU5vto/GpVelzLDYVZxpc
 3+5u5lQWjtcdhNAzBNpGXokCKQJO1Eyd3dCGlCic6W/CZL/kYieAVr9Nsk5mbayYGs
 SdN096Wk6dQ5RR9onc6sIKl0EdBfx9OKZV1lxS9/QOuh9hJsUkKhENRHhhtE1RCEYn
 xOC8KYAdc+kyA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=gorRwzPQ
Subject: Re: [Buildroot] [PATCH] package/xen: bump to 4.21.0
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

SGkgTWF0dGhldywKCk9uIDExLzAyLzIwMjYgMTM6MjQsIE1hdHRoZXcgV2ViZXIgd3JvdGU6Cj4g
QWxsLAo+IAo+IE9uIFR1ZSwgRmViIDEwLCAyMDI2IGF0IDExOjUx4oCvUE0gTWF0dGhldyBXZWJl
cgo+IDxtYXR0aGV3Lmwud2ViZXJAZ21haWwuY29tPiB3cm90ZToKPj4gCj4+IFJlc29sdmVkIGlu
IHZlcnNpb24gYnVtcAo+PiAtIDAwMDEtOXBmcy1pbmNsdWRlLWxpbnV4LWxpbWl0cy5oLWZvci1Y
QVRUUl9TSVpFX01BWC5wYXRjaAo+PiAtIDAwMDItRml4LWJ1aWxkLXdpdGgtNjQtYml0cy10aW1l
X3QucGF0Y2gKPj4gLSAwMDAzLWxpYnMtbGlnaHQtZml4LXR2X3NlYy1wcmludGYtZm9ybWF0LnBh
dGNoCj4+IC0gMDAwNC1saWJzLWxpZ2h0LWZpeC10dl9zZWMtZnByaW50Zi1mb3JtYXQucGF0Y2gK
Pj4gLSAwMDA1LXRvb2xzLWRyb3AtYm9ndXMtYW5kLW9ic29sZXRlLXB0eWZ1bmNzLm00LnBhdGNo
Cj4+IC0gMDAwNi1Bcm02NC1hZGp1c3QtX19pcnFfdG9fZGVzYy10by1maXgtYnVpbGQtd2l0aC1n
Y2MxNC5wYXRjaAo+PiAtIDAwMDcteGVuLWFybTMyLWF2b2lkLS5yb2RhdGEtdG8tYmUtbWFya2Vk
LWFzLWV4ZWN1dGFibGUucGF0Ywo+PiAtIDAwMDgtYXJtLUF2b2lkLXVzaW5nLXNvbGFyaXMtc3lu
dGF4LWZvci0uc2VjdGlvbi1kaXJlY3Rpdi5wYXRjaAo+PiAKPj4gVGVzdGVkIG9uIGEgQVJNNjQg
aG9zdCBtYWNoaW5lIHdpdGgKPj4gICAgICAgICB1dGlscy9kb2NrZXItcnVuIHN1cHBvcnQvdGVz
dGluZy9ydW4tdGVzdHMgXAo+PiAgICAgICAgICAgICAtZCBkbCAtbyBvdXRwdXRfZm9sZGVyIC1z
IFwKPj4gICAgICAgICAgICAgdGVzdHMucGFja2FnZS50ZXN0X3hlbgo+PiAKPiAKPiBGb3VuZCBh
biBpc3N1ZSwgSSdsbCBrZWVwIHRlc3RpbmcuICAoSSBtYXJrZWQgdGhpcyBhcyBub24tYXBwbGlj
YWJsZQo+IGluIHBhdGNod29yay4pCgpUaGFua3MgZm9yIHRoZSBwYXRjaC4gIEkgd291bGQgbGlr
ZSB0byBwb2ludCBvdXQgdGhhdCBhIHByb3Bvc2FsIHdhcyAKc2VudCBhCndoaWxlIGJhY2ssIHRv
IGJ1bXAgeGVuIHRvIDQuMjAuMS4gU2VlOgpodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3By
b2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjUxMDA3MTY0NzU2Ljg5MzI2NC0xLXRpdG91YW4uY2hy
aXN0b3BoZUBtaW5kLmJlLwoKUGxlYXNlIG5vdGUgdGhhdCBzdWNoIGEgYnVtcCBzaG91bGQgYmUg
bWFya2VkIGFzIGEgInNlY3VyaXR5IGJ1bXAiLCB3aXRoIAphbGwKdGhlIGFzc29jaWF0ZWQgQ1ZF
cyBpZGVudGlmaWVkLgoKVGhlIG1haW4gaXNzdWUgd2FzIGEgcWVtdSBkb3dubG9hZCBkdXJpbmcg
dGhlIHhlbiBidWlsZCBwcm9jZXNzLgoKPiBNYXR0CgpCZXN0IHJlZ2FyZHMsCgpKdWxpZW4uCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
