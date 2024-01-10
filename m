Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14FDDC4707B
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 15:23:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADDD542157;
	Wed, 10 Jan 2024 15:23:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADDD542157
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id obSLTDn3Lko3; Wed, 10 Jan 2024 15:23:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D49C42200;
	Wed, 10 Jan 2024 15:23:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D49C42200
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 78C5C1BF364
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 15:23:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D0E1436E1
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 15:23:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D0E1436E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jy0ZAqvd6tcM for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 15:23:12 +0000 (UTC)
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 97BEC436D9
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 15:23:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97BEC436D9
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-5cddc5455aeso1873850a12.1
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 07:23:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704900192; x=1705504992;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0BEC67tXPN3TuOtnQsK09a6UINvhSIQ5SiLO7ipovMk=;
 b=AWeR+7jgFSsxYaFeJfsu42JBVXMtwtJV2frxXtEFChr6HIM51hqjHRdLmubhazGT70
 gcumc7cNvsibbzcXrKJVk7kAn3ddWeAFrgO14dAH/Uxxw6CZRu2hodM0MudkKYgH7+I5
 XF9wxyjn4pP/eCdA3Qt86aR/EiX130/D8nOyMyM6QxYtLM6BcWeMc0Hdvqv6CGqdDLw8
 7r2DnGzrDC8qBbwTthDoq9I/FbHIEozot+KpcL9sVua7Moc46W9FgvSa3F0ralTbkQxZ
 VI8MbaNvs4MJFlWWSQEIDaF8NqRm8QHdV2ey9dLOmviV0KsWEsHjqUyEhCVKnt6QY+ko
 gN7g==
X-Gm-Message-State: AOJu0YwGXlclWgctCpdq6BSw142Z5P7rioT6mfmJnZmq+HtixCIQVg++
 h6m9VQbRLOi0eykDDBU0cLuWWpz6BWBjBe2X1uRHfu79Byg=
X-Google-Smtp-Source: AGHT+IFM9lz84mcbcrlTf3tXiufjwgdgD5NKiO0xocv+Y6LN5Ua8eWX6oA2Kxp4AXpudt3dlN1ZLpg==
X-Received: by 2002:a17:90a:dc07:b0:28b:db13:e9f7 with SMTP id
 i7-20020a17090adc0700b0028bdb13e9f7mr731567pjv.31.1704900191892; 
 Wed, 10 Jan 2024 07:23:11 -0800 (PST)
Received: from alesmao.newtesc.com ([187.120.6.114])
 by smtp.gmail.com with ESMTPSA id
 mr17-20020a17090b239100b0028bc870da3fsm1733298pjb.22.2024.01.10.07.23.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 07:23:11 -0800 (PST)
From: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 12:22:46 -0300
Message-ID: <20240110152246.1605712-2-flavio.tapajos@newtesc.com.br>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240110152246.1605712-1-flavio.tapajos@newtesc.com.br>
References: <20240110152246.1605712-1-flavio.tapajos@newtesc.com.br>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=newtesc-com-br.20230601.gappssmtp.com; s=20230601; t=1704900192; x=1705504992;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0BEC67tXPN3TuOtnQsK09a6UINvhSIQ5SiLO7ipovMk=;
 b=EWvL4TJA7e6GaW6JBb0jBlx/qv/zeJPLB9fv+lm+1o6Cjzi+fUkAkRRKiMg/5W03Dn
 Tk8e7jyVvIHgw/DDsnhwCz8LuyQXwwOYjWFMr0tudacf8fBlFr81P8OpevfQwbYGTGZQ
 NqyVYxM7stRhBp54xAJsHnLjTETtsm7CXJvEetK3QCQ/3NIi06IM5wfiwnGv5gVfncRz
 XbUucXYCGOPDLNymZxRt3hzAavLxNTdn4NNwN6PXZ8ZRqOrd/vE9nworiZ8dumqc1J0S
 M7u5sPNbbe3QGtjnLxd6UL2Zxsnsls07C5FGF2Y+ZSFhNgimcI4PHGuWOkFqYWSTplNC
 LVxQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=newtesc-com-br.20230601.gappssmtp.com
 header.i=@newtesc-com-br.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=EWvL4TJA
Subject: [Buildroot] [PATCH 2/2] configs/asus_tinker-s_rk3288: bump U-boot
 to 2024.01
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
Cc: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogRmzDoXZpbyBUYXBhasOzcyA8ZmxhdmlvLnRhcGFqb3NAbmV3dGVzYy5j
b20uYnI+Ci0tLQogY29uZmlncy9hc3VzX3Rpbmtlci1zX3JrMzI4OF9kZWZjb25maWcgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9jb25maWdzL2FzdXNfdGlua2VyLXNfcmszMjg4X2RlZmNvbmZpZyBiL2NvbmZpZ3MvYXN1
c190aW5rZXItc19yazMyODhfZGVmY29uZmlnCmluZGV4IGFkMmNjZWM5ZjkuLmZjMWIzYjM1MDUg
MTAwNjQ0Ci0tLSBhL2NvbmZpZ3MvYXN1c190aW5rZXItc19yazMyODhfZGVmY29uZmlnCisrKyBi
L2NvbmZpZ3MvYXN1c190aW5rZXItc19yazMyODhfZGVmY29uZmlnCkBAIC0xMCw3ICsxMCw3IEBA
IEJSMl9QQUNLQUdFX0hPU1RfTElOVVhfSEVBREVSU19DVVNUT01fNl8xPXkKIEJSMl9UQVJHRVRf
VUJPT1Q9eQogQlIyX1RBUkdFVF9VQk9PVF9CVUlMRF9TWVNURU1fS0NPTkZJRz15CiBCUjJfVEFS
R0VUX1VCT09UX0NVU1RPTV9WRVJTSU9OPXkKLUJSMl9UQVJHRVRfVUJPT1RfQ1VTVE9NX1ZFUlNJ
T05fVkFMVUU9IjIwMjMuMTAiCitCUjJfVEFSR0VUX1VCT09UX0NVU1RPTV9WRVJTSU9OX1ZBTFVF
PSIyMDI0LjAxIgogQlIyX1RBUkdFVF9VQk9PVF9CT0FSRF9ERUZDT05GSUc9InRpbmtlci1zLXJr
MzI4OCIKIEJSMl9UQVJHRVRfVUJPT1RfTkVFRFNfRFRDPXkKIEJSMl9UQVJHRVRfVUJPT1RfTkVF
RFNfUFlUSE9OMz15Ci0tIAoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
