Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD1EC369AB
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 15:31:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3809783FBC;
	Tue, 15 Apr 2025 15:31:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tSrqmV8B9ftD; Tue, 15 Apr 2025 15:31:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4AE883F5F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4AE883F5F;
	Tue, 15 Apr 2025 15:31:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 691AE200
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 15:31:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F64240B8A
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 15:31:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e62d13Tpc-j0 for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 15:31:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=gael.portay+rtone@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0E05D40A81
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E05D40A81
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0E05D40A81
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 15:31:38 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43cee550af2so5738695e9.1
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 08:31:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744731096; x=1745335896;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zLhv/orvvKJ0+t5sR1vF39cg5lRPcheoEHDPzLRaflI=;
 b=EYqul8Z+dVKh5qrFbHWtCW+Be5Bouw++mk/VpxfXbJsumSFpl3MFneHRPEIdUzX4Ie
 7LevAR1vS6zHZM9OLKnwwudbpCnirK+VOtgS8OD/YQogcKal2HZOZwMef/boIrJS2/nf
 gvmfe7UyJmtxDNdDo3A2CtZBdu9Zjn8iH3h58YWICEgOXYZQBMJt3XzORqws014b8uO0
 mWT7R6SX1DuTYAG1MyF2SLM3M2jtvuXNCCQ1nEME0INdy4Cbn7Ft23u/SMiWSVBvU29N
 Sgeno320P1V7hqxoi/K8kPdxEWBo/+7/9Gu2II/Yns615LhrCKCNNAM3Y2sML0USMmtM
 b5eQ==
X-Gm-Message-State: AOJu0YyeUERqI8MGdXx39fH/ULUsucVIbhtW8f42bM+gILs/rUnWAR9a
 J4Z128fG4T87JCcBcjcGZmA8Epi0lWEXB+ilkTWev7wo1F6VbPibr+Byz3vY
X-Gm-Gg: ASbGnct5+klEUOzt8zzL1CNQF8oP4K37GWprLP5FnkmbJDLiPP+zatVDJCNfke5edQB
 ZcGjKay6JCHU3HZcqwD/Zg8LodoO524/nhWFBXGkWl0/+RciyLfuMLbk6sjKpYM6ds8eFjn+lK4
 LxdtVL7hV5z1GNGgsHJ6qAunaG5uvhSaV4rLLRHnOFe3gx6vGJNtvsl34j9JuUx0ecpO8IuDSxS
 ZYDcClY1axiR4BKrlqtQhxMfgmImxi9/znPzo6lP4QGZ6Gi+uGr6ZIFAZjymRq/sgqJfzFghwxy
 GwWgcLDWvpMMCQWO0sfFCDcmr4EYVoYW62juBhgExZ2IfwLKEU8=
X-Google-Smtp-Source: AGHT+IHoqSvMibHdTSI0a29yNa7YDucHNLYQ5jym5FZcmvBVRshZ7ohZ15tU7SEEcPHs5ZoX1zBJ4A==
X-Received: by 2002:a05:6000:1843:b0:391:320d:95de with SMTP id
 ffacd0b85a97d-39ea5203a18mr5389468f8f.4.1744731095920; 
 Tue, 15 Apr 2025 08:31:35 -0700 (PDT)
Received: from archlinux.. ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae963fccsm14458950f8f.3.2025.04.15.08.31.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 08:31:35 -0700 (PDT)
From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Martin Bark <martin@barkynet.com>
Date: Tue, 15 Apr 2025 17:31:24 +0200
Message-ID: <20250415153127.1868025-3-gael.portay+rtone@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250415153127.1868025-1-gael.portay+rtone@gmail.com>
References: <20250415153127.1868025-1-gael.portay+rtone@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744731096; x=1745335896; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zLhv/orvvKJ0+t5sR1vF39cg5lRPcheoEHDPzLRaflI=;
 b=m3vUk9AswLk+FvlwtJsLxGVTyQtCcMcq9itAHnVctzwWeMcbmfyytg7UPUpKA5iMgJ
 fZkMQ0zpY4gbGv3yXa2Vh9+ETHyXeUUW4CYEl2aIjyC8GSvvx7yI/RVfq3XyLocxUECs
 hMWLT2S39wsgpak2EA0xq66OI+Whd9DH98Zu/6o6e57cQJSDDrCeVQ1TaITN7ThQ9x5a
 B1eJXgYyV7fldt3JnakglO0pt5LsrBpibLaJzx1yo1ytdcvDl2L3quF466VJT2YAjv7q
 2sY90IM6JZhiklL+mSySRvjZky23qJv3oY+rUwT98t+FZYdMeOb8EmyWUAIt/v0HmGy9
 PDGA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=m3vUk9As
