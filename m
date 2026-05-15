Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84462CD4F47
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:46:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C3DA845F2;
	Fri, 15 May 2026 17:46:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dIe8hkvBff6L; Fri, 15 May 2026 17:46:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9730384538
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778867195;
	bh=At44/jV55jK7PmQakc0FtZPG/aJe7qx8+0Q9qSkMxlY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=j8o+/lVtKNfEID9LetCASOlFnJapRJKGABDHfG12HNkZUojT3r9xcfGJOEuGX04+L
	 n7sr7pdI7fhIys0YhJbjX33pKBAAii2URbPJxnEWFa440x9F+iXB2T9/YrcRYrerXr
	 vOUOxdENcOX2bHKSjNHWMShLXogBNoc1HPmx/OaOIadHOWOqN6NECls5AMgJutYHh8
	 lG+EOExB7Fzg2cMIYgyWI4QsJpOw07TXIkZD48Gr1VKTI6x8OtybMKEUtLOd8OF2Tt
	 lVYl0F7tQIiAPMQh4+hR5vazQEl5ZPR/Q1OHgm1u4rRufgsJ7ADiOV51D1MbyA6Z5M
	 rDHwt0H+fvA3Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9730384538;
	Fri, 15 May 2026 17:46:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2821045B
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0EB7E40FA9
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5sJPcumABXex for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:46:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 06CCB4027F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06CCB4027F
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 06CCB4027F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:32 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-43d77f6092eso18842f8f.2
 for <buildroot@buildroot.org>; Fri, 15 May 2026 10:46:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778867191; x=1779471991;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rg1Tt9EiWwtn2OmWci1NivycDbQy7xApEFpixQ6bV7I=;
 b=p0MP+ecmcclB7VOhxxaJDkcIixGh7ci+41tYqAB+1YPXpABm3C9Nv8NyozYk5cSIUk
 J0eVZsurcTxhLaNUO/hJ9WzPEz731Mv5ukOS1ZFnKY3Jb614EQPVlFZTH1wBHnLM+w+8
 V2UNiiCyaZVC3BhHnvFutxvyEhDJtWoDWHZANbEsTbteplDOSCm3UqHoNUIlJAwW/IUq
 /+80YBpX92q0GDw5ocgFEjDvhhVySmFrgFkP6y9D3RZZz4JiaQBJv3+ZHJ9OwKbknpFV
 gVNR4jDbD8EYaIDcOQzQXZ5ckKL5AduD1gF+a7UwrDwoPuGchgcLovP7TSavBuzXJKQD
 ogug==
X-Forwarded-Encrypted: i=1;
 AFNElJ+sVwfMm0NQeR/Ze5YDtWgliNutCYaURtn7rJtDn/t2kSGEvvufxDNgSsMf6044rpLzIAdm0/JjPns=@buildroot.org
X-Gm-Message-State: AOJu0Yx1eVhOeDCRI5b0Qv4+G3Pvfe+wWgjloZvKto00ZAzHbmpDrWH7
 APmx6lckx/0nw3Bso06iBWCwgNZm7eGiHH2I7WBjLpA0lt+caBA04j2dN6XXXxtwxbBEU/UbILu
 ydC2+
X-Gm-Gg: Acq92OHKnxr41ieoEkByG/Ow+R5GLVIRuBDrhuVWX1KhQjOgxYUkteYHtjFIsfyFofl
 iK7B73UQ898mfZi6EewrSj8jVB9YgpzcRSH/B3nG/EmdAdI5xlKg5KtrImggs4Z+V/UFXmiDGf0
 GLP/XMb/Pss9+1VWlQqd2xI/6tr0vDbBZ77TlQQhxy2Q0tYf9fhxCJMBJEi/AYX9GJuPKLcuDnh
 iAa4tAjkFYNqoFJNprD1j5a9VtAxj8QgdFojeosZJExNOpF+8e04RARXDHSvk4l4ygXiJYchMgq
 owpgIZxiq2gtRrdWp9f9cLdyzY37MNmeUUTa7+Ac7eF7pumEHaom4QB2WNMeIB382HQM2bmBHho
 lJQrIlcdmmcaiPgdL+2iRpNQJzGRVGxdba+6yxjZnanJNCj/HkFP8WP/4T47Ht4bKTsilJxuWka
 hP70pXNVzCp8My0KqUnm00vRX6RM9U9MLuwWWrpM6CCUMfBK18l65rUcU=
X-Received: by 2002:a05:6000:2984:20b0:451:1143:7df5 with SMTP id
 ffacd0b85a97d-45e5c5f8d95mr5201678f8f.41.1778867191015; 
 Fri, 15 May 2026 10:46:31 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45d9ed2ffdfsm14429904f8f.15.2026.05.15.10.46.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 10:46:30 -0700 (PDT)
