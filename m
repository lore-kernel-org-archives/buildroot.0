Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F50C76196
	for <buildroot@archiver.kernel.org>; Mon, 10 Apr 2023 20:20:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 893EB409B1;
	Mon, 10 Apr 2023 20:20:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 893EB409B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bDV24SLDfBnI; Mon, 10 Apr 2023 20:20:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 396AE40901;
	Mon, 10 Apr 2023 20:20:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 396AE40901
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 980471BF345
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 20:20:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7EB2381D3A
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 20:20:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7EB2381D3A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CfdKcDSa77rC for <buildroot@lists.busybox.net>;
 Mon, 10 Apr 2023 20:19:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C85BC81D0B
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C85BC81D0B
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 20:19:58 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 cg19-20020a056830631300b0069f922cd5ceso2821069otb.12
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 13:19:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681157998; x=1683749998;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nSr5q42A04ik4Ng1Q/3XAlP0vhT1NiOZl0ybb2EXbrY=;
 b=lwaH+6Lb/06PTmumKhmXktbXKoZ8X6jMxu3KiZ4iwprdbrur9ppVxZihhKqrPcpnOl
 kWq/EgoX5k0+M2Pp1qV99kynENJXO7lveUA041CWukvD7NXVC2KimWVE9HaW0vT8ymn4
 Ke0YyEqXGW87k2pDLyHeojqBlUc2KDCuq2hHEAjCWdQ1FO7i4Awbi2u6ubGnE4lCaXGN
 DOM7wizAJRrPuMvWdSN9WWbPznLe29JBGfGEjCcKfES2Vnvbz/Fa1yDrxVRCEZiBBlhp
 BKoAjuL92NnBuLqGuBpy+BXYCGQlPmgF26FcXOkfuzR0UQnBxufPm38qhSudmfQIgZTv
 W4kQ==
X-Gm-Message-State: AAQBX9e97dos/Cqo+3l9R4RvLe1FoUq4nlSB3+INsR65i2fKpzxgZ5hH
 DkeMS8rmNQzgXsHFvF8Kw6OnFYXyzTQat0MqndwVFMdNNy8=
X-Google-Smtp-Source: AKy350bI5iif6g5VugHLH5T5JZGNXFbXVfZ2lMk5Mso26OTav34WxqCebsQrj2qamg3gn9EBMBovXtRahLeXsgy7VQU=
X-Received: by 2002:a9d:4806:0:b0:69f:8cab:55b6 with SMTP id
 c6-20020a9d4806000000b0069f8cab55b6mr197805otf.5.1681157997796; Mon, 10 Apr
 2023 13:19:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230410083252.138426-1-james.hilliard1@gmail.com>
 <20230410164031.GC2819@scaer> <298af741-f854-b70b-6e75-cde10a49c835@mind.be>
In-Reply-To: <298af741-f854-b70b-6e75-cde10a49c835@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 10 Apr 2023 14:19:46 -0600
Message-ID: <CADvTj4oiHrR+TD49btBb+ZDJVtKuwqm=2xyP=ay+R+w5ts-zow@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681157998; x=1683749998;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nSr5q42A04ik4Ng1Q/3XAlP0vhT1NiOZl0ybb2EXbrY=;
 b=Exivj1Kd1VHTSmn1KN50E+oDyiA5wRyIZ6/lQpjAsDuSTs5NSRx94mSZmUnAPDDK0o
 owN3fLBkjmEJbrz+GsXxL/KrnFgIkkCdlFjODd47ImMAcVH+M7/974tb5I+Kcu2mBiGR
 XIe0F2JYxq4RR5vSAnl5gJ5xe9ayJ+br7Q9RoHo/Ctq+xGZSpGf1Ctm0O+sWlOPBs4Pg
 ukKUpkjUDLR6ripgkwoTQimgeGXEJbMiOds+RNOPVuAciKRtN8nEseAqzZBDmf5EkNAn
 neZz4RS4e2FliIXbkNBVml9HyRMdBjsDXP02Gm2YMqy8W2vONZ5pdU/u9otb7kW04iTF
 mlyA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Exivj1Kd