Subject: [Buildroot] [PATCH 3/6] board/raspberrypi/readme.txt: add videocore
 note
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

VGhlIFZpZGVvQ29yZSBibG9icyBmb3IgdGhlIFJhc3BiZXJyeSBQaSAxLCAyLCAzLCBaZXJvLCBa
ZXJvIFcgYW5kIFplcm8KMiBXIGFyZSBkaWZmZXJlbnRzIGZyb20gdGhlIG9uZXMgZm9yIHRoZSBS
YXNwYmVycnkgUGkgNCBhbmQgdGhlIENvbXB1dGUKTW9kdWxlIDQuCgpUaGUgVmlkZW9Db3JlIGJs
b2JzIGZvciB0aGUgUmFzcGJlcnJ5IFBpIDQgYXJlIG5hbWVkIHdpdGggYSA0WzFdIChpLmUuCnN0
YXJ0NC5lbGYsIHN0YXJ0NHguZWxmLCBzdGFydDRkYi5lbGYgYW5kIHN0YXJ0NGNkLmVsZikuCgpU
aGlzIHByZWNpc2VzIHdoaWNoIFZpZGVvQ29yZSBmaXJtd2FyZSBibG9iIGZpbGVzIGFyZSBwcmVz
ZW50IG9uIHRoZQpSYXNwYmVycnkgUGkgMSwgMiwgMywgWmVybyBXLCBaZXJvIDIgVyBhbmQgd2hp
Y2ggZmlsZXMgYXJlIHByZXNlbnQgb24KdGhlIHRoZSBSYXBzYmVycnkgUGkgNCBhbmQgdGhlIENv
bXB1dGUgTW9kdWxlIDQuCgpOb3RlOiBUaGUgVmlkZW9Db3JlIGJsb2JzIGZvciB0aGUgUmFzcGJl
cnJ5IFBpIDUgYXJlIHNlbGYtY29udGFpbmVkIGluCml0cyBib290bG9hZGVyIEVFUFJPTVsxXVsy
XTsgdGhlcmUgaXMgbm8gYWRkaXRpb25hbCBmaWxlcyBmb3IgcGk1LgoKWzFdOiBodHRwczovL3d3
dy5yYXNwYmVycnlwaS5jb20vZG9jdW1lbnRhdGlvbi9jb21wdXRlcnMvY29uZmlndXJhdGlvbi5o
dG1sI3N0YXJ0LWVsZgpbMl06IGh0dHBzOi8vd3d3LnJhc3BiZXJyeXBpLmNvbS9kb2N1bWVudGF0
aW9uL2NvbXB1dGVycy9jb25maWdfdHh0Lmh0bWwjc3RhcnRfZmlsZS1maXh1cF9maWxlCgpTaWdu
ZWQtb2ZmLWJ5OiBHYcOrbCBQT1JUQVkgPGdhZWwucG9ydGF5K3J0b25lQGdtYWlsLmNvbT4KLS0t
CiBib2FyZC9yYXNwYmVycnlwaS9yZWFkbWUudHh0IHwgMTYgKysrKysrKysrKy0tLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvYm9hcmQvcmFzcGJlcnJ5cGkvcmVhZG1lLnR4dCBiL2JvYXJkL3Jhc3BiZXJyeXBpL3JlYWRt
ZS50eHQKaW5kZXggMGYzZWM5ZDhiYi4uYzEyYTg5NjlmMSAxMDA2NDQKLS0tIGEvYm9hcmQvcmFz
cGJlcnJ5cGkvcmVhZG1lLnR4dAorKysgYi9ib2FyZC9yYXNwYmVycnlwaS9yZWFkbWUudHh0CkBA
IC0xMTUsMTEgKzExNSwxMSBAQCBBZnRlciBidWlsZGluZywgeW91IHNob3VsZCBvYnRhaW4gdGhp
cyB0cmVlOgogICAgIHwgICArLS0gYm9vdGNvZGUuYmluICAgICAgICAgICAgWzJdCiAgICAgfCAg
ICstLSBjbWRsaW5lLnR4dAogICAgIHwgICArLS0gY29uZmlnLnR4dAotICAgIHwgICArLS0gZml4
dXAuZGF0ICAgICAgICAgICAgICAgWzFdCi0gICAgfCAgICstLSBmaXh1cDQuZGF0ICAgICAgICAg
ICAgICBbMV0KLSAgICB8ICAgKy0tIHN0YXJ0LmVsZiAgICAgICAgICAgICAgIFsxXQotICAgIHwg
ICArLS0gc3RhcnQ0LmVsZiAgICAgICAgICAgICAgWzFdCi0gICAgfCAgIGAtLSBvdmVybGF5cy8g
ICAgICAgICAgICAgICBbM10KKyAgICB8ICAgKy0tIGZpeHVwLmRhdCAgICAgICAgICAgICAgIFsz
XQorICAgIHwgICArLS0gZml4dXA0LmRhdCAgICAgICAgICAgICAgWzRdCisgICAgfCAgICstLSBz
dGFydC5lbGYgICAgICAgICAgICAgICBbM10KKyAgICB8ICAgKy0tIHN0YXJ0NC5lbGYgICAgICAg
ICAgICAgIFs0XQorICAgIHwgICBgLS0gb3ZlcmxheXMvICAgICAgICAgICAgICAgWzVdCiAgICAg
Ky0tIHNkY2FyZC5pbWcKICAgICArLS0gSW1hZ2UgICAgICAgICAgICAgICAgICAgICAgIFsxXQog
ICAgIGAtLSB6SW1hZ2UgICAgICAgICAgICAgICAgICAgICAgWzFdCkBAIC0xMzEsNyArMTMxLDEx
IEBAIEFmdGVyIGJ1aWxkaW5nLCB5b3Ugc2hvdWxkIG9idGFpbiB0aGlzIHRyZWU6CiAgICAgUGkg
NCwgNDAwLCA1IGFuZCB0aGUgQ29tcHV0ZSBNb2R1bGUgNCwgNHMgYW5kIDUgbG9hZCB0aGUgc2Vj
b25kIHN0YWdlCiAgICAgYm9vdGxvYWRlciBmcm9tIGEgU1BJIGZsYXNoIEVFUFJPTS4KIAotWzNd
IE9ubHkgZm9yIHRoZSBSYXNwYmVycnkgUGkgaW5zdGFsbGluZyBkZXZpY2UtdHJlZSBvdmVybGF5
cy4gVGhlIFJhc3BiZXJyeSBQaQorWzNdIE9ubHkgZm9yIHRoZSBSYXNwYmVycnkgUGkgMSwgMiwg
MywgWmVybyBhbmQgWmVybyAyLgorCitbNF0gT25seSBmb3IgdGhlIFJhc3BiZXJyeSBQaSA0LCA0
MDAsIENvbXB1dGUgTW9kdWxlIDQgYW5kIDRzLgorCitbNV0gT25seSBmb3IgdGhlIFJhc3BiZXJy
eSBQaSBpbnN0YWxsaW5nIGRldmljZS10cmVlIG92ZXJsYXlzLiBUaGUgUmFzcGJlcnJ5IFBpCiAg
ICAgd2l0aCBCbHVldG9vdGggY29ubmVjdGl2aXR5IChaZXJvIFcsIFplcm8gMiBXLCAzLCA0LCA0
MDAsIENvbXB1dGUgTW9kdWxlIDQKICAgICBhbmQgNHMpIHVzZSB0aGUgbWluaXVhcnQtYnQgb3Zl
cmxheSB0byBlbmFibGUgVUFSVDAgZm9yIHRoZSBzZXJpYWwgY29uc29sZTsKICAgICB0aGUgQmx1
ZXRvb3RoIHVzZXMgdGhlIG1pbmktVUFSVCBpbnN0ZWFkLiBBbHRlcm5hdGl2ZSB3b3VsZCBiZSB0
byBkaXNhYmxlCi0tIAoyLjQ5LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
