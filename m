Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E04C369B2
	for <buildroot@archiver.kernel.org>; Mon, 14 Apr 2025 14:12:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF9A780B54;
	Mon, 14 Apr 2025 14:12:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kmx5hxO21jS8; Mon, 14 Apr 2025 14:12:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7A66829B6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7A66829B6;
	Mon, 14 Apr 2025 14:12:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C1B2250
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 14:12:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5EA57829B1
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 14:12:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HSYkSybhvlrg for <buildroot@buildroot.org>;
 Mon, 14 Apr 2025 14:11:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7F96680C86
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F96680C86
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7F96680C86
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 14:11:59 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-39c30d9085aso2653838f8f.1
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 07:11:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744639917; x=1745244717;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d6pKZUgJUcpO2z2KCBdxK3hvaAsl3/8QQ9d26kVZKE4=;
 b=GkVlJYkrWJXli4ODJJopLcRK+vzeaWo73xEqFmTtK9rAYpfmRKtqBik8rV2KTfyDzN
 SoOEIPb1h9IernBpwAuULLCTWKko2vlAz4p9GiKsc3WCtUvgeRIhaFQOyCsDeEmYDwB4
 UDss5OH2Vo5fnIVj6kn2cbaGLWHKdyvRlYyOY/yvR7lCbWG4zdxYbfryQA3s3bCoYKfP
 B74rIoD2cz2XGu07KXbrJEkBG/jkPbrlpk8lhtzHOcRh7FYPzOCi/+apcxj18KazTQ/h
 JD9n+sDLXzA2YauRZUa6ip9pEoU3dVoda4BVBLz9aRLGVf5bXoKpfxnVhwUHd/NN74va
 X4Ag==
X-Gm-Message-State: AOJu0Yztm1g+VVzX8/CMeUHSpH9+KI6eLti7fQN23NCI1Gj88pOORbb9
 L1h8pKkC2SNgE5vE2LaFdTtERs4655IJGkyZHDobLS3USv++y4XBIr2l2BDTcCILNAHT2G4Ofbn
 suQCxng==
X-Gm-Gg: ASbGnctD9qf9wi+g6+f86G9uwI+FXaJaFiJMW6y2aVJb6ZZp2dUK72V/4jeDcqx6N0t
 S00tiJWuSuTk1KXdQa+qdyEVY3OvJgEDl2SXzp3yhjjaSr9q4NvAVKL9kcLMk8BOKk5+Ifq96qY
 nQU3BhIKrNXDKZQbtZ+2m0+ON2d4co5zDJlXpWEIetbMZACgoK1pGI4cVQNlLcwLLHxpd6Is1Tq
 m3SpczR/mODgmONQLo8v7Gcf1P5hStwhmLH8H5iNclQMycweP2NYC2nzwQ1TGYBcPuV+T2ileye
 ELDy23d356fArbGjLsr2Ok2jhSGo0wqLV/bn1EsukucSA+8P2AwsPnuseZ3J
X-Google-Smtp-Source: AGHT+IG//Td42OR7IWy5Bd63NqraUDlT4Aj+ReNeyCJ3evk7Mrfgg2zPLmoHHhU24ipPFSlMx2+EOw==
X-Received: by 2002:a05:6000:4304:b0:39c:dfb:9e8e with SMTP id
 ffacd0b85a97d-39ea51d3728mr8971027f8f.8.1744639917297; 
 Mon, 14 Apr 2025 07:11:57 -0700 (PDT)
Received: from debian-hp-1.fritz.box ([213.211.140.212])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae96cfdbsm11013641f8f.40.2025.04.14.07.11.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Apr 2025 07:11:56 -0700 (PDT)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon, 14 Apr 2025 16:11:48 +0200
Message-ID: <20250414141150.994811-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1744639917; x=1745244717; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=d6pKZUgJUcpO2z2KCBdxK3hvaAsl3/8QQ9d26kVZKE4=;
 b=H9WHpY/ciP2sqJLMtwd9sUcnfk66a2FdDmMSrPern6nhgB1LyjHDNAna3W3A/7V2xa
 BQ/D+j7Ma+q2HPoSDyCe9l0WpjsYTNB/QC1iC2pOqGVNWwMrIT8/t7BDpHtTZzikmQGu
 NM3FDIxuMnC1nbDEGnEslJsLulECHPSU6CmBb3c7KFtrexGBr7arSh6bFXQojoisuaHP
 NHeZforMibbNR2ZgEureDseQSXldVf5T3XSCWZQoopFoDPWpbDxpySGX+DwMyf2rf/IT
 pmAv7r0GoHvxTvCKMssHL7HeFgXLU7DYmzCuTf0EJFMbm6yyvAzkoSALfJ4SAzThfwgy
 UhMg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=H9WHpY/c
