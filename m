Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71531CF3959
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 15:00:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08D444284D;
	Thu, 19 Sep 2024 15:00:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PUJKktEX4QZv; Thu, 19 Sep 2024 15:00:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF9B842892
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF9B842892;
	Thu, 19 Sep 2024 15:00:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B4B2B1BF279
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 15:00:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A375184A0B
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 15:00:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1OJioakW_H8D for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 15:00:49 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com;
 envelope-from=flavio.tapajos@newtesc.com.br; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1D78384A08
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D78384A08
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1D78384A08
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 15:00:48 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-7ae3d7222d4so778229a12.3
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 08:00:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726758047; x=1727362847;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=beJXW9xX7t10PysrXvCsBwY5DxKELfljufx3UtiZt0U=;
 b=tWDk9ueBfNSJ3YXuozzklk1BcDl8H8ivx3hGdC5JCD+9LVWPPacee/YbKL/elaah4v
 POtKa5rnsRRnouI9SThSSFj6bDKvjL5BWCbOJa2LugBOrQrvKjcIu4eiE7OZ3UpmQ7uu
 ZfrIFMjIcYgKwiPMT84ODXCMJTlaMktWDQoufBmQqGGtejvq1RnlW/89iudKFqu3gL7O
 ziJ9thKY4AgQHqnsQz3aBS3X+Vyked4QTGfoCxCj+zKSp8cATUJ6W+YuYRCI4KzcpwMy
 jacrOx+FbxXJ3XxmXAjt9SkhYWarb4BuO66TXQdRxWX5ZGn0bwDRAaBNy0/70EB7HHHT
 bpcA==
X-Gm-Message-State: AOJu0YzicP90AE51jTH7xdgNLkRYNZfYyb8GE4+vLt1k2gdl9xIPggHf
 xdCbMGWa4i01gEzL8ti10JNo403sUbV0ndQPyzRP9RyfT7TxNHUkbHXYepgpNF9zgaee36hRXpZ
 /Wv7eNA==
X-Google-Smtp-Source: AGHT+IE1imF8XJmLTXW45C5O7ZqWb2ZiOMbmpVRpcQfrcUuOk2QzdfwDci1VGepQMbSYNpnk6XE7Tg==
X-Received: by 2002:a05:6a20:e18a:b0:1d2:e78a:cab with SMTP id
 adf61e73a8af0-1d2e78a12b1mr14035751637.35.1726758047412; 
 Thu, 19 Sep 2024 08:00:47 -0700 (PDT)
Received: from niltesque.newtesc.com.br ([189.113.44.122])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71944ac99fesm8354043b3a.86.2024.09.19.08.00.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2024 08:00:46 -0700 (PDT)
From: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 12:00:41 -0300
Message-ID: <20240919150041.49152-1-flavio.tapajos@newtesc.com.br>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=newtesc-com-br.20230601.gappssmtp.com; s=20230601; t=1726758047; x=1727362847;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=beJXW9xX7t10PysrXvCsBwY5DxKELfljufx3UtiZt0U=;
 b=X/I1/+eIP0UK2cqk/frR/pN/cHIpSNfN4q+QVbsXDDyGye8ga6i/yxPIxacWSvVWiZ
 tTYnDbiuf62BOKQz9qtZkyhMP1UnwulWQIPq4BtXJsK2ANLF9lxtHKz8cXjLUDewNWP+
 NMoWm2/VMzfGcnO/rNxInbD2xPUZfQI9lv5PiSBo1VGykUxB7SSLmQCYRroIVLKe90YL
 uXpVHCCcWAFGfcxLtuk/3Ta2SrE+OPAl82nmmaGlQsooGTWQg0M6mDG6REOvSS1VA/RT
 JxIw904QTwylt+UYI530VNFr6E7t7nS1hHFlGkRG0mR5MTtIKJHU28kZ11TmSZFwVxqo
 z8Gw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=newtesc.com.br
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=newtesc-com-br.20230601.gappssmtp.com
 header.i=@newtesc-com-br.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=X/I1/+eI
