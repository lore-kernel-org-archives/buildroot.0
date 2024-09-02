Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C294CA0ED3
	for <buildroot@archiver.kernel.org>; Mon,  2 Sep 2024 19:21:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70D28400DA;
	Mon,  2 Sep 2024 19:21:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bXM6ULrnRsxc; Mon,  2 Sep 2024 19:21:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21569400ED
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21569400ED;
	Mon,  2 Sep 2024 19:21:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AE5431BF20B
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 19:21:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C2FF80E65
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 19:21:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0dYuUsd7fIxC for <buildroot@lists.busybox.net>;
 Mon,  2 Sep 2024 19:21:35 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com;
 envelope-from=flavio.tapajos@newtesc.com.br; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8687D80E63
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8687D80E63
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8687D80E63
 for <buildroot@buildroot.org>; Mon,  2 Sep 2024 19:21:33 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-71430e7eaf8so3600013b3a.1
 for <buildroot@buildroot.org>; Mon, 02 Sep 2024 12:21:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725304892; x=1725909692;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ay0mAXvW5CYOPTiOzsX9oAyqkdRUd45/fapT1v19cX0=;
 b=nGPLbI91OvdNGw7y4p8X09SoWuaOiLI4HqMbMBpnLjeBYDaMMjkz3ZrKfLtKpKw66m
 QJNLvQu5kfKniX36+zWV+rFXWwKDgwFYeFwZKEXKEpcO1EzJ98iXlDLOYJwOrGUnXckf
 4boVUU5hY+3CdS+ABQcHCjyJ2/QhoSRn5uIJeDLAISutNu9oz/2P2RVFVdmeElWEd0x/
 3y5FB6Hn2vgShT+No34wOuqcXmz6MZLwbMVMBnGJe6kanIBCfxoXxB02D3xYMU0OzP9w
 yFP9+eEYpGsg5U4/C8irgGdkeC+RFFUv0bhviXE86WUEcLVKcMmEYz2lsumcA9XaD3r/
 AimQ==
X-Gm-Message-State: AOJu0YyrHNqtLFfjUMDzAngs1nyTzPiIZmanPYJeTRv9rVKw95z3Cujx
 w0SVp+DLgWPU7SIrpzZ2yaaph9m3d4F9VkNomZk9ZHfvVB0YIfa6ldL6LAmRLbpKAYjj87xQ3G4
 dpOU=
X-Google-Smtp-Source: AGHT+IHZiyKyEqSrg5WUQ9oe2EQ3DSzUIbBc9VYx579oA8R2rFKbEtAJWVZMjSmk5y0TeR1wjSoRIQ==
X-Received: by 2002:a05:6a20:d492:b0:1cc:eadd:754c with SMTP id
 adf61e73a8af0-1cceadd7daamr12199873637.50.1725304892340; 
 Mon, 02 Sep 2024 12:21:32 -0700 (PDT)
Received: from niltesque.newtesc.com.br ([189.113.44.122])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-715e575cd80sm7179127b3a.203.2024.09.02.12.21.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 12:21:31 -0700 (PDT)
From: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
To: buildroot@buildroot.org
Date: Mon,  2 Sep 2024 16:21:22 -0300
Message-ID: <20240902192122.150821-1-flavio.tapajos@newtesc.com.br>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=newtesc-com-br.20230601.gappssmtp.com; s=20230601; t=1725304892; x=1725909692;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ay0mAXvW5CYOPTiOzsX9oAyqkdRUd45/fapT1v19cX0=;
 b=gYfFmW985Vq99AVgBS6LFNlAV6NrlR29YxJbO0/4obKwJsfGAN3YqwJeP46rRpCmBw
 PrEbnO8dANz8trudQgNO/bcrEQKo7C379cuNmV4OCCx0tQqebJoKlSSa/ZMyQTuCORLI
 1bbMWWyXINIyIuqYgLU++yQbnCTUA7+vAASY4CcaL7O71DmJMbWpua2fyUNvRjUru71Z
 ZDE3p2UvCjAxJKZAm2XwPqZccuOHVMqp2ATIq5ciuDLr1Cb+S7WIcaIftg7SF1OFVDp2
 ZXnAx1ACey4IfTpT4IcVw1ImsEHo0l4/i2w99OO5lOTjKCE5Qkm48AVBPIowC+zKSXY0
 w7iw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=newtesc.com.br
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=newtesc-com-br.20230601.gappssmtp.com
 header.i=@newtesc-com-br.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=gYfFmW98
