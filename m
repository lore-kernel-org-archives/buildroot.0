Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0240C04FFE
	for <buildroot@archiver.kernel.org>; Fri, 26 Apr 2024 07:15:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87998605F6;
	Fri, 26 Apr 2024 07:15:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t_0O4fQ3DoSP; Fri, 26 Apr 2024 07:14:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D72D60D4F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D72D60D4F;
	Fri, 26 Apr 2024 07:14:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 076FD1BF292
 for <buildroot@lists.busybox.net>; Fri, 26 Apr 2024 07:14:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F408C82670
 for <buildroot@lists.busybox.net>; Fri, 26 Apr 2024 07:14:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ihz5F68rKfIP for <buildroot@lists.busybox.net>;
 Fri, 26 Apr 2024 07:14:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com;
 envelope-from=sairon@sairon.cz; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9DB5982640
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DB5982640
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9DB5982640
 for <buildroot@buildroot.org>; Fri, 26 Apr 2024 07:14:55 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-56e6a1edecfso2778762a12.1
 for <buildroot@buildroot.org>; Fri, 26 Apr 2024 00:14:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714115693; x=1714720493;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ua/UtldF46zbhuGL8THw8YT/yE/xGAMt/0s5YHIzJo4=;
 b=XTU49qbEUemGrLaAhYP/HDEiv0lUHRYkfTF/V0PWlB1Ubh61dWQfGhrJ9ER1gcTJr/
 omTb/8lEV3g4GeSjetwus1HQmFaV+D3A6Nst5FJJvCzdpkkautnLf9/64Lt/H7v79GaB
 wneo7qVq1VpAWdlrNy+D/vxc5hdiYHj1SQRmngfQ5t4z99WOu6rAtMHCLLYL+qpSgzIp
 En12lD6N2QfeC/Ht853qjyRj00JgHGWvDLRMMw6Vmwk6wyH7UiPI0hsIK1tCsN5cZ06K
 kGwSJesRGBQoa0Vu98lb8lHftasmUdPPMbaAZEIe9/F+RreQi5V0MhHwiWKeKzUAkUdY
 xUOA==
X-Gm-Message-State: AOJu0YwakcOw6k+RYfhbEM9deK/kHBbmQxUijVoMigcpeCt8/qo5eTXn
 lRXJ5yKmu9qPnf7qFK19v3oWDHSmL11RCLkMWVtNt2rQpD6QTvy83h7A7246CsjbuL8QSD7qXMT
 /oX0=
X-Google-Smtp-Source: AGHT+IHshZPV72JYteEk3iHKHe7gJKZDyttMHPvluVCQPUjOvCj+AXJIGMpSWxptS8Qq1JU73yGOWg==
X-Received: by 2002:a50:9987:0:b0:56e:2daf:1ee6 with SMTP id
 m7-20020a509987000000b0056e2daf1ee6mr1223118edb.16.1714115692940; 
 Fri, 26 Apr 2024 00:14:52 -0700 (PDT)
Received: from krabice.lan (ip-89-103-66-201.bb.vodafone.cz. [89.103.66.201])
 by smtp.gmail.com with ESMTPSA id
 u15-20020aa7d0cf000000b005704b18ed2fsm9696838edo.83.2024.04.26.00.14.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Apr 2024 00:14:52 -0700 (PDT)
From: =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
To: buildroot@buildroot.org
Date: Fri, 26 Apr 2024 09:14:43 +0200
Message-Id: <20240426071443.2565112-1-sairon@sairon.cz>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sairon.cz; s=google; t=1714115693; x=1714720493; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ua/UtldF46zbhuGL8THw8YT/yE/xGAMt/0s5YHIzJo4=;
 b=dqB5KovnwATqRRz6pZXR1nTKwh+aJAxHybKUkED0RPZe3V5kuCvPts4D1Q7YC2nWZ2
 YpPVULOSOQc1IK1Vpif4uPf6I6/PtqO67N62FULtY1Al6I4qGXHRuwYjGHsOw0aeQhIi
 tCQHZghCLDiVwWCQvxzEp2Am+G3zYxNl4f+cFuQdlyRdAknqWxH7ePtr/+dwdVCHt2oF
 o8Utr/IKfCOxl7YiZ+Q8hXHbPkFTEwnTKn266MMrCln8S2NuLhaktiGDrWq1+Af84rnK
 pspnTR+CMtIWJgfBzMzNP3rbg533/9m8NGMLU4CAS8zqwcEf0W3C9wCbvSDtlEoYnFWo
 Jy2g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=sairon.cz
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=sairon.cz header.i=@sairon.cz header.a=rsa-sha256
 header.s=google header.b=dqB5Kovn