Subject: [Buildroot] [PATCH 1/1] package/python-sqlalchemy: bump version to
 2.0.35
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
bXkuaGFzaAppbmRleCA3ZmZkZmFmMWI1Li5lOWFiYTM4NGNjIDEwMDY0NAotLS0gYS9wYWNrYWdl
L3B5dGhvbi1zcWxhbGNoZW15L3B5dGhvbi1zcWxhbGNoZW15Lmhhc2gKKysrIGIvcGFja2FnZS9w
eXRob24tc3FsYWxjaGVteS9weXRob24tc3FsYWxjaGVteS5oYXNoCkBAIC0xLDUgKzEsNSBAQAog
IyBtZDUsIHNoYTI1NiBmcm9tIGh0dHBzOi8vcHlwaS5vcmcvcHlwaS9zcWxhbGNoZW15L2pzb24K
LW1kNSAgMmQ3YzBkYmI0YjIxYTFjYjA1NDZkNTIwZTc3OTUwMjIgIHNxbGFsY2hlbXktMi4wLjMz
LnRhci5negotc2hhMjU2ICA5MWM5MzMzM2MyYjM3ZmY3MjFkYzgzYjM3ZTI4YzI5ZGU0YzUwMmI1
NjEyZjJkMDkzNDY4MDM3Yjg2YWEyYmUwICBzcWxhbGNoZW15LTIuMC4zMy50YXIuZ3oKK21kNSAg
OWNkYmI3Nzc0NmU3ZDExM2I5ZDJjMmFmMWJlNjcwMGQgIHNxbGFsY2hlbXktMi4wLjM1LnRhci5n
egorc2hhMjU2ICBlMTFkN2VhNGQyNGYwYTI2MmJjY2Y5YTdjZDYyODRjOTc2YzUzNjlkYWMyMWRi
MjM3Y2ZmNTk1ODYwNDVhYjlmICBzcWxhbGNoZW15LTIuMC4zNS50YXIuZ3oKICMgTG9jYWxseSBj
b21wdXRlZCBzaGEyNTYgY2hlY2tzdW1zCiBzaGEyNTYgIDNjMGY1OWFiODg3ZDA0MWRlNmE0ZTUy
ZmZlM2U5ZWRiNWQ5NTIyZGU5MDlmYWU5YTZjZDdhZGI2ZTdiZTMyOTMgIExJQ0VOU0UKZGlmZiAt
LWdpdCBhL3BhY2thZ2UvcHl0aG9uLXNxbGFsY2hlbXkvcHl0aG9uLXNxbGFsY2hlbXkubWsgYi9w
YWNrYWdlL3B5dGhvbi1zcWxhbGNoZW15L3B5dGhvbi1zcWxhbGNoZW15Lm1rCmluZGV4IDg0MjAx
Y2Y4MzMuLjc4ZDdmNWU1NTMgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvcHl0aG9uLXNxbGFsY2hlbXkv
cHl0aG9uLXNxbGFsY2hlbXkubWsKKysrIGIvcGFja2FnZS9weXRob24tc3FsYWxjaGVteS9weXRo
b24tc3FsYWxjaGVteS5tawpAQCAtNCw5ICs0LDkgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjCiAKLVBZVEhPTl9TUUxBTENIRU1ZX1ZFUlNJT04gPSAyLjAuMzMKK1BZVEhPTl9TUUxBTENI
RU1ZX1ZFUlNJT04gPSAyLjAuMzUKIFBZVEhPTl9TUUxBTENIRU1ZX1NPVVJDRSA9IHNxbGFsY2hl
bXktJChQWVRIT05fU1FMQUxDSEVNWV9WRVJTSU9OKS50YXIuZ3oKLVBZVEhPTl9TUUxBTENIRU1Z
X1NJVEUgPSBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvZDUvNzAvNmRj
NDM3YWZmMjBlNDU0ZThhYzM1Y2RjYzc0NjIwZmFkNTU5ODViNWVhMjgzMGZhMmQ3M2IwMmQ1ODA1
CitQWVRIT05fU1FMQUxDSEVNWV9TSVRFID0gaHR0cHM6Ly9maWxlcy5weXRob25ob3N0ZWQub3Jn
L3BhY2thZ2VzLzM2LzQ4LzRmMTkwYTgzNTI1ZjVjZWZlZmE0NGY2YWRjOWU2Mzg2YzRkZTUyMThk
Njg2YzI3ZWRhOTJlYjFmNTQyNAogUFlUSE9OX1NRTEFMQ0hFTVlfU0VUVVBfVFlQRSA9IHNldHVw
dG9vbHMKIFBZVEhPTl9TUUxBTENIRU1ZX0xJQ0VOU0UgPSBNSVQKIFBZVEhPTl9TUUxBTENIRU1Z
X0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFCi0tIAoyLjQ2LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