Subject: [Buildroot] [PATCH 1/1] package/apparmor: ignore CVE-2016-1585
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Q1ZFLTIwMTYtMTU4NSBpcyBmaXhlZCBpbiB0aGUgZm9sbG93aW5nIHZlcnNpb25zOgphcHBhcm1v
ciAzLjEuNiBodHRwczovL2dpdGxhYi5jb20vYXBwYXJtb3IvYXBwYXJtb3IvLS93aWtpcy9SZWxl
YXNlX05vdGVzXzMuMS42CmFwcGFybW9yIDMuMC4xMiBodHRwczovL2dpdGxhYi5jb20vYXBwYXJt
b3IvYXBwYXJtb3IvLS93aWtpcy9SZWxlYXNlX05vdGVzXzMuMC4xMgphcHBhcm1vciAyLjEzLjEw
IGh0dHBzOi8vZ2l0bGFiLmNvbS9hcHBhcm1vci9hcHBhcm1vci8tL3dpa2lzL1JlbGVhc2VfTm90
ZXNfMi4xMy4xMAoKU2VlIHRoZSBidWcgcmVwb3J0IGF0IFsxXSBhbmQgaW4gcGFydGljdWxhciB0
aGUgY29tbWVudCBhdCBbMl0uCgpUaGUgTlZEIENQRSBkb2VzIG5vdCBjb250YWluIHZlcnNpb24g
bnVtYmVycywgc28gb3VyIENWRSBjaGVja2VyIHN0aWxsCnJlcG9ydHMgaXQuClRoZSBpc3N1ZSB3
YXMgcmVwb3J0ZWQgdG8gdGhlIE5WRCBieSBlbWFpbCwgYnV0IGluIHRoZSBtZWFudGltZSBsZXQn
cwppZ25vcmUgaXQgdG8gcmVkdWNlIHRoZSBub2lzZSBpbiBvdXIgQ1ZFIGNoZWNrZXIuCgpbMV06
IGh0dHBzOi8vYnVncy5sYXVuY2hwYWQubmV0L2FwcGFybW9yLytidWcvMTU5NzAxNwpbMl06IGh0
dHBzOi8vYnVncy5sYXVuY2hwYWQubmV0L2FwcGFybW9yLytidWcvMTU5NzAxNy9jb21tZW50cy85
CgpTaWduZWQtb2ZmLWJ5OiBSYXBoYcOrbCBNw6lsb3R0ZSA8cmFwaGFlbC5tZWxvdHRlQG1pbmQu
YmU+Ci0tLQogcGFja2FnZS9hcHBhcm1vci9hcHBhcm1vci5tayB8IDQgKysrKwogMSBmaWxlIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvYXBwYXJtb3IvYXBw
YXJtb3IubWsgYi9wYWNrYWdlL2FwcGFybW9yL2FwcGFybW9yLm1rCmluZGV4IDYxZTYyYzc1MTUu
LjBmYTU2YTAwZjAgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvYXBwYXJtb3IvYXBwYXJtb3IubWsKKysr
IGIvcGFja2FnZS9hcHBhcm1vci9hcHBhcm1vci5tawpAQCAtMTQsNiArMTQsMTAgQEAgQVBQQVJN
T1JfTElDRU5TRSA9IEdQTC0yLjAKIEFQUEFSTU9SX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFIHBh
cnNlci9DT1BZSU5HLkdQTAogQVBQQVJNT1JfQ1BFX0lEX1ZFTkRPUiA9IGNhbm9uaWNhbAogCisj
IFRoZSBmb2xsb3dpbmcgQ1ZFIHdhcyBmaXhlZCBpbiAzLjEuNCBidXQgdGhlIE5WRCBDUEUgZG9l
cyBub3QKKyMgY29udGFpbiB2ZXJzaW9uIG51bWJlcnMKK0FQUEFSTU9SX0lHTk9SRV9DVkVTICs9
IENWRS0yMDE2LTE1ODUKKwogQVBQQVJNT1JfREVQRU5ERU5DSUVTID0gbGliYXBwYXJtb3IKIAog
QVBQQVJNT1JfVE9PTFMgPSBwYXJzZXIKLS0gCjIuNDkuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
