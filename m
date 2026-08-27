Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AD08C5DF9D
	for <buildroot@archiver.kernel.org>; Thu, 27 Aug 2026 04:20:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F9B9405CC;
	Thu, 27 Aug 2026 04:20:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qk5aBQy9rEpi; Thu, 27 Aug 2026 04:19:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787804398;
	bh=roHM1BPviOXqwD038VFhqNgh0wIHvC6u7eSquqHahbA=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DUhWv1RS4nwO0RfTynQj936Qoo85kIbigkBiwG6eRotSmrOrHV5ZgE7kTEz0W4Ucg
	 FbPKyehYCG0jNCoA3d5bENaBKEaT1HMakwOBg8HVuhvcin1vpL1WHoGBPQ8A5EzcDn
	 ORP+6iaKIjniiQzjEVADED+2kuCC/DNwmXFwYQZpLOUJMFhf6jTUiAmHkUKbwR6osW
	 35M5Lu48obyCLAE50LTD4EYtm3Xutft+3JYf7ahjQMktBsDa6H6wk3KaZnTcE3TQu1
	 ELKPQynEEVhpWCT90WmfrxNaXYsKDybf+2t25w7V/lhpwZO8wuZjlWLJufRQENhEih
	 pMiHxN85fKUrA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AC7740596;
	Thu, 27 Aug 2026 04:19:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C8693A4
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 04:19:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5DC4080AD0
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 04:19:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JX1vIozq_p_l for <buildroot@buildroot.org>;
 Thu, 27 Aug 2026 04:19:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com;
 envelope-from=matthew.l.weber@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=thewebers.ws
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=thewebers-ws.20251104.gappssmtp.com
 header.i=@thewebers-ws.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=gzyLPknV
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C824680AC7
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 04:19:52 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-39faa67fab8so10816111fa.2
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 21:19:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787804391; cv=none;
 d=google.com; s=arc-20260327;
 b=fFvAAkTLbwQDlUpDGWSdk2lGdzwv+AzhYGWe8haG1LI79BmoWgX610jbpYtQ/nOl7s
 T1zIClNyDQ5o2CvA9ibViGfQMKelFHghKU7/AtOSZMIgdqst96dKqnlFjanO3kNkjgfm
 i+Vhjcxk7/eilCswQUYpM7zGoadpoKeTQ7+AFltubZA3082pFwPKd9R45k8R6VeQN1El
 rvm2cDTcEG7V4dXbQ+ui99hQZw9A4pKyj3fLeC+EFrKWwhL2ZFXAHg8kLZRSPGQ+AAe6
 E4i7xlAK9PTHO4cawj+4FrOvZ/qQEKW3vyTJAbefeJtgrtlL5ODj8M5BYsbWWBFhWz62
 l0Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=RjbzL/CC7lD21C+yV+ItKsiW4zKkhnOI3uJhWjW7QCY=;
 fh=+LA+0Nl6fIBxrk7d4ZetPSGeD+MMH1AiLmqaUBeAVto=;
 b=cPiSOzIiANm3h8mE21KKxAQIV7CzzJ0P3VVad5RFRKYPXpUtL3DmaMEC2kdFJlPH3F
 dm/+4wAxgtBXRLSMgwkxX6HkFkMh983UOmflYt81NuXyotMt0lpGRoD4ysq5OBMZw5sD
 aTBiaPHyQt4XH1YoS2bkhks/R7Oj0kWfqHJglMfMRSC92ExPr7MJIJ56ihEY/DVwfvmH
 Ra9t0NVGZiyeTXbw4Q09WDRHjtpPbnQIqHepVbAgC3zNtOKkfGY9nHXzqMOHkJl077Ry
 3PASUQ5ji3kLmdmg2T1C5rTqf8gr89GU0ELdb1OoGuc3efgEBHOBh5ulDw9OYm5LCgWs
 43sA==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=thewebers-ws.20251104.gappssmtp.com; s=20251104; t=1787804391; x=1788409191;
 darn=buildroot.org; 
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=RjbzL/CC7lD21C+yV+ItKsiW4zKkhnOI3uJhWjW7QCY=;
 b=gzyLPknV9Nz6I0pCwwjrghiDDlodz63Gw/oPKgiIkwwZroGgvPbgGrIbezxWt+7oqY
 YKJRSiMxOelUlluFQ/u4XP/uv9kWsNS5ZqgbTI2NOrU08a07c+x6TyPVmiVPoYhrLzK/
 Q63KOx0HYh8EWnqYrvtjf//YYtfZsbSjdTAzAm3jBLQm4SfbKnm/WKRBrud2YeykowG6
 5QC261ZloiXz48N0WdBnECi86kDm1zCPSYcDiYaKmtHMBpQTtQNeqssKt2TmAM4B/Adj
 6EVF051PMn9vMb7KoYpdXvNtKrkcGsovaRi1LaXDERoorUSDXMm0vgVTndRaILw6MdF4
 j20Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787804391; x=1788409191;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=RjbzL/CC7lD21C+yV+ItKsiW4zKkhnOI3uJhWjW7QCY=;
 b=A2kPf64WjYGAR4tYPGZbVR6ang5cTurJSkkog+SwTx1ejgUpAqg1k56iYKG5z2wxf7
 F368OjlKhe3xbbi0OVLbRSdq7wkRB7XeERiO62mP9PnrOyWDXUfqvYQDUenM9731vnxb
 0bWaG+gbwHJYisJFKnF5GQ3HeuT1z6wlv1PluF1FBfMLpqlI3C+NMN1ENOrkgxOr08c3
 FBWpUyR0z0I+hSM/DU+PN7L3QGew+nTleipzScWvUQO63Y1YqsGS1/HWyTcVnKxETuC6
 o3ib4SzETpi3RvCUDIck6Cfaw864GD9DoOewAa54CSKSAFRsJpdy1aO0/P2N2BxzAbCg
 dSEQ==
