Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4AA0C3ABC3
	for <buildroot@archiver.kernel.org>; Mon, 12 May 2025 17:35:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82FAD409DF;
	Mon, 12 May 2025 17:35:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RVrCi7YKPLEk; Mon, 12 May 2025 17:35:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B91E4409E7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B91E4409E7;
	Mon, 12 May 2025 17:35:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 346F217D
 for <buildroot@buildroot.org>; Mon, 12 May 2025 17:35:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1816F81B6D
 for <buildroot@buildroot.org>; Mon, 12 May 2025 17:35:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ACB0h8reK2XO for <buildroot@buildroot.org>;
 Mon, 12 May 2025 17:35:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com;
 envelope-from=lazzer@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0708981B71
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0708981B71
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0708981B71
 for <buildroot@buildroot.org>; Mon, 12 May 2025 17:35:20 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-54acc0cd458so5116370e87.0
 for <buildroot@buildroot.org>; Mon, 12 May 2025 10:35:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747071318; x=1747676118;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UBnxWs/eIUBaa1z4o4JmIjXuhm5XGQxMY0ZhNMtbf0E=;
 b=iu5X3zM1dm2e/YCq80z2ZCGUzvyrvNRCBjd6hZim2uB8tmlOZSgDLG8zZz4viq95Sw
 ML4r+pkjNuAIbCCdH3slgEE+h9thdlzwXUowpjmtS4e8SdxV8ng6DZl5/bvtDIF7E+Dk
 RElE/B+I4StC4eESdQR+4TvsiXg8EhT3nZd39GYW7jCKaWhN6pIirbKhMz+GUf+D8F6c
 Tc54jm2WscHB2FoBjztzVQRptaMZEpt+6bgG3tOZ3eW7N9A+v/T1WDxMgFA7HJVD/e3c
 ggiPsbx/cDq0mfmhNC8aT/DrSP/qZ6HINKSw1TmX19l0gL0F5iGRsX4Z8okVL+Cdnpes
 qYJg==
X-Gm-Message-State: AOJu0YyqZf2iYlx8fnYUzx7GwcYXtrdJe5Wnd5AsgmsaXjwG/iwbHlJY
 hyrzeT2jd5XU3d+eF5AKpXUkp0FceDI9htQ6CYC9w12RqV1rR5KTEO1icC1K
X-Gm-Gg: ASbGnctNkR6lx8UmXrCGA07+49KwjcYAGpW1NsR80rrn0hc8iBcQVX8Y4TFxnas23Q0
 BXugrxRZUha6OJ4i0qvrkTF4ed7fn/P61QvEyyBY8ParKedKgbpUsKPgiK2KDANgLYGDXrz1UQH
 3ktcOL0nCESTBJc9WOItlwvrhrUeIZLOnaq2XYzUxInBhPVLLZ23/EH1ZlPIwA80FWY1b6dfSL5
 U2zrBvJ24DezK2KJnyk+CiFKN2iXVCMQYY1cGQf7nsXHgwh7y1Z01c2Qm/sIRCWxQYApypRXY3U
 BjcRPKRihxOmaKobVlyem2IA7CY/JKJopf1R5w1Bm5+/BeC1JTsVF+vd2nVEQ76LcTARqK9Ah/V
 oeSszPnsA0g==
X-Google-Smtp-Source: AGHT+IG2lTzZtpyEPOHn7t1jsVJFxZ2eV2K187O2zmheRM6AQXuxkqX09M4szSqzWgQt+vaSX5Oxmg==
X-Received: by 2002:a05:6512:460d:b0:545:2335:6597 with SMTP id
 2adb3069b0e04-54fc67ec288mr4848408e87.50.1747071318192; 
 Mon, 12 May 2025 10:35:18 -0700 (PDT)
Received: from tollan.lan (b106.broadband9.quicknet.se. [194.132.233.106])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54fc645d93asm1582086e87.101.2025.05.12.10.35.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 May 2025 10:35:17 -0700 (PDT)
From: =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
To: buildroot@buildroot.org
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
Date: Mon, 12 May 2025 19:35:06 +0200
Message-ID: <20250512173506.3179898-7-lazzer@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250512173506.3179898-1-lazzer@gmail.com>
References: <20250512173506.3179898-1-lazzer@gmail.com>
MIME-Version: 1.0
Organization: Wires
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747071318; x=1747676118; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=UBnxWs/eIUBaa1z4o4JmIjXuhm5XGQxMY0ZhNMtbf0E=;
 b=PBcO9MQBgRdWsraHBQBAkrubdYUXEYxu/fYKShFpyRFMi3Sb4FKzNt9v3gmq9t7aNH
 /mF/Ev1YlcyuD+PFtEDat23iuUWcrXUYPTX/DZIeeSdmgx+9B9MEOrsCj3klsRyeoQYV
 ehK+iNQRi2VV95JirqKFQbw3HeFaSV7LEPd7SAwD4zJ2XZ2P4BcMdldJh+R+jYSl2IRD
 Qj95j34yFJfSJy990ouBtgIscIYMx7JRTAwWY4FEVUMfrei0i8NAl4O1HgufSEBex3iP
 kZ2HHmsBuETkg4g4UEfpoRy4GeKeFU8p4W5JAQosetyVvlGJVpyIWDdDeiUbVzOip2Ct
 di7w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=PBcO9MQB
