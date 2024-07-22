Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DE39C3DA59
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 15:36:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54E9F606BA;
	Mon, 22 Jul 2024 15:36:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WSY-EZjda-E6; Mon, 22 Jul 2024 15:36:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5253A606C2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5253A606C2;
	Mon, 22 Jul 2024 15:36:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5A1111BF2C0
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 15:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 46FC340243
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 15:36:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jE3MtuSpMnsj for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 15:36:38 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c30; helo=mail-oo1-xc30.google.com;
 envelope-from=flavio.tapajos@newtesc.com.br; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2DA614023E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DA614023E
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [IPv6:2607:f8b0:4864:20::c30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2DA614023E
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 15:36:36 +0000 (UTC)
Received: by mail-oo1-xc30.google.com with SMTP id
 006d021491bc7-5d31ef2c73cso2352764eaf.3
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 08:36:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721662595; x=1722267395;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EnzyGPFGdGf3VoT2hd9qaDVNTn0bD6wm3yaNqj+cVGU=;
 b=m1GgZd+LHUGMWJvAqdBtzEJs4poZdYMD/YgzkCsqw7nY/9Fh/KlY9OeFaRtOcBo8Tb
 JwRFs5JbHLmXVCSja740tMBiH4wNFyu403GZ0ez+EatBvbz62XtUUjuiwu3MpdCWydhm
 oYCQ5dUuQ7uesgScaCzSN2CGTXrjhXKY7nRzvW4/xSyZMkKo/1ekPfhW2tGn27LyZv6t
 eBmMXd4Ukb06/24Zd+gtWuD6bJbYVPUmPpZ1W+yu8ZjMLzifqpuvfEO3kMuPMCe3xzRJ
 Jp9iIWsWPeYmX48NgNmyyXN0ZaUpWE93F45w/7QKcCcqLUt9zVUmB3J6z8ZCQIlb2ZwR
 aOgg==
X-Gm-Message-State: AOJu0YxMmkgM5eMGmxmodtysUDhq/ehq5A0t1Mh82FLlP38NkUEvgvAW
 jjCqCklDUkU38uEGQ+ujSYF16z893OxXT2g2Y4FUnJ7hMJU7FHS29i2q/pJzlNqF2Bs1/RIFNvT
 fLiA=
X-Google-Smtp-Source: AGHT+IFN7hb44FguNwyIxp52zoTT01mdgQmP56vzAum4xX7creRTBY4e7aAmNbmRQBqFu/pGIci9iw==
X-Received: by 2002:a05:6358:33aa:b0:1aa:b0c4:7f8f with SMTP id
 e5c5f4694b2df-1acc5a621camr993710555d.6.1721662595272; 
 Mon, 22 Jul 2024 08:36:35 -0700 (PDT)
Received: from niltesque.newtesc.com.br ([187.120.6.114])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-79f0b0538bbsm4787707a12.24.2024.07.22.08.36.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 08:36:34 -0700 (PDT)
From: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
To: buildroot@buildroot.org
Date: Mon, 22 Jul 2024 12:36:28 -0300
Message-ID: <20240722153628.925918-1-flavio.tapajos@newtesc.com.br>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=newtesc-com-br.20230601.gappssmtp.com; s=20230601; t=1721662595; x=1722267395;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EnzyGPFGdGf3VoT2hd9qaDVNTn0bD6wm3yaNqj+cVGU=;
 b=NnjdxQVASPr3EWtgBsBoQk7TGtEyxs9hoxHu77XkYi16XPrbbLJNKdEZbIxGSFgKf4
 JfzM1Q/4i+XyAxF0swS9Muzmcruyffyr4g85ZlrjikNWoHk8+YgsdSyzFmylte4lyQmu
 lFlSoyWTJly7UdDCv8MtlMwzTWBKtCxf90teozuDAWztbSdxUGCaKkwIpkUT/tBERxuz
 yb1jy8T3CyXRmVdYXbNEszGJOpozu+woVQNN9UlcWd/NNi0u1ac3AkWd7WM79s8wCc9O
 VJCTVyoD6gnbJB5P7LWt/JDFxm/R0zRsRkIMy8XtTtc9KdfaMf2WOjfgA7/Cqbf2yL/t
 Ahpw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=newtesc.com.br
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=newtesc-com-br.20230601.gappssmtp.com
 header.i=@newtesc-com-br.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=NnjdxQVA
Subject: [Buildroot] [PATCH 1/1] package/python-sqlalchemy: bump version to
 2.0.31
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
b20uYnI+Ci0tLQogcGFja2FnZS9weXRob24tc3FsYWxjaGVteS9weXRob24tc3FsYWxjaGVteS5o
YXNoIHwgNCArKy0tCiBwYWNrYWdlL3B5dGhvbi1zcWxhbGNoZW15L3B5dGhvbi1zcWxhbGNoZW15
Lm1rICAgfCA0ICsrLS0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLXNxbGFsY2hlbXkvcHl0aG9uLXNx
bGFsY2hlbXkuaGFzaCBiL3BhY2thZ2UvcHl0aG9uLXNxbGFsY2hlbXkvcHl0aG9uLXNxbGFsY2hl
bXkuaGFzaAppbmRleCBkMDQ3NzE5ZDU0Li5hNDEzZmNjMjY2IDEwMDY0NAotLS0gYS9wYWNrYWdl
L3B5dGhvbi1zcWxhbGNoZW15L3B5dGhvbi1zcWxhbGNoZW15Lmhhc2gKKysrIGIvcGFja2FnZS9w
eXRob24tc3FsYWxjaGVteS9weXRob24tc3FsYWxjaGVteS5oYXNoCkBAIC0xLDUgKzEsNSBAQAog
IyBtZDUsIHNoYTI1NiBmcm9tIGh0dHBzOi8vcHlwaS5vcmcvcHlwaS9zcWxhbGNoZW15L2pzb24K
LW1kNSAgYzEzYTIxNjI2YzdhZTAwYjQyYTA4ODgwYWY1NzRlM2MgIFNRTEFsY2hlbXktMi4wLjMw
LnRhci5negotc2hhMjU2ICAyYjE3MDg5MTY3MzBmNDgzMGJjNjlkNmY0OWQzN2Y3Njk4YjViZDc1
MzBhY2E3ZjA0Zjc4NWY4ODQ5ZTk1MjU1ICBTUUxBbGNoZW15LTIuMC4zMC50YXIuZ3oKK21kNSAg
ZGZhNjg3NzAxZGRmMTQxNmNiYTE5MDI0ZTZmOWVjM2QgIFNRTEFsY2hlbXktMi4wLjMxLnRhci5n
egorc2hhMjU2ICBiNjA3NDg5ZGQ0YTU0ZGU1Njk4NGEwYzc2NTYyNDc1MDRiZDU1MjNkOWQwYmE3
OTlhZWY1OWQ0YWRkMDA5NDg0ICBTUUxBbGNoZW15LTIuMC4zMS50YXIuZ3oKICMgTG9jYWxseSBj
b21wdXRlZCBzaGEyNTYgY2hlY2tzdW1zCiBzaGEyNTYgIDNjMGY1OWFiODg3ZDA0MWRlNmE0ZTUy
ZmZlM2U5ZWRiNWQ5NTIyZGU5MDlmYWU5YTZjZDdhZGI2ZTdiZTMyOTMgIExJQ0VOU0UKZGlmZiAt
LWdpdCBhL3BhY2thZ2UvcHl0aG9uLXNxbGFsY2hlbXkvcHl0aG9uLXNxbGFsY2hlbXkubWsgYi9w
YWNrYWdlL3B5dGhvbi1zcWxhbGNoZW15L3B5dGhvbi1zcWxhbGNoZW15Lm1rCmluZGV4IGUxMTgw
YTRlMWEuLjU2N2ZmYmJiODcgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvcHl0aG9uLXNxbGFsY2hlbXkv
cHl0aG9uLXNxbGFsY2hlbXkubWsKKysrIGIvcGFja2FnZS9weXRob24tc3FsYWxjaGVteS9weXRo
b24tc3FsYWxjaGVteS5tawpAQCAtNCw5ICs0LDkgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjCiAKLVBZVEhPTl9TUUxBTENIRU1ZX1ZFUlNJT04gPSAyLjAuMzAKK1BZVEhPTl9TUUxBTENI
RU1ZX1ZFUlNJT04gPSAyLjAuMzEKIFBZVEhPTl9TUUxBTENIRU1ZX1NPVVJDRSA9IFNRTEFsY2hl
bXktJChQWVRIT05fU1FMQUxDSEVNWV9WRVJTSU9OKS50YXIuZ3oKLVBZVEhPTl9TUUxBTENIRU1Z
X1NJVEUgPSBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvMzYvZDAvMDEz
N2ViY2YwZGMyMzBjMmU4MmE2MjFiM2FmNzU1Yjg3ODhhMmE5ZGQ2ZmQxYjhjZDZkNWU3ZjZiMDBk
CitQWVRIT05fU1FMQUxDSEVNWV9TSVRFID0gaHR0cHM6Ly9maWxlcy5weXRob25ob3N0ZWQub3Jn
L3BhY2thZ2VzL2JhLzdkL2UzMzEyYWUzNzRmZTdhNGFmN2UxNDk0NzM1MTI1YTcxNGEwOTA3MzE3
YzgyOWFiOGQ4YTMxZDg5ZGVkNAogUFlUSE9OX1NRTEFMQ0hFTVlfU0VUVVBfVFlQRSA9IHNldHVw
dG9vbHMKIFBZVEhPTl9TUUxBTENIRU1ZX0xJQ0VOU0UgPSBNSVQKIFBZVEhPTl9TUUxBTENIRU1Z
X0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFCi0tIAoyLjQ1LjIKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
