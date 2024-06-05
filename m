Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 880B7C27C52
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 08:48:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B26F40708;
	Wed,  5 Jun 2024 08:48:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PhFJzjbK6Sga; Wed,  5 Jun 2024 08:48:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF46540729
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF46540729;
	Wed,  5 Jun 2024 08:48:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8E9731BF5E6
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 08:48:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 88B1B40729
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 08:48:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rDRn9miyUyAS for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 08:48:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0ADCD40708
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0ADCD40708
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0ADCD40708
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 08:48:41 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-52b7e693b8aso621157e87.1
 for <buildroot@buildroot.org>; Wed, 05 Jun 2024 01:48:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717577320; x=1718182120;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t589apYqdmd3hGpVUn9uwwinYjJtb0xXjXua8dIABSg=;
 b=cR70NQl1B2/ge0M9rQA0bAp+afSFZaQ3xFVG+AoCE31gx5CbqV41THDWt4XUU8fi8x
 IKFKb4XKbXODEXHM1k+EMqfUcXUmqz0hpm6vtVLWsYxD3NgRNK74cwDwYEKngIrY32Xx
 kdzfVGdNMF649wZNDD3s3xrUMspLmcCtEghbtA7YTCgz4lzvy022ObP36FEQb288E5MZ
 CWL6hRYDUICWFklDOAlKjLam/2nm3DtlTMfW9ptF/IgLH/+djC1+zMt1+VhIXcp/JZOh
 MLcTrBwnc0Nzpmv39x3HdVczNlwNnS4IJ8jL9lxLHaBYiLO0FwY5em4wsG0k6t1xA68T
 E6MQ==
X-Gm-Message-State: AOJu0Yw/5pQmuXfEerSW4Cbyu3CTPwQII8fDtIwxxHdAG0zIM5sszgF0
 pxAuqXo1wu+T9f17ATLH0ObfFglddqBjWirFxbc/vYI3PMf5Bg9a8c9htA==
X-Google-Smtp-Source: AGHT+IGvgHmQqMFJPRa3K3RZt6tZBZMW5zpdhoBXzMn1kFg4p+Rbdz8ssjQ+X3dJER4HKPHO4N0Asg==
X-Received: by 2002:a05:6512:1383:b0:52b:905e:1500 with SMTP id
 2adb3069b0e04-52ba229b477mr1504631e87.22.1717577319331; 
 Wed, 05 Jun 2024 01:48:39 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ea91d20cdfsm17107441fa.134.2024.06.05.01.48.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jun 2024 01:48:38 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
X-Google-Original-From: Roy Kollen Svendsen
 <roy.kollen.svendsen@akersolutions.com>
To: buildroot@buildroot.org
Date: Wed,  5 Jun 2024 10:48:26 +0200
Message-ID: <20240605084827.3155371-1-roy.kollen.svendsen@akersolutions.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717577320; x=1718182120; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=t589apYqdmd3hGpVUn9uwwinYjJtb0xXjXua8dIABSg=;
 b=eBR+B/K4ZLjXZt3cXguSSoB8B5MJCOdQhZJb0Dp1Hk3I2QPWV4zcT9gui+l96GU4wh
 ub9NWTyk4uGAaAbYzx906+tRmaHUMwJ/bYtKhngYoh3vjdg8kMk3pcbB8q74gp0S5sIg
 HZZryfYvdU9l2dWnbBx9L5AhNUJBzn+orrrgBTJhB7Msu5ZNslgW7tXRsIOT6KAhC0ig
 fR5goBxeYBJg8TxgJBmqlLNpUxw0Gp5AipeYOzboEBPQqsUITY6ajtFiJuj7omGW229/
 dTRlipeOkdIR9+a1W6G0LPEFlh6M1aSFbObW5trxVKNadlO3b51Nx9NEkL6ciUig6m0t
 gtuw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=eBR+B/K4
