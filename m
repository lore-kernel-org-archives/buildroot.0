Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E2C6CCD190
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 19:31:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D786C41145;
	Thu,  9 Oct 2025 19:31:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cJZ6Mapg8k_J; Thu,  9 Oct 2025 19:31:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4820640E7D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4820640E7D;
	Thu,  9 Oct 2025 19:31:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3FA5014B
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 19:31:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 24C6D613A2
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 19:31:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gzotTqERgpgd for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 19:31:23 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com;
 envelope-from=flavio.tapajos@newtesc.com.br; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 35CD66139F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35CD66139F
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 35CD66139F
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 19:31:22 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-77f67ba775aso1996179b3a.3
 for <buildroot@buildroot.org>; Thu, 09 Oct 2025 12:31:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760038282; x=1760643082;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jdKwr9kowCzTlRHw6k/ylEmgZkBeHL+9ESfY8fhHsQY=;
 b=l0GDo0EAWe2EzpSI56CYqa6Tm7t9pVU8yCfDbi8ViOZcSUZBR9CHeUwH8r/yHJph1J
 IKdYlU5o+rnfoB85KXwU7/6RVYykA+N5Lb9l7Q7hnDQFK3UZb7aSlxbYpj9PwRgRYmAH
 hkT8m1/l6g60dGtVS/BprKdY3Tnbh6t0s7og8/87YPUSrLjf/aoyf3JMNI2+FB9mODAm
 VHKU1vT7hZFxYTHbOZncZXqLKhbq/Br5av9FHmZrvUgQ6Vqc0sHyT4zR/uUYCNqjl0a8
 rmMr/F5CLoAYhcp458EFh+/innFprlqmJmqeG9YrVgfBT0CVfGZav8tG0RNpsj1EtjGp
 pzhg==
X-Gm-Message-State: AOJu0YzvERdJ6Y6GyVxaSNZjaYnSTtwR+F10VRAQ7lXlW/p4qbP16iRO
 iIYDUCTPuPFbZQczgE/b0ljZ9+8TBUPkgf+Ab27TGSjDguoz1gcGwxde+aBb78E3ekgAhN9R4TR
 aTpxO4R4=
X-Gm-Gg: ASbGncsmwiM3oZ61P9PCDFt0RfvitCW9dF3u49w8zZJF2wXul+Pl2zHWEPVrZA4EFTm
 IcPtlZCBEu0TdCAETOoAqVnmY8yfa5zRk8pF4F7M2CZexQaRm+OTH9zdPk3lCzRP1NA9LDfk4k/
 DrHjCJacEtyRZRUviB+yUPmC+87Os38wTUJol/GwsWuQr79FJdXMYawBN0hjAkUNi0OaaQKJnJw
 wP4jmQvvxoJcFk59Qc85cp+Ia+9RdBAO8niT6usRdmfVmj2JWr8kSTxhZt+yefP0qU7tmPN6ssl
 qW+spsGRUGSy4l+86Hdl87apJOU2rBdmPZhz15A9dQRyXbf6+6FAh9TWsbGPjGvp0i6qMJQEXvQ
 Org78ptY7z04qkIviYCWN+HMN/KpD3s+J5V/Tfw1Z9K2TX2/3qvUrlITCcdmdXdlt8O+S
X-Google-Smtp-Source: AGHT+IEyG+Vtb1PEPDlRf7PGPyn04o6d5hCf+uYYR+YIgecpDQocc4SaqmVfqy8pkN/8mXBcyTCJcw==
X-Received: by 2002:a05:6a00:39aa:b0:793:11fc:783f with SMTP id
 d2e1a72fcca58-79387a21bd2mr10825702b3a.29.1760038281476; 
 Thu, 09 Oct 2025 12:31:21 -0700 (PDT)
