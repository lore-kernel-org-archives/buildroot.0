Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E6D2C369A2
	for <buildroot@archiver.kernel.org>; Mon, 14 Apr 2025 17:09:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 369CD40CF2;
	Mon, 14 Apr 2025 17:09:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dX9Aq2_4HIGI; Mon, 14 Apr 2025 17:09:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 545E14069B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 545E14069B;
	Mon, 14 Apr 2025 17:09:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A4E951F7
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 17:09:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 95009810CA
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 17:09:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CCEcMPbi5Apd for <buildroot@buildroot.org>;
 Mon, 14 Apr 2025 17:09:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7B80180562
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B80180562
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7B80180562
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 17:09:27 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43ed8d32a95so39443655e9.3
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 10:09:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744650565; x=1745255365;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JzpiJermTbjOL0lorkVe7TgfEr9RU3OFTk7LOS6QE7U=;
 b=p/24hJW0B+F0TP92O/NlKubD4MHPFfSky46gY7ADR2DyUhg8WZ7oxk8KHS5HtZpJO0
 MkwoVYs7YXR4wLKDJ1G8MlLsG7EJjdBomBRIYmUIsLl64cy0L+/GAbuQ+SDpr+HGceno
 VMIoINlbgZr9RmWyPsMQq6bQ/UueJuqJUwVNO52G7CzXUrp2VJdO0HMRb1FRez1g/LDd
 yK8prINiRHWUzqf5WLVYFHJAVq74IYCQahjMlN9GRRiY/RRW4dDo/y3Ga7pm1AlSZbW7
 XpFObeonatKoW5/KYzAVXCU8ztmZDb5J0y3GNuqF1uqYIksRfzzVmuxzYEODiTM4a1kO
 BSVw==
X-Gm-Message-State: AOJu0Yz0FX6IkEL/KwvOtfo74m5mGbA6eayctbmxgHj0RDfdvEmHf/iq
 VJJiU61/Inel+xjL4kIo1PhAR73EouxAzLSptea3dDz0Cyc1+2DU7Ss3NMVZuz4hnOBCZ0NT6VM
 WkGeAJA==
X-Gm-Gg: ASbGncv8ltNbCfErg0y8x5P0EuZa2dW4ZXylR0SelwI1aW3foDsaf6a2527ql2F6SDd
 NjgKCMgl027Rvsbpqg+bdWEZZguzb6SHRtqg2R+W5WlyyR0mIuzKwPv5DjmCj/jGCVqSMHYdvzg
 NHokyTksJayRwMjioKYuHbALgAXf77uKaiu0CrNohgA8zqRRtWAW4a6p4KpDl/IO9DL4Onz+Uoc
 H9ESbOTrf4te/EJCrLXYFSLEdoQ7tT5hMNRPNe0QxC6JL8NO4g+ey76RdLguxEIfUTL0dkzbYwJ
 PAPN97SrIhbe1zl9ElV8zK/QPdZ0Pwk4zQMxC6ye+XHJYBDMvu94q8nFZzCT
X-Google-Smtp-Source: AGHT+IFCyzLXu6n4INMDNmg8dmLicajMhBgHqPreYusEQt7iFKQpxzneU3yPqKF9MLkgYG4jZf0KPQ==
X-Received: by 2002:a05:600c:1e1c:b0:43c:f8fc:f687 with SMTP id
 5b1f17b1804b1-43f3a9adc61mr133850955e9.27.1744650565131; 
 Mon, 14 Apr 2025 10:09:25 -0700 (PDT)
Received: from debian-hp-1.fritz.box ([213.211.140.212])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae978023sm11608529f8f.47.2025.04.14.10.09.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Apr 2025 10:09:24 -0700 (PDT)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Mon, 14 Apr 2025 19:09:18 +0200
Message-ID: <20250414170922.1230348-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1744650565; x=1745255365; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JzpiJermTbjOL0lorkVe7TgfEr9RU3OFTk7LOS6QE7U=;
 b=JcEzTgRSPo898TlHWa/BYYocy6srgKfXE6C5Q7lWhPReMtVOtlW815QjdtX1B4027Y
 6DBw85DaTF1Q6EuA7Jg7l7Mdrb22Jiq9hLp0i5b9AZYyKzX/mXlZ+LY17ep08bwTNVle
 N4tLgH9N7t/DkLXLH3e+E2MAaFT73CK4D1tRrJ5SSwBOGnbStLrf/lv2O5uuBpJU41dC
 +CZSQmxnUMGGZl7L0/JluBd71T8Qc0h978opU79GMqz4t5QJl1Z4ej880xayTqbcuzPD
 /Ed9c/DgNTY6QDhE09jSK9IFknnwt6lSnwnGY9ej15mCwc2z9Lv1I+8+nigyV92KvpCz
 V9bQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=JcEzTgRS
