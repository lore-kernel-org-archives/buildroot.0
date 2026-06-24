Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1F77CDB481
	for <buildroot@archiver.kernel.org>; Wed, 24 Jun 2026 13:55:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B737E6084C;
	Wed, 24 Jun 2026 13:55:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B2Dp5Mu52ipt; Wed, 24 Jun 2026 13:55:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACE4F607E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782309355;
	bh=5+818MhK0CHgsNSrPgpcXs5GvvvsGOLMSxSCQgsgc5Y=;
	h=Date:To:From:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YK1Av232LJKsYxhPPgMKKJclg3KB6joJBkAOGsISfrxhNVDuad/DlsR6gx0ajHZdV
	 Wx6Kw//NbRuYnd0TiXtCer0exvW7jQCPVZ5WDG1GXmG6B1dnxWjodfw9s0LmQsgE+F
	 AMmcXXPi/QGQusH50dYdC4Qyhx95J5YGnc8c1AkxvV/kJrpx34cRl/wqlnbAKyBfDR
	 6m/TbTUs9NUZtqTo63ggQVLKARGJJB+giqp8cxj8I03MSjpmwvL28rE03STKUO/Qs8
	 XsSkjQ0BBQtgwRgfVk1Mp3q2LiFiHutQpx/pNYsS2N5mge0SlVKY5o4rZnclYY6EkF
	 HVNawTs0yESMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACE4F607E4;
	Wed, 24 Jun 2026 13:55:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3EC51363
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 13:55:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 252A0401C2
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 13:55:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nBQZ0nzmzr1R for <buildroot@buildroot.org>;
 Wed, 24 Jun 2026 13:55:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=vale7uz@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3D1B9401B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D1B9401B1
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3D1B9401B1
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 13:55:53 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-697bd21fdc2so619153a12.1
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 06:55:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782309351; x=1782914151;
 h=content-transfer-encoding:subject:from:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FU/l8h9ZM9WdEqUY8/Sw6TTQhfV837LKVSS0KW1ZtXQ=;
 b=rz99W76sQTG/SF4P7f4sPbyIin7Q9Wsv3h+zCZguheDwtQ1i0xLfC/pRM6+R/5IcEm
 7dOEYhd1fviKvH4SiAMi27Ng82uugdEYoEyy/ERs9ofkrDNfl9kngApYglkEqRgUOJyg
 aoF+xEafzMfSiLDWIuIEwJV9ivtonC6vAfSjgHXvQPY4Pw1ZjdbfqwzVOqZGc/i6XmcM
 NnCkQhNItGI5b5FWCd6TRAp6ZJAhP9Pxq6WhZS6dDCjkkHqwbki5fcSEcDUmeRy1UpSl
 E8MnaP7Vvw+gWFgKmdRAYjRdHF0e8zwHPD5/vBCvzFTEqyjUZnFejU6kf96pLXqogNCI
 qDsA==
X-Gm-Message-State: AOJu0YwJXNJBHE1GPFWgXddes+xWQN2KrJdLeVOnb2yB0XEPa2Y0vsVU
 gPHXLK04AHnFRjPGgbsNEY5ZY2fMD0Se/x1d0YQ5OP/wKCNNJ0wll7Z1fdbxxA==
X-Gm-Gg: AfdE7clyrsXZacsdN31BmoqFnl1vg8mlUiCbCLPx6VyHsIg4DPWpGRRj/Lx3C0wKTi6
 H6dPvXQ5qqWHS/00lNeCrHe8WwF82gZ126Pbf0JUiccnoUeQIYKCg9BPpqCZdMont2GTE34dQfU
 Typ8VoHHwCdxmz/LKmMfcu8Z7F/Nm5m0JmfrFPf2z/IZKMO9yND2LemEtZRuNsQoSN9nrCUR+hs
 aZNZwKoplkCk48REdaMR990yKpMGrkXr8UeVyiSBqj5ulPnPaHKR/zpxDULbhRsztU1jo7hl1Vv
 cITqtExVY7xHDu3F8BXUY5aVkoudemc0TFUlM5qunoXcikEK9qad8GgMFn/ESlfY/qf79FYqgC6
 4rYP7nB51nLB0kg1De54FZPHbL9fshonsD+DSmdPH5IqGz+ID9MdEZA+CWwwKhmg02oDjoap3iJ
 ryZjT26PSTwqem
