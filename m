Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FFF0C61DBE
	for <buildroot@archiver.kernel.org>; Thu, 27 Aug 2026 00:44:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 514B480B40;
	Thu, 27 Aug 2026 00:44:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9kFBJNJGdBAx; Thu, 27 Aug 2026 00:44:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787791443;
	bh=67CAzXRtyhpUVHCoFavftrUSFm5VHhxzMA/tIz83CHs=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XEQ8AgOCBZ0lTJ3zoy4jpXdddYBSoZOq+UHhKVCsSBLfg6kaH4f8FH0bhxhILKto2
	 l5AUXRlwGWaNqyI0h9OOJa2Qh0TD7+fnyWVMQoVBuW+vYdCFUEK6BrujNM2FB/kcC5
	 M1po/IQxFFZ5vrTaVPLnOEs3MBPCTNolbBNIuYdLdw8tRoDJV+FGd+WhUnPgClVST8
	 WocbCRNZI3on7u1at0eDD10WM/CrLx2uxNhni7rwZiXZoo2xWIqtmguZWz49jb/7vn
	 3KH9vHL+EuIMiEJ9sD+/Kfxe3KTUwWHQMuulIIKuOxO9+tDbr8/2TGy0oJupobHcMO
	 KpzdNAMV1UM4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E547180B32;
	Thu, 27 Aug 2026 00:44:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C1478323
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 00:44:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B35D4404FF
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 00:44:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s7y2M009gHbl for <buildroot@buildroot.org>;
 Thu, 27 Aug 2026 00:44:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com;
 envelope-from=matthew.l.weber@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=sMiEC5zh
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8E91C404F4
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 00:44:00 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-5aeb98460c6so1759888e87.2
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 17:43:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787791438; cv=none;
 d=google.com; s=arc-20260327;
 b=GTuJmM5qX8Fmj7NgpzdE/rNsalS7LwBhj+aMrLq1b1XzSeXGJe0f7Xw6oTRR59asYP
 EtXWsrHpMvHDmrrFQP/Tj10ADrIl2f44b6sE3OzJBCyT88/3Pgq6xoW5+Mo94IfgAHbY
 JXrWfrZP2qWvjVjYAjLa5TGb7hcHor3Wfkzrz+HrsAPyaZzv2iZ18SaKlwimit1n6oDO
 WC8ZpmbTcfD8LHfqS+yeaNvQwW7rdUnUtsRnIuCM17XMOloSeYQQILBgBkM6ASq/uLwt
 qh9bTpYQq0OExWxSDDDGSDcddLU16R8pPzvRFRQ6UDnMANNiYow7RTnML0jLsZOKJ8Sw
 LAJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Y3yu6fm9oX5xdDWK1O8bSPfsTygAL/VOH1zDIIkq9/4=;
 fh=TmTPd3TVu0DPAQparzsGIaWjf/SmOw47ooWdqoUhJ5k=;
 b=EQ3swsGwROktPS+iENiM9bM2CLSiIbGkFzeQ7YDPe/ztUvfiW1n4+3z+NeX2h8+uLl
 LApQtDWPvT+yOY8KVrAmvGS8jc3c44HfEmaaXbtnApE/K8ouNaDvN4hY/xBfjO/NOmmp
 MbcZGtw0qI2dtiG7IABFs2e9lW+Tv4fsteTeuBctX3Oc+ku1pAcgRHdmln3gTruJtAZh
 frhkk2CKKMByvEJErqcPNIyKCJXm6J7b6SOJ5m052x6aH2WmIytvHiaPc4jHZG/HWXQj
 FN/07D8yFTB/fUG+fvUaqe10b3OSHKttHCbVuCVk58ftAG2eeqleY/55c4GgZZQ2LSNu
 qDoQ==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787791438; x=1788396238; darn=buildroot.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Y3yu6fm9oX5xdDWK1O8bSPfsTygAL/VOH1zDIIkq9/4=;
 b=sMiEC5zhZObyOOdKQKCDx5B+iySYrF5KV5SeyGiBmiigdoPwgbX2L4FoRbV7m60oKw
 mLRbm2Rj+/8IDoJ+bIMGK+H01Hmb0oQ2FJpxzU2YTvswoRcStDu+8HD6EnyQGv1/xTg5
 oKZW6eJQUPHPqZkWjo0WkQT8UR49Ttt5Go4E2FUzeq6uMdaLUn1TmdHq8B8hZxH6peVT
 0g92t1Z6i9bgvwemKIGQnKrJYmx+nGWXCeoom2hZbo+yyy3ckPOHPWDauAHacxZybPz2
 X984ZJvb2xAgJRArCKcaK2IfYxw37UPaQFe35leWZ95++s1QJ0R2rJsf8xv1jECyKkpt
 tdNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787791438; x=1788396238;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Y3yu6fm9oX5xdDWK1O8bSPfsTygAL/VOH1zDIIkq9/4=;
 b=faVbPH7PsaShHTjPlJVv4aLi0aDKgaMwdphcWJTL87Z9cgIbDo7eJajIiXnMu75Q/+
 fDQ1bDkF2NozORKJUuZZ7uMn994VYRfl9CfPFdJSJwZhuLqtKv/oPOrv0+yUKBSgqe7b
 iT1A4yelWq4UAYx0nTTFzBQH/Vs2CJHI8vDypFMhEx7eOL2skBJOWtUnwyz9PuJzWm/j
 P6SWVoNT8mn5eAZAnYVtMy6XVqQ8cZ3VpzawM6Br0CgA1NQBel78wbyYt4BMq9nw/BdU
 86FdvMfNtQ6Gu3PlJsdn7A9BaAPD4VBAuzt8VmWq9N6E8EDK67RYyE1swxGhoru5Yemn
 Lxdw==
