Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 368B2C3DA4A
	for <buildroot@archiver.kernel.org>; Fri,  9 Aug 2024 15:37:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0C2A841C4;
	Fri,  9 Aug 2024 15:37:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JpSPbgASLaO6; Fri,  9 Aug 2024 15:37:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE426841B7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE426841B7;
	Fri,  9 Aug 2024 15:37:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DD50A1BF5DF
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 15:37:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA0C440CAB
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 15:37:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id adJOxJFbs2XJ for <buildroot@lists.busybox.net>;
 Fri,  9 Aug 2024 15:37:00 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com;
 envelope-from=flavio.tapajos@newtesc.com.br; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0F80940C13
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F80940C13
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0F80940C13
 for <buildroot@buildroot.org>; Fri,  9 Aug 2024 15:36:59 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-710bdddb95cso1475999b3a.3
 for <buildroot@buildroot.org>; Fri, 09 Aug 2024 08:36:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723217819; x=1723822619;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=74BKhZEeLjeI+BA2Bt6R8rdMb+eTvjdacyRnSoNTjfE=;
 b=dGBx8HinMyOIOz7FTnaVLsqo0satD0Je6L9fC6lnyDvkrnpHt7BvEJcT1ufTan5Dv4
 erelu16xZCUX5qqO7JXGixUsX2DwigMU4zzIBTeCKPCZpYVXP46nowAcm2g2DJUbtPQT
 VdNvmk8z/sGf2w8cT7ndbTuE7mKFF/+e/rNr40P2l6BOPRTUPMcqc3HHHpPJ3H7vIArO
 xH3k9I90eRMKlpwtBunPpg8HmFTEPQMVolvT1WYIwu1mTTDv7r39Kbt8JAd4OwE03fy8
 77ah5SHfUVpzMtCJ1qCuUztUqaumQiQcrxVbiahpWX9FMm1UKEmNM+OA8xeGZA0PVmEh
 tadg==
X-Gm-Message-State: AOJu0Yxqn7RXxK0+2xd4UItvFV6N9CyMCctWOdacQdJLa40R+KZlWXxl
 Vjej6FIoSck2LcNST6EvSOfbQzCqLPset3nm/Yjk+6xRWReM9X4XZXQUHZjocOS6H16oK4Q8MLb
 QmuY=
X-Google-Smtp-Source: AGHT+IFvJ8paMr0lYPT9XWkOd7lk95r0KnWatZSld29VkK9hS7bxM5knmI8jZH2Cc+e66KZyabeFsA==
X-Received: by 2002:a05:6a20:6f88:b0:1c0:e1a5:9583 with SMTP id
 adf61e73a8af0-1c89fce573bmr2659851637.17.1723217818870; 
 Fri, 09 Aug 2024 08:36:58 -0700 (PDT)
Received: from niltesque.newtesc.com.br ([187.120.6.114])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7b763a3c6bdsm9755778a12.43.2024.08.09.08.36.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Aug 2024 08:36:58 -0700 (PDT)
From: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
To: buildroot@buildroot.org
Date: Fri,  9 Aug 2024 12:36:46 -0300
Message-ID: <20240809153646.1800000-1-flavio.tapajos@newtesc.com.br>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=newtesc-com-br.20230601.gappssmtp.com; s=20230601; t=1723217819; x=1723822619;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=74BKhZEeLjeI+BA2Bt6R8rdMb+eTvjdacyRnSoNTjfE=;
 b=x7YFFYdihJNffgVIjZ2HkUTxR41mb0QjAyc9eiqdM6ZrUNGtWIuyNdTmxY9naeitom
 u8o1QJqrVWIrE5n9XUtmfdnATeziqNkA3ATO3/EbB4nzF0QZI1udtVkdaFvdRop8jF/F
 9RnqyZxmDxQzW4wZo10J6ayRj7VZJhPBSvT0dkNgU/hEKbvZRfTumKpw3Q8mMuxlVEUl
 mSLTltb0NfbKKlufphA8Wpm5pI1T0kMLeY2Dmh/K2vnjFBgVpkCZ+d7Rn5X1T6SXxxhy
 vQRmbymUK4az/uwOsZ9/9oeSyYWfTjHqpAofaUaShUh8OjSgXFkiJEvQexquBTMyEwXj
 0bXQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=newtesc.com.br
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=newtesc-com-br.20230601.gappssmtp.com
 header.i=@newtesc-com-br.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=x7YFFYdi
