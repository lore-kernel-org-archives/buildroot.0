Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77408C3DA6E
	for <buildroot@archiver.kernel.org>; Wed,  3 Jan 2024 14:29:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C300F41749;
	Wed,  3 Jan 2024 14:29:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C300F41749
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yTriejlG8Lfh; Wed,  3 Jan 2024 14:29:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C38DE41758;
	Wed,  3 Jan 2024 14:29:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C38DE41758
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ABB2E1BF2B5
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 14:29:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 82A2041749
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 14:29:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82A2041749
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1bHtk6mJpaHt for <buildroot@lists.busybox.net>;
 Wed,  3 Jan 2024 14:29:16 +0000 (UTC)
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6665141758
 for <buildroot@buildroot.org>; Wed,  3 Jan 2024 14:29:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6665141758
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-6daa89a6452so836164b3a.2
 for <buildroot@buildroot.org>; Wed, 03 Jan 2024 06:29:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704292155; x=1704896955;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YkZOdqrzDn+fEZ/wIiF8HqUpttajkEGD5tNnaJf6o8E=;
 b=fZfQsKe2wzaEYxxPKe1OC+ym72zJJKrff7P2Y96N3WH1v+OdujKHqG6J44gcUa1qFa
 1WL90//cX1Lpe3wIc4J3eI7a+ZsQ0OHGgM/XLg6ifpZcqD4Ew4xUm5u1MDurp0gqxAX1
 gO3fbajMm8QK/WXATK0LbHIdXyftXDAyZut/7f7kOUK/hsQMU3dpKuypoZBqytmFTn1k
 31AO9VFoX4nTnVC2gD0lQupMPEwvPQWum0I8ixF6oHmMSSDoRAbGm+UsFZ0AbZBoD7dO
 ME8IwPkVxVImWs/ejTUQBsBy2ghlKn0V6RFAWDdgZ4DeC0HKK+peqQg4kxy8mTFUnNL8
 t8CQ==
X-Gm-Message-State: AOJu0YwrsiC2v698Gg/7EiC4Q8Osbv9wLUX5i6OsgDxce8Y4wNbX6Cgz
 SStI14TFQkQsLug9I2I4OMfIMkuA39gCPOIlw0fujBR1+c/m3g==
X-Google-Smtp-Source: AGHT+IEIdFsIKzM1ojTyLD988P6xMAt1rbtDlItI3fJfJYo5ZehwalAHwqvcrc0n4caI5dmkvjJZOA==
X-Received: by 2002:a05:6a00:708:b0:6d9:bc39:e5ac with SMTP id
 8-20020a056a00070800b006d9bc39e5acmr7039410pfl.6.1704292155161; 
 Wed, 03 Jan 2024 06:29:15 -0800 (PST)
Received: from alesmao.newtesc.com ([187.120.6.114])
 by smtp.gmail.com with ESMTPSA id
 le13-20020a056a004fcd00b006da13e27904sm11054045pfb.44.2024.01.03.06.29.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jan 2024 06:29:14 -0800 (PST)
From: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
To: buildroot@buildroot.org
Date: Wed,  3 Jan 2024 11:28:30 -0300
Message-ID: <20240103142831.901515-1-flavio.tapajos@newtesc.com.br>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=newtesc-com-br.20230601.gappssmtp.com; s=20230601; t=1704292155; x=1704896955;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YkZOdqrzDn+fEZ/wIiF8HqUpttajkEGD5tNnaJf6o8E=;
 b=qS/f+pSrPatEQ6ZgIApjJ/tPjmVLYmLTecvtXFSbF/XHs9XSW/ST2cAL7yDCZeVX0r
 gZRuigxQsmGPJt/wo7A6oPYe80+QVy6crfMFjFZ0hsorafClEHK/lbaSOc6QXcCesAjQ
 44Uf7iYrQ1D9kjtofvgmOXmp/yuxk0UuNx//1L8LA7zjJo9DrTDJMU/73CdwGX8L4i3S
 Pu6TlXK9puHE/Hfani3m/dv5MQfzMTrbSDwy3TOHKYWy5jTWMkwSeRQ5CUsF/saE+len
 ETPa4vhnGWTVSSw87oqZ/X46VL8Jbf8TGjPUyyQ6Ew7YV8bRyGk7telYYy22wu86LRpZ
 UAwQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=newtesc-com-br.20230601.gappssmtp.com
 header.i=@newtesc-com-br.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=qS/f+pSr
