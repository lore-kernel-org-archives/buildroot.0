Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B8EC87FCA
	for <buildroot@archiver.kernel.org>; Sat, 26 Jul 2025 11:26:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7363411EF;
	Sat, 26 Jul 2025 11:26:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OzxH3447DNyW; Sat, 26 Jul 2025 11:26:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D299C4119B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D299C4119B;
	Sat, 26 Jul 2025 11:26:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C87F6DA
 for <buildroot@buildroot.org>; Sat, 26 Jul 2025 11:26:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C5B5083DD6
 for <buildroot@buildroot.org>; Sat, 26 Jul 2025 11:26:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hklRd6K263o1 for <buildroot@buildroot.org>;
 Sat, 26 Jul 2025 11:26:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 85AEC83DCF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85AEC83DCF
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 85AEC83DCF
 for <buildroot@buildroot.org>; Sat, 26 Jul 2025 11:26:34 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a503d9ef59so2186652f8f.3
 for <buildroot@buildroot.org>; Sat, 26 Jul 2025 04:26:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753529192; x=1754133992;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=12Wh+Q5iDwavKuDh4FctNkKfSSgaUblVRlcLJiMCnIk=;
 b=PVZx5siOnhFRP4kCpjmgm3mgMO40JefeQcfceQeuinPabrr5Y4+AD3Pf5P7IBe8hVu
 9s0tjAPrwrgZ+026KkbrpnyjSECLWkUH+QvtKavxBLjHktrikP57xbQ6w7Dx1J2BYqkA
 tdUICztlyhFgKT+xMdXwX+qRf2qFrsGlCERM82gzCmEDghgA9HIn5Ag3mAKiSxln514D
 vOkvfzZzGYAobcI4dBfQI4jEwRR9HuzRrtKBvYcvgEB5WfN7r1opgln1hsZQOiZIQBM0
 kheKkSCI/RrgFErQIoDEXSY5lxrhrmVG3sJnrzZRZKFh/FqVnHsv4Qadevdh46To6l6V
 Ozpw==
X-Gm-Message-State: AOJu0Yy7KZ97B4FKCUm6wsNThc6CoT8agG4dA9r3XCOuY3k3TDbQZI6q
 F5zy8vyA98j/8jLj8BuNhVAtxWr6OcMXM2dbEZoiZm/BMMUvMmbab8p7M30nkeBLM2O4IPUDjiF
 FSKJ4
X-Gm-Gg: ASbGncsY8dqQPYNvdwn74lOmcOCwC9FwRtSqZy4dv1p7rErlAa1W6XVPPKTR30sXGmJ
 Kunvc2pb4N4zi01laV9DJcMzjL4YIMsFDNFFLxzrSSVsYuErKA/wc2U7fCX8mNrIuC8c0aZPg8r
 O7pHet5NM2aOSJ2Fjt9n+eDionAne9psihQMPYD9cMZ4JGhTHIlbMGH41pvhQJm8tczhkUUuA7k
 ioQNepSnDj/POki8uYYUBWnkSdnb6MmPFUkfYPfSvvJRamKZx1n+FPcq8J9pnkb6pOgZCsUohXO
 ilvzlFv+us6vPebls81oJaqjFWXoH5zrdHny5TFB68H3aYSt4mAxEVlfKoPD1jzUW0iHDR3j7ak
 YId3406+X6HidwQ==
