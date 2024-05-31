Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C481EC25B75
	for <buildroot@archiver.kernel.org>; Fri, 31 May 2024 20:31:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 817A040141;
	Fri, 31 May 2024 20:31:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cLTaWN2IunJY; Fri, 31 May 2024 20:31:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B1564184D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B1564184D;
	Fri, 31 May 2024 20:31:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D7A001D577D
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 20:31:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C49534062A
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 20:31:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pQHQ-iSfOMNq for <buildroot@lists.busybox.net>;
 Fri, 31 May 2024 20:31:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=gero.schwaericke@grandcentrix.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2A15440141
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A15440141
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2A15440141
 for <buildroot@buildroot.org>; Fri, 31 May 2024 20:31:17 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-57a2f27090aso2558857a12.0
 for <buildroot@buildroot.org>; Fri, 31 May 2024 13:31:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717187475; x=1717792275;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DMrwihQBWknIcx8zKsYzmU9jjb+5J83J5xCzwnFR7b8=;
 b=kyYOJOBb3In1wLV54TQV6oLAIYHTii3akRacz0SQxLv3r8LWmZMWER1Kzko1uLmI01
 vra9YSu2gbsxh2QPd5KXZ8789G6OZJjC13r+BpXKX0wAZm0oBFPIl+e/PhZ2UbD4sJhx
 cjcBRliFZaU75uo08iyrhEEJpao6MExEx/knn2zDdYMNJze7FXN3ip5Uiv+OTqGi3cej
 MA7iqFJhhPrroMscSBf5sGPZn7SAMOb7IY02i6/rYP1xqdP5r2xWJHNVw5umqIMWDzbT
 90Ik5kmiApDlK2aC4CMB4/b6dF6e0wfR5dKfG4t3a0Hbc9qvL0USCdnBXb0SuCHLPyM6
 3qTg==
X-Gm-Message-State: AOJu0Yw4n6fYQlWfHbds07CmjIJZRsxRa0EKcxe7yR8NHpjpXj8npnXT
 3U4BJnMtjl2Q+3KE3EBIzFcXkf/oFggBcsSAV1iCHO+ybCtL+X8Gi5xQ7fHi/L3fKwP6YEFNpCb
 Jsg494H4hRFQqDDg3Lwbm/qiB8in6m8SetS5OsCfVI4dwYf/VbpDY/DZghk0HRfSHeq52ftLTCv
 nJOS83i213PNma6ROi/ICzBe8RLBoo/apx2wrRPBcSuJXZyOAu1cyv8eWVOdw=
X-Google-Smtp-Source: AGHT+IEnzD0puHEf5y/bKl5yNgv774XxPZAuOvIlJWrRl6X2dPNSFobod7KKOV/ur6g2fVRuJPKbfw==
X-Received: by 2002:a17:906:410a:b0:a68:917e:8cda with SMTP id
 a640c23a62f3a-a68917e8d12mr128914366b.9.1717187475097; 
 Fri, 31 May 2024 13:31:15 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8109:8abb:b200:cd4c:73d7:5418:7922])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a67ea67b674sm121120566b.122.2024.05.31.13.31.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 May 2024 13:31:14 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 31 May 2024 22:31:00 +0200
Message-ID: <20240531203110.2395842-1-gero.schwaericke@grandcentrix.net>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grandcentrix.net; s=google; t=1717187475; x=1717792275; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DMrwihQBWknIcx8zKsYzmU9jjb+5J83J5xCzwnFR7b8=;
 b=eRzpwVsQFFogAIws3sunzCkfzk/IdOQlpC1ZErPMiaCs1hwH8Z8jaLWJB2aGBAp68a
 a0LmQTd5W0OgHBrzfqcj3YLG8CxE3tOuivyccf49WxM2rOyVo2hhccyfxvRlBrtAuAiO
 n8WfkJlrNQh6s+3uHVXQzfXIkHnAAfnCldV4GvP6WwfB5q7oDlNvf70KWjAhbdxSa7c5
 RVhaE0BfqV82ShPLHpDfL0hSjE56veIntKgs7oTaXLUVeed4nCZy+WyiHkMSQyLEQPZR
 5Lz0FYFEloGE3GJHHd7zMLg6SbwKc/HSJpsluZQ9WjMsJd2IxcVbN1dr84JajwLLvQER
 k1dA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=grandcentrix.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grandcentrix.net header.i=@grandcentrix.net
 header.a=rsa-sha256 header.s=google header.b=eRzpwVsQ
Subject: [Buildroot] [PATCH] {linux, linux-headers}: bump 4.19.x, 5.4.x,
 5.10.x, 5.15.x, 6.1.x, 6.6.x, 6.8.x series
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
From: =?utf-8?q?Gero_Schw=C3=A4ricke_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Gero=20Schw=C3=A4ricke?=
 <gero.schwaericke@grandcentrix.net>
