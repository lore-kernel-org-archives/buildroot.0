Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90EA5C369BA
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 15:49:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5412960889;
	Tue, 15 Apr 2025 15:49:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uX66JBF-w2qL; Tue, 15 Apr 2025 15:49:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 793AD60BB9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 793AD60BB9;
	Tue, 15 Apr 2025 15:49:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A3C2109
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 15:49:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50B054066D
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 15:49:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RcqdXAYGDFwr for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 15:49:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=gael.portay+rtone@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9CC4F40B6B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9CC4F40B6B
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9CC4F40B6B
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 15:49:17 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-39d73b97500so332986f8f.3
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 08:49:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744732155; x=1745336955;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L8uDnEL1Bjq+ps3jSFQZNcm26uGe6jJpUy7/b0BV05g=;
 b=vXqChz5mg4X+hcQhWRlcS8qvoo2xOLiVtvojrHslCsMUWjVnNqloIlCMR8FdR1lnFP
 VZWbMTZ/WP9/50XSjhaPDdBuSskv4Myd4vofm8y/d+8IZcrrnj49cboK8j0t0VFcj/gl
 DVgHr6hneSGf/zLIy6iegdnlsmyz3mAcsMQ9PO/+xvfhYH5Z3zJcz+F2ILRxACGyPOrI
 Ri8XgqR5J3UyiJD4Ph9vQ0XETGnpZfSlZRcofvIsKYco2W7Rc92j8IzNJDuRLfztn6E8
 mhFi/HmDgnsmKQu/uCQ+JkOcxz7RUbURcW8XJhZTtucU7ajRtm4EDwbNVpnRVGMkCVc9
 U6QA==
X-Gm-Message-State: AOJu0YxHiTnvILj7N7GYvCPjzVEDsBZTL5M2aIc5gix8P3zGpzLSHe1g
 At70cuzKWXcJucu3jpeJC7f61SuQQDvlQPFjiCFUymBXXg8Mp4cLrsFWReC2
X-Gm-Gg: ASbGncs//ITG1sfbUO7IJ6L7QBxennuEg1xL3AjYdWsbXOWDvFxBXqguFpuR5THTprd
 80xf8mqCDoZ5gMv+8hpW1mptl3YMm3+LRAnHORbbjbdAnpWsQfnGTzUD3ymnpZTB3ZwulGJhA8Y
 zadjOL54NYdwutoTOYx0jKTrkxmO0pHg+CYL4U6Ni+5X42vfHRLewcEF7jFvf4w4lFD8DUSabVr
 kNfuzZdm522lUEfzxiI/VksUd17FRrUVjqqqVJf9S/PcfoQ3kUJDI7iIGbNqWMt7DftckR2/wf9
 ovnLPnVq/nR1YLSSw4cEo35ztFutrGAy6rkIGG9L1qp+UoaCIdz4e5dmj+IhLg==
X-Google-Smtp-Source: AGHT+IGAN1m/pb3CBrqCSsuDY9XjtRbN2cxPns7BC+TSe//9g3eM6eswNOBOJ+Wrp/AbYG8pvfwszg==
X-Received: by 2002:a05:6000:240a:b0:38f:20b5:2c80 with SMTP id
 ffacd0b85a97d-39edc3a2e2dmr1344003f8f.6.1744732155042; 
 Tue, 15 Apr 2025 08:49:15 -0700 (PDT)
Received: from archlinux.. ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eaf445713sm14386782f8f.85.2025.04.15.08.49.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 08:49:14 -0700 (PDT)
From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Martin Bark <martin@barkynet.com>
Date: Tue, 15 Apr 2025 17:49:05 +0200
Message-ID: <20250415154905.1871596-1-gael.portay+rtone@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744732155; x=1745336955; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=L8uDnEL1Bjq+ps3jSFQZNcm26uGe6jJpUy7/b0BV05g=;
 b=Xqux+G5y3a8J0WqiQryGNRbbczP711uv7dWgsk1zNXLLBHhawypDz8KEn25dthCx5t
 qqGB7y58xvU/+6Xf95Z+XV3pqEshb6KqhQosnSictAL4lZVwH2/pcQ5d340V+9muN7wc
 v31Hbea4r45VZRtvO1dkNAtuRYank/8UUy3KIluYQS4mKd4/mGm5E27wRHjWR3qbD0Tt
 nFIdJbCK0t0cq25pxqdeWlEKDVAzL0vw7ziWOGmN6GKvw7SxikFjG4KRgiTnN/3+VJ6d
 Tr0F4IAZ7Q3iuAAWGveG3BlhzzoPi8tfimSGhRl5ML+IhuM3noVUVSR0c2+tsk0KuVgM
 1+Fw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Xqux+G5y
Subject: [Buildroot] [PATCH 1/1] configs/raspberrypi5: install Raspberry Pi
 500 device-tree blob
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

