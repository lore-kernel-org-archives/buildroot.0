Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF4B0CFD2F6
	for <buildroot@archiver.kernel.org>; Sat, 29 Nov 2025 20:37:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B6378268F;
	Sat, 29 Nov 2025 20:37:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vp9lWM5oct94; Sat, 29 Nov 2025 20:37:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0F4A826FF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0F4A826FF;
	Sat, 29 Nov 2025 20:37:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D7E48708
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 20:37:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D230B8268F
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 20:37:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lDrEiUJyQULE for <buildroot@buildroot.org>;
 Sat, 29 Nov 2025 20:37:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=salvador.joseluis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E7457826FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7457826FF
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E7457826FF
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 20:37:39 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-477b1cc8fb4so16833555e9.1
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 12:37:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764448658; x=1765053458;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sKRtuERRcy/PZTbJZTZoOxhilpCEPRHLdxLw9chDwAM=;
 b=HrjRa9nmp3y5PWnCiWuJxiKyvAKH+efE2FwgUTQ4ajxCq6XIAgWI7knJ5+tzyDqIHR
 m4dmNxDQfS0dRQM5PXgqamSaPB9q2DntF2tBHq84bRJdHAskYkOvS86rMXV1bQL1+Tyg
 n8iAGkbA+erRS4OS0hHRel5tVmuIGuEaVYq0XAVMWO/rAP0SDbaB8kuPUFAdDFNf/rYy
 /FcaEAeW260b7mdBmmWPBWjXsYJt1ZK/ZV+UcQL2eASVvZRhMI5YbZMaqk6TV+37ji2a
 J2ymjYpOQBCKXnbmhQ4wIeQz8RGpv8R9E0Y+TMCHbioTRuapI/DRNqvyNpVzD20Tg7L1
 +o+g==
X-Gm-Message-State: AOJu0YzAFAK6UBGcHkj0czZyuqZP56KJeXbjKusdvlOea0H7401Ayszl
 rZ6jVVMQooqfOu2T+TuOSWzn/06/ImN8GONF3plUORva0Tyw6gyGIv5HOYnsxPCQ
X-Gm-Gg: ASbGnctrn0ST7BhTpd4IG8PbNewXI/gll08x8Jg6GBQedbyftDt04jtKIX8rD+ocY9/
 f6BTCfszbcdfLBDLBKDkahyqRsfLsyktlFtfE0WlfStqszu2bhOQ9ey6coy6eBGGT4O+Fi7Igdc
 V8OV1DPHFZVH8VykqzjCZd1haoftqwfs8vz1iRvbWVlHPazC5J2cmCypDBi4oNryzsSIevSweiM
 iHNI14ddO6f/Gr29jmpg9hifLJ0L/5S8Vy1kUmyFyNH0i+HPDr6010Oh+6lud/FKexFOV2+pc/9
 BMxhsn+kOtQ4Z1a4f5sdJ4ansKBazlcr8nlol2TmvYwUaU5WeYBpri4JUJnthc+8euTnHhui+D5
 uvr2Iecf4XPJR/T6jcgYMOw3UnjArXDIN9PwlnSHJEkhJyahU2UN85QsciqpkRINGd2FGdTu6iN
 j0HYJaN97fFAVVexbrcr6YbX2g/afNEwNVBi6VWkHDuHYc/YwWqeG/SDzkEUdddDjyR3yXCyucD
 whbPFN4Qtz/U5frhn/6UuGeoo0=
X-Google-Smtp-Source: AGHT+IEzy2wWDVrtET+PBnrztYmGQfVOF4i7pSLUqOyJTS0s7pqd6WTINv0Cng9zU5bQu5zTudgM3Q==
X-Received: by 2002:a05:600c:3545:b0:477:7ab8:aba with SMTP id
 5b1f17b1804b1-47904ac3ca4mr175001705e9.1.1764448657519; 
 Sat, 29 Nov 2025 12:37:37 -0800 (PST)
Received: from cuervo.intranet.jlsalvador.online
 (144.85-87-138.dynamic.clientes.euskaltel.es. [85.87.138.144])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4791164d365sm152906265e9.12.2025.11.29.12.37.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Nov 2025 12:37:37 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Edgar Bonet <bonet@grenoble.cnrs.fr>
