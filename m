Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3E6FC369CB
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 07:48:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A06F580D28;
	Tue, 22 Apr 2025 07:48:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jOuTXP58ms83; Tue, 22 Apr 2025 07:48:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D261F81099
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D261F81099;
	Tue, 22 Apr 2025 07:48:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E3D468
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 07:48:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E8A5081099
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 07:48:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tTfnTCsdAaTX for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 07:48:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A198280D28
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A198280D28
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A198280D28
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 07:48:03 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43d2d952eb1so35342885e9.1
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 00:48:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745308081; x=1745912881;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/ueBbt5sDE/j+ELVDsiSGY/F6YcMKnQZrtTYFjmLkfE=;
 b=WTeMtNkjINsT4PFCPFJL/jpRUqsHFmKiTqllId6gDds3+c/MiE0pA3DTl5RLomGPdE
 x8wsVCASHIYJfRYNbbXHUvz9npdCFncZQ2BZ3V3qB0s5A15TKEzwgbumrw3DrjO36iX/
 9/iY5wM0Ht2cSGWwehT8FgEr4V67fDgHWA95iFLsHPqT+3LUMLrqVc8oKV+Y0PvlC/Oa
 uE+kzwPxJE4a3DlVnCVFs4dikwQHvzVrKHYVic8pcbXBN8yXSZHGn+4Yv4X2xfLRB1Mz
 dorLa3vR3YhPdiSXSVVvUrKPcgLlkznuEC68F+WUvwHxxvG6mXepUw1YB/p55Aobqiky
 KZDg==
X-Gm-Message-State: AOJu0YxCY2Z3pd5Ed+tcug5ljs1vSOfpRXF7oGRAz66J6vckUQWY+5VA
 LbOHB211FZAkqIS/At98vLxFs23mJOM8uRsOqCEj+NTw6C+geTOr5GDENF+3nHgRAjT1THInfnO
 NGqM=
X-Gm-Gg: ASbGnctaGcYezA+Q2YhJ3yfzKgCM84xgWiOeRRn8Lgva4fbi9v3D1vdTzbcF0itl6Dx
 felMV1hVmTasnKoPu+ATJP9wBVC1GKMdirXDna63E/XSqUOGoHNni9ClN29DqGli0rqXHF+vGxh
 5pqVpmIGPgeVnuGf9CqGN0XmxoXV8gY6CzvCEV+QY7CjK8PZBtRWF8JOqnQxViZysC0xxxzipyL
 1AlDJTLa8uLVNHgHDzh9wlh0yDGz7HwXvEvwIV1pazjykt+jLl5OixuqpOi+Er78vfhI6zVlfpa
 ayMZLy7N/9Ldv3cepeFsFQ/4FXCC6GP7CSnQNG2V7R84uF9mad/NmU227EDFU2+GWtqpHw3lweW
 nk95gCKZc6ZO779uI28qjtFZM6HAy7EfFubA=
X-Google-Smtp-Source: AGHT+IFJkjdOjnF7AR9Cym/sIijxrql4cHb7yX6HQ6x3bmKK7+m2nMfvbDvAidAEdxIcaLiQaaisXg==
X-Received: by 2002:a05:600c:46c7:b0:43c:e7ae:4bcf with SMTP id
 5b1f17b1804b1-4406aa876a7mr136649275e9.0.1745308081377; 
 Tue, 22 Apr 2025 00:48:01 -0700 (PDT)
Received: from P-NAN-ABRICOT..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4406d5bbd8asm162913405e9.23.2025.04.22.00.48.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Apr 2025 00:48:01 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 22 Apr 2025 09:47:34 +0200
Message-ID: <20250422074738.821755-1-elmehdi.younes@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1745308081; x=1745912881; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/ueBbt5sDE/j+ELVDsiSGY/F6YcMKnQZrtTYFjmLkfE=;
 b=hvvvspMTFPGB9Z9W4fYhte8kYdxd4XzpwtJZOMZo6Dh8V2y3pkuXvhfG6QoOuHHO0A
 ICMr6rL88bLma1mOe7OQxRNHEUym68bD6u2meKE7VWrawoXYyBSBsephHf1XQ8EQ/c87
 BrfpnVo7dlvYotmWg4UL1P8yAn9eDj9V8Vw0Y=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=hvvvspMT
