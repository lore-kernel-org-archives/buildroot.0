Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D0D8CD6E7D
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:49:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 274E1825B9;
	Fri,  5 Jun 2026 12:49:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u7s_eymUitAZ; Fri,  5 Jun 2026 12:49:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FCD2825D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663777;
	bh=KP1pyX3M3m9AyvxRBX3v6yDALTxq3n5t20u5OPifaLw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=r2DaVMu7izlkamckgGIfRRVfC9NML9zyY2CPoPLcl0QMfP730DPA2B+hz7VqG9p5P
	 RMv9xqwyOoF/tvFLzdjE8BvuhfXXF7LsSSSZpqQfKmnqnq+VmpecBWrANeASw1Clgb
	 oC4FL3YIt+NA9IR5fV+ppRvA6QFpGG5HdxP0I+ujZswLv4mJ67cHTgvE/N5ayjqVVm
	 n1YyNOF9TdcSSimLtRKnUe+v0SCMVony71tGl5Jl7TPxQCwVL/NS+nL/PghaGupaAJ
	 e2H1isVFNgxuIy6l5nOXFc6O1Zp33y358c4nFldurSgZEGLdPgohm2g8xLQUOHCEGr
	 RU8k0aBS1qjng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FCD2825D3;
	Fri,  5 Jun 2026 12:49:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 909B9F4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8008641E95
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LJ46ahtfvfNe for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:49:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 04ABA41E89
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04ABA41E89
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 04ABA41E89
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:31 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-490bb83a3f6so16001135e9.0
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:49:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663770; x=1781268570;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LguWfBI3NFpAcGymOm+71Nv9XIiI89Zwc1KtZ+kBue8=;
 b=mOZvjnMd1hu94j95lORdiXorOv10VqrQxcQe54LD4dvmCmVJQAuVABwMC9GrJQJoTp
 RXI+UKSjA9e/gzDghu8/tSNCrNR2F2IqrzXAls4rpa7m+D3OpUZ0Q/W12URyFr0bvR5O
 SmChwtKS9wPyrqrEUf2xBjumWhVPGQif5HO7wXynE754I71Q52UrdSGrd06KaT1YZkDh
 t1H644K9niGzvh0GQzeV8R1CzI9SyuXtZUW4VbINe1KHMaiePJ388GgManl0vrvp2jOL
 v9aimKy4BlnMC4XGybjo+ZSAvBdz5un4guZP/LF216Q1Xst5JHT06yBgZjvkGUg/JGyD
 ic5g==
X-Forwarded-Encrypted: i=1;
 AFNElJ+P6gCPqRU8ybloPOaCIcjNBvXJstTHCf0bbKBnMJlklsbz1T8U2RCj1HqdeS3HPO3ol/rXyf2X1o8=@buildroot.org
X-Gm-Message-State: AOJu0Yx5XA7ormjNT9s4GUqiwxIyJWKz/MRW1om8I7seijAw3ABSujwf
 g9JEKqw+4NoAwt4AdiA5KMA0m8eWD/ys67aBVh2UB18p27TisXmerGfx5AsZT9qV+jI=
X-Gm-Gg: Acq92OHaM70fLriixltaEW34wC9s2D293Jyig0jHBuAtk4kAgCi1wYmks+p7bHoYzfq
 NJP5thvGi+Wc2xMjd+nLHE3yelmIRJrRd11iBPwWYt0b3Cedr+uxONEdHQt/G/WVvPhijX8YAl2
 4FFnpeo23IkPuk3jWaLPP3BKtRnYa3rFv5z4R4GZzNrLhP9sJ8m/34F5Eyxz93dZHM1VgbGqRk7
 k2jBrrfiubOAtogB7lhtUvyvMmRWFASYhhCLKMH+31p27hFFei2ldLjESwei+riFDqSTi4045B3
 9xMDUVIQ3JeTa7YMsTIGJLEax9OMt10AfZJvJpRqbhq/jWXkax2Fa1tLLPvRQHUF6EuspooCVqa
 SP5eq6p5IciYRRmOEFYtUDKRQYB2JfOpNQuRnxWFtd4yGL6LLB8ZWQdv0lEU+xxr5Wszfst+b7M
 +pA3PZ/quYaHqjSmMPn7GVRg9uuoURhjFvxjna
