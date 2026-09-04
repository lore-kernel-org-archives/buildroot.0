Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51E11C79F85
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 12:18:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25D8E60C11;
	Fri,  4 Sep 2026 12:18:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BLpWomUrObMp; Fri,  4 Sep 2026 12:18:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 07A4160BE7
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788524307;
	b=fKNWGQ8spi3DHyY5edm8MG6wqS1zzt8Bnt2l1HvhA9yXmWLlwhsuKW/kkZ0wrim9Dc4S
	 T8W4wnfOFDIYbyIuCCvpidkFY9ONix99pSsvTpiOA68mZxiWONlVwUs5F1P73ta4owmbd
	 HaIm6H4AOYXe4zwmWbV18dKv+16gtq11qWWmqsbFPM1Myw+5fubOzAWOZwf3IaNvnClMO
	 gvzvadx0y4mqG4/wB5rMTh9Okg+LRJtW7rW8vN4Alhu6m9pQE4DXEJGGDTpQ934W1I9Te
	 UDMCdTUZbs01fzBzw2xUOSjZZHUrJaf/SoNRI+T1vJjsXcYqlqH2bcVVgErj9zjgebA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788524307;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=28P+K9sUr1PZXil8VKzExUWOiabsVDUG+9R4AehCwxQ=;
	b=SLwkZGQl5ZobJruhP3qHD9B73bJBrf8XPqCGmfz1fYCaSZiAUeoYl1Hrwuucc4R9s1iP
	 nFifWLw/DapLrB0KNP/SdUJhf/FO9a9Q6wGSsnR2e90OxY0BcY7X67oug7YRo4SLu29Uw
	 PRVEyX4Rfc2ZMkVCQ8ljV/SVPPsiV6UPSsymXZM/trBsDrdYFuIvVDoz+PiuQIvchGqqe
	 N96K9uEAPnR6/5orFly4IkAsgNV/k+NWVtG/R7MMEKyhmyFBrpXsIce+XO00ToGJ5GspZ
	 HOV/fNIsFmSHhfBXhYKzhGyc+INefad4oVMtzecr4Ic7L/7hIzk79mMhGEkTJ2ijPcg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788524307;
	bh=28P+K9sUr1PZXil8VKzExUWOiabsVDUG+9R4AehCwxQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=K2CxxVu1SLg0fHHvFQ2bnNLKEEIm+XMLM0stpt3oFy+XNdfiIYJxz+xOKThm+xiZH
	 OAr0KzTditgQL3VHBOBnBihgeUA5EjdzUY+hngAJL8MSULNujRZtJ0FmUYbW5AAcU9
	 MkgMGmzNaX1eFNW9slfvaPmv6IjsKnA1zqhEn49IHASUxqXwlzNEZNn+PMN6hrd6S1
	 e7ULpfINBQxX+V41TBwO2pq/5WeqiWFikKeFKttnVu9UsTqDeTwstiizxbWxMCyEwi
	 bdyF2TDuRR/1stAmQaG77h8KVISJiD5KWrSx0ztH9J07rVBX3YP+ONtXxFLABlbCfb
	 alCK24gNQT5xQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07A4160BE7;
	Fri,  4 Sep 2026 12:18:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 84ADB200E
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:18:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6B5F640376
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:18:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YIhqWtynWhTE for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 12:18:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 3E02440080
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788524304;
 b=YNVgD+Jj20d35iO/dLeCVN6TDwlBBPxnQ6nvQc1mk5nrSG9okMxwZW3OmYd+el1HyeoV
 MkErnDTn5tTAo2SJkExLh71rsQwpUVVpZU7+i7MDcnQzhXj2lZ1o7/Z0r0r9+8iSzRc5D
 gJNZf7TZUxPSmq0NXqQP9hq1aGyTBEbLz+iPEZE4ElvfBkGagYMuX1j31ZUta5QkCXvyp
 UeHFSG3P+GpMjgyNc99DZR/kkhWzWKec4ivzCTPJrlt0XYQLHXhC0cVxb2IVAM9M3RcXU
 DWgI0kFXTZJkNhBcqTYXvfeJzAyzneNuld7Jm8JDBj28Nc2ouwDmaFAEOulZoxbxuNg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788524304;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=VQ75PORlYSJfJKa0FLUoSroactE21UzScuTX+XtT8MQ=;
 b=FHPGB+djubJQAwf1/NfLNNlFX8H3uvoX+rrPXhvXMeY3iWeRCiU0wbyMyRKjpmIVLVpZ
 vL7TdHeT6jkVlNZbL4CPhgewgWPg3V3YX1gJwRIVzkX//VW+FsaeSdyITAnxwAb4H6F5o
 1+/e4Vzkb+JrpL0oEhFn8noAQagc9HUDRGWzIeaarBkPNM5i8XS1cmckfSoEJhhqZRZq5
 meEh7Frp3SMfBRmMEJsGBRw9aR14+mipqoulwsgRTcmPaqR7OmNi5BjbCJp04WN+8xrpJ
 6eHRIXmK1DNN9zpgifUc+m1KZwi4pNK8v76k/RKAkAh5eRl8o6eOpACkrdKV1O4/9GA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=KBAQbssY; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3E02440080
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:18:23 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-485843aeab8so996726f8f.1
 for <buildroot@buildroot.org>; Fri, 04 Sep 2026 05:18:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788524302; x=1789129102;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=VQ75PORlYSJfJKa0FLUoSroactE21UzScuTX+XtT8MQ=;
 b=XtVwT5KwuH6WbxmyDLbk7XTiJiE+nRcfLsb48B60B8YZBZm6Vfs+XFSfTAMn07RJ83
 vxaFNJmMqE8Kgzj94+OH0zs2hxEfvjsNL15aEuBw1mUMDXmr5JxllujkzDKNyWwgyeaK
 aQ2UjClGzOw929F9DMmKJQFBVE/qdpbhSFxDV67Iebw/9dqCA5208EN9gnXmeNB7ud0M
 85zopgI5/un82jxvljriKBbudokOp9x82BDXrlQvHYhOxn7bPYKOZ1/6wcDsmZMqr6v8
 Pl7qzQnZ7/alPW9bhRM4uwk6mu57eVo2BrDANYUFkR9D+hnTgb7PKUQYvWomUE9n3iLP
 xBlw==