Date: Sat, 29 Nov 2025 21:34:55 +0100
Message-ID: <20251129203454.4193005-2-salvador.joseluis@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764448658; x=1765053458; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sKRtuERRcy/PZTbJZTZoOxhilpCEPRHLdxLw9chDwAM=;
 b=H6pLyIQZSfOexy0l3PJDZm/ACd9ME1jrGVc0x2OOsUHIGoXC8cNs/26q9rz68sOKdX
 t8SRV5BkorGWUe69VM5WJobnLFSVNuzw+a2jwXj/IM6k2XjTOBfusv0T8bQp16aYdroz
 b+bMokbQUulUYS9feezfYcr4m6e4H7pgyZBdc7R2TQMCkO7zH5gwg0HD8jIbUHrevjcO
 QYwvsneYHgRZRiW84CbWl7VxZYoHfyGD023gzN3q8Oc4q5AkpXpPnp3af6KusWZqgs/E
 yVaX3VGlbeb3lfTxqB+7BY++TQI7yMJAw4Ok4Ar3UEosg603GzRj03vKM5eFFVXs5w3d
 uBcA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=H6pLyIQZ
Subject: [Buildroot] [PATCH 1/1] support/scripts/check-merged: shift args
 processed by getopts
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

U2hpZnQgdGhlIGFyZ3VtZW50cyBwcm9jZXNzZWQgYnkgZ2V0b3B0cyBzbyB0aGF0IG9ubHkgdGhl
IHJvb3QgZGlyZWN0b3JpZXMKdG8gY2hlY2sgcmVtYWluIGFzIGFyZ3VtZW50cyBmb3IgdGhlIHN1
YnNlcXVlbnQgYGZvciByb290OyBkb2AgbG9vcC4KCkZpeGVzOiA3OTNlYmQ1ZDI4MDk1YzhkZjQ1
YTBkMTgzZDI3M2Q4YTg0YjNmMGE0ClJldmlld2VkLWJ5OiBZYW5uIEUuIE1PUklOIDx5YW5uLm1v
cmluLjE5OThAZnJlZS5mcj4KQ2M6IEVkZ2FyIEJvbmV0IDxib25ldEBncmVub2JsZS5jbnJzLmZy
PgpTaWduZWQtb2ZmLWJ5OiBKb3PDqSBMdWlzIFNhbHZhZG9yIFJ1Zm8gPHNhbHZhZG9yLmpvc2Vs
dWlzQGdtYWlsLmNvbT4KLS0tCiBzdXBwb3J0L3NjcmlwdHMvY2hlY2stbWVyZ2VkIHwgNCArKysr
CiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvc3VwcG9ydC9z
Y3JpcHRzL2NoZWNrLW1lcmdlZCBiL3N1cHBvcnQvc2NyaXB0cy9jaGVjay1tZXJnZWQKaW5kZXgg
NDQ3YWJmZDgxNS4uNTdkYjhhYmQyMSAxMDA3NTUKLS0tIGEvc3VwcG9ydC9zY3JpcHRzL2NoZWNr
LW1lcmdlZAorKysgYi9zdXBwb3J0L3NjcmlwdHMvY2hlY2stbWVyZ2VkCkBAIC00Nyw2ICs0Nywx
MCBAQCB3aGlsZSBnZXRvcHRzICJ0OnViIiBPUFQ7IGRvCiAJZXNhYwogZG9uZQogCisjIFJlbW92
ZSB0aGUgb3B0aW9ucyBwcm9jZXNzZWQgYnkgZ2V0b3B0cyBmcm9tICRALAorIyBzbyB0aGF0ICRA
IG5vdyBjb250YWlucyBvbmx5IHRoZSByb290IGRpcmVjdG9yaWVzIHRvIGNoZWNrLgorc2hpZnQg
JCgoT1BUSU5EIC0xKSkKKwogaWYgWyAiJHt0eXBlfSIgPSAic2tlbGV0b24iIF07IHRoZW4KIAlz
dHJpY3Q9dHJ1ZQogZWxzZQotLSAKMi41Mi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
