Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E4FC0218D
	for <buildroot@archiver.kernel.org>; Wed, 29 Jan 2025 22:54:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37F1660865;
	Wed, 29 Jan 2025 22:54:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yhKHXgk09zDB; Wed, 29 Jan 2025 22:54:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77FB2608FE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77FB2608FE;
	Wed, 29 Jan 2025 22:54:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 11FE51DAA
 for <buildroot@buildroot.org>; Wed, 29 Jan 2025 22:54:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F3D8840235
 for <buildroot@buildroot.org>; Wed, 29 Jan 2025 22:54:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y5GoyfHp_qdp for <buildroot@buildroot.org>;
 Wed, 29 Jan 2025 22:54:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 77D7E415D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77D7E415D5
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 77D7E415D5
 for <buildroot@buildroot.org>; Wed, 29 Jan 2025 22:54:21 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4361f664af5so1290455e9.1
 for <buildroot@buildroot.org>; Wed, 29 Jan 2025 14:54:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738191259; x=1738796059;
 h=content-transfer-encoding:content-disposition:mime-version:reply-to
 :message-id:subject:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bq5HSBH3IUQQ6t95U9MV+TMJF2wzLuKzSVhBRPVa0Vk=;
 b=QZdTQ2vkbxOMLnXTbU0vFqMu/IEx/pCDdlZSbcETa5ZAKI3HeLBFLbIoTSu6h2laoC
 K7UyB6JyBDOxIqzlAQQk1GMhW/UJ/0xKtsFrB6vYW5U3BWX48oWEBsuuczxLUKzirKeL
 3gqjJCMDUptcCejGQ3Gonma0MsSVqPXs/5/hjvgbekdOqm6xEXnUMlqGoOqcQfKC3w/l
 Ac8w0wtFRCqcbq6TEPrxcXGrxFODiYc5gsjTBP1+53qx3K/i3ZkxOQwmMUhecSwCYiVz
 5abQmcmT+B/cLHzv8LmiUxi2yqVBppRVfPngnn573EylHlMFuH3vUTqT72boKUI8kZVK
 SpAg==
X-Gm-Message-State: AOJu0YzAIaAUIfgr0AqRFoUrIkbacggBGAY55Ijprpe6Tl+dUbiJykv1
 q92ycWVjCp0uZT/MT1VC0lmbkSXZsFPvF8M6+EX6SmnrOq3XTjPVRB8VHQ==
X-Gm-Gg: ASbGncvnBwdLgLoGcCiYQ0DuvMXR10tuoCd/XMY8JvcUvWTtknayKdWuIf3D1JGZYcE
 PIL/Zuvb7LZwv2/mPvXJP2KIQtJkBG3cWMf0GWSr21fSH2nHF2wD/36MoeZ7I/Emr2/NgngR2GH
 ztum7YxFNdCAM+HJPvfo/cdRbRUnZytTzAqia6U891z104gJvx6B+LirF3RQsegTzCfMHQcN5D8
 KUmuyPtWOoqG3xYwLIRzsZQ6iRnEdXEaCPwiq3VRXAWFbtxXQrUj156bQLsxRV4uoQWO+0ReFX3
 t7lQazpiiORiZHQtyio6
X-Google-Smtp-Source: AGHT+IE9ggnugrXU1TkYQwmVaOujZZc0BdL3rI/huORVjvPVKt+ERMAeIg62J79ZsG8s9+X50mDKfw==
X-Received: by 2002:a05:6000:1567:b0:38c:5bb2:b91a with SMTP id
 ffacd0b85a97d-38c5bb2bd03mr184775f8f.17.1738191259320; 
 Wed, 29 Jan 2025 14:54:19 -0800 (PST)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e23d42c7sm1834595e9.3.2025.01.29.14.54.18
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2025 14:54:18 -0800 (PST)
Date: Wed, 29 Jan 2025 23:54:16 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Message-ID: <20250129225416.GA453879@pevik>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738191259; x=1738796059; darn=buildroot.org;
 h=content-transfer-encoding:content-disposition:mime-version:reply-to
 :message-id:subject:to:from:date:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bq5HSBH3IUQQ6t95U9MV+TMJF2wzLuKzSVhBRPVa0Vk=;
 b=VFirKV5ihdwPc4fv0j3a9dzatJ7MeAJaKsO8xVdowc+oFc9tRzKGOgEI0//tFOS7ld
 gidNRI8jYI+s8SRpeUieO9WV5hiSxjcqQ98Gsnt/Z335UXmzjXqwaWSzaO35ud0tYwRo
 C4SBLo8Lq7uSaOCs35Mr/WfsPLP50cjkB89oJz3KwoNWc7NARRab/JoHsS5p6aleOESN
 39330MC4nd3qZlHYazOQgGBGd0ciPfUaUxeF67vz6xTmjEc9kuCtDzTbOHNtYvsk0PQc
 LJoWkcDmKW4z8mXqKpkJ5jmHJhzmveHYB7/p8/0HSjiOVYxiTBqZ3UXapm8uGsyjKgPD
 QxaA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=VFirKV5i