X-Forwarded-Encrypted: i=1;
 AKwUvBy5zTa9JSMqpHNt4X1ddgecVgCWGVdDKEcH+mkTNvdjkEbnc26Db1LV7JMM17EdRWCAKfTgPJoc2o4=@buildroot.org
X-Gm-Message-State: AFuF++lSJDB/I9GKKDa//q43eOV+Sok2ihEfYH7tZFZph+ibY/yGJBUn
 bpmDbYs8FucYmCv7VF6CjoEydbry2DJlAurDyW+QHEAiPdHXWBiNKYmnCx5GOwf+PfWIwjPHovY
 L39fs
X-Gm-Gg: AYBFou3RUjHtKv4Bq8a2TM77mstl4B+I+4uOFFN2LZHFoC3fFe0hDoLT5yL0sJGsfw9
 krOwoM7KnJdJSCz6dOJFxbeoE1R8DN6ncTqI28Kk8OCe6JrTzKu+UzaTA5HxHCsxlCCk0DBZwkG
 4PCPFERKwEjp4G6+ch38NtFG/m0SQJoaJxvv0DBJstS74iVAXyX05Md18rFdF/r0CMzcKg6f5UJ
 kE2AZfik1jybSq2yS1Ug4b2aY/I51P7ZkZYH3Nvvo4/XU2aWtoLzGSMdtLd082bah8pmgHT2KEF
 IP+QPGDeb+q4VbGn4/7SpN25X4YrnPLVhc+ULgjERs0f0riYxdt60bN1TATki8Bsd9MQUUNodcQ
 N3op1gXWF0MgnFHSYq6zz6sdCxSLFrWFJXDGR3mYl3qkU7aNSytgGyTFhHn1SW916uxsdj21KNG
 LkqYBuwGX08/GVI38091PBtU9jQIfs3r6UUNH7IjuaxREP9ZZC4vtHCQ==
X-Received: by 2002:a05:6000:2388:b0:47f:9283:1fbe with SMTP id
 ffacd0b85a97d-48586bf25b8mr11611457f8f.0.1788524297263; 
 Fri, 04 Sep 2026 05:18:17 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485883acd33sm5919589f8f.18.2026.09.04.05.18.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 05:18:17 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Sep 2026 14:18:01 +0200
Message-ID: <20260904121816.404574-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260724164829.304335-2-bernd@kuhls.net>
References: <20260724164829.304335-2-bernd@kuhls.net>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH/RFC 2/3] package/taglib: needs gcc >= 7
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

