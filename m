Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C7EC3DA49
	for <buildroot@archiver.kernel.org>; Tue, 16 Jul 2024 05:44:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80B14812FD;
	Tue, 16 Jul 2024 05:44:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fzEthnnxDzTT; Tue, 16 Jul 2024 05:44:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9355813EB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9355813EB;
	Tue, 16 Jul 2024 05:44:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AE0A41BF312
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 05:44:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9700181096
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 05:44:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QcD7WAxE-j-Y for <buildroot@lists.busybox.net>;
 Tue, 16 Jul 2024 05:44:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=gael.portay@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F19B181320
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F19B181320
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F19B181320
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 05:44:31 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4266eda81c5so39503015e9.0
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 22:44:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721108669; x=1721713469;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EJr9SifrxtVsZZbBD30NMHwFALclCJzR6A3GMRMDe1k=;
 b=HCYL9kc/1qe4FOdgX0xglkhATX9osEEiHwYbnRAdlWkJK9QG8W6YNVNnamaZqPUKu6
 3IwLqdchrEAxklnhdoOYdhwsy87XUqfo4dm4STFJ378jwdL8WusfbcNAd+HYcy+bivAE
 T7IhanPjSS0mZLZfPQVh6ka8nxJpk9rMW9VnlZY/SdXqu+ruA1/4Lo09AdjOU66lTux6
 9vRkDpNF6dcfa98v47EZRkhVAzmq5APn3UPo8qUH2iKTs/Chya3JCLXdAPtRsaadB/Vj
 IVWC1OTxIFDZO5YBecx+4WCJGHcfeThVc/1hqbTVWWbi0H46S1ou/TMqPGWIVALx8Nyn
 pbNg==
X-Gm-Message-State: AOJu0Yx8asMtm7k9Wj2GSu2M+HhYHg0mwi8RK3l9Map7JTv7GPBTgNrQ
 wFlzJYf4P/vUsCwVt2LQmBP5DgBh1WosbfHiYwXqu92xIk2latwsKP58O2xa
X-Google-Smtp-Source: AGHT+IFMWAK1/pd8KAuXnRK7g5hcY1UEG2iL28RUbW1iuz7Fpi3XbrW7eQ4Ac9UgzDBQAR5+F29OoA==
X-Received: by 2002:a05:600c:4708:b0:426:673a:2904 with SMTP id
 5b1f17b1804b1-427ba71ecdamr7519655e9.36.1721108668992; 
 Mon, 15 Jul 2024 22:44:28 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427a5e7749esm110658705e9.2.2024.07.15.22.44.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jul 2024 22:44:27 -0700 (PDT)
From: "=?UTF-8?q?Ga=C3=ABl=20PORTAY?=" <gael.portay@gmail.com>
X-Google-Original-From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>
To: buildroot@buildroot.org
Date: Tue, 16 Jul 2024 07:43:58 +0200
Message-ID: <20240716054359.92966-8-gael.portay@rtone.fr>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240716054359.92966-1-gael.portay@rtone.fr>
References: <20240716054359.92966-1-gael.portay@rtone.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721108669; x=1721713469; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EJr9SifrxtVsZZbBD30NMHwFALclCJzR6A3GMRMDe1k=;
 b=FDhVN35nVVDUYn7D5SD/BR0fKe6gSeuWoCM/2826Chy9u3Szpggjq67mGCGoEQyRdC
 0+GoVWL8FENPMmq+CdaapIhKpstPMNYdfcMM/iVsWeyUcCcq0BBAiE//o3ZUelpGQ9kI
 qMkOyPrl021L0Al+QultgfvgIV/ftjrfGbKgrTQzIMjUp6faJnHplk9T9R34IG1dL3Ls
 EvofU56GUiHLjN+ToL3KMdS35P3tbjdLnRs3UMA/uOn0aJPFFsSQZnk5AplkLPNK8POq
 LXARIx8ta4wj0V5BK5seYYcDESXh5yOs/9F6SNDdVmm3q1gKTjTdeuq4STQT07JDdE9C
 Xo5w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=FDhVN35n
Subject: [Buildroot] [PATCH 7/8] configs/raspberrypi5: install BCM2712D0
 device-tree blob
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

