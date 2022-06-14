Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA75C433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Jun 2022 11:02:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2DECF40AA1;
	Tue, 14 Jun 2022 11:02:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QD__0Rp9r-XX; Tue, 14 Jun 2022 11:02:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 33AF940A80;
	Tue, 14 Jun 2022 11:02:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 00B1D1BF5DD
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 11:02:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F073A414C8
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 11:02:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uocQi9BPba_v for <buildroot@lists.busybox.net>;
 Tue, 14 Jun 2022 11:02:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AA41840047
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 11:02:35 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id s12so16444286ejx.3
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 04:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0tDxFZV57dyGUc2nxRk6f+RCGVe2x5lTvX7K+LVQQ4E=;
 b=bGHe8kZx/xH0JIdI+UrlBaQYjsfDp/Gc/p/WjBcPP4Zu6Z1KOZHs3k22zaE3UjepIe
 CC23JdZUQUk45xBkgAcijyHNN+EaKqFLp60Sut5AyM1TVvGSZSQMjkfUbb42ARDVHYi+
 Z/tQQQPoAJ0fQka5eUlDX3qYxB0Asq4hs7j+HVntIkPMBxx6737UHlGG2nRKEE4y9daq
 xClMA9G7lP3hAOcv6dfQNrpx5vPFuHS71rbxYvK85MC8eRQlnl3hRACnUvNx0RmIx3Cm
 82Tnppx2U1VxDL4Y6Uv0FxlzrwGmz8Opt0xAeDqj8/iY9OQLyxD9uT5YLw8Bijj2QOe/
 nkYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0tDxFZV57dyGUc2nxRk6f+RCGVe2x5lTvX7K+LVQQ4E=;
 b=o1Lzkl1OltwWlXRLMrOLTLY2b9rZPxr0J463ETnJt26CU0WgUjVSKit7zJE3V9B+Hj
 GPZDPGRYDPTe/QsHIkBXuHKia7nl8uKd4MqoyQ/JjJStCiK3eusEY7RMr4osKt4o6bmc
 5YhuVVMBKdSRH2409pQo/IvcAypVRttiNqdNrK1PbpIC05cYjm9wHmpE247ZuPJSqwGG
 XTRa11tfb/XFec8DpiFnX1sGciU7irYdodrF8cWGlcwvGM/eTQBUCrc0QtsqVkIi972u
 nsqpwOQyymqQbI/Huh6iwPF3yFX6KRMNRrAdZlwIXhcRgeT1yJCH+UNBzfbLRw2NrEkx
 akkA==
X-Gm-Message-State: AOAM530iwLkNj2w4Blh0K0qoTKeT7sSMIyhIacisQdI0o5us9qkP3Wuh
 yMK3ZFbl3dX+Pm3nsUodJqbENWkBcMTSZFen
X-Google-Smtp-Source: ABdhPJzRfNYDxNWajxeDFhsYAwoJzXDwGz6gOLxxdrVcUw0STPqtirw4ZWxh+UJEq2svFFhd8cc+QA==
X-Received: by 2002:a17:906:73de:b0:715:784d:2cdd with SMTP id
 n30-20020a17090673de00b00715784d2cddmr3728642ejl.273.1655204553489; 
 Tue, 14 Jun 2022 04:02:33 -0700 (PDT)
Received: from debian-hp-1.fritz.box ([213.211.139.153])
 by smtp.gmail.com with ESMTPSA id
 zj11-20020a170907338b00b006ff0fe78cb7sm4896325ejb.133.2022.06.14.04.02.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jun 2022 04:02:33 -0700 (PDT)
From: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
To: buildroot@buildroot.org
Date: Tue, 14 Jun 2022 13:02:09 +0200
Message-Id: <20220614110211.706283-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-rsa: bump to version 4.8
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
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

