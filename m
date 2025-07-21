Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A99BC83F26
	for <buildroot@archiver.kernel.org>; Mon, 21 Jul 2025 15:48:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A12C6147E;
	Mon, 21 Jul 2025 15:48:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9x06wHbBm7zF; Mon, 21 Jul 2025 15:48:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F5D0610AE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F5D0610AE;
	Mon, 21 Jul 2025 15:48:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id ECA68DA
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 15:48:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D40D34016C
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 15:48:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3lRhUKzXL2Qv for <buildroot@buildroot.org>;
 Mon, 21 Jul 2025 15:48:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B266940245
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B266940245
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B266940245
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 15:48:23 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-ae3a604b43bso758135666b.0
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 08:48:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753112901; x=1753717701;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LsA2x/TzhjfKB4jkltQpitdAi07s0VDwdoFmqheFhaI=;
 b=peSDwyOciMoC4mcIe7ruJX/VKDWDQZiWSKUou1EC2Io5nzFreunCoRgRbJWyWehubX
 oeFzV7z/cKCE6Feh6xYrY7T4cf1HEVyrBWhJJkLLp362HeHhdqVsTDEiJN0geQIiYE3M
 S4gFNGwzOEuGsiPtZpyRB9EmxY8hzjKqj+GolCWFOZ/9Q5tZYeDyJF9CL22xIal7pxAZ
 9b7BWvjr6CghvFlPU7MLSKtZqQI7V4spkjBLVsbDeTjeoL1ahQwfOhRQX8W0GAzbkrar
 bgp2SzJyJdG0YodS8EeVIZCtZMoU3JrNr03t4HWVJMLZPPLp6e1hS6Ihu0zLTRmxYaye
 SSog==
X-Gm-Message-State: AOJu0YzkVOrijk+qQq277AN6A9wTgp5pqtOTSJ8oJTBz+mb0zHOMjgdJ
 nPyy9Lok+HLOB+LVJ1yf9WWrec56A5Ean2l3S46dmex+BHX8foi3MehxgZkvyt+fHuIDnNtpIXR
 vpsee
X-Gm-Gg: ASbGncvAGW35CDFEjOUFxk6XaBKZ0e54sRn7jklnD7BsQkAqUwB8q/MSZdpB7oeRtkq
 xSfaThpPBRnLvBGxQormeVe4fTcXnuPOTathijyYH40ULkHWXePiM7BTFJwRYDorAW1YWegHajn
 v+TiO1RjcaEOi4CTlKuzjasy+o5kibePRuIFNWLPfuOz9wttbnfvT8wr0Wyo25jWOv4odjOhSQj
 0Y9GfQa5CM0JI+wzSYAloMcp28GmqpkQgWfyQcAIHBrZtmhmFpQPbVl8dESwEQTlCrAQCxLN+j2
 B1g/5QJzwrzxOkC6cPKKs85ojcNKl+QMt65Wq81Jp8qp3SgbZKXI1VoszINfEGX9Bd9roNbIrgb
 MjqrG/P4aUVTzhpEQL46HPT8=
X-Google-Smtp-Source: AGHT+IE8FdnucvSdM2ZQKu+Sj87ZIxw+ydxMyd67We2OOBbd2cWCVDniQlWUD14gSINmivgGmqABFw==
X-Received: by 2002:a17:907:cd0e:b0:aec:5a71:4513 with SMTP id
 a640c23a62f3a-aec5a714cd4mr1480000466b.4.1753112901096; 
 Mon, 21 Jul 2025 08:48:21 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aec6c795282sm699644866b.6.2025.07.21.08.48.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jul 2025 08:48:19 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 0AA8D5F888;
 Mon, 21 Jul 2025 16:48:15 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Mon, 21 Jul 2025 16:48:09 +0100