SW4gcmVwbHkgb2Y6Cj4gRml4ZXMgYSBidWlsZCBlcnJvciBjYXVnaHQgYnkgdGhlIEdpdGxhYiBw
aXBlbGluZXM6Cj4gCj4gL2J1aWxkcy9ia3VobHMvYnVpbGRyb290L2JyLXRlc3QtcGtnL2Jvb3Rs
aW4tYWFyY2g2NC1nbGliYy1vbGQvYnVpbGQvdGFnbGliLTIuMy90YWdsaWIvbXBlZy9tcGVnZmls
ZS5jcHA6MTEzOjEwOgo+ICBlcnJvcjogZXhwZWN0ZWQgcHJpbWFyeS1leHByZXNzaW9uIGJlZm9y
ZSDigJhjb25zdOKAmQo+ICAgICAgICBpZihjb25zdCBIZWFkZXIgaGVhZGVyKCZmaWxlLCBoZWFk
ZXJPZmZzZXQgKyBpLCB0cnVlKTsgaGVhZGVyLmlzVmFsaWQoKSkgewo+IAo+IHdoaWNoIHdhcyBp
bnRyb2R1Y2VkIGJ5IGNvZGUgZm9ybWF0IGNoYW5nZXMgaW4gdXBzdHJlYW0gY29tbWl0Cj4gaHR0
cHM6Ly9naXRodWIuY29tL3RhZ2xpYi90YWdsaWIvY29tbWl0L2RmZTJhYTUyNTMyZmM5ZjczYTY3
NDk5ZGQxN2ZiNTI3YTg1NmEyMmYKPiAKPiB3aGljaCB3YXMgZmlyc3QgcmVsZWFzZWQgd2l0aCB0
YWdsaWIgMi4wLCBhZGRlZCB0byBidWlsZHJvb3Qgd2l0aCBjb21taXQKPiA5Y2QzNDY0YWZhMTNm
ZDAxOTBmYjNlOTRmZDg1MGNjODA2M2NmMjk3Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEJlcm5kIEt1
aGxzIDxiZXJuZEBrdWhscy5uZXQ+CgpBcHBsaWVkIHRvIDIwMjUuMDIueCAmIDIwMjYuMDUueC4g
VGhhbmtzCgo+IC0tLQo+IEkgaGF2ZSBubyBpZGVhIGlmIHRoaXMgcGF0Y2ggaXMgY29ycmVjdCwg
YXQgbGVhc3QgYmxvY2tpbmcgZ2NjIDYgbWFrZXMKPiB0aGUgR2l0bGFiIHBpcGVsaW5lcyBoYXBw
eS4gSXQgc2VlbXMgdG8gbWUgdGhhdCB0aGUgdXBzdHJlYW0gY29tbWl0IHVzZXMKPiBuZXdlciBs
YW5ndWFnZSBmZWF0dXJlcyBub3Qgc3VwcG9ydGVkIGJ5IGdjYyA2LCBidXQgd2l0aCBteSBsaW1p
dGVkCj4ga25vd2xlZGdlIGFib3V0IEMrKyBJIGNvdWxkIG5vdCBmaW5kIGV2aWRlbmNlIHRvIHN1
cHBvcnQgbXkgdGhlb3J5Lgo+IAo+ICBwYWNrYWdlL2dzdHJlYW1lcjEvZ3N0MS1wbHVnaW5zLWdv
b2QvQ29uZmlnLmluIHwgNiArKysrLS0KPiAgcGFja2FnZS90YWdsaWIvQ29uZmlnLmluICAgICAg
ICAgICAgICAgICAgICAgICB8IDYgKysrKy0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRp
b25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2dzdHJlYW1l
cjEvZ3N0MS1wbHVnaW5zLWdvb2QvQ29uZmlnLmluIGIvcGFja2FnZS9nc3RyZWFtZXIxL2dzdDEt
cGx1Z2lucy1nb29kL0NvbmZpZy5pbgo+IGluZGV4IDZhNzM4ZmFhMDAuLmM0ZWI0ZWZiNjUgMTAw
NjQ0Cj4gLS0tIGEvcGFja2FnZS9nc3RyZWFtZXIxL2dzdDEtcGx1Z2lucy1nb29kL0NvbmZpZy5p
bgo+ICsrKyBiL3BhY2thZ2UvZ3N0cmVhbWVyMS9nc3QxLXBsdWdpbnMtZ29vZC9Db25maWcuaW4K
PiBAQCAtNDAzLDEzICs0MDMsMTUgQEAgY29uZmlnIEJSMl9QQUNLQUdFX0dTVDFfUExVR0lOU19H
T09EX1BMVUdJTl9TUEVFWAo+ICBjb25maWcgQlIyX1BBQ0tBR0VfR1NUMV9QTFVHSU5TX0dPT0Rf
UExVR0lOX1RBR0xJQgo+ICAJYm9vbCAidGFnbGliIgo+ICAJZGVwZW5kcyBvbiBCUjJfSU5TVEFM
TF9MSUJTVERDUFAKPiArCWRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9HQ0NfQVRfTEVBU1RfNyAj
IEMrKzE3Cj4gIAlkZXBlbmRzIG9uIEJSMl9VU0VfV0NIQVIKPiAgCXNlbGVjdCBCUjJfUEFDS0FH
RV9UQUdMSUIKPiAgCWhlbHAKPiAgCSAgVGFnbGliIHRhZ2dpbmcgcGx1Z2luIGxpYnJhcnkKPiAg
Cj4gLWNvbW1lbnQgInRhZ2xpYiBuZWVkcyBhIHRvb2xjaGFpbiB3LyBDKyssIHdjaGFyIgo+IC0J
ZGVwZW5kcyBvbiAhQlIyX0lOU1RBTExfTElCU1REQ1BQIHx8ICFCUjJfVVNFX1dDSEFSCj4gK2Nv
bW1lbnQgInRhZ2xpYiBuZWVkcyBhIHRvb2xjaGFpbiB3LyBDKyssIHdjaGFyLCBnY2MgPj0gNyIK
PiArCWRlcGVuZHMgb24gIUJSMl9JTlNUQUxMX0xJQlNURENQUCB8fCAhQlIyX1VTRV9XQ0hBUiBc
Cj4gKwkJfHwgIUJSMl9UT09MQ0hBSU5fR0NDX0FUX0xFQVNUXzcKPiAgCj4gIGNvbmZpZyBCUjJf
UEFDS0FHRV9HU1QxX1BMVUdJTlNfR09PRF9QTFVHSU5fVFdPTEFNRQo+ICAJYm9vbCAidHdvbGFt
ZSIKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS90YWdsaWIvQ29uZmlnLmluIGIvcGFja2FnZS90YWds
aWIvQ29uZmlnLmluCj4gaW5kZXggNWI2NDFhOTY1My4uOWE0M2M4MmE1ZSAxMDA2NDQKPiAtLS0g
YS9wYWNrYWdlL3RhZ2xpYi9Db25maWcuaW4KPiArKysgYi9wYWNrYWdlL3RhZ2xpYi9Db25maWcu
aW4KPiBAQCAtMSw2ICsxLDcgQEAKPiAgY29uZmlnIEJSMl9QQUNLQUdFX1RBR0xJQgo+ICAJYm9v
bCAidGFnbGliIgo+ICAJZGVwZW5kcyBvbiBCUjJfSU5TVEFMTF9MSUJTVERDUFAKPiArCWRlcGVu
ZHMgb24gQlIyX1RPT0xDSEFJTl9HQ0NfQVRfTEVBU1RfNyAjIEMrKzE3Cj4gIAlkZXBlbmRzIG9u
IEJSMl9VU0VfV0NIQVIKPiAgCXNlbGVjdCBCUjJfUEFDS0FHRV9VVEZDUFAKPiAgCWhlbHAKPiBA
QCAtMTIsNSArMTMsNiBAQCBjb25maWcgQlIyX1BBQ0tBR0VfVEFHTElCCj4gIAo+ICAJICBodHRw
Oi8vdGFnbGliLm9yZy8KPiAgCj4gLWNvbW1lbnQgInRhZ2xpYiBuZWVkcyBhIHRvb2xjaGFpbiB3
LyBDKyssIHdjaGFyIgo+IC0JZGVwZW5kcyBvbiAhQlIyX0lOU1RBTExfTElCU1REQ1BQIHx8ICFC
UjJfVVNFX1dDSEFSCj4gK2NvbW1lbnQgInRhZ2xpYiBuZWVkcyBhIHRvb2xjaGFpbiB3LyBDKyss
IHdjaGFyLCBnY2MgPj0gNyIKPiArCWRlcGVuZHMgb24gIUJSMl9JTlNUQUxMX0xJQlNURENQUCB8
fCAhQlIyX1VTRV9XQ0hBUiBcCj4gKwkJfHwgIUJSMl9UT09MQ0hBSU5fR0NDX0FUX0xFQVNUXzcK
PiAtLSAKPiAyLjQ3LjMKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
