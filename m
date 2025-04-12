Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B43C369AE
	for <buildroot@archiver.kernel.org>; Sat, 12 Apr 2025 14:35:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59A16818D0;
	Sat, 12 Apr 2025 14:35:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tmtRricKf4SZ; Sat, 12 Apr 2025 14:35:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E97B81882
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E97B81882;
	Sat, 12 Apr 2025 14:35:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CAD22138
 for <buildroot@buildroot.org>; Sat, 12 Apr 2025 14:35:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B0CC041432
 for <buildroot@buildroot.org>; Sat, 12 Apr 2025 14:35:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 599XsAXqJAFJ for <buildroot@buildroot.org>;
 Sat, 12 Apr 2025 14:35:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=gael.portay+rtone@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9010840CF2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9010840CF2
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9010840CF2
 for <buildroot@buildroot.org>; Sat, 12 Apr 2025 14:35:31 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43d4ff56136so4622265e9.3
 for <buildroot@buildroot.org>; Sat, 12 Apr 2025 07:35:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744468529; x=1745073329;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5PjYnINbsPpCDsvO2yA3bAmM8NLn28I36wIwcNpuu38=;
 b=T2+6XwAEWdMKl78zOVydhm/i3KBO5MwzaL/Y15cBMS/557fxHVW/wkCkt2rg/rTlkU
 6Fn1CIu8NK9Hk1qS1Wps6/Bd4JoG5GPd1PqYpG8xEfL0uFnP699/51UfeAXDA7Fsd3YR
 qB35G5a2PLxk3aEt8fYbApGgkuefR59RhZ/d8xKckuw6KynoAGnj0uAVd556HtHsTpre
 07wpPV5uP9Gfd7fdlHjpi3OYrPXQwRedFqmmKl+gn1mzptRbEk60ykcmjQIdnGFeoOl4
 SF6Z04484WAd1wzI4cXXhUXMTnw8XA3c8M2pJac1IQUILA88F2FrRGe3DpBTCDW+JpEn
 sM/g==
X-Gm-Message-State: AOJu0YzA7DJdnjzfKS8/czll3wz/9eNb2ElwHbKgE3N1kaYbgOBuukEf
 7IDet4qJFQUdFIJRPFtDMLoCa9oHJ9iB7Jfng8rgwEfATTy/wscGa3NrFY2G
X-Gm-Gg: ASbGnctelCX0XvEMDy3mpQwo31QQXg4nvBpjcDCR8rf3/SQXkyaLcODndgbXkG36zuv
 tAjwO5vSthDt2UZNiUA+CStXyrkpqhmRfCX6vToKvsSuuEjZyqhD0Q8t1TKXJBavpfYldtbhi/t
 AQbXTUPRj9egEaHZnTN3rvV7JTcLzn3JlFnixJAZXj6iME7R6TJHZLgej+/ehn9eVbYvzmxRmcy
 weizBvwr9Iavg1lFUs+470/kCs2kwbq0jPCyIiayAWoqUvqNI/ev1wopJu973aC2xmWiaxfGFoO
 ppZe0BvBPsNhJRb6FzPClvXVWL12eKkNP+yBEMqSRD1jvqx2aJQ=
X-Google-Smtp-Source: AGHT+IFrMJ2x7l14p7YY6u0VgH6BBVC0QQVL7Nu6selEIjhaPpfoqaKGJo22o48CyfkVTXAzEGXIJw==
X-Received: by 2002:a05:6000:1862:b0:39c:dfc:f496 with SMTP id
 ffacd0b85a97d-39ec22f8a45mr1667869f8f.8.1744468528239; 
 Sat, 12 Apr 2025 07:35:28 -0700 (PDT)
Received: from archlinux.. ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eaf447914sm5188592f8f.97.2025.04.12.07.35.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Apr 2025 07:35:27 -0700 (PDT)
From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Julien Corjon <corjon.j@ecagroup.com>,
 =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>