VGhpcyBpbnN0YWxscyB0aGUgZGV2aWNlLXRyZWUgYmxvYiBmb3IgdGhlIFJhc3BiZXJyeSBQaSA1
MDAuCgpTaWduZWQtb2ZmLWJ5OiBHYcOrbCBQT1JUQVkgPGdhZWwucG9ydGF5K3J0b25lQGdtYWls
LmNvbT4KLS0tCiBib2FyZC9yYXNwYmVycnlwaS9yZWFkbWUudHh0ICAgfCA0ICsrKy0KIGNvbmZp
Z3MvcmFzcGJlcnJ5cGk1X2RlZmNvbmZpZyB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2JvYXJkL3Jhc3BiZXJyeXBp
L3JlYWRtZS50eHQgYi9ib2FyZC9yYXNwYmVycnlwaS9yZWFkbWUudHh0CmluZGV4IDY0ZjBlMmEy
NmYuLmZiOTQ2NDcxNDggMTAwNjQ0Ci0tLSBhL2JvYXJkL3Jhc3BiZXJyeXBpL3JlYWRtZS50eHQK
KysrIGIvYm9hcmQvcmFzcGJlcnJ5cGkvcmVhZG1lLnR4dApAQCAtMTEsNiArMTEsNyBAQCBUaGVz
ZSBpbnN0cnVjdGlvbnMgYXBwbHkgdG8gYWxsIG1vZGVscyBvZiB0aGUgUmFzcGJlcnJ5IFBpOgog
ICAtIHRoZSBtb2RlbCBCNCAoYWthIFJhc3BiZXJyeSBQaSA0KS4KICAgLSB0aGUgbW9kZWwgQ000
IChha2EgUmFzcGJlcnJ5IFBpIENvbXB1dGUgTW9kdWxlIDQgYW5kIElPIEJvYXJkKS4KICAgLSB0
aGUgbW9kZWwgQjUgKGFrYSBSYXNwYmVycnkgUGkgNSkuCisgIC0gdGhlIG1vZGVsIDUwMCAoYWth
IFJhc3BiZXJyeSBQaSA1MDApLgogCiBIb3cgdG8gYnVpbGQgaXQKID09PT09PT09PT09PT09PQpA
QCAtNjksNyArNzAsNyBAQCBvciBmb3IgQ000IChvbiBJTyBCb2FyZCAtIDY0IGJpdCk6CiAKICAg
JCBtYWtlIHJhc3BiZXJyeXBpY200aW9fNjRfZGVmY29uZmlnCiAKLUZvciBtb2RlbCA1IEI6CitG
b3IgbW9kZWwgNSBCIGFuZCA1MDA6CiAKICAgJCBtYWtlIHJhc3BiZXJyeXBpNV9kZWZjb25maWcK
IApAQCAtMTA5LDYgKzExMCw3IEBAIEFmdGVyIGJ1aWxkaW5nLCB5b3Ugc2hvdWxkIG9idGFpbiB0
aGlzIHRyZWU6CiAgICAgKy0tIGJjbTI3MTEtcnBpLWNtNHMuZHRiICAgICAgICBbMV0KICAgICAr
LS0gYmNtMjcxMi1ycGktNS1iLmR0YiAgICAgICAgIFsxXQogICAgICstLSBiY20yNzEyZDAtcnBp
LTUtYi5kdGIgICAgICAgWzFdCisgICAgKy0tIGJjbTI3MTItcnBpLTUwMC5kdGIgICAgICAgICBb
MV0KICAgICArLS0gYm9vdC52ZmF0CiAgICAgKy0tIHJvb3Rmcy5leHQ0CiAgICAgKy0tIHJwaS1m
aXJtd2FyZS8KZGlmZiAtLWdpdCBhL2NvbmZpZ3MvcmFzcGJlcnJ5cGk1X2RlZmNvbmZpZyBiL2Nv
bmZpZ3MvcmFzcGJlcnJ5cGk1X2RlZmNvbmZpZwppbmRleCA4Y2JkNTMzZWVlLi4yNWM1NzRkMGRm
IDEwMDY0NAotLS0gYS9jb25maWdzL3Jhc3BiZXJyeXBpNV9kZWZjb25maWcKKysrIGIvY29uZmln
cy9yYXNwYmVycnlwaTVfZGVmY29uZmlnCkBAIC0xMyw3ICsxMyw3IEBAIEJSMl9MSU5VWF9LRVJO
RUxfQ1VTVE9NX1RBUkJBTExfTE9DQVRJT049IiQoY2FsbCBnaXRodWIscmFzcGJlcnJ5cGksbGlu
dXgsNTc2Y2MxCiBCUjJfTElOVVhfS0VSTkVMX0RFRkNPTkZJRz0iYmNtMjcxMiIKIEJSMl9MSU5V
WF9LRVJORUxfQ09ORklHX0ZSQUdNRU5UX0ZJTEVTPSJib2FyZC9yYXNwYmVycnlwaS9saW51eC00
ay1wYWdlLXNpemUuZnJhZ21lbnQiCiBCUjJfTElOVVhfS0VSTkVMX0RUU19TVVBQT1JUPXkKLUJS
Ml9MSU5VWF9LRVJORUxfSU5UUkVFX0RUU19OQU1FPSJicm9hZGNvbS9iY20yNzEyLXJwaS01LWIg
YnJvYWRjb20vYmNtMjcxMmQwLXJwaS01LWIiCitCUjJfTElOVVhfS0VSTkVMX0lOVFJFRV9EVFNf
TkFNRT0iYnJvYWRjb20vYmNtMjcxMi1ycGktNS1iIGJyb2FkY29tL2JjbTI3MTJkMC1ycGktNS1i
IGJyb2FkY29tL2JjbTI3MTItcnBpLTUwMCIKIEJSMl9MSU5VWF9LRVJORUxfTkVFRFNfSE9TVF9P
UEVOU1NMPXkKIEJSMl9QQUNLQUdFX0JVU1lCT1hfU0hPV19PVEhFUlM9eQogQlIyX1BBQ0tBR0Vf
WFo9eQotLSAKMi40OS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
