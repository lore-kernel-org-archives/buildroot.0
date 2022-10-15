Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD3CC433FE
	for <buildroot@archiver.kernel.org>; Sat, 15 Oct 2022 21:23:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF448408AF;
	Sat, 15 Oct 2022 21:23:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF448408AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5S-ZgOxZgKQ2; Sat, 15 Oct 2022 21:23:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DEEB840483;
	Sat, 15 Oct 2022 21:23:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DEEB840483
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1F9E11BF368
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 21:23:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EDD3781836
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 21:23:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDD3781836
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id segp3yacd-ms for <buildroot@lists.busybox.net>;
 Sat, 15 Oct 2022 21:23:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA29A81842
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CA29A81842
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 21:23:15 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 l14-20020a05600c1d0e00b003c6ecc94285so1881016wms.1
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 14:23:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dth5Xns6QtL4dLEBZxCLZrYdDhK0YAgfxLdQPbDzNsk=;
 b=S/1kVJEcBHI9EHRwjgxHAI6e/J4W0FbcYk7+K5OlXL4bW2dEX1hGCQELtWfydwf1Vg
 E42ECeKt3pTu8bwcBzja1/VF7lzkicVn2zp3ZSwQsAURjpBDfQfp7KZQetpECQtiQSZX
 axdXMa9qor8lD8QCbPu/FLE+Ur+jKhHfTYZcEPya5DRz7cba5IZhEI8EGFhjueUWv6g8
 lNWs7wajpASK1MafFhRLnvEPBb4Llkj1jXV0j5T7V+PlyqWmfJRVLg1HOtZVXedWEmFT
 LZDPLqrNpYLwxIQxf2FFy2opt5xC3lvES96Elz00+wOeObfU5Oz4gi5nIMd0FNsyQFqD
 eDxw==
X-Gm-Message-State: ACrzQf3SDJpW1b7xHEfbiT8Sa5Fm3gkem4KbDikoE9DqdCz369VRCKom
 gqenuh5uk+pcmJn/aejFFT3V7QjvtQA=
X-Google-Smtp-Source: AMsMyM7XynDWhZS64ZY2ys9eLjwOEB5Tv+rpXu8CRUrKCRT75iJgEV9AlO1/WmexkgLbPApOWdgTIA==
X-Received: by 2002:a05:600c:a4c:b0:3b4:fc1b:81 with SMTP id
 c12-20020a05600c0a4c00b003b4fc1b0081mr2586169wmq.125.1665868993921; 
 Sat, 15 Oct 2022 14:23:13 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b51:cb00:a23d:25f5:317d:1e3])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a05600c190c00b003a601a1c2f7sm11276374wmq.19.2022.10.15.14.23.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Oct 2022 14:23:13 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 15 Oct 2022 23:23:10 +0200
Message-Id: <116d929d3e556155552784dd7792afad72cd3125.1665868987.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1665868987.git.yann.morin.1998@free.fr>
References: <cover.1665868987.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dth5Xns6QtL4dLEBZxCLZrYdDhK0YAgfxLdQPbDzNsk=;
 b=IUtMvpWUAuUPIHYif73WpU1Ew2pem6AVlQHG0hiyu6WHShqmg4gfpgXiTFVZPMsL1T
 7hx62ghCSZ0toUPlERuHbd0P0+gHkk1ElcgJwWR4LqzRPuWKdN/OSjb1WuyMQBnJDOTx
 X46FYfGOEG1zacYQ9YloYShM0l+RYNkq2y8Rop0sCZuGDwxD498AQUWaebLhUj0Be074
 YsSmi/2yJZOW7fIvK4SQWdb8TpKzibGfp0bvkiLLsIKf7rVgDAB+iQ7YuWmsj650Chh/
 AIcsL9bMA7E5ULtHynVTtNwh6ukBmXkKW4kv6FMGwr5lz++nrJr0g7bPpRQrKDkR6g7Z
 woPg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=IUtMvpWU
Subject: [Buildroot] [PATCH 2/4] package/skeleton-systemd: systemd-ify
 mounting /var tmpfs with ro rootfs
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
Cc: Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin@orange.com>,
 =?UTF-8?q?Je=CC=81re=CC=81my=20Rosen?= <jeremy.rosen@smile.fr>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VG8gbW91bnQgb3VyIC92YXIgdG1wZnMgd2hlbiB0aGUgcm9vdGZzIGlzIG1vdW50ZWQgcmVhZC1v
