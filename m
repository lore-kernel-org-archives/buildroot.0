Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E9E2C3DA79
	for <buildroot@archiver.kernel.org>; Mon, 15 Jan 2024 18:10:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C73FC42228;
	Mon, 15 Jan 2024 18:10:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C73FC42228
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tLcbbdmVLT5A; Mon, 15 Jan 2024 18:10:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22DF4421D4;
	Mon, 15 Jan 2024 18:10:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22DF4421D4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D3C7A1BF32B
 for <buildroot@lists.busybox.net>; Mon, 15 Jan 2024 18:10:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B9D82614F9
 for <buildroot@lists.busybox.net>; Mon, 15 Jan 2024 18:10:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9D82614F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JtG3SSiaslXg for <buildroot@lists.busybox.net>;
 Mon, 15 Jan 2024 18:10:00 +0000 (UTC)
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 37DC06080B
 for <buildroot@buildroot.org>; Mon, 15 Jan 2024 18:09:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37DC06080B
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-6d9bc8939d0so5466892b3a.0
 for <buildroot@buildroot.org>; Mon, 15 Jan 2024 10:09:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705342197; x=1705946997;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DwlWDWBJmks4grnBrrc/EQ+/rtt008Uh+4CkRaJQkJI=;
 b=jAp574HvxVsgogpRRYhThj3Q8K9hxovhR1+TE8EggJ4dELuuhl1HUWwoQ2UguqvpNT
 W+c0T7TUJKZB1m4dL/eZe63OIaEXhRzgiLRdJLNaUoHcg1DUt0MY+RRhchyHTwN/hSjs
 +I6y8A3vHc6qpEHkj8Y4jort3IFSv+BR7ZnbX+evXrGw4sW58Uo+8cTDizWYiWe6B9Dk
 BdhdN/o9TR9PAxry6WfJzQmwJyyYOz9JTg9tFbI0B6Z/m4Eh0Cfu/NnmBpBtx98A4F37
 5rQM31vgxfj7o92sA7CduTWAnD2vhRuUFEG9WoE2HSaG1qXxH8Nyb/7kHWvca80muqyV
 OjyA==
X-Gm-Message-State: AOJu0YwtRlmvyHmcvtL/+aAahnQ+l2cDNs8icb07qBqt1oky4Lv7cPJS
 dgh6IjsVChu2Ndiu+MSwbLYZ1ubmLuthBrvvi73pxJ/nYBk=
X-Google-Smtp-Source: AGHT+IFmkMoCci+4zXcosStGemAOZwSPLtKEMfGU1OsVa16cRIU+Br3TallhpUpzuNTb0Gw8uc39Sw==
X-Received: by 2002:aa7:9f12:0:b0:6d9:b5ba:3ddb with SMTP id
 g18-20020aa79f12000000b006d9b5ba3ddbmr2730420pfr.11.1705342197290; 
 Mon, 15 Jan 2024 10:09:57 -0800 (PST)
Received: from alesmao.newtesc.com ([187.120.6.114])
 by smtp.gmail.com with ESMTPSA id
 ei6-20020a056a0080c600b006dae1c8c817sm7908460pfb.74.2024.01.15.10.09.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jan 2024 10:09:56 -0800 (PST)
From: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
To: buildroot@buildroot.org
Date: Mon, 15 Jan 2024 15:09:46 -0300
Message-ID: <20240115180946.1646186-1-flavio.tapajos@newtesc.com.br>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=newtesc-com-br.20230601.gappssmtp.com; s=20230601; t=1705342197; x=1705946997;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DwlWDWBJmks4grnBrrc/EQ+/rtt008Uh+4CkRaJQkJI=;
 b=E7Z7J24+kp8Z13+njedFfhdZIAB4FSqXzRUkjXCrOT2zHGKE/pfVop22krrdoqa2DO
 AcZdbMHsYdanfXIOyNHaKAG+T3JqwUWdPHBgN/JnmU3PwbK83RJ76jRo27mVtnWZ4uWP
 ktDe+yIcl0E+EGDE6dTS4bTN0o0C8AVdBXOstE6IUDZvWj+oRxO1IESz8qa+PvAbaAMh
 S9VgRSMllCVkyf8Xl5bGdps4Q98Mf+bXkU64FswO4jytUv61W99tYAUvB3Yl4wyiWm9H
 5HHj2CIkuWpa99Qg+Whl6tiqen6o6AaFa5W9SMOmr8fwDxur1jH3LSsD4qRwAPy+E+al
 9EcQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=newtesc-com-br.20230601.gappssmtp.com
 header.i=@newtesc-com-br.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=E7Z7J24+
Subject: [Buildroot] [PATCH 1/1] configs/asus_tinker-s_rk3288: bump Linux to
 6.1.72
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
c190aW5rZXItc19yazMyODhfZGVmY29uZmlnCmluZGV4IGZjMWIzYjM1MDUuLmRlMDMzMzZjYmIg
MTAwNjQ0Ci0tLSBhL2NvbmZpZ3MvYXN1c190aW5rZXItc19yazMyODhfZGVmY29uZmlnCisrKyBi
L2NvbmZpZ3MvYXN1c190aW5rZXItc19yazMyODhfZGVmY29uZmlnCkBAIC0yMyw3ICsyMyw3IEBA
IEJSMl9UQVJHRVRfVUJPT1RfU1BMX05BTUU9InNwbC91LWJvb3Qtc3BsLWR0Yi5iaW4gdHBsL3Ut
Ym9vdC10cGwuYmluIgogIyBLZXJuZWwKIEJSMl9MSU5VWF9LRVJORUw9eQogQlIyX0xJTlVYX0tF
Uk5FTF9DVVNUT01fVkVSU0lPTj15Ci1CUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OX1ZB
TFVFPSI2LjEuNzAiCitCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSI2LjEu
NzIiCiBCUjJfTElOVVhfS0VSTkVMX0RFRkNPTkZJRz0ibXVsdGlfdjciCiBCUjJfTElOVVhfS0VS
TkVMX0RUU19TVVBQT1JUPXkKIEJSMl9MSU5VWF9LRVJORUxfSU5UUkVFX0RUU19OQU1FPSJyazMy
ODgtdGlua2VyLXMiCi0tIAoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
