Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C35C3DA49
	for <buildroot@archiver.kernel.org>; Tue, 16 Jul 2024 05:44:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60AE3812F4;
	Tue, 16 Jul 2024 05:44:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bd6GCaGxUWYx; Tue, 16 Jul 2024 05:44:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2060481301
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2060481301;
	Tue, 16 Jul 2024 05:44:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 509161BF312
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 05:44:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4BAF160673
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 05:44:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KKSlnKdecP4R for <buildroot@lists.busybox.net>;
 Tue, 16 Jul 2024 05:44:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=gael.portay@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5517860805
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5517860805
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5517860805
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 05:44:23 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4266ed6c691so32007445e9.3
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 22:44:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721108660; x=1721713460;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Oti1i2E441YnMcRolLmhT+SFDqLWyfnwxe/lGlYvxUE=;
 b=wneSXdAx/kTH3QAg6uupSvOOKod44UZRL9wBKy9MJjhQ4ludZq6VMTPQ+b0ZqyePYY
 X//jMWFRmN5WylQJxRJWLVEW7FhPUbPm9SBcmKQoASTakWZpg1kO1ZIPLoDdGaVay55F
 IKO0oOpEOBIOg5x1QxsXpl+hOSddfYdJWunzpv+Om1l315MPL33rop/WIAJFJ9RwKmBX
 k6yBNsyfYkWYU8NWMeQSkOz0x+XqJV6ZNecKtTVzufojdXlGmnvm8lgBamTayQ7HwqLt
 uUVSS6n+b+WSZ8Jd4Wj7ei0E/+E2qMDsAhx6wJebaPmhErkyh1ywGXkLd7JsVF1nLDO4
 KedA==
X-Gm-Message-State: AOJu0YwvC5z1RpH6uiVOFVP4ROeQqxeAt1atJaQT8a90/dz2eXkCQ1rY
 hsSTb+gbeZXF9SYsbdeGYthWRj0NXEemNjau6JQ691vvfykMzUMXPPBA/m/w
X-Google-Smtp-Source: AGHT+IFrr/YfXpU7gQZKn7eZhzT8EDPKVaxFck2U8hoiGFbFjZbzn1O2UFAOIA/W3OsdMl7lf8anDg==
X-Received: by 2002:a05:600c:4e92:b0:426:5cee:4abc with SMTP id
 5b1f17b1804b1-427ba691136mr6679745e9.20.1721108660168; 
 Mon, 15 Jul 2024 22:44:20 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427a5e7749esm110658705e9.2.2024.07.15.22.44.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jul 2024 22:44:19 -0700 (PDT)
From: "=?UTF-8?q?Ga=C3=ABl=20PORTAY?=" <gael.portay@gmail.com>
X-Google-Original-From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>
To: buildroot@buildroot.org
Date: Tue, 16 Jul 2024 07:43:52 +0200
Message-ID: <20240716054359.92966-2-gael.portay@rtone.fr>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240716054359.92966-1-gael.portay@rtone.fr>
References: <20240716054359.92966-1-gael.portay@rtone.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721108660; x=1721713460; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Oti1i2E441YnMcRolLmhT+SFDqLWyfnwxe/lGlYvxUE=;
 b=V5iCcNc45nRncVhgnYHl9EEthCsrXQffJmbz/E3e+MUN59doNmysmqPgMBzJ1E8R8H
 xYWQHBOiCnnIALJd3jrNSlJ3oU4JcKDAAKD6/R5ZrSwSYi/v8tpU6rEBK8qmnKeTe/hz
 qQ8XfqhDrR0TYA0PyrqSqXUXHaeCIJqQ8MC+BZjk1uPCQZcsm7MEgOVLV2ydOdZxaEzP
 Q+8ch04Y/GjOWMcvdhiYKZsVpr8Py0qJeu81sslpVLI8nwQuSe5ldgJaY/2oVHY+fwwM
 VU2mckTyjJFZWU/E3ak3VyhlMn9L4hDLLXKdBWemxVJY2+3smEMi+xUGwLVtq5VTp+ZT
 0X6w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=V5iCcNc4
Subject: [Buildroot] [PATCH 1/8] configs/raspberrypi: install Raspberry Pi
 rev 1.0 device-tree blob
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

