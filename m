Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBC89CDB47E
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 20:25:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E2E64189A;
	Fri, 13 Oct 2023 20:25:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E2E64189A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W4Qe7URuH-t9; Fri, 13 Oct 2023 20:25:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 330C4417AE;
	Fri, 13 Oct 2023 20:25:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 330C4417AE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2D0141BF33D
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 20:25:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 13A0181A6F
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 20:25:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13A0181A6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NlTBeD4HC3Ur for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 20:25:33 +0000 (UTC)
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4890581916
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 20:25:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4890581916
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-32d849cc152so2346009f8f.1
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 13:25:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697228731; x=1697833531;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LkLEFbGzlvyTHEzkVLEQs/GFUj3n9SIAclevvMjUbAw=;
 b=jbHh8AV16reRW3WwTfiUknDmV8EcE7vUzZHX4vDj4pX0r4OYMVtwpM4w8Snt8XNvSW
 geoaii9k3LmHQkptDsmXbll8pr4SwFze41AGZHu91KlMmJ0hI32PB5s/QEZ7lU80rNb1
 AsLac/zP0LW+KuaDpLJluU6DsTwrClayzmiEHW418ExBmL42FP2j14bY1Bz2obgq27VP
 kInGq/RkvYbxxfSygM2bOsjTBAfTylIxvs8EFQs5pcBHaGKdDX5NFiei4chgbV/xl3hX
 J3Gl6X0BKOG7ws2RSbg1P6kBHHMgqzP0FE0n7grF7+rzBsuS3kFkRdoAU49OVdsFUCuH
 RRXw==
X-Gm-Message-State: AOJu0Ywn45dBkUqsnDbLhhL2/6PaY7LU3fWVu/TsdFtZvnMA8VV8A8hC
 E+zOjJ5IC0M1/uVTkW9Hy5hItevfyFIvcGwLBrLEVQ==
X-Google-Smtp-Source: AGHT+IGpluxyeYjyGqchADUADz28l1hBSSTgU0URZdlobUrBZcr8q4Jz/8Poey9jzf2VE757FAYB0g==
X-Received: by 2002:a7b:c84d:0:b0:3fa:934c:8356 with SMTP id
 c13-20020a7bc84d000000b003fa934c8356mr25566851wml.10.1697228730928; 
 Fri, 13 Oct 2023 13:25:30 -0700 (PDT)
Received: from archlinux.. ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 h8-20020a05600c350800b004068e09a70bsm43376wmq.31.2023.10.13.13.25.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 13:25:30 -0700 (PDT)
From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>
To: buildroot@buildroot.org
Date: Fri, 13 Oct 2023 22:25:28 +0200
Message-ID: <20231013202528.164224-1-gael.portay@rtone.fr>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtone.fr; s=google; t=1697228731; x=1697833531; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LkLEFbGzlvyTHEzkVLEQs/GFUj3n9SIAclevvMjUbAw=;
 b=HiMOVx/TU3s2wa69pbG6QUkazLkjyWxbG4dUzaJ+/k0vtGUk9M34u2yq6YxdHoI9xq
 xXUWdqoRcyzY8K5Xl7dno3SEsaomBzq6gVtwPhZ4XA26aReZvOIjmFxWjMS8TEP90DfQ
 g+TYQgU7mv4LCDhWbGjRNgruP1xYDwNyrA+p4=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=rtone.fr header.i=@rtone.fr
 header.a=rsa-sha256 header.s=google header.b=HiMOVx/T
Subject: [Buildroot] [PATCH] board/raspberrypi: fix typo in comment
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
Cc: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>,
 Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBmaXhlcyBhIHR5cG8gYnkgZHJvcHBpbmcgb2ZmIHRoZSBzcHVyaW91cyB4IGluIGVuc3Vy
ZS4KClNpZ25lZC1vZmYtYnk6IEdhw6tsIFBPUlRBWSA8Z2FlbC5wb3J0YXlAcnRvbmUuZnI+Ci0t
LQogYm9hcmQvcmFzcGJlcnJ5cGkvcG9zdC1idWlsZC5zaCB8IDIgKy0KIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2JvYXJkL3Jhc3Bi
ZXJyeXBpL3Bvc3QtYnVpbGQuc2ggYi9ib2FyZC9yYXNwYmVycnlwaS9wb3N0LWJ1aWxkLnNoCmlu
ZGV4IDM4ZmRjODA3MzQuLjBiZDdiYzNkMTcgMTAwNzU1Ci0tLSBhL2JvYXJkL3Jhc3BiZXJyeXBp
L3Bvc3QtYnVpbGQuc2gKKysrIGIvYm9hcmQvcmFzcGJlcnJ5cGkvcG9zdC1idWlsZC5zaApAQCAt
MTUsNSArMTUsNSBAQCBlbGlmIFsgLWQgJHtUQVJHRVRfRElSfS9ldGMvc3lzdGVtZCBdOyB0aGVu
CiAgICAgICAgIiR7VEFSR0VUX0RJUn0vZXRjL3N5c3RlbWQvc3lzdGVtL2dldHR5LnRhcmdldC53
YW50cy9nZXR0eUB0dHkxLnNlcnZpY2UiCiBmaQogCi0jIGV4bnN1cmUgb3ZlcmxheXMgZXhpc3Rz
IGZvciBnZW5pbWFnZQorIyBlbnN1cmUgb3ZlcmxheXMgZXhpc3RzIGZvciBnZW5pbWFnZQogbWtk
aXIgLXAgIiR7QklOQVJJRVNfRElSfS9ycGktZmlybXdhcmUvb3ZlcmxheXMiCi0tIAoyLjQyLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