X-Google-Smtp-Source: AGHT+IEMCoMPCQ2cNeDM2g/U2nYDUyQar83bEH4mpKAXv25coQz4gqQaifXuxYCjt0rkjIoDD5nsqA==
X-Received: by 2002:a5d:64eb:0:b0:3a6:d7e9:4309 with SMTP id
 ffacd0b85a97d-3b776666792mr3388981f8f.29.1753529191883; 
 Sat, 26 Jul 2025 04:26:31 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458705bcbb7sm86697905e9.18.2025.07.26.04.26.31
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Jul 2025 04:26:31 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 26 Jul 2025 13:26:30 +0200
Message-ID: <20250726112630.778035-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1753529192; x=1754133992; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=12Wh+Q5iDwavKuDh4FctNkKfSSgaUblVRlcLJiMCnIk=;
 b=IIGqW6YgUX4LqIOCySWtIQdQ/5O06+MSNnrTgWy0NN7MQYFoupQ4fPuJ1uvQwDoGrs
 IiCgmZq8qX8FPnarK6hMuBH1zT7y9M8Kf8YY7jdVXCkWkdSXgNi8hU329sorVJGxVN6n
 D+wC4UtH06yK3R6Y40Te5VCx0RjuZs7aEAitKOefgWduxmHKc3aETi5wvTmqA8BWqKdO
 SkkWlZhWQhsE8SzRWgoqHGzZ5YCNQ7+QHCOvv2HvIhBtsWPxKmJbRuDxPrJQvASvX24d
 0/ZQvcIkxELHe37HG8/X1QLQqguCPJODNzoSl2GOyeryBFUj1FeQLCvjk2+KFiKIEddv
 +JAg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=IIGqW6Yg