VGhpcyBpbnN0YWxscyB0aGUgbmV3IFJhc3BiZXJyeSBQaSA1IEJDTTI3MTJEMCBkZXZpY2UtdHJl
ZSBibG9iWzFdLgoKWzFdOiBodHRwczovL2dpdGh1Yi5jb20vcmFzcGJlcnJ5cGkvbGludXgvY29t
bWl0LzAzMjgzNzRhZTA5Yzc4NTZlMDZhNjNhZjBjMDY1ODIyNDc0YTI5ODUKClNpZ25lZC1vZmYt
Ynk6IEdhw6tsIFBPUlRBWSA8Z2FlbC5wb3J0YXlAcnRvbmUuZnI+Ci0tLQogYm9hcmQvcmFzcGJl
cnJ5cGkvcmVhZG1lLnR4dCAgIHwgMSArCiBjb25maWdzL3Jhc3BiZXJyeXBpNV9kZWZjb25maWcg
fCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoK
ZGlmZiAtLWdpdCBhL2JvYXJkL3Jhc3BiZXJyeXBpL3JlYWRtZS50eHQgYi9ib2FyZC9yYXNwYmVy
cnlwaS9yZWFkbWUudHh0CmluZGV4IDI0YjdmNjE5YTMuLjgxY2Q4MWE3ZjMgMTAwNjQ0Ci0tLSBh
L2JvYXJkL3Jhc3BiZXJyeXBpL3JlYWRtZS50eHQKKysrIGIvYm9hcmQvcmFzcGJlcnJ5cGkvcmVh
ZG1lLnR4dApAQCAtMTA0LDYgKzEwNCw3IEBAIEFmdGVyIGJ1aWxkaW5nLCB5b3Ugc2hvdWxkIG9i
dGFpbiB0aGlzIHRyZWU6CiAgICAgKy0tIGJjbTI3MTEtcnBpLWNtNC5kdGIgICAgICAgICBbMV0K
ICAgICArLS0gYmNtMjcxMS1ycGktY200cy5kdGIgICAgICAgIFsxXQogICAgICstLSBiY20yNzEy
LXJwaS01LWIuZHRiICAgICAgICAgWzFdCisgICAgKy0tIGJjbTI3MTJkMC1ycGktNS1iLmR0YiAg
ICAgICBbMV0KICAgICArLS0gYm9vdC52ZmF0CiAgICAgKy0tIHJvb3Rmcy5leHQ0CiAgICAgKy0t
IHJwaS1maXJtd2FyZS8KZGlmZiAtLWdpdCBhL2NvbmZpZ3MvcmFzcGJlcnJ5cGk1X2RlZmNvbmZp
ZyBiL2NvbmZpZ3MvcmFzcGJlcnJ5cGk1X2RlZmNvbmZpZwppbmRleCAzYzg4Y2U0NmNkLi42NzAy
NmUwZDZkIDEwMDY0NAotLS0gYS9jb25maWdzL3Jhc3BiZXJyeXBpNV9kZWZjb25maWcKKysrIGIv
Y29uZmlncy9yYXNwYmVycnlwaTVfZGVmY29uZmlnCkBAIC0xNyw3ICsxNyw3IEBAIEJSMl9MSU5V
WF9LRVJORUxfREVGQ09ORklHPSJiY20yNzEyIgogCiAjIEJ1aWxkIHRoZSBEVEIgZnJvbSB0aGUg
a2VybmVsIHNvdXJjZXMKIEJSMl9MSU5VWF9LRVJORUxfRFRTX1NVUFBPUlQ9eQotQlIyX0xJTlVY
X0tFUk5FTF9JTlRSRUVfRFRTX05BTUU9ImJyb2FkY29tL2JjbTI3MTItcnBpLTUtYiIKK0JSMl9M
SU5VWF9LRVJORUxfSU5UUkVFX0RUU19OQU1FPSJicm9hZGNvbS9iY20yNzEyLXJwaS01LWIgYnJv
YWRjb20vYmNtMjcxMmQwLXJwaS01LWIiCiAKIEJSMl9MSU5VWF9LRVJORUxfTkVFRFNfSE9TVF9P
UEVOU1NMPXkKIAotLSAKMi40NS4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