V2hpbGUgYXQgaXQsIHVwZGF0ZSB0aGUgaW5kZW50YXRpb24gb2YgdGhlIGxpY2Vuc2UgaGFzaCAo
dHdvIHNwYWNlcykuCgpDaGFuZ2Vsb2c6Cmh0dHBzOi8vZ2l0aHViLmNvbS9zeWJyZW5zdHV2ZWwv
cHl0aG9uLXJzYS9ibG9iL21haW4vQ0hBTkdFTE9HLm1kCgpTaWduZWQtb2ZmLWJ5OiBSYXBoYcOr
bCBNw6lsb3R0ZSA8cmFwaGFlbC5tZWxvdHRlQG1pbmQuYmU+Ci0tLQogcGFja2FnZS9weXRob24t
cnNhL3B5dGhvbi1yc2EuaGFzaCB8IDQgKystLQogcGFja2FnZS9weXRob24tcnNhL3B5dGhvbi1y
c2EubWsgICB8IDQgKystLQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tcnNhL3B5dGhvbi1yc2EuaGFz
aCBiL3BhY2thZ2UvcHl0aG9uLXJzYS9weXRob24tcnNhLmhhc2gKaW5kZXggOWZiYmYwYWM4OC4u
MmVhMTI0NTY2NyAxMDA2NDQKLS0tIGEvcGFja2FnZS9weXRob24tcnNhL3B5dGhvbi1yc2EuaGFz
aAorKysgYi9wYWNrYWdlL3B5dGhvbi1yc2EvcHl0aG9uLXJzYS5oYXNoCkBAIC0xLDUgKzEsNSBA
QAogIyBGcm9tIGh0dHBzOi8vcHlwaS5vcmcvcHJvamVjdC9yc2EvCi1zaGEyNTYgIDlkNjg5ZTZj
YTFiMzAzOGJjODJiZjhkMjNlOTQ0YjZiNjAzN2JjMDIzMDFhNTc0OTM1YjJkZDk0NmUwMzUzYjkg
IHJzYS00LjcuMi50YXIuZ3oKK3NoYTI1NiAgNWM2YmQ5ZGM3YTU0M2I3ZmU0MzA0YTYzMWY4YThh
M2I2NzRlMmJiZmM0OWMyYWU5NjIwMGNkYmU1NWRmNmIxNyAgcnNhLTQuOC50YXIuZ3oKIAogIyBM
b2NhbGx5IGNvbXB1dGVkCi1zaGEyNTYJMDczZjI4YjdkMzg5YzhmZTc0ZjYwN2UxN2MyN2Y4MWVh
YTVhY2U2OWVkYzQzYTg4NGYyM2Y0MWI0MWM1YzcyNiAgTElDRU5TRQorc2hhMjU2ICAwNzNmMjhi
N2QzODljOGZlNzRmNjA3ZTE3YzI3ZjgxZWFhNWFjZTY5ZWRjNDNhODg0ZjIzZjQxYjQxYzVjNzI2
ICBMSUNFTlNFCmRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1yc2EvcHl0aG9uLXJzYS5tayBi
L3BhY2thZ2UvcHl0aG9uLXJzYS9weXRob24tcnNhLm1rCmluZGV4IGEzZDRiYjgyMzUuLjBkZTM1
ZmU0M2UgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvcHl0aG9uLXJzYS9weXRob24tcnNhLm1rCisrKyBi
L3BhY2thZ2UvcHl0aG9uLXJzYS9weXRob24tcnNhLm1rCkBAIC00LDkgKzQsOSBAQAogIwogIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMKIAotUFlUSE9OX1JTQV9WRVJTSU9OID0gNC43LjIKK1BZVEhP
Tl9SU0FfVkVSU0lPTiA9IDQuOAogUFlUSE9OX1JTQV9TT1VSQ0UgPSByc2EtJChQWVRIT05fUlNB
X1ZFUlNJT04pLnRhci5negotUFlUSE9OX1JTQV9TSVRFID0gaHR0cHM6Ly9maWxlcy5weXRob25o
b3N0ZWQub3JnL3BhY2thZ2VzL2RiL2I1LzQ3NWM0NWE1ODY1MGIwNTgwNDIxNzQ2NTA0YjY4MGNk
MmRiNGU4MWJjOTQxZTk0Y2E1Mzc4NTI1MDI2OQorUFlUSE9OX1JTQV9TSVRFID0gaHR0cHM6Ly9m
aWxlcy5weXRob25ob3N0ZWQub3JnL3BhY2thZ2VzLzhjL2VlLzQwMjI1NDJlMGZlZDc3ZGQ2ZGRh
ZGUzOGUxZTRkZWEzMjk5Zjg3M2I3ZmQ0ZTZkNzgzMTk5NTNiMGY4MwogUFlUSE9OX1JTQV9TRVRV
UF9UWVBFID0gc2V0dXB0b29scwogUFlUSE9OX1JTQV9MSUNFTlNFID0gQXBhY2hlLTIuMAogUFlU
SE9OX1JTQV9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRQotLSAKMi4zNS4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