Subject: [Buildroot] [PATCH 1/2] support/testing: add new test for
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
ZmYtYnk6IFJhcGhhw6tsIE3DqWxvdHRlIDxyYXBoYWVsLm1lbG90dGVAbWluZC5iZT4KLS0tCiBE
RVZFTE9QRVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIg
KysKIC4uLi90ZXN0aW5nL3Rlc3RzL3BhY2thZ2Uvc2FtcGxlX3B5dGhvbl91cmxsaWIzLnB5ICAg
fCAxMSArKysrKysrKysrKwogc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9weXRo
b25fdXJsbGliMy5weSB8IDEyICsrKysrKysrKysrKwogMyBmaWxlcyBjaGFuZ2VkLCAyNSBpbnNl
cnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2th
Z2Uvc2FtcGxlX3B5dGhvbl91cmxsaWIzLnB5CiBjcmVhdGUgbW9kZSAxMDA2NDQgc3VwcG9ydC90
ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9weXRob25fdXJsbGliMy5weQoKZGlmZiAtLWdpdCBh
L0RFVkVMT1BFUlMgYi9ERVZFTE9QRVJTCmluZGV4IDBkNzg0MWViOTQuLjU1NGMxODk4NDYgMTAw
NjQ0Ci0tLSBhL0RFVkVMT1BFUlMKKysrIGIvREVWRUxPUEVSUwpAQCAtMjgxNywxMiArMjgxNywx
NCBAQCBGOglzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS9zYW1wbGVfcHl0aG9uX3JzYS5w
eQogRjoJc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2Uvc2FtcGxlX3B5dGhvbl9zM3RyYW5z
ZmVyLnB5CiBGOglzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS9zYW1wbGVfcHl0aG9uX3Nk
YnVzLnB5CiBGOglzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS9zYW1wbGVfcHl0aG9uX3Nk
YnVzX25ldHdvcmttYW5hZ2VyLnB5CitGOglzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS9z
YW1wbGVfcHl0aG9uX3VybGxpYjMucHkKIEY6CXN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdl
L3Rlc3RfcHl0aG9uX2ptZXNwYXRoLnB5CiBGOglzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2Fn
ZS90ZXN0X3B5dGhvbl9weW11cGRmLnB5CiBGOglzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2Fn
ZS90ZXN0X3B5dGhvbl9yc2EucHkKIEY6CXN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rl
c3RfcHl0aG9uX3MzdHJhbnNmZXIucHkKIEY6CXN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdl
L3Rlc3RfcHl0aG9uX3NkYnVzLnB5CiBGOglzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90
ZXN0X3B5dGhvbl9zZGJ1c19uZXR3b3JrbWFuYWdlci5weQorRjoJc3VwcG9ydC90ZXN0aW5nL3Rl
c3RzL3BhY2thZ2UvdGVzdF9weXRob25fdXJsbGliMy5weQogCiBOOglSYXBoYWVsIFBhdmxpZGlz
IDxyYXBoYWVsLnBhdmxpZGlzQGdtYWlsLmNvbT4KIEY6CXBhY2thZ2UvbnZpZGlhLXBlcnNpc3Rl
bmNlZC8KZGlmZiAtLWdpdCBhL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3NhbXBsZV9w
eXRob25fdXJsbGliMy5weSBiL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3NhbXBsZV9w
eXRob25fdXJsbGliMy5weQpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi43
ZmMwZjY4MDgzCi0tLSAvZGV2L251bGwKKysrIGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2th
Z2Uvc2FtcGxlX3B5dGhvbl91cmxsaWIzLnB5CkBAIC0wLDAgKzEsMTEgQEAKKyMgQ2hlY2sgdGhh
dCB3ZSBjYW4gaW1wb3J0IHVybGxpYjMgZXZlbiBpZiB3ZSBkb24ndCB1c2UgYWxsIG9mIGl0Ogor
aW1wb3J0IHVybGxpYjMKKworZnJvbSB1cmxsaWIucGFyc2UgaW1wb3J0IHVybHBhcnNlCisKKyMg
SnVzdCBjaGVjayB0aGF0IHdlIGNhbiBjcmVhdGUgYSBQb29sTWFuYWdlcjoKK2h0dHAgPSB1cmxs
aWIzLlBvb2xNYW5hZ2VyKCkKKworIyBDaGVjayBpZiB3ZSBjYW4gbm9ybWFsaXplIFVSTHM6Cith
c3NlcnQgdXJsbGliMy51dGlsLnVybC5wYXJzZV91cmwoIkhUVFBTOi8vRXhhbXBsZS5Db20vP0tl
eT1WYWx1ZSIpLnVybCBcCisgICAgPT0gImh0dHBzOi8vZXhhbXBsZS5jb20vP0tleT1WYWx1ZSIK
ZGlmZiAtLWdpdCBhL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfcHl0aG9uX3Vy
bGxpYjMucHkgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3B5dGhvbl91cmxs
aWIzLnB5Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjU0YTk0ZDVlNjUK
LS0tIC9kZXYvbnVsbAorKysgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3B5
dGhvbl91cmxsaWIzLnB5CkBAIC0wLDAgKzEsMTIgQEAKK2Zyb20gdGVzdHMucGFja2FnZS50ZXN0
X3B5dGhvbiBpbXBvcnQgVGVzdFB5dGhvblBhY2thZ2VCYXNlCisKKworY2xhc3MgVGVzdFB5dGhv
blB5M1VybGxpYjMoVGVzdFB5dGhvblBhY2thZ2VCYXNlKToKKyAgICBfX3Rlc3RfXyA9IFRydWUK
KyAgICBjb25maWcgPSBUZXN0UHl0aG9uUGFja2FnZUJhc2UuY29uZmlnICsgXAorICAgICAgICAi
IiIKKyAgICAgICAgQlIyX1BBQ0tBR0VfUFlUSE9OMz15CisgICAgICAgIEJSMl9QQUNLQUdFX1BZ
VEhPTl9VUkxMSUIzPXkKKyAgICAgICAgIiIiCisgICAgc2FtcGxlX3NjcmlwdHMgPSBbInRlc3Rz
L3BhY2thZ2Uvc2FtcGxlX3B5dGhvbl91cmxsaWIzLnB5Il0KKyAgICB0aW1lb3V0ID0gMjAKLS0g
CjIuNDkuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
