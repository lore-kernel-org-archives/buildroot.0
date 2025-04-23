Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 487D2C369D1
	for <buildroot@archiver.kernel.org>; Wed, 23 Apr 2025 13:20:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F40766106D;
	Wed, 23 Apr 2025 13:20:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tkq1HTYZ6fAq; Wed, 23 Apr 2025 13:20:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B7CF61183
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B7CF61183;
	Wed, 23 Apr 2025 13:20:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 197AD1A0
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 13:19:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 15CFD61183
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 13:19:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ayC9YDD6t9lx for <buildroot@buildroot.org>;
 Wed, 23 Apr 2025 13:19:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 435FD6106D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 435FD6106D
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 435FD6106D
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 13:19:57 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-39c266c2dd5so6443698f8f.3
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 06:19:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745414395; x=1746019195;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8wIvfrrktchEtJBh3QOpIdv24EiSDuVxQt38ttBwNjg=;
 b=LglZIZ/y6HXi9D9EU5F/BkvGOzpedYzYZ3UansKiIeKLPQlT54/3IyF2sniBXiIjap
 ZWLhwO03BA1qUGy8uoTrcDNR6khsbaaxIf47YdyGfg0fWFvn7FDRNyLDUnRwSowINB87
 rhJXTw7LsOvAm6pbFR8Uw6JpCGKU+ECg+6u4zhzp1WxzRbVLuhHTxUOWIeA+wfk0jwRc
 8h6he/7ltEeE41t+aZSMcgKwHJ7sMNercZlLTKW0aLHRuPvJsjlnc8ZIUQa0sq7IFRgz
 trVlR1vbKzmBLFX/MSMFl81DtizODKNwQOrD+M5HnU+KUvB9SpyS2JNnsICoE07wMdgi
 pxNQ==
X-Gm-Message-State: AOJu0YwVHDOg7/bcYZOvaNLpIZbki/Ve8Uph6/8ywOTGqfkw+aAxJujC
 WBLIOwz54fvUvM2A3eu59pdU0Ewey2tu5djypCNyRUyfoEG97gQ+uTT4K4Qq/jWJPAy4GYGDigI
 A
X-Gm-Gg: ASbGncuPJ1dYUJRfhjrDs9UxHrQfN7PsGhWKsb14QSu9aRymV+rZb6Du7tL7nxbjx84
 a8X2PSN0+8HeQC4e1ro87723dFcfluNpKshtd7P/5av4VFAEaCE7PLUXGCKFVmCla0ngm7R5ujf
 tppjcwcR5GxX/QByKpvEiQkWdDcgaLintMIGfBKVjIfUQAt5Bq+ZS8f+feeiM1VW+Ztkba3uXB2
 ega4K4fPkpjH0tDADiO0obj87gF2ON+oiyCLJ+irxiQWaplqNTNgcc1NZheGaZDByV4TztHjREV
 BN60UquqrkCVsC7kf8xrOcLwnLVCr+A+sMkbYljlla0vPjHpmxlRGjtai0X9CRDJ3B4RdgjZmZz
 KCBy8GGIoDslNAZ5rDYR84YsJbUzc2X2JWBli
X-Google-Smtp-Source: AGHT+IGP0RH91V9asopSHUl31JyMMRF9tynQIulYSbI3NAfT0Cpvrr/62FpriX9jNDtuW3hPTXox3g==
X-Received: by 2002:a5d:5987:0:b0:39e:e438:8e4b with SMTP id
 ffacd0b85a97d-39efbaf6e96mr15796500f8f.50.1745414395237; 
 Wed, 23 Apr 2025 06:19:55 -0700 (PDT)
