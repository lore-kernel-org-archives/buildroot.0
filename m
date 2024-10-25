Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D5ED0C61D
	for <buildroot@archiver.kernel.org>; Fri, 25 Oct 2024 14:59:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1A5981A64;
	Fri, 25 Oct 2024 14:59:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RSd43Ixqub8z; Fri, 25 Oct 2024 14:59:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD89A81B04
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD89A81B04;
	Fri, 25 Oct 2024 14:59:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F8202318
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 14:59:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2851940740
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 14:59:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M9HLdvuh7sQA for <buildroot@buildroot.org>;
 Fri, 25 Oct 2024 14:59:25 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::536; helo=mail-pg1-x536.google.com;
 envelope-from=flavio.tapajos@newtesc.com.br; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E5BE240538
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5BE240538
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E5BE240538
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 14:59:23 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-7ea6a4f287bso1320776a12.3
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 07:59:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729868362; x=1730473162;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7uvUFldWTEx/Zyu2z7PjY7BypkDY/W1HKs20q2hjyGg=;
 b=SzcdXYGFcliIRPaV93Oan74Q312ldsKWQWc2ll6HRh4YhG/7DBBsDVdaapo85WHFcV
 8ZLL0e9APclXjen7T7R7ewojikRub/6Xj8x8DwIA0ofL5O6dcGvYxb9+zvx+rZnhO/uQ
 7lh5ZWBNQjXRg6d5qX4ZAE+kZ+xLo2F8P22GM6mAKNeRTBiWov2IQuwL2fPMDy0Z6TIn
 SqbAMYOhriZjqZU6nKifRRIMrsj7AK/QOK7paVeAyClLrrM6ICmZqCmzKcSYKC4TgxCR
 Ow1SOk5cgVAHVFzWLfHRLxFYMyI9KCOmVXmksbC63/6vcYXVEt44BzC5rql6sEp3/7kM
 FPZA==
X-Gm-Message-State: AOJu0Yw7cAI/itNHy/TZiPfvVxgCzr2WQ8zpuMIBDMstUQf5cpESdExS
 LsTts8HmuvlszayOquzTrDDgbugNiZeceEJaLWxfFzWAHwqmlwibGr73wpdTGgEG5o9NfIhGyHL
 2zeg=
X-Google-Smtp-Source: AGHT+IFQfbQfd0q0hzcuuNoWCp9lxK9iU4QKjvQlAxKOJqUWTD4bMs4GuEulnBvDG8/ImjQZ7KiYmw==
X-Received: by 2002:a05:6a20:d492:b0:1d9:19a0:c36e with SMTP id
 adf61e73a8af0-1d978b98610mr10658745637.31.1729868362380; 
 Fri, 25 Oct 2024 07:59:22 -0700 (PDT)
Received: from niltesque.newtesc.com.br ([189.113.44.122])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72057a1fe53sm1151776b3a.162.2024.10.25.07.59.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2024 07:59:21 -0700 (PDT)
From: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
To: buildroot@buildroot.org
Date: Fri, 25 Oct 2024 11:59:16 -0300
Message-ID: <20241025145916.1084987-1-flavio.tapajos@newtesc.com.br>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=newtesc-com-br.20230601.gappssmtp.com; s=20230601; t=1729868362; x=1730473162;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7uvUFldWTEx/Zyu2z7PjY7BypkDY/W1HKs20q2hjyGg=;
 b=Mq++iK4dYeDIIY9YJgf3+W6Ork9r5D+WBfJBOf8ia9YTOJi/sIpoe7/AJnZllXkbrB
 NJez+vUItJsq4C1e+vkZ9Atip3hy8VuOKoUJqJXia19aq0Gjc0KxXQCtnDGIQKJTJprX
 W8K2vkrFp4W/7gTqpto/D2w0BJl8YOGSZtHEyZs2cb5cqAZVRzcpvhTVHI2s23nNVaKE
 XM/kseSWUBzqSVcNNfo1hwma041qV3IZv3v8RYb+eBQ2cDsmrZ0Nh12WEf5PuNztI6Fn
 MsHmlCmr2hXQUFN4nq8VjPdq1iu4kzEWjE/nBs5c8xMHh/NMzV9Nu09f5ksepeVVqQj8
 eghw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=newtesc.com.br
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=newtesc-com-br.20230601.gappssmtp.com
 header.i=@newtesc-com-br.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=Mq++iK4d
