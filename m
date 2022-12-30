Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C4C1C4332F
	for <buildroot@archiver.kernel.org>; Fri, 30 Dec 2022 03:25:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 651CD60AE1;
	Fri, 30 Dec 2022 03:25:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 651CD60AE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eWhNNefJB7Gr; Fri, 30 Dec 2022 03:25:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9EC9460808;
	Fri, 30 Dec 2022 03:25:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EC9460808
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C39BB1BF59C
 for <buildroot@lists.busybox.net>; Fri, 30 Dec 2022 03:25:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 977B340872
 for <buildroot@lists.busybox.net>; Fri, 30 Dec 2022 03:25:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 977B340872
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5LUjOjxmk7xV for <buildroot@lists.busybox.net>;
 Fri, 30 Dec 2022 03:25:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D44D64081F
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D44D64081F
 for <buildroot@buildroot.org>; Fri, 30 Dec 2022 03:25:23 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id 17so20754906pll.0
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 19:25:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mwOH4VSJaV7erUtOYhoeWitB1QPH6nQFhQpYuyN6VtY=;
 b=77tLSKjgQLTEAI8W5x6bLXv2CQ9e/xy9hhTEgq5CsE37y3J/h4iiEbMmLTkeDn63BW
 TvbIt8s+AqL9vtX+ar2s5YLmbfLXOjB90YRu3B3rZa8qBCzYVfx7IlzvMdbvafZuuuLZ
 nsCzvNv9YZYI8mjWhTc9fl8cZ6brzR2pDBzHeQ5j3lwru0adLCHf9FIsXGNtlYUGs4N5
 ODEu+Rej6bF5RHasBmVknb0Wnz/6YfNdbqsWTMa795pHYcl2noJCRn+0lkLfsK2RZRMi
 5ZWYB4/Hj4WMER7JJyHje8n2jyuVHLD8r3Cn6Jxq9Dzm5WBk5tDbqFLrfKb9bmdlHPWS
 ByLQ==
X-Gm-Message-State: AFqh2kpr5L33xg1Wel2jxmfnZsxyGqA0sNZWQF3Ucf0VhRKwc3Baz3r9
 5mOKzguVIxl6R2Q8Y+LvllwFBxkOTIE=
X-Google-Smtp-Source: AMrXdXvrNTjM/yTA9OMGQHhaFVDKpOK/lL+BdfzIIdag67EUYNw1pEZl6RWXtbm1gV9q4m3w1YGI+w==
X-Received: by 2002:a17:902:e9c2:b0:192:ad61:d179 with SMTP id
 2-20020a170902e9c200b00192ad61d179mr768802plk.11.1672370722956; 
 Thu, 29 Dec 2022 19:25:22 -0800 (PST)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 p4-20020a170902e74400b00176dc67df44sm13683780plf.132.2022.12.29.19.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 19:25:22 -0800 (PST)
