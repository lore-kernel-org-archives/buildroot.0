Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33802C433FE
	for <buildroot@archiver.kernel.org>; Sat, 15 Oct 2022 21:23:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92654410D1;
	Sat, 15 Oct 2022 21:23:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92654410D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6y2JpRZZwwm3; Sat, 15 Oct 2022 21:23:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 667174098F;
	Sat, 15 Oct 2022 21:23:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 667174098F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 862C11BF368
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 21:23:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F91B8184F
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 21:23:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F91B8184F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G21C-0L9pX4j for <buildroot@lists.busybox.net>;
 Sat, 15 Oct 2022 21:23:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D8C881836
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4D8C881836
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 21:23:15 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id a10so12659029wrm.12
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 14:23:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3K7IdEinLIyq95lbNVZvMnZk5O8EXZP2iySWAkcXMpQ=;
 b=kDYSqNeO+i7HamBI91yCMU2XvbkfZPepP+pitsLlSeuuzBUbuqYEggcYk+Op0vY7WP
 qMPUW9lPFj0FmyCCJwU8mt2QcgH5Y1lmqZ3PYnycyx2i30mPbk69i5oxPa9Ovl+LmSpd
 eoZ2UF/+4qtJtt+APQIKxp2qTliFamez47VgsQq8jg7CP/8bzcovto6h80MqwYFvuXcu
 cdKrdvF334ufGV9u9aOjKRkL3i2nW8/Xv9JJo6xjsdXSUKPNmJTeAbELcYt7yOQfkd0Y
 KXymEE0vcCLobt+cD70Il+QqlbpoOPgNyn4e01NG7CT2DVbjwB1h6thxNhCI8eFLJg8o
 HKew==
X-Gm-Message-State: ACrzQf1XMlOKVq4/VOBwf/YaUV+DWMQttMnly8A4t95hjqACI9pnvk6U
 BbJ6qToMmchrWb5XI1y1ndNORw8kMUc=
X-Google-Smtp-Source: AMsMyM6Zr7/9NC2dGSJubC84bowOqYESTaIZLlRQapYrcw+1MaUrll8Hbako+0ed9CyAQw0jAeVlHQ==
X-Received: by 2002:a5d:6d0a:0:b0:22e:3f3a:5cdf with SMTP id
 e10-20020a5d6d0a000000b0022e3f3a5cdfmr2185850wrq.156.1665868993297; 
 Sat, 15 Oct 2022 14:23:13 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b51:cb00:a23d:25f5:317d:1e3])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a05600c190c00b003a601a1c2f7sm11276374wmq.19.2022.10.15.14.23.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Oct 2022 14:23:12 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 15 Oct 2022 23:23:09 +0200
Message-Id: <642fc3070362553483dd284d81df6949b3d7a682.1665868987.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1665868987.git.yann.morin.1998@free.fr>
References: <cover.1665868987.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3K7IdEinLIyq95lbNVZvMnZk5O8EXZP2iySWAkcXMpQ=;
 b=DPX5JKSMZtm4jXAVLkB7P8fAB9kpVfpVBDJbPPn5tMyr+Jl9s1SCQZTW/DuicnyqY/
 FYWE8ThNg/KN4vsWHS+XxpBAZzH+X7xDjZzLK6AuJaqiZ+QA+spkxoVl9UVR4o9mjaDL
 TOvMSrw2nLdB/kbv+5TwDHT3WE2/jZeaecBrjnPC92+iWrg8Ksk/dWfOlR8G+2P6fwZ3
 bSLCPITiUSAkFJAbySMxleNVx+o/uZVyl9s5nlVmHIemlI9NkndfkMCSyRtNb4D66KyN
 EdbaICjXUAUxXfSe9Vmb8mFcvWdx9pIMjH5rJe9Inyu3C7GglNDHmAHnu9ZnkmncmVY8
 kgLg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=DPX5JKSM
Subject: [Buildroot] [PATCH 1/4] package/skeleton-systemd: move /var factory
 out of /etc
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
 "Yann E. MORIN" <yann.morin@orange.com>,
 =?UTF-8?q?Je=CC=81re=CC=81my=20Rosen?= <jeremy.rosen@smile.fr>,
 Romain Naour <romain.naour@smile.fr>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogIllhbm4gRS4gTU9SSU4iIDx5YW5uLm1vcmluQG9yYW5nZS5jb20+CgpXaGVuIHRoZSBy
