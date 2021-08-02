Return-Path: <SRS0=hSOo=MZ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8142C4338F
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 08:15:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 875D761057
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 08:15:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 875D761057
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49ACB83A92;
	Mon,  2 Aug 2021 08:15:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dIAasgPX7C9e; Mon,  2 Aug 2021 08:15:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71CBA82EFC;
	Mon,  2 Aug 2021 08:15:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EF01C1BF681
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 08:15:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DDC8A60792
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 08:15:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zOImngmky7rL for <buildroot@lists.busybox.net>;
 Mon,  2 Aug 2021 08:15:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C118460652
 for <buildroot@buildroot.org>; Mon,  2 Aug 2021 08:15:27 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id c16so2707012lfc.2
 for <buildroot@buildroot.org>; Mon, 02 Aug 2021 01:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iq5+gulbltpuko0zu9QQNwzfiypoMFFP/B0uslvihy8=;
 b=aRQQNXtu0iikKshrRT9MNUOKk00ssy2JQfU4E94kUANpkSywn/RHcX5j7cQqmpVOOH
 COV/qOlH/51znbAXL/853x8VAHmFbttBrmr2J5GP1hXTOfGEz0Eu5aRTutkgQYUiwGC6
 e4jAGGDQPXPqo/RPybEvym7al0FTdQxf5whh7fMR/mM+udUTNjj/nqkwLj4aQYccXiTV
 qtI8e6UpBNcAXZ4QBgoY4y7EIsGD8OEAikKtYROkw4cFHd/GVOBpqEK7FcausGJ8ddyj
 OPWVO0eARSCXk2tzgvVKyX8uIJGzQ+tsPx/UA/oAcVwALWcMxTUEyYttW/h27p4CnWyH
 LhXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iq5+gulbltpuko0zu9QQNwzfiypoMFFP/B0uslvihy8=;
 b=La57FcmdRr4OQe2knFQO/ibYp3b3c536stsS/iKwzyLlEHZH1pnAf8SBx4Bi378MlX
 pXNLzKUmDypZaULA2HGPsvLovGYJ9jRC/kdWvW9Tjp75hBPzPtcWi4fou1Wg/2Rl2oQn
 xrkOTqDKxcDLYFDfY8tNXdL7DLIEXkrKVVeGkycFODEqYU+1Rayf1AEVBO74rEZQK0CL
 jx1tJzrjWlq3MtTonw4AJBVUPqFSRAO9DtWQkO0SmAyX0l4O7soeQBzQBhI/iynUC45m
 1a5hFCVBDVu5UH2du7+TpfEL6WHKFb/+Kt47l6aV49EoGdOIKCZWPCmU5BghJnUaoS+p
 tRsw==
X-Gm-Message-State: AOAM533c9QpFcv06Uea2vwjhE88Rh398aPFJpiyxh8HWoBt13VG1GN3+
 QINke8jJ883dZUsbqnYrBUekDfPxnSDmSg==
X-Google-Smtp-Source: ABdhPJwbh7p/6cZXWIDqLVpSivU+nsfwX63O+A48jwaq2988nchIm4Jm0tdOnFi+ERauWR0Rs5vnCg==
X-Received: by 2002:a05:6512:708:: with SMTP id
 b8mr11658877lfs.13.1627892125674; 
 Mon, 02 Aug 2021 01:15:25 -0700 (PDT)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl.
 [194.187.74.233])
 by smtp.gmail.com with ESMTPSA id d9sm850092ljq.54.2021.08.02.01.15.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 01:15:25 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  2 Aug 2021 10:15:12 +0200