VGhpcyBpbnN0YWxscyBSYXNwYmVycnkgUGkgTW9kZWwgQiByZXYgMS4wIGRldmljZS10cmVlIGJs
b2IuCgpTaWduZWQtb2ZmLWJ5OiBHYcOrbCBQT1JUQVkgPGdhZWwucG9ydGF5QHJ0b25lLmZyPgot
LS0KIGJvYXJkL3Jhc3BiZXJyeXBpL3JlYWRtZS50eHQgIHwgMSArCiBjb25maWdzL3Jhc3BiZXJy
eXBpX2RlZmNvbmZpZyB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYm9hcmQvcmFzcGJlcnJ5cGkvcmVhZG1lLnR4dCBi
L2JvYXJkL3Jhc3BiZXJyeXBpL3JlYWRtZS50eHQKaW5kZXggYWE2NDIxZWEwMS4uY2JkOWE1N2E2
MyAxMDA2NDQKLS0tIGEvYm9hcmQvcmFzcGJlcnJ5cGkvcmVhZG1lLnR4dAorKysgYi9ib2FyZC9y
YXNwYmVycnlwaS9yZWFkbWUudHh0CkBAIC04Nyw2ICs4Nyw3IEBAIFJlc3VsdCBvZiB0aGUgYnVp
bGQKIEFmdGVyIGJ1aWxkaW5nLCB5b3Ugc2hvdWxkIG9idGFpbiB0aGlzIHRyZWU6CiAKICAgICBv
dXRwdXQvaW1hZ2VzLworICAgICstLSBiY20yNzA4LXJwaS1iLXJldjEuZHRiICAgICAgWzFdCiAg
ICAgKy0tIGJjbTI3MDgtcnBpLWIuZHRiICAgICAgICAgICBbMV0KICAgICArLS0gYmNtMjcwOC1y
cGktYi1wbHVzLmR0YiAgICAgIFsxXQogICAgICstLSBiY20yNzA4LXJwaS1jbS5kdGIgICAgICAg
ICAgWzFdCmRpZmYgLS1naXQgYS9jb25maWdzL3Jhc3BiZXJyeXBpX2RlZmNvbmZpZyBiL2NvbmZp
Z3MvcmFzcGJlcnJ5cGlfZGVmY29uZmlnCmluZGV4IDAzYzgxZWJmMzkuLmM2YjI5NmUxYWYgMTAw
NjQ0Ci0tLSBhL2NvbmZpZ3MvcmFzcGJlcnJ5cGlfZGVmY29uZmlnCisrKyBiL2NvbmZpZ3MvcmFz
cGJlcnJ5cGlfZGVmY29uZmlnCkBAIC0yMCw3ICsyMCw3IEBAIEJSMl9MSU5VWF9LRVJORUxfREVG
Q09ORklHPSJiY21ycGkiCiAKICMgQnVpbGQgdGhlIERUQnMgZm9yIEEvQiwgQSsvQisgYW5kIGNv
bXB1dGUgbW9kdWxlIGZyb20gdGhlIGtlcm5lbCBzb3VyY2VzCiBCUjJfTElOVVhfS0VSTkVMX0RU
U19TVVBQT1JUPXkKLUJSMl9MSU5VWF9LRVJORUxfSU5UUkVFX0RUU19OQU1FPSJicm9hZGNvbS9i
Y20yNzA4LXJwaS1iIGJyb2FkY29tL2JjbTI3MDgtcnBpLWItcGx1cyBicm9hZGNvbS9iY20yNzA4
LXJwaS1jbSIKK0JSMl9MSU5VWF9LRVJORUxfSU5UUkVFX0RUU19OQU1FPSJicm9hZGNvbS9iY20y
NzA4LXJwaS1iLXJldjEgYnJvYWRjb20vYmNtMjcwOC1ycGktYiBicm9hZGNvbS9iY20yNzA4LXJw
aS1iLXBsdXMgYnJvYWRjb20vYmNtMjcwOC1ycGktY20iCiAKIEJSMl9MSU5VWF9LRVJORUxfTkVF
RFNfSE9TVF9PUEVOU1NMPXkKIAotLSAKMi40NS4yCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
