Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 908A4C369A2
	for <buildroot@archiver.kernel.org>; Mon, 14 Apr 2025 17:14:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 408194040B;
	Mon, 14 Apr 2025 17:14:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3I2WchpUqefG; Mon, 14 Apr 2025 17:14:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BDC7408D2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BDC7408D2;
	Mon, 14 Apr 2025 17:14:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 938C5205
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 17:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 796B140874
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 17:14:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M0ax1OefgUSB for <buildroot@buildroot.org>;
 Mon, 14 Apr 2025 17:14:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 740E44040B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 740E44040B
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 740E44040B
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 17:14:37 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43cec5cd73bso31299145e9.3
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 10:14:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744650875; x=1745255675;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dBP8Gv9BTROSuUiloDj7/ZLhoLPz3ty2/H8OahFgqHE=;
 b=IMsYMXwjkIIBdsdlEABJi2ELFRPd+efUYdMGddp9ALUZyEgsp99G+GvLFdcYkhyEqY
 1JRiWfecxD+QX5+m4hlipiYHIQ7Ks6CVPbdeGSfzJVuXf0C6D9GysuGzbPPT/i2YMM3C
 YQblhfaQrAoeH42eHaX4s+dfBVBs4A2+x+I+9shok8aPiMrbrW4OJS7fya1nF9qUZo+4
 OhXtUiuL8QTlQq5vKdAaCizRlxPqQVjpiEP7HdRvpL+En/STjHwfeepCGJGoJhc24zxD
 ED0baUlE3Z1lI8qwLnq9ls0cLSrj48/wSTkc4bDt7BlgD0y8hiDo4tQghQXMS3jj+ZJ+
 fWgw==
X-Gm-Message-State: AOJu0YyfyfEC7xrRtWTPy4BTG5hehv7DM9zYAuBGIlKIQ8oXsg0YeQrI
 KBywSxBnzaP1h703LYqsepfq8vyTV3tNQ7Y5BNoodsbmS9NlzWCuPq9nDK4UBxoxjWAFZf2NltW
 8rsOQeA==
X-Gm-Gg: ASbGncs61SwK0GhD3on2NN7+RTam88u5N1J/ZdS9jZ8v4e1Ed8M8VRov1d9b6amlmXY
 +LYOQ3ptiEbH3pSY6eL47NaG2VsTMZ2PFnm4FDkokzB8SFL32nhF0zclyXnGN+0SmMigj3fWvk/
 M1KL7sl8R38F0QJzR0kVeVEuVzy209wLYGXQJul0KQV8IlokJRvuWmalpwjUb+Dpe6oOhtzOzLa
 vqOBfMEB0km5NhLhDM118ceTxeDRYwOk8C3frWp1Cg1irk9mqf459QR1ti7efabSpsgKGmdZCvR
 I4YyBd4wdizi82j15EK7EGRU/tcNhX9ASm2YK9N6dJx4FA7EHOxsgcavi+Bo
X-Google-Smtp-Source: AGHT+IEUGym7l6gggiV8M3gBVdavBI4BFtbOzHL/HSdZQ2pXmlODQRd+2GgwvlgY7rcx7lYyvDEefA==
X-Received: by 2002:a05:6000:2207:b0:391:4389:f36a with SMTP id
 ffacd0b85a97d-39eaaec7d22mr10734102f8f.48.1744650875296; 
 Mon, 14 Apr 2025 10:14:35 -0700 (PDT)