To: buildroot@buildroot.org
Date: Thu, 29 Dec 2022 19:25:20 -0800
Message-Id: <20221230032520.1066282-1-christian@paral.in>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/rng-tools: fix build failure:
 undefined jent_notime_ctx
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
aW9uIDMuNC4xOgoKVGhlIHVwZGF0ZSByZXF1aXJlcyBzZXR0aW5nIHRoZSBtYWNybyBKRU5UX0NP
TkZfRU5BQkxFX0lOVEVSTkFMX1RJTUVSLCBvdGhlcndpc2UKdGhlIGJ1aWxkIGNhbiBmYWlsIHdp
dGggdGhlIGZvbGxvd2luZyB0eXBlIG9mIGVycm9yOgoKaml0dGVyZW50cm9weS1saWJyYXJ5IHJl
cXVpcmVzIHNldHRpbmcgdGhlIG1hY3JvIEpFTlRfQ09ORl9FTkFCTEVfSU5URVJOQUxfVElNRVIK
dG8gZGVmaW5lIGplbnRfbm90aW1lX2N0eC4gSWYgbm90IHNldCwgdGhlIGJ1aWxkIGZhaWxzIHdp
dGggdGhlIGZvbGxvd2luZyBlcnJvcjoKCnJuZ2Rfaml0dGVyLmM6IEluIGZ1bmN0aW9uIOKAmHJu
Z2Rfbm90aW1lX3N0b3DigJk6CnJuZ2Rfaml0dGVyLmM6OTc6MzI6IGVycm9yOiBpbnZhbGlkIHVz
ZSBvZiB1bmRlZmluZWQgdHlwZSDigJhzdHJ1Y3QgamVudF9ub3RpbWVfY3R44oCZCiAgIDk3IHwg
ICAgICAgICBwdGhyZWFkX2pvaW4odGhyZWFkX2N0eC0+bm90aW1lX3RocmVhZF9pZCwgTlVMTCk7
CgpSZWZlcmVuY2U6Cmh0dHBzOi8vd3d3Lm1haWwtYXJjaGl2ZS5jb20vb3BlbmVtYmVkZGVkLWNv
cmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tc2cxNjA1MzEuaHRtbAoKU2lnbmVkLW9mZi1ieTog
Q2hyaXN0aWFuIFN0ZXdhcnQgPGNocmlzdGlhbkBwYXJhbC5pbj4KLS0tCiAuLi5hYmxlLUpFTlRf
Q09ORl9FTkFCTEVfSU5URVJOQUxfVElNRVIucGF0Y2ggfCAzOSArKysrKysrKysrKysrKysrKysr
CiAxIGZpbGUgY2hhbmdlZCwgMzkgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHBh
Y2thZ2Uvcm5nLXRvb2xzLzAwMDQtaml0dGVyZW50cm9weS1lbmFibGUtSkVOVF9DT05GX0VOQUJM
RV9JTlRFUk5BTF9USU1FUi5wYXRjaAoKZGlmZiAtLWdpdCBhL3BhY2thZ2Uvcm5nLXRvb2xzLzAw
MDQtaml0dGVyZW50cm9weS1lbmFibGUtSkVOVF9DT05GX0VOQUJMRV9JTlRFUk5BTF9USU1FUi5w
YXRjaCBiL3BhY2thZ2Uvcm5nLXRvb2xzLzAwMDQtaml0dGVyZW50cm9weS1lbmFibGUtSkVOVF9D
T05GX0VOQUJMRV9JTlRFUk5BTF9USU1FUi5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRl
eCAwMDAwMDAwMDAwLi4wOGY5M2IwM2ZhCi0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9ybmct
dG9vbHMvMDAwNC1qaXR0ZXJlbnRyb3B5LWVuYWJsZS1KRU5UX0NPTkZfRU5BQkxFX0lOVEVSTkFM
X1RJTUVSLnBhdGNoCkBAIC0wLDAgKzEsMzkgQEAKK0Zyb20gNDlmMjcwYmFmN2ZmZjI4NTVlMzli
MjA4NDEyMWQ3NjVkMmE5OTkwYyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IENocmlz
dGlhbiBTdGV3YXJ0IDxjaHJpc3RpYW5AcGFyYWwuaW4+CitEYXRlOiBUaHUsIDI5IERlYyAyMDIy
IDE5OjIxOjA0IC0wODAwCitTdWJqZWN0OiBbUEFUQ0hdIGppdHRlcmVudHJvcHk6IGVuYWJsZSBK
RU5UX0NPTkZfRU5BQkxFX0lOVEVSTkFMX1RJTUVSCisgZGVmaW5pdGlvbgorTUlNRS1WZXJzaW9u
OiAxLjAKK0NvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOAorQ29udGVudC1U
cmFuc2Zlci1FbmNvZGluZzogOGJpdAorCitqaXR0ZXJlbnRyb3B5LWxpYnJhcnkgcmVxdWlyZXMg
c2V0dGluZyB0aGUgbWFjcm8gSkVOVF9DT05GX0VOQUJMRV9JTlRFUk5BTF9USU1FUgordG8gZGVm
aW5lIGplbnRfbm90aW1lX2N0eC4gSWYgbm90IHNldCwgdGhlIGJ1aWxkIGZhaWxzIHdpdGggdGhl
IGZvbGxvd2luZyBlcnJvcjoKKworcm5nZF9qaXR0ZXIuYzogSW4gZnVuY3Rpb24g4oCYcm5nZF9u
b3RpbWVfc3RvcOKAmToKK3JuZ2Rfaml0dGVyLmM6OTc6MzI6IGVycm9yOiBpbnZhbGlkIHVzZSBv
ZiB1bmRlZmluZWQgdHlwZSDigJhzdHJ1Y3QgamVudF9ub3RpbWVfY3R44oCZCisgICA5NyB8ICAg
ICAgICAgcHRocmVhZF9qb2luKHRocmVhZF9jdHgtPm5vdGltZV90aHJlYWRfaWQsIE5VTEwpOwor
CitEZWZpbmUgSkVOVF9DT05GX0VOQUJMRV9JTlRFUk5BTF9USU1FUiBpZiBqaXR0ZXJlbnRyb3B5
IGlzIGVuYWJsZWQuCisKK1NpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBTdGV3YXJ0IDxjaHJpc3Rp
YW5AcGFyYWwuaW4+CistLS0KKyBjb25maWd1cmUuYWMgfCAyICstCisgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCisKK2RpZmYgLS1naXQgYS9jb25maWd1cmUu
YWMgYi9jb25maWd1cmUuYWMKK2luZGV4IDZlYzNjM2EuLjI1MTM2ZjIgMTAwNjQ0CistLS0gYS9j
b25maWd1cmUuYWMKKysrKyBiL2NvbmZpZ3VyZS5hYworQEAgLTg3LDcgKzg3LDcgQEAgQUNfQVJH
X0VOQUJMRShqaXR0ZXJlbnRyb3B5LAorIAlbRGlzYWJsZSBqaXR0ZXJlbnRyb3B5IHNvdXJjZSwg
b3Igc3BlY2lmeSBpdHMgbG9jYXRpb25dKSwKKyAJW2lmIFsgdGVzdCAtZCAkZW5hYmxlX2ppdHRl
cmVudHJvcHkgXTsgdGhlbgorIAkJZXhwb3J0IExERkxBR1MrPS1MJGVuYWJsZV9qaXR0ZXJlbnRy
b3B5OworLQkJZXhwb3J0IENGTEFHUys9IiAtSSRlbmFibGVfaml0dGVyZW50cm9weSI7CisrCQll
eHBvcnQgQ0ZMQUdTKz0iIC1JJGVuYWJsZV9qaXR0ZXJlbnRyb3B5IC1ESkVOVF9DT05GX0VOQUJM
RV9JTlRFUk5BTF9USU1FUiI7CisgCWZpXSxbXSkKKyAKKyBBU19JRigKKy0tIAorMi4zOS4wCisK
LS0gCjIuMzkuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
