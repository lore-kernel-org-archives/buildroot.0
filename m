Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C291DC87FD2
	for <buildroot@archiver.kernel.org>; Fri,  1 Aug 2025 15:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8ACAE4133C;
	Fri,  1 Aug 2025 15:07:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NU4Er_gtcAN2; Fri,  1 Aug 2025 15:07:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B12EC41097
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B12EC41097;
	Fri,  1 Aug 2025 15:07:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A431813D
 for <buildroot@buildroot.org>; Fri,  1 Aug 2025 15:07:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 962AC4005E
 for <buildroot@buildroot.org>; Fri,  1 Aug 2025 15:07:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9pc55Qxa_0zv for <buildroot@buildroot.org>;
 Fri,  1 Aug 2025 15:07:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AF8504031F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF8504031F
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AF8504031F
 for <buildroot@buildroot.org>; Fri,  1 Aug 2025 15:07:36 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-45892deb246so8535845e9.2
 for <buildroot@buildroot.org>; Fri, 01 Aug 2025 08:07:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754060855; x=1754665655;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6SMLO+iUloaJAVvG0yRCzMrs2KjGvhVqIx43G11L0v8=;
 b=E19cAmsUGiJql1Vfzy2n31EPKSfYhnE1EPiqmzagYcmOiNf+HqG7tcgiB6oGcdQm81
 j/xj4sI2kNNd85TNXl47pAUmogrTkfkkdY/0zF6gHgfo3W9j5vR9hcTPJVdZ4Tiptb04
 9nT/K9XSV7VhdF/rD+4wQ00ZYpONqHOL1tVTMZFamR+n578IeqYeO3OjOg0UDHl7pkbe
 FtwkEpV6RNKlX6Tjh/oqrgucJtHHoGSkqYf3O5lNHOucLmVy98ydLC1gk/QMi+gHALLJ
 ZKJcg3OltySIgtWryftF882L3KTh1p2WyFRD1B473qi3lTq4L7PEjhXyZCSz53QzAafH
 YDgQ==
X-Gm-Message-State: AOJu0YyngePy+qzpg+W2vxO1fU0Z2HFx+xwDCa/m16Y3D9U7G+ehgWpH
 ySU9dzCGN1xO4Kcc63U/ro77C5Vq19zNIiZnJU4UPzJ+hPMc5lonjmOeqkSYn+EJsqmh4Jv1ZrI
 Nr6XX
X-Gm-Gg: ASbGnctiK7fjAG+UT5PTl2hx5cSwHNXoifA+X6G7EJSZu9APP/KVAY4TTnL/JnHi+Bl
 POPNB3IUD0KlpNxBUTcBdJZ+Ymk/x29cWEKXWTaFXmVDSo/0SBJbpXkmjoGJYc/x66+7EH6ykTp
 pGoV+94fUQDJ8RBownqraZw0z8p8GGd3imjATrLmZ7cTHFlO8u3h+IP9mXIDHc6k4hqhDx4WFbJ
 Si+cUgGABFCzDrTGon78mYnWG+Ds5/0NfX/Xp88rxqTinveYDxJcKLM1MndXek/mhhxaQ1di2Yj
 7H7/HuO+ws0A499IdyOB8UZErHR3MXGWYd93yVRSoweHqjQUZyXGnYwmyxBi6XQMJGF+1A/3yJf
 afVmhdQx+fLc1Th9G1QZxXfRH/9uorRrKqeUZK0yyBV6Tde8iflSGVcGLznp99PFmKoFGxMj8wO
 waBD/ls84IyiZsa5C8kN0=
X-Google-Smtp-Source: AGHT+IFf/mdelhjVk2ixrbiDUWeEmlYS9D0LZroMLWqq2quvYMEYdygIoQRQXFyvPcny3LARWsGS7A==
X-Received: by 2002:a05:600c:354e:b0:450:d4a6:79ad with SMTP id
 5b1f17b1804b1-458aa456412mr27931525e9.23.1754060854685; 
 Fri, 01 Aug 2025 08:07:34 -0700 (PDT)
Received: from mind2.local.ess-mail.com (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4589ee5790dsm66731015e9.27.2025.08.01.08.07.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 08:07:34 -0700 (PDT)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri,  1 Aug 2025 15:07:17 +0000
Message-Id: <20250801150722.4003476-5-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250801150722.4003476-1-raphael.melotte@mind.be>
References: <20250801150722.4003476-1-raphael.melotte@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754060855; x=1754665655; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6SMLO+iUloaJAVvG0yRCzMrs2KjGvhVqIx43G11L0v8=;
 b=JW5Fs4Y/qlQAFugP5PMCe9xGoX7NoXCW0I8s8ny8oac3ux6DLU3hyBuj6YhVmbJZJ3
 gxLv4g2f9xD65kz1bcyTZ8c1DDdhLWZBThVab+oi7ZpmP12Zzhn/6r5R1VreGA9grjjO
 7rGLuVrnr49r9i51A8jnd8Lm7UcgBxCypDITsDbK+Ls/S2I2l9Ut/GMnc0xB55UATQDl
 uokK9eAYmjUZv4SzJP0Jv33PUnM9vQDKwOJJ//PCGr1JLsDHS/1CZImaPOvTOAeH3dLH
 8qkC4jBGweN+30iY3+VJOAbqUeZF0dvjvW4g8RERfRfhDPG99AibV5l2WFahlk4Jp2k/
 oTHQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=JW5Fs4Y/
Subject: [Buildroot] [PATCH 4/6] package/mupdf: update release hashes comment
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

VGhlIG9sZCBVUkwgbm93IGxlYWRzIHRvIGFuIEhUVFAgNDA0IG5vdCBmb3VuZCBlcnJvci4KVXBk
YXRlIGl0IHRvIHRoZSBuZXcgb25lIHdoaWNoIGNvbnRhaW5zIHRoZSBoYXNoZXMgZm9yIHRoZSBj
dXJyZW50CnJlbGVhc2UgYXMgd2VsbCBhcyBvbGRlciBvbmVzLgoKU2lnbmVkLW9mZi1ieTogUmFw
aGHDq2wgTcOpbG90dGUgPHJhcGhhZWwubWVsb3R0ZUBtaW5kLmJlPgotLS0KIHBhY2thZ2UvbXVw
ZGYvbXVwZGYuaGFzaCB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbXVwZGYvbXVwZGYuaGFzaCBiL3BhY2th
Z2UvbXVwZGYvbXVwZGYuaGFzaAppbmRleCA1ODAyMzVlZWNhLi44MGRlNmYzYjJjIDEwMDY0NAot
LS0gYS9wYWNrYWdlL211cGRmL211cGRmLmhhc2gKKysrIGIvcGFja2FnZS9tdXBkZi9tdXBkZi5o
YXNoCkBAIC0xLDQgKzEsNCBAQAotIyBGcm9tIGh0dHBzOi8vbXVwZGYuY29tL2Rvd25sb2Fkcy9p
bmRleC5odG1sOgorIyBGcm9tIGh0dHBzOi8vbXVwZGYuY29tL3JlbGVhc2VzOgogc2hhMSAgZDc5
NjAwYmNjZDcwYWI5ZDBlOGVlMTlkYWU0ZTI3NWYyYWY5NWNlZCAgbXVwZGYtMS4yMy45LXNvdXJj
ZS50YXIubHoKIAogIyBMb2NhbGx5IGNvbXB1dGVkOgotLSAKMi4zNC4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