Subject: [Buildroot] [PATCH] package/{bluez5_utils,
 bluez5_utils-headers}: bump to version 5.75
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
Cc: =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>,
 Grzegorz Blach <grzegorz@blach.pl>, Marcin Bis <marcin@bis.org.pl>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QnVtcCB0byB2ZXJzaW9uIDUuNzUgY29udGFpbmluZyB2YXJpb3VzIGZpeGVzLiBBZGRlZCBhIHBh
dGNoIHRvIGZpeApidWlsZCB3aXRoIGRpc2FibGVkIENVUFMgKGZhaWxpbmcgc2luY2UgNS43Mywg
d2FpdGluZyB0byBiZSByZXZpZXdlZCBhbmQKbWVyZ2VkKSBhbmQgZW5hYmxlZCBhdXRvcmVjb25m
IHdoaWNoIGlzIG5lZWRlZCBmb3IgdGhhdCBwYXRjaC4KCkNoYW5nZWxvZzoKaHR0cHM6Ly9naXQu
a2VybmVsLm9yZy9wdWIvc2NtL2JsdWV0b290aC9ibHVlei5naXQvdHJlZS9DaGFuZ2VMb2cKClNp
Z25lZC1vZmYtYnk6IEphbiDEjGVybcOhayA8c2Fpcm9uQHNhaXJvbi5jej4KLS0tCiAuLi4vYmx1
ZXo1X3V0aWxzLWhlYWRlcnMubWsgICAgICAgICAgICAgICAgICAgfCAgMiArLQogLi4uLzAwMDEt
Y29uZmlndXJlLmFjLUZpeC1kaXNhYmxlLWN1cHMucGF0Y2ggIHwgNDEgKysrKysrKysrKysrKysr
KysrKwogcGFja2FnZS9ibHVlejVfdXRpbHMvYmx1ZXo1X3V0aWxzLmhhc2ggICAgICAgIHwgIDIg
Ky0KIHBhY2thZ2UvYmx1ZXo1X3V0aWxzL2JsdWV6NV91dGlscy5tayAgICAgICAgICB8ICA0ICst
CiA0IGZpbGVzIGNoYW5nZWQsIDQ2IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCiBjcmVh
dGUgbW9kZSAxMDA2NDQgcGFja2FnZS9ibHVlejVfdXRpbHMvMDAwMS1jb25maWd1cmUuYWMtRml4
LWRpc2FibGUtY3Vwcy5wYXRjaAoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvYmx1ZXo1X3V0aWxzLWhl
YWRlcnMvYmx1ZXo1X3V0aWxzLWhlYWRlcnMubWsgYi9wYWNrYWdlL2JsdWV6NV91dGlscy1oZWFk
ZXJzL2JsdWV6NV91dGlscy1oZWFkZXJzLm1rCmluZGV4IDc0YjM4NWUxMTAuLjJmMDdhN2I0MjIg
MTAwNjQ0Ci0tLSBhL3BhY2thZ2UvYmx1ZXo1X3V0aWxzLWhlYWRlcnMvYmx1ZXo1X3V0aWxzLWhl
YWRlcnMubWsKKysrIGIvcGFja2FnZS9ibHVlejVfdXRpbHMtaGVhZGVycy9ibHVlejVfdXRpbHMt
aGVhZGVycy5tawpAQCAtNSw3ICs1LDcgQEAKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKICMg
S2VlcCB0aGUgdmVyc2lvbiBhbmQgcGF0Y2hlcyBpbiBzeW5jIHdpdGggYmx1ZXo1X3V0aWxzCi1C
TFVFWjVfVVRJTFNfSEVBREVSU19WRVJTSU9OID0gNS43MgorQkxVRVo1X1VUSUxTX0hFQURFUlNf
VkVSU0lPTiA9IDUuNzUKIEJMVUVaNV9VVElMU19IRUFERVJTX1NPVVJDRSA9IGJsdWV6LSQoQkxV
RVo1X1VUSUxTX1ZFUlNJT04pLnRhci54egogQkxVRVo1X1VUSUxTX0hFQURFUlNfU0lURSA9ICQo
QlIyX0tFUk5FTF9NSVJST1IpL2xpbnV4L2JsdWV0b290aAogQkxVRVo1X1VUSUxTX0hFQURFUlNf
RExfU1VCRElSID0gYmx1ZXo1X3V0aWxzCmRpZmYgLS1naXQgYS9wYWNrYWdlL2JsdWV6NV91dGls
cy8wMDAxLWNvbmZpZ3VyZS5hYy1GaXgtZGlzYWJsZS1jdXBzLnBhdGNoIGIvcGFja2FnZS9ibHVl
ejVfdXRpbHMvMDAwMS1jb25maWd1cmUuYWMtRml4LWRpc2FibGUtY3Vwcy5wYXRjaApuZXcgZmls
ZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi4yYzZjNDZmNmZkCi0tLSAvZGV2L251bGwK
KysrIGIvcGFja2FnZS9ibHVlejVfdXRpbHMvMDAwMS1jb25maWd1cmUuYWMtRml4LWRpc2FibGUt
Y3Vwcy5wYXRjaApAQCAtMCwwICsxLDQxIEBACitGcm9tIGNiMGRlNDliYzZmOGE2YmY4ZjAxYTI0
NTk5YjQ5OWFhNGJmMTgwMzIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBMYXJzIFdl
bmRsZXIgPHBvbHlub21pYWwtY0BnbXguZGU+CitEYXRlOiBUdWUsIDE2IEFwciAyMDI0IDA3OjI2
OjA0ICswMjAwCitTdWJqZWN0OiBbUEFUQ0hdIGNvbmZpZ3VyZS5hYzogRml4IC0tZGlzYWJsZS1j
dXBzCitNSU1FLVZlcnNpb246IDEuMAorQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0
PVVURi04CitDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0CisKK29yIGVsc2Ugd2UgZ2V0
OgorICBjb25maWd1cmU6IGVycm9yOiBjb25kaXRpb25hbCAiQ1VQU19TRVJWRVJCSU4iIHdhcyBu
ZXZlciBkZWZpbmVkLgorICBVc3VhbGx5IHRoaXMgbWVhbnMgdGhlIG1hY3JvIHdhcyBvbmx5IGlu
dm9rZWQgY29uZGl0aW9uYWxseS4KKworRml4ZXM6IGh0dHBzOi8vZ2l0aHViLmNvbS9ibHVlei9i
bHVlei9pc3N1ZXMvNzczCisKK1Vwc3RyZWFtOiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3Jn
L3Byb2plY3QvYmx1ZXRvb3RoL2xpc3QvP3Nlcmllcz04NDQ5MTAKK1NpZ25lZC1vZmYtYnk6IEph
biDEjGVybcOhayA8c2Fpcm9uQHNhaXJvbi5jej4KKy0tLQorIGNvbmZpZ3VyZS5hYyB8IDggKysr
Ky0tLS0KKyAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQor
CitkaWZmIC0tZ2l0IGEvY29uZmlndXJlLmFjIGIvY29uZmlndXJlLmFjCitpbmRleCA5ZGVhNzBk
Li5kYmJhNzU5IDEwMDY0NAorLS0tIGEvY29uZmlndXJlLmFjCisrKysgYi9jb25maWd1cmUuYWMK
K0BAIC0yNDksMTIgKzI0OSwxMiBAQCBBTV9DT05ESVRJT05BTChDVVBTLCB0ZXN0ICIke2VuYWJs
ZV9jdXBzfSIgIT0gIm5vIikKKyBpZiAodGVzdCAiJHtlbmFibGVfY3Vwc30iICE9ICJubyIpOyB0
aGVuCisgCUFDX01TR19DSEVDS0lORyhbY3VwcyBkaXJlY3RvcnldKQorIAljdXBzX3NlcnZlcmJp
bj1gJFBLR19DT05GSUcgY3VwcyAtLXZhcmlhYmxlPWN1cHNfc2VydmVyYmluYAorLQlBTV9DT05E
SVRJT05BTChDVVBTX1NFUlZFUkJJTiwgdGVzdCAiJHtjdXBzX3NlcnZlcmJpbn0iICE9ICIiKQor
LQlpZiAodGVzdCAiJHtjdXBzX3NlcnZlcmJpbn0iICE9ICIiKTsgdGhlbgorLQkJQUNfU1VCU1Qo
Q1VQU19TRVJWRVJCSU4sICR7Y3Vwc19zZXJ2ZXJiaW59KQorLQlmaQorIAlBQ19NU0dfUkVTVUxU
KFske2N1cHNfc2VydmVyYmlufV0pCisgZmkKKytBTV9DT05ESVRJT05BTChDVVBTX1NFUlZFUkJJ
TiwgdGVzdCAiJHtjdXBzX3NlcnZlcmJpbn0iICE9ICIiKQorK0FTX0lGKFt0ZXN0ICIke2N1cHNf
c2VydmVyYmlufSIgIT0gIiJdLFsKKysJQUNfU1VCU1QoQ1VQU19TRVJWRVJCSU4sICR7Y3Vwc19z
ZXJ2ZXJiaW59KQorK10pCisgCisgQUNfQVJHX0VOQUJMRShtZXNoLCBBU19IRUxQX1NUUklORyhb
LS1lbmFibGUtbWVzaF0sCisgCQlbZW5hYmxlIE1lc2ggcHJvZmlsZSBzdXBwb3J0XSksIFtlbmFi
bGVfbWVzaD0ke2VuYWJsZXZhbH1dKQpkaWZmIC0tZ2l0IGEvcGFja2FnZS9ibHVlejVfdXRpbHMv
Ymx1ZXo1X3V0aWxzLmhhc2ggYi9wYWNrYWdlL2JsdWV6NV91dGlscy9ibHVlejVfdXRpbHMuaGFz
aAppbmRleCA0NjY4MGNmM2M5Li45Y2MxOWY4N2RkIDEwMDY0NAotLS0gYS9wYWNrYWdlL2JsdWV6
NV91dGlscy9ibHVlejVfdXRpbHMuaGFzaAorKysgYi9wYWNrYWdlL2JsdWV6NV91dGlscy9ibHVl
ejVfdXRpbHMuaGFzaApAQCAtMSw1ICsxLDUgQEAKICMgRnJvbSBodHRwczovL3d3dy5rZXJuZWwu
b3JnL3B1Yi9saW51eC9ibHVldG9vdGgvc2hhMjU2c3Vtcy5hc2M6Ci1zaGEyNTYgIDQ5OWQ3ZmEz
NDVhOTk2YzFiYjY1MGY1YzY3NDllMWQ5MjkxMTFmYTZlY2UwYmUwZTk4Njg3ZmVlNjEyNDUzNmUg
IGJsdWV6LTUuNzIudGFyLnh6CitzaGEyNTYgIDk4OGNiM2M0NTUxZjZlM2E2Njc3MDhhNTc4ZjVj
YTlmOTNmYzg5NjUwOGY5OGYwODcwOWJlNGY4YWIwMzNjMmYgIGJsdWV6LTUuNzUudGFyLnh6CiAj
IExvY2FsbHkgY29tcHV0ZWQKIHNoYTI1NiAgYjQ5OWVkZGViZGEwNWE4ODU5ZTMyYjgyMGE2NDU3
N2Q5MWYxZGUyYjUyZWZhMmExNTc1YTJjYjQwMDBiYzI1OSAgQ09QWUlORwogc2hhMjU2ICBlYzYw
Yjk5MzgzNWUyYzZiNzllNmQ5MjI2MzQ1ZjRlNjE0ZTY4NmViNTdkYzEzYjY0MjBjMTVhMzNhODk5
NmU1ICBDT1BZSU5HLkxJQgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9ibHVlejVfdXRpbHMvYmx1ZXo1
X3V0aWxzLm1rIGIvcGFja2FnZS9ibHVlejVfdXRpbHMvYmx1ZXo1X3V0aWxzLm1rCmluZGV4IDNj
Y2I2Mzk0OGMuLjI2ZjBmNGFmZDQgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvYmx1ZXo1X3V0aWxzL2Js
dWV6NV91dGlscy5taworKysgYi9wYWNrYWdlL2JsdWV6NV91dGlscy9ibHVlejVfdXRpbHMubWsK
QEAgLTUsOSArNSwxMSBAQAogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIAogIyBLZWVwIHRoZSB2
ZXJzaW9uIGFuZCBwYXRjaGVzIGluIHN5bmMgd2l0aCBibHVlejVfdXRpbHMtaGVhZGVycwotQkxV
RVo1X1VUSUxTX1ZFUlNJT04gPSA1LjcyCitCTFVFWjVfVVRJTFNfVkVSU0lPTiA9IDUuNzUKIEJM
VUVaNV9VVElMU19TT1VSQ0UgPSBibHVlei0kKEJMVUVaNV9VVElMU19WRVJTSU9OKS50YXIueHoK
IEJMVUVaNV9VVElMU19TSVRFID0gJChCUjJfS0VSTkVMX01JUlJPUikvbGludXgvYmx1ZXRvb3Ro
CisjIDAwMDEtY29uZmlndXJlLmFjLUZpeC1kaXNhYmxlLWN1cHMucGF0Y2gKK0JMVUVaNV9VVElM
U19BVVRPUkVDT05GID0gWUVTCiBCTFVFWjVfVVRJTFNfSU5TVEFMTF9TVEFHSU5HID0gWUVTCiBC
TFVFWjVfVVRJTFNfTElDRU5TRSA9IEdQTC0yLjArLCBMR1BMLTIuMSsKIEJMVUVaNV9VVElMU19M
SUNFTlNFX0ZJTEVTID0gQ09QWUlORyBDT1BZSU5HLkxJQgotLSAKMi4zNC4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
