Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C9DC54FDF
	for <buildroot@archiver.kernel.org>; Thu, 30 Jul 2026 07:59:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C15E408EB;
	Thu, 30 Jul 2026 07:59:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tm-fZnQqIyH1; Thu, 30 Jul 2026 07:59:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F686408ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785398394;
	bh=p7SYLy84Qld87Kz+3UQEXyyMKl+3hyHq+u1zg5qQVpc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=eGsCoGYhmE7Y68COTHw9J8WbwyWYoAvZ5PYGmpW4u03fHsxSZfRBB9tXb/U3H/uUP
	 J0eqzyrMMO228FtFVMYvlB3s2p6nALzd7wLQ/qXkbXpl/9pLc8IbzKgMeEwaNUE9oJ
	 uMnE7jb1LZKz6xCYSoTW2G4ChdPXCTuXEcgtl/GQ2XX9keK8GcooJH6gMSwSF81e89
	 o5BlsNxA9EIsZBeEX5LP2ZqF/7BPAj7fZNXSNICfqrncxb56JSAeZvB2DXam/fPVac
	 wJcPrfVBHuX9eUxMXOD9ImIcOPwClKa2Kvo2GiY1oSgSZmtVFnE8+PBXOub/OycI+L
	 LRmOBUIlendaQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F686408ED;
	Thu, 30 Jul 2026 07:59:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8038F27B
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 07:59:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E01C607B4
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 07:59:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o46-cfLRvAVU for <buildroot@buildroot.org>;
 Thu, 30 Jul 2026 07:59:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=flaviu.nistor@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6704F60670
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6704F60670
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6704F60670
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 07:59:51 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-495437bb891so3713315e9.1
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 00:59:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785398389; x=1786003189;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=QRkthABxqNpzdUR6X8yAQo6BWXHn8HAZeT8MvXDGRpU=;
 b=TA9a9zhSjR2st1Ta12/jRcSFAgukiJrHWZC8rtFqjUnxkoQJLtpRdNPN81lc8E3LDD
 kcvjw5Q/xoYJd01PFAnJk8y7eYUQnXYZlBTiWIzWEPBGzZYcxCRh2zNci4jHApSsx/UN
 sjeWXxhJUDMmRoJfIUMiET3wZ3kJWSJlCpngF+Wu152UPvLLPcXLNEgX2dcIiQHcto/9
 wPRhDCaxPEkfegiTXX/WuVH76jk84cZNHr04Vi7+yPOmRJ7MRWTdFnIu6lQA4ciadgNj
 5J4ZXAHWP2OfvYK1aUlbX+FCwSVajoNNGRTmIC6DgOKiM+wo7dQVrPIq0i3705YxCcvY
 KlTQ==
X-Gm-Message-State: AOJu0YznLXN2lxgGFo5oiVuzgdOf+6ybmDf2++pfSe2OS3EOe1nwb7Xc
 NXTv7kDDVagK69mBYNiRDZNh8UnhYEgYNHazf40NxUkiS2QTlxVVftzfH4nIwSfhGT4=
X-Gm-Gg: AR+sD13SJwH8jv60em8KJUPpPbTJomQQ3cdgPZAPZqH42UAGtmW2GawIuTMniKK9fu2
 8cNCkshVLXK6sMT9/uSKIZ+LmBCWb9fwJvacyu+0hZwaTMWNLASPcLZrZcnC7IjLUpwsBytg33k
 CFWvatkMTOmuoAoh62bji8a3r217QirsWhCBM5lY1MSotHLuQbq5RDS2fF37mcBAuT2ZlUxR4z8
 TTu5Owu2AOerAV9of9b8kmxKXWvhmN6ZkYe0xWE7YkwWGi1AVQjMkNJS9DsGW6K+8Bm/U0hfh9T
 44huNWNyK1YFSSdK6MMouk/sebTI10qdJtxflR1Jj3PsRTEeKdTXqxvHQ+N/XiIzeu9h9lUzziz
 ZtjWoa29Sgz2VamOwM3rI8w9THwKnGmuL0uOTf0pKLQM9DQunx9xSDfceeH8A8Zk+IdpiUBjTjF
 X9K41NBZgf4c0V8zf9gZzWmisgwRAX5eWL4xwPpCFhIomOAzY/dLL2tQvcqa5gffkFEn9fgt0Cj
 nEDkhtqrMqS0lOgxe9TkSHxIpxPTpm+KaXZmeD9hILJed8P