Cc: =?UTF-8?q?Gero=20Schw=C3=A4ricke?= <gero.schwaericke@grandcentrix.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogR2VybyBTY2h3w6RyaWNrZSA8Z2Vyby5zY2h3YWVyaWNrZUBncmFuZGNl
bnRyaXgubmV0PgotLS0KIGxpbnV4L0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICAgICB8ICAy
ICstCiBsaW51eC9saW51eC5oYXNoICAgICAgICAgICAgICAgICAgICAgfCAxNCArKysrKysrLS0t
LS0tLQogcGFja2FnZS9saW51eC1oZWFkZXJzL0NvbmZpZy5pbi5ob3N0IHwgMTQgKysrKysrKy0t
LS0tLS0KIDMgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvbGludXgvQ29uZmlnLmluIGIvbGludXgvQ29uZmlnLmluCmluZGV4IGQz
ZDRjNDI5MTAuLjE5NGEyNGYzOTEgMTAwNjQ0Ci0tLSBhL2xpbnV4L0NvbmZpZy5pbgorKysgYi9s
aW51eC9Db25maWcuaW4KQEAgLTEzNCw3ICsxMzQsNyBAQCBjb25maWcgQlIyX0xJTlVYX0tFUk5F
TF9DVVNUT01fUkVQT19HSVRfU1VCTU9EVUxFUwogCiBjb25maWcgQlIyX0xJTlVYX0tFUk5FTF9W
RVJTSU9OCiAJc3RyaW5nCi0JZGVmYXVsdCAiNi44LjkiIGlmIEJSMl9MSU5VWF9LRVJORUxfTEFU
RVNUX1ZFUlNJT04KKwlkZWZhdWx0ICI2LjguMTIiIGlmIEJSMl9MSU5VWF9LRVJORUxfTEFURVNU
X1ZFUlNJT04KIAlkZWZhdWx0ICI1LjEwLjE2Mi1jaXAyNCIgaWYgQlIyX0xJTlVYX0tFUk5FTF9M
QVRFU1RfQ0lQX1ZFUlNJT04KIAlkZWZhdWx0ICI1LjEwLjE2Mi1jaXAyNC1ydDEwIiBpZiBCUjJf
TElOVVhfS0VSTkVMX0xBVEVTVF9DSVBfUlRfVkVSU0lPTgogCWRlZmF1bHQgQlIyX0xJTlVYX0tF
Uk5FTF9DVVNUT01fVkVSU0lPTl9WQUxVRSBcCmRpZmYgLS1naXQgYS9saW51eC9saW51eC5oYXNo
IGIvbGludXgvbGludXguaGFzaAppbmRleCBhZjgyMTQ4ZTgwLi5iOTcyNTU3ZmMwIDEwMDY0NAot
LS0gYS9saW51eC9saW51eC5oYXNoCisrKyBiL2xpbnV4L2xpbnV4Lmhhc2gKQEAgLTEsMTMgKzEs
MTMgQEAKICMgRnJvbSBodHRwczovL3d3dy5rZXJuZWwub3JnL3B1Yi9saW51eC9rZXJuZWwvdjYu
eC9zaGEyNTZzdW1zLmFzYwotc2hhMjU2ICBmOTA1ZjEyMzhlYTdhOGU4NTMxNGJhY2YyODMzMDJl
ODA5NzAwNjAxMGQyNWZjZWE3MjZkMGRlMGVhNWJjOWI2ICBsaW51eC02LjguOS50YXIueHoKLXNo
YTI1NiAgYjY2YTViODYzYjBmODY2OTQ0OGI3NGNhODNiZDY0MWE4NTZmMTY0YjI5OTU2ZTUzOWJi
Y2I1ZmRlZWFiOWNjNiAgbGludXgtNi42LjMwLnRhci54egotc2hhMjU2ICA4M2EzZDcyZTc2NGZj
ZWRhMmMxZmM2OGE0ZWE2YjkxMjUzYTI4ZGE1NmE2ODhhMmI2MTc3NmIwZDE5Nzg4ZTFkICBsaW51
eC02LjEuOTAudGFyLnh6CitzaGEyNTYgIDE5YjMxOTU2ZDIyOWI1YjljYTU2NzFmYTFjNzQzMjAx
Nzk2ODJhM2Q4ZDAwZmM4Njc5NDExNGIyMWRhODYwMzkgIGxpbnV4LTYuOC4xMi50YXIueHoKK3No
YTI1NiAgYWFhODI0ZWFmMDdmNjE5MTFkMjJiNzVmZjA5MGE0MDNjM2RkMGJkNzNlMjM5MzNlMGJi
YThiNTk3MTQzNmNlMSAgbGludXgtNi42LjMyLnRhci54egorc2hhMjU2ICA5MDE5ZjQyN2JmZGM5
Y2VkNWJjOTU0ZDc2MGQzN2FjMDhjMGNkZmZiNDVhZDI4MDg3ZmM0NWE3M2U2NDMzNmM5ICBsaW51
eC02LjEuOTIudGFyLnh6CiAjIEZyb20gaHR0cHM6Ly93d3cua2VybmVsLm9yZy9wdWIvbGludXgv
a2VybmVsL3Y1Lngvc2hhMjU2c3Vtcy5hc2MKLXNoYTI1NiAgZjkwNzFjODNhNGZkOGI4MGFmMDI2
YjQ4Y2ZjMTg2OWJmYTI1ODgzZjkxNDhiOTJiNWRjMWUxZTFlMjZkZDVjNiAgbGludXgtNS4xNS4x
NTgudGFyLnh6Ci1zaGEyNTYgIGUzMTA1ODhjNGIyM2YwOTU5NjE0ZTYwZjAwN2FmYzIwZTliMWE4
ZjI5NmQ2ODJiMDQxZmExMjlmOTZmYmUxNTEgIGxpbnV4LTUuMTAuMjE2LnRhci54egotc2hhMjU2
ICBkYWQyYjA2ODk0NmYwY2EwMDI2MTMwZDdhYjE3NjAxZDUwNzRkOTBiMzgxMzc5YzQ0NzkzMTRk
NGVkZjQzMDRjICBsaW51eC01LjQuMjc1LnRhci54egorc2hhMjU2ICBmNDFlNzE4ZTMzYjg4ZjI2
OWE2YjZhNzY1M2U1ZTk4MjRjNGJhNTQxZjZmZmU1YmYyNmVjYzM3YzU0MGExYjA1ICBsaW51eC01
LjE1LjE2MC50YXIueHoKK3NoYTI1NiAgOWMzNmIyNDNlOGMzZWMxZDU5NjMzNjY2MThmMzM2NzEw
Yjg0MzQwYmY5NWJlMjAzN2IyNmM0NTIzOTJjYjJkNiAgbGludXgtNS4xMC4yMTgudGFyLnh6Citz
aGEyNTYgIDdlMWY1YjI4NTg4ZTQ5ZGRmZDE4ZTc3NzI0NzZlNGU4YjUyYmRjOWMzZTE5YmVhZmNi
YjdjMTAzZTZjMDFmNTEgIGxpbnV4LTUuNC4yNzcudGFyLnh6CiAjIEZyb20gaHR0cHM6Ly93d3cu
a2VybmVsLm9yZy9wdWIvbGludXgva2VybmVsL3Y0Lngvc2hhMjU2c3Vtcy5hc2MKLXNoYTI1NiAg
YTgxNDVlMmVjZjg0MzdiNmQwNjQwMGMzMzU4YTU5NWM0N2E3NDQ0M2IxNjQ4OTBjZjEyYTA3ZDg3
MjI1MzljOCAgbGludXgtNC4xOS4zMTMudGFyLnh6CitzaGEyNTYgIDZjNWU0ZDNjODdmZWFkYmZk
YjlmN2QyZTQ2ZjNmMTIwYjAwMjg2YmEzODA0OTFjNTk1NjcwOGUwYjk0MjMyYzggIGxpbnV4LTQu
MTkuMzE1LnRhci54egogIyBMb2NhbGx5IGNvbXB1dGVkCiBzaGEyNTYgIGZiMGVkYzNjMThlNDdk
MmI2OTc0Y2IwODgwYTBhZmI1YzNmYTA4ZjUwZWU4N2RmZGYyNDM0OTQwNWVhNWY4YWUgIGxpbnV4
LWNpcC01LjEwLjE2Mi1jaXAyNC50YXIuZ3oKIHNoYTI1NiAgYjU1MzkyNDNmMTg3ZTNkNDc4ZDc2
ZDQ0YWUxM2FhYjgzOTUyYzk0Yjg4NWFkODg5ZGY2ZmE5OTk3ZTE2YTQ0MSAgbGludXgtY2lwLTUu
MTAuMTYyLWNpcDI0LXJ0MTAudGFyLmd6CmRpZmYgLS1naXQgYS9wYWNrYWdlL2xpbnV4LWhlYWRl
cnMvQ29uZmlnLmluLmhvc3QgYi9wYWNrYWdlL2xpbnV4LWhlYWRlcnMvQ29uZmlnLmluLmhvc3QK
aW5kZXggZDhmNDhlZDBiNy4uNDgxMDE3ODNiOSAxMDA2NDQKLS0tIGEvcGFja2FnZS9saW51eC1o
ZWFkZXJzL0NvbmZpZy5pbi5ob3N0CisrKyBiL3BhY2thZ2UvbGludXgtaGVhZGVycy9Db25maWcu
aW4uaG9zdApAQCAtNDE1LDEzICs0MTUsMTMgQEAgZW5kY2hvaWNlCiAKIGNvbmZpZyBCUjJfREVG
QVVMVF9LRVJORUxfSEVBREVSUwogCXN0cmluZwotCWRlZmF1bHQgIjQuMTkuMzEzIglpZiBCUjJf
S0VSTkVMX0hFQURFUlNfNF8xOQotCWRlZmF1bHQgIjUuNC4yNzUiCWlmIEJSMl9LRVJORUxfSEVB
REVSU181XzQKLQlkZWZhdWx0ICI1LjEwLjIxNiIJaWYgQlIyX0tFUk5FTF9IRUFERVJTXzVfMTAK
LQlkZWZhdWx0ICI1LjE1LjE1OCIJaWYgQlIyX0tFUk5FTF9IRUFERVJTXzVfMTUKLQlkZWZhdWx0
ICI2LjEuOTAiCWlmIEJSMl9LRVJORUxfSEVBREVSU182XzEKLQlkZWZhdWx0ICI2LjYuMzAiCWlm
IEJSMl9LRVJORUxfSEVBREVSU182XzYKLQlkZWZhdWx0ICI2LjguOSIJCWlmIEJSMl9LRVJORUxf
SEVBREVSU182XzgKKwlkZWZhdWx0ICI0LjE5LjMxNSIJaWYgQlIyX0tFUk5FTF9IRUFERVJTXzRf
MTkKKwlkZWZhdWx0ICI1LjQuMjc3IglpZiBCUjJfS0VSTkVMX0hFQURFUlNfNV80CisJZGVmYXVs
dCAiNS4xMC4yMTgiCWlmIEJSMl9LRVJORUxfSEVBREVSU181XzEwCisJZGVmYXVsdCAiNS4xNS4x
NjAiCWlmIEJSMl9LRVJORUxfSEVBREVSU181XzE1CisJZGVmYXVsdCAiNi4xLjkyIglpZiBCUjJf
S0VSTkVMX0hFQURFUlNfNl8xCisJZGVmYXVsdCAiNi42LjMyIglpZiBCUjJfS0VSTkVMX0hFQURF
UlNfNl82CisJZGVmYXVsdCAiNi44LjEyIglpZiBCUjJfS0VSTkVMX0hFQURFUlNfNl84CiAJZGVm
YXVsdCBCUjJfREVGQVVMVF9LRVJORUxfVkVSU0lPTiBpZiBCUjJfS0VSTkVMX0hFQURFUlNfVkVS
U0lPTgogCWRlZmF1bHQgImN1c3RvbSIJaWYgQlIyX0tFUk5FTF9IRUFERVJTX0NVU1RPTV9UQVJC
QUxMCiAJZGVmYXVsdCBCUjJfS0VSTkVMX0hFQURFUlNfQ1VTVE9NX1JFUE9fVkVSU0lPTiBcCi0t
IAoyLjQ1LjEKCgotLSAKCgoK4oCT4oCT4oCTCgoKZ3JhbmRjZW50cml4IEdtYkggfCBBIFZvZGFm
b25lIENvbXBhbnnCoMK3wqBIb2x6bWFya3QgMcKgwrfCoDUwNjc2IAoqQ29sb2duZSrCoHzCoFBo
b2VuaXhzZWVzdHJhc3NlIDE4wqDCt8KgNDQyNjMgKkRvcnRtdW5kKsKgwrfCoEdlcm1hbnkKfMKg
aW4gCjxodHRwczovL3d3dy5saW5rZWRpbi5jb20vY29tcGFueS9ncmFuZGNlbnRyaXg+IHwgcGhv
bmU6ICs0OS0yMjEtNjc3LTg2MC0wIAp8wqBlbWFpbDogaGVsbG9AZ3JhbmRjZW50cml4Lm5ldCA8
bWFpbHRvOmhlbGxvQGdyYW5kY2VudHJpeC5uZXQ+CgoKZ3JhbmRjZW50cml4IGNhcmVzIGFib3V0
wqBwcml2YWN5IAo8aHR0cHM6Ly9ncmFuZGNlbnRyaXgubmV0L2RlL3BhZ2VzL3ByaXZhY3ltYWls
Lz4KCkFtdHNnZXJpY2h0IEvDtmxuIHwgSFJCIMKgCjcwMTE5IHwgR2VzY2jDpGZ0c2bDvGhyZXI6
IE0uIEtyw7ZtZXIswqAgUi4gSMOkbmVsIHwgVVN0Li1JZE5yLjogREUyNjYzMzM5NjkKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
