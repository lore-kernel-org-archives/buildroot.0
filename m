Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B661FC4332F
	for <buildroot@archiver.kernel.org>; Fri, 30 Dec 2022 03:46:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C15640256;
	Fri, 30 Dec 2022 03:46:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C15640256
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S-EhdX9bpusA; Fri, 30 Dec 2022 03:46:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E32F40267;
	Fri, 30 Dec 2022 03:46:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E32F40267
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5D9891BF59C
 for <buildroot@lists.busybox.net>; Fri, 30 Dec 2022 03:46:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 469A7401D2
 for <buildroot@lists.busybox.net>; Fri, 30 Dec 2022 03:46:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 469A7401D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z_LBp4sbZI8D for <buildroot@lists.busybox.net>;
 Fri, 30 Dec 2022 03:46:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58EFA400FC
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 58EFA400FC
 for <buildroot@buildroot.org>; Fri, 30 Dec 2022 03:46:23 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 o1-20020a17090a678100b00219cf69e5f0so24752074pjj.2
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 19:46:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TmntzS21NmqDggbmLhnX7EYykQnQMj66QbnZddf7V1g=;
 b=8ARgy44JpCGGmOJT4OEvn+JbS0K2cIfxxQFo0KS9zmUwCL5XrVJbcyMaUCoSk9P10b
 iKlghLNu6JxzR8IKbMiXSOBNYrGYPYQwTk398vxYS3OUi4m+FxryU3XDEiNofIY+dD7U
 arMMTQ53NMI2z3AuwL7b7AgbAJ3zYO/1AONJVXQWJqMCv3nRDfNrut6SdJCWko46sgnr
 N3ZsL6uU/BQiQzihe5yI499Ht08uvboyGnRjErHLW/q9zTeCLk/KlPpd6TyhSSrz6dqu
 pQNRledkEJPk4vqJIq26HWHJECd2tvAGdM7jxmqTL6pniwpREBKSfLlbrSVsype3h7CX
 Q5yA==
X-Gm-Message-State: AFqh2kq8ZOmTbtkfLyEmUOxuMTTWYi2c3Wxi4uZAaEAdARsEbCA1eS4u
 aC+HKKPt0hzFtdgxG7rmhn0E+HSa7aI=
X-Google-Smtp-Source: AMrXdXtTwFwRRJL+uaxXZTbc4Q59W4sb1b564+HX9q80drvuiXGxs98GkgKJkKN1/6nxigaZDBoigA==
X-Received: by 2002:a05:6a20:3c8f:b0:ad:97cc:e948 with SMTP id
 b15-20020a056a203c8f00b000ad97cce948mr47226751pzj.45.1672371982302; 
 Thu, 29 Dec 2022 19:46:22 -0800 (PST)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 p8-20020a170902780800b00186c3afb49esm13681934pll.209.2022.12.29.19.46.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 19:46:21 -0800 (PST)
