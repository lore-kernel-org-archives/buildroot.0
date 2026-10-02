Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02106CA5FE3
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 10:32:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6473E60B5E;
	Fri,  2 Oct 2026 10:32:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CxcyAhbzE4WA; Fri,  2 Oct 2026 10:32:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 60C8760B35
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790937131;
	b=dinytDTRXqNAUHN8tEZDVG1SuAncJSjHKZfq86WS0+LZ1A4cHi8Uip2zmX5FEoof7zYs
	 IJ3cJjTFR7mtryLrIbZjdrBV/peS3nMnufa/BqujGH59d7iCNKkaLtTXUVFJUFHBJ6z5Y
	 GTid83htLxDAgjZORy31ZdMxI+SnptMMhE9qWi9Nwem3eJcSOtpYB1v17AyjqDpjy3elV
	 Cb1zM4WRuMSQZQv6Okz8mbpbsO1ReEW9s7sWFpx6akzQmD8yte+Zfy5NfOj+txculHngp
	 WeUwmBNgWniKnPKgWuf973FCQr2oOWwbqaMGsO4YtKNQcyQOjo0atetJOXYVn77MxRw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790937131;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=J3aO+5hsXoYA8Q1RV+wczKYIbFNQLbYlus4GlFi9yPg=;
	b=QTo1H6FKdH51H9XHg+7dkGdGiSdjtTXBkQmAW2oVI1EB34LHUuqdaqOvWomxf45uU19M
	 ZLcah/gdoms8BVbdbbE+2tTv8xnhA7Yrp0kKX/UokKyOwnOSu32Urc/h/drRaaoEybreV
	 JIYj4VzMfnzTHcJuYR6Cq7Lxk1PglAkU82WCWGKqiLQ0/u46g/aoJAd3xB9+1RNN54/WR
	 weqsasaizd9jkCZj8q5y3riFlq4u60g9QVhobv0HVsVeYNqhnLinYegVukby7b01dWtTg
	 ZoSg6zNh48n3/ZiyTFPpYS2GyyvGtvYlumyP/wzjM2xI83ge2YfXX//BEwTVjaaVmQA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790937131;
	bh=J3aO+5hsXoYA8Q1RV+wczKYIbFNQLbYlus4GlFi9yPg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=FySFYDjiGpbKPEYLRAZemuh6AnFzqZNBMVGbK+/6is98M+Y5wcRSuuVHu/8CuUvdN
	 /fgjah6ZCsA8ryZwY2M1Fw7WRjKZE8iYXnGEE+LKq3iEsyzDC/2+5hzATqSVHjolYG
	 Hp16EYQQ0TWkMmoWoFANhtx6opbI7MsnS//YDIqjlSNkpyeehwYtFDXptcpVa3kabl
	 i1Snp7N2lTx6LIRvCk1DzcpJDqPgBeCjeXVAnuyekDw3mxNDPUM2Bx9yqAyzgfpqf5
	 aoe88BFtOs7TQYgl0M+/+GYfU8oq9qXrM/CtEhdHyLPvFOy4InW4ofmDyM5DGU/KYj
	 Vq4yd7q56yuYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60C8760B35;
	Fri,  2 Oct 2026 10:32:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 38DCC3AC
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 10:32:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F17F80F69
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 10:32:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ryUz0NR1VCVi for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 10:32:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org A14CA81202
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790937128;
 b=MDy1DJVpGDeyYi8BL+OrKTZSkv+2SNnWZ60QmI/VA41I1fW6D6mHmtW9ctbaKX3SteDS
 jFIZBDy6QDotDMSdqb4DyDlCjubCTx535CaeBU3OmnQRwrtnH1xLbxZOp8+ftp4avZVto
 2k+Ufxq+0ghxvlAXQ+wSl/rIyZOuxUc3rpYifnuhxfBt3i+AOHKu+i4uRDqWs8YWS9Jhy
 HTev/GQIIJQyzhSXBk8rgmf72jymOk7f0CksgexEX1fVImhZLbH4ffkWmf/FwcnmfCpUI
 zRZUkSrN5zLXHprNuB4gjejsdxHYCyyWE2wmNGBW/WuEuFZ4El3h8tf2dUue8LfZ/4Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790937128;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding;
 bh=VUH8VPQbs26J7Amm0sWE7DoSvwAxM3BzrIIvy2qRu4Q=;
 b=X9Opjw3kCF2rJeOi14OuxIKXAtj4JhZ66xKzmUogKHSR6ivVjcH5X40KPidrZ2vjPms6
 Nhv8i7HScCVBhv0gL854G0tknF7Lw2RppOPbzutNjUEZkMz9NMSaBZ0RL1rZjY5gDpbOc
 BaAfWIZfBAINgUZKHIiAtxWbIRL62cU3qzXwCPBtPcd3RHx63Sk6KVMhS7kCs7IqadDCR
 +8TfWg9mi2xf5IN3z11IG8t7zEUfjXIEd/ryQX/Qeamzg+DY7IrFaPpEyFL5aWMnYl3TO
 RrkE3mvdtvl4S5J9ePbEZQh60+rm6m9rezdc4pa14EljzJgq7JD79UDYpLd/SzeYhkQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=jDAP8mgH; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com;
 envelope-from=flaviu.nistor@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=jDAP8mgH
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com
 [IPv6:2a00:1450:4864:31::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A14CA81202
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 10:32:06 +0000 (UTC)
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49ffde3cec6so36061345e9.3
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 03:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790937124; x=1791541924; darn=buildroot.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=VUH8VPQbs26J7Amm0sWE7DoSvwAxM3BzrIIvy2qRu4Q=;
 b=jDAP8mgHwyAihdUvpHvYVZLNulk/4Yokx57zs15ZPjrFDXrK4yZ8SUMh6pkx5EaHOB
 FbQQ/cuvrwuH7OmvDGLSkYLShYSlaszVbJ8GFZMgnlqErvHrhMP2A5NuaZXz0IquDOAH
 GAU83YkdAH/voJufioLM8W7o+bztoEEDjj6KvlB9zLDAlB9WMVE9zEU/kgvzCR7fHaN+
 tVIxq7oEcsNfhoReRWC4nCGpnFIuSQWnHZaeKM86q4907+Tn4s1NXfgIYa0m6mK4jkFk
 DknCo1y4Qta7uZOJELPQd8Oa7SPigClAvEO3AvUPc6Ysgm06/qukbRlbPJtvCR6FAhsQ
 szKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790937124; x=1791541924;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=VUH8VPQbs26J7Amm0sWE7DoSvwAxM3BzrIIvy2qRu4Q=;
 b=SiYxoRuYeP+VMP5h3PvSuY7KYtVqoqeD8FkHTNek9fD1UhwEJxb1CT44nhi+QjStUb
 CVh08RlOfPZ1RoOcH/AgbQTuKG88pDkxIcVTnx1Y7zisx35wvSfEnjlwmsHW+uYe1n+Y
 EkZh8vqiQdTyOtWA0hgbqJA6At68ffuniGKwtMq3GnteUvCvCQdyTEPxvod83jJvkeFY
 TcE92gCdMyf1Gw0dK/Qkx/z9DseDFxbLx9FBOrivF54hr+nA+W25imFgbBJOunY6KgCy
 dgrFiT4naG84mkGLSBaSAi3GblZIT6+o7Gjd0ftDBoAht7tlPGxyIieCI6aDPV5CC+30
 V0QQ==
X-Gm-Message-State: AFuF++n3qPzdciTrLotluttCu8cpbvI6ZnesKW3l0cukr+R2Ff2+D2XU
 WVQ5nfv71KD9ZTypSfGFw8v0fHGqEV/C6vJIhvYtWJTsqHa5JujwIkqTr2/Xjki3gZPCOw==
X-Gm-Gg: AYBFou0ZnIAEEmwHNUyiMOhqYxELN8DrX22ahnF9HKSjlFa5lMfIX9JKPdf+koG65QA
 S8rPSdmqnx+rggceAsMtThOecGd0Fmmk2ssXXdppnKPk2FaY0MQQVwYTq31/nJJyNuLGV/ryzHp
 VMDSG/FSGlZXOm13ICCN7aLhHSab1Rz4+7BC67m+f1VKeXg5Gz+0kRK7+zqjzOZonIDj0u4ysg+
 Lgw40bVnY6Ry+1pqt7IpXuqK7D2D91W9oWJEq4kckw/v256YWSHEBShFiBnqAH8fMrYxisgIB+1
 sKgBRjDulH9T9pYWTcEr5NVo0VpUR0efS6vGGOBo+lqozHk/XGPH7I6B5eixFYp5rvQoGaJx90d
 EqAOb8Pa3J0OZ15CtqjUFqm6ry0Fr/5xOMtaMB+z25dbq60fL3icBhzd7tr56C5cJdFyUr8RWER
 icryQtRMwxJ8QzE3//KSa0HVCkuokEr2/9tEUFv4yiAXCEsdI+eaoiKOnITBVle03RY6km6Ioq1
 Mw6/vGzf2Md5wgd3atfeU0nHitw8XZ4YP5erFHhLm+tQukfkgWc0nLcQQs61mU=
X-Received: by 2002:a05:600c:3113:b0:4a0:d1f4:b1d1 with SMTP id
 5b1f17b1804b1-4a0d1f4b2b0mr25328525e9.24.1790937123969; 
 Fri, 02 Oct 2026 03:32:03 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([93.122.248.104])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a027734b49sm73677865e9.10.2026.10.02.03.32.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 03:32:03 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 13:31:36 +0300
Message-ID: <20261002103144.13914-2-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002103144.13914-1-flaviu.nistor@gmail.com>
References: <20261002103144.13914-1-flaviu.nistor@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 RESEND 2/3] package/python-snappy: bump
 version to 0.7.2
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

