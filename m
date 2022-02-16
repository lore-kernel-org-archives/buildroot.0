Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3451C433EF
	for <buildroot@archiver.kernel.org>; Wed, 16 Feb 2022 13:32:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 383F94173B;
	Wed, 16 Feb 2022 13:32:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AKVTQZ2Yik2e; Wed, 16 Feb 2022 13:32:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6424041718;
	Wed, 16 Feb 2022 13:32:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DD9D81BF5A6
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 13:32:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA137402D0
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 13:32:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=googlemail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nX8J1M9IM6_k for <buildroot@lists.busybox.net>;
 Wed, 16 Feb 2022 13:32:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8ABBC40125
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 13:32:05 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id x5so3895122edd.11
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 05:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3ND9JzgVnB7NohV3NK3ELwXumZ+QLsfzubNgBqnB7fU=;
 b=SSfXPG9DfrJ9NViMR8PtTvMCixvfQZpQxtxDQTL/19+xL3LNtw5ZXJ1qkd2eYAgN/F
 B7L4yovDe30XyPlQugEmz1Q0dpwgVsy0OLjafDQnpxibk0R+1STm9tHlYpd4DbVi0+cg
 gbPj2U8CWuo1OXYkWzLiYlMmtfem2Jt6rJ8Jb8XW2V2jjWKyRIOEhq65xPo213XYH5GI
 wEUWgTHX/JPhROvWSTPFTa7+8Kylh0FDSYu1/mheoPHXe4FUhCX3ccw7pCAUeG4jjxEp
 UkAr5xnJB1Y8tW/t2W+XgaxJOii35ani7fk2Homo328zZECREykcUeyP2j4xBy4mV7Px
 D+Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3ND9JzgVnB7NohV3NK3ELwXumZ+QLsfzubNgBqnB7fU=;
 b=y7tclalFll9o4SEU2O/3Zd046omQ+CMawX/A5Dm82kyuOyNWZ3OeseSWr9bHyA9mct
 YMR5YtPWuAG9BPneXguwI928aSTKbG+qMBC8dJTlk3wwHYe/FXOZg3d6PygqBc6LkKRF
 a8IyDv+HTi1wHHZ87a8vG62OS7GLCBFX+Nl7deZRTRLnFOfQxXbkh23uywEnCUjTdWyA
 Jo9lfiBeQYLw/gq8T00Dz42dn0zkkl7wE8cgKJkpx5SgZeFcpyhc9/Ri3jHOgHBV6jTj
 ar3QGOj1a6vUv+Saa0JCBycFN7eUjIzhoMQJsZ8GE1g62mVSOlwtLKuWxUNwQOpV/nBs
 doow==
X-Gm-Message-State: AOAM532Y/Z+pQc5FslaSYKtblgWGpJbFhpxPJn/MlDaJcRviOuUCW4TD
 9ikSQk2XF5IU9tytEpPUwTHcu1KSwcTacQ==
X-Google-Smtp-Source: ABdhPJx3j+ka0meuHEhEzWPKIFT5TaKMACW/ISXq8bw0Zwll1LQIuzNiRKnbbIrXit5dh/akQPqMxw==
X-Received: by 2002:aa7:d1d7:0:b0:410:d6cf:82b2 with SMTP id
 g23-20020aa7d1d7000000b00410d6cf82b2mr2909600edp.193.1645018323492; 
 Wed, 16 Feb 2022 05:32:03 -0800 (PST)
Received: from development1.visionsystems.de (mail.visionsystems.de.
 [213.209.99.202])
 by smtp.gmail.com with ESMTPSA id b7sm1604061edv.58.2022.02.16.05.32.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 16 Feb 2022 05:32:02 -0800 (PST)
