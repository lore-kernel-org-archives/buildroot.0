Return-Path: <SRS0=A6xV=PJ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CE58C433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 16:07:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98D78611BD
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 16:07:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 98D78611BD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 61ABF40017;
	Thu, 21 Oct 2021 16:07:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OHH7ED1cypf5; Thu, 21 Oct 2021 16:07:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7D475401B3;
	Thu, 21 Oct 2021 16:07:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8CEFC1BF20B
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 16:07:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7CF5540875
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 16:07:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M0mYdDYNuJss for <buildroot@lists.busybox.net>;
 Thu, 21 Oct 2021 16:07:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 60DE540874
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 16:07:24 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id o26so815805ljj.2
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 09:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VserfhHa32/H2Rx0ZH/klAEq+WTn7pI/1bQEfPu5PbU=;
 b=L8Sj7PHCByvTp8/TlcO8amPKUhZblDS2AhrLUkA6nLRF/6TyuLvEwxrPzTLXMZ1sGz
 bXj2Axv9b3u2vjm5jXbqjGsNmITR55UGEr3448570CUiIXbaaUDbm6X5tcIR7i1LbK90
 QJ+0wkgU6RFJIEvSQ4MMQ5Wg3X3xKIGYnHRoVXO7mrmCumseBj+ewlhsuIDEYa3bGhWi
 PXiuwMHvuREz+2r1E1oH2bQ4wNgtEFEWKIErUtgWn5xtw3Q9rX5ld1Vn7pPrX1dYwmBG
 urMVqfVfbszLBMP/TfFPFNAYzqks3yNMCAeoM8YWtaDkbDH8+ZIknDXGXqo2NCTQpCGr
 FbhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VserfhHa32/H2Rx0ZH/klAEq+WTn7pI/1bQEfPu5PbU=;
 b=7Bcjc7DYaxw3J/aZ4292psmzNSVKjlRbyll+owQcTqd0igc/2KLkOFBFh4jGl2wL0V
 RZWBgIi+n8Im0EDFidAw0mVsZxrn2zmWOM9aTYjFWMT49LPJOnNZRVWpVk/oPKd2Ir67
 sLeoSKgj8oHKIzJYGEv7aNYmBVtyOBuEYS3KhmUfVbAujpFIhEnCI/HU4GEWM8ExdrL5
 qAy4YVFNj7TSv814NsT8qxQcX6vVyZDjbwPRxo5xqdXgPXBYpoyxlE9AUQM84VRu5QBx
 fFVhTK9ky+MA/ZTMlQq9elxxoRUALnL0vW36+B7VIHfSzcsnfbIOirc6QuA9rtpNxdv+
 RROQ==
X-Gm-Message-State: AOAM531i++xt/38Kg5Jc1lK3wMyaK0ixPyd6CJYKqiNrXNxZbpVl6njl
 TOE4YnZTOFVZ8Ht4A67zBL3XkazVwoI3d7PuHXSwobWE
X-Google-Smtp-Source: ABdhPJx4/O46uGWyvPVFNHiTpYTqHO1Dmjn94u2fyELy5/MzvDHNgZOZzJNIBND1IgY7k+F6sRkohGSAUQRppCZkOIU=
X-Received: by 2002:a2e:9795:: with SMTP id y21mr6923851lji.283.1634832442158; 
 Thu, 21 Oct 2021 09:07:22 -0700 (PDT)
MIME-Version: 1.0
References: <20211020190423.3547893-1-fontaine.fabrice@gmail.com>
 <163480816021.2663858.13418966210945898355@Monstersaurus>
