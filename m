Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A009C5478C
	for <buildroot@archiver.kernel.org>; Fri, 23 Feb 2024 17:06:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1042B608A1;
	Fri, 23 Feb 2024 17:06:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nSsK0Zq4fSr3; Fri, 23 Feb 2024 17:06:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3911260A61
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3911260A61;
	Fri, 23 Feb 2024 17:06:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 69DA81BF423
 for <buildroot@lists.busybox.net>; Fri, 23 Feb 2024 17:06:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5732F820EF
 for <buildroot@lists.busybox.net>; Fri, 23 Feb 2024 17:06:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ej864-zUm5oi for <buildroot@lists.busybox.net>;
 Fri, 23 Feb 2024 17:06:17 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com;
 envelope-from=flavio.tapajos@newtesc.com.br; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7958C820EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7958C820EA
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7958C820EA
 for <buildroot@buildroot.org>; Fri, 23 Feb 2024 17:06:16 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1dc0e5b223eso8615835ad.1
 for <buildroot@buildroot.org>; Fri, 23 Feb 2024 09:06:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708707975; x=1709312775;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YbKcYV3T5MYWELogE4Lyyjabav0Rjesf2MbS4HfHcgY=;
 b=gSPPCZ6FRVzFg9SAal3BnsLxqiQc6dcZPmH/wAAEarbrcqA9UVtU4PCYKoZO5hzHiC
 u3vRQeAEhyOb2TNY2O69IAtzDygIvMrXOKAtn/GVc6I9Lj3+tYiWfDzDELVyyqfiu+kY
 FS4mBuPBewaZlTW0lF4OSmf8vnpRhowTCidhooneF9BnJlN34Ix2hJhqfTKotv/FEkrU
 w8mBPw5N1vjdnaOV9Y2DkcvlkGiVnRkJoHErHdhyufaqkKeHsyaGOtofNfOL2jCV0g38
 lDVSHTQ7NqyUVmGsRLBRkSw3NLUKYg/kCONsbPjJhqYGSDy5UHFtac1kG1okAkcGXk8c
 ZsoQ==
X-Gm-Message-State: AOJu0Yx0td9JId25MiN7tQ3yYh2drv9zAN/D1Xp9BucO2hqQqsUVRssF
 6fx50dPsMKVvA1U/looAtnnz/cNAxRNMQTFBBpGu8Fmyfxalqv5iKHQlWtLSfw+mQ4Vc62hYRwV
 Z7zyiLg==
X-Google-Smtp-Source: AGHT+IHjB4PB8DzAiGH/JPNfoFqTGq2o+dWTPRHEgVbZcyU87kde5ZUpwqtuqvigc8OQb+Ss+aczrw==
X-Received: by 2002:a17:903:1249:b0:1db:d2f7:68a4 with SMTP id
 u9-20020a170903124900b001dbd2f768a4mr422403plh.24.1708707975175; 
 Fri, 23 Feb 2024 09:06:15 -0800 (PST)
Received: from alesmao.newtesc.com ([187.120.6.114])
 by smtp.gmail.com with ESMTPSA id
 m20-20020a170902f21400b001d8e22d6a2dsm11885781plc.72.2024.02.23.09.06.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Feb 2024 09:06:14 -0800 (PST)
From: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
To: buildroot@buildroot.org
Date: Fri, 23 Feb 2024 14:05:59 -0300
Message-ID: <20240223170559.1252564-2-flavio.tapajos@newtesc.com.br>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240223170559.1252564-1-flavio.tapajos@newtesc.com.br>
References: <20240223170559.1252564-1-flavio.tapajos@newtesc.com.br>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=newtesc-com-br.20230601.gappssmtp.com; s=20230601; t=1708707975; x=1709312775;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YbKcYV3T5MYWELogE4Lyyjabav0Rjesf2MbS4HfHcgY=;
 b=CQ6nM5eFkOYaZ1etNgB6etzHeUa+oZRIo3Bc/XmRStXLCdSLJxQJrs+rNr0QVPGEYg
 sCoYzsdCIlKzEI4W/eQq3f1TMVQxqrtIzhUJHidMD1e4g/Mq4R5ZEhzxgrh7oMyOKr2B
 aVahHvXAN3J7GcMOUuT3MKpMWgqvZDfDVQ1fXNWU5VkWOs4/Yg2HtkQFdb188TDQi3IR
 mbFEa3bDBTaw/S39SLVRaHJUPNNvT0XOAiSZcZBoy+mXjHpe+uID107AfddeJS2pjgkX
 6oHwFt1KuoErOPb2RyOOeCxKqQJD/MNFePYbhAmegIhvSqu5oFY4aCYgURA+NQrnop4q
 fKJg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=newtesc.com.br
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=newtesc-com-br.20230601.gappssmtp.com
 header.i=@newtesc-com-br.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=CQ6nM5eF
Subject: [Buildroot] [PATCH 2/2] package/python-sqlalchemy: add cython for
 python-sqlalchemy
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

RnJvbTogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+CgpXaGVuIG1p
Z3JhdGluZyB0byBzZXR1cHRvb2xzIHdpdGggcGVwNTE3IHN1cHBvcnQgd2UgbmVlZCB0byBhZGQK
aG9zdC1weXRob24tY3l0aG9uIHdoaWNoIGlzIGEgcGVwNTE3IGJ1aWxkIGRlcGVuZGVuY3kgZm9y
CnB5dGhvbi1zcWxhbGNoZW15LgoKU2lnbmVkLW9mZi1ieTogSmFtZXMgSGlsbGlhcmQgPGphbWVz
LmhpbGxpYXJkMUBnbWFpbC5jb20+ClRlc3RlZC1CeTogRmzDoXZpbyBUYXBhasOzcyA8Zmxhdmlv
LnRhcGFqb3NAbmV3dGVzYy5jb20uYnI+Ci0tLQogcGFja2FnZS9weXRob24tc3FsYWxjaGVteS9w
eXRob24tc3FsYWxjaGVteS5tayB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
CgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tc3FsYWxjaGVteS9weXRob24tc3FsYWxjaGVt
eS5tayBiL3BhY2thZ2UvcHl0aG9uLXNxbGFsY2hlbXkvcHl0aG9uLXNxbGFsY2hlbXkubWsKaW5k
ZXggMTc3ZTdmOGEzOC4uMWZjZGEzMzhkMyAxMDA2NDQKLS0tIGEvcGFja2FnZS9weXRob24tc3Fs
YWxjaGVteS9weXRob24tc3FsYWxjaGVteS5taworKysgYi9wYWNrYWdlL3B5dGhvbi1zcWxhbGNo
ZW15L3B5dGhvbi1zcWxhbGNoZW15Lm1rCkBAIC0xMiw1ICsxMiw2IEBAIFBZVEhPTl9TUUxBTENI
RU1ZX0xJQ0VOU0UgPSBNSVQKIFBZVEhPTl9TUUxBTENIRU1ZX0xJQ0VOU0VfRklMRVMgPSBMSUNF
TlNFCiBQWVRIT05fU1FMQUxDSEVNWV9DUEVfSURfVkVORE9SID0gc3FsYWxjaGVteQogUFlUSE9O
X1NRTEFMQ0hFTVlfQ1BFX0lEX1BST0RVQ1QgPSBzcWxhbGNoZW15CitQWVRIT05fU1FMQUxDSEVN
WV9ERVBFTkRFTkNJRVMgPSBob3N0LXB5dGhvbi1jeXRob24KIAogJChldmFsICQocHl0aG9uLXBh
Y2thZ2UpKQotLSAKMi40My4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