Subject: [Buildroot] [PATCH 1/1] package/python-sqlalchemy: fix build issue
 with setuptools > 69.3
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
Cc: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBjb21taXQgYWRkcyB1cHN0cmVhbSBwYXRjaCB0aGF0IHVucGlucyBzZXR1cHRvb2xzOgog
IGh0dHBzOi8vZ2Vycml0LnNxbGFsY2hlbXkub3JnL2Mvc3FsYWxjaGVteS9zcWxhbGNoZW15Lysv
NTQ3OAogIGh0dHBzOi8vZ2l0aHViLmNvbS9zcWxhbGNoZW15L3NxbGFsY2hlbXkvZGlzY3Vzc2lv
bnMvMTE4MTgKCkZpeGVzOgogIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRz
L2M1MzFiNmU2M2M1MTIxMTM4ZThlOGExYzVkMTUwMWQ5ZDdlMTM5MWUvCgpTaWduZWQtb2ZmLWJ5
OiBGbMOhdmlvIFRhcGFqw7NzIDxmbGF2aW8udGFwYWpvc0BuZXd0ZXNjLmNvbS5icj4KLS0tCiAu
Li4vMi4wLjMyLzAwMDEtdW5waW4tc2V0dXB0b29scy5wYXRjaCAgICAgICAgfCA3MiArKysrKysr
KysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNzIgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1v
ZGUgMTAwNjQ0IHBhY2thZ2UvcHl0aG9uLXNxbGFsY2hlbXkvMi4wLjMyLzAwMDEtdW5waW4tc2V0
dXB0b29scy5wYXRjaAoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLXNxbGFsY2hlbXkvMi4w
LjMyLzAwMDEtdW5waW4tc2V0dXB0b29scy5wYXRjaCBiL3BhY2thZ2UvcHl0aG9uLXNxbGFsY2hl
bXkvMi4wLjMyLzAwMDEtdW5waW4tc2V0dXB0b29scy5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0
NAppbmRleCAwMDAwMDAwMDAwLi45MmRkMTgyNmE3Ci0tLSAvZGV2L251bGwKKysrIGIvcGFja2Fn
ZS9weXRob24tc3FsYWxjaGVteS8yLjAuMzIvMDAwMS11bnBpbi1zZXR1cHRvb2xzLnBhdGNoCkBA
IC0wLDAgKzEsNzIgQEAKK0Zyb20gYmYzM2NiNGZmYTVmMDU4YjRiYjllNTBlZmFhNDMwMzhmMzdj
YzZlMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IE1pa2UgQmF5ZXIgPG1pa2VfbXBA
enp6Y29tcHV0aW5nLmNvbT4KK0RhdGU6IE1vbiwgMiBTZXAgMjAyNCAwOToxMzoyNyAtMDQwMAor
U3ViamVjdDogW1BBVENIXSB1bnBpbiBzZXR1cHRvb2xzCitNSU1FLVZlcnNpb246IDEuMAorQ29u
dGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04CitDb250ZW50LVRyYW5zZmVyLUVu
Y29kaW5nOiA4Yml0CisKK1RoaXMgcmVtb3ZlcyB0aGUgcGluIHRoYXQgd2FzIHBsYWNlZCBpbiAy
NjA3MjYyMTEwYmRjNWM1ZGM5NmZjMTlkZGNhODk1YTE1YTU4ZTRlCisKK1RoZSBwaW4gZm9yIGBg
c2V0dXB0b29sczw2OS4zYGAgaW4gYGBweXByb2plY3QudG9tbGBgIGhhcyBiZWVuCityZW1vdmVk
LiAgVGhpcyBwaW4gd2FzIHRvIHByZXZlbnQgYSBzdWRkZW4gY2hhbmdlIHRvIDpwZXA6YDYyNWAg
aW4KK3NldHVwdG9vbHMgZnJvbSB0YWtpbmcgcGxhY2Ugd2hpY2ggY2hhbmdlcyB0aGUgZmlsZSBu
YW1lIG9mIFNRTEFsY2hlbXkncworc291cmNlIGRpc3RyaWJ1dGlvbiBvbiBweXBpIHRvIGJlIGFu
IGFsbCBsb3dlciBjYXNlIG5hbWUsIHdoaWNoIGlzIHZlcnkKK2xpa2VseSB0byBjYXVzZSBwcm9i
bGVtcyB3aXRoIHZhcmlvdXMgYnVpbGQgZW52aXJvbm1lbnRzIHRoYXQgZXhwZWN0ZWQgYQorcGFy
dGljdWxhciBuYW1pbmcgc3R5bGUuICBIb3dldmVyLCB0aGUgcHJlc2VuY2Ugb2YgdGhpcyBwaW4g
aXMgbm93IGhvbGRpbmcKK2JhY2sgZW52aXJvbm1lbnRzIHRoYXQgb3RoZXJ3aXNlIHdhbnQgdG8g
dXNlIGEgbmV3ZXIgc2V0dXB0b29scywgc28gd2UndmUKK2RlY2lkZWQgdG8gbW92ZSBmb3J3YXJk
IHdpdGggdGhpcyBjaGFuZ2UsIHdpdGggdGhlIGFzc3VtcHRpb24gdGhhdCBidWlsZAorZW52aXJv
bm1lbnRzIHdpbGwgaGF2ZSBsYXJnZWx5IGFjY29tbW9kYXRlZCB0aGUgc2V0dXB0b29scyBjaGFu
Z2UgYnkKK25vdy4KKworUmVmZXJlbmNlczogIzExODE4CitDaGFuZ2UtSWQ6IEkwY2Q5YWIwNTEy
MDA0NjY5YThmMGFhMGNiN2Y1NjBkODlhMmRhMmJkCisKK1Vwc3RyZWFtOiBodHRwczovL2dlcnJp
dC5zcWxhbGNoZW15Lm9yZy9wbHVnaW5zL2dpdGlsZXMvc3FsYWxjaGVteS9zcWxhbGNoZW15Lysv
Y2Y4MmJlNjBmODExZWQ2YmRjMWE4YzQyMjExNDhkOTdkZDZiNzA0ZAorU2lnbmVkLW9mZi1ieTog
RmzDoXZpbyBUYXBhasOzcyA8ZmxhdmlvLnRhcGFqb3NAbmV3dGVzYy5jb20uYnI+CistLS0KKyBk
b2MvYnVpbGQvY2hhbmdlbG9nL3VucmVsZWFzZWRfMjAvMTE4MTgucnN0IHwgMTYgKysrKysrKysr
KysrKysrKworIHB5cHJvamVjdC50b21sICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
NCArLS0tCisgMiBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQorIGNyZWF0ZSBtb2RlIDEwMDY0NCBkb2MvYnVpbGQvY2hhbmdlbG9nL3VucmVsZWFzZWRfMjAv
MTE4MTgucnN0CisKK2RpZmYgLS1naXQgYS9kb2MvYnVpbGQvY2hhbmdlbG9nL3VucmVsZWFzZWRf
MjAvMTE4MTgucnN0IGIvZG9jL2J1aWxkL2NoYW5nZWxvZy91bnJlbGVhc2VkXzIwLzExODE4LnJz
dAorbmV3IGZpbGUgbW9kZSAxMDA2NDQKK2luZGV4IDAwMDAwMDAwMC4uYzc1YTZjNjRiCistLS0g
L2Rldi9udWxsCisrKysgYi9kb2MvYnVpbGQvY2hhbmdlbG9nL3VucmVsZWFzZWRfMjAvMTE4MTgu
cnN0CitAQCAtMCwwICsxLDE2IEBACisrLi4gY2hhbmdlOjoKKysgICAgOnRhZ3M6IGNoYW5nZSwg
Z2VuZXJhbAorKyAgICA6dGlja2V0czogMTE4MTgKKysKKysgICAgVGhlIHBpbiBmb3IgYGBzZXR1
cHRvb2xzPDY5LjNgYCBpbiBgYHB5cHJvamVjdC50b21sYGAgaGFzIGJlZW4KKysgICAgcmVtb3Zl
ZC4gIFRoaXMgcGluIHdhcyB0byBwcmV2ZW50IGEgc3VkZGVuIGNoYW5nZSB0byA6cGVwOmA2MjVg
IGluCisrICAgIHNldHVwdG9vbHMgZnJvbSB0YWtpbmcgcGxhY2Ugd2hpY2ggY2hhbmdlcyB0aGUg
ZmlsZSBuYW1lIG9mIFNRTEFsY2hlbXkncworKyAgICBzb3VyY2UgZGlzdHJpYnV0aW9uIG9uIHB5
cGkgdG8gYmUgYW4gYWxsIGxvd2VyIGNhc2UgbmFtZSwgd2hpY2ggaXMgdmVyeQorKyAgICBsaWtl
bHkgdG8gY2F1c2UgcHJvYmxlbXMgd2l0aCB2YXJpb3VzIGJ1aWxkIGVudmlyb25tZW50cyB0aGF0
IGV4cGVjdGVkIGEKKysgICAgcGFydGljdWxhciBuYW1pbmcgc3R5bGUuICBIb3dldmVyLCB0aGUg
cHJlc2VuY2Ugb2YgdGhpcyBwaW4gaXMgbm93IGhvbGRpbmcKKysgICAgYmFjayBlbnZpcm9ubWVu
dHMgdGhhdCBvdGhlcndpc2Ugd2FudCB0byB1c2UgYSBuZXdlciBzZXR1cHRvb2xzLCBzbyB3ZSd2
ZQorKyAgICBkZWNpZGVkIHRvIG1vdmUgZm9yd2FyZCB3aXRoIHRoaXMgY2hhbmdlLCB3aXRoIHRo
ZSBhc3N1bXB0aW9uIHRoYXQgYnVpbGQKKysgICAgZW52aXJvbm1lbnRzIHdpbGwgaGF2ZSBsYXJn
ZWx5IGFjY29tbW9kYXRlZCB0aGUgc2V0dXB0b29scyBjaGFuZ2UgYnkKKysgICAgbm93LgorKwor
KworZGlmZiAtLWdpdCBhL3B5cHJvamVjdC50b21sIGIvcHlwcm9qZWN0LnRvbWwKK2luZGV4IDBm
NTM1OTRkZi4uZjc1YmYzMTkyIDEwMDY0NAorLS0tIGEvcHlwcm9qZWN0LnRvbWwKKysrKyBiL3B5
cHJvamVjdC50b21sCitAQCAtMSw5ICsxLDcgQEAKKyBbYnVpbGQtc3lzdGVtXQorIGJ1aWxkLWJh
Y2tlbmQgPSAic2V0dXB0b29scy5idWlsZF9tZXRhIgorIHJlcXVpcmVzID0gWworLSAgICAjIGF2
b2lkIG1vdmluZyB0byBodHRwczovL2dpdGh1Yi5jb20vcHlwYS9zZXR1cHRvb2xzL2lzc3Vlcy8z
NTkzCistICAgICMgdW50aWwgd2UncmUgcmVhZHkKKy0gICAgInNldHVwdG9vbHM+PTYxLjAsPDY5
LjMiLAorKyAgICAic2V0dXB0b29scz49NjEuMCIsCisgICAgICJjeXRob24+PTAuMjkuMjQ7IHBs
YXRmb3JtX3B5dGhvbl9pbXBsZW1lbnRhdGlvbiA9PSAnQ1B5dGhvbiciLCAjIFNraXAgY3l0aG9u
IHdoZW4gdXNpbmcgcHlweQorIF0KKyAKKy0tIAorMi40Ni4wCisKLS0gCjIuNDYuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
