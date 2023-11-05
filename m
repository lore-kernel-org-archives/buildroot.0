Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D4A5C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 21:09:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 268BF4192B;
	Sun,  5 Nov 2023 21:09:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 268BF4192B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dAdLtpYb-Zq0; Sun,  5 Nov 2023 21:09:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A7B541952;
	Sun,  5 Nov 2023 21:09:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A7B541952
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 97F541BF488
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 21:09:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7CCEA400CB
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 21:09:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7CCEA400CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aXYj6F_M7nzz for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 21:09:09 +0000 (UTC)
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C549040A8A
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 21:09:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C549040A8A
Received: by mail-qt1-x831.google.com with SMTP id
 d75a77b69052e-41ea8debcdaso9861411cf.1
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 13:09:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699218547; x=1699823347;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X/+jGbQNrVYDxeWp2zhIDp2NItj0zKV9UlYpT3UGIOI=;
 b=JdouCXepPwVAMuS4u55/M8HYVvKKdVbUjn/rVRnLq7aDH3quokeApLCja4vvjpn2Tq
 8CBwrmBnfNMGrscQOjrBltArRbH1Kz7hy/lDzPS6CPi96/nDm27wT1l5X2rqJ+NW+Tza
 u3GPpBGFXnsiqeJyTum7Cno++2UUILaFiwoMa9DTHVJM5n1ZOwW2dbD23Fe0UnncaoX6
 bY43Xd8+Qz3ilr4z+c1GdcftMEtPRi8UH1UVaV2Y63SrLqOnA+mar52Vyeubf4el+Li2
 8lZZmjos/GstTPCR7F7f3qQIivjPQIgfKTOQQbr8iNoTxGZNol4sPWdE97c368lmAr6W
 2Esg==
X-Gm-Message-State: AOJu0YzbjoArcM5fzYXDwoUjdm87OPwkYkux7s9aJFX7xnXol346p0wy
 lfBSqZTcRaQX145Gj5sVSyNfJnc+ogHGg5Mddww=
X-Google-Smtp-Source: AGHT+IEnWfX56Rp+9vhq9Izc57DBM1QRh0gy3qFo1GYNFaTy0foEJdGWrg9gZuYll+GRu/VHctPGvNzxGEXW/JZOO5U=
X-Received: by 2002:a05:622a:198a:b0:419:5162:5e0f with SMTP id
 u10-20020a05622a198a00b0041951625e0fmr34405686qtc.13.1699218547527; Sun, 05
 Nov 2023 13:09:07 -0800 (PST)
MIME-Version: 1.0
References: <20231104231506.2669884-1-james.hilliard1@gmail.com>
 <1bd07169-cd46-4a6b-8dab-5083208f32ff@mind.be>
In-Reply-To: <1bd07169-cd46-4a6b-8dab-5083208f32ff@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 5 Nov 2023 14:08:55 -0700
Message-ID: <CADvTj4rPSzo_B0xLjbdXii-JZsH05woCWAX_etpmubhcNeDjzA@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699218547; x=1699823347; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X/+jGbQNrVYDxeWp2zhIDp2NItj0zKV9UlYpT3UGIOI=;
 b=Y/PA+BysU+MwXzutGC03yc1m5dJxajdePQkNX3nUJ90Em1XB78DiMxbvOfZvC/A9dZ
 39seTCPuWef01KJXnI24PrKteqbCmfCIyL9e5d/ZoMxY9XkfGc1QeG8zRLdJ6iJ4XfJl
 +27U34MM71ywpUZCJRYHTiyfnTaVfGf/ZuQQeCJFZ3fHUlN5qd5wiH055bctaKdUvmIu
 pjLfH9i2SrE4o4kzZ26uHJJGWtscMLAFLJvGgPuICYNBzjFKj6nXA/5ZfoytFHksajkJ
 kRYSKXev43D+bSp6S0raYR6xEo0kRZ1JY+O2LhwCAuelKW9ZoitGrApdD3KGv+/KCGwY
 d0Lg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Y/PA+Bys