Received: from debian-hp-1.local.essensium.com
 (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-44092d23262sm25494235e9.16.2025.04.23.06.19.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 06:19:54 -0700 (PDT)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Sen Hastings <sen@hastings.org>
Date: Wed, 23 Apr 2025 15:19:29 +0200
Message-ID: <20250423131933.834900-2-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250423131933.834900-1-raphael.melotte@mind.be>
References: <20250423131933.834900-1-raphael.melotte@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1745414395; x=1746019195; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8wIvfrrktchEtJBh3QOpIdv24EiSDuVxQt38ttBwNjg=;
 b=f9cT0ROb3ETV/dlwGFXM4DOtuH13bi1nykPuE7W3Idgqy+a/VsPNXpDlDPay0lOi2u
 zPq6M0akFHBgT+Tv1niOF4CCS8wu1Fx2NA1pfJPgPa+xrsDpM4QVKynKKbGhEOuFDERa
 hbKA2e4j9HNxproPOdI7WdYc7yWCsWqDWcAj3E5Pjyv/3Zn9KQX1A6QJ8MS4LEGI16lE
 1qjhYRhG9oHEg0bj1RAh3JZzmiNbA8rfRZB4kEsgXJOg5wXVNEO1zYZIgfmHLNXjABY8
 aZAkJSw+8ZZG2ZA8fXCPck9To1tn9G7KnFlxW67qta83PmaZs1JpSoon2KFfpj+4s6OC
 H8gA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=f9cT0ROb
Subject: [Buildroot] [RFC PATCH 1/2] support/scripts/pkg-stats: add support
 for version prefixes
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

UGFja2FnZXMgdXNpbmcgYSB2ZXJzaW9uIHByZWZpeCBhcmUgcHJvYmxlbWF0aWMgZm9yIHBrZy1z
dGF0cywgYmVjYXVzZQpyZWxlYXNlLW1vbml0b3Jpbmcub3JnIGRvZXNuJ3QgaW5jbHVkZSB0aGUg
cHJlZml4IGluIGl0cyB2ZXJzaW9ucy4gIEFzCmEgY29uc2VxdWVuY2UsIHBrZy1zdGF0IHJlcG9y
dHMgYXMgb3V0ZGF0ZWQgcGFja2FnZXMgdGhhdCBhY3R1YWxseQphcmVuJ3QuCgpJZGVhbGx5IHJl
bGVhc2UtbW9uaXRvcmluZy5vcmcgd291bGQgZ2l2ZSB1cyB0aGUgcHJlZml4IHVzZWQgYnkgdGhl
CnBhY2thZ2Ugc2luY2UgaXQgc3RvcmVzIHRoaXMgaW5mb3JtYXRpb24gcGVyLXBhY2thZ2UuIFVu
Zm9ydHVuYXRlbHksCnRoZSBwcmVmaXggaXMgbm90IHBhcnQgb2YgdGhlIGluZm9ybWF0aW9uIHdl
IGdldCBmcm9tIGl0cyBBUEkuCgpXZSBjYW5ub3QgYmxpbmRseSByZW1vdmUgcHJlZml4ZXMgZnJv
bSBldmVyeSBwYWNrYWdlIGJlY2F1c2Ugc29tZSBvZgp0aGVtIHVzZSBjb21taXQgaGFzaGVzIChz
byBmb3IgZXhhbXBsZSBhIHByZWZpeCAndicgdG8gYmUgcmVtb3ZlZApjYW5ub3QgYmUgZGlzdGlu
Z3Vpc2hlZCBmcm9tIHRoZSBsZXR0ZXIgJ3YnIGJlaW5nIHRoZSBiZWdpbm5pbmcgb2YgYQpjb21t
aXQgaGFzaCkuCgpJbnN0ZWFkLCB0aGlzIGNvbW1pdCBpbnRyb2R1Y2VzIHN1cHBvcnQgZm9yIGEg
bmV3Cic8UEtHPl9WRVJTSU9OX1BSRUZJWCcsIHdoaWNoIGNhbiBiZSB1c2VkIHRvIGluZGljYXRl
IHRoZSBwcmVmaXggdXNlZApieSB0aGUgcGFja2FnZS4KcGtnLXN0YXRzIGNvbnN1bWVzIHRoaXMg
dmFyaWFibGUgYW5kIHJlbW92ZXMgdGhlIHByZWZpeCBmcm9tIHRoZQp2ZXJzaW9uIHdoZW4gcmVw
b3J0aW5nIG9yIGNvbXBhcmluZyB2ZXJzaW9ucy4KClRoZSBkb2N1bWVudGF0aW9uIGlzIGFsc28g
dXBkYXRlZCBhY2NvcmRpbmdseS4KClNpZ25lZC1vZmYtYnk6IFJhcGhhw6tsIE3DqWxvdHRlIDxy
YXBoYWVsLm1lbG90dGVAbWluZC5iZT4KLS0tCiBkb2NzL21hbnVhbC9hZGRpbmctcGFja2FnZXMt
Z2VuZXJpYy5hZG9jIHwgIDUgKysrKysKIHN1cHBvcnQvc2NyaXB0cy9wa2ctc3RhdHMgICAgICAg
ICAgICAgICAgfCAxNiArKysrKysrKysrKysrKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDE5IGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZG9jcy9tYW51YWwvYWRkaW5n
LXBhY2thZ2VzLWdlbmVyaWMuYWRvYyBiL2RvY3MvbWFudWFsL2FkZGluZy1wYWNrYWdlcy1nZW5l
cmljLmFkb2MKaW5kZXggN2UyZTA2NmMxNi4uYzBmYmI4M2Q1NSAxMDA2NDQKLS0tIGEvZG9jcy9t
YW51YWwvYWRkaW5nLXBhY2thZ2VzLWdlbmVyaWMuYWRvYworKysgYi9kb2NzL21hbnVhbC9hZGRp
bmctcGFja2FnZXMtZ2VuZXJpYy5hZG9jCkBAIC0yMTksNiArMjE5LDExIEBAIG5vdCBhbmQgY2Fu
IG5vdCB3b3JrIGFzIHBlb3BsZSB3b3VsZCBleHBlY3QgaXQgc2hvdWxkOgogICAgICBub24gcmVw
cm9kdWNpYmxlLCBhbmQgcGVvcGxlIHdvdWxkIGJlIHF1aXRlIHN1cnByaXNlZCBhbmQKICAgICAg
ZGlzYXBwb2ludGVkLgogCisqICtMSUJGT09fVkVSU0lPTl9QUkVGSVgrIG1heSBjb250YWluIHRo
ZSB2ZXJzaW9uIHByZWZpeCB1c2VkIGJ5IHRoZQorICBwYWNrYWdlLiArcGtnLXN0YXRzKyB1c2Vz
IHRoaXMgcHJlZml4IHdoZW4gY2hlY2tpbmcgZm9yIHRoZSBsYXRlc3QKKyAgdmVyc2lvbiBvZiBw
YWNrYWdlcy4KKyAgRXhhbXBsZTogK0xJQkZPT19WRVJTSU9OX1BSRUZJWCA9IHYrCisKICogK0xJ
QkZPT19TT1VSQ0UrIG1heSBjb250YWluIHRoZSBuYW1lIG9mIHRoZSB0YXJiYWxsIG9mIHRoZSBw
YWNrYWdlLAogICB3aGljaCBCdWlsZHJvb3Qgd2lsbCB1c2UgdG8gZG93bmxvYWQgdGhlIHRhcmJh
bGwgZnJvbQogICArTElCRk9PX1NJVEUrLiBJZiArSE9TVF9MSUJGT09fU09VUkNFKyBpcyBub3Qg
c3BlY2lmaWVkLCBpdCBkZWZhdWx0cwpkaWZmIC0tZ2l0IGEvc3VwcG9ydC9zY3JpcHRzL3BrZy1z
dGF0cyBiL3N1cHBvcnQvc2NyaXB0cy9wa2ctc3RhdHMKaW5kZXggYzEzNGUxZWMwNi4uZjQyN2Nj
Y2MyMSAxMDA3NTUKLS0tIGEvc3VwcG9ydC9zY3JpcHRzL3BrZy1zdGF0cworKysgYi9zdXBwb3J0
L3NjcmlwdHMvcGtnLXN0YXRzCkBAIC04OSw2ICs4OSw3IEBAIGNsYXNzIFBhY2thZ2U6CiAgICAg
YWxsX2xpY2Vuc2VzID0gZGljdCgpCiAgICAgYWxsX2xpY2Vuc2VfZmlsZXMgPSBsaXN0KCkKICAg
ICBhbGxfdmVyc2lvbnMgPSBkaWN0KCkKKyAgICBhbGxfdmVyc2lvbnNfcHJlZml4ZXMgPSBkaWN0
KCkKICAgICBhbGxfaWdub3JlZF9jdmVzID0gZGljdCgpCiAgICAgYWxsX2NwZWlkcyA9IGRpY3Qo
KQogICAgICMgVGhpcyBpcyB0aGUgbGlzdCBvZiBhbGwgcG9zc2libGUgY2hlY2tzLiBBZGQgbmV3
IGNoZWNrcyB0byB0aGlzIGxpc3Qgc28KQEAgLTI1OCwxMCArMjU5LDE2IEBAIGNsYXNzIFBhY2th
Z2U6CiAgICAgZGVmIHNldF9jdXJyZW50X3ZlcnNpb24oc2VsZik6CiAgICAgICAgICIiIgogICAg
ICAgICBGaWxscyBpbiB0aGUgLmN1cnJlbnRfdmVyc2lvbiBmaWVsZAorICAgICAgICBJZiBuZWVk
ZWQsIGZpbHRlciBvdXQgdGhlIHZlcnNpb24gcHJlZml4CiAgICAgICAgICIiIgogICAgICAgICB2
YXIgPSBzZWxmLnBrZ3ZhcigpCiAgICAgICAgIGlmIHZhciBpbiBzZWxmLmFsbF92ZXJzaW9uczoK
LSAgICAgICAgICAgIHNlbGYuY3VycmVudF92ZXJzaW9uID0gc2VsZi5hbGxfdmVyc2lvbnNbdmFy
XQorICAgICAgICAgICAgdmVyc2lvbiA9IHNlbGYuYWxsX3ZlcnNpb25zW3Zhcl0KKworICAgICAg
ICAgICAgaWYgdmFyIGluIHNlbGYuYWxsX3ZlcnNpb25zX3ByZWZpeGVzOgorICAgICAgICAgICAg
ICAgIHZlcnNpb24gPSB2ZXJzaW9uLnJlbW92ZXByZWZpeChzZWxmLmFsbF92ZXJzaW9uc19wcmVm
aXhlc1t2YXJdKQorCisgICAgICAgICAgICBzZWxmLmN1cnJlbnRfdmVyc2lvbiA9IHZlcnNpb24K
IAogICAgIGRlZiBzZXRfY3BlaWQoc2VsZik6CiAgICAgICAgICIiIgpAQCAtNDE4LDcgKzQyNSw4
IEBAIGRlZiBwYWNrYWdlX2luaXRfbWFrZV9pbmZvKCk6CiAgICAgIyBGZXRjaCBhbGwgdmFyaWFi
bGVzIGF0IG9uY2UKICAgICB2YXJpYWJsZXMgPSBzdWJwcm9jZXNzLmNoZWNrX291dHB1dChbIm1h
a2UiLCAiLS1uby1wcmludC1kaXJlY3RvcnkiLCAiLXMiLAogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAiQlIyX0hBVkVfRE9UX0NPTkZJRz15IiwgInByaW50dmFycyIs
Ci0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJWQVJTPSVfTElDRU5T
RSAlX0xJQ0VOU0VfRklMRVMgJV9WRVJTSU9OICVfSUdOT1JFX0NWRVMgJV9DUEVfSUQiXSkKKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIlZBUlM9JV9MSUNFTlNFICVf
TElDRU5TRV9GSUxFUyAlX1ZFUlNJT04gJVZFUlNJT05fUFJFRklYIFwKKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgJV9JR05PUkVfQ1ZFUyAlX0NQRV9JRCJdKQogICAg
IHZhcmlhYmxlX2xpc3QgPSB2YXJpYWJsZXMuZGVjb2RlKCkuc3BsaXRsaW5lcygpCiAKICAgICAj
IFdlIHByb2Nlc3MgZmlyc3QgdGhlIGhvc3QgcGFja2FnZSBWRVJTSU9OLCBhbmQgdGhlbiB0aGUg
dGFyZ2V0CkBAIC00NTIsNiArNDYwLDEwIEBAIGRlZiBwYWNrYWdlX2luaXRfbWFrZV9pbmZvKCk6
CiAgICAgICAgICAgICBwa2d2YXIgPSBwa2d2YXJbOi04XQogICAgICAgICAgICAgUGFja2FnZS5h
bGxfdmVyc2lvbnNbcGtndmFyXSA9IHZhbHVlCiAKKyAgICAgICAgZWxpZiBwa2d2YXIuZW5kc3dp
dGgoIl9WRVJTSU9OX1BSRUZJWCIpOgorICAgICAgICAgICAgcGtndmFyID0gcGtndmFyWzotMTVd
CisgICAgICAgICAgICBQYWNrYWdlLmFsbF92ZXJzaW9uc19wcmVmaXhlc1twa2d2YXJdID0gdmFs
dWUKKwogICAgICAgICBlbGlmIHBrZ3Zhci5lbmRzd2l0aCgiX0lHTk9SRV9DVkVTIik6CiAgICAg
ICAgICAgICBwa2d2YXIgPSBwa2d2YXJbOi0xMl0KICAgICAgICAgICAgIFBhY2thZ2UuYWxsX2ln
bm9yZWRfY3Zlc1twa2d2YXJdID0gdmFsdWUuc3BsaXQoKQotLSAKMi40OS4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