X-Gm-Message-State: AFuF++lTHbFMzo8h0qMmKh0RP/Rv81JxZYLWobxo0sHoAEm7I7ZQ5w7E
 4x7OGgBctYFYTWrP4AdQ2q8nFrDN+yYcObGR0iix7e58okj9fHfULse+jxw+65kDsqW3IN27Syy
 ZMeobBrylKQtc7KFYlsD/aYYoUDDkVPc=
X-Gm-Gg: AR+sD13D1L/aFyzsLjSqVSvodep5+X8KCOC1RxsRvBzfj+VUvOPxKBRgyL8Wz0uzd9+
 3pcNlomCQEDC3M4zL/iytfhMbSAfEGvtQhPkPw6Ii8NloywsHc6teAKBsV23v+3sduvNzKsTq19
 gtvxg/zDt3MAWceZQabjnepkzhVPeXpt5+n2cm120Hf467qhMrtwdfMQsns/Ry4DGYrECfGnq0p
 36/wz4YvId2LftxaYm0AjcwHwTNUe5EtEjlanEEq6Hn0INIA/VeiW5rCW0eDfMIYeJ3Kbj6yfvw
 m3e9BCa5YWOpLzVv/KzcjjXz7CvEmjO68Puh73ffEUKY
X-Received: by 2002:a05:651c:31d7:b0:3a1:4f33:f60e with SMTP id
 38308e7fff4ca-3a1fd5e292dmr24756051fa.8.1787804390464; Wed, 26 Aug 2026
 21:19:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260825214203.3708181-1-thomas.petazzoni@bootlin.com>
 <20260825214203.3708181-4-thomas.petazzoni@bootlin.com>