Subject: [Buildroot] [PATCH 0/4] package/rust: rust upgrade to version 1.86.0
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
From: El Mehdi YOUNES via buildroot <buildroot@buildroot.org>
Reply-To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Joseph Kogut <joseph.kogut@gmail.com>, David Pierret <david.pierret@smile.fr>,
 Danilo Bargen <mail@dbrgn.ch>, Graeme Smecher <gsmecher@threespeedlogic.com>,
 James Hilliard <james.hilliard1@gmail.com>, Sam Voss <sam.voss@gmail.com>,
 Torben Voltmer <mail@t-voltmer.net>, El Mehdi YOUNES <elmehdi.younes@smile.fr>,
 Saeed Kazemi <kazemi.ms@gmail.com>,
 Alex Michel <alex.michel@wiedemann-group.com>,
 Leo Yu-Chi Liang <ycliang@andestech.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBwYXRjaGVzIHNlcmllcyBidW1wcyBydXN0IHRvIHZlcnNpb24gMS44Ni4wIGFuZCB1cGRh
dGVzIGFsbApjYXJnby1yZWxhdGVkIHBhY2thZ2VzIHRvIHVzZSB0aGUgY2FyZm8zIG5hbWluZyBz
Y2hlbWUuClBhdGNoZXMgMiwgMyBhbmQgNCBzaG91bGQgYmUgc3F1YXNoZWQgaW50byBhIHNpbmds
ZSBjb21taXQsCmFzIHRoZXkgbG9naWNhbGx5IGJlbG9uZyB0b2dldGhlci4KSSB1c2VkIG11bHRp
cGxlIGNvbW1pdHMgb25seSBmb3IgYmV0dGVyIGNsYXJpdHkuCgpFbCBNZWhkaSBZT1VORVMgKDQp
OgogIHBhY2thZ2UvcnVzdDogZml4IGJvb3RzdHJhcCB3aXRoIFJ1c3TiiaUxLjgzCiAgcGFja2Fn
ZS9ydXN0OiBidW1wIHRvIHZlcnNpb24gMS44Ni4wCiAgcGFja2FnZS9wa2ctZG93bmxvYWQ6IHN3
aXRjaCBmcm9tIGNhcmdvMiB0byBjYXJnbzMKICBwYWNrYWdlOiB1cGRhdGUgYWxsIGhhc2hlcyBh
ZnRlciBjYXJnbzMgc3dpdGNoCgogcGFja2FnZS9hYXJkdmFyay1kbnMvYWFyZHZhcmstZG5zLmhh
c2ggICAgICAgIHwgICAyICstCiBwYWNrYWdlL2JhdC9iYXQuaGFzaCAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgIDIgKy0KIHBhY2thZ2UvZHVzdC9kdXN0Lmhhc2ggICAgICAgICAgICAgICAg
ICAgICAgICB8ICAgMiArLQogcGFja2FnZS9lc3BmbGFzaC9lc3BmbGFzaC5oYXNoICAgICAgICAg
ICAgICAgIHwgICAyICstCiBwYWNrYWdlL2V6YS9lemEuaGFzaCAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgIDIgKy0KIHBhY2thZ2UvZmQvZmQuaGFzaCAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8ICAgMiArLQogcGFja2FnZS9oeXBlcmZpbmUvaHlwZXJmaW5lLmhhc2ggICAgICAgICAg
ICAgIHwgICAyICstCiBwYWNrYWdlL2ttb24va21vbi5oYXNoICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgIDIgKy0KIHBhY2thZ2UvbGliemVub2gtYy9saWJ6ZW5vaC1jLmhhc2ggICAgICAgICAg
ICB8ICAgMiArLQogcGFja2FnZS9uZXRhdmFyay9uZXRhdmFyay5oYXNoICAgICAgICAgICAgICAg
IHwgICAyICstCiBwYWNrYWdlL251c2hlbGwvbnVzaGVsbC5oYXNoICAgICAgICAgICAgICAgICAg
fCAgIDIgKy0KIHBhY2thZ2UvcGFyc2VjLXRvb2wvcGFyc2VjLXRvb2wuaGFzaCAgICAgICAgICB8
ICAgMiArLQogcGFja2FnZS9wYXJzZWMvcGFyc2VjLmhhc2ggICAgICAgICAgICAgICAgICAgIHwg
ICAyICstCiBwYWNrYWdlL3BrZy1kb3dubG9hZC5tayAgICAgICAgICAgICAgICAgICAgICAgfCAg
IDIgKy0KIHBhY2thZ2UvcHJvY3MvcHJvY3MuaGFzaCAgICAgICAgICAgICAgICAgICAgICB8ICAg
MiArLQogcGFja2FnZS9weXRob24tYmNyeXB0L3B5dGhvbi1iY3J5cHQuaGFzaCAgICAgIHwgICAy
ICstCiAuLi4vcHl0aG9uLWNyeXB0b2dyYXBoeS5oYXNoICAgICAgICAgICAgICAgICAgfCAgIDIg
Ky0KIHBhY2thZ2UvcHl0aG9uLW1hdHVyaW4vcHl0aG9uLW1hdHVyaW4uaGFzaCAgICB8ICAgMiAr
LQogcGFja2FnZS9weXRob24tb3Jqc29uL3B5dGhvbi1vcmpzb24uaGFzaCAgICAgIHwgICAyICst
CiAuLi4vcHl0aG9uLXB5ZGFudGljLWNvcmUuaGFzaCAgICAgICAgICAgICAgICAgfCAgIDIgKy0K
IHBhY2thZ2UvcHl0aG9uLXJwZHMtcHkvcHl0aG9uLXJwZHMtcHkuaGFzaCAgICB8ICAgMiArLQog
cGFja2FnZS9weXRob24tcnRvbWwvcHl0aG9uLXJ0b21sLmhhc2ggICAgICAgIHwgICAyICstCiBw
YWNrYWdlL3B5dGhvbi1zZWxlbml1bS9weXRob24tc2VsZW5pdW0uaGFzaCAgfCAgIDIgKy0KIHBh
Y2thZ2UvcmlwZ3JlcC9yaXBncmVwLmhhc2ggICAgICAgICAgICAgICAgICB8ICAgMiArLQogcGFj
a2FnZS9ydXN0LWJpbi9ydXN0LWJpbi5oYXNoICAgICAgICAgICAgICAgIHwgMTI4ICsrKysrKysr
Ky0tLS0tLS0tLQogcGFja2FnZS9ydXN0LWJpbi9ydXN0LWJpbi5tayAgICAgICAgICAgICAgICAg
IHwgICAyICstCiBwYWNrYWdlL3J1c3QtYmluZGdlbi9ydXN0LWJpbmRnZW4uaGFzaCAgICAgICAg
fCAgIDIgKy0KIHBhY2thZ2UvcnVzdC9ydXN0Lmhhc2ggICAgICAgICAgICAgICAgICAgICAgICB8
ICAgNCArLQogcGFja2FnZS9ydXN0L3J1c3QubWsgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
ICAzICstCiBwYWNrYWdlL3NlbnRyeS1jbGkvc2VudHJ5LWNsaS5oYXNoICAgICAgICAgICAgfCAg
IDIgKy0KIHBhY2thZ2UvdGJ0b29scy90YnRvb2xzLmhhc2ggICAgICAgICAgICAgICAgICB8ICAg
MiArLQogcGFja2FnZS90ZWFsZGVlci90ZWFsZGVlci5oYXNoICAgICAgICAgICAgICAgIHwgICAy
ICstCiBwYWNrYWdlL3VlZmlzZXR0aW5ncy91ZWZpc2V0dGluZ3MuaGFzaCAgICAgICAgfCAgIDIg
Ky0KIHBhY2thZ2Uvem94aWRlL3pveGlkZS5oYXNoICAgICAgICAgICAgICAgICAgICB8ICAgMiAr
LQogMzQgZmlsZXMgY2hhbmdlZCwgOTkgaW5zZXJ0aW9ucygrKSwgOTggZGVsZXRpb25zKC0pCgot
LSAKMi40My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