In-Reply-To: <163480816021.2663858.13418966210945898355@Monstersaurus>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 21 Oct 2021 18:05:51 +0200
Message-ID: <CAPi7W83vxd8_KX=UCxVNZoKYxODXnKkTxUmu3saKJYStK9JLdw@mail.gmail.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libcamera: disable compliance
 tool
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
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgS2llcmFuLAoKTGUgamV1LiAyMSBvY3QuIDIwMjEgw6AgMTE6MjIsIEtpZXJhbiBCaW5naGFt
CjxraWVyYW4uYmluZ2hhbUBpZGVhc29uYm9hcmQuY29tPiBhIMOpY3JpdCA6Cj4KPiBIaSBGYWJy
aWNlLAo+Cj4gUXVvdGluZyBGYWJyaWNlIEZvbnRhaW5lICgyMDIxLTEwLTIwIDIwOjA0OjIzKQo+
ID4gRGlzYWJsZSBjb21wbGlhbmNlIHRvb2wgdG8gZml4IHRoZSBmb2xsb3dpbmcgYnVpbGQgZmFp
bHVyZQo+ID4gcmFpc2VkIHNpbmNlIGNvbW1pdCBlMWQzN2FiMGE3YjJiODczNWU2OWMwNzA1MTk5
NzhkMjg5OGQyZTc5IGFuZAo+ID4gaHR0cHM6Ly9naXQubGludXh0di5vcmcvbGliY2FtZXJhLmdp
dC9jb21taXQvP2lkPTAyYmMxMTA4NTc4ZThiOGViNjhmYTdkOWFlM2VlZWE1NTg3MjM5MzE6Cj4g
Pgo+ID4gL3Vzci9sZnMvaGRkX3YxL3JjLWJ1aWxkcm9vdC10ZXN0L3NjcmlwdHMvaW5zdGFuY2Ut
MS9vdXRwdXQtMS9ob3N0L2xpYi9nY2MvYXJtLWJ1aWxkcm9vdC1saW51eC11Y2xpYmNnbnVlYWJp
LzEwLjMuMC8uLi8uLi8uLi8uLi9hcm0tYnVpbGRyb290LWxpbnV4LXVjbGliY2dudWVhYmkvYmlu
L2xkOiBjYW5ub3QgZmluZCAtbGd0ZXN0Cj4gPgo+ID4gRml4ZXM6Cj4gPiAgLSBodHRwOi8vYXV0
b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy9lMWJiOGFhMWRlMzEwZjNkMjdiNzRlYzdkODc0
OGQxNzBhZDQ0NGUyCj4gPgo+Cj4gQW55IGlkZWEgd2h5IHdlJ3JlIGZhaWxpbmcgdG8gZmluZCBn
dGVzdD8KTm9wZSwgSSBkaWRuJ3QgdGFrZSB0aW1lIHRvIGZpbmQgb3V0IHdoeSB0aGlzIGlzIGZh
aWxpbmcgYXMgSSB0aGluawp0aGF0IGxjLWNvbXBsaWFuY2UgaXMganVzdCBub3QgbmVlZGVkIGlu
IHRoZSBjb250ZXh0IG9mIGJ1aWxkcm9vdCAoYXMKZ3Rlc3QgaXMgbm90IGluc3RhbGxlZCBvbiB0
YXJnZXQpLgo+Cj4gT3VyIG1lc29uLmJ1aWxkIGZvciBzcmMvbGMtY29tcGxpYW5jZSBjb250YWlu
cyB0aGUgZm9sbG93aW5nOgo+Cj4gIiIiCj4gIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogQ0Mw
LTEuMAo+Cj4gbGliZXZlbnQgPSBkZXBlbmRlbmN5KCdsaWJldmVudF9wdGhyZWFkcycsIHJlcXVp
cmVkIDogZ2V0X29wdGlvbignbGMtY29tcGxpYW5jZScpKQo+IGxpYmd0ZXN0ID0gZGVwZW5kZW5j
eSgnZ3Rlc3QnLCByZXF1aXJlZCA6IGdldF9vcHRpb24oJ2xjLWNvbXBsaWFuY2UnKSkKPgo+IGlm
IG5vdCAobGliZXZlbnQuZm91bmQoKSBhbmQgbGliZ3Rlc3QuZm91bmQoKSkKPiAgICAgbGNfY29t
cGxpYW5jZV9lbmFibGVkID0gZmFsc2UKPiAgICAgc3ViZGlyX2RvbmUoKQo+IGVuZGlmCj4KPiBs
Y19jb21wbGlhbmNlX2VuYWJsZWQgPSB0cnVlCj4gIiIiCj4KPiBXaGljaCBpbXBsaWVzIHRoYXQg
bGliZ3Rlc3Qgd2FzIGZvdW5kIGR1cmluZyB0aGUgY29uZmlndXJhdGlvbiBwaGFzZSwKPiBidXQg
bm90IGR1cmluZyB0aGUgbGlua2luZyBwaGFzZS4uLi4KPgo+IElzIGxpYmd0ZXN0IGJ1aWx0IGFz
IHBhcnQgb2YgdGhpcyBidWlsZCBjb25maWd1cmF0aW9uPyBJZiBpdCBpcyAtIEknZAo+IGV4cGVj
dCBsYy1jb21wbGlhbmNlIHRvIGdldCBidWlsdCBhZ2FpbnN0IGl0LiBJZiBub3QgLSB0aGVuIGl0
IHdvdWxkCj4gYXV0b21hdGljYWxseSBiZSBkaXNhYmxlZCBieSBvdXIgYnVpbGQuLi4KWWVzLCBp
dCBpcyBidWlsdCBhbmQgZm91bmQgYnkgbWVzb24gb3RoZXJ3aXNlIGxjLWNvbXBsaWFuY2Ugd29u
J3QgYmUKYnVpbHQgYnV0IGZvciBhbiB1bmtub3duIHJlYXNvbiwgdGhlIGxpbmsgc3RlcCBmYWls
cy4KPgo+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJy
aWNlQGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gIHBhY2thZ2UvbGliY2FtZXJhL2xpYmNhbWVyYS5t
ayB8IDEgKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+ID4KPiA+IGRpZmYg
LS1naXQgYS9wYWNrYWdlL2xpYmNhbWVyYS9saWJjYW1lcmEubWsgYi9wYWNrYWdlL2xpYmNhbWVy
YS9saWJjYW1lcmEubWsKPiA+IGluZGV4IDhhYjk1ZmI0MmEuLjYzOGM5YWM1NTMgMTAwNjQ0Cj4g
PiAtLS0gYS9wYWNrYWdlL2xpYmNhbWVyYS9saWJjYW1lcmEubWsKPiA+ICsrKyBiL3BhY2thZ2Uv
bGliY2FtZXJhL2xpYmNhbWVyYS5tawo+ID4gQEAgLTE3LDYgKzE3LDcgQEAgTElCQ0FNRVJBX0RF
UEVOREVOQ0lFUyA9IFwKPiA+ICBMSUJDQU1FUkFfQ09ORl9PUFRTID0gXAo+ID4gICAgICAgICAt
RGFuZHJvaWQ9ZGlzYWJsZWQgXAo+ID4gICAgICAgICAtRGRvY3VtZW50YXRpb249ZGlzYWJsZWQg
XAo+ID4gKyAgICAgICAtRGxjLWNvbXBsaWFuY2U9ZGlzYWJsZWQgXAo+ID4gICAgICAgICAtRHRl
c3Q9ZmFsc2UgXAo+ID4gICAgICAgICAtRHdlcnJvcj1mYWxzZQo+ID4gIExJQkNBTUVSQV9JTlNU
QUxMX1NUQUdJTkcgPSBZRVMKPiA+IC0tCj4gPiAyLjMzLjAKPiA+CkJlc3QgUmVnYXJkcywKCkZh
YnJpY2UKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