X-Received: by 2002:a05:600c:1389:b0:497:ff5a:38b9 with SMTP id
 5b1f17b1804b1-49801f11969mr12467885e9.9.1785398389364; 
 Thu, 30 Jul 2026 00:59:49 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([5.15.69.50])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4980120b42csm39007995e9.10.2026.07.30.00.59.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jul 2026 00:59:48 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 30 Jul 2026 10:59:40 +0300
Message-ID: <20260730075941.7679-3-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260730075941.7679-1-flaviu.nistor@gmail.com>
References: <20260730075941.7679-1-flaviu.nistor@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785398389; x=1786003189; darn=buildroot.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=QRkthABxqNpzdUR6X8yAQo6BWXHn8HAZeT8MvXDGRpU=;
 b=RTUuqrKA27CYNu1PwGwPqbYWARwN084KJpkmMxs/V/IsPmwSNVzgJLSztxt1v6WSjk
 a5Yh4p+wTraedB3aW4jsfDXZPsfcdAjuZ3e8v+csLdBeVqggb/1Nt5YFHvZHNSNc/HCf
 +xivWmnjNnP/fI2DmLJ07QYgAAfjn0XGL2O70Wo2WfwjeyP8UHGem29tLK/j4F7KGgXQ
 SFaHrX0tY/aNKUArGJylvqwJn+voZqFgi1Uljww5RP345yPZzNV0H5QzoElY0Ucfgn5B
 VIk7qbj18z8QrY2aTUptpGYfBM8DOuhSKw3aHLToZepYP3K/tLUrGsu3VABkYm+eS5TS
 7PPA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=RTUuqrKA