Subject: Re: [Buildroot] [PATCH 1/1] package/python-aiocoap: bump to version
 0.4.7
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU3VuLCBOb3YgNSwgMjAyMyBhdCAxOjU54oCvUE0gQXJub3V0IFZhbmRlY2FwcGVsbGUgPGFy
bm91dEBtaW5kLmJlPiB3cm90ZToKPgo+Cj4KPiBPbiAwNS8xMS8yMDIzIDAwOjE1LCBKYW1lcyBI
aWxsaWFyZCB3cm90ZToKPiA+IExpY2Vuc2UgZmlsZSBtb3ZlZDoKPiA+IGh0dHBzOi8vZ2l0aHVi
LmNvbS9jaHJ5c24vYWlvY29hcC9jb21taXQvOGYyZTk2ZDc2YmNmMWY2ZjhkN2I4MDY1YjVjNTg2
NWFmYTUwZDIwZgo+ID4gaHR0cHM6Ly9naXRodWIuY29tL2Nocnlzbi9haW9jb2FwL2NvbW1pdC8w
NjU5NDVmYjdmMzRkYjMzZjY0MTE5OWFjZWI1Mjc1MjdjMWEzNDMxCj4gPgo+ID4gU2lnbmVkLW9m
Zi1ieTogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+Cj4gPiAtLS0K
PiA+ICAgcGFja2FnZS9weXRob24tYWlvY29hcC9weXRob24tYWlvY29hcC5oYXNoIHwgNiArKyst
LS0KPiA+ICAgcGFja2FnZS9weXRob24tYWlvY29hcC9weXRob24tYWlvY29hcC5tayAgIHwgNiAr
KystLS0KPiA+ICAgMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25z
KC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLWFpb2NvYXAvcHl0aG9uLWFp
b2NvYXAuaGFzaCBiL3BhY2thZ2UvcHl0aG9uLWFpb2NvYXAvcHl0aG9uLWFpb2NvYXAuaGFzaAo+
ID4gaW5kZXggYWI1MGZmMDk1OC4uYzlkNzNjZGEyNiAxMDA2NDQKPiA+IC0tLSBhL3BhY2thZ2Uv
cHl0aG9uLWFpb2NvYXAvcHl0aG9uLWFpb2NvYXAuaGFzaAo+ID4gKysrIGIvcGFja2FnZS9weXRo
b24tYWlvY29hcC9weXRob24tYWlvY29hcC5oYXNoCj4gPiBAQCAtMSw1ICsxLDUgQEAKPiA+ICAg
IyBtZDUsIHNoYTI1NiBmcm9tIGh0dHBzOi8vcHlwaS5vcmcvcHlwaS9haW9jb2FwL2pzb24KPiA+
IC1tZDUgIDAzY2EwNDExYjc0MDFiZmQ2ZTliZGFlZmUwOWJkODhhICBhaW9jb2FwLTAuNC41LnRh
ci5nego+ID4gLXNoYTI1NiAgOTA2YzkyNzgyMjE4NWM4YWNmMDRmZGNjMWRkOThmZDg0NWYzMWRh
YmY1ZDVlMzk1YzM5MTM3ZGNiZDZiYTFlMyAgYWlvY29hcC0wLjQuNS50YXIuZ3oKPiA+ICttZDUg
IGJhZWJiYzM4YmM4ZGIzMTQ3MmM0Mzg1MjFmNzEyMWUzICBhaW9jb2FwLTAuNC43LnRhci5nego+
ID4gK3NoYTI1NiAgOTBmM2JjYWZmZDQ1NGY1NDIxZDNhZDU1ZGRiZTNmZTEwYTY4NmQ0YjlmM2M0
NDQ1ZDQyN2IxMzA0OTNhOTZhNCAgYWlvY29hcC0wLjQuNy50YXIuZ3oKPiA+ICAgIyBMb2NhbGx5
IGNvbXB1dGVkIHNoYTI1NiBjaGVja3N1bXMKPiA+IC1zaGEyNTYgIDJiYjIxMWQ0MTJhNmJmYTRi
MmE5Y2YwMTEyM2M3ZmU5MGU1ZTYxODU5Mzg4OTZlMjNhYjA3Yjg0Zjg0OTQxODAgIExJQ0VOU0UK
PiA+ICtzaGEyNTYgIDBhZDM5MTMyYjM1MjkzNjk5OThlYjc0OTNiOTUwZGM3NDUyYjA3YmE5ZDhj
Y2E3NjE5NzY2YjZjNmQ4MjcwZmEgIGRvYy9MSUNFTlNFLnJzdAo+ID4gZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvcHl0aG9uLWFpb2NvYXAvcHl0aG9uLWFpb2NvYXAubWsgYi9wYWNrYWdlL3B5dGhvbi1h
aW9jb2FwL3B5dGhvbi1haW9jb2FwLm1rCj4gPiBpbmRleCA5MmY0N2I3YTRmLi43M2EwZDYxZWJh
IDEwMDY0NAo+ID4gLS0tIGEvcGFja2FnZS9weXRob24tYWlvY29hcC9weXRob24tYWlvY29hcC5t
awo+ID4gKysrIGIvcGFja2FnZS9weXRob24tYWlvY29hcC9weXRob24tYWlvY29hcC5tawo+ID4g
QEAgLTQsMTEgKzQsMTEgQEAKPiA+ICAgIwo+ID4gICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+
ID4KPiA+IC1QWVRIT05fQUlPQ09BUF9WRVJTSU9OID0gMC40LjUKPiA+ICtQWVRIT05fQUlPQ09B
UF9WRVJTSU9OID0gMC40LjcKPiA+ICAgUFlUSE9OX0FJT0NPQVBfU09VUkNFID0gYWlvY29hcC0k
KFBZVEhPTl9BSU9DT0FQX1ZFUlNJT04pLnRhci5nego+ID4gLVBZVEhPTl9BSU9DT0FQX1NJVEUg
PSBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvNjUvNjMvOTA1MWFmNmEy
ZmM0OThmNTBiNzFmMjNiZGJkZTBjYzFkMWYwYTY5ZWI3Njc3NzZkYmY2ZDE0MTFlMjQwCj4gPiAr
UFlUSE9OX0FJT0NPQVBfU0lURSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNr
YWdlcy9kZS8xNC84NDMyMzJiNTZjMGYwOWIyY2VkZGFlM2RhMzc1OThkOTEwOWM0YjFkOTM4M2Ix
YWI3MjIzMjAxOGU5ZTgKPiA+ICAgUFlUSE9OX0FJT0NPQVBfU0VUVVBfVFlQRSA9IHNldHVwdG9v
bHMKPiA+ICAgUFlUSE9OX0FJT0NPQVBfTElDRU5TRSA9IE1JVAo+ID4gLVBZVEhPTl9BSU9DT0FQ
X0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFCj4gPiArUFlUSE9OX0FJT0NPQVBfTElDRU5TRV9GSUxF
UyA9IGRvYy9MSUNFTlNFLnJzdAo+Cj4gICBUaGF0IGZpbGUganVzdCBjb250YWluczoKPgo+IC4u
IGluY2x1ZGU6OiAuLi9MSUNFTlNFUy9NSVQudHh0Cj4KPiBzbyB3ZSBzaG91bGQgaW5zdGVhZCB1
c2UgTElDRU5TRVMvTUlULnR4dCBhcyB0aGUgbGljZW5zZSBmaWxlLiBVbmZvcnR1bmF0ZWx5LAo+
IHRoYXQgZmlsZSBkb2Vzbid0IHNlZW0gdG8gZXhpc3QuIENhbiB5b3UgY2hlY2sgd2l0aCB1cHN0
cmVhbT8KClllYWgsIGl0IGFwcGVhcnMgdG8gaGF2ZSBiZWVuIGZpeGVkIHVwc3RyZWFtIGJ1dCB0
aGVyZSBpcyBub3QgeWV0IGEKcmVsZWFzZSB3aXRoIHRoZSBmaXg6Cmh0dHBzOi8vZ2l0aHViLmNv
bS9jaHJ5c24vYWlvY29hcC9jb21taXQvMjQwMzllNDNhMzY2YmNjZTkwMTA4ZjFkMDllY2JiOGUx
OWQyMDQyYwoKPgo+ICAgUmVnYXJkcywKPiAgIEFybm91dAo+Cj4gPgo+ID4gICAkKGV2YWwgJChw
eXRob24tcGFja2FnZSkpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