Subject: [Buildroot] [PATCH v3 6/6] package/netopeer2: bump to version 2.4.1
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

Q2hhbmdlbG9nOgogaW50ZXJuYWwgc3VwcG9ydCBvZiBpZXRmLXN5c3RlbS1jYXBhYmlsaXRpZXMg
YW5kIGlldGYtbm90aWZpY2F0aW9uLWNhcGFiaWxpdGllcyAoQGplcmVtaWU2d2luZCkKIG1pbm9y
IGJ1Z2ZpeGVzIGFuZCBpbXByb3ZlbWVudHMKCkRlcGVuZHMgb246CiAtIGxpYnlhbmcgdjMuMTIu
MiBodHRwczovL2dpdGh1Yi5jb20vQ0VTTkVUL2xpYnlhbmcvcmVsZWFzZXMvdGFnL3YzLjEyLjIK
IC0gbGlibmV0Y29uZjIgdjMuNy4xIGh0dHBzOi8vZ2l0aHViLmNvbS9DRVNORVQvbGlibmV0Y29u
ZjIvcmVsZWFzZXMvdGFnL3YzLjcuMQogLSBzeXNyZXBvIHYzLjYuMTEgaHR0cHM6Ly9naXRodWIu
Y29tL3N5c3JlcG8vc3lzcmVwby9yZWxlYXNlcy90YWcvdjMuNi4xMQoKU2lnbmVkLW9mZi1ieTog
TWF0dGlhcyBXYWxzdHLDtm0gPGxhenplckBnbWFpbC5jb20+Ci0tLQogcGFja2FnZS9uZXRvcGVl
cjIvbmV0b3BlZXIyLmhhc2ggfCAyICstCiBwYWNrYWdlL25ldG9wZWVyMi9uZXRvcGVlcjIubWsg
ICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbmV0b3BlZXIyL25ldG9wZWVyMi5oYXNoIGIvcGFja2Fn
ZS9uZXRvcGVlcjIvbmV0b3BlZXIyLmhhc2gKaW5kZXggNmEyNzhmYmJhZi4uM2E3MGIxNTUzOSAx
MDA2NDQKLS0tIGEvcGFja2FnZS9uZXRvcGVlcjIvbmV0b3BlZXIyLmhhc2gKKysrIGIvcGFja2Fn
ZS9uZXRvcGVlcjIvbmV0b3BlZXIyLmhhc2gKQEAgLTEsMyArMSwzIEBACiAjIExvY2FsbHkgY2Fs
Y3VsYXRlZAotc2hhMjU2ICAyYjFkYWFjMDM3ZjE4YzMwM2UwYzBkYzMzMThiYTMwMTk2NDU5NDcy
ZTRjNTlmMmY4NTQ3ZWU3NGQ0Y2RmMzFkICBuZXRvcGVlcjItMi4xLjQ5LnRhci5negorc2hhMjU2
ICA4NmQ3N2VmY2I2NWYwYmIyYzNiYzBmMjEyOGEzMjAxMTNjZTcxMjVmMzk4ODJmZTdkODMzNGMx
NjhlZDk1NjdkICBuZXRvcGVlcjItMi40LjEudGFyLmd6CiBzaGEyNTYgIGI0NmYxNjFmYmRjZjEy
N2QzZWYyMjYwMmUxNTk1OGMzMDkyZmUzMjk0ZjcxYTJkYzhjZGY4ZjY2ODljYmE5NWIgIExJQ0VO
U0UKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbmV0b3BlZXIyL25ldG9wZWVyMi5tayBiL3BhY2thZ2Uv
bmV0b3BlZXIyL25ldG9wZWVyMi5tawppbmRleCA0ODUzZTVkMTc2Li43MWYyYzUwNjQwIDEwMDY0
NAotLS0gYS9wYWNrYWdlL25ldG9wZWVyMi9uZXRvcGVlcjIubWsKKysrIGIvcGFja2FnZS9uZXRv
cGVlcjIvbmV0b3BlZXIyLm1rCkBAIC00LDcgKzQsNyBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMKIAotTkVUT1BFRVIyX1ZFUlNJT04gPSAyLjEuNDkKK05FVE9QRUVSMl9WRVJTSU9OID0g
Mi40LjEKIE5FVE9QRUVSMl9TSVRFID0gJChjYWxsIGdpdGh1YixDRVNORVQsTmV0b3BlZXIyLHYk
KE5FVE9QRUVSMl9WRVJTSU9OKSkKIE5FVE9QRUVSMl9ETF9TVUJESVIgPSBuZXRvcGVlcjIKIE5F
VE9QRUVSMl9MSUNFTlNFID0gQlNELTMtQ2xhdXNlCi0tIAoyLjQzLjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