X-Received: by 2002:a05:600c:6096:b0:490:b115:e03f with SMTP id
 5b1f17b1804b1-490c25ba56cmr55015235e9.8.1780663769842; 
 Fri, 05 Jun 2026 05:49:29 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4602cda3651sm12825104f8f.32.2026.06.05.05.49.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:49:29 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:49:28 +0200
Message-ID: <20260605124929.271358-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260527210017.3567220-2-bernd@kuhls.net>
References: <20260527210017.3567220-2-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663770; x=1781268570; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LguWfBI3NFpAcGymOm+71Nv9XIiI89Zwc1KtZ+kBue8=;
 b=Dgb7QA75Kb/UROVACChb+Ani543HP8eW5eUyhA6TqWYuFa4uHsgBkJK6mhROH9UZel
 NI2XNOHILu9AW6oMPVlgQaXw1RlUK2DNvUsNmj9ogMU9tvlZfh+AlQXlP/c5xMYKXgEk
 9Zz6olhIqEqdKHbavb5sxBe73uZ2vOsm+geIwEP/bWivzVSpXy5IUdGKC9iAeQXtgyPi
 qcfGj+9bFyETYMrqWKOsEtGJoFt4cHzr5TPy3Rv7m4Acxg43V3HxmBppvE7NLfAeQ5GJ
 NTuCPx0zZbyWBuhfKmSeLKWemwgJXciToLbyDNp31jwASuHN+dgFldQJWhBml8+2JZX3
 L4ZQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Dgb7QA75
Subject: Re: [Buildroot] [PATCH 2/3] package/odhcp6c: needs gcc >= 10
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

