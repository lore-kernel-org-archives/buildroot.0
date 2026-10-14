Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E02ECC6B2D
	for <buildroot@archiver.kernel.org>; Wed, 14 Oct 2026 21:14:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24A336077F;
	Wed, 14 Oct 2026 21:14:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HeN2o4wbTAYm; Wed, 14 Oct 2026 21:14:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3BD07608B2
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792012496;
	b=QoADaNEWADZ59iuIM5k/3osWf7rn9CXC+Ao1SEb5nLhW2gTs+WNzdZkI8K5hfeTyXBAG
	 KkIWkInJAWJo4qLUL3LLjAMMLi8iFCqS06zDoysy9ojB0hcfvD1kZyNyw+nlGPTkNcU/m
	 IZtN6ehlCfP/tbGjEpkkIK6vuHUzSej6p5ku/Ur+w+8pzcgzxoqxQBf8UlXilTEUzsN7M
	 VXvCETXgyY+rU85T2bWgU7DmGCilkudpRZHktaO0PLJEKVytn3dlMHlfY00kXHYoeBTe5
	 ZkXpx/I/H1a2Yc1EX/ORTPnGThdjUZpuCFSEPKXMkeHB71Hp5Z7zowPEd4Kxd6/foDw==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792012496;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:To:Cc:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=7tPEdYJbwsYr8KwPU3ysXJYI6ZuwcvP4bB/ieAbVqv0=;
	b=lMq8/MVzzwg1SKQ2lf77DndE8qGrh+FHKMyP5PsVVV2inovnS/aO25/KWROQk6OuUPoj
	 TFbk/N9X6zf0l2lwa12uHZ4zWJtuzHsjl8R3lfxNmi89bHMmW4CiYPewn4XejQ/1oTajp
	 wVS1yTApiQBtpsG3t5GsJA6Ylry0/PduV4zPYsXIIVfthJi0hRvrxb/sFLYAf1bLwADkx
	 gL6vLZ6LC7jFcic+nF/uzoP1WKzCIDh/yjb76X+v1zclhMZ0Bf/m5pi0NeC2dbbVOYOOu
	 O+vZwMeMXCwKUA9eah3oAE4JlE0UU1XweDDg0AkvidZoC1Z3RlmSMSKE4mtieIAbAzA==
ARC-Authentication-Results: i=3; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792012496;
	bh=7tPEdYJbwsYr8KwPU3ysXJYI6ZuwcvP4bB/ieAbVqv0=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f3lZt/c0sHSR1pnKybKmb6q89jDuvl1cTgM1Y7DijRXwe3rAMclh+h4yx2dzmSCs7
	 qzDBLw62/UOZSFFzHRTq8+2O4TsTN6vB3Yqhw5z9o5jNW0EtdAqOVnrnk4p+YEoYba
	 H3reK2TS1HY7tfEwAXxGNaUcVDCnPTt7o6D4V5nEqk0jjRyLubpBTj9KzdB6o29tlE
	 tuK0Rcp1AoHbP4gR1HJoz7Ohw/srZ20JS1bb7gm3LnzYKHKP99CcsNWl+zFHrMT+Hh
	 vn8rvyKiUT14HQzx6jlCf3aTxbR7ohXq/VMNabprfeocbxa+/1eHDR2ha1WOC8STvT
	 JhKME0NsuWJdA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BD07608B2;
	Wed, 14 Oct 2026 21:14:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 03B681DE
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 21:14:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E944540223
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 21:14:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Ef2r4A2gxkE for <buildroot@buildroot.org>;
 Wed, 14 Oct 2026 21:14:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org AFEFF401A4