Message-ID: <20250721154812.787883-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250721154812.787883-1-alex.bennee@linaro.org>
References: <20250721154812.787883-1-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753112901; x=1753717701; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LsA2x/TzhjfKB4jkltQpitdAi07s0VDwdoFmqheFhaI=;
 b=n5J6hLvxXMk2vww+HOQIGycLwnYYcYdursh2CJbQftKgBsI2VxFEj2P0tWs4JRnmCb
 Tb50KfUPhDadNA1xrCnjpF9XWB/95zb82oplRrMnB6PEDNra2LKAVZWbQmsSd3iDBF7Z
 SyEZ9ErS9jNN+GRXUXetsAi0XihbkNDsrz4iN6iJGZc+kpcRmkbTvTTu1ohSWqr24mQu
 boEgZl4nvk0IV2jovjG5CcUcm8kZTMNs82t63j4AjvhrFXY0Oa+rs4xP9WUl2SUGS9YO
 fbCcvhvdTjJBuxAt+5zrxa3bujeDpOl0efNWeSE0yN4ZPyAL7YLsasRPrEysvAqAE4Z2
 gfFA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=n5J6hLvx
Subject: [Buildroot] [PATCH v3 8/9] package/kvmtool: bump to current HEAD
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

QnkgZG9pbmcgc28gd2UgY2FuIGFsc28gZHJvcCB0aGUgcGF0Y2hlcyBmb3IgbXVzbCB3aGljaCBo
YXZlIG5vdyBiZWVuCm1lcmdlZCB1cHN0cmVhbS4KClNpZ25lZC1vZmYtYnk6IEFsZXggQmVubsOp
ZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4KLS0tCiAuLi5lLWgtaW5jbHVzaW9uLWZvci1tdXNs
LWNvbXBhdGliaWxpdHkucGF0Y2ggfCA1MiAtLS0tLS0tLS0tLS0tLS0tLS0tCiBwYWNrYWdlL2t2
bXRvb2wva3ZtdG9vbC5oYXNoICAgICAgICAgICAgICAgICAgfCAgMiArLQogcGFja2FnZS9rdm10
b29sL2t2bXRvb2wubWsgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KIDMgZmlsZXMgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCA1NCBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBw
YWNrYWdlL2t2bXRvb2wvMDAwMS1yZW1vdmUtd29yZHNpemUtaC1pbmNsdXNpb24tZm9yLW11c2wt
Y29tcGF0aWJpbGl0eS5wYXRjaAoKZGlmZiAtLWdpdCBhL3BhY2thZ2Uva3ZtdG9vbC8wMDAxLXJl
bW92ZS13b3Jkc2l6ZS1oLWluY2x1c2lvbi1mb3ItbXVzbC1jb21wYXRpYmlsaXR5LnBhdGNoIGIv
cGFja2FnZS9rdm10b29sLzAwMDEtcmVtb3ZlLXdvcmRzaXplLWgtaW5jbHVzaW9uLWZvci1tdXNs
LWNvbXBhdGliaWxpdHkucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDMxMjhh
MjM2ODkuLjAwMDAwMDAwMDAKLS0tIGEvcGFja2FnZS9rdm10b29sLzAwMDEtcmVtb3ZlLXdvcmRz
aXplLWgtaW5jbHVzaW9uLWZvci1tdXNsLWNvbXBhdGliaWxpdHkucGF0Y2gKKysrIC9kZXYvbnVs
bApAQCAtMSw1MiArMCwwIEBACi1Gcm9tIDA1OTJmOGY4MjljODQzZmY1Y2IyZDEwOGMzMDllMzJm
NGY2ZjUzNzkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBBbmRyZSBQcnp5d2FyYSA8
YW5kcmUucHJ6eXdhcmFAYXJtLmNvbT4KLURhdGU6IFRodSwgMSBBdWcgMjAyNCAxMjoxMDo1NCAr
MDEwMAotU3ViamVjdDogcmVtb3ZlIHdvcmRzaXplLmggaW5jbHVzaW9uIChmb3IgbXVzbCBjb21w
YXRpYmlsaXR5KQotTUlNRS1WZXJzaW9uOiAxLjAKLUNvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsg
Y2hhcnNldD1VVEYtOAotQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAotCi1UaGUgd29y
ZHNpemUuaCBoZWFkZXIgZmlsZSBhbmQgdGhlIF9fV09SRFNJWkUgZGVmaW5pdGlvbiBkbyBub3Qg
c2VlbQotdG8gYmUgdW5pdmVyc2FsLCB0aGUgbXVzbCBsaWJjIGZvciBpbnN0YW5jZSBoYXMgdGhl
IGRlZmluaXRpb24gaW4gYQotZGlmZmVyZW50IGhlYWRlciBmaWxlLiBUaGlzIGJyZWFrcyBjb21w
aWxhdGlvbiBvZiBrdm10b29sIGFnYWluc3QgbXVzbC4KLQotVGhlIHR3byBsZWFkaW5nIHVuZGVy
c2NvcmVzIHN1Z2dlc3QgYSBjb21waWxlci1pbnRlcm5hbCBzeW1ib2wgYW55d2F5LCBzbwotbGV0
J3MganVzdCByZW1vdmUgdGhhdCBwYXJ0aWN1bGFyIG1hY3JvIHVzYWdlIGVudGlyZWx5LCBhbmQg
cmVwbGFjZSBpdAotd2l0aCB0aGUgbnVtYmVyIHdlIHJlYWxseSB3YW50OiB0aGUgc2l6ZSBvZiBh
ICJsb25nIiB0eXBlLgotCi1SZXBvcnRlZC1ieTogSi4gTmV1c2Now6RmZXIgPGoubmV1c2NoYWVm
ZXJAZ214Lm5ldD4KLVNpZ25lZC1vZmYtYnk6IEFuZHJlIFByenl3YXJhIDxhbmRyZS5wcnp5d2Fy
YUBhcm0uY29tPgotUmV2aWV3ZWQtYnk6IEFsZXhhbmRydSBFbGlzZWkgPGFsZXhhbmRydS5lbGlz
ZWlAYXJtLmNvbT4KLUxpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDA4MDExMTEw
NTQuODE4NzY1LTEtYW5kcmUucHJ6eXdhcmFAYXJtLmNvbQotU2lnbmVkLW9mZi1ieTogV2lsbCBE
ZWFjb24gPHdpbGxAa2VybmVsLm9yZz4KLVVwc3RyZWFtOiBodHRwczovL2dpdC5rZXJuZWwub3Jn
L3B1Yi9zY20vbGludXgva2VybmVsL2dpdC93aWxsL2t2bXRvb2wuZ2l0L2NvbW1pdC8/aWQ9MDU5
MmY4ZjgyOWM4NDNmZjVjYjJkMTA4YzMwOWUzMmY0ZjZmNTM3OQotU2lnbmVkLW9mZi1ieTogVGhv
bWFzIFBlcmFsZSA8dGhvbWFzLnBlcmFsZUBtaW5kLmJlPgotLS0tCi0gaW5jbHVkZS9saW51eC9i
aXRvcHMuaCB8IDYgKystLS0tCi0gMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBk
ZWxldGlvbnMoLSkKLQotZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvYml0b3BzLmggYi9pbmNs
dWRlL2xpbnV4L2JpdG9wcy5oCi1pbmRleCBhZTMzOTIyZi4uZWU4ZmQ1NjAgMTAwNjQ0Ci0tLS0g
YS9pbmNsdWRlL2xpbnV4L2JpdG9wcy5oCi0rKysgYi9pbmNsdWRlL2xpbnV4L2JpdG9wcy5oCi1A
QCAtMSwxNSArMSwxMyBAQAotICNpZm5kZWYgX0tWTV9MSU5VWF9CSVRPUFNfSF8KLSAjZGVmaW5l
IF9LVk1fTElOVVhfQklUT1BTX0hfCi0gCi0tI2luY2x1ZGUgPGJpdHMvd29yZHNpemUuaD4KLS0K
LSAjaW5jbHVkZSA8bGludXgva2VybmVsLmg+Ci0gI2luY2x1ZGUgPGxpbnV4L2NvbXBpbGVyLmg+
Ci0gI2luY2x1ZGUgPGFzbS9od2VpZ2h0Lmg+Ci0gCi0tI2RlZmluZSBCSVRTX1BFUl9MT05HIF9f
V09SRFNJWkUKLSAjZGVmaW5lIEJJVFNfUEVSX0JZVEUgICAgICAgICAgIDgKLS0jZGVmaW5lIEJJ
VFNfVE9fTE9OR1MobnIpICAgICAgIERJVl9ST1VORF9VUChuciwgQklUU19QRVJfQllURSAqIHNp
emVvZihsb25nKSkKLSsjZGVmaW5lIEJJVFNfUEVSX0xPTkcgICAgICAgICAgIChCSVRTX1BFUl9C
WVRFICogc2l6ZW9mKGxvbmcpKQotKyNkZWZpbmUgQklUU19UT19MT05HUyhucikgICAgICAgRElW
X1JPVU5EX1VQKG5yLCBCSVRTX1BFUl9MT05HKQotIAotICNkZWZpbmUgQklUX1dPUkQobnIpCQko
KG5yKSAvIEJJVFNfUEVSX0xPTkcpCi0gCi0tLSAKLWNnaXQgMS4yLjMta29yZwotCmRpZmYgLS1n
aXQgYS9wYWNrYWdlL2t2bXRvb2wva3ZtdG9vbC5oYXNoIGIvcGFja2FnZS9rdm10b29sL2t2bXRv
b2wuaGFzaAppbmRleCA2M2JiYjcxNjdjLi44ZGY2ZjkyOWRmIDEwMDY0NAotLS0gYS9wYWNrYWdl
L2t2bXRvb2wva3ZtdG9vbC5oYXNoCisrKyBiL3BhY2thZ2Uva3ZtdG9vbC9rdm10b29sLmhhc2gK
QEAgLTEsMyArMSwzIEBACiAjIExvY2FsbHkgY29tcHV0ZWQKLXNoYTI1NiAgYTg1MDRkOGIxODRj
YWU0ZTY1ZmY1NTU1Y2M4NGE0MzZmM2ZiYmM4MzJhODAxN2UzY2E1OWQ5OTdkZDU1ODFkYiAga3Zt
dG9vbC00ZDJjMDE3ZjQxNTMzYjBlNTFlMDBmNjg5MDUwYzI2MTkwYTE1MzE4LWdpdDQudGFyLmd6
CitzaGEyNTYgIDE4ODQxYzQxNGU4MmI0MDVhMGJkNmY1YzU0NmJjMDg4YmVjZDI5OGMxMTQ1YTJi
YWM5NzU2M2U2OTkyMzE5MjUgIGt2bXRvb2wtMTExN2RiYzhjZWIyMWFiYzZlOGNkOTg2MTQ1MDY5
NTk5NTg1MjI5MC1naXQ0LnRhci5negogc2hhMjU2ICAwZDViZjM0NmRmOWU2MzVhMjlkY2RkZGY4
MzJkYzViMDAyY2E2Y2RjMWM1YzljNmM1NjdkMmE2MWJiMGM1YzE1ICBDT1BZSU5HCmRpZmYgLS1n
aXQgYS9wYWNrYWdlL2t2bXRvb2wva3ZtdG9vbC5tayBiL3BhY2thZ2Uva3ZtdG9vbC9rdm10b29s
Lm1rCmluZGV4IDdmZWM2NjQzZjguLmY1NjM3ZTUzODQgMTAwNjQ0Ci0tLSBhL3BhY2thZ2Uva3Zt
dG9vbC9rdm10b29sLm1rCisrKyBiL3BhY2thZ2Uva3ZtdG9vbC9rdm10b29sLm1rCkBAIC00LDcg
KzQsNyBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIAotS1ZNVE9PTF9WRVJTSU9OID0g
NGQyYzAxN2Y0MTUzM2IwZTUxZTAwZjY4OTA1MGMyNjE5MGExNTMxOAorS1ZNVE9PTF9WRVJTSU9O
ID0gMTExN2RiYzhjZWIyMWFiYzZlOGNkOTg2MTQ1MDY5NTk5NTg1MjI5MAogS1ZNVE9PTF9TSVRF
ID0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvd2lsbC9r
dm10b29sLmdpdAogS1ZNVE9PTF9TSVRFX01FVEhPRCA9IGdpdAogS1ZNVE9PTF9ERVBFTkRFTkNJ
RVMgPSBcCi0tIAoyLjQ3LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