Subject: [Buildroot] [PATCH v4 3/3] support/testing: add snappy test
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
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWRkIGEgc2ltcGxlIHRlc3QgY2FzZSB0aGF0IGltcG9ydHMgdGhlIG1vZHVsZSBhbmQgZG9lcyBh
IHNpbXBsZSBjb21wcmVzcwpkZWNvbXByZXNzIHJvdXRpbmUuCgpTaWduZWQtb2ZmLWJ5OiBGbGF2
aXUgTmlzdG9yIDxmbGF2aXUubmlzdG9yQGdtYWlsLmNvbT4KLS0tCiBERVZFTE9QRVJTICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArKwogLi4uL3Rlc3RzL3BhY2thZ2Uv
c2FtcGxlX3B5dGhvbl9zbmFwcHkucHkgICAgIHwgIDcgKysrKwogLi4uL3Rlc3RzL3BhY2thZ2Uv
dGVzdF9weXRob25fc25hcHB5LnB5ICAgICAgIHwgMzQgKysrKysrKysrKysrKysrKysrKwogMyBm
aWxlcyBjaGFuZ2VkLCA0MyBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgc3VwcG9y
dC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2Uvc2FtcGxlX3B5dGhvbl9zbmFwcHkucHkKIGNyZWF0ZSBt
b2RlIDEwMDY0NCBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3B5dGhvbl9zbmFw
cHkucHkKCmRpZmYgLS1naXQgYS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUwppbmRleCBkYmUwNWI3
ODA2Li4xNTNiMmY0YWY1IDEwMDY0NAotLS0gYS9ERVZFTE9QRVJTCisrKyBiL0RFVkVMT1BFUlMK
QEAgLTExNDAsNiArMTE0MCw4IEBAIEY6CXBhY2thZ2UvcHl0aG9uLWNyYW1qYW0vCiBGOglwYWNr
YWdlL3B5dGhvbi1yaWNoLwogRjoJcGFja2FnZS9weXRob24tc21tYXAyLwogRjoJcGFja2FnZS9w
eXRob24tc25hcHB5LworRjoJc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2Uvc2FtcGxlX3B5
dGhvbl9zbmFwcHkucHkKK0Y6CXN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfcHl0
aG9uX3NuYXBweS5weQogCiBOOglGbMOhdmlvIFRhcGFqw7NzIDxmbGF2aW8udGFwYWpvc0BuZXd0
ZXNjLmNvbS5icj4KIEY6CWNvbmZpZ3MvYXN1c190aW5rZXItc19yazMyODhfZGVmY29uZmlnCmRp
ZmYgLS1naXQgYS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS9zYW1wbGVfcHl0aG9uX3Nu
YXBweS5weSBiL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3NhbXBsZV9weXRob25fc25h
cHB5LnB5Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLmZmMmMwN2MwNWEK
LS0tIC9kZXYvbnVsbAorKysgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS9zYW1wbGVf
cHl0aG9uX3NuYXBweS5weQpAQCAtMCwwICsxLDcgQEAKK2ltcG9ydCBzbmFwcHkKKworcGF5bG9h
ZCA9IGIiQnVpbGRyb290IHB5dGhvbi1zbmFwcHkgcnVudGltZSB0ZXN0XG4iCitjb21wcmVzc2Vk
ID0gc25hcHB5LmNvbXByZXNzKHBheWxvYWQpCitkZWNvbXByZXNzZWQgPSBzbmFwcHkudW5jb21w
cmVzcyhjb21wcmVzc2VkKQorCithc3NlcnQgZGVjb21wcmVzc2VkID09IHBheWxvYWQKZGlmZiAt
LWdpdCBhL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfcHl0aG9uX3NuYXBweS5w
eSBiL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfcHl0aG9uX3NuYXBweS5weQpu
ZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi44YzAwOTJiZDIzCi0tLSAvZGV2
L251bGwKKysrIGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9weXRob25fc25h
cHB5LnB5CkBAIC0wLDAgKzEsMzQgQEAKK2ltcG9ydCBvcworCitmcm9tIHRlc3RzLnBhY2thZ2Uu
dGVzdF9weXRob24gaW1wb3J0IFRlc3RQeXRob25QYWNrYWdlQmFzZQorCisKK2NsYXNzIFRlc3RQ
eXRob25QeTNTbmFwcHkoVGVzdFB5dGhvblBhY2thZ2VCYXNlKToKKyAgICBfX3Rlc3RfXyA9IFRy
dWUKKyAgICBjb25maWcgPSAiIiIKKyAgICAgICAgQlIyX2FhcmNoNjQ9eQorICAgICAgICBCUjJf
VE9PTENIQUlOX0VYVEVSTkFMPXkKKyAgICAgICAgQlIyX1RBUkdFVF9HRU5FUklDX0dFVFRZX1BP
UlQ9InR0eUFNQTAiCisgICAgICAgIEJSMl9MSU5VWF9LRVJORUw9eQorICAgICAgICBCUjJfTElO
VVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OPXkKKyAgICAgICAgQlIyX0xJTlVYX0tFUk5FTF9DVVNU
T01fVkVSU0lPTl9WQUxVRT0iNi42LjEzNSIKKyAgICAgICAgQlIyX0xJTlVYX0tFUk5FTF9VU0Vf
Q1VTVE9NX0NPTkZJRz15CisgICAgICAgIEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX0NPTkZJR19G
SUxFPSJib2FyZC9xZW11L2FhcmNoNjQtdmlydC9saW51eC5jb25maWciCisgICAgICAgIEJSMl9Q
QUNLQUdFX1BZVEhPTjM9eQorICAgICAgICBCUjJfUEFDS0FHRV9QWVRIT05fU05BUFBZPXkKKyAg
ICAgICAgQlIyX1RBUkdFVF9ST09URlNfQ1BJTz15CisgICAgICAgICMgQlIyX1RBUkdFVF9ST09U
RlNfVEFSIGlzIG5vdCBzZXQKKyAgICAgICAgIiIiCisgICAgaW50ZXJwcmV0ZXIgPSAicHl0aG9u
MyIKKyAgICBzYW1wbGVfc2NyaXB0cyA9IFsidGVzdHMvcGFja2FnZS9zYW1wbGVfcHl0aG9uX3Nu
YXBweS5weSJdCisgICAgdGltZW91dCA9IDIwCisKKyAgICBkZWYgbG9naW4oc2VsZik6CisgICAg
ICAgIGNwaW9fZmlsZSA9IG9zLnBhdGguam9pbihzZWxmLmJ1aWxkZGlyLCAiaW1hZ2VzIiwgInJv
b3Rmcy5jcGlvIikKKyAgICAgICAga2VybiA9IG9zLnBhdGguam9pbihzZWxmLmJ1aWxkZGlyLCAi
aW1hZ2VzIiwgIkltYWdlIikKKyAgICAgICAgc2VsZi5lbXVsYXRvci5ib290KGFyY2g9ImFhcmNo
NjQiLAorICAgICAgICAgICAgICAgICAgICAgICAgICAga2VybmVsPWtlcm4sCisgICAgICAgICAg
ICAgICAgICAgICAgICAgICBrZXJuZWxfY21kbGluZT1bImNvbnNvbGU9dHR5QU1BMCJdLAorICAg
ICAgICAgICAgICAgICAgICAgICAgICAgb3B0aW9ucz1bIi1NIiwgInZpcnQiLCAiLWNwdSIsICJj
b3J0ZXgtYTU3IiwgIi1tIiwgIjI1Nk0iLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIi1pbml0cmQiLCBjcGlvX2ZpbGVdKQorICAgICAgICBzZWxmLmVtdWxhdG9yLmxvZ2lu
KCkKLS0gCjIuMzQuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