Authentication-Results: smtp2.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a00:1450:4864:20::529"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1792012494;
 b=BtN86EkU79mtY0RbLtFA9gKXTDR4MP8Tmbb5YX6+6qnD4681aL3pJe0D3nk3mCekwtx4
 3k278eoPYjI7veskEdXLt0phrtC4Lf7JYp7FCXP5kXon6FqvLJbihbRipJInuicMzYk6q
 0zK0sSVFTw2X0LrfVwg6Sg91wdNgmS5GbmGMxwYH2DKLZHsSZqwXkqL8i0O3ecJZp5zXs
 B3pz6vjZJJbgU0VowfSISpxinFLYOnmOqUNNv4eB3L8xcl2JfHa6uZyDzPW2l8u908sLz
 4ZLjtxgXuUqnMcre49a34zkFouQfb1GGjKU1n6i3rDo4keQUrLDdcHjBe7APEuKxh4g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792012494;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
 Content-Type:Content-Transfer-Encoding;
 bh=MUG6KAIvm0eDn4lUx+Ivr5HYI8h/PTjl1CCZjtohcI4=;
 b=OAobnpluL+0H99aRjJjaXHjR+gYy3nm33b4m3t9PrwkcMtZ/Lr7EcMuSXp2Cml1Efk05
 rKXEVqAVUlYcIwxYbNwhD88Zv0eHal6HcCAx2Apb05lD2vGOu+TpPidI9Ae7r3QE0jgkb
 hnS1okm9rkUeEAGiXX5eFmjhsFrvbAXHAxrTGDOQ7gaby5CA9gowRBfhc7Cms0/M7kOYX
 y6QnMbvAXv6+ICG2m2yRLEt8IpRVM060MOFP4cCpKAKrhBBq/v0TeR2dd06YguFD+g9ya
 CLXq0AMT0CWK0S1BzAqAMWp8gzpb/xbfunH5+/9LlQ4Uv3Z+Dnav49OxXzpe4HfstGg==
ARC-Authentication-Results: i=2; smtp2.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=CVTLNXNv; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2a00:1450:4864:20::529"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20251104 header.b=CVTLNXNv
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AFEFF401A4
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 21:14:53 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-6b1d8944cb0so4900181a12.3
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 14:14:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792012491; cv=none;
 d=google.com; s=arc-20260327;
 b=VQ81hV/K3yCk5Bu1yf9B6MU9LnL79dsZqaFxGBBqeNF6yHdja/D9/MPx8uWpEfzmBx
 cLHFgbsU4cGReBDgU3fm1xl+0cWsoz/8j2TdUi47m3RsJ9ksoWwpmRWW+NKz4LYH7/3V
 mqVcwpOJwZ4Jj4G1zvdcXSh569uvjQL7f+nS3XYWpu0IfiVE/LZWi+snoFyO2lX35gS2
 +Cakck+aJzk52RxUcewxgsBWd7Dg/tihHNQUGTfSx01xBwqQgacYibzvP2zUA47bvLX6
 dj9QYwAH3o4gEjzF9W/GQDl8wzb0C7esVJlp0E67VkEj4zmgnYZwu6FIRGd/u3IPu+xT
 eyRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=MUG6KAIvm0eDn4lUx+Ivr5HYI8h/PTjl1CCZjtohcI4=;
 fh=ctPO35gVqHgqZmOKaD4//WIAR/NDn8Ss0YyyR38Lhwk=;
 b=SGj2BNTsHWmTgBEJcARe24nKYzcJPsdyAbQpIQ+U8L91XcNjo+Nbr98lyzDuQTRk5X
 tIHMlChQdY8smXF+lvt8gwLcYaYG1VMf3csKkM96MUzMNFeLSLHFvctcyoUvo7ZJeVel
 qUEj3o+1TqxSNs+Wvi/BAlXiybG2PdAuJj2P23QWBQ7NrkMEBJ6lLSvQ6/N8DkMf7yHn
 6P8o6jOXbg0XXBER3Ekumwow4ilCARG1d+TmRyc8RC+uYmYVXb0usH0ZAS7iDTpFgUjO
 TYinFIdrOu5tOAKokYitKKKze0myubEo7rLnn/YSC7G4sJbTmfl6jYDGNF6DV3+tuJZu
 f1Mw==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20251104; t=1792012491; x=1792617291; darn=buildroot.org; 
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=MUG6KAIvm0eDn4lUx+Ivr5HYI8h/PTjl1CCZjtohcI4=;
 b=CVTLNXNv/V+NahOfoisCe6vHxV0MeMGHKFmUpOQa4NEkP74UU/r30FwPnsvOikNSfk
 K+L50Y6Sdb2ov3zQ2HiO1/A2+zq1E6hjnJbB+7UkBhOoOsyaT0nNelbdI/E6X3RwAq15
 bEl8lhKXdxtDZqHp8xPCNPzmNnLcxEXEs+pmU36ieMx+W12hObYd9p4/m0SuvYlDdbkM
 U3FKA1G5T/Wq1AZlG6nofectGABGdiWgVPtEg+IqDf8rTvhmfEYk39DhO2L4wdrWcXQj
 hPYUk82pauNYDvaKogiZAtFkqp28M5In58xHYnheocjOL8kg5XMPMXmYI6vuWsn3fLG4
 5ukw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792012491; x=1792617291;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=MUG6KAIvm0eDn4lUx+Ivr5HYI8h/PTjl1CCZjtohcI4=;
 b=mm5loODaJbPi/GiLl1qq3Z6dtT+6Nf7Ied7vwuFbBK0BCpWJCfn80Bl+hiydqrClhT
 rPZrizGjskjxf2B6bl9vjg1aTpjYifAyOc8l62UuEVmSEelPFydNh57dSpLg29IOzO5i
 Qp9lQKP3FVsEU8lsEXvAIswoAv3YIUsDCvaWYsE1zhlyHePeKlpsNBb0wgfkkjWLJtkV
 RseRltOEBkUoB1hX1G9tkP/v7DG8p7fUduULXM0QMirI7+A8nICHtHdgpKt3Wr7Yit01
 lCuxpgjFSfK3K2drzyvLqHDY+L7wI/KbzxedqfcRhlJVTk9DXH17lPS1P059+U7QIlZY
 nkmA==