bmx5IChyZWFsbHksCm5vdCByZW1vdW50ZWQgcmVxZC13cml0ZSksIHdlIHVzZSBhbiBlbnRyeSBp
biBmc3RhYi4KCkhvd2V2ZXIsIC9ldGMgY291bGQgYWxzbyBiZSBhIHRtcGZzIChmb3IgZnVsbCBz
dGF0ZS1sZXNzIHN5c3RlbXMsIG9yCmVhc3kgZmFjdG9yeS1yZXNldCwgc2VlIFswXSkuCgpTbywg
d2UgcmVnaXN0ZXIgL3ZhciBhcyBhIHN5c3RlbWQgbW91bnQgdW5pdCwgc28gdGhhdCB3ZSBjYW4g
YWxzbyBoYXZlCnRoZSAvdmFyIGZhY3RvcnkgcG9wdWxhdGVkIGFuZCBmdW5jdGlvbmFsIGV2ZW4g
d2hlbiAvZXRjIGlzIGVtcHR5LiBUaGUKdmFyLm1vdW50IHVuaXQgaXMgaGVhdmlseSBtb2RlbGxl
ZCBhZnRlciBzeXN0ZW1kJ3Mgb3duIHRtcC5tb3VudCBvbmUsIHNvCndlIGNhcnJ5IHRoZSBzYW1l
IGxpY2Vuc2UgZm9yIHRoYXQgZmlsZSAoaW4gY2FzZSB0aGF0IG1heSBhcHBseSkuIFdlIGFkZAph
biBleHBsaWNpdCByZXZlcnNlIGRlcGVuZGVuY3kgdG8gc3lzdGVtZC10bXBmaWxlcy1zZXR1cC5z
ZXJ2aWNlLCB0bwplbnN1cmUgL3ZhciBpcyBtb3VudGVkIGJlZm9yZSB3ZSB0cnkgdG8gcG9wdWxh
dGUgaXQuCgpbMF0gaHR0cDovLzBwb2ludGVyLmRlL2Jsb2cvcHJvamVjdHMvc3RhdGVsZXNzLmh0
bWwKClNpZ25lZC1vZmYtYnk6IFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9yaW5Ab3JhbmdlLmNvbT4K
Q2M6IE5vcmJlcnQgTGFuZ2UgPG5vbGFuZ2U3OUBnbWFpbC5jb20+CkNjOiBSb21haW4gTmFvdXIg
PHJvbWFpbi5uYW91ckBzbWlsZS5mcj4KQ2M6IEplzIFyZcyBbXkgUm9zZW4gPGplcmVteS5yb3Nl
bkBzbWlsZS5mcj4KW3lhbm4ubW9yaW4uMTk5OEBmcmVlLmZyOgogIC0gc3BsaXQgb3JpZ2luYWwg
cGF0Y2ggaW4gdHdvCiAgLSB0aGlzIG9uZSBvbmx5IGhhbmRsZXMgY29udmVydGluZyAvdmFyIG1v
dW50aW5nIGludG8gYSBzeXN0ZW1kIHVuaXQKICAtIGFkYXB0IGNvbW1pdCBsb2cgYWNjb3JkaW5n
bHkKXQpTaWduZWQtb2ZmLWJ5OiBZYW5uIEUuIE1PUklOIDx5YW5uLm1vcmluLjE5OThAZnJlZS5m
cj4KLS0tCiAuLi4vc2tlbGV0b24taW5pdC1zeXN0ZW1kLm1rICAgICAgICAgICAgICAgICAgIHwg
IDMgKystCiBwYWNrYWdlL3NrZWxldG9uLWluaXQtc3lzdGVtZC92YXIubW91bnQgICAgICAgIHwg
MTggKysrKysrKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3NrZWxldG9uLWluaXQt
c3lzdGVtZC92YXIubW91bnQKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3NrZWxldG9uLWluaXQtc3lz
dGVtZC9za2VsZXRvbi1pbml0LXN5c3RlbWQubWsgYi9wYWNrYWdlL3NrZWxldG9uLWluaXQtc3lz
dGVtZC9za2VsZXRvbi1pbml0LXN5c3RlbWQubWsKaW5kZXggN2I2NjczMmVmNC4uOTcwOTUxZDU1
MyAxMDA2NDQKLS0tIGEvcGFja2FnZS9za2VsZXRvbi1pbml0LXN5c3RlbWQvc2tlbGV0b24taW5p
dC1zeXN0ZW1kLm1rCisrKyBiL3BhY2thZ2Uvc2tlbGV0b24taW5pdC1zeXN0ZW1kL3NrZWxldG9u
LWluaXQtc3lzdGVtZC5tawpAQCAtMzAsNyArMzAsNiBAQCBlbHNlCiAjIGJhY2sgdGhlcmUgYnkg
dGhlIHRtcGZpbGVzLmQgbWVjaGFuaXNtLgogZGVmaW5lIFNLRUxFVE9OX0lOSVRfU1lTVEVNRF9S
T09UX1JPX09SX1JXCiAJZWNobyAiL2Rldi9yb290IC8gYXV0byBybyAwIDEiID4kKFRBUkdFVF9E
SVIpL2V0Yy9mc3RhYgotCWVjaG8gInRtcGZzIC92YXIgdG1wZnMgbW9kZT0xNzc3IDAgMCIgPj4k
KFRBUkdFVF9ESVIpL2V0Yy9mc3RhYgogZW5kZWYKIAogZGVmaW5lIFNLRUxFVE9OX0lOSVRfU1lT
VEVNRF9QUkVfUk9PVEZTX1ZBUgpAQCAtNTIsNiArNTEsOCBAQCBkZWZpbmUgU0tFTEVUT05fSU5J
VF9TWVNURU1EX1BSRV9ST09URlNfVkFSCiAJCQl8fCBleGl0IDE7IFwKIAkJZmk7IFwKIAlkb25l
ID4kKFRBUkdFVF9ESVIpL3Vzci9saWIvdG1wZmlsZXMuZC9idWlsZHJvb3QtZmFjdG9yeS5jb25m
CisJJChJTlNUQUxMKSAtRCAtbSAwNjQ0ICQoU0tFTEVUT05fSU5JVF9TWVNURU1EX1BLR0RJUikv
dmFyLm1vdW50IFwKKwkJJChUQVJHRVRfRElSKS91c3IvbGliL3N5c3RlbWQvc3lzdGVtL3Zhci5t
b3VudAogZW5kZWYKIFNLRUxFVE9OX0lOSVRfU1lTVEVNRF9ST09URlNfUFJFX0NNRF9IT09LUyAr
PSBTS0VMRVRPTl9JTklUX1NZU1RFTURfUFJFX1JPT1RGU19WQVIKIApkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9za2VsZXRvbi1pbml0LXN5c3RlbWQvdmFyLm1vdW50IGIvcGFja2FnZS9za2VsZXRvbi1p
bml0LXN5c3RlbWQvdmFyLm1vdW50Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAw
MDAuLjZiMTY1ZGZmNmQKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL3NrZWxldG9uLWluaXQt
c3lzdGVtZC92YXIubW91bnQKQEAgLTAsMCArMSwxOCBAQAorIyBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogTEdQTC0yLjEtb3ItbGF0ZXIKKyMgTW9kZWxsZWQgYWZ0ZXIgc3lzdGVtZCdzIHRtcC5t
b3VudAorCitbVW5pdF0KK0Rlc2NyaXB0aW9uPUJ1aWxkcm9vdCAvdmFyIHRtcGZzCitEZWZhdWx0
RGVwZW5kZW5jaWVzPW5vCitDb25mbGljdHM9dW1vdW50LnRhcmdldAorQmVmb3JlPWJhc2ljLnRh
cmdldCBsb2NhbC1mcy50YXJnZXQgdW1vdW50LnRhcmdldCBzeXN0ZW1kLXRtcGZpbGVzLXNldHVw
LnNlcnZpY2UKK0FmdGVyPXN3YXAudGFyZ2V0CisKK1tNb3VudF0KK1doYXQ9dG1wZnMKK1doZXJl
PS92YXIKK1R5cGU9dG1wZnMKK09wdGlvbnM9bW9kZT0xNzc3LHN0cmljdGF0aW1lLG5vc3VpZCxu
b2RldixzaXplPTUwJSUsbnJfaW5vZGVzPTFtCisKK1tJbnN0YWxsXQorV2FudGVkQnk9YmFzaWMu
dGFyZ2V0Ci0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