To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 15 May 2026 19:46:29 +0200
Message-ID: <20260515174630.529839-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260422-frr_service-v1-1-b9aa85034931@bootlin.com>
References: <20260422-frr_service-v1-1-b9aa85034931@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778867191; x=1779471991; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rg1Tt9EiWwtn2OmWci1NivycDbQy7xApEFpixQ6bV7I=;
 b=IBShdsWrYS/MupleGgIOb8Rvcrg2t/yw7oQr6KsyDe/ZcoSc365sdCYDVNJu4Clj47
 SXjQ1wxfGy0swTl3tos1vZCeiP5T701/YgWumwtvB71jPpEXrBAlAHgaWnP+DbHhec68
 qihJJlIDSyuJVAYQFH+IEcMkiCR/p/BPlJcINmo4Nc8Hu8bio5JOtmUxw0PYG7yRvg7q
 Pd4Fo+1gPnPFojsmE3aZnzWR3+P7s9iHWZ5EpTCq6b5PrwcJ5zu2opJzbAlTotq2k98V
 y+eZ1WwQI26/tznVMkQP27AtdBp6XuCtazscsZhRkBbAjYQWJadzoWtSWlK2Ag00wjC1
 ODpQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=IBShdsWr
Subject: Re: [Buildroot] [PATCH] package/frr: install systemd service files
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SW4gcmVwbHkgb2Y6Cj4gVGhlIEZSUiBwYWNrYWdlIGN1cnJlbnRseSBvbmx5IGluc3RhbGxzIHN5
c3RlbXYgc2VydmljZXMgZmlsZXMuIFRoZQo+IHVwc3RyZWFtIHBhY2thZ2UgYWxzbyBwcm92aWRl
cyBhIHN5c3RlbWQgc2VydmljZSBmaWxlIGFuZCBhIHNlcnZpY2UKPiB0ZW1wbGF0ZSBmaWxlLiBJ
bnN0YWxsIHRob3NlIHdoZW4gc3lzdGVtZCBpcyBzZWxlY3RlZCBhcyBhbiBpbml0Cj4gbWFuYWdl
ci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbGV4aXMgTG90aG9yw6kgPGFsZXhpcy5sb3Rob3JlQGJv
b3RsaW4uY29tPgoKQXBwbGllZCB0byAyMDI1LjAyLnggJiAyMDI2LjAyLnguIFRoYW5rcwoKPiAt
LS0KPiAgcGFja2FnZS9mcnIvZnJyLm1rIHwgNyArKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA3
IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9mcnIvZnJyLm1rIGIvcGFj
a2FnZS9mcnIvZnJyLm1rCj4gaW5kZXggNjFhMzRkZTRkMzZiLi5jNWExMmY2OTkyNDEgMTAwNjQ0
Cj4gLS0tIGEvcGFja2FnZS9mcnIvZnJyLm1rCj4gKysrIGIvcGFja2FnZS9mcnIvZnJyLm1rCj4g
QEAgLTEzMSw1ICsxMzEsMTIgQEAgZGVmaW5lIEZSUl9JTlNUQUxMX0lOSVRfU1lTVgo+ICAJCSQo
VEFSR0VUX0RJUikvZXRjL2luaXQuZC9TNTBmcnIKPiAgZW5kZWYKPiAgCj4gK2RlZmluZSBGUlJf
SU5TVEFMTF9JTklUX1NZU1RFTUQKPiArCSQoSU5TVEFMTCkgLUQgLW0gNjQ0ICQoQEQpL3Rvb2xz
L2Zyci5zZXJ2aWNlIFwKPiArCQkkKFRBUkdFVF9ESVIpL3Vzci9saWIvc3lzdGVtZC9zeXN0ZW0v
ZnJyLnNlcnZpY2UKPiArCSQoSU5TVEFMTCkgLUQgLW0gNjQ0ICQoQEQpL3Rvb2xzL2ZyckAuc2Vy
dmljZSBcCj4gKwkJJChUQVJHRVRfRElSKS91c3IvbGliL3N5c3RlbWQvc3lzdGVtL2ZyckAuc2Vy
dmljZQo+ICtlbmRlZgo+ICsKPiAgJChldmFsICQoYXV0b3Rvb2xzLXBhY2thZ2UpKQo+ICAkKGV2
YWwgJChob3N0LWF1dG90b29scy1wYWNrYWdlKSkKPiAKPiAtLS0KPiBiYXNlLWNvbW1pdDogZjZk
MTk2Nzk4ZDI3MTRhM2IwOTRkYmIyM2I0N2JlZmMxNjkyY2I0MAo+IGNoYW5nZS1pZDogMjAyNjA0
MjItZnJyX3NlcnZpY2UtOWQ5MjZhMjYyZjM2Cj4gCj4gQmVzdCByZWdhcmRzLAo+IC0tICAKPiBB
bGV4aXMgTG90aG9yw6kgPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPgo+IAo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxp
bmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