Subject: Re: [Buildroot] [PATCH v3 1/1] package/pkg-cargo: ensure
 host/target rustflags are properly split
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCBBcHIgMTAsIDIwMjMgYXQgMTowMuKAr1BNIEFybm91dCBWYW5kZWNhcHBlbGxlIDxh
cm5vdXRAbWluZC5iZT4gd3JvdGU6Cj4KPgo+Cj4gT24gMTAvMDQvMjAyMyAxODo0MCwgWWFubiBF
LiBNT1JJTiB3cm90ZToKPiA+IEphbWVzLCBhbGwsCj4gPgo+ID4gT24gMjAyMy0wNC0xMCAwMjoz
MiAtMDYwMCwgSmFtZXMgSGlsbGlhcmQgc3Bha2UgdGh1c2x5Ogo+ID4+IFNldCBIT1NUX0xERkxB
R1MgUlVTVEZMQUdTIHZpYSB0aGUgaG9zdC1jb25maWcgZmVhdHVyZSwgc2VlOgo+ID4+IGh0dHBz
Oi8vZG9jLnJ1c3QtbGFuZy5vcmcvbmlnaHRseS9jYXJnby9yZWZlcmVuY2UvdW5zdGFibGUuaHRt
bCNob3N0LWNvbmZpZwo+ID4+Cj4gPj4gV2UgaGF2ZSB0byBlbmFibGUgdGhpcyBuaWdodGx5IGZl
YXR1cmUgZmlyc3QgdXNpbmc6Cj4gPj4gQ0FSR09fVU5TVEFCTEVfSE9TVF9DT05GSUc9InRydWUi
Cj4gPj4KPiA+PiBTZXBhcmF0ZWx5IHNldCB0YXJnZXQgUlVTVEZMQUdTIGZvciB0aGUgdGFyZ2V0
IHRyaXBsZSBzcGVjaWZpYyBlbnYKPiA+PiB2YXJpYWJsZS4KPiA+Pgo+ID4+IFNpZ25lZC1vZmYt
Ynk6IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgo+ID4KPiA+IEZU
UiwgQXJub3V0IGRpZCBhIHJldmlldyBvZiBhIHByZXZpb3VzIGl0ZXJhdGlvbiwgYW5kIHByb3Bv
c2VkIGEgY29tbXQKPiA+IGxvZyB3aXRoIGEgbG90IG1vcmUgZGV0YWlscyBhbmQgZXhwbGFuYXRp
b25zIG9uIHRoZSBhY3R1YWwgcmVhc29ucyB3aHkKPiA+IHdlIGhhdmUgdG8gZG8gdGhpcyBjaGFu
Z2U6Cj4gPgo+ID4gICAgICBodHRwczovL2xvcmUua2VybmVsLm9yZy9idWlsZHJvb3QvMGEyZTBk
ZDgtYjU3OS02NDRhLTlkODMtYWY4OGU0MGQ0MGRlQG1pbmQuYmUvCj4KPiAgIEFjdHVhbGx5LCB0
aGF0IHdhcyBzdXBwb3NlZCB0byBiZSBhIHJlcGx5IHRvIHRoaXMgdjMsIG15IGJhZC4uLgo+Cj4g
ICBAamFtZXMganVzdCBjb25maXJtYXRpb24gdGhhdCBteSBwcm9wb3NlZCBjb21taXQgbG9nIGlz
IGVub3VnaCwgSSBhbHJlYWR5IGhhdmUKPiBpdCBsaW5lZCB1cCBmb3IgcHVzaGluZy4KClllcCwg
bG9va3MgZ29vZCB0byBtZS4KCj4KPiAgIFJlZ2FyZHMsCj4gICBBcm5vdXQKPgo+ID4KPiA+IENv
dWxkIHlvdSBwbGVhc2UgcmV2ZXZpZXcgd2hhdCBoZSB3cm90ZSwgYW5kIGluY29ycG9yYXRlIHRo
YXQgaW4geW91cgo+ID4gY29tbWl0IGxvZyAoYW5kIGFtZW5kL2V4dGVuZCBmdXJ0aGVyIGlmIG5l
ZWRlZCksIGFuZCB0aGVuIHJlc3BpbiwKPiA+IHBsZWFzZT8KPiA+Cj4gPiBSZWdhcmRzLAo+ID4g
WWFubiBFLiBNT1JJTi4KPiA+Cj4gPj4gLS0tCj4gPj4gQ2hhbmdlcyB2MiAtPiB2MzoKPiA+PiAg
ICAtIHJlYmFzZQo+ID4+IENoYW5nZXMgdjEgLT4gdjI6Cj4gPj4gICAgLSBhZGQgUlVTVEZMQUdT
IHRvIEhPU1RfUEtHX0NBUkdPX0VOVgo+ID4+IC0tLQo+ID4+ICAgcGFja2FnZS9wa2ctY2FyZ28u
bWsgfCAxMCArKysrKysrKy0tCj4gPj4gICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQo+ID4+Cj4gPj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcGtnLWNhcmdv
Lm1rIGIvcGFja2FnZS9wa2ctY2FyZ28ubWsKPiA+PiBpbmRleCA1NjAwYzhlOTdlLi4yNjRiZjVh
MWFlIDEwMDY0NAo+ID4+IC0tLSBhL3BhY2thZ2UvcGtnLWNhcmdvLm1rCj4gPj4gKysrIGIvcGFj
a2FnZS9wa2ctY2FyZ28ubWsKPiA+PiBAQCAtMzQsNyArMzQsMTAgQEAgUEtHX0NPTU1PTl9DQVJH
T19FTlYgPSBcCj4gPj4gICAjIHVzaW5nIG5pZ2hseSBmZWF0dXJlcyBvbiBzdGFibGUgcmVsZWFz
ZXMsIGkuZSBmZWF0dXJlcyB0aGF0IGFyZSBub3QKPiA+PiAgICMgeWV0IGNvbnNpZGVyZWQgc3Rh
YmxlLgo+ID4+ICAgIwo+ID4+IC0jIENBUkdPX1VOU1RBQkxFX1RBUkdFVF9BUFBMSUVTX1RPX0hP
U1Q9InRydWUiICJlbmFibGVzIHRoZSBuaWdodGx5Cj4gPj4gKyMgQ0FSR09fVU5TVEFCTEVfSE9T
VF9DT05GSUc9InRydWUiIGVuYWJsZXMgdGhlIGhvc3Qgc3BlY2lmaWMKPiA+PiArIyBjb25maWd1
cmF0aW9uIGZlYXR1cmUKPiA+PiArIwo+ID4+ICsjIENBUkdPX1VOU1RBQkxFX1RBUkdFVF9BUFBM
SUVTX1RPX0hPU1Q9InRydWUiIGVuYWJsZXMgdGhlIG5pZ2h0bHkKPiA+PiAgICMgY29uZmlndXJh
dGlvbiBvcHRpb24gdGFyZ2V0LWFwcGxpZXMtdG8taG9zdCB2YWx1ZSB0byBiZSBzZXQKPiA+PiAg
ICMKPiA+PiAgICMgQ0FSR09fVEFSR0VUX0FQUExJRVNfVE9fSE9TVD0iZmFsc2UiIGlzIGFjdHVh
bGx5IHNldHRpbmcgdGhlIHZhbHVlCj4gPj4gQEAgLTQzLDkgKzQ2LDExIEBAIFBLR19DT01NT05f
Q0FSR09fRU5WID0gXAo+ID4+ICAgUEtHX0NBUkdPX0VOViA9IFwKPiA+PiAgICAgICQoUEtHX0NP
TU1PTl9DQVJHT19FTlYpIFwKPiA+PiAgICAgIF9fQ0FSR09fVEVTVF9DSEFOTkVMX09WRVJSSURF
X0RPX05PVF9VU0VfVEhJUz0ibmlnaHRseSIgXAo+ID4+ICsgICAgQ0FSR09fVU5TVEFCTEVfSE9T
VF9DT05GSUc9InRydWUiIFwKPiA+PiAgICAgIENBUkdPX1VOU1RBQkxFX1RBUkdFVF9BUFBMSUVT
X1RPX0hPU1Q9InRydWUiIFwKPiA+PiAgICAgIENBUkdPX1RBUkdFVF9BUFBMSUVTX1RPX0hPU1Q9
ImZhbHNlIiBcCj4gPj4gICAgICBDQVJHT19CVUlMRF9UQVJHRVQ9IiQoUlVTVENfVEFSR0VUX05B
TUUpIiBcCj4gPj4gKyAgICBDQVJHT19IT1NUX1JVU1RGTEFHUz0iJChhZGRwcmVmaXggLUMgbGlu
ay1hcmdzPSwkKEhPU1RfTERGTEFHUykpIiBcCj4gPj4gICAgICBDQVJHT19UQVJHRVRfJChjYWxs
IFVQUEVSQ0FTRSwkKFJVU1RDX1RBUkdFVF9OQU1FKSlfTElOS0VSPSQobm90ZGlyICQoVEFSR0VU
X0NST1NTKSlnY2MKPiA+Pgo+ID4+ICAgIwo+ID4+IEBAIC01Myw3ICs1OCw4IEBAIFBLR19DQVJH
T19FTlYgPSBcCj4gPj4gICAjIGFuZCBzaG91bGQgYmUgcmVtb3ZlZCB3aGVuIGZpeGVkIHVwc3Ry
ZWFtCj4gPj4gICAjCj4gPj4gICBpZmVxICgkKE5PUk1BTElaRURfQVJDSCksYXJtKQo+ID4+IC0g
ICAgUEtHX0NBUkdPX0VOViArPSBSVVNURkxBR1M9Ii1DbGluay1hcmc9LVdsLC0tYWxsb3ctbXVs
dGlwbGUtZGVmaW5pdGlvbiIKPiA+PiArICAgIFBLR19DQVJHT19FTlYgKz0gXAo+ID4+ICsgICAg
ICAgICAgICBDQVJHT19UQVJHRVRfJChjYWxsIFVQUEVSQ0FTRSwkKFJVU1RDX1RBUkdFVF9OQU1F
KSlfUlVTVEZMQUdTPSItQ2xpbmstYXJnPS1XbCwtLWFsbG93LW11bHRpcGxlLWRlZmluaXRpb24i
Cj4gPj4gICBlbmRpZgo+ID4+Cj4gPj4gICBIT1NUX1BLR19DQVJHT19FTlYgPSBcCj4gPj4gLS0K
PiA+PiAyLjM0LjEKPiA+Pgo+ID4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gPj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+ID4+IGJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCj4gPj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cj4gPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