Received: from niltesque ([189.113.44.122]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7992dc86a93sm491888b3a.75.2025.10.09.12.31.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 12:31:20 -0700 (PDT)
From: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
To: buildroot@buildroot.org
Date: Thu,  9 Oct 2025 16:31:14 -0300
Message-ID: <20251009193114.1950801-1-flavio.tapajos@newtesc.com.br>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=newtesc-com-br.20230601.gappssmtp.com; s=20230601; t=1760038282; x=1760643082;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jdKwr9kowCzTlRHw6k/ylEmgZkBeHL+9ESfY8fhHsQY=;
 b=VnMAiU+XmJbeJdMmwOMZ2TMfQdvUogf2+q9tD1lUk8gWdBYWW7SQxA+TsGK3pvg3xi
 M/CgcP/f2rodBCPi0ySMQQjtMINupsWsGY85wFMJlwlstyfbrxAswIIb6j+Ez1AY+10w
 nG2DcMQW7x3lT9caf7jiuGBGG8J9mZwkoM6cUC9c7EKFbf0HQGUZ3qMkxfgOn7tVlReL
 n7MiJY7yyEQ5z/I7QyYfr9x63qbl8CIh5dLmSMZ3UYDOr33mGVvLY0I2oYSUSfhFb1o8
 D6U5qCLXzrmlOjHKloIDpfsYId2zACsRV6B7NQNVuKcuxX2iKVAmi0c00iOBZtoiY1vf
 zWmg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=newtesc.com.br
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=newtesc-com-br.20230601.gappssmtp.com
 header.i=@newtesc-com-br.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=VnMAiU+X
Subject: [Buildroot] [PATCH 1/1] package/python-sqlalchemy: bump to version
 2.0.43
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
Cc: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rm9yIGNoYW5nZSBsb2csIHNlZToKaHR0cHM6Ly9kb2NzLnNxbGFsY2hlbXkub3JnL2VuLzIwL2No
YW5nZWxvZy9jaGFuZ2Vsb2dfMjAuaHRtbCNjaGFuZ2UtMi4wLjQyCmh0dHBzOi8vZG9jcy5zcWxh
bGNoZW15Lm9yZy9lbi8yMC9jaGFuZ2Vsb2cvY2hhbmdlbG9nXzIwLmh0bWwjY2hhbmdlLTIuMC40
MwoKU2lnbmVkLW9mZi1ieTogRmzDoXZpbyBUYXBhasOzcyA8ZmxhdmlvLnRhcGFqb3NAbmV3dGVz
Yy5jb20uYnI+Ci0tLQogcGFja2FnZS9weXRob24tc3FsYWxjaGVteS9weXRob24tc3FsYWxjaGVt
eS5oYXNoIHwgNCArKy0tCiBwYWNrYWdlL3B5dGhvbi1zcWxhbGNoZW15L3B5dGhvbi1zcWxhbGNo
ZW15Lm1rICAgfCA0ICsrLS0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLXNxbGFsY2hlbXkvcHl0aG9u
LXNxbGFsY2hlbXkuaGFzaCBiL3BhY2thZ2UvcHl0aG9uLXNxbGFsY2hlbXkvcHl0aG9uLXNxbGFs
Y2hlbXkuaGFzaAppbmRleCA5M2Y2YmIzNWFiLi44YzY4ODkxNGFhIDEwMDY0NAotLS0gYS9wYWNr
YWdlL3B5dGhvbi1zcWxhbGNoZW15L3B5dGhvbi1zcWxhbGNoZW15Lmhhc2gKKysrIGIvcGFja2Fn
ZS9weXRob24tc3FsYWxjaGVteS9weXRob24tc3FsYWxjaGVteS5oYXNoCkBAIC0xLDUgKzEsNSBA
QAogIyBtZDUsIHNoYTI1NiBmcm9tIGh0dHBzOi8vcHlwaS5vcmcvcHlwaS9zcWxhbGNoZW15L2pz
b24KLW1kNSAgNzZhZGU4YjEzZjc3YjljZWFmZjZjOTFmNTYxN2M2NjggIHNxbGFsY2hlbXktMi4w
LjQxLnRhci5negotc2hhMjU2ICBlZGJhNzAxMThjNGJlM2MyYjFmOTA3NTRkMzA4ZDBiNzljNmZl
MmMwZmRjNTJkOGRkZjYwMzkxNmY4M2Y0ZGI5ICBzcWxhbGNoZW15LTIuMC40MS50YXIuZ3oKK21k
NSAgYTAwNmMwNDViMWE1NjEwZGJhMDgzYWIzYWU1ZGQ5OTEgIHNxbGFsY2hlbXktMi4wLjQzLnRh
ci5negorc2hhMjU2ICA3ODhiZmNlZjY3ODdhNzc2NDE2OWNmZTk4NTlmZTQyNWJmNDQ1NTk2MTll
MWQ5ZjU2ZjViZGRmMmViZjZmNDE3ICBzcWxhbGNoZW15LTIuMC40My50YXIuZ3oKICMgTG9jYWxs
eSBjb21wdXRlZCBzaGEyNTYgY2hlY2tzdW1zCiBzaGEyNTYgIDk4MjE3MjBiNThkNGE1NjViNjEz
MjEwMDdhOGFkNDNhYjY5OTFhMzk1OWU2NmNkNWRiNGRkOWVhZTY5YzdkZmMgIExJQ0VOU0UKZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLXNxbGFsY2hlbXkvcHl0aG9uLXNxbGFsY2hlbXkubWsg
Yi9wYWNrYWdlL3B5dGhvbi1zcWxhbGNoZW15L3B5dGhvbi1zcWxhbGNoZW15Lm1rCmluZGV4IDEw
YTlmMTZiNjYuLjczM2QyN2FlNjkgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvcHl0aG9uLXNxbGFsY2hl
bXkvcHl0aG9uLXNxbGFsY2hlbXkubWsKKysrIGIvcGFja2FnZS9weXRob24tc3FsYWxjaGVteS9w
eXRob24tc3FsYWxjaGVteS5tawpAQCAtNCw5ICs0LDkgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjCiAKLVBZVEhPTl9TUUxBTENIRU1ZX1ZFUlNJT04gPSAyLjAuNDEKK1BZVEhPTl9TUUxB
TENIRU1ZX1ZFUlNJT04gPSAyLjAuNDMKIFBZVEhPTl9TUUxBTENIRU1ZX1NPVVJDRSA9IHNxbGFs
Y2hlbXktJChQWVRIT05fU1FMQUxDSEVNWV9WRVJTSU9OKS50YXIuZ3oKLVBZVEhPTl9TUUxBTENI
RU1ZX1NJVEUgPSBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvNjMvNjYv
NDViMTY1YzU5NWVjODlhYTdkY2MyYzFjZDIyMmFiMjY5YmM3NTNmMWZjN2ExZTY4Zjg0ODFiZDk1
N2JmCitQWVRIT05fU1FMQUxDSEVNWV9TSVRFID0gaHR0cHM6Ly9maWxlcy5weXRob25ob3N0ZWQu
b3JnL3BhY2thZ2VzL2Q3L2JjL2Q1OWI1ZDk3ZDI3MjI5YjBlMDA5YmQ5MDk4Y2Q4MWFmNzFjMmZh
NTU0OWM1ODBhMGE2N2I5YmVkMDQ5NgogUFlUSE9OX1NRTEFMQ0hFTVlfU0VUVVBfVFlQRSA9IHNl
dHVwdG9vbHMKIFBZVEhPTl9TUUxBTENIRU1ZX0xJQ0VOU0UgPSBNSVQKIFBZVEhPTl9TUUxBTENI
RU1ZX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFCi0tIAoyLjUxLjAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