RXZlbiBpZiB0aGVyZSBpcyBhIDAuNy4zIG9uIFB5cGksIHRoZXJlIGlzIG5vIDAuNy4zIHJlbGVh
c2UKb24gdGhlIHByb2plY3QgaG9tZXBhZ2UsIGhlbmNlIHRoZSBidW1wIHRvIDAuNy4yLgpTaW5j
ZSAwLjcuMCBpcyBzd2l0Y2hlZCBmcm9tIHNuYXBweSBsaWJyYXJ5IHRvIGNyYW1qYW0gc28KdXBk
YXRlIHRoZSBQWVRIT05fU05BUFBZX0RFUEVOREVOQ0lFUy4KQWRkIGFsc28gUFlUSE9OX1NOQVBQ
WV9TT1VSQ0UgZm9yIGNvcnJlY3QgcGFja2FnZSBvbiBQeXBpLgoKU2lnbmVkLW9mZi1ieTogRmxh
dml1IE5pc3RvciA8Zmxhdml1Lm5pc3RvckBnbWFpbC5jb20+Ci0tLQpDaGFuZ2VzIGluIHY0Ogot
IEFkZCBhbHNvIHRlc3RzIGZvciBweXRob24tc25hcHB5IGFzIGluZGljYXRlZCBieSBKdWxpZW4g
T2xpdmFpbi4KLSBNb3JlIGNsZWFuIHBhY2thZ2UgQ29uZmlnLmluCi0gTGluayB0byB2MzogaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYwNzI0MDY1MDA0LjIxNzQxMS0xLWZsYXZpdS5u
aXN0b3JAZ21haWwuY29tLwpDaGFuZ2VzIGluIHYzOgotIEFkZCBuZXcgcGFja2FnZSBjcmFtamFt
IGFuZCB0byBmaXggZXJyb3IgaW5kaWNhdGVkIGJ5IEp1bGllbiBPbGl2YWluLgotIExpbmsgdG8g
djI6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MDcxNzA2MTk0My40NDkxLTEtZmxh
dml1Lm5pc3RvckBnbWFpbC5jb20vCkNoYW5nZXMgaW4gdjI6Ci0gRml4IGVycm9yIGluZGljYXRl
ZCBieSBKdWxpZW4gT2xpdmFpbiB3aGVuIHJ1bm5pbmcgbWFrZSBweXRob24tc25hcHB5LWxlZ2Fs
LWluZm8uCi0gTGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYwNDA5
MTUyNTIwLjU4OTQtMS1mbGF2aXUubmlzdG9yQGdtYWlsLmNvbS8KCiBERVZFTE9QRVJTICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgNCArKysrCiBwYWNrYWdlL3B5dGhvbi1zbmFwcHkv
Q29uZmlnLmluICAgICAgICAgIHwgNyArKy0tLS0tCiBwYWNrYWdlL3B5dGhvbi1zbmFwcHkvcHl0
aG9uLXNuYXBweS5oYXNoIHwgNCArKy0tCiBwYWNrYWdlL3B5dGhvbi1zbmFwcHkvcHl0aG9uLXNu
YXBweS5tayAgIHwgNyArKysrLS0tCiA0IGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyks
IDEwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL0RFVkVMT1BFUlMgYi9ERVZFTE9QRVJTCmlu
ZGV4IDkzNTE5NTc0YzkuLmRiZTA1Yjc4MDYgMTAwNjQ0Ci0tLSBhL0RFVkVMT1BFUlMKKysrIGIv
REVWRUxPUEVSUwpAQCAtMTEzNSw3ICsxMTM1LDExIEBAIEY6CXN1cHBvcnQvdGVzdGluZy90ZXN0
cy9wYWNrYWdlL3Rlc3RfcHl0aG9uX25ldHdvcmttYW5hZ2VyX2dvaS5weQogRjoJc3VwcG9ydC90
ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9weXRob25fcHlyb3V0ZTIucHkKIAogTjoJRmxhdml1
IE5pc3RvciA8Zmxhdml1Lm5pc3RvckBnbWFpbC5jb20+CitGOglwYWNrYWdlL3B5dGhvbi1jbGlj
ay8KIEY6CXBhY2thZ2UvcHl0aG9uLWNyYW1qYW0vCitGOglwYWNrYWdlL3B5dGhvbi1yaWNoLwor
RjoJcGFja2FnZS9weXRob24tc21tYXAyLworRjoJcGFja2FnZS9weXRob24tc25hcHB5LwogCiBO
OglGbMOhdmlvIFRhcGFqw7NzIDxmbGF2aW8udGFwYWpvc0BuZXd0ZXNjLmNvbS5icj4KIEY6CWNv
bmZpZ3MvYXN1c190aW5rZXItc19yazMyODhfZGVmY29uZmlnCmRpZmYgLS1naXQgYS9wYWNrYWdl
L3B5dGhvbi1zbmFwcHkvQ29uZmlnLmluIGIvcGFja2FnZS9weXRob24tc25hcHB5L0NvbmZpZy5p
bgppbmRleCBmZDdmODQwNTBmLi5lMTNjNmFiYWRiIDEwMDY0NAotLS0gYS9wYWNrYWdlL3B5dGhv
bi1zbmFwcHkvQ29uZmlnLmluCisrKyBiL3BhY2thZ2UvcHl0aG9uLXNuYXBweS9Db25maWcuaW4K
QEAgLTEsMTIgKzEsOSBAQAogY29uZmlnIEJSMl9QQUNLQUdFX1BZVEhPTl9TTkFQUFkKIAlib29s
ICJweXRob24tc25hcHB5IgotCWRlcGVuZHMgb24gQlIyX0lOU1RBTExfTElCU1REQ1BQICMgc25h
cHB5Ci0Jc2VsZWN0IEJSMl9QQUNLQUdFX1NOQVBQWQorCWRlcGVuZHMgb24gIUJSMl9BUk1fQ1BV
X0FSTVY1CSNjcmFtamFtCisJc2VsZWN0IEJSMl9QQUNLQUdFX1BZVEhPTl9DUkFNSkFNCiAJaGVs
cAogCSAgUHl0aG9uIGxpYnJhcnkgZm9yIHRoZSBzbmFwcHkgY29tcHJlc3Npb24gbGlicmFyeSBm
cm9tCiAJICBHb29nbGUuCiAKIAkgIGh0dHA6Ly9naXRodWIuY29tL2FuZHJpeC9weXRob24tc25h
cHB5Ci0KLWNvbW1lbnQgInB5dGhvbi1zbmFwcHkgbmVlZHMgYSB0b29sY2hhaW4gdy8gQysrIgot
CWRlcGVuZHMgb24gIUJSMl9JTlNUQUxMX0xJQlNURENQUApkaWZmIC0tZ2l0IGEvcGFja2FnZS9w
eXRob24tc25hcHB5L3B5dGhvbi1zbmFwcHkuaGFzaCBiL3BhY2thZ2UvcHl0aG9uLXNuYXBweS9w
eXRob24tc25hcHB5Lmhhc2gKaW5kZXggYzRkYmM3MjA3Ny4uMmY0MGI2YzUzMSAxMDA2NDQKLS0t
IGEvcGFja2FnZS9weXRob24tc25hcHB5L3B5dGhvbi1zbmFwcHkuaGFzaAorKysgYi9wYWNrYWdl
L3B5dGhvbi1zbmFwcHkvcHl0aG9uLXNuYXBweS5oYXNoCkBAIC0xLDUgKzEsNSBAQAogIyBtZDUs
IHNoYTI1NiBmcm9tIGh0dHBzOi8vcHlwaS5vcmcvcHlwaS9weXRob24tc25hcHB5L2pzb24KLW1k
NSAgZmM4NGNmYTM1MjZmYmEwNmQ2NmYwZDBiMmU3NjQzMDAgIHB5dGhvbi1zbmFwcHktMC42LjEu
dGFyLmd6Ci1zaGEyNTYgIGI2YTEwN2FiMDYyMDZhY2M1MzU5ZDRjNTYzMmJkOWIyMmQ0NDg3MDJh
NzliMzE2OWIwYzYyZTBmYjgwOGJiMmEgIHB5dGhvbi1zbmFwcHktMC42LjEudGFyLmd6CittZDUg
IDA0YTRlNThiMGE5MzI0MDNiYjI4NTkwMGU2N2M3NzhkICBweXRob25fc25hcHB5LTAuNy4yLnRh
ci5negorc2hhMjU2ICAwNGJmMTgyZjlkOWY2N2I3YTg0NmRhZTJmMWRmMzYxODBjZWVlZThkMzM4
MGU0YjY3OTlkZWZmNTI3MmM0OTc4ICBweXRob25fc25hcHB5LTAuNy4yLnRhci5negogIyBMb2Nh
bGx5IGNvbXB1dGVkIHNoYTI1NiBjaGVja3N1bXMKIHNoYTI1NiAgZDAwN2NiMDVmMTQzZDk5ZDE2
ZDVjZDBkMWJmMjkxZGFmMDM3YWRiMzY4MDAzNDRlNDQwZWMyNmVkYjkzOGY5YSAgTElDRU5TRQpk
aWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tc25hcHB5L3B5dGhvbi1zbmFwcHkubWsgYi9wYWNr
YWdlL3B5dGhvbi1zbmFwcHkvcHl0aG9uLXNuYXBweS5tawppbmRleCBlODBhYTg2MWRmLi41ZDM0
YjZkNDkzIDEwMDY0NAotLS0gYS9wYWNrYWdlL3B5dGhvbi1zbmFwcHkvcHl0aG9uLXNuYXBweS5t
aworKysgYi9wYWNrYWdlL3B5dGhvbi1zbmFwcHkvcHl0aG9uLXNuYXBweS5tawpAQCAtNCwxMSAr
NCwxMiBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIAotUFlUSE9OX1NOQVBQWV9WRVJT
SU9OID0gMC42LjEKLVBZVEhPTl9TTkFQUFlfU0lURSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9z
dGVkLm9yZy9wYWNrYWdlcy85OC83YS80NGEyNGJhZDk4MzM1YjJjNzJlNGNhZGNkZWNmNzlmNTAx
OTdkMWJhYjlmMjJmODYzYTI3NGYxMDRiOTYKK1BZVEhPTl9TTkFQUFlfVkVSU0lPTiA9IDAuNy4y
CitQWVRIT05fU05BUFBZX1NPVVJDRSA9IHB5dGhvbl9zbmFwcHktJChQWVRIT05fU05BUFBZX1ZF
UlNJT04pLnRhci5negorUFlUSE9OX1NOQVBQWV9TSVRFID0gaHR0cHM6Ly9maWxlcy5weXRob25o
b3N0ZWQub3JnL3BhY2thZ2VzL2NiLzUyL2FjZDg3NTgzMTc1ZmE5MzBlNDM4NWY4YTYxNjRlYjU5
MDlhY2Q2ODNjMGU2MmVlMDFkNDFkZTgxOTVhMgogUFlUSE9OX1NOQVBQWV9TRVRVUF9UWVBFID0g
c2V0dXB0b29scwogUFlUSE9OX1NOQVBQWV9MSUNFTlNFID0gQlNELTMtQ2xhdXNlCiBQWVRIT05f
U05BUFBZX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFCi1QWVRIT05fU05BUFBZX0RFUEVOREVOQ0lF
UyA9IHNuYXBweQorUFlUSE9OX1NOQVBQWV9ERVBFTkRFTkNJRVMgPSBob3N0LXB5dGhvbi1jcmFt
amFtIHB5dGhvbi1jcmFtamFtCiAKICQoZXZhbCAkKHB5dGhvbi1wYWNrYWdlKSkKLS0gCjIuMzQu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