Subject: [Buildroot] [PATCH 1/1] package/python-sqlalchemy: bump version to
 2.0.36
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
bXkuaGFzaAppbmRleCBlOWFiYTM4NGNjLi40ZTM4ZDRlYzU4IDEwMDY0NAotLS0gYS9wYWNrYWdl
L3B5dGhvbi1zcWxhbGNoZW15L3B5dGhvbi1zcWxhbGNoZW15Lmhhc2gKKysrIGIvcGFja2FnZS9w
eXRob24tc3FsYWxjaGVteS9weXRob24tc3FsYWxjaGVteS5oYXNoCkBAIC0xLDUgKzEsNSBAQAog
IyBtZDUsIHNoYTI1NiBmcm9tIGh0dHBzOi8vcHlwaS5vcmcvcHlwaS9zcWxhbGNoZW15L2pzb24K
LW1kNSAgOWNkYmI3Nzc0NmU3ZDExM2I5ZDJjMmFmMWJlNjcwMGQgIHNxbGFsY2hlbXktMi4wLjM1
LnRhci5negotc2hhMjU2ICBlMTFkN2VhNGQyNGYwYTI2MmJjY2Y5YTdjZDYyODRjOTc2YzUzNjlk
YWMyMWRiMjM3Y2ZmNTk1ODYwNDVhYjlmICBzcWxhbGNoZW15LTIuMC4zNS50YXIuZ3oKK21kNSAg
N2E0NDQ0NTI0ZTQ5MzBhMjlmMjJkYmNhMGNiMTZkNGIgIHNxbGFsY2hlbXktMi4wLjM2LnRhci5n
egorc2hhMjU2ICA3ZjI3Njc2ODBiNmQyMzk4YWVhNzA4MmU0NWE3NzRiMmIwNzY3YjVjOGQ4ZmZi
OWM4YjY4MzA4OGVhOWIyOWM1ICBzcWxhbGNoZW15LTIuMC4zNi50YXIuZ3oKICMgTG9jYWxseSBj
b21wdXRlZCBzaGEyNTYgY2hlY2tzdW1zCiBzaGEyNTYgIDNjMGY1OWFiODg3ZDA0MWRlNmE0ZTUy
ZmZlM2U5ZWRiNWQ5NTIyZGU5MDlmYWU5YTZjZDdhZGI2ZTdiZTMyOTMgIExJQ0VOU0UKZGlmZiAt
LWdpdCBhL3BhY2thZ2UvcHl0aG9uLXNxbGFsY2hlbXkvcHl0aG9uLXNxbGFsY2hlbXkubWsgYi9w
YWNrYWdlL3B5dGhvbi1zcWxhbGNoZW15L3B5dGhvbi1zcWxhbGNoZW15Lm1rCmluZGV4IDc4ZDdm
NWU1NTMuLjFiYzJmMzkyOWEgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvcHl0aG9uLXNxbGFsY2hlbXkv
cHl0aG9uLXNxbGFsY2hlbXkubWsKKysrIGIvcGFja2FnZS9weXRob24tc3FsYWxjaGVteS9weXRo
b24tc3FsYWxjaGVteS5tawpAQCAtNCw5ICs0LDkgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjCiAKLVBZVEhPTl9TUUxBTENIRU1ZX1ZFUlNJT04gPSAyLjAuMzUKK1BZVEhPTl9TUUxBTENI
RU1ZX1ZFUlNJT04gPSAyLjAuMzYKIFBZVEhPTl9TUUxBTENIRU1ZX1NPVVJDRSA9IHNxbGFsY2hl
bXktJChQWVRIT05fU1FMQUxDSEVNWV9WRVJTSU9OKS50YXIuZ3oKLVBZVEhPTl9TUUxBTENIRU1Z
X1NJVEUgPSBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvMzYvNDgvNGYx
OTBhODM1MjVmNWNlZmVmYTQ0ZjZhZGM5ZTYzODZjNGRlNTIxOGQ2ODZjMjdlZGE5MmViMWY1NDI0
CitQWVRIT05fU1FMQUxDSEVNWV9TSVRFID0gaHR0cHM6Ly9maWxlcy5weXRob25ob3N0ZWQub3Jn
L3BhY2thZ2VzLzUwLzY1LzljYmM5YzRjMzI4N2JlZDI0OTllMDUwMzNlMjA3NDczNTA0ZGM0ZGY5
OTljZTQ5Mzg1ZmIxZjhiMDU4YQogUFlUSE9OX1NRTEFMQ0hFTVlfU0VUVVBfVFlQRSA9IHNldHVw
dG9vbHMKIFBZVEhPTl9TUUxBTENIRU1ZX0xJQ0VOU0UgPSBNSVQKIFBZVEhPTl9TUUxBTENIRU1Z
X0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFCi0tIAoyLjQ3LjAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