Subject: [Buildroot] [PATCH 1/1] package/python-sqlalchemy: bump version to
 2.0.32
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
bXkuaGFzaAppbmRleCBhNDEzZmNjMjY2Li5kOTIyN2YwNTI4IDEwMDY0NAotLS0gYS9wYWNrYWdl
L3B5dGhvbi1zcWxhbGNoZW15L3B5dGhvbi1zcWxhbGNoZW15Lmhhc2gKKysrIGIvcGFja2FnZS9w
eXRob24tc3FsYWxjaGVteS9weXRob24tc3FsYWxjaGVteS5oYXNoCkBAIC0xLDUgKzEsNSBAQAog
IyBtZDUsIHNoYTI1NiBmcm9tIGh0dHBzOi8vcHlwaS5vcmcvcHlwaS9zcWxhbGNoZW15L2pzb24K
LW1kNSAgZGZhNjg3NzAxZGRmMTQxNmNiYTE5MDI0ZTZmOWVjM2QgIFNRTEFsY2hlbXktMi4wLjMx
LnRhci5negotc2hhMjU2ICBiNjA3NDg5ZGQ0YTU0ZGU1Njk4NGEwYzc2NTYyNDc1MDRiZDU1MjNk
OWQwYmE3OTlhZWY1OWQ0YWRkMDA5NDg0ICBTUUxBbGNoZW15LTIuMC4zMS50YXIuZ3oKK21kNSAg
ZmQ5ZWQzODE0NGZjZTQ3OWVhOTZiNjYxZTA0OGEwMmYgIFNRTEFsY2hlbXktMi4wLjMyLnRhci5n
egorc2hhMjU2ICBjMWI4OGNjOGIwMmI2YTVmMGVmYjAzNDVhMDM2NzJkNGM4OTdkYzdkOTI1ODUx
NzZmODhjNjczNDZmNTY1ZWE4ICBTUUxBbGNoZW15LTIuMC4zMi50YXIuZ3oKICMgTG9jYWxseSBj
b21wdXRlZCBzaGEyNTYgY2hlY2tzdW1zCiBzaGEyNTYgIDNjMGY1OWFiODg3ZDA0MWRlNmE0ZTUy
ZmZlM2U5ZWRiNWQ5NTIyZGU5MDlmYWU5YTZjZDdhZGI2ZTdiZTMyOTMgIExJQ0VOU0UKZGlmZiAt
LWdpdCBhL3BhY2thZ2UvcHl0aG9uLXNxbGFsY2hlbXkvcHl0aG9uLXNxbGFsY2hlbXkubWsgYi9w
YWNrYWdlL3B5dGhvbi1zcWxhbGNoZW15L3B5dGhvbi1zcWxhbGNoZW15Lm1rCmluZGV4IDU2N2Zm
YmJiODcuLjNmNGUyMGU2NjkgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvcHl0aG9uLXNxbGFsY2hlbXkv
cHl0aG9uLXNxbGFsY2hlbXkubWsKKysrIGIvcGFja2FnZS9weXRob24tc3FsYWxjaGVteS9weXRo
b24tc3FsYWxjaGVteS5tawpAQCAtNCw5ICs0LDkgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjCiAKLVBZVEhPTl9TUUxBTENIRU1ZX1ZFUlNJT04gPSAyLjAuMzEKK1BZVEhPTl9TUUxBTENI
RU1ZX1ZFUlNJT04gPSAyLjAuMzIKIFBZVEhPTl9TUUxBTENIRU1ZX1NPVVJDRSA9IFNRTEFsY2hl
bXktJChQWVRIT05fU1FMQUxDSEVNWV9WRVJTSU9OKS50YXIuZ3oKLVBZVEhPTl9TUUxBTENIRU1Z
X1NJVEUgPSBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvYmEvN2QvZTMz
MTJhZTM3NGZlN2E0YWY3ZTE0OTQ3MzUxMjVhNzE0YTA5MDczMTdjODI5YWI4ZDhhMzFkODlkZWQ0
CitQWVRIT05fU1FMQUxDSEVNWV9TSVRFID0gaHR0cHM6Ly9maWxlcy5weXRob25ob3N0ZWQub3Jn
L3BhY2thZ2VzL2FmLzZmLzk2N2U5ODc2ODM5MDhhZjgxNmFhMzA3MmMxYTY5OTdhYzk5MzNjZjM4
ZDY2YjA0NzRmYjAzZjI1MzMyMwogUFlUSE9OX1NRTEFMQ0hFTVlfU0VUVVBfVFlQRSA9IHNldHVw
dG9vbHMKIFBZVEhPTl9TUUxBTENIRU1ZX0xJQ0VOU0UgPSBNSVQKIFBZVEhPTl9TUUxBTENIRU1Z
X0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFCi0tIAoyLjQ2LjAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