b290ZnMgaXMgbm90IHJlbW91bnRlZCByZWFkLXdyaXRlICh0aHVzIGFzc3VtaW5nIGEgcmVhZC1v
bmx5CnJvb3RmcyBsaWtlIHNxdWFzaGZzKSwgd2UgY3JlYXRlIGEgdG1wZmlsZXMuZCBmYWN0b3J5
IGZvciAvdmFyLgoKSG93ZXZlciwgd2UgcmVnaXN0ZXIgdGhvc2UgaW4gL2V0Yy90bXBmaWxlcy5k
LywgYnV0IC9ldGMgY291bGQgYWxzbyBiZQphIHRtcGZzIChmb3IgZnVsbCBzdGF0ZS1sZXNzIHN5
c3RlbXMsIG9yIGVhc3kgZmFjdG9yeS1yZXNldCwgc2VlIFswXSkuCgpTbywgd2UgbW92ZSBvdXIg
dmFyIGZhY3RvcnkgdG8gL3Vzci9saWIvdG1wZmlsZXMuZC8sIHdoaWNoIGlzIGFsc28gdGhlCmxv
Y2F0aW9uIHdoZXJlIHN5c3RlbWQgaXRzZWxmIHBsYWNlcyBpdHMgb3duIHRtcGZpbGVzLCBhbmQg
d2hlcmUgd2UKYWxyZWFkeSBwdXQgYWxsIG91ciBvdGhlciB0bXBmaWxlcyAoc2VlIGF1ZGl0LCBh
dmFoaSwgY3J5cHRzZXR1cCwgZGhjcCwKbGlnaHR0cGQsIG5mcy11dGlscywgcXVhZ2dhLCBzYW1i
YTQsIHN3dXBkYXRlKSBhbmQgb3VyIGhhbmRsaW5nIG9mCnN5c3RlbWQncyBjYXRhbG9nIGZpbGVz
IHRvby4gV2UgYWxzbyByZW5hbWUgdGhlIGZpbGUgdG8gYSBiZXR0ZXIgbmFtZSwKc28gdGhhdCBp
dCBpcyBvYnZpb3VzIGl0IGlzIGdlbmVyYXRlZCBieSB1cyAoc3lzdGVtZCBhbHJlYWR5IGluc3Rh
bGxzIGEKdmFyLmNvbmYgb2YgaXRzIG93biwgc28gd2Ugd2FudCB0byBhdm9pZCBuYW1lIGNsYXNo
aW5nKS4KCkxhc3QgbGl0dGxlIGRldGFpbDogdGhlcmUgaXMgbm8gbmVlZCBvciByZWFzb24gdG8g
Y3JlYXRlIC4uLi90bXBmaWxlcy5kLwphdCBpbnN0YWxsIHRpbWU7IGl0IGlzIG9ubHkgbmVlZGVk
IGluIHRoZSByb290ZnMtcHJlLWNtZCBob29rLCBzbyB3ZQpvbmx5IGNyZWF0ZSBpdCBqdXN0IGJl
Zm9yZSB3ZSBuZWVkIGl0LgoKWzBdIGh0dHA6Ly8wcG9pbnRlci5kZS9ibG9nL3Byb2plY3RzL3N0
YXRlbGVzcy5odG1sCgpTaWduZWQtb2ZmLWJ5OiBZYW5uIEUuIE1PUklOIDx5YW5uLm1vcmluQG9y
YW5nZS5jb20+CkNjOiBOb3JiZXJ0IExhbmdlIDxub2xhbmdlNzlAZ21haWwuY29tPgpDYzogUm9t
YWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+CkNjOiBKZcyBcmXMgW15IFJvc2VuIDxq
ZXJlbXkucm9zZW5Ac21pbGUuZnI+Clt5YW5uLm1vcmluLjE5OThAZnJlZS5mcjoKICAtIHNwbGl0
IG9yaWdpbmFsIHBhdGNoIGluIHR3bwogIC0gdGhpcyBvbmUgb25seSBtb3ZlcyBvdXQgb2YgL2V0
YyBhbmQgaW50byAvdXNyL2xpYgogIC0gYWRhcHQgY29tbWl0IGxvZyBhY2NvcmRpbmdseQpdClNp
Z25lZC1vZmYtYnk6IFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPgotLS0K
IHBhY2thZ2Uvc2tlbGV0b24taW5pdC1zeXN0ZW1kL3NrZWxldG9uLWluaXQtc3lzdGVtZC5tayB8
IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9wYWNrYWdlL3NrZWxldG9uLWluaXQtc3lzdGVtZC9za2VsZXRvbi1pbml0
LXN5c3RlbWQubWsgYi9wYWNrYWdlL3NrZWxldG9uLWluaXQtc3lzdGVtZC9za2VsZXRvbi1pbml0
LXN5c3RlbWQubWsKaW5kZXggNzk1YTE3MTgwOS4uN2I2NjczMmVmNCAxMDA2NDQKLS0tIGEvcGFj
a2FnZS9za2VsZXRvbi1pbml0LXN5c3RlbWQvc2tlbGV0b24taW5pdC1zeXN0ZW1kLm1rCisrKyBi
L3BhY2thZ2Uvc2tlbGV0b24taW5pdC1zeXN0ZW1kL3NrZWxldG9uLWluaXQtc3lzdGVtZC5tawpA
QCAtMjksNyArMjksNiBAQCBlbHNlCiAjIGEgcmVhbCAoYnV0IGVtcHR5KSBkaXJlY3RvcnksIGFu
ZCB0aGUgImZhY3RvcnkgZmlsZXMiIHdpbGwgYmUgY29waWVkCiAjIGJhY2sgdGhlcmUgYnkgdGhl
IHRtcGZpbGVzLmQgbWVjaGFuaXNtLgogZGVmaW5lIFNLRUxFVE9OX0lOSVRfU1lTVEVNRF9ST09U
X1JPX09SX1JXCi0JbWtkaXIgLXAgJChUQVJHRVRfRElSKS9ldGMvc3lzdGVtZC90bXBmaWxlcy5k
CiAJZWNobyAiL2Rldi9yb290IC8gYXV0byBybyAwIDEiID4kKFRBUkdFVF9ESVIpL2V0Yy9mc3Rh
YgogCWVjaG8gInRtcGZzIC92YXIgdG1wZnMgbW9kZT0xNzc3IDAgMCIgPj4kKFRBUkdFVF9ESVIp
L2V0Yy9mc3RhYgogZW5kZWYKQEAgLTM4LDYgKzM3LDcgQEAgZGVmaW5lIFNLRUxFVE9OX0lOSVRf
U1lTVEVNRF9QUkVfUk9PVEZTX1ZBUgogCXJtIC1yZiAkKFRBUkdFVF9ESVIpL3Vzci9zaGFyZS9m
YWN0b3J5L3ZhcgogCW12ICQoVEFSR0VUX0RJUikvdmFyICQoVEFSR0VUX0RJUikvdXNyL3NoYXJl
L2ZhY3RvcnkvdmFyCiAJbWtkaXIgLXAgJChUQVJHRVRfRElSKS92YXIKKwlta2RpciAtcCAkKFRB
UkdFVF9ESVIpL3Vzci9saWIvdG1wZmlsZXMuZAogCWZvciBpIGluICQoVEFSR0VUX0RJUikvdXNy
L3NoYXJlL2ZhY3RvcnkvdmFyLyogXAogCQkgJChUQVJHRVRfRElSKS91c3Ivc2hhcmUvZmFjdG9y
eS92YXIvbGliLyogXAogCQkgJChUQVJHRVRfRElSKS91c3Ivc2hhcmUvZmFjdG9yeS92YXIvbGli
L3N5c3RlbWQvKjsgZG8gXApAQCAtNTEsNyArNTEsNyBAQCBkZWZpbmUgU0tFTEVUT05fSU5JVF9T
WVNURU1EX1BSRV9ST09URlNfVkFSCiAJCQlwcmludGYgIkMhICVzIC0gLSAtIC1cbiIgIiQke2p9
IiBcCiAJCQl8fCBleGl0IDE7IFwKIAkJZmk7IFwKLQlkb25lID4kKFRBUkdFVF9ESVIpL2V0Yy90
bXBmaWxlcy5kL3Zhci1mYWN0b3J5LmNvbmYKKwlkb25lID4kKFRBUkdFVF9ESVIpL3Vzci9saWIv
dG1wZmlsZXMuZC9idWlsZHJvb3QtZmFjdG9yeS5jb25mCiBlbmRlZgogU0tFTEVUT05fSU5JVF9T
WVNURU1EX1JPT1RGU19QUkVfQ01EX0hPT0tTICs9IFNLRUxFVE9OX0lOSVRfU1lTVEVNRF9QUkVf
Uk9PVEZTX1ZBUgogCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