Subject: [Buildroot] [PATCH 1/2] package/python-sqlalchemy: bump version to
 2.0.25
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

U2lnbmVkLW9mZi1ieTogRmzDoXZpbyBUYXBhasOzcyA8ZmxhdmlvLnRhcGFqb3NAbmV3dGVzYy5j
b20uYnI+Ci0tLQogcGFja2FnZS9weXRob24tc3FsYWxjaGVteS9Db25maWcuaW4gICAgICAgICAg
ICAgIHwgMSArCiBwYWNrYWdlL3B5dGhvbi1zcWxhbGNoZW15L3B5dGhvbi1zcWxhbGNoZW15Lmhh
c2ggfCA0ICsrLS0KIHBhY2thZ2UvcHl0aG9uLXNxbGFsY2hlbXkvcHl0aG9uLXNxbGFsY2hlbXku
bWsgICB8IDQgKystLQogMyBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDQgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tc3FsYWxjaGVteS9Db25maWcuaW4g
Yi9wYWNrYWdlL3B5dGhvbi1zcWxhbGNoZW15L0NvbmZpZy5pbgppbmRleCBmN2VjM2E2YWQ0Li5m
MDVmZWU3YWIxIDEwMDY0NAotLS0gYS9wYWNrYWdlL3B5dGhvbi1zcWxhbGNoZW15L0NvbmZpZy5p
bgorKysgYi9wYWNrYWdlL3B5dGhvbi1zcWxhbGNoZW15L0NvbmZpZy5pbgpAQCAtMSw1ICsxLDYg
QEAKIGNvbmZpZyBCUjJfUEFDS0FHRV9QWVRIT05fU1FMQUxDSEVNWQogCWJvb2wgInB5dGhvbi1z
cWxhbGNoZW15IgorCXNlbGVjdCBCUjJfUEFDS0FHRV9QWVRIT05fVFlQSU5HX0VYVEVOU0lPTlMK
IAloZWxwCiAJICBTUUxBbGNoZW15IGlzIHRoZSBQeXRob24gU1FMIHRvb2xraXQgYW5kIE9iamVj
dCBSZWxhdGlvbmFsCiAJICBNYXBwZXIgdGhhdCBnaXZlcyBhcHBsaWNhdGlvbiBkZXZlbG9wZXJz
IHRoZSBmdWxsIHBvd2VyIGFuZApkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tc3FsYWxjaGVt
eS9weXRob24tc3FsYWxjaGVteS5oYXNoIGIvcGFja2FnZS9weXRob24tc3FsYWxjaGVteS9weXRo
b24tc3FsYWxjaGVteS5oYXNoCmluZGV4IDlmNDc5ZDhmN2IuLjZhODk0YmVlMjQgMTAwNjQ0Ci0t
LSBhL3BhY2thZ2UvcHl0aG9uLXNxbGFsY2hlbXkvcHl0aG9uLXNxbGFsY2hlbXkuaGFzaAorKysg
Yi9wYWNrYWdlL3B5dGhvbi1zcWxhbGNoZW15L3B5dGhvbi1zcWxhbGNoZW15Lmhhc2gKQEAgLTEs
NSArMSw1IEBACiAjIG1kNSwgc2hhMjU2IGZyb20gaHR0cHM6Ly9weXBpLm9yZy9weXBpL3NxbGFs
Y2hlbXkvanNvbgotbWQ1ICA1MjMxOGI4M2U4OTMxYzVmNWE0NTlmNTRmZTRiZTNlOCAgU1FMQWxj
aGVteS0xLjQuNDIudGFyLmd6Ci1zaGEyNTYgIDE3N2U0MTkxNGM0NzZlZDFlMWI3N2ZkMDU5NjZl
YTg4YzA5NDA1M2UxN2E4NTMwM2M0Y2UwMDdmODhlZmYzNjMgIFNRTEFsY2hlbXktMS40LjQyLnRh
ci5negorc2hhMjU2IGEyYzY5YTc2NjRmYjJkNTRiODY4MmRkNzc0YzNiNTRmNjdmODRmYTEyM2Nm
ODRkZGEyYTVmNDBkY2FhMDRlMDggIFNRTEFsY2hlbXktMi4wLjI1LnRhci5negorbWQ1IDdhYmZj
Mjk3MmQ3ZTE2MzE1YzhiNzQ5MmVhMGUwZmRiIFNRTEFsY2hlbXktMi4wLjI1LnRhci5negogIyBM
b2NhbGx5IGNvbXB1dGVkIHNoYTI1NiBjaGVja3N1bXMKIHNoYTI1NiAgODU5ZGVkMjVkYTM0YzFl
YjczZTZlNzM2ZGY0YzVmOGNlM2VkMmVkNTI5MDY2MzE3NmYwNmU3NzIwZDljOWEyMCAgTElDRU5T
RQpkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tc3FsYWxjaGVteS9weXRob24tc3FsYWxjaGVt
eS5tayBiL3BhY2thZ2UvcHl0aG9uLXNxbGFsY2hlbXkvcHl0aG9uLXNxbGFsY2hlbXkubWsKaW5k
ZXggYTk0YjllY2E5Mi4uNDAwYWQ5MmY2MyAxMDA2NDQKLS0tIGEvcGFja2FnZS9weXRob24tc3Fs
YWxjaGVteS9weXRob24tc3FsYWxjaGVteS5taworKysgYi9wYWNrYWdlL3B5dGhvbi1zcWxhbGNo
ZW15L3B5dGhvbi1zcWxhbGNoZW15Lm1rCkBAIC00LDkgKzQsOSBAQAogIwogIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMKIAotUFlUSE9OX1NRTEFMQ0hFTVlfVkVSU0lPTiA9IDEuNC40MgorUFlUSE9O
X1NRTEFMQ0hFTVlfVkVSU0lPTiA9IDIuMC4yNQogUFlUSE9OX1NRTEFMQ0hFTVlfU09VUkNFID0g
U1FMQWxjaGVteS0kKFBZVEhPTl9TUUxBTENIRU1ZX1ZFUlNJT04pLnRhci5negotUFlUSE9OX1NR
TEFMQ0hFTVlfU0lURSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNrYWdlcy9l
NC81Ni84ZWE4NWVhYWI3ZDkzYjU4ZjljMjEzYWQ4ZmM1ODgyODM4MTg5YTI5ZmM4Y2M0MDFkODA3
MTBhMTI5NjkKK1BZVEhPTl9TUUxBTENIRU1ZX1NJVEUgPSBodHRwczovL2ZpbGVzLnB5dGhvbmhv
c3RlZC5vcmcvcGFja2FnZXMvN2IvYmIvODViZDhlMjExZjU0OTgzZTkyN2M3Y2Q5YjJhZDY2Nzcz
ZmJlZjUwNzk1NzE1NmZjNzJlNDgxYTYyNjgxCiBQWVRIT05fU1FMQUxDSEVNWV9TRVRVUF9UWVBF
ID0gc2V0dXB0b29scwogUFlUSE9OX1NRTEFMQ0hFTVlfTElDRU5TRSA9IE1JVAogUFlUSE9OX1NR
TEFMQ0hFTVlfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UKLS0gCjIuNDMuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
