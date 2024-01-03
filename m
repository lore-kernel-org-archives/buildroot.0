Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F2CC3DA6E
	for <buildroot@archiver.kernel.org>; Wed,  3 Jan 2024 14:32:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D356404B5;
	Wed,  3 Jan 2024 14:32:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D356404B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gGgBaA2gfEmz; Wed,  3 Jan 2024 14:32:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6ED0441758;
	Wed,  3 Jan 2024 14:32:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6ED0441758
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9C37E1BF2B5
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 14:32:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 748BB41859
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 14:32:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 748BB41859
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wpBVtvWuMK2L for <buildroot@lists.busybox.net>;
 Wed,  3 Jan 2024 14:32:16 +0000 (UTC)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5C19E41830
 for <buildroot@buildroot.org>; Wed,  3 Jan 2024 14:32:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C19E41830
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1d4d4542526so2874715ad.0
 for <buildroot@buildroot.org>; Wed, 03 Jan 2024 06:32:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704292335; x=1704897135;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FjXZTR8E0Z0hWOXWcSL7FV3TzS84TybZ8vZ/qZeKHvo=;
 b=T+MsqujBbKniuTRMtLP1tIYcb2Z+3Xwlhkjv4P4W5Wz+aqEUUU/iwf6AGDxNfNC58k
 1aBfnX9GRrkzdtaUviKm/KsUHA+XDp0vrkKT2VrRwE4kNeM9aEfxDpm0P9P6WC+OcIzi
 154/7NTDXS65GuyUxS4BhJfLRrWwlTGmTAy4BIv5jysqHTuPwHWpojUyJv5ARcWZkoKO
 ZEr9x4xApyd0OcbfXuLdTT1wEPA7ugjZ7WuqaBS4CAbway2PeF+M8SOcGO+pmeXTjmB9
 6DWsKVILOFc28bihJxFuObbss5a7g+5LhN3D/Ohvc5lclUfsO/ur7slV7ysOMBSzHP/W
 g7Bg==
X-Gm-Message-State: AOJu0YwyOkxAU7HS5BbsHgQI6hXFiPOA4os0D9aRJJamKf0otSoZCL2G
 d/s81dazr6qCAkUuXd7rfhwE4lAo6MXKOEHx0jHAxXuWGiQ=
X-Google-Smtp-Source: AGHT+IFhobYG9+l3y8N9PpNvf1irpVoCDsW1ZxCzPIGVtKaxA/MRF/uZ01ihz6SB0mOr9qdPwSsR5Q==
X-Received: by 2002:a17:902:6e0f:b0:1d4:7381:dc33 with SMTP id
 u15-20020a1709026e0f00b001d47381dc33mr11380231plk.0.1704292335350; 
 Wed, 03 Jan 2024 06:32:15 -0800 (PST)
Received: from alesmao.newtesc.com ([187.120.6.114])
 by smtp.gmail.com with ESMTPSA id
 z20-20020a170902ee1400b001d3a9676973sm23875148plb.111.2024.01.03.06.32.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jan 2024 06:32:15 -0800 (PST)
From: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
To: buildroot@buildroot.org
Date: Wed,  3 Jan 2024 11:32:10 -0300
Message-ID: <20240103143210.902040-1-flavio.tapajos@newtesc.com.br>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=newtesc-com-br.20230601.gappssmtp.com; s=20230601; t=1704292335; x=1704897135;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FjXZTR8E0Z0hWOXWcSL7FV3TzS84TybZ8vZ/qZeKHvo=;
 b=NY2Ei/YwpQqsGY5b65the59DhYsiJ3DC+80CHUdbzysqE5dxBDSaQ+mq5hGrkCR3sm
 zT6TsSVTjF4Y4wdV22cLbLtgOzO23o2HkkjNYguQ1QRdjJTxghlZRCojwkzXMLYjZil1
 xwBxzYNKjmp5pxjv0Lbuy5RL/Ol5Q6dp8Kh8zaoZocZfvqfdoHgnIIkLWD+xeghvJ3sy
 cItYBJ6nA50gtpVxbWBDx4R43/x0G9B2M9oN4PDsrvUmOBO5K4z9X9EPBPkRiqtIpAsA
 qaKJq1PNFDox7db0p/F55Z2QGZQ9AS/tfdCPpeYmI0lGn9/krx69+L23g9xtOQSpkkqB
 uJ+Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=newtesc-com-br.20230601.gappssmtp.com
 header.i=@newtesc-com-br.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=NY2Ei/Yw
Subject: [Buildroot] [PATCH 1/1] configs/asus_tinker-s_rk3288: bump Linux to
 6.1.70
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
Cc: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogRmzDoXZpbyBUYXBhasOzcyA8ZmxhdmlvLnRhcGFqb3NAbmV3dGVzYy5j
b20uYnI+Ci0tLQogY29uZmlncy9hc3VzX3Rpbmtlci1zX3JrMzI4OF9kZWZjb25maWcgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9jb25maWdzL2FzdXNfdGlua2VyLXNfcmszMjg4X2RlZmNvbmZpZyBiL2NvbmZpZ3MvYXN1
c190aW5rZXItc19yazMyODhfZGVmY29uZmlnCmluZGV4IDAwYjQyOTkwZjguLmFkMmNjZWM5Zjkg
MTAwNjQ0Ci0tLSBhL2NvbmZpZ3MvYXN1c190aW5rZXItc19yazMyODhfZGVmY29uZmlnCisrKyBi
L2NvbmZpZ3MvYXN1c190aW5rZXItc19yazMyODhfZGVmY29uZmlnCkBAIC0yMyw3ICsyMyw3IEBA
IEJSMl9UQVJHRVRfVUJPT1RfU1BMX05BTUU9InNwbC91LWJvb3Qtc3BsLWR0Yi5iaW4gdHBsL3Ut
Ym9vdC10cGwuYmluIgogIyBLZXJuZWwKIEJSMl9MSU5VWF9LRVJORUw9eQogQlIyX0xJTlVYX0tF
Uk5FTF9DVVNUT01fVkVSU0lPTj15Ci1CUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OX1ZB
TFVFPSI2LjEuNjUiCitCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSI2LjEu
NzAiCiBCUjJfTElOVVhfS0VSTkVMX0RFRkNPTkZJRz0ibXVsdGlfdjciCiBCUjJfTElOVVhfS0VS
TkVMX0RUU19TVVBQT1JUPXkKIEJSMl9MSU5VWF9LRVJORUxfSU5UUkVFX0RUU19OQU1FPSJyazMy
ODgtdGlua2VyLXMiCi0tIAoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
