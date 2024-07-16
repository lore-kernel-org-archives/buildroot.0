Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F4DDC3DA49
	for <buildroot@archiver.kernel.org>; Tue, 16 Jul 2024 05:44:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43873812F9;
	Tue, 16 Jul 2024 05:44:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ll2mkqJvijdb; Tue, 16 Jul 2024 05:44:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BC4F812F1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1BC4F812F1;
	Tue, 16 Jul 2024 05:44:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 53F2A1BF312
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 05:44:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F83D60850
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 05:44:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9KcL09mESfoo for <buildroot@lists.busybox.net>;
 Tue, 16 Jul 2024 05:44:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=gael.portay@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E05CF60673
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E05CF60673
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E05CF60673
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 05:44:22 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4266fd39527so37216065e9.1
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 22:44:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721108660; x=1721713460;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8Y6TJ7/ctfkNJbzzKeMRaPMnyZ5ZAkfsKJst+P03roY=;
 b=fpNYNLYbCU4Udh166pWtsOp31vdd6/501JKvL78PJa0wrthBWIYj1SHL9Dr1JolIhc
 Zx716xK7u9n30XkMo1Le+xCEltI7RvI4OPkayK4CiqxyxKneDxq/c1tu+mlSOJitx7ua
 mlnNzVQSoaoc74ojRUDiCdwVByVrNEDw+rqOdHLMn3ILJrROePM/QMMS+6hcbKHZ7Ttg
 cV26q1aiCIvITkwjRzImuN4wFFvvqR8pBkYEcxVupxFw4he/N2F4edeuVBA8NDEycc6z
 hgtPXgs1M9Ymn7Zvs00Wg6okCCBJhN4SEgXwXiJDQOld8rPnEgPSEDj6oUO6UdBbOqsw
 CHZg==
X-Gm-Message-State: AOJu0YzMOv3lzYWKjedUAdap08WUVrfHGgtQw3PlVEXR18wt/UjRv5ee
 qxBLr3ZMUcNPmKd+fPtb7/VFdgblv0f+HWkdxt1XGWFyyPDx85b6ueSD0SYf
X-Google-Smtp-Source: AGHT+IE1896YrOkbkgwnEmXXda0WubztpmczUfscXARnjjuGelqbPrH81gNH+N2ngHcWeAeMmClMcw==
X-Received: by 2002:a05:600c:4689:b0:426:616e:6a6a with SMTP id
 5b1f17b1804b1-427ba6a4823mr5489895e9.22.1721108659504; 
 Mon, 15 Jul 2024 22:44:19 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427a5e7749esm110658705e9.2.2024.07.15.22.44.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jul 2024 22:44:19 -0700 (PDT)
From: "=?UTF-8?q?Ga=C3=ABl=20PORTAY?=" <gael.portay@gmail.com>
X-Google-Original-From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>
To: buildroot@buildroot.org
Date: Tue, 16 Jul 2024 07:43:51 +0200
Message-ID: <20240716054359.92966-1-gael.portay@rtone.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721108660; x=1721713460; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8Y6TJ7/ctfkNJbzzKeMRaPMnyZ5ZAkfsKJst+P03roY=;
 b=S1Z5A+SGMrBh2OtnP5PatvDvaoBBvMXyT/4Gu+W42C40NLaurvdP1Cu8iyr+2+rzFf
 4igrGtjq2JCfsb/QmOjhuI7/l/wN60NxEH+q+1j1MrTgYlEkF89CbJIr8qnPf2RbMnRh
 kDXl6K+WH2i0OWrliV4a5ux1W2CZkRbTMqG9KiT5IEW38jVQ20VTg0u/qsspFKAO9IsM
 nQKy3YX1DBUjTyQwyZw6wjB7VquGcYhaChuLWCX7cut4FZn0rhWdZzXnFPgG5YrcCv7I
 Tyd+AccXlocbBXr03uq6SCuUL9/HGjbumUokONKp3TGK+5y1d+PFVQ5Wkfs3D47cggH6
 WX8g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=S1Z5A+SG
Subject: [Buildroot] [PATCH 0/8] configs/raspberrypi*: install missing dtb
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