Message-Id: <20210802081512.17342-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/firmware-utils: add package
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKVGhpcyBwYWNrYWdlIHBy
b3ZpZGVzIGEgc2V0IG9mIHRvb2xzIG9yaWdpbmFsbHkgZGV2ZWxvcGVkIGZvciB0aGUKT3Blbldy
dCBwcm9qZWN0LiBUaGV5IGFsbG93IHdvcmtpbmcgd2l0aCB2YXJpb3VzIGZpcm13YXJlIGZvcm1h
dHMgdGhhdAphcmUgcmVxdWlyZWQgZm9yIGZsYXNoaW5nIG5ldyBpbWFnZXMgb24gZW1iZWRkZWQg
ZGV2aWNlcy4KClNpZ25lZC1vZmYtYnk6IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5w
bD4KLS0tCiBERVZFTE9QRVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMyAr
KysKIHBhY2thZ2UvQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKIHBh
Y2thZ2UvQ29uZmlnLmluLmhvc3QgICAgICAgICAgICAgICAgICAgICB8ICAxICsKIHBhY2thZ2Uv
ZmlybXdhcmUtdXRpbHMvQ29uZmlnLmluICAgICAgICAgICB8ICA5ICsrKysrKysrKwogcGFja2Fn
ZS9maXJtd2FyZS11dGlscy9Db25maWcuaW4uaG9zdCAgICAgIHwgIDkgKysrKysrKysrCiBwYWNr
YWdlL2Zpcm13YXJlLXV0aWxzL2Zpcm13YXJlLXV0aWxzLmhhc2ggfCAgMiArKwogcGFja2FnZS9m
aXJtd2FyZS11dGlscy9maXJtd2FyZS11dGlscy5tayAgIHwgMTMgKysrKysrKysrKysrKwogNyBm
aWxlcyBjaGFuZ2VkLCAzOCBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2Fn
ZS9maXJtd2FyZS11dGlscy9Db25maWcuaW4KIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2Zp
cm13YXJlLXV0aWxzL0NvbmZpZy5pbi5ob3N0CiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9m
aXJtd2FyZS11dGlscy9maXJtd2FyZS11dGlscy5oYXNoCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFj
a2FnZS9maXJtd2FyZS11dGlscy9maXJtd2FyZS11dGlscy5tawoKZGlmZiAtLWdpdCBhL0RFVkVM
T1BFUlMgYi9ERVZFTE9QRVJTCmluZGV4IDE1NDdmZjEyM2IuLjIyYjI4NDMwMmQgMTAwNjQ0Ci0t
LSBhL0RFVkVMT1BFUlMKKysrIGIvREVWRUxPUEVSUwpAQCAtMjI1Nyw2ICsyMjU3LDkgQEAgTjoJ
UmFmYWwgU3VzeiA8cmFmYWwuc3VzekBnbWFpbC5jb20+CiBGOglib2FyZC9hdm5ldC9zNmx4OV9t
aWNyb2JvYXJkLwogRjoJY29uZmlncy9zNmx4OV9taWNyb2JvYXJkX2RlZmNvbmZpZwogCitOOglS
YWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+CitGOglwYWNrYWdlL2Zpcm13YXJlLXV0
aWxzLworCiBOOglSYWh1bCBCZWRhcmthciA8cmFodWxiZWRhcmthcjg5QGdtYWlsLmNvbT4KIEY6
CXBhY2thZ2UvY3h4dGVzdC8KIEY6CXBhY2thZ2UvZ2ZsYWdzLwpkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS9Db25maWcuaW4gYi9wYWNrYWdlL0NvbmZpZy5pbgppbmRleCAwNDZjMDRlOTk0Li42NjU3ODEx
YThjIDEwMDY0NAotLS0gYS9wYWNrYWdlL0NvbmZpZy5pbgorKysgYi9wYWNrYWdlL0NvbmZpZy5p
bgpAQCAtMjEyLDYgKzIxMiw3IEBAIG1lbnUgIkZpbGVzeXN0ZW0gYW5kIGZsYXNoIHV0aWxpdGll
cyIKIAlzb3VyY2UgInBhY2thZ2UvZXhmYXQtdXRpbHMvQ29uZmlnLmluIgogCXNvdXJjZSAicGFj
a2FnZS9leGZhdHByb2dzL0NvbmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2UvZjJmcy10b29scy9D
b25maWcuaW4iCisJc291cmNlICJwYWNrYWdlL2Zpcm13YXJlLXV0aWxzL0NvbmZpZy5pbiIKIAlz
b3VyY2UgInBhY2thZ2UvZmxhc2hiZW5jaC9Db25maWcuaW4iCiAJc291cmNlICJwYWNrYWdlL2Zz
Y3J5cHRjdGwvQ29uZmlnLmluIgogCXNvdXJjZSAicGFja2FnZS9mdXNlLW92ZXJsYXlmcy9Db25m
aWcuaW4iCmRpZmYgLS1naXQgYS9wYWNrYWdlL0NvbmZpZy5pbi5ob3N0IGIvcGFja2FnZS9Db25m
aWcuaW4uaG9zdAppbmRleCA4ZDQ0M2VhMjU1Li4wZWM2ZmYwYWFkIDEwMDY0NAotLS0gYS9wYWNr
YWdlL0NvbmZpZy5pbi5ob3N0CisrKyBiL3BhY2thZ2UvQ29uZmlnLmluLmhvc3QKQEAgLTI4LDYg
KzI4LDcgQEAgbWVudSAiSG9zdCB1dGlsaXRpZXMiCiAJc291cmNlICJwYWNrYWdlL2YyZnMtdG9v
bHMvQ29uZmlnLmluLmhvc3QiCiAJc291cmNlICJwYWNrYWdlL2Zha2V0aW1lL0NvbmZpZy5pbi5o
b3N0IgogCXNvdXJjZSAicGFja2FnZS9mYXRjYXQvQ29uZmlnLmluLmhvc3QiCisJc291cmNlICJw
YWNrYWdlL2Zpcm13YXJlLXV0aWxzL0NvbmZpZy5pbi5ob3N0IgogCXNvdXJjZSAicGFja2FnZS9m
d3VwL0NvbmZpZy5pbi5ob3N0IgogCXNvdXJjZSAicGFja2FnZS9nZW5leHQyZnMvQ29uZmlnLmlu
Lmhvc3QiCiAJc291cmNlICJwYWNrYWdlL2dlbmltYWdlL0NvbmZpZy5pbi5ob3N0IgpkaWZmIC0t
Z2l0IGEvcGFja2FnZS9maXJtd2FyZS11dGlscy9Db25maWcuaW4gYi9wYWNrYWdlL2Zpcm13YXJl
LXV0aWxzL0NvbmZpZy5pbgpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi44
ZDRjZDM1OWFlCi0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9maXJtd2FyZS11dGlscy9Db25m
aWcuaW4KQEAgLTAsMCArMSw5IEBACitjb25maWcgQlIyX1BBQ0tBR0VfRklSTVdBUkVfVVRJTFMK
KyAgICAgICAgYm9vbCAiZmlybXdhcmUtdXRpbHMiCisgICAgICAgIGhlbHAKKyAgICAgICAgICBG
aXJtd2FyZSB1dGlscyBhcmUgdG9vbHMgdGhhdCBjYW4gYmUgdXNlZCBmb3IgbWFuYWdpbmcgcGxh
dGZvcm0gLworICAgICAgICAgIGRldmljZSAvIHZlbmRvciBzcGVjaWZpYyBmaXJtd2FyZSBpbWFn
ZXMuIERlcGVuZGluZyBvbiBhIHNwZWNpZmljIHRvb2wKKyAgICAgICAgICBpdCBtYXkgYmUgcG9z
c2libGUgdG8gcmVhZCBpbmZvcm1hdGlvbiwgZXh0cmFjdCBkYXRhLCBtb2RpZnkgb3IgYnVpbGQK
KyAgICAgICAgICBhbiBpbWFnZSBmcm9tIGEgc2NyYXRjaC4KKworICAgICAgICAgIGh0dHBzOi8v
Z2l0Lm9wZW53cnQub3JnLz9wPXByb2plY3QvZmlybXdhcmUtdXRpbHMuZ2l0O2E9c3VtbWFyeQpk
aWZmIC0tZ2l0IGEvcGFja2FnZS9maXJtd2FyZS11dGlscy9Db25maWcuaW4uaG9zdCBiL3BhY2th
Z2UvZmlybXdhcmUtdXRpbHMvQ29uZmlnLmluLmhvc3QKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5k
ZXggMDAwMDAwMDAwMC4uY2IzMzQyNmI2NAotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvZmly
bXdhcmUtdXRpbHMvQ29uZmlnLmluLmhvc3QKQEAgLTAsMCArMSw5IEBACitjb25maWcgQlIyX1BB
Q0tBR0VfSE9TVF9GSVJNV0FSRV9VVElMUworICAgICAgICBib29sICJob3N0IGZpcm13YXJlLXV0
aWxzIgorICAgICAgICBoZWxwCisgICAgICAgICAgRmlybXdhcmUgdXRpbHMgYXJlIHRvb2xzIHRo
YXQgY2FuIGJlIHVzZWQgZm9yIG1hbmFnaW5nIHBsYXRmb3JtIC8KKyAgICAgICAgICBkZXZpY2Ug
LyB2ZW5kb3Igc3BlY2lmaWMgZmlybXdhcmUgaW1hZ2VzLiBEZXBlbmRpbmcgb24gYSBzcGVjaWZp
YyB0b29sCisgICAgICAgICAgaXQgbWF5IGJlIHBvc3NpYmxlIHRvIHJlYWQgaW5mb3JtYXRpb24s
IGV4dHJhY3QgZGF0YSwgbW9kaWZ5IG9yIGJ1aWxkCisgICAgICAgICAgYW4gaW1hZ2UgZnJvbSBh
IHNjcmF0Y2guCisKKyAgICAgICAgICBodHRwczovL2dpdC5vcGVud3J0Lm9yZy8/cD1wcm9qZWN0
L2Zpcm13YXJlLXV0aWxzLmdpdDthPXN1bW1hcnkKZGlmZiAtLWdpdCBhL3BhY2thZ2UvZmlybXdh
cmUtdXRpbHMvZmlybXdhcmUtdXRpbHMuaGFzaCBiL3BhY2thZ2UvZmlybXdhcmUtdXRpbHMvZmly
bXdhcmUtdXRpbHMuaGFzaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi4w
OWQxMDdjYjQ0Ci0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9maXJtd2FyZS11dGlscy9maXJt
d2FyZS11dGlscy5oYXNoCkBAIC0wLDAgKzEsMiBAQAorIyBMb2NhbGx5IGNhbGN1bGF0ZWQKK3No
YTI1NiAgNGYyMTY2MzQzOGNiMTJiNDE5ZDQ5YjhjMWZjYTE3MmEzNzcxODM1YmY2OWU2NWUwNTFm
ZGUxYmY3YWMwZjNjOSAgZmlybXdhcmUtdXRpbHMtYTVjNjVmYTExOTJlMTc0ZTllODk1NjM3YWFm
OTM5NDU5NTlhYTAyOS1icjEudGFyLmd6CmRpZmYgLS1naXQgYS9wYWNrYWdlL2Zpcm13YXJlLXV0
aWxzL2Zpcm13YXJlLXV0aWxzLm1rIGIvcGFja2FnZS9maXJtd2FyZS11dGlscy9maXJtd2FyZS11
dGlscy5tawpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi42MDRiM2QwNjhm
Ci0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9maXJtd2FyZS11dGlscy9maXJtd2FyZS11dGls
cy5tawpAQCAtMCwwICsxLDEzIEBACisjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIworIworIyBmaXJt
d2FyZS11dGlscworIworIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKKworRklSTVdBUkVfVVRJTFNf
VkVSU0lPTiA9IGE1YzY1ZmExMTkyZTE3NGU5ZTg5NTYzN2FhZjkzOTQ1OTU5YWEwMjkKK0ZJUk1X
QVJFX1VUSUxTX1NJVEUgPSBnaXQ6Ly9naXQub3BlbndydC5vcmcvcHJvamVjdC9maXJtd2FyZS11
dGlscy5naXQKK0ZJUk1XQVJFX1VUSUxTX0RFUEVOREVOQ0lFUyA9IGxpYm9wZW5zc2wgemxpYgor
SE9TVF9GSVJNV0FSRV9VVElMU19ERVBFTkRFTkNJRVMgPSBob3N0LWxpYm9wZW5zc2wgaG9zdC16
bGliCisKKyQoZXZhbCAkKGNtYWtlLXBhY2thZ2UpKQorJChldmFsICQoaG9zdC1jbWFrZS1wYWNr
YWdlKSkKLS0gCjIuMjYuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVzeWJveC5uZXQKaHR0
cDovL2xpc3RzLmJ1c3lib3gubmV0L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