X-Gm-Message-State: AFuF++kFJGnXDDGFyDO5Vk+7nnQF43+RNmh6KwylFRAABYbFL7T7H1DQ
 2EWj/UAuRgf02cY7CLjiknRqSYM2rZG8fSpJi0ImG8J6eyIo5imnQ3AUyJ1I8CX20DoAbt71bYn
 eXCH3TfXjb9FjakAArbvy4CXvd2zS6Vw=
X-Gm-Gg: AR+sD12StrqKCzy5xM8GIkSmgEQAYGA+/BoE0xrjXhNUKbmeceJIj/+/dojsANRwdXM
 L4KRtruM39waV3SgRRt8dW6F6ejCgjwGoPCoCCS/vX5OpL3LwB1/aVcp5wvFPJwd0LYlK9deZAM
 YSAM/FLrBkpZGZVhe5DQ21VDHgz24Y/uq5EFRiPi2qd/n5Nn46KX3p27kT+vGqaGjmupHZMou/N
 eMg2WjixSD0oNQvI/zXViP7tz5KBk/gA9QkszCcuNFKAD9mP0D6N3czietB4UrAFiILn0v7oGp+
 AwEHX4T56KjSqJnLeQSwfALkwHT5pbFH+UC1EXs5wZhdXA==
X-Received: by 2002:a05:6512:6089:b0:5ae:ba7a:1789 with SMTP id
 2adb3069b0e04-5b4a9089d16mr3250778e87.13.1787791437530; Wed, 26 Aug 2026
 17:43:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260826064649.292291-1-neal.frager@amd.com>
In-Reply-To: <20260826064649.292291-1-neal.frager@amd.com>
From: Matthew Weber <matthew.l.weber@gmail.com>
Date: Wed, 26 Aug 2026 19:43:45 -0500
X-Gm-Features: AcwNN1Wdkv3ljaL8vTrOs7ALnT9aN77Ku6HnrzQ1kgXra6WNibkfl_k1ADLIOB0
Message-ID: <CAFt09wPmnt_Vgr_GsqbAAWHcb=n0ADu8spR_JEvNK_aSFYdLSQ@mail.gmail.com>
To: Neal Frager <neal.frager@amd.com>
Cc: buildroot@buildroot.org, alistair@alistair23.me, 
 stefano.stabellini@amd.com, ibai.erkiaga-elorza@amd.com, 
 luca.ceresoli@bootlin.com, micheal.saleab@amd.com, yann.morin@orange.com, 
 matthew.l.weber3@boeing.com, brandon.maier@collins.com, john.ernberg@actia.se, 
 brian.j.wood2@boeing.com, ju.o@free.fr, stewart.hildebrand@amd.com, 
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com, 
 romain.naour@gmail.com
Subject: Re: [Buildroot] [PATCH v5 1/4] package/xen: fix build error when
 BR2_PACKAGE_XEN_TOOLS not enabled
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

TmVhbCwKCk9uIFdlZCwgQXVnIDI2LCAyMDI2IGF0IDE6NDfigK9BTSBOZWFsIEZyYWdlciB2aWEg
YnVpbGRyb290CjxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6Cj4KPiBUaGUgMDAwMi1V
cGRhdGUtbGlua2VyLWZsYWdzLnBhdGNoIGFzc3VtZXMgdGhhdCB0aGUgcWVtdS14ZW4gZmlsZXMg
YXJlIGluY2x1ZGVkCj4gaW4gdGhlIHhlbiBzb3VyY2UgdHJlZS4gSG93ZXZlciwgaWYgQlIyX1BB
Q0tBR0VfWEVOX1RPT0xTIGlzIG5vdCBlbmFibGVkLCB0aGUKPiBxZW11LXhlbiBkZXBlbmRlbmN5
IHdpbGwgbm90IGJlIGhhbmRsZWQgYW5kIHRoZSBwYXRjaCB3aWxsIGZhaWwgdG8gYXBwbHkgd2l0
aAo+IHRoZSBmb2xsb3dpbmcgZXJyb3IuCj4KPiBGaXhlczogYnVpbGQgZXJyb3IgYmVsb3cKPiBB
cHBseWluZyAwMDAyLVVwZGF0ZS1saW5rZXItZmxhZ3MucGF0Y2ggdXNpbmcgcGF0Y2g6Cj4gcGF0
Y2hpbmcgZmlsZSB0b29scy9NYWtlZmlsZQo+IEh1bmsgIzEgc3VjY2VlZGVkIGF0IDM2IChvZmZz
ZXQgLTEgbGluZXMpLgo+IEh1bmsgIzIgc3VjY2VlZGVkIGF0IDE4NSAob2Zmc2V0IC04IGxpbmVz
KS4KPiBjYW4ndCBmaW5kIGZpbGUgdG8gcGF0Y2ggYXQgaW5wdXQgbGluZSA3Ngo+IFBlcmhhcHMg
eW91IHVzZWQgdGhlIHdyb25nIC1wIG9yIC0tc3RyaXAgb3B0aW9uPwoKUmFuIHRocm91Z2ggdGhl
c2Ugc2VxdWVuY2VzICh0ZXN0IDEgY292ZXJlZCB0aGlzIHBhdGNoLCBtYWtlICB4ZW4tcGF0Y2gp
Cmh0dHBzOi8vZ2lzdC5naXRodWIuY29tL21hdHRoZXctbC13ZWJlci8yMzEwMTQ5MGE2ZTk1YThi
MGY0NDVlMTRlYzIyZDlkNQoKVGVzdGVkLWJ5OiBNYXR0IFdlYmVyIDxtYXR0QHRoZXdlYmVycy53
cz4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