To: buildroot@buildroot.org
Date: Wed, 16 Feb 2022 14:31:40 +0100
Message-Id: <20220216133140.14668-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libusb: fix maybe-uninitialized error
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogWWVnb3IgWWVmcmVtb3YgPHllZ29yc2xpc3RzQGdvb2dsZW1haWwuY29tPgoKSW5pdGlh
bGl6ZSBhY3RpdmVfY29uZmlnIHRvIGFuIGludmFsaWQgdmFsdWUgdG8gYXZvaWQgdGhlIGZvbGxv
d2luZwpjb21waWxhdGlvbiBlcnJvcjoKCm9zL2xpbnV4X3VzYmZzLmM6IEluIGZ1bmN0aW9uIOKA
mG9wX2dldF9jb25maWd1cmF0aW9u4oCZOgpvcy9saW51eF91c2Jmcy5jOjE0NTI6MTI6IGVycm9y
OiDigJhhY3RpdmVfY29uZmln4oCZIG1heSBiZSB1c2VkIHVuaW5pdGlhbGl6ZWQgaW4gdGhpcyBm
dW5jdGlvbiBbLVdlcnJvcj1tYXliZS11bmluaXRpYWxpemVkXQogMTQ1MiB8ICAqY29uZmlnID0g
KHVpbnQ4X3QpYWN0aXZlX2NvbmZpZzsKClVwc3RyZWFtIFVSTDogaHR0cHM6Ly9naXRodWIuY29t
L2xpYnVzYi9saWJ1c2IvcHVsbC8xMDYyCgpTaWduZWQtb2ZmLWJ5OiBZZWdvciBZZWZyZW1vdiA8
eWVnb3JzbGlzdHNAZ29vZ2xlbWFpbC5jb20+Ci0tLQogLi4uX3VzYmZzLWZpeC1tYXliZS11bmlu
aXRpYWxpemVkLWVycm9yLnBhdGNoIHwgMzYgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNo
YW5nZWQsIDM2IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2xpYnVz
Yi8wMDAyLWxpbnV4X3VzYmZzLWZpeC1tYXliZS11bmluaXRpYWxpemVkLWVycm9yLnBhdGNoCgpk
aWZmIC0tZ2l0IGEvcGFja2FnZS9saWJ1c2IvMDAwMi1saW51eF91c2Jmcy1maXgtbWF5YmUtdW5p
bml0aWFsaXplZC1lcnJvci5wYXRjaCBiL3BhY2thZ2UvbGlidXNiLzAwMDItbGludXhfdXNiZnMt
Zml4LW1heWJlLXVuaW5pdGlhbGl6ZWQtZXJyb3IucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQK
aW5kZXggMDAwMDAwMDAwMC4uMTkyMTcyZTllYgotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2Uv
bGlidXNiLzAwMDItbGludXhfdXNiZnMtZml4LW1heWJlLXVuaW5pdGlhbGl6ZWQtZXJyb3IucGF0
Y2gKQEAgLTAsMCArMSwzNiBAQAorRnJvbSBiZWE1ODkxNTkxNDAyZjE0OTQwYTYwN2VhZmJkY2Qx
NjlmZjg4MjdmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogWWVnb3IgWWVmcmVtb3Yg
PHllZ29yc2xpc3RzQGdvb2dsZW1haWwuY29tPgorRGF0ZTogU3VuLCA2IEZlYiAyMDIyIDA3OjEy
OjE0ICswMTAwCitTdWJqZWN0OiBbUEFUQ0ggMi8yXSBsaW51eF91c2JmczogZml4IG1heWJlLXVu
aW5pdGlhbGl6ZWQgZXJyb3IKK01JTUUtVmVyc2lvbjogMS4wCitDb250ZW50LVR5cGU6IHRleHQv
cGxhaW47IGNoYXJzZXQ9VVRGLTgKK0NvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQKKwor
SW5pdGlhbGl6ZSBhY3RpdmVfY29uZmlnIHRvIGFuIGludmFsaWQgdmFsdWUgdG8gYXZvaWQgdGhl
IGZvbGxvd2luZworY29tcGlsYXRpb24gZXJyb3I6CisKK29zL2xpbnV4X3VzYmZzLmM6IEluIGZ1
bmN0aW9uIOKAmG9wX2dldF9jb25maWd1cmF0aW9u4oCZOgorb3MvbGludXhfdXNiZnMuYzoxNDUy
OjEyOiBlcnJvcjog4oCYYWN0aXZlX2NvbmZpZ+KAmSBtYXkgYmUgdXNlZCB1bmluaXRpYWxpemVk
IGluIHRoaXMgZnVuY3Rpb24gWy1XZXJyb3I9bWF5YmUtdW5pbml0aWFsaXplZF0KKyAxNDUyIHwg
ICpjb25maWcgPSAodWludDhfdClhY3RpdmVfY29uZmlnOworCitTaWduZWQtb2ZmLWJ5OiBZZWdv
ciBZZWZyZW1vdiA8eWVnb3JzbGlzdHNAZ29vZ2xlbWFpbC5jb20+CistLS0KKyBsaWJ1c2Ivb3Mv
bGludXhfdXNiZnMuYyB8IDIgKy0KKyAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKKworZGlmZiAtLWdpdCBhL2xpYnVzYi9vcy9saW51eF91c2Jmcy5jIGIvbGli
dXNiL29zL2xpbnV4X3VzYmZzLmMKK2luZGV4IGMzMDA2NzUuLjI4NWQ5Y2EgMTAwNjQ0CistLS0g
YS9saWJ1c2Ivb3MvbGludXhfdXNiZnMuYworKysrIGIvbGlidXNiL29zL2xpbnV4X3VzYmZzLmMK
K0BAIC0xNDI5LDcgKzE0MjksNyBAQCBzdGF0aWMgaW50IG9wX2dldF9jb25maWd1cmF0aW9uKHN0
cnVjdCBsaWJ1c2JfZGV2aWNlX2hhbmRsZSAqaGFuZGxlLAorIAl1aW50OF90ICpjb25maWcpCisg
eworIAlzdHJ1Y3QgbGludXhfZGV2aWNlX3ByaXYgKnByaXYgPSB1c2JpX2dldF9kZXZpY2VfcHJp
dihoYW5kbGUtPmRldik7CistCWludCBhY3RpdmVfY29uZmlnOworKwlpbnQgYWN0aXZlX2NvbmZp
ZyA9IC0xOyAvKiB0byBwbGVhc2UgY29tcGlsZXIgKi8KKyAJaW50IHI7CisgCisgCWlmIChwcml2
LT5zeXNmc19kaXIpIHsKKy0tIAorMi4xNy4wCisKLS0gCjIuMTcuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