X-Received: by 2002:a05:6402:42c2:b0:697:d557:f9c5 with SMTP id
 4fb4d7f45d1cf-697f37700a7mr1953360a12.3.1782309350927; 
 Wed, 24 Jun 2026 06:55:50 -0700 (PDT)
Received: from [192.168.3.100] ([151.61.238.34])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-697f3ac5df0sm1346224a12.1.2026.06.24.06.55.50
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2026 06:55:50 -0700 (PDT)
Message-ID: <12f77d8d-838e-4a9c-8d8e-dc218052688c@gmail.com>
Date: Wed, 24 Jun 2026 15:55:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: buildroot@buildroot.org
From: Valerio Setti <vale7uz@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782309351; x=1782914151; darn=buildroot.org;
 h=content-transfer-encoding:subject:from:to:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FU/l8h9ZM9WdEqUY8/Sw6TTQhfV837LKVSS0KW1ZtXQ=;
 b=c2m196YPOf3TKiFxWWYsvb2CGWEldjAV3Y8r1EM1yBoqdho3fElTaRwtH0w4m4Hyzc
 DD6A1PSf2w4tWLkpJ/5CkHUFK2MLPCmyrrt7+r2iTnHOyY3xhpRaes31Poo1nR9NjxQ7
 wSkTkMYhOhR7nWeoEkNykT3vIxuIst94ZKT/bK8GYBU1gkmHdU8LGDmZLX1rdo46BaZN
 Kax0Zezmjzrdl0qoCJZ4broD9SH+4jmr3/rR3/WAde1LO2uZ86aaApVoPc8aTKLSyhlr
 kU9r8yurjjG8dskFZKW7R/d3NzlJUu/JQUENNcXvjSBLMzt9DTqMfdckmtRZ1lWlF6ct
 3jug==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=c2m196YP