Date: Sat, 12 Apr 2025 16:35:22 +0200
Message-ID: <20250412143522.1214009-1-gael.portay+rtone@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744468529; x=1745073329; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=5PjYnINbsPpCDsvO2yA3bAmM8NLn28I36wIwcNpuu38=;
 b=mfq0u+tImoHiKl2Zm7ldA92d4zF8dh8X7wFSyHfeYWHIibAP90D5064F9MSf+kQCRk
 OJA0U2ThWU2C+O/d6C80RTZbpzA164MmKGb+p4K7cQl2uOOVyfBUsCmEJJQFgWirTV1B
 3sSLdLd3s1ewc52+rg/HnP9710lvCqfQDrJZEmq9jTODIvO0sEPUqQF+PK+KhdrGQ7Pn
 zIxLxoNXKEfGTEvyzZknJ6r0Pskmo6pxGbBySplIYu06IfEDOHadiI0bhQeolrxRDJf5
 u7DPw3ive42FKmLsxkNAmobDsKQAXSDfftGh+3hZDsUS4GrIl//8WYB46m020QoS6reX
 DUpg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mfq0u+tI
Subject: [Buildroot] [PATCH 1/1] qt5webengine-chromium: fix python 3.13 issue
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

UHl0aG9uIHdhcyBidW1wZWQgZnJvbSAzLjEyLnggdG8gMy4xMy54IHNpbmNlIHRoZSBjb21taXQK
ZDYzZTIwN2ViODY5MDYzZjgyYzg2NzY1ODY3NmMyOTAzYmViMDhjYi4KClRoZSBtb2R1bGUgcGlw
ZXMgaXMgbm8gbG9uZ2VyIHBhcnQgb2YgdGhlIFB5dGhvbiBzdGFuZGFyZCBsaWJyYXJ5LiBJdAp3
YXMgcmVtb3ZlZCBpbiBQeXRob24gMy4xMyBhZnRlciBiZWluZyBkZXByZWNhdGVkIGluIFB5dGhv
biAzLjExLiBUaGUKbGFzdCB2ZXJzaW9uIG9mIFB5dGhvbiB0aGF0IHByb3ZpZGVkIHRoZSBwaXBl
cyBtb2R1bGUgd2FzIFB5dGhvbiAzLjEyLgoKU2VlWzFdLgoKVGhlIGNocm9taXVtIHByb2plY3Qg
aW4gcXQ1d2ViZW5naW5lLWNocm9taXVtIGlzIHZlcnkgb2xkICg4Ny1iYXNlZFsyXSkuCgpUaGlz
IGJhY2twb3J0cyBhIGNoYW5nZSByZW1vdmluZyB0aGUgdXNlIG9mIHBpcGVzIHRoYXQgd2FzIGZp
cnN0CmludHJvZHVjZWQgaW4gMTE0LjAuNTY5Ni4wWzNdIHRvIGZpeCB0aGUgZXJyb3IgYmVsb3c6
CgoJWzE3NC8yMzQ0NV0gQUNUSU9OIC8vY29tcG9uZW50cy9yZXNvdXJjZXM6YWJvdXRfY3JlZGl0
cygvYnVpbGRzL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290L291dHB1dC9idWlsZC9xdDV3ZWJlbmdp
bmUtNS4xNS4xNC9zcmMvdG9vbGNoYWluOnRhcmdldCkKCUZBSUxFRDogZ2VuL2NvbXBvbmVudHMv
cmVzb3VyY2VzL2Fib3V0X2NyZWRpdHMuaHRtbAoJL2J1aWxkcy9idWlsZHJvb3Qub3JnL2J1aWxk
cm9vdC9vdXRwdXQvYnVpbGQvcXQ1d2ViZW5naW5lLTUuMTUuMTQvaG9zdC1iaW4vcHl0aG9uIC4u
Ly4uLzNyZHBhcnR5L2Nocm9taXVtL3Rvb2xzL2xpY2Vuc2VzLnB5IC0tdGFyZ2V0LW9zPWxpbnV4
IC0tZGVwZmlsZSBnZW4vY29tcG9uZW50cy9yZXNvdXJjZXMvYWJvdXRfY3JlZGl0cy5kIGNyZWRp
dHMgZ2VuL2NvbXBvbmVudHMvcmVzb3VyY2VzL2Fib3V0X2NyZWRpdHMuaHRtbAoJL2J1aWxkcy9i
dWlsZHJvb3Qub3JnL2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQvcXQ1d2ViZW5naW5lLTUuMTUuMTQv
c3JjLzNyZHBhcnR5L2Nocm9taXVtL2J1aWxkL2FuZHJvaWQvZ3lwL3V0aWwvYnVpbGRfdXRpbHMu
cHk6NjI4OiBTeW50YXhXYXJuaW5nOiBpbnZhbGlkIGVzY2FwZSBzZXF1ZW5jZSAnXCgnCgkgIHIg
PSByZS5jb21waWxlKCdARmlsZUFyZ1woKC4qPylcKScpCglUcmFjZWJhY2sgKG1vc3QgcmVjZW50
IGNhbGwgbGFzdCk6CgkgIEZpbGUgIi9idWlsZHMvYnVpbGRyb290Lm9yZy9idWlsZHJvb3Qvb3V0
cHV0L2J1aWxkL3F0NXdlYmVuZ2luZS01LjE1LjE0L3NyYy9jb3JlL3JlbGVhc2UvLi4vLi4vM3Jk
cGFydHkvY2hyb21pdW0vdG9vbHMvbGljZW5zZXMucHkiLCBsaW5lIDM3LCBpbiA8bW9kdWxlPgoJ
ICAgIGZyb20gdXRpbCBpbXBvcnQgYnVpbGRfdXRpbHMKCSAgRmlsZSAiL2J1aWxkcy9idWlsZHJv
b3Qub3JnL2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQvcXQ1d2ViZW5naW5lLTUuMTUuMTQvc3JjLzNy
ZHBhcnR5L2Nocm9taXVtL2J1aWxkL2FuZHJvaWQvZ3lwL3V0aWwvYnVpbGRfdXRpbHMucHkiLCBs
aW5lIDE1LCBpbiA8bW9kdWxlPgoJICAgIGltcG9ydCBwaXBlcwoJTW9kdWxlTm90Rm91bmRFcnJv
cjogTm8gbW9kdWxlIG5hbWVkICdwaXBlcycKClsxXTogaHR0cHM6Ly9kb2NzLnB5dGhvbi5vcmcv
My9saWJyYXJ5L3BpcGVzLmh0bWwKWzJdOiBodHRwczovL2dpdGh1Yi5jb20vcXQvcXR3ZWJlbmdp
bmUvYmxvYi92NS4xNS4xNC1sdHMtbGdwbC9DSFJPTUlVTV9WRVJTSU9OClszXTogaHR0cHM6Ly9n
aXRodWIuY29tL2Nocm9taXVtL2Nocm9taXVtL2NvbW1pdC80YzZmYzE5ODQ5NzBhZjRiMmIxNzY1
MDE0YzlkZGNkOTU3YWQ3ZGRhCgpGaXhlczogaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5v
cmcvYnVpbGRyb290Ly0vam9icy85Njc3MTY3MzY3CgpTaWduZWQtb2ZmLWJ5OiBHYcOrbCBQT1JU
QVkgPGdhZWwucG9ydGF5K3J0b25lQGdtYWlsLmNvbT4KLS0tCiAuLi4tcHJpbnRlZC1jbWQtd2hl
bi1sb25nLWNvbW1hbmRzLWZhaWwucGF0Y2ggfCA1NyArKysrKysrKysrKysrKysrKysrCiAxIGZp
bGUgY2hhbmdlZCwgNTcgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2Uv
cXQ1L3F0NXdlYmVuZ2luZS1jaHJvbWl1bS8wMDExLVNob3J0ZWQtcHJpbnRlZC1jbWQtd2hlbi1s
b25nLWNvbW1hbmRzLWZhaWwucGF0Y2gKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3F0NS9xdDV3ZWJl
bmdpbmUtY2hyb21pdW0vMDAxMS1TaG9ydGVkLXByaW50ZWQtY21kLXdoZW4tbG9uZy1jb21tYW5k
cy1mYWlsLnBhdGNoIGIvcGFja2FnZS9xdDUvcXQ1d2ViZW5naW5lLWNocm9taXVtLzAwMTEtU2hv
cnRlZC1wcmludGVkLWNtZC13aGVuLWxvbmctY29tbWFuZHMtZmFpbC5wYXRjaApuZXcgZmlsZSBt
b2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi45MDhmZTI0ZTU0Ci0tLSAvZGV2L251bGwKKysr
IGIvcGFja2FnZS9xdDUvcXQ1d2ViZW5naW5lLWNocm9taXVtLzAwMTEtU2hvcnRlZC1wcmludGVk
LWNtZC13aGVuLWxvbmctY29tbWFuZHMtZmFpbC5wYXRjaApAQCAtMCwwICsxLDU3IEBACitGcm9t
IDFhNzEzYzZlNDg2MWYwNjcyMjUyNDI1YTFjY2JmYTlmNDU4MzRkNWQgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCitGcm9tOiBNb2hhbWVkIEhlaWthbCA8bWhlaWthbEBjaHJvbWl1bS5vcmc+CitE
YXRlOiBUdWUsIDQgQXByIDIwMjMgMTc6MDQ6MDQgKzAwMDAKK1N1YmplY3Q6IFtQQVRDSF0gU2hv
cnRlZCBwcmludGVkIGNtZCB3aGVuIGxvbmcgY29tbWFuZHMgZmFpbAorTUlNRS1WZXJzaW9uOiAx
LjAKK0NvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOAorQ29udGVudC1UcmFu
c2Zlci1FbmNvZGluZzogOGJpdAorCitTb21lIGNvbW1hbmRzIChlZzogamF2YWMpIGFyZSB2ZXJ5
IGxvbmcgYW5kIHdoZW4gdGhleSBmYWlsIG1vc3Qgb2YgdGhlCitzY3JlZW4vbG9nIGlzIGZpbGxl
ZCB3aXRoIHRoZSBhY3R1YWwgY21kIHZzIHRoZSBlcnJvciBtZXNzYWdlIG91dHB1dC4KK1Nob3J0
ZW4gcHJpbnRlZCBDTURzIHRvIDIwMCBjaGFycyB1bmxlc3MgYW4gZW52aXJvbm1lbnQgdmFyaWFi
bGUgaXMgc2V0LgorCitCdWc6IE5vbmUKK0NoYW5nZS1JZDogSTkyODA5YTdlNGEyYjEyMDQ5MzFh
NzRmZDYyMzk4MDNmZWRkZDQzMGUKK1Jldmlld2VkLW9uOiBodHRwczovL2Nocm9taXVtLXJldmll
dy5nb29nbGVzb3VyY2UuY29tL2MvY2hyb21pdW0vc3JjLysvNDM5NTkwNQorUmV2aWV3ZWQtYnk6
IEFuZHJldyBHcmlldmUgPGFncmlldmVAY2hyb21pdW0ub3JnPgorQ29tbWl0LVF1ZXVlOiBNb2hh
bWVkIEhlaWthbCA8bWhlaWthbEBjaHJvbWl1bS5vcmc+CitDci1Db21taXQtUG9zaXRpb246IHJl
ZnMvaGVhZHMvbWFpbkB7IzExMjYwNjV9CitVcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0IFtodHRw
czovL2dpdGh1Yi5jb20vY2hyb21pdW0vY2hyb21pdW0vY29tbWl0LzRjNmZjMTk4NDk3MGFmNGIy
YjE3NjUwMTRjOWRkY2Q5NTdhZDdkZGFdCitTaWduZWQtb2ZmLWJ5OiBHYcOrbCBQT1JUQVkgPGdh
ZWwucG9ydGF5QHJ0b25lLmZyPgorW2dwb3J0YXk6IHJlbW92ZSBpbXBvcnQgcGlwZXNdCistLS0K
KyBjaHJvbWl1bS9idWlsZC9hbmRyb2lkL2d5cC91dGlsL2J1aWxkX3V0aWxzLnB5IHwgMTAgKysr
KysrKy0tLQorIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
CisKK2RpZmYgLS1naXQgYS9jaHJvbWl1bS9idWlsZC9hbmRyb2lkL2d5cC91dGlsL2J1aWxkX3V0
aWxzLnB5IGIvY2hyb21pdW0vYnVpbGQvYW5kcm9pZC9neXAvdXRpbC9idWlsZF91dGlscy5weQor
aW5kZXggMDIyOTgwNTE3MDIuLjVmYTc1M2FmNDU5IDEwMDY0NAorLS0tIGEvY2hyb21pdW0vYnVp
bGQvYW5kcm9pZC9neXAvdXRpbC9idWlsZF91dGlscy5weQorKysrIGIvY2hyb21pdW0vYnVpbGQv
YW5kcm9pZC9neXAvdXRpbC9idWlsZF91dGlscy5weQorQEAgLTEyLDcgKzEyLDYgQEAgaW1wb3J0
IGZubWF0Y2gKKyBpbXBvcnQganNvbgorIGltcG9ydCBsb2dnaW5nCisgaW1wb3J0IG9zCistaW1w
b3J0IHBpcGVzCisgaW1wb3J0IHJlCisgaW1wb3J0IHNodXRpbAorIGltcG9ydCBzdGF0CitAQCAt
MTk2LDkgKzE5NSwxNCBAQCBjbGFzcyBDYWxsZWRQcm9jZXNzRXJyb3IoRXhjZXB0aW9uKToKKyAK
KyAgIGRlZiBfX3N0cl9fKHNlbGYpOgorICAgICAjIEEgdXNlciBzaG91bGQgYmUgYWJsZSB0byBz
aW1wbHkgY29weSBhbmQgcGFzdGUgdGhlIGNvbW1hbmQgdGhhdCBmYWlsZWQKKy0gICAgIyBpbnRv
IHRoZWlyIHNoZWxsLgorKyAgICAjIGludG8gdGhlaXIgc2hlbGwgKHVubGVzcyBpdCBpcyBtb3Jl
IHRoYW4gMjAwIGNoYXJzKS4KKysgICAgIyBVc2VyIGNhbiBzZXQgUFJJTlRfRlVMTF9DT01NQU5E
PTEgdG8gYWx3YXlzIHByaW50IHRoZSBmdWxsIGNvbW1hbmQuCisrICAgIHByaW50X2Z1bGwgPSBv
cy5lbnZpcm9uLmdldCgnUFJJTlRfRlVMTF9DT01NQU5EJywgJzAnKSAhPSAnMCcKKysgICAgZnVs
bF9jbWQgPSBzaGxleC5qb2luKHNlbGYuYXJncykKKysgICAgc2hvcnRfY21kID0gdGV4dHdyYXAu
c2hvcnRlbihmdWxsX2NtZCwgd2lkdGg9MjAwKQorKyAgICBwcmludGVkX2NtZCA9IGZ1bGxfY21k
IGlmIHByaW50X2Z1bGwgZWxzZSBzaG9ydF9jbWQKKyAgICAgY29weWFibGVfY29tbWFuZCA9ICco
IGNkIHt9OyB7fSApJy5mb3JtYXQob3MucGF0aC5hYnNwYXRoKHNlbGYuY3dkKSwKKy0gICAgICAg
ICcgJy5qb2luKG1hcChwaXBlcy5xdW90ZSwgc2VsZi5hcmdzKSkpCisrICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHByaW50ZWRfY21kKQorICAgICByZXR1cm4g
J0NvbW1hbmQgZmFpbGVkOiB7fVxue30nLmZvcm1hdChjb3B5YWJsZV9jb21tYW5kLCBzZWxmLm91
dHB1dCkKKyAKKyAKKy0tIAorMi4zOS41CisKLS0gCjIuMzkuNQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