X-Gm-Message-State: AFq9FYKUKvs8bQjpx6d6xt+kSmnl+CC13S152aJUgWGxA237kPmUJPb0
 UKIMPLiTkLiNwvsjsrHxGXjyvwoV0viB4caE4SIrcvqAFveh1BjBvuBayazGCNy5oRjDmXxX1gn
 Jb1uaQZp6YsbzRyFQ3v+LGB7E/DwxMKCflgjh
X-Gm-Gg: AYBFou2gcINiK3Clj/hX9H2Ccb2BoOX6/ojODrLpUGQUjIlvX9c/bA2VleMAGBN2OVI
 hr17piZtxS6nGjziNfMzjRWKUSmcg9VdPxq4VpZO5LN7X+hBVgHPVMcZcVCNnclLejWinKZOtBJ
 HPkoys6J73FfqGaI/7w1at0QESu7E3eMP5nxWFZ6Qso3eoPdmkNEo2Lktw+4RsXxb0F1PU+Nzz4
 Y2r141U2LHVohywWzzlLpcXQDMZgzU0aWG06sdfMps3zTRkMABQ+SOqd2MZ7hhBZYorcnFHoSQy
 mD3YEEuZLPqsMB4fnedihzItOEjbHJeUt+haObInx4Uxxz7uFpFmhEPX
X-Received: by 2002:a05:6402:1f82:b0:6a9:bb40:6de7 with SMTP id
 4fb4d7f45d1cf-6b17c2a2d54mr14368828a12.23.1792012491150; Wed, 14 Oct 2026
 14:14:51 -0700 (PDT)
MIME-Version: 1.0
References: <20261013140423.1941069-1-yegorslists@googlemail.com>
 <20261013140423.1941069-2-yegorslists@googlemail.com>
 <as6eHGluGeyQ9GSt@windsurf>
In-Reply-To: <as6eHGluGeyQ9GSt@windsurf>
From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 14 Oct 2026 23:15:19 +0200
X-Gm-Features: AclHuK_tPvOkAlhYH7Fx6JbZ9J_vE3Vo3rkQmcOK6-_GJhk0aZO5CSZqokPhZT4
Message-ID: <CAGm1_kveqnRXyPLEQBipXuxm-f1SNT9H8dsFEPAX=tVxV7B0QA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 2/2] package/python-zlmdb: bump to version
 26.7.1
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