In-Reply-To: <20260825214203.3708181-4-thomas.petazzoni@bootlin.com>
From: Matthew Weber <matt@thewebers.ws>
Date: Wed, 26 Aug 2026 23:19:37 -0500
X-Gm-Features: AcwNN1XhXPtuolHVwzI8nGG0Ati4mtZ68RyWQGrPZcfuZcheB_EtTxQssIk06fw
Message-ID: <CAFt09wMrVryrn14zaNKfjvAbk_Whpw=PQ2k=QWFScq2qNHtQ5w@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Buildroot List <buildroot@buildroot.org>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, 
 "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH v3 3/3] support/scripts/check-host-bins: add
 new check on host binaries/libs
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhvbWFzL1lhbm4sCgpPbiBUdWUsIEF1ZyAyNSwgMjAyNiBhdCA0OjQy4oCvUE0gVGhvbWFzIFBl
dGF6em9uaSB2aWEgYnVpbGRyb290CjxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6Cj4K
PiBPbmUgZnJlcXVlbnQgaXNzdWUgaW4gQnVpbGRyb290IGlzIHRoYXQgd2hlbiBidWlsZGluZyBo
b3N0IGxpYnJhcmllcwo+IG9yIGFwcGxpY2F0aW9ucywgdGhlIGJ1aWxkIHN5c3RlbSBvZiB0aGUg
cGFja2FnZSBkZXRlY3RzIHNvbWUKPiBsaWJyYXJpZXMgcHJvdmlkZWQgYnkgdGhlIHN5c3RlbSwg
YW5kIGhhcHBpbHkgbGlua3MgdG8gdGhlbSwgd2l0aG91dAo+IEJ1aWxkcm9vdCBrbm93aW5nLiBT
b21ldGltZXMgdGhpcyBkb2Vzbid0IGNhdXNlIGFueSBwcm9ibGVtLCBidXQKPiBzb21ldGltZXMg
dGhpcyBjYXVzZXMgaXNzdWVzLCBhbmQgd2UncmUgcmVndWxhcmx5IGVsaW1pbmF0aW5nIHN1Y2gK
PiBtaXMtZGV0ZWN0aW9uIGJ5IGZvcmNpbmcgdGhvc2UgcGFja2FnZXMgdG8gbm90IGRldGVjdCB0
aGUgc3lzdGVtCj4gbGlicmFyaWVzIHRoYXQgaGF2ZSBub3QgYmVlbiBidWlsdCBieSBCdWlsZHJv
b3QuCj4KPiBCYXNlZCBvbiBhIHN1Z2dlc3Rpb24gZnJvbSBZYW5uIEUuIE1vcmluLCB0aGlzIGNv
bW1pdCBleHRlbmRzCj4gY2hlY2staG9zdC1iaW5zIHRvIHZlcmlmeSB0aGF0IGFsbCBiaW5hcmll
cyBhbmQgbGlicmFyaWVzIGluCj4gJChIT1NUX0RJUikgb25seSBoYXZlIHNoYXJlZCBsaWJyYXJ5
IGRlcGVuZGVuY2llcyBvbiBsaWJyYXJpZXMgdGhhdAo+IGFyZSBpbiBCdWlsZHJvb3QgJChIT1NU
X0RJUiksIHRvIHRoZSBleGNlcHRpb24gb2YgdGhlIEMgbGlicmFyeSAoYW5kCj4gZnJpZW5kcyks
IGZvciB3aGljaCB3ZSBvZiBjb3Vyc2UgdXNlIHRoZSBzeXN0ZW0gQyBsaWJyYXJ5Lgo+Cj4gRm9y
IGV4YW1wbGUsIGlmIHRoZSBiaW5hcnkgb3V0cHV0L2hvc3QvYmluL3Bsb3AgaXMgbGlua2VkIGFn
YWluc3QKPiBsaWJwbmcsIGJ1dCBsaWJwbmcgd2FzIG5vdCBidWlsdCBhbmQgaW5zdGFsbGVkIGJ5
IEJ1aWxkcm9vdCwgdGhlIGJ1aWxkCj4gd2lsbCBub3cgZmFpbCB3aXRoOgo+Cj4gKioqIEVSUk9S
OiBwYWNrYWdlIGhvc3QtZ2RiIHVzZXMgbGlicyBub3QgaW4gSE9TVF9ESVI6Cj4gICAtIGxpYmx6
bWEuc28uNQo+ICAgLSBsaWJ4eGhhc2guc28uMAo+Cj4gVGhlIHNjcmlwdCBpbmNsdWRlcyBhbiBh
bGxvd2xpc3Qgb2YgbGlicmFyaWVzIHByb3ZpZGVkIGJ5IHRoZSBDCj4gbGlicmFyeS4gSXQgaXMg
cG90ZW50aWFsbHkgcG9zc2libGUgdGhhdCB0aGlzIGxpc3QgbWlnaHQgbmVlZCB0byBiZQo+IGV4
dGVuZGVkIHRvIGNvdmVyIGFsbCBzeXN0ZW1zL2Rpc3RyaWJ1dGlvbnMvQyBsaWJyYXJpZXMsIGJ1
dCBvbmx5Cj4gd2lkZXIgdGVzdGluZyBvZiB0aGlzIHNjcmlwdCB3aWxsIGhlbHAgZGV0ZWN0IHN1
Y2ggY2FzZXMuCj4KPiBDby1kZXZlbG9wZWQtYnk6IFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9yaW4u
MTk5OEBmcmVlLmZyPgo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5w
ZXRhenpvbmlAYm9vdGxpbi5jb20+Cj4gLS0tCj4gSXQgd291bGQgYmUgdmVyeSB1c2VmdWwgaWYg
YSBmZXcgcGVvcGxlIGNvdWxkIGFwcGx5IHRoaXMgcGF0Y2ggdG8KPiB0aGVpciBsb2NhbCB0cmVl
LCBydW4gdGhlaXIgdXN1YWwgYnVpbGQsIGFuZCBzZWUgaG93IGl0IGJlaGF2ZXMuIFRoaXMKPiB3
YXksIEkgY2FuIGdldCBzb21lIGZlZWRiYWNrIHRvIGFkZHJlc3MgdGhlIG1vc3Qgb2J2aW91cyBp
c3N1ZXMgYmVmb3JlCj4gaXQgZ2V0cyBtZXJnZWQgYW5kIHN0YXJ0cyBjYXVzaW5nIGJ1aWxkIGZh
aWx1cmVzIGluIHRoZSBhdXRvYnVpbGRlcnMuCgpJIGRpZCBzb21lIHRlc3RpbmcgYW5kIGZvdW5k
IHRoZSBtdXNsIGxpYnJhcnkgbmVlZHMgYWRkZWQgdG8gdGhlCndoaXRlbGlzdCBmb3IgQWxwaW5l
LiAgSSBhbHNvIGFkZGVkIGxpYnJhcmllcyB0byB0aGUgc2NhbiB3aGljaCBhZGRlZAptb3JlIGNo
YW5nZXMgdGhlbiB3aGF0IEkgY291bGQgZWFzaWx5IGluY2x1ZGUgaGVyZS4gIEhlcmUncyBteSBt
b2NrZWQKdXAgY2hlY2staG9zdC1iaW5zIGFuZCB0ZXN0IHNjcmlwdC4gIFRoZSB0ZXN0IGNhc2Ug
NSB3YXMgbW9kZWxlZCBhZnRlcgp0aGUgZGlzdHJvIHRlc3RzIHRoYXQgeGVuIGRvZXMgdG8gdGFy
Z2V0IGRpZmZlcmVudCBjb250YWluZXJzIHRvIGZpbmQKd2hpdGVsaXN0IGdhcHMuCgpodHRwczov
L2dpc3QuZ2l0aHViLmNvbS9tYXR0aGV3LWwtd2ViZXIvMzRmYWUxNWE0MzE5YTgxNDYyOTYxZWFk
ZjBlMzExNjQKClNvbWUgb2YgdGhpcyB3YXMgQUkgZ2VuZXJhdGVkLCBkb2VzIEJ1aWxkcm9vdCBo
YXZlIGFueSBydWxlcyBhcm91bmQgQUkgdXNlPwoKQmVzdCBSZWdhcmRzLApNYXR0Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