Received: from debian-hp-1.fritz.box ([213.211.140.212])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eaf4457a6sm11687239f8f.98.2025.04.14.10.14.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Apr 2025 10:14:34 -0700 (PDT)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Mon, 14 Apr 2025 19:14:30 +0200
Message-ID: <20250414171433.1233576-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250414170922.1230348-1-raphael.melotte@mind.be>
References: <20250414170922.1230348-1-raphael.melotte@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1744650875; x=1745255675; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dBP8Gv9BTROSuUiloDj7/ZLhoLPz3ty2/H8OahFgqHE=;
 b=hGMRmfNWWQ75qvZcdz/YxkKhP/QlbhCJ8Nn9JdbX2HpzbVhyuzVxXVZtDymsrvCL9o
 888kPF9B+tNwnkvJw8bp0e1PaToc2An+fcl0R5bQeZPXiOZRtWQWCwNtNx0d3uHoX2d2
 5srykn0YiyBgfMZ7E8Q3IzUjkITaERLgAg7haT7GdZ+Eygc9BeLR6wobgJso2sam9ORk
 4+HNewPR38Ki7ZmNvbOcj0xqq667WDgu4jqcTP8y24nZ8KOe4xuUwA4hm95DQfjEIfF3
 mk8eTjBeycAaQna2rLEhIdrG1mageNtQncPf5RKfTCGI2TaRG6ODiPB+7IDI/0hsLjvo
 th2w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=hGMRmfNW
Subject: [Buildroot] [PATCH v2 1/2] support/testing: add new test for
 python-urllib3
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