SGVsbG8sCgpUaGlzIHBhdGNoIHNlcmllIGluc3RhbGxzIHRoZSBtaXNzaW5nIGRldmljZS10cmVl
IGJsb2JzIGFjY29yZGluZyB0bwp0aGVpciBoYXJkd2FyZSdzIGRlZmNvbmZpZyBhbmQgaXQgY2xl
YW5zIHVwIHRoZSBkZWZjb25maWdzIHNvIHRoZXkgbG9vawpzaW1pbGFyLgoKSSBub3RpY2VkIHRo
ZSBkZWZjb25maWcgZmlsZXMgc2xpZ2hseSBkaWZmZXIgd2hpbGUgSSB3YXMgZGlmZidpbmcgdGhl
bQp0b2dldGhlci4KCkFsc28sIEkgbm90aWNlZCB0aGF0IHRoZXkgYXJlIHNldmVyYWwgZGV2aWNl
LXRyZWUgYmxvYnMgdGhhdCBhcmUgbm90Cmluc3RhbGxlZCBieSB0aGUgZGVmY29uZmlncyAodmFy
aW91cyB2YXJpYW50cykuCgpIZXJlIGlzIHRoZSBsaXN0IG9mIHRoZSBkb3duc3RyZWFtIGJjbTI3
eHggZ2VuZXJhdGVkIGR0YnM6CiAtIGJjbTI3MDgtcnBpLWItcGx1cy5kdGIKIC0gYmNtMjcwOC1y
cGktYi1yZXYxLmR0YiAobm90IGluc3RhbGxlZDsgUmFzcGJlcnJ5IFBpKQogLSBiY20yNzA4LXJw
aS1iLmR0YgogLSBiY20yNzA4LXJwaS1jbS5kdGIKIC0gYmNtMjcwOC1ycGktemVyby13LmR0Ygog
LSBiY20yNzA4LXJwaS16ZXJvLmR0YgogLSBiY20yNzA5LXJwaS0yLWIuZHRiCiAtIGJjbTI3MDkt
cnBpLWNtMi5kdGIgKG5vdGU6IHRoZXJlIGlzIG5vIENvbXB1dGUgTW9kdWxlIDIgYXZhaWxhYmxl
LAogICBwcm90b3R5cGU/KQogLSBiY20yNzEwLXJwaS0yLWIuZHRiIChub3QgaW5zdGFsbGVkOyBS
YXNwYmVycnkgUGkgMiByZXYgMS4yLCB1c2luZwogICBCQ00yODM3IGluc3RlYWQgb2YgQkNNMjgz
NikKIC0gYmNtMjcxMC1ycGktMy1iLXBsdXMuZHRiCiAtIGJjbTI3MTAtcnBpLTMtYi5kdGIKIC0g
YmNtMjcxMC1ycGktY20zLmR0YiAobm90IGluc3RhbGxlZCBvbiByYXNwYmVycnlwaTNfNjRfZGVm
Y29uZmlnLAogICBpbnN0YWxsZWQgb24gcmFzcGJlcnJ5cGkzX3sscXQ1d2VffWRlZmNvbmZpZykK
IC0gYmNtMjcxMC1ycGktemVyby0yLXcuZHRiCiAtIGJjbTI3MTAtcnBpLXplcm8tMi5kdGIgKG5v
dGU6IHRoZXJlIGlzIG5vIFJhc3BiZXJyeSBQaSBaZXJvIDIsCiAgIHByb3RvdHlwZT8pCiAtIGJj
bTI3MTEtcnBpLTQtYi5kdGIKIC0gYmNtMjcxMS1ycGktNDAwLmR0YiAobm90IGluc3RhbGxlZDsg
UmFzcGJlcnJ5IFBpIDQwMCkKIC0gYmNtMjcxMS1ycGktY200LWlvLmR0YiAodXBzdHJlYW0gZHRi
KQogLSBiY20yNzExLXJwaS1jbTQuZHRiIChub3QgaW5zdGFsbGVkIG9uIHJhc3BiZXJyeXBpNHss
XzY0fV9kZWZjb25maWc7CiAgIGluc3RhbGxlZCBvbiByYXNwZXJyeXBpY200aW97LF82NH1fZGVm
Y29uZmlnOyBDb21wdXRlIE1vZHVsZSA0KQogLSBiY20yNzExLXJwaS1jbTRzLmR0YiAobm90IGlu
c3RhbGxlZCBvbiByYXNwYmVycnlwaTR7LF82NH1fZGVmY29uZmlnOwogICBpbnN0YWxsZWQgb24g
cmFzcGVycnlwaWNtNGlveyxfNjR9X2RlZmNvbmZpZzsgQ29tcHV0ZSBNb2R1bGUgNHMpCiAtIGJj
bTI3MTItcnBpLTUtYi5kdGIKIC0gYmNtMjcxMi1ycGktY201LWNtNGlvLmR0YiAobm90ZTogdGhl
cmUgaXMgbm8gQ29tcHV0ZSBNb2R1bGUgNSwgeWV0PykKIC0gYmNtMjcxMi1ycGktY201LWNtNWlv
LmR0YiAobm90ZTogdGhlcmUgaXMgbm8gQ29tcHV0ZSBNb2R1bGUgNSwgeWV0PykKIC0gYmNtMjcx
MmQwLXJwaS01LWIuZHRiIChub3QgaW5zdGFsbGVkIG9uIHJhc3BiZXJyeXBpNV9kZWZjb25maWc7
IG5ldwogICByZWxlYXNlIG9mIFJhc3BiZXJyeSBQaSA1IG9yIENvbXB1dGUgTW9kdWxlIDU/KQoK
VGhlIGZpcnN0IHNldmVuIGNvbW1pdHMgaW5zdGFsbHMgKHJlbW92ZSkgdGhlIGRldmljZS10cmVl
IGJsb2JzIGJ5CmFwcGVuZGluZyAocmVtb3ZpbmcpIHRoZW0gdG8gKGZyb20pIEJSMl9MSU5VWF9L
RVJORUxfSU5UUkVFX0RUU19OQU1FOgogIC0gUmFzcGJlcnJ5IFBpIHJldiAxLjAgKGJjbTI3MDgt
cnBpLWItcmV2MSkgLT4gcmFzcGJlcnJ5cGlfZGVmY29uZmlnCiAgLSBSYXNwYmVycnkgUGkgMiBy
ZXYgMS4yIChiY20yNzEwLXJwaS0yLWIpIC0+IHJhc3BiZXJyeXBpMl9kZWZjb25maWcKICAtIENv
bXB1dGUgTW9kdWxlIDMgKGJjbTI3MTAtcnBpLWNtMykgLT4gcmFzcGJlcnJ5cGkzXzY0X2RlZmNv
bmZpZwogIC0gUmFzcGJlcnJ5IFBpIDQwMCAoYmNtMjcxMS1ycGktNDAwKSAtPiByYXNwYmVycnlw
aTR7LF82NH1fZGVmY29uZmlnCiAgLSBDb21wdXRlIE1vZHVsZSA0LzRzIChiY20yNzExLXJwaS1j
bTR7LHN9KSAtPiByYXNwYmVycnlwaTR7LF82NH1fZGVmY29uZmlnCiAgLSBSYXNwYmVycnkgUGkg
NSBCQ00yNzEyRDAgKGJjbTI3MTJkMC1ycGktNS1iKSAtPiByYXNwYmVycnlwaTVfZGVmY29uZmln
CgpJdCBleGlzdHMgdHdvIGtpbmRzIG9mIGRldmljZS10cmVlIGJsb2JzICh1cCB0byB0aGUgUmFz
cGJlcnJ5IFBpIDMpWzFdOgogLSB0aGUgZG93bnN0cmVhbSBkdGJzIGFyZSBuYW1lZCBhZnRlciB0
aGUgZGllIG5hbWUgKGkuZS4gQkNNMjd4eCkKIC0gdGhlIHVwc3RyZWFtIGR0YnMgYXJlIG5hbWUg
YWZ0ZXIgdGhlIHBhY2thZ2UgbmFtZSAoaS5lLiBCQ00yODN4KQpFdmVyeSBkZWZjb25maWdzIGlu
c3RhbGwgZXhjbHVzaXZlbHkgdGhlIGRvd25zdHJlYW0gZGV2aWNlLXRyZWUgYmxvYiwgYXQKdGhl
IGV4Y2VwdGlvbiBvZiB0aGUgcmFzcGJlcnJ5cGkzXzY0X2RlZmNvbmZpZyB0aGF0IGluc3RhbGxz
IGJvdGggc2luY2UKdGhlIGJlZ2luaW5nLiBUaGUgZm91cnRoIHBhdGNoIHJlbW92ZXMgdGhlIHVw
c3RyZWFtIGRldmljZS10cmVlIGJsb2IuClRoZSBmaXJtd2FyZSBzZWxlY3RzIHRoZSBkb3duc3Ry
ZWFtIGR0YiB1bmxlc3MgdXBzdHJlYW1fa2VybmVsPTEgaXMKc2V0WzJdLgoKVGhlIGxhc3QgcGF0
Y2ggbW92ZXMgc29tZSBjb25maWdzIGluIHRoZSBkZWZjb25maWdzIGFuZCByZW1vdmVzIHNvbWUK
Y29tbWVudHMgc28gdGhlIGRlZmNvbmZpZyBmaWxlcyBsb29rIHNpbWlsYXIgYW5kIGl0IG1ha2Vz
IGEgZGlmZiBlYXN5LgoKUXVlc3Rpb246IEkgYW0gYSBiaXQgcGVycGxleCBieSBpbnN0YWxsaW5n
IHRoZSBSYXNwYmVycnkgUGkgMiByZXYgMS4yIGluCnRoZSByYXNwYmVycnlwaTJfZGVmY29uZmln
IHNpbmNlIGl0cyBzd2l0Y2hlZCBmcm9tIEJDTTI4MzYgKGNvcnRleC1hNykKdG8gQkNNMjgzNyAo
Y29ydGV4LWE1MywgdGhlIHNhbWUgYXMgcGkzIGFuZCBwaXplcm8ydykuCgpJIHRoaW5rIGl0IG1h
a2VzIHNlbnNlIHRvIGluc3RhbGwgaXRzIGR0YiB1c2luZyBpdHMgYm9hcmQncyBkZWZjb25maWcK
KHJhc3BlcnJ5cGkyX2RlZmNvbmZpZykgYXQgdGhlIGNvc3Qgb2YgInBlcmZvcm1hbmNlIiBiZWNh
dXNlIGl0IGxvc2VzCml0cyB0cnVlIGFyY2hpdGVjdHVyZS4KCkFsc28sIGl0IG1ha2VzIHNlbnNl
IHRvIGluc3RhbGwgaXRzIGR0YiBmcm9tIHRoZSByYXNwYmVycnlwaTNfZGVmY29uZmlnCmFzIGl0
IHVzZXMgdGhlIHNhbWUgU29DIGF0IHRoZSBjb3N0IG9mICJjb25zaXN0ZW5jeSIgYmVjYXVzZSB0
aGUKZGVmY29uZmlnIGZvciBwaTMgaW5zdGFsbHMgdGhpbmdzIGZvciB0aGUgcGkyIDEuMiAoYW5k
IGFkZCBpdHMgZHRzIHRvCnJhc3BiZXJyeXBpM182NF9kZWZjb25maWcgYXMgd2VsbCBzaW5jZSBC
Q00yODM3IGlzIDY0LWJpdCkuCgpBbHRlcm5hdGl2ZWx5LCBpdCBjYW4gYmUgaW5zdGFsbGVkIG9u
IGJvdGgsIG9yIChidXQgdGVycmlibGUpLCB0d28gbW9yZQpkZWZjb25maWdzIGNhbiBiZSBhZGRl
ZCBmb3IgdGhhdCBzcGVjaWZpYyBjYXNlOgogLSByYXNwYmVycnlwaTJfMS4yX2RlZmNvbmZpZwog
LSByYXNwYmVycnlwaTJfMS4yXzY0X2RlZmNvbmZpZwoKV2hhdCBpcyB5b3VyIG9waW5pb24/Cgpb
MV06IGh0dHBzOi8vZ2l0aHViLmNvbS9yYXNwYmVycnlwaS9saW51eC9pc3N1ZXMvMzIzNwpbMl06
IGh0dHBzOi8vd3d3LnJhc3BiZXJyeXBpLmNvbS9kb2N1bWVudGF0aW9uL2NvbXB1dGVycy9sZWdh
Y3lfY29uZmlnX3R4dC5odG1sI3Vwc3RyZWFtX2tlcm5lbApbM106IGh0dHBzOi8vd3d3LnJhc3Bi
ZXJyeXBpLmNvbS9kb2N1bWVudGF0aW9uL2NvbXB1dGVycy9yYXNwYmVycnktcGkuaHRtbCNmbGFn
c2hpcC1zZXJpZXMKClJlZ2FyZHMsCkdhw6tsIFBPUlRBWSAoOCk6CiAgY29uZmlncy9yYXNwYmVy
cnlwaTogaW5zdGFsbCBSYXNwYmVycnkgUGkgcmV2IDEuMCBkZXZpY2UtdHJlZSBibG9iCiAgY29u
Zmlncy9yYXNwYmVycnlwaTI6IGluc3RhbGwgUmFzcGJlcnJ5IFBpIDIgcmV2IDEuMiBkZXZpY2Ut
dHJlZSBibG9iCiAgY29uZmlncy9yYXNwYmVycnlwaTNfNjQ6IGluc3RhbGwgQ29tcHV0ZSBNb2R1
bGUgMyBkZXZpY2UtdHJlZSBibG9iCiAgY29uZmlncy9yYXNwYmVycnlwaTNfNjQ6IHJlbW92ZSB1
cHN0cmVhbSBkZXZpY2UtdHJlZSBibG9iCiAgY29uZmlncy9yYXNwYmVycnlwaTQqOiBpbnN0YWxs
IFJhc3BiZXJyeSBQaSA0MDAgZGV2aWNlLXRyZWUgYmxvYgogIGNvbmZpZ3MvcmFzcGJlcnJ5cGk0
KjogaW5zdGFsbCBDb21wdXRlIE1vZHVsZSA0LzRzIGRldmljZS10cmVlIGJsb2JzCiAgY29uZmln
cy9yYXNwYmVycnlwaTU6IGluc3RhbGwgQkNNMjcxMkQwIGRldmljZS10cmVlIGJsb2IKICBjb25m
aWdzL3Jhc3BiZXJyeXBpKjogc29ydCBzb21lIGNvbmZpZ3MKCiBib2FyZC9yYXNwYmVycnlwaS9y
ZWFkbWUudHh0ICAgICAgICAgIHwgIDYgKysrKystCiBjb25maWdzL3Jhc3BiZXJyeXBpMF9kZWZj
b25maWcgICAgICAgIHwgIDMgLS0tCiBjb25maWdzL3Jhc3BiZXJyeXBpMHdfZGVmY29uZmlnICAg
ICAgIHwgIDEgKwogY29uZmlncy9yYXNwYmVycnlwaTJfZGVmY29uZmlnICAgICAgICB8ICA4ICsr
Ky0tLS0tCiBjb25maWdzL3Jhc3BiZXJyeXBpM182NF9kZWZjb25maWcgICAgIHwgIDggKysrLS0t
LS0KIGNvbmZpZ3MvcmFzcGJlcnJ5cGkzX2RlZmNvbmZpZyAgICAgICAgfCAgNiArKy0tLS0KIGNv
bmZpZ3MvcmFzcGJlcnJ5cGkzX3F0NXdlX2RlZmNvbmZpZyAgfCAxNSArKysrKysrLS0tLS0tLS0K
IGNvbmZpZ3MvcmFzcGJlcnJ5cGk0XzY0X2RlZmNvbmZpZyAgICAgfCAgOCArKystLS0tLQogY29u
Zmlncy9yYXNwYmVycnlwaTRfZGVmY29uZmlnICAgICAgICB8ICA4ICsrKy0tLS0tCiBjb25maWdz
L3Jhc3BiZXJyeXBpNV9kZWZjb25maWcgICAgICAgIHwgMTMgKysrKysrLS0tLS0tLQogY29uZmln
cy9yYXNwYmVycnlwaV9kZWZjb25maWcgICAgICAgICB8ICA0ICstLS0KIGNvbmZpZ3MvcmFzcGJl
cnJ5cGljbTRpb182NF9kZWZjb25maWcgfCAgNiArKy0tLS0KIGNvbmZpZ3MvcmFzcGJlcnJ5cGlj
bTRpb19kZWZjb25maWcgICAgfCAgNiArKy0tLS0KIGNvbmZpZ3MvcmFzcGJlcnJ5cGl6ZXJvMndf
ZGVmY29uZmlnICAgfCAgNSArKystLQogMTQgZmlsZXMgY2hhbmdlZCwgNDEgaW5zZXJ0aW9ucygr
KSwgNTYgZGVsZXRpb25zKC0pCgotLSAKMi40NS4yCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