Subject: [Buildroot] [PATCH] package/kvmtool: fix build failure w/ musl
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U3RhcnRpbmcgR0NDMTQgJ2ltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uJyBhcmUgdHJlYXRl
ZCBhcyBlcnJvcnMgYnkKZGVmYXVsdC4gV2hlbiBidWlsZGluZyBrdm10b29sIHdpdGggbXVzbCBs
aWJjLCB0aGUgZm9sbG93aW5nIGVycm9yCm9jY3VycyBkdWUgdG8gbWlzc2luZyBkZWNsYXJhdGlv
biBvZiAnYmFzZW5hbWUnOgoKYGBgCnZmaW8vY29yZS5jOjUzNzoyMjogZXJyb3I6IGltcGxpY2l0
IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uIOKAmGJhc2VuYW1l4oCZIFstV2ltcGxpY2l0LWZ1bmN0
aW9uLWRlY2xhcmF0aW9uXQogIDUzNyB8ICAgICAgICAgZ3JvdXBfbmFtZSA9IGJhc2VuYW1lKGdy
b3VwX3BhdGgpOwogICAgICB8ICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+CnZmaW8vY29y
ZS5jOjUzNzoyMjogd2FybmluZzogbmVzdGVkIGV4dGVybiBkZWNsYXJhdGlvbiBvZiDigJhiYXNl
bmFtZeKAmSBbLVduZXN0ZWQtZXh0ZXJuc10KdmZpby9jb3JlLmM6NTM3OjIwOiBlcnJvcjogYXNz
aWdubWVudCB0byDigJhjaGFyICrigJkgZnJvbSDigJhpbnTigJkgbWFrZXMgcG9pbnRlciBmcm9t
IGludGVnZXIgd2l0aG91dCBhIGNhc3QgWy1XaW50LWNvbnZlcnNpb25dCiAgNTM3IHwgICAgICAg
ICBncm91cF9uYW1lID0gYmFzZW5hbWUoZ3JvdXBfcGF0aCk7CiAgICAgIHwgICAgICAgICAgICAg
ICAgICAgIF4KYGBgCgpUaGlzIGVycm9yIGNhbiBiZSByZXByb2R1Y2VkIHdpdGg6CgpgYGAKY2F0
ID4uY29uZmlnIDw8RU9GCkJSMl9hYXJjaDY0PXkKQlIyX1RPT0xDSEFJTl9FWFRFUk5BTD15CkJS
Ml9UT09MQ0hBSU5fRVhURVJOQUxfQk9PVExJTj15CkJSMl9UT09MQ0hBSU5fRVhURVJOQUxfQk9P
VExJTl9BQVJDSDY0X01VU0xfQkxFRURJTkdfRURHRT15CkJSMl9QQUNLQUdFX0tWTVRPT0w9eQpF
T0YKbWFrZSBvbGRkZWZjb25maWcKbWFrZSBrdm10b29sCmBgYAoKVGhpcyBwYXRjaCBhZGRzIHRo
ZSB1cHN0cmVhbSBjb21taXQgdGhhdCBmaXhlcyB0aGlzIGlzc3VlIGJ5IGluY2x1ZGluZwp0aGUg
YXBwcm9wcmlhdGUgaGVhZGVyLCBlbnN1cmluZyBjb21wYXRpYmlsaXR5IHdpdGggbXVzbCBhbmQg
R0NDMTQuCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgUGVyYWxlIDx0aG9tYXMucGVyYWxlQG1pbmQu
YmU+Ci0tLQpUaGlzIHBhdGNoIGlzIGEgZm9sbG93IHVwIG9mIHRoaXMgdGhyZWFkIGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2FsbC9lM2U5ODYwOTI5NGQ3MjQ2NzgwYzJlMmFmNTIwZDFiN0BmcmVl
LmZyLwoKIC4uLmx1ZGUtbGliZ2VuLWgtZm9yLW11c2wtY29tcGF0aWJpbGl0eS5wYXRjaCB8IDQ4
ICsrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA0OCBpbnNlcnRpb25zKCspCiBj
cmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9rdm10b29sLzAwMDItdmZpby1pbmNsdWRlLWxpYmdl
bi1oLWZvci1tdXNsLWNvbXBhdGliaWxpdHkucGF0Y2gKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2t2
bXRvb2wvMDAwMi12ZmlvLWluY2x1ZGUtbGliZ2VuLWgtZm9yLW11c2wtY29tcGF0aWJpbGl0eS5w
YXRjaCBiL3BhY2thZ2Uva3ZtdG9vbC8wMDAyLXZmaW8taW5jbHVkZS1saWJnZW4taC1mb3ItbXVz
bC1jb21wYXRpYmlsaXR5LnBhdGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAw
MDAuLmU3NWVkZTZhZjEKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL2t2bXRvb2wvMDAwMi12
ZmlvLWluY2x1ZGUtbGliZ2VuLWgtZm9yLW11c2wtY29tcGF0aWJpbGl0eS5wYXRjaApAQCAtMCww
ICsxLDQ4IEBACitGcm9tIGJhNjgzMGVlYzBmNWFiNzM0YjA5MzY1N2IxNmI1NTVlMDQzN2I5Mjcg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBUaG9tYXMgUGVyYWxlIDx0aG9tYXMucGVy
YWxlQG1pbmQuYmU+CitEYXRlOiBTdW4sIDI5IEp1biAyMDI1IDIyOjIyOjIxICswMjAwCitTdWJq
ZWN0OiB2ZmlvOiBpbmNsdWRlIGxpYmdlbi5oIChmb3IgbXVzbCBjb21wYXRpYmlsaXR5KQorTUlN
RS1WZXJzaW9uOiAxLjAKK0NvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOAor
Q29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAorCitTdGFydGluZyBHQ0MxNCAnaW1wbGlj
aXQtZnVuY3Rpb24tZGVjbGFyYXRpb24nIGFyZSB0cmVhdGVkIGFzIGVycm9ycyBieQorZGVmYXVs
dC4gV2hlbiBidWlsZGluZyBrdm10b29sIHdpdGggbXVzbCBsaWJjLCB0aGUgZm9sbG93aW5nIGVy
cm9yCitvY2N1cnMgZHVlIHRvIG1pc3NpbmcgZGVjbGFyYXRpb24gb2YgJ2Jhc2VuYW1lJzoKKwor
dmZpby9jb3JlLmM6NTM3OjIyOiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rp
b24g4oCYYmFzZW5hbWXigJkgWy1XaW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCisgIDUz
NyB8ICAgICAgICAgZ3JvdXBfbmFtZSA9IGJhc2VuYW1lKGdyb3VwX3BhdGgpOworICAgICAgfCAg
ICAgICAgICAgICAgICAgICAgICBefn5+fn5+fgordmZpby9jb3JlLmM6NTM3OjIyOiB3YXJuaW5n
OiBuZXN0ZWQgZXh0ZXJuIGRlY2xhcmF0aW9uIG9mIOKAmGJhc2VuYW1l4oCZIFstV25lc3RlZC1l
eHRlcm5zXQordmZpby9jb3JlLmM6NTM3OjIwOiBlcnJvcjogYXNzaWdubWVudCB0byDigJhjaGFy
ICrigJkgZnJvbSDigJhpbnTigJkgbWFrZXMgcG9pbnRlciBmcm9tIGludGVnZXIgd2l0aG91dCBh
IGNhc3QgWy1XaW50LWNvbnZlcnNpb25dCisgIDUzNyB8ICAgICAgICAgZ3JvdXBfbmFtZSA9IGJh
c2VuYW1lKGdyb3VwX3BhdGgpOworICAgICAgfCAgICAgICAgICAgICAgICAgICAgXgorCitUaGlz
IHBhdGNoIGZpeGVzIHRoZSBpc3N1ZSBieSBpbmNsdWRpbmcgdGhlIGFwcHJvcHJpYXRlIGhlYWRl
ciwgZW5zdXJpbmcKK2NvbXBhdGliaWxpdHkgd2l0aCBtdXNsIGFuZCBHQ0MxNC4KKworU2lnbmVk
LW9mZi1ieTogVGhvbWFzIFBlcmFsZSA8dGhvbWFzLnBlcmFsZUBtaW5kLmJlPgorUmV2aWV3ZWQt
Ynk6IEFsZXhhbmRydSBFbGlzZWkgPGFsZXhhbmRydS5lbGlzZWlAYXJtLmNvbT4KK0xpbms6IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNTA2MjkyMDIyMjEuODkzMzYwLTEtdGhvbWFzLnBl
cmFsZUBtaW5kLmJlCitTaWduZWQtb2ZmLWJ5OiBXaWxsIERlYWNvbiA8d2lsbEBrZXJuZWwub3Jn
PgorVXBzdHJlYW06IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L3dpbGwva3ZtdG9vbC5naXQvcGF0Y2gvP2lkPWJhNjgzMGVlYzBmNWFiNzM0YjA5MzY1N2Ix
NmI1NTVlMDQzN2I5MjcKK1NpZ25lZC1vZmYtYnk6IFRob21hcyBQZXJhbGUgPHRob21hcy5wZXJh
bGVAbWluZC5iZT4KKy0tLQorIHZmaW8vY29yZS5jIHwgMSArCisgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspCisKK2RpZmYgLS1naXQgYS92ZmlvL2NvcmUuYyBiL3ZmaW8vY29yZS5jCitp
bmRleCAzZmYyYzBiMC4uOGY4ODQ4OTggMTAwNjQ0CistLS0gYS92ZmlvL2NvcmUuYworKysrIGIv
dmZpby9jb3JlLmMKK0BAIC0zLDYgKzMsNyBAQAorICNpbmNsdWRlICJrdm0vaW9wb3J0LmgiCisg
CisgI2luY2x1ZGUgPGxpbnV4L2xpc3QuaD4KKysjaW5jbHVkZSA8bGliZ2VuLmg+CisgCisgI2Rl
ZmluZSBWRklPX0RFVl9ESVIJCSIvZGV2L3ZmaW8iCisgI2RlZmluZSBWRklPX0RFVl9OT0RFCQlW
RklPX0RFVl9ESVIgIi92ZmlvIgorLS0gCitjZ2l0IDEuMi4zLWtvcmcKKwotLSAKMi41MC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