Subject: [Buildroot] LTP test fstatat01.c FTBFS on Buildroot
 bootlin-sh4-uclibc toolchain
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgYWxsLAoKTFRQIHRlc3QgZnN0YXRhdDAxLmMgWzFdIEZUQkZTIG9uIEJ1aWxkcm9vdCBib290
bGluLXNoNC11Y2xpYmMgdG9vbGNoYWluCih1Y2xpYmM6IDEuMC41MCwga2VybmVsIGhlYWRlcnM6
IDQuMTkuMjU1KS4gSXQgbG9va3MgdG8gbWUgdGhhdCBvdGhlciBib290bGluCnVjbGliYyBiYXNl
ZCB0b29sY2hhaW5zIGFyZSB3b3JraW5nLCB0aGVyZWZvcmUgaXQncyBwcm9iYWJseSBzaDQgcHJv
YmxlbS4KCkxvb2tpbmcgaW50byBpbmNsdWRlL3N5cy9zdGF0LmggaW4gdWNsaWJjLW5nIFsyXSwg
ZXh0ZXJuIGludCBmc3RhdGF0IChpbnQgX19mZCwKLi4uKSBkZWZpbml0aW9uIGlzIGd1YXJkZWQg
b25seSBieTogIyAgaWZkZWYgX19SRURJUkVDVF9OVEguCkJ1dCBpbiBnbGliYyBpby9zeXMvc3Rh
dC5oIFszXSBndWFyZGVzIGl0IHdpdGggIyAgaWZkZWYgX19VU0VfVElNRTY0X1JFRElSRUNUUwph
ZGRlZCBnbGliYyAyLjQwIGE0ZWQwNDcxZDcgKCJBbHdheXMgZGVmaW5lIF9fVVNFX1RJTUVfQklU
UzY0IHdoZW4gNjQgYml0IHRpbWVfdCBpcyB1c2VkIikKd2hpY2ggcmVwbGFjZWQgcHJldmlvdXMg
X19VU0VfVElNRV9CSVRTNjQgYWRkZWQgaW4gaW4gZ2xpYmMgMi4zNCA0N2YyNGMyMWVlIFs0XQoo
InkyMDM4OiBBZGQgc3VwcG9ydCBmb3IgNjQtYml0IHRpbWUgb24gbGVnYWN5IEFCSXMiKSBbNV0u
IFNob3VsZCBzaW1pbGFyIGNoYW5nZQpiZSBhZGRlZCB0byB1Y2xpYmMtbmc/CgpLaW5kIHJlZ2Fy
ZHMsClBldHIKCiQgY2Qgfi9ici10ZXN0LXBrZy9ib290bGluLXNoNC11Y2xpYmMvYnVpbGQvbHRw
LXRlc3RzdWl0ZS03Mjg3NTk1MDZjYmUwODYxMjE4MzI3NWIzNTQzMDA3ZDFjNDdmN2Y0L3Rlc3Rj
YXNlcy9rZXJuZWwvc3lzY2FsbHMvZnN0YXRhdAokIG1ha2UgVj0xIGZzdGF0YXQwMQpici10ZXN0
LXBrZy9ib290bGluLXNoNC11Y2xpYmMvaG9zdC9iaW4vc2g0LWxpbnV4LWdjYyAtRF9MQVJHRUZJ
TEVfU09VUkNFIC1EX0xBUkdFRklMRTY0X1NPVVJDRSAtRF9GSUxFX09GRlNFVF9CSVRTPTY0IC1E
X0ZPUlRJRllfU09VUkNFPTIgLUkuLi8uLi8uLi8uLi9pbmNsdWRlIC1JLi4vLi4vLi4vLi4vaW5j
bHVkZSAtSS4uLy4uLy4uLy4uL2luY2x1ZGUvb2xkLyAtRF9MQVJHRUZJTEVfU09VUkNFIC1EX0xB
UkdFRklMRTY0X1NPVVJDRSAtRF9GSUxFX09GRlNFVF9CSVRTPTY0ICAtTzIgLWcwICAtSWJyLXRl
c3QtcGtnL2Jvb3RsaW4tc2g0LXVjbGliYy9ob3N0L2Jpbi8uLi9zaDQtYnVpbGRyb290LWxpbnV4
LXVjbGliYy9zeXNyb290L3Vzci9pbmNsdWRlL3RpcnBjIC1nIC1PMiAtZm5vLXN0cmljdC1hbGlh
c2luZyAtcGlwZSAtV2FsbCAtVyAtV29sZC1zdHlsZS1kZWZpbml0aW9uIC1zdGQ9Z251OTkgLUwu
Li8uLi8uLi8uLi9saWIgZnN0YXRhdDAxLmMgIC1MYnItdGVzdC1wa2cvYm9vdGxpbi1zaDQtdWNs
aWJjL2hvc3QvYmluLy4uL3NoNC1idWlsZHJvb3QtbGludXgtdWNsaWJjL3N5c3Jvb3QvdXNyL2xp
YiAtbHRpcnBjIC1sZnRzIC1sbHRwIC1vIGZzdGF0YXQwMQpmc3RhdGF0MDEuYzo2Mzo1OiBlcnJv
cjogY29uZmxpY3RpbmcgdHlwZXMgZm9yIOKAmGZzdGF0YXTigJk7IGhhdmUg4oCYaW50KGludCwg
IGNvbnN0IGNoYXIgKiwgc3RydWN0IHN0YXQ2NCAqLCBpbnQp4oCZCiAgIDYzIHwgaW50IGZzdGF0
YXQoaW50IGRpcmZkLCBjb25zdCBjaGFyICpmaWxlbmFtZSwgc3RydWN0IHN0YXQ2NCAqc3RhdGJ1
ZiwgaW50IGZsYWdzKQogICAgICB8ICAgICBefn5+fn5+CkluIGZpbGUgaW5jbHVkZWQgZnJvbSBi
ci10ZXN0LXBrZy9ib290bGluLXNoNC11Y2xpYmMvaG9zdC9zaDQtYnVpbGRyb290LWxpbnV4LXVj
bGliYy9zeXNyb290L3Vzci9pbmNsdWRlL2ZlYXR1cmVzLmg6NDA5LAogICAgICAgICAgICAgICAg
IGZyb20gYnItdGVzdC1wa2cvYm9vdGxpbi1zaDQtdWNsaWJjL2hvc3Qvc2g0LWJ1aWxkcm9vdC1s
aW51eC11Y2xpYmMvc3lzcm9vdC91c3IvaW5jbHVkZS9zeXMvdHlwZXMuaDoyNiwKICAgICAgICAg
ICAgICAgICBmcm9tIGZzdGF0YXQwMS5jOjI3Ogpici10ZXN0LXBrZy9ib290bGluLXNoNC11Y2xp
YmMvaG9zdC9zaDQtYnVpbGRyb290LWxpbnV4LXVjbGliYy9zeXNyb290L3Vzci9pbmNsdWRlL3N5
cy9zdGF0Lmg6MjQzOjEyOiBub3RlOiBwcmV2aW91cyBkZWNsYXJhdGlvbiBvZiDigJhmc3RhdGF0
4oCZIHdpdGggdHlwZSDigJhpbnQoaW50LCAgY29uc3QgY2hhciAqIHJlc3RyaWN0LCAgc3RydWN0
IHN0YXQgKiByZXN0cmljdCwgIGludCnigJkKICAyNDMgfCBleHRlcm4gaW50IF9fUkVESVJFQ1Rf
TlRIIChmc3RhdGF0LCAoaW50IF9fZmQsIGNvbnN0IGNoYXIgKl9fcmVzdHJpY3QgX19maWxlLAog
ICAgICB8ICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn4KClsxXSBodHRwczovL2dpdGh1Yi5jb20v
bGludXgtdGVzdC1wcm9qZWN0L2x0cC9ibG9iL21hc3Rlci90ZXN0Y2FzZXMva2VybmVsL3N5c2Nh
bGxzL2ZzdGF0YXQvZnN0YXRhdDAxLmMKWzJdIGh0dHBzOi8vY2dpdC5vcGVuYWRrLm9yZy9jZ2kv
Y2dpdC91Y2xpYmMtbmcuZ2l0L3RyZWUvaW5jbHVkZS9zeXMvc3RhdC5oI24yNDcKWzNdIGh0dHBz
Oi8vc291cmNld2FyZS5vcmcvZ2l0Lz9wPWdsaWJjLmdpdDthPWJsb2I7Zj1pby9zeXMvc3RhdC5o
O2g9NGJlYTllOWE3Nzg1ZjUxYWY4ZWVmZDAzNTg3NGY0NzViOTJiYjI2ZDtoYj1IRUFEI2wyNjgK
WzRdIGh0dHBzOi8vc291cmNld2FyZS5vcmcvZ2l0Lz9wPWdsaWJjLmdpdDthPWNvbW1pdDtoPWE0
ZWQwNDcxZDcxNzM5OTI4YTBkMGZhMzI1OGIzZmYzYjE1OGU5YjkKWzVdIGh0dHBzOi8vc291cmNl
d2FyZS5vcmcvZ2l0Lz9wPWdsaWJjLmdpdDthPWNvbW1pdDtoPTQ3ZjI0YzIxZWUzODcwMWFlMjc1
YWE5ZTQ1MWY3MGZhM2U3NzQ3OGMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