SW4gcmVwbHkgb2Y6Cj4gRml4ZXMgYnVpbGQgZXJyb3JzIHNlZW4gd2l0aCBHaXRsYWIgcGlwZWxp
bmUgYW5kIHRoaXMgZGVmY29uZmlnOgo+IHN1cHBvcnQvY29uZmlnLWZyYWdtZW50cy9hdXRvYnVp
bGQvYm9vdGxpbi1hYXJjaDY0LWdsaWJjLW9sZC5jb25maWcKPiAKPiBodHRwczovL2dpdGxhYi5j
b20vYmt1aGxzL2J1aWxkcm9vdC8tL2pvYnMvMTQ1NzAwODA0NTUKPiAKPiBhYXJjaDY0LWxpbnV4
LWdjYy5icl9yZWFsOiBlcnJvcjogdW5yZWNvZ25pemVkIGNvbW1hbmQgbGluZSBvcHRpb24KPiAg
4oCYLVdpbXBsaWNpdC1mYWxsdGhyb3VnaD014oCZOyBkaWQgeW91IG1lYW4g4oCYLVduby1mYWxs
dGhyb3VnaOKAmT8KPiBhYXJjaDY0LWxpbnV4LWdjYy5icl9yZWFsOiBlcnJvcjogdW5yZWNvZ25p
emVkIGNvbW1hbmQgbGluZSBvcHRpb24KPiAg4oCYLVdzaGFkb3c9bG9jYWzigJk7IGRpZCB5b3Ug
bWVhbiDigJgtV3NoYWRvdy1pdmFy4oCZPwo+IAo+IFJlbW92aW5nIGFsbCB0aGUgdW5yZWNvZ25p
emVkIGNvbW1hbmQgbGluZSBvcHRpb25zIGZyb20gQ01ha2VMaXN0cy50eHQKPiBzaG93ZWQgbW9y
ZSBidWlsZCBlcnJvcnMgZHVyaW5nIGNvbXBpbGU6Cj4gCj4gb3V0cHV0L2J1aWxkL29kaGNwNmMt
MjQ0ODViYjRiMzVhYjg0YzE3YzJlODdiZDU2MWQwMjZkNGMxNWMwMC9zcmMvb2RoY3A2Yy5oOjQ3
OjQ2Ogo+ICBlcnJvcjogZXhwZWN0ZWQg4oCYKeKAmSBiZWZvcmUg4oCYX19WQV9PUFRfX+KAmQo+
ICAjZGVmaW5lIGVycm9yKGZtdCwgLi4uKSBfX2lmbG9nKExPR19FUlIsIGZtdCBfX1ZBX09QVF9f
KCwgKSBfX1ZBX0FSR1NfXykKPiAKPiBBbm90aGVyIHBpcGVsaW5lIHdpdGggZ2NjIDkgc2hvd2Vk
IG90aGVyIGVycm9yczoKPiBodHRwczovL2dpdGxhYi5jb20vYmt1aGxzL2J1aWxkcm9vdC8tL2pv
YnMvMTQ1NzAwODA0NzkKPiAKPiAvYnVpbGRzL2JrdWhscy9idWlsZHJvb3QvYnItdGVzdC1wa2cv
YnItYXJtLWJhc2ljL2J1aWxkL29kaGNwNmMtMjQ0ODViYjRiMzVhYjg0YzE3YzJlODdiZDU2MWQw
MjZkNGMxNWMwMC9zcmMvZGhjcHY2LmM6MTEyNjo0Ogo+ICBlcnJvcjogYSBsYWJlbCBjYW4gb25s
eSBiZSBwYXJ0IG9mIGEgc3RhdGVtZW50IGFuZCBhIGRlY2xhcmF0aW9uIGlzIG5vdCBhIHN0YXRl
bWVudAo+ICAxMTI2IHwgICAgc3RydWN0IGRoY3B2Nl9hdXRoICpyID0gKHZvaWQqKSZvZGF0YVst
REhDUFY2X09QVF9IRFJfU0laRV07Cj4gCj4gc28gd2UgcmFpc2UgdGhlIG1pbmltdW0gZ2NjIHZl
cnNpb24gdG8gMTAuCj4gCj4gU2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxz
Lm5ldD4KCkFwcGxpZWQgdG8gMjAyNi4wMi54LiBUaGFua3MKCj4gLS0tCj4gU2VyaWVzIHBhc3Nl
ZCBHaXRsYWIgcGlwZWxpbmU6Cj4gaHR0cHM6Ly9naXRsYWIuY29tL2JrdWhscy9idWlsZHJvb3Qv
LS9waXBlbGluZXMvMjU1NzIyMzU1MQo+IAo+ICBwYWNrYWdlL29kaGNwNmMvQ29uZmlnLmluIHwg
NSArKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL29kaGNwNmMvQ29uZmlnLmluIGIvcGFja2FnZS9v
ZGhjcDZjL0NvbmZpZy5pbgo+IGluZGV4IDgzYjM4NzU1YzMuLjBhY2FmZjdmZWQgMTAwNjQ0Cj4g
LS0tIGEvcGFja2FnZS9vZGhjcDZjL0NvbmZpZy5pbgo+ICsrKyBiL3BhY2thZ2Uvb2RoY3A2Yy9D
b25maWcuaW4KPiBAQCAtMiw2ICsyLDcgQEAgY29uZmlnIEJSMl9QQUNLQUdFX09ESENQNkMKPiAg
CWJvb2wgIm9kaGNwNmMiCj4gIAlkZXBlbmRzIG9uIEJSMl9VU0VfTU1VICMgZm9yaygpCj4gIAlk
ZXBlbmRzIG9uICFCUjJfU1RBVElDX0xJQlMgIyBsaWJ1Ym94Cj4gKwlkZXBlbmRzIG9uIEJSMl9U
T09MQ0hBSU5fR0NDX0FUX0xFQVNUXzEwCj4gIAlkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fSEFT
X1NZTkNfNCAjIGxpYnVib3ggLT4ganNvbi1jCj4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfTElCVUJP
WAo+ICAJaGVscAo+IEBAIC0xMCw3ICsxMSw3IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9PREhDUDZD
Cj4gIAo+ICAJICBodHRwczovL2dpdC5vcGVud3J0Lm9yZy9wcm9qZWN0L29kaGNwNmMuZ2l0Cj4g
IAo+IC1jb21tZW50ICJvZGhjcDZjIG5lZWRzIGEgdG9vbGNoYWluIHcvIGR5bmFtaWMgbGlicmFy
eSIKPiArY29tbWVudCAib2RoY3A2YyBuZWVkcyBhIHRvb2xjaGFpbiB3LyBkeW5hbWljIGxpYnJh
cnksIGdjYyA+PSAxMCIKPiAgCWRlcGVuZHMgb24gQlIyX1VTRV9NTVUKPiAtCWRlcGVuZHMgb24g
QlIyX1NUQVRJQ19MSUJTCj4gKwlkZXBlbmRzIG9uIEJSMl9TVEFUSUNfTElCUyB8fCAhQlIyX1RP
T0xDSEFJTl9HQ0NfQVRfTEVBU1RfMTAKPiAgCWRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9IQVNf
U1lOQ180Cj4gLS0gCj4gMi40Ny4zCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