SW1wb3J0aW5nIHVybGxpYjMgYWxyZWFkeSBhbGxvd3MgdXMgdG8gY2hlY2sgdGhhdCBmb3IgZXhh
bXBsZSB6bGliIGNhbgpiZSBsb2FkZWQgYXQgcnVudGltZS4KCkZvciBnb29kIG1lYXN1cmUsIGFs
c28gY3JlYXRlIHRoZSBQb29sTWFuYWdlciBvYmplY3QgbWVudGlvbmVkIGluIHRoZQp1c2VyIGd1
aWRlIChbMV0pLCBhbmQgY2hlY2sgdGhhdCB3ZSBjYW4gbm9ybWFsaXplIGEgVVJMIGxpa2UgaXQg
aXMKZG9uZSBpbiB1cmxsaWIzJ3MgJ3Rlc3QvdGVzdF91dGlsLnB5Jy4KClsxXTogaHR0cHM6Ly91
cmxsaWIzLnJlYWR0aGVkb2NzLmlvL2VuL3N0YWJsZS91c2VyLWd1aWRlLmh0bWwKClNpZ25lZC1v
ZmYtYnk6IFJhcGhhw6tsIE3DqWxvdHRlIDxyYXBoYWVsLm1lbG90dGVAbWluZC5iZT4KLS0tCkNo
YW5nZXMgdjEgLT4gdjI6CiAgICAtIHJlbW92ZSB1bnVzZWQgaW1wb3J0LgotLS0KIERFVkVMT1BF
UlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArKwogLi4u
L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS9zYW1wbGVfcHl0aG9uX3VybGxpYjMucHkgICB8ICA5ICsr
KysrKysrKwogc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9weXRob25fdXJsbGli
My5weSB8IDEyICsrKysrKysrKysrKwogMyBmaWxlcyBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCsp
CiBjcmVhdGUgbW9kZSAxMDA2NDQgc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2Uvc2FtcGxl
X3B5dGhvbl91cmxsaWIzLnB5CiBjcmVhdGUgbW9kZSAxMDA2NDQgc3VwcG9ydC90ZXN0aW5nL3Rl
c3RzL3BhY2thZ2UvdGVzdF9weXRob25fdXJsbGliMy5weQoKZGlmZiAtLWdpdCBhL0RFVkVMT1BF
UlMgYi9ERVZFTE9QRVJTCmluZGV4IDBkNzg0MWViOTQuLjU1NGMxODk4NDYgMTAwNjQ0Ci0tLSBh
L0RFVkVMT1BFUlMKKysrIGIvREVWRUxPUEVSUwpAQCAtMjgxNywxMiArMjgxNywxNCBAQCBGOglz
dXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS9zYW1wbGVfcHl0aG9uX3JzYS5weQogRjoJc3Vw
cG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2Uvc2FtcGxlX3B5dGhvbl9zM3RyYW5zZmVyLnB5CiBG
OglzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS9zYW1wbGVfcHl0aG9uX3NkYnVzLnB5CiBG
OglzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS9zYW1wbGVfcHl0aG9uX3NkYnVzX25ldHdv
cmttYW5hZ2VyLnB5CitGOglzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS9zYW1wbGVfcHl0
aG9uX3VybGxpYjMucHkKIEY6CXN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfcHl0
aG9uX2ptZXNwYXRoLnB5CiBGOglzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3B5
dGhvbl9weW11cGRmLnB5CiBGOglzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3B5
dGhvbl9yc2EucHkKIEY6CXN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfcHl0aG9u
X3MzdHJhbnNmZXIucHkKIEY6CXN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfcHl0
aG9uX3NkYnVzLnB5CiBGOglzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3B5dGhv
bl9zZGJ1c19uZXR3b3JrbWFuYWdlci5weQorRjoJc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2th
Z2UvdGVzdF9weXRob25fdXJsbGliMy5weQogCiBOOglSYXBoYWVsIFBhdmxpZGlzIDxyYXBoYWVs
LnBhdmxpZGlzQGdtYWlsLmNvbT4KIEY6CXBhY2thZ2UvbnZpZGlhLXBlcnNpc3RlbmNlZC8KZGlm
ZiAtLWdpdCBhL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3NhbXBsZV9weXRob25fdXJs
bGliMy5weSBiL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3NhbXBsZV9weXRob25fdXJs
bGliMy5weQpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi45ZTBjZjhjMTdh
Ci0tLSAvZGV2L251bGwKKysrIGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2Uvc2FtcGxl
X3B5dGhvbl91cmxsaWIzLnB5CkBAIC0wLDAgKzEsOSBAQAorIyBDaGVjayB0aGF0IHdlIGNhbiBp
bXBvcnQgdXJsbGliMyBldmVuIGlmIHdlIGRvbid0IHVzZSBhbGwgb2YgaXQ6CitpbXBvcnQgdXJs
bGliMworCisjIEp1c3QgY2hlY2sgdGhhdCB3ZSBjYW4gY3JlYXRlIGEgUG9vbE1hbmFnZXI6Cito
dHRwID0gdXJsbGliMy5Qb29sTWFuYWdlcigpCisKKyMgQ2hlY2sgaWYgd2UgY2FuIG5vcm1hbGl6
ZSBVUkxzOgorYXNzZXJ0IHVybGxpYjMudXRpbC51cmwucGFyc2VfdXJsKCJIVFRQUzovL0V4YW1w
bGUuQ29tLz9LZXk9VmFsdWUiKS51cmwgXAorICAgID09ICJodHRwczovL2V4YW1wbGUuY29tLz9L
ZXk9VmFsdWUiCmRpZmYgLS1naXQgYS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0
X3B5dGhvbl91cmxsaWIzLnB5IGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9w
eXRob25fdXJsbGliMy5weQpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi41
NGE5NGQ1ZTY1Ci0tLSAvZGV2L251bGwKKysrIGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2th
Z2UvdGVzdF9weXRob25fdXJsbGliMy5weQpAQCAtMCwwICsxLDEyIEBACitmcm9tIHRlc3RzLnBh
Y2thZ2UudGVzdF9weXRob24gaW1wb3J0IFRlc3RQeXRob25QYWNrYWdlQmFzZQorCisKK2NsYXNz
IFRlc3RQeXRob25QeTNVcmxsaWIzKFRlc3RQeXRob25QYWNrYWdlQmFzZSk6CisgICAgX190ZXN0
X18gPSBUcnVlCisgICAgY29uZmlnID0gVGVzdFB5dGhvblBhY2thZ2VCYXNlLmNvbmZpZyArIFwK
KyAgICAgICAgIiIiCisgICAgICAgIEJSMl9QQUNLQUdFX1BZVEhPTjM9eQorICAgICAgICBCUjJf
UEFDS0FHRV9QWVRIT05fVVJMTElCMz15CisgICAgICAgICIiIgorICAgIHNhbXBsZV9zY3JpcHRz
ID0gWyJ0ZXN0cy9wYWNrYWdlL3NhbXBsZV9weXRob25fdXJsbGliMy5weSJdCisgICAgdGltZW91
dCA9IDIwCi0tIAoyLjQ5LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