Subject: [Buildroot] odroidc2_defconfig: gcc/libsanitizer build failure with
 kernel 7.1 headers + C++ (missing linux/scc.h)
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgpJJ2QgbGlrZSB0byByZXBvcnQgYSByZXByb2R1Y2libGUgYnVpbGQgZmFpbHVyZSB0aGF0
IGFmZmVjdHMgdGhlIAppbnRlcm5hbCB0b29sY2hhaW4gd2hlbiBidWlsZGluZyBhZ2FpbnN0IExp
bnV4IDcuMSBrZXJuZWwgaGVhZGVycyB3aXRoIApDKysgc3VwcG9ydCBlbmFibGVkLCBhbmQgYXNr
IHdoZXRoZXIgeW91J2QgYWNjZXB0IGEgZml4IGZvciBpdC4KCiMgSG93IHRvIHJlcHJvZHVjZQoK
U3RhcnRpbmcgZnJvbSB0aGUgb2ZmaWNpYWwgb2Ryb2lkYzJfZGVmY29uZmlnLCB3aXRoIHRoZSBm
b2xsb3dpbmcgY2hhbmdlczoKCi0ga2VybmVsIGJ1bXBlZCB0byA3LjEgKEJSMl9MSU5VWF9LRVJO
RUxfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjcuMSIpLCAKd2l0aCBrZXJuZWwgaGVhZGVycyB0YWtl
biBmcm9tIHRoYXQgc2FtZSBrZXJuZWwgCihCUjJfS0VSTkVMX0hFQURFUlNfQVNfS0VSTkVMPXkp
LAotIEMrKyBzdXBwb3J0IGVuYWJsZWQgKEJSMl9UT09MQ0hBSU5fQlVJTERST09UX0NYWD15KS4K
ClRoZSBidWlsZCBmYWlscyB3aGlsZSBidWlsZGluZyBnY2MtZmluYWwsIGluIGxpYnNhbml0aXpl
ciwgd2l0aCBhIAptaXNzaW5nIGxpbnV4L3NjYy5oIGtlcm5lbCBoZWFkZXIuCgpJJ20gdXNpbmcg
dGhlIGN1cnJlbnQgJ21haW4nIGJyYW5jaCBhdCAKNGFiOTFhMjlkODkzMTEwNWQzZmY4ZjYyNjNj
NTlhNTQzOGFkYTFhMQoKIyBSb290IGNhdXNlCgpMaW51eCA3LjEgcmVtb3ZlZCB0aGUgQVguMjUg
LyBoYW1yYWRpbyBzdWJzeXN0ZW0gKGluIApkZDhkNGJjMjhhZDcyNTI2MTBkOGU3OWMxMzEzYTJk
MWUzNDk5YTUxKSwgd2hpY2ggZGVsZXRlZCB0aGUgVUFQSSBoZWFkZXIgCidpbmNsdWRlL3VhcGkv
bGludXgvc2NjLmgnLiBnY2MncyBsaWJzYW5pdGl6ZXIgc3RpbGwgaW5jbHVkZXMgaXQgCnVuY29u
ZGl0aW9uYWxseSBpbiAKJ2xpYnNhbml0aXplci9zYW5pdGl6ZXJfY29tbW9uL3Nhbml0aXplcl9w
bGF0Zm9ybV9saW1pdHNfcG9zaXguY3BwJywgc28gCnRoZSBoZWFkZXIgaXMgbm8gbG9uZ2VyIGF2
YWlsYWJsZSB3aGVuIHRoZSB0b29sY2hhaW4gaXMgYnVpbHQgYWdhaW5zdCAKNy4xIGhlYWRlcnMu
CgpUaGlzIG9ubHkgdHJpZ2dlcnMgd2hlbiBDKysgaXMgZW5hYmxlZCwgYmVjYXVzZSBsaWJzYW5p
dGl6ZXIgKHdoaWNoIGlzIApDKysgY29kZSkgaXMgb25seSBidWlsdCB3aGVuIGMrKyBpcyBwYXJ0
IG9mIC0tZW5hYmxlLWxhbmd1YWdlcyBpbiAKZ2NjLWZpbmFsLiBXaXRoIGEgQy1vbmx5IHRvb2xj
aGFpbiBsaWJzYW5pdGl6ZXIgaXMgbmV2ZXIgY29tcGlsZWQsIHNvIAp0aGUgc2FtZSBjb25maWd1
cmF0aW9uIGJ1aWxkcyBmaW5lIOKAlCB3aGljaCBpcyB3aHkgdGhlIGRlZmF1bHQgCm9kcm9pZGMy
X2RlZmNvbmZpZyBkb2Vzbid0IGhpdCBpdC4KCkl0IGlzIG5vdCBzcGVjaWZpYyB0byBPRFJPSUQt
QzIgSSB0aGluazsgYW55IGRlZmNvbmZpZyBjb21iaW5pbmcgNy4xIAprZXJuZWwgaGVhZGVycyB3
aXRoIGEgQysrLWVuYWJsZWQgaW50ZXJuYWwgdG9vbGNoYWluIHNob3VsZCByZXByb2R1Y2UgaXQu
CgojIEZpeAoKVGhlcmUgaXMgYW4gdXBzdHJlYW0gZ2NjIGZpeCB0aGF0IGRyb3BzIHRoZSBsaW51
eC9zY2MuaCBpbmNsdWRlOgoKICAgZ2NjIGNvbW1pdCAyNTlkNWM2ZWY3Y2EwYjdmYjA3YWNmOTc1
MzhmYTdiYTU5MGM4ZThiCiAgICJsaWJzYW5pdGl6ZXI6IEZpeCB1cCBidWlsZCBhZ2FpbnN0IGxh
dGVzdCBrZXJuZWwgaGVhZGVycyIKICAgKEpha3ViIEplbGluZWssIGNoZXJyeS1waWNrZWQgZnJv
bSBMTFZNIAozZGM0ZmQ2ZGQ0MTEwMGYwNTFhNjM2NDJmNDQ5YjE2MzI0Mzg5Yzk2KQoKSWYgeW91
J3JlIE9LIHdpdGggdGhpcyByZXBvcnQsIEknbSBoYXBweSB0byBzdWJtaXQgYSBwYXRjaCBiYWNr
cG9ydGluZyAKdGhhdCBnY2MgY29tbWl0IHRvIHRoZSBhZmZlY3RlZCBnY2MgdmVyc2lvbnMgaW4g
QnVpbGRyb290LgoKVGhhbmtzLAoKVmFsZXJpbwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