SGkgVGhvbWFzLAoKT24gVHVlLCBPY3QgMTMsIDIwMjYgYXQgMTE6MTLigK9QTSBUaG9tYXMgUGV0
YXp6b25pCjx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwg
T2N0IDEzLCAyMDI2IGF0IDA0OjA0OjIzUE0gKzAyMDAsIFllZ29yIFllZnJlbW92IHdyb3RlOgo+
ID4gVmVyc2lvbiAyMy4xLjEgc2hpcHMgYSB2ZW5kb3JlZCBjb3B5IG9mIGZsYXRidWZmZXJzIGFz
IGEgdG9wLWxldmVsCj4gPiAiZmxhdGJ1ZmZlcnMiIHBhY2thZ2UsIHdoaWNoIGNvbmZsaWN0cyB3
aXRoIHB5dGhvbi1mbGF0YnVmZmVycyB0aGF0Cj4gPiBweXRob24temxtZGIgaXRzZWxmIHNlbGVj
dHM6Cj4gPgo+ID4gICBGaWxlRXhpc3RzRXJyb3I6IEZpbGUgYWxyZWFkeSBleGlzdHM6IC4uLi90
YXJnZXQvdXNyL2xpYi9weXRob24zLjE0L3NpdGUtcGFja2FnZXMvZmxhdGJ1ZmZlcnMvX19pbml0
X18ucHkKPiA+Cj4gPiBTdGFydGluZyB3aXRoIHRoaXMgcmVsZWFzZSB0aGUgZmxhdGJ1ZmZlcnMg
cnVudGltZSBpcyB2ZW5kb3JlZCBhcwo+ID4gemxtZGIuZmxhdGJ1ZmZlcnMsIGFuZCBweS1sbWRi
IHBsdXMgYSBwYXRjaGVkIExNREIgYXJlIHZlbmRvcmVkIGFzCj4gPiB6bG1kYi5fbG1kYl92ZW5k
b3IsIGJ1aWx0IGFzIGEgQ0ZGSSBleHRlbnNpb24uIFRodXMgZHJvcCB0aGUKPiA+IHB5dGhvbi1m
bGF0YnVmZmVycyBhbmQgcHl0aG9uLWxtZGIgc2VsZWN0cy4KPiA+Cj4gPiBUaGUgYnVpbGQgc3lz
dGVtIHN3aXRjaGVkIHRvIGhhdGNobGluZy4gVGhlIGJ1aWxkIGhvb2sgbmVlZHMgaG9zdCBjZmZp
Cj4gPiBhbmQgc2V0dXB0b29scyB0byBjb21waWxlIHRoZSBMTURCIGV4dGVuc2lvbiBhbmQgdXNl
cyBjbWFrZSB0byBidWlsZAo+ID4gdGhlIGJ1bmRsZWQgZmxhdGMgY29tcGlsZXIuCj4gPgo+ID4g
VXBkYXRlIHRoZSBsaWNlbnNlIGluZm9ybWF0aW9uIHRvIGNvdmVyIHRoZSBidW5kbGVkIExNREIs
IHB5LWxtZGIgYW5kCj4gPiBmbGF0YnVmZmVycyBjb2RlLgo+ID4KPiA+IEZpeGVzOiBodHRwczov
L2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvZTNiMDI2Y2I0OGY0MWVjNTMxZTViZGFl
OWUwN2I4ZTU4MWYxYTA2Ygo+Cj4gV2hlbiB3YXMgdGhlIHByb2JsZW0gaW50cm9kdWNlZD8gSS5l
IGRvZXMgdGhlIHByb2JsZW0gZXhpc3QgaW4KPiAyMDI1LjAyLng/CgpZZXMuIHpsbWRiIGhhcyBp
bnN0YWxsZWQgaXRzIG93biB0b3AtbGV2ZWwgImZsYXRidWZmZXJzIiBwYWNrYWdlIG5leHQgdG8K
cHl0aG9uLWZsYXRidWZmZXJzIHNpbmNlIHRoZSBwYWNrYWdlIHdhcyBhZGRlZCAoYWNmNjgxODBk
ZTY2LCAyMDIyLjA4KS4KVGhlIG92ZXJsYXAgYmVjYW1lIGZhdGFsIHdpdGggODkzN2RiOGRkNTk1
ICgicGFja2FnZS9wa2ctcHl0aG9uLm1rOgptaWdyYXRlIHNldHVwdG9vbHMgdG8gcGVwNTE3Iiks
IHdoaWNoIGlzIGluIDIwMjQuMDUgYW5kIGxhdGVyOiB0aGUKcGVwNTE3IGluc3RhbGxlciByZWZ1
c2VzIHRvIG92ZXJ3cml0ZSBleGlzdGluZyBmaWxlcy4KClRoZSBhdXRvYnVpbGRlcnMgaGF2ZSBo
aXQgaXQgMzggdGltZXMgc2luY2UgQXByaWwgMjAyNCwgaW5jbHVkaW5nIG9uCnRoZSBMVFMgYnJh
bmNoZXM6CgogIDIwMjUuMDIueDogaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1
bHRzL2RkYjUwMDRkYjM4YzIxMjI0MGUxYjM1ZjA2NTExODE1ZTMxMWE5YmEKICAyMDI2LjAyLng6
IGh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy8wMjIxNTM3MDhmNGU3ZTkx
ZDM5MDFlNDk4MDRiMTFjYzQwMjhjODE3Cgo+IEl0J3MgYWx3YXlzIGEgYml0IGFubm95aW5nIHRv
IGhhdmUgdG8gZG8gYSBtYWpvciBidW1wIHRvIGZpeCBhbiBpc3N1ZSwKPiBhcyBpdCdzIG1vcmUg
cmlzayBpbiB0ZXJtcyBvZiBiYWNrcG9ydGluZyB0byBhbiBMVFMgYnJhbmNoOwoKQWdyZWVkLiB2
MiBhZGRzIGEgbWluaW1hbCBmaXggYmVmb3JlIHRoZSBidW1wOiBhIG9uZS1saW5lIHNldHVwLnB5
CnBhdGNoIHNvIHpsbWRiIDIzLjEuMSBkb2Vzbid0IGluc3RhbGwgaXRzIGNvcHkgb2YgZmxhdGJ1
ZmZlcnMgYW5kIHVzZXMKcHl0aG9uLWZsYXRidWZmZXJzIGluc3RlYWQuIFRoZSBidW1wIHRoZW4g
ZHJvcHMgdGhhdCBwYXRjaCBhZ2Fpbi4gUGF0Y2gKMi8zIGNoZXJyeS1waWNrcyBjbGVhbmx5IG9u
dG8gMjAyNS4wMi54LgoKSSB0ZXN0ZWQgaXQgb24gbWFzdGVyIGFuZCAyMDI1LjAyLnggKGJvb3Rs
aW4teDg2LTY0LW11c2wgYW5kCmJvb3RsaW4tYXJtdjctZ2xpYmMpOgoKLSB3aXRob3V0IHRoZSBw
YXRjaCwgcmVpbnN0YWxsaW5nIHB5dGhvbi16bG1kYiBvbiB0b3Agb2YKICBweXRob24tZmxhdGJ1
ZmZlcnMgcmVwcm9kdWNlcyB0aGUgRmlsZUV4aXN0c0Vycm9yIG9uIGJvdGggYnJhbmNoZXM7CiAg
d2l0aCB0aGUgcGF0Y2ggaXQgaW5zdGFsbHMgZmluZQotIHpsbWRiIHdvcmtzIHdpdGggcHl0aG9u
LWZsYXRidWZmZXJzIGZyb20gZWFjaCBicmFuY2ggKDI1LjkuMjMgb24KICBtYXN0ZXIsIDIuMC43
IG9uIDIwMjUuMDIueCk6IGFsbCB6bG1kYiBtb2R1bGVzIGltcG9ydCwgYW5kIGEKICBGbGF0QnVm
ZmVycyB0YWJsZSBzdXJ2aXZlcyBhbiBMTURCIHJvdW5kIHRyaXAgb24gdGhlIHRhcmdldCBQeXRo
b24KClllZ29yCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