To: buildroot@buildroot.org
Date: Thu, 29 Dec 2022 19:45:40 -0800
Message-Id: <20221230034540.1073086-1-christian@paral.in>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/1] package/rng-tools: cherry-pick fix for
 jitterentropy build failure
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2luY2UgY29tbWl0IGE4ODA3ZCB1cGRhdGVkIGppdHRlcmVudHJvcHktbGlicmFyeSB0byB2ZXJz
aW9uIDMuNC4xLgoKaml0dGVyZW50cm9weS1saWJyYXJ5IHJlcXVpcmVzIHNldHRpbmcgdGhlIG1h
Y3JvIEpFTlRfQ09ORl9FTkFCTEVfSU5URVJOQUxfVElNRVIKdG8gZGVmaW5lIGplbnRfbm90aW1l
X2N0eC4gSWYgbm90IHNldCwgdGhlIGJ1aWxkIGZhaWxzIHdpdGggdGhlIGZvbGxvd2luZyBlcnJv
cjoKCnJuZ2Rfaml0dGVyLmM6IEluIGZ1bmN0aW9uIOKAmHJuZ2Rfbm90aW1lX3N0b3DigJk6CnJu
Z2Rfaml0dGVyLmM6OTc6MzI6IGVycm9yOiBpbnZhbGlkIHVzZSBvZiB1bmRlZmluZWQgdHlwZSDi
gJhzdHJ1Y3QgamVudF9ub3RpbWVfY3R44oCZCiAgIDk3IHwgICAgICAgICBwdGhyZWFkX2pvaW4o
dGhyZWFkX2N0eC0+bm90aW1lX3RocmVhZF9pZCwgTlVMTCk7CgpSZWZlcmVuY2U6Cmh0dHBzOi8v
d3d3Lm1haWwtYXJjaGl2ZS5jb20vb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZy9tc2cxNjA1MzEuaHRtbAoKVGhlcmUgaGFzIG5vdCBiZWVuIGEgcmVsZWFzZSB3aXRoIHRo
ZSBmaXggeWV0LgoKQ2hlcnJ5LXBpY2sgdGhlIHVwc3RyZWFtIGNvbW1pdCBhcyBhIHBhdGNoOgoK
aHR0cHM6Ly9naXRodWIuY29tL25ob3JtYW4vcm5nLXRvb2xzL2NvbW1pdC81N2JlNmQ0YzkwZTc4
ZWE5YWQwMzZhM2E2ZTliMDk4MjJlZDRkMjE5CgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gU3Rl
d2FydCA8Y2hyaXN0aWFuQHBhcmFsLmluPgoKLS0tCgp2MSAtPiB2MjoKCiAtIGNoZXJyeS1waWNr
ZWQgdGhlIHVwc3RyZWFtIGNvbW1pdCBpbnN0ZWFkIG9mIGNyZWF0aW5nIG91ciBvd24KClNpZ25l
ZC1vZmYtYnk6IENocmlzdGlhbiBTdGV3YXJ0IDxjaHJpc3RpYW5AcGFyYWwuaW4+Ci0tLQogLi4u
LWppdHRlcmVudHJvcHktaW50ZXJuYWwtdGltZXJzLWRldGVjLnBhdGNoIHwgNTYgKysrKysrKysr
KysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDU2IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBwYWNrYWdlL3JuZy10b29scy8wMDA0LWNvbmZpZ3VyZS5hYy1maXgtaml0dGVyZW50
cm9weS1pbnRlcm5hbC10aW1lcnMtZGV0ZWMucGF0Y2gKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3Ju
Zy10b29scy8wMDA0LWNvbmZpZ3VyZS5hYy1maXgtaml0dGVyZW50cm9weS1pbnRlcm5hbC10aW1l
cnMtZGV0ZWMucGF0Y2ggYi9wYWNrYWdlL3JuZy10b29scy8wMDA0LWNvbmZpZ3VyZS5hYy1maXgt
aml0dGVyZW50cm9weS1pbnRlcm5hbC10aW1lcnMtZGV0ZWMucGF0Y2gKbmV3IGZpbGUgbW9kZSAx
MDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uYmEwMmRkNDE1NgotLS0gL2Rldi9udWxsCisrKyBiL3Bh
Y2thZ2Uvcm5nLXRvb2xzLzAwMDQtY29uZmlndXJlLmFjLWZpeC1qaXR0ZXJlbnRyb3B5LWludGVy
bmFsLXRpbWVycy1kZXRlYy5wYXRjaApAQCAtMCwwICsxLDU2IEBACitGcm9tIDY5MzQ3NWE5OTg1
MDNkOWM3YTRhOWEwZDY0NjI4OTU3Y2YzMDY1MDQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitG
cm9tOiBWbGFkaXMgRHJvbm92IDx2ZHJvbm92QHJlZGhhdC5jb20+CitEYXRlOiBXZWQsIDIxIFNl
cCAyMDIyIDE2OjIzOjA0ICswMjAwCitTdWJqZWN0OiBbUEFUQ0hdIGNvbmZpZ3VyZS5hYzogZml4
IGppdHRlcmVudHJvcHkgaW50ZXJuYWwgdGltZXJzIGRldGVjdGlvbgorTUlNRS1WZXJzaW9uOiAx
LjAKK0NvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOAorQ29udGVudC1UcmFu
c2Zlci1FbmNvZGluZzogOGJpdAorCitVc2UgdmlzaWJpbGl0eSBvZiBqZW50X25vdGltZV9zZXR0
aWNrKCkgdG8gZGV0ZWN0IGlmIGppdHRlcmVudHJvcHkKK2xpYnJhcnkgaXMgYnVpbHQgd2l0aCBp
bnRlcm5hbCB0aW1lcnMuIFRoZSBjb2RlIHJlbGF0ZWQgaXM6CisKKyAgWyBzcmMvaml0dGVyZW50
cm9weS10aW1lci5oIF0KKyAgI2lmZGVmIEpFTlRfQ09ORl9FTkFCTEVfSU5URVJOQUxfVElNRVIK
KyAgaW50IGplbnRfbm90aW1lX3NldHRpY2soc3RydWN0IHJhbmRfZGF0YSAqZWMpOworICAjZWxz
ZSAvKiBKRU5UX0NPTkZfRU5BQkxFX0lOVEVSTkFMX1RJTUVSICovCisgIHN0YXRpYyBpbmxpbmUg
aW50IGplbnRfbm90aW1lX3NldHRpY2soc3RydWN0IHJhbmRfZGF0YSAqZWMpCisgIHsgKHZvaWQp
ZWM7IHJldHVybiAwOyB9CisgICNlbmRpZiAvKiBKRU5UX0NPTkZfRU5BQkxFX0lOVEVSTkFMX1RJ
TUVSICovCisKKy0tLQorCitVcHN0cmVhbTogaHR0cHM6Ly9naXRodWIuY29tL25ob3JtYW4vcm5n
LXRvb2xzL2NvbW1pdC81N2JlNmQ0YzkwZTc4ZWE5YWQwMzZhM2E2ZTliMDk4MjJlZDRkMjE5CisK
K2ppdHRlcmVudHJvcHktbGlicmFyeSByZXF1aXJlcyBzZXR0aW5nIHRoZSBtYWNybyBKRU5UX0NP
TkZfRU5BQkxFX0lOVEVSTkFMX1RJTUVSCit0byBkZWZpbmUgamVudF9ub3RpbWVfY3R4LiBJZiBu
b3Qgc2V0LCB0aGUgYnVpbGQgZmFpbHMgd2l0aCB0aGUgZm9sbG93aW5nIGVycm9yOgorCitybmdk
X2ppdHRlci5jOiBJbiBmdW5jdGlvbiDigJhybmdkX25vdGltZV9zdG9w4oCZOgorcm5nZF9qaXR0
ZXIuYzo5NzozMjogZXJyb3I6IGludmFsaWQgdXNlIG9mIHVuZGVmaW5lZCB0eXBlIOKAmHN0cnVj
dCBqZW50X25vdGltZV9jdHjigJkKKyAgIDk3IHwgICAgICAgICBwdGhyZWFkX2pvaW4odGhyZWFk
X2N0eC0+bm90aW1lX3RocmVhZF9pZCwgTlVMTCk7CistLS0KKyBjb25maWd1cmUuYWMgfCA5ICsr
KysrKy0tLQorIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
CisKK2RpZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMKK2luZGV4IDZlYzNj
M2EuLjk1Njg1ZGIgMTAwNjQ0CistLS0gYS9jb25maWd1cmUuYWMKKysrKyBiL2NvbmZpZ3VyZS5h
YworQEAgLTk3LDkgKzk3LDEyIEBAIEFTX0lGKAorIAkJQUNfU0VBUkNIX0xJQlMoamVudF92ZXJz
aW9uLGppdHRlcmVudHJvcHksCisgCQkJCVtBTV9DT05ESVRJT05BTChbSklUVEVSXSwgW3RydWVd
KQorIAkJCQlBQ19ERUZJTkUoW0hBVkVfSklUVEVSXSwxLFtFbmFibGUgSklUVEVSXSkKKy0JCQkJ
QUNfQ0hFQ0tfTElCKGppdHRlcmVudHJvcHksIGplbnRfbm90aW1lX2luaXQsCistCQkJCVtdLAor
LQkJCQlbQUNfREVGSU5FKFtIQVZFX0pJVFRFUl9OT1RJTUVdLDEsIFtFbmFibGUgSklUVEVSX05P
VElNRV0pXSwtbHB0aHJlYWQpXSwKKysJCQkJQUNfQ0hFQ0tfTElCKGppdHRlcmVudHJvcHksIGpl
bnRfbm90aW1lX3NldHRpY2ssCisrCQkJCVsKKysJCQkJCUFDX0RFRklORShbSEFWRV9KSVRURVJf
Tk9USU1FXSwxLFtFbmFibGUgSklUVEVSX05PVElNRV0pCisrCQkJCQlBQ19ERUZJTkUoW0pFTlRf
Q09ORl9FTkFCTEVfSU5URVJOQUxfVElNRVJdLDEsW0VuYWJsZSBKRU5UX0NPTkZfRU5BQkxFX0lO
VEVSTkFMX1RJTUVSXSkKKysJCQkJXSwKKysJCQkJW10sLWxwdGhyZWFkKV0sCisgCQkJCUFDX01T
R19OT1RJQ0UoW05vIEppdHRlcmVudHJvcHkgbGlicmFyeSBmb3VuZF0pLC1scHRocmVhZCkKKyAJ
XSwgW0FDX01TR19OT1RJQ0UoW0Rpc2FibGluZyBKSVRURVIgZW50cm9weSBzb3VyY2VdKV0KKyAp
CistLSAKKzIuMzkuMAorCi0tIAoyLjM5LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
