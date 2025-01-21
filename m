Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 285FEC02182
	for <buildroot@archiver.kernel.org>; Tue, 21 Jan 2025 13:49:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7B72608E9;
	Tue, 21 Jan 2025 13:49:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oVPGwHGmRNdu; Tue, 21 Jan 2025 13:49:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D295A608F5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D295A608F5;
	Tue, 21 Jan 2025 13:49:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D73969
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 13:49:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6AF3F40585
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 13:49:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vdw6HNzUqd9z for <buildroot@buildroot.org>;
 Tue, 21 Jan 2025 13:49:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=salvador.joseluis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8B6B94004A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B6B94004A
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8B6B94004A
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 13:49:07 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-436ce2ab251so39360575e9.1
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 05:49:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737467345; x=1738072145;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VSdvVoHM9t9hA3PqYGdRta6PklBQuQaXEyVHvMz5dCQ=;
 b=XqMOT0qcm1fuCgzu7hD5deaAqbNSKJ0WYoe/efBI95HD0Fq7fK4TolDbEDvxWvnuIt
 /jQkmseOOZd6zXv325g5eqpc0nKnZMjI9wAlo0LOuIglb78RMbcPE1CSbZXxOYKupdQ3
 Rom6bDNky2bo2jrSfoOKEqRGsM4k4fVIQmsYJgYDo6Du/loQyNBrIkKk1s78y2LS1z1/
 /+GBKPJ4oZGRiwheYcGFl0EthEpLqynToW364RnQH+X6yLUFk3D32IY6g6qu3PeTopVE
 TkgLcbDOJ8rU7BZXTLKHu8dKTGfs/qfe0vc0C0kpPOyGIlcp/wklIC+6+e0F2mdpfOHS
 f1Sg==
X-Gm-Message-State: AOJu0YzyZPbxE12PRILlJYf5tAFl8IPoW/vNY3DtmpaLSytJO+5foHw4
 kiX02KBVLgvFgz3/xiiYlRP6NejQSUdjlAVSfoAtIQh3vvbkeTD7xSFf0A==
X-Gm-Gg: ASbGnct0y1WX+NqobEHD2vIDkVlNbE9yGfZM9KGa+EZwXbxyQklORSBhXBn1R0glgJx
 7D/ss7b72XANMO5r7rPOrqUpifHKNSHBqS3P4n5R5FY6Vm41E3V3gf/f9Hknkh1DgXJozAufpaq
 U7v4pMdT+shcKzIZWG8+FBhFYA6Cqvxvqos5fSwtuDqDSoF2eG6Q3fd2IL6GC6yX+BMfEdZaY5i
 J0jcwXI05aRgU4G/7GOYz2Aoh4tMZ0eXqijjwkbxpl47IKzD+ZzbI83PL8iVHSFILWbnQpagboB
 xNH6Qh7otWAJ0thKEweSn9iKcgU9yrUFcJ0=
X-Google-Smtp-Source: AGHT+IEYopud74H4fJRdjPQc3RUI4ZEnn1lOaCrwrh1uSnykS+VDGww7MiO47lURxIAwA/7GhGZr3A==
X-Received: by 2002:a05:600c:870a:b0:436:e8b4:3cde with SMTP id
 5b1f17b1804b1-438913ded64mr183495355e9.14.1737467345231; 
 Tue, 21 Jan 2025 05:49:05 -0800 (PST)
Received: from cuervo.intranet.jlsalvador.online ([207.188.147.217])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bf322aab8sm13602224f8f.57.2025.01.21.05.49.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2025 05:49:04 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>
To: buildroot@buildroot.org
Cc: Alexander Mukhin <alexander.i.mukhin@gmail.com>,
 =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?= <salvador.joseluis@gmail.com>
Date: Tue, 21 Jan 2025 14:47:40 +0100
Message-ID: <20250121134740.2894756-2-salvador.joseluis@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737467345; x=1738072145; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VSdvVoHM9t9hA3PqYGdRta6PklBQuQaXEyVHvMz5dCQ=;
 b=S5+pamB8fBnTo+nj+QZjzzDymukxzKZ5ePQhvNGWazC/iuvh4tLGtiloTt4/ygmeTQ
 WNWZbJIGxfuMBu+DtOHqGxQbPGPT8yCLAsEc0RwrJ1MHHBpCtEmIep4/sbUSs+LlAiJ8
 oIwmHiqme3G/IDqmSYx8QSbpKrurYysnGk1u7QSV4oKHsQYbuzK0UxkuPC0EzLmjCp1A
 vUcX2hL9xrIXi5SFL6ohFgcyTk8bRYivrQEMBt3CS8LH/CgrzJpJhuPpkllB/EDTGc9l
 kNaRPRW8Mz1ti1f1b0Arh2CApKehzmionvNPJN2CfkZAGXv5vhSAey3avne6P7uMlp4n
 CIeQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=S5+pamB8
Subject: [Buildroot] [PATCH 1/2] support/testing: update zfs tests to Linux
 6.12.9
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIHByZXZpb3VzIHZlcnNpb24sIExpbnV4IDUuMTUuMzUsIGlzIG91dGRhdGVkLgpVcGdyYWRl
IHRvIHRoZSBsYXRlc3QgTFRTIHJlbGVhc2UuCgpTaWduZWQtb2ZmLWJ5OiBKb3PDqSBMdWlzIFNh
bHZhZG9yIFJ1Zm8gPHNhbHZhZG9yLmpvc2VsdWlzQGdtYWlsLmNvbT4KLS0tCiBzdXBwb3J0L3Rl
c3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3pmcy5weSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3N1cHBvcnQvdGVzdGlu
Zy90ZXN0cy9wYWNrYWdlL3Rlc3RfemZzLnB5IGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2th
Z2UvdGVzdF96ZnMucHkKaW5kZXggMjdkYmMyODY5Yi4uOTY3ZGEwOThlMSAxMDA2NDQKLS0tIGEv
c3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF96ZnMucHkKKysrIGIvc3VwcG9ydC90
ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF96ZnMucHkKQEAgLTEzLDcgKzEzLDcgQEAgY2xhc3Mg
VGVzdFpmc0Jhc2UoaW5mcmEuYmFzZXRlc3QuQlJUZXN0KToKICAgICAgICAgQlIyX1JPT1RGU19E
RVZJQ0VfQ1JFQVRJT05fRFlOQU1JQ19FVURFVj15CiAgICAgICAgIEJSMl9MSU5VWF9LRVJORUw9
eQogICAgICAgICBCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OPXkKLSAgICAgICAgQlIy
X0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iNS4xNS4zNSIKKyAgICAgICAgQlIy
X0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iNi4xMi45IgogICAgICAgICBCUjJf
TElOVVhfS0VSTkVMX1VTRV9DVVNUT01fQ09ORklHPXkKICAgICAgICAgQlIyX0xJTlVYX0tFUk5F
TF9DVVNUT01fQ09ORklHX0ZJTEU9ImJvYXJkL3FlbXUveDg2XzY0L2xpbnV4LmNvbmZpZyIKICAg
ICAgICAgQlIyX0xJTlVYX0tFUk5FTF9ORUVEU19IT1NUX0xJQkVMRj15Ci0tIAoyLjQ4LjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
