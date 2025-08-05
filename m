Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D2ABC87FD1
	for <buildroot@archiver.kernel.org>; Tue,  5 Aug 2025 15:18:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F67A83FF9;
	Tue,  5 Aug 2025 15:18:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 80TUagBWhgtx; Tue,  5 Aug 2025 15:18:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87E3E83ED2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87E3E83ED2;
	Tue,  5 Aug 2025 15:18:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C74E1A2
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 15:18:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F2E8A614B5
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 15:18:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z1_LJbnPEjdq for <buildroot@buildroot.org>;
 Tue,  5 Aug 2025 15:18:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E8D1061789
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8D1061789
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E8D1061789
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 15:18:23 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-459e3926cbbso3878395e9.1
 for <buildroot@buildroot.org>; Tue, 05 Aug 2025 08:18:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754407101; x=1755011901;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LsA2x/TzhjfKB4jkltQpitdAi07s0VDwdoFmqheFhaI=;
 b=FrUmsmA0fJM28lPuIdLZaC7oBtOt6ZZUBfxDhIGOQB90rTF7rN6n9hQjAK+srWtgip
 lheUGQyszOWt9UvRNYPnMcWRyJCQ8OuSrRbIcbrZxA+ZyKoIUWnUyCkeSpSJkyGKgOmD
 z+sbR835dV/LYtf0SHDC2hn3Jn6/dC43EpuSdWESYwxuoraaYOdwPAHGUAeXjSTxklQh
 qMrP6Q2uok0hhbbq84s6u4T5mS8UZ9CcjKLbm7Nzkrp2T/5x693D5lkjimFrLvo7KsPy
 v8EWoC1WDPsno+biJtRCqrF9ErvEF5swkUJ5h20L5dqnex9d7Mkw1kuaKK+q0E4KYkec
 TWNw==
X-Gm-Message-State: AOJu0YxQ1f9F/y56VVk6U2YeYJ1kD4eXkqydHaF4QHAgIgRg0N+3X7mW
 Q5RM+YPXRnky/HW29XlYYzXvIzhrmmeTdAqDYrlHwqu4qJVnt51XBqV++B907mM6z7p8arGmavk
 i6C7Y
X-Gm-Gg: ASbGncsOx773w5zMCmSXT6ck3LtcmNbj2xcnEYdn/TJrrFpzJuOcy19NwUnO1iONjkj
 KSlK4NqB6vbJOl8mGMUgGLZdrYQSFuXnqksheaH17qP1SrJZk1ryRK0QkHgYmlUacjihX+43EAQ
 iM7LGwUOcASnc/7gTtSDGVd0X36WVgkdR7M9tfLEtucLEfnxUuUvExYz+9p9Fx8Srtn9IU9iNx6
 VgvS6vrm2dp8yKMuS7g/zeV/lWpW/CeYS/mrFhm/yLOglyLKoR2ds/Z+ThQDfKXFtGMWiK9fJEb
 1/uKpMKmakOvjvZq2tRkeJPoU0TzXuMIy2FCu7t2vNOrAr0CERQxhJoCZYbJ3nmHtearh9RQkEJ
 PSSUa4tNYSprKakZhH4nHLiw=
X-Google-Smtp-Source: AGHT+IFGL+hpT+4z3VAiO5Y9FQnbU/po9TtkEBlO5w1/QlqzxDGxd3AuYY44HI49S6azvWjXjgSbww==
X-Received: by 2002:a05:600c:4f8e:b0:453:8bc7:5cbb with SMTP id
 5b1f17b1804b1-458b6b3d9f1mr81040285e9.25.1754407101130; 
 Tue, 05 Aug 2025 08:18:21 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458b866392csm87803685e9.2.2025.08.05.08.18.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Aug 2025 08:18:19 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 677065F8A7;
 Tue, 05 Aug 2025 16:18:16 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Tue,  5 Aug 2025 16:18:10 +0100
Message-ID: <20250805151814.1114414-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250805151814.1114414-1-alex.bennee@linaro.org>
References: <20250805151814.1114414-1-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754407101; x=1755011901; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LsA2x/TzhjfKB4jkltQpitdAi07s0VDwdoFmqheFhaI=;
 b=jIA64GjNEBkJxCiOT2fBMqhcIqo1Ep6131aeWvhvWc1hd9mBKLPH1ZYSfaPQ2cEywE
 JX+GCAKXodqhffHoGktBytJ1oHdiHiFkOgqZBBup3U/WFKuYhe00FKPmEr9a3WCVq4NH
 yPxfWW4+DBiRc/iyyU+STtFafbywSjNQD1zkkJvxpZiHWfimjlP85qV660q3YQCsHm2W
 NAHbnvGko0OuecumHd6eks66Zx5+/8nEn+MyJ0eBcwxGFru3Ad4WosNynuoAaZlLAC2p
 xW3G9Kc8bZt5uBxqUM55rm+W/KVvSodMC5FHSFiQDBDy1RFNVWL4pGqDf/dVM4j0sSsG
 WEgw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=jIA64GjN
Subject: [Buildroot] [PATCH v4 8/9] package/kvmtool: bump to current HEAD
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