Subject: [Buildroot] [PATCH 2024.02.x] package/libffi: Fix host build failure
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
Cc: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SG9zdCBidWlsZCBmYWlscyBvbiB1cGRhdGVkIEFyY2ggTGludXggZGVza3RvcC4KCk15IGN1cnJl
bnQgL3Vzci9iaW4vZ2NjIHZlcnNpb24gaXMgMTQuMS4xIDIwMjQwNTIyLCB3aGVyZQppbXBsaWNp
dC1mdW5jdGlvbi1kZWNsYXJhdGlvbiBjYXVzZSBidWlsZCB0byBmYWlsOgoKMjAyNC0wNi0wNVQw
NzowMzoyMCBsaWJ0b29sOiBjb21waWxlOiAgL2hvbWUvcm95L2h5bWF0ZWsvY29ubmV4aS10b3Vj
aHBhbmVsLWZpcm13YXJlL214eGYxL291dHB1dC9ob3N0L2Jpbi9jY2FjaGUgL3Vzci9iaW4vZ2Nj
IC1ESEFWRV9DT05GSUdfSCAtSS4gLUkuLiAtSS4gLUkuLi9pbmNsdWRlIC1JaW5jbHVkZSAtSS4u
L3NyYyAtSS9ob21lL3JveS9oeW1hdGVrL2Nvbm5leGktdG91Y2hwYW5lbC1maXJtd2FyZS9teHhm
MS9vdXRwdXQvaG9zdC9pbmNsdWRlIC1XYWxsIC1PMiAtSS9ob21lL3JveS9oeW1hdGVrL2Nvbm5l
eGktdG91Y2hwYW5lbC1maXJtd2FyZS9teHhmMS9vdXRwdXQvaG9zdC9pbmNsdWRlIC1mZXhjZXB0
aW9ucyAtYyAuLi9zcmMvdHJhbXAuYyAgLWZQSUMgLURQSUMgLW8gc3JjLy5saWJzL3RyYW1wLm8K
MjAyNC0wNi0wNVQwNzowMzoyMCAuLi9zcmMvdHJhbXAuYzogSW4gZnVuY3Rpb24g4oCYZmZpX3Ry
YW1wX2dldF90ZW1wX2ZpbGXigJk6CjIwMjQtMDYtMDVUMDc6MDM6MjAgLi4vc3JjL3RyYW1wLmM6
MjYyOjIyOiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g4oCYb3Blbl90
ZW1wX2V4ZWNfZmlsZeKAmSBbLVdpbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KMjAyNC0w
Ni0wNVQwNzowMzoyMCAyNjIgfCAgIHRyYW1wX2dsb2JhbHMuZmQgPSBvcGVuX3RlbXBfZXhlY19m
aWxlICgpOwoyMDI0LTA2LTA1VDA3OjAzOjIwIHwgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+
fn5+fn5+fn5+fn5+fgoKUGF0Y2ggZnJvbSBtYXN0ZXIgd2FzIGFkZGVkIHRvIGZpeCBidWlsZC4K
ClNpZ25lZC1vZmYtYnk6IFJveSBLb2xsZW4gU3ZlbmRzZW4gPHJveS5rb2xsZW4uc3ZlbmRzZW5A
YWtlcnNvbHV0aW9ucy5jb20+Ci0tLQptYXN0ZXIgYW5kIG5leHQgYXJlIG5vdCBhZmZlY3RlZCBh
cyB0aGUgdmVyc2lvbiB3YXMgYnVtcGVkCgogLi4ud2FyZC1kZWNsYXJlLW9wZW5fdGVtcF9leGVj
X2ZpbGUtNzY0LnBhdGNoIHwgNDkgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQs
IDQ5IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2xpYmZmaS8wMDA0
LUZvcndhcmQtZGVjbGFyZS1vcGVuX3RlbXBfZXhlY19maWxlLTc2NC5wYXRjaAoKZGlmZiAtLWdp
dCBhL3BhY2thZ2UvbGliZmZpLzAwMDQtRm9yd2FyZC1kZWNsYXJlLW9wZW5fdGVtcF9leGVjX2Zp
bGUtNzY0LnBhdGNoIGIvcGFja2FnZS9saWJmZmkvMDAwNC1Gb3J3YXJkLWRlY2xhcmUtb3Blbl90
ZW1wX2V4ZWNfZmlsZS03NjQucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAw
MDAwMC4uMzQxYTJlNGU0MwotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvbGliZmZpLzAwMDQt
Rm9yd2FyZC1kZWNsYXJlLW9wZW5fdGVtcF9leGVjX2ZpbGUtNzY0LnBhdGNoCkBAIC0wLDAgKzEs
NDkgQEAKK0Zyb20gY2UwNzdlNTU2NTM2NjE3MWFhMWI0NDM4NzQ5YjA5MjJmY2U4ODdhNCBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IHNlcmdlLXNhbnMtcGFpbGxlIDxzZXJnZS5ndWVs
dG9uQHRlbGVjb20tYnJldGFnbmUuZXU+CitEYXRlOiBUaHUsIDIgRmViIDIwMjMgMTQ6NDY6Mjkg
KzAwMDAKK1N1YmplY3Q6IFtQQVRDSF0gRm9yd2FyZCBkZWNsYXJlIG9wZW5fdGVtcF9leGVjX2Zp
bGUgKCM3NjQpCisKK0l0J3MgZGVmaW5lZCBpbiBjbG9zdXJlcy5jIGFuZCB1c2VkIGluIHRyYW1w
LmMuCitBbHNvIGRlY2xhcmUgaXQgYXMgYW4gaGlkZGVuIHN5bWJvbCwgYXMgaXQgc2hvdWxkIGJl
LgorCitDby1hdXRob3JlZC1ieTogc2VyZ2Utc2Fucy1wYWlsbGUgPHNndWVsdG9uQG1vemlsbGEu
Y29tPgorVXBzdHJlYW06IGh0dHBzOi8vZ2l0aHViLmNvbS9saWJmZmkvbGliZmZpL3B1bGwvNzY0
CitTaWduZWQtb2ZmLWJ5OiBSb3kgS29sbGVuIFN2ZW5kc2VuIDxyb3kua29sbGVuLnN2ZW5kc2Vu
QGFrZXJzb2x1dGlvbnMuY29tPgorLS0tCisgaW5jbHVkZS9mZmlfY29tbW9uLmggfCA0ICsrKysK
KyBzcmMvdHJhbXAuYyAgICAgICAgICB8IDQgKysrKworIDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNl
cnRpb25zKCspCisKK2RpZmYgLS1naXQgYS9pbmNsdWRlL2ZmaV9jb21tb24uaCBiL2luY2x1ZGUv
ZmZpX2NvbW1vbi5oCitpbmRleCAyYmQzMWIwLi5jNTNhNzk0IDEwMDY0NAorLS0tIGEvaW5jbHVk
ZS9mZmlfY29tbW9uLmgKKysrKyBiL2luY2x1ZGUvZmZpX2NvbW1vbi5oCitAQCAtMTI4LDYgKzEy
OCwxMCBAQCB2b2lkICpmZmlfZGF0YV90b19jb2RlX3BvaW50ZXIgKHZvaWQgKmRhdGEpIEZGSV9I
SURERU47CisgICAgc3RhdGljIHRyYW1wb2xpbmUuICovCisgaW50IGZmaV90cmFtcF9pc19wcmVz
ZW50ICh2b2lkICpjbG9zdXJlKSBGRklfSElEREVOOworIAorKy8qIFJldHVybiBhIGZpbGUgZGVz
Y3JpcHRvciBvZiBhIHRlbXBvcmFyeSB6ZXJvLXNpemVkIGZpbGUgaW4gYQorKyAgIHdyaXRhYmxl
IGFuZCBleGVjdXRhYmxlIGZpbGVzeXN0ZW0uICovCisraW50IG9wZW5fdGVtcF9leGVjX2ZpbGUo
dm9pZCkgRkZJX0hJRERFTjsKKysKKyAvKiBFeHRlbmRlZCBjaWYsIHVzZWQgaW4gY2FsbGJhY2sg
ZnJvbSBhc3NlbWJseSByb3V0aW5lICovCisgdHlwZWRlZiBzdHJ1Y3QKKyB7CitkaWZmIC0tZ2l0
IGEvc3JjL3RyYW1wLmMgYi9zcmMvdHJhbXAuYworaW5kZXggN2UwMDViMC4uNWYxOWI1NSAxMDA2
NDQKKy0tLSBhL3NyYy90cmFtcC5jCisrKysgYi9zcmMvdHJhbXAuYworQEAgLTM5LDYgKzM5LDEw
IEBACisgI2lmZGVmIF9fbGludXhfXworICNkZWZpbmUgX0dOVV9TT1VSQ0UgMQorICNlbmRpZgor
KworKyNpbmNsdWRlIDxmZmkuaD4KKysjaW5jbHVkZSA8ZmZpX2NvbW1vbi5oPgorKworICNpbmNs
dWRlIDxzdGRpby5oPgorICNpbmNsdWRlIDx1bmlzdGQuaD4KKyAjaW5jbHVkZSA8c3RkbGliLmg+
CistLSAKKzIuNDUuMQorCi0tIAoyLjQ1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
