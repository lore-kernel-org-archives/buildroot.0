Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82467C433FE
	for <buildroot@archiver.kernel.org>; Tue,  4 Oct 2022 01:11:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB20E40B05;
	Tue,  4 Oct 2022 01:11:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB20E40B05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hSkkfIqPwsFW; Tue,  4 Oct 2022 01:11:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3D0494025F;
	Tue,  4 Oct 2022 01:11:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D0494025F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A18701BF372
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 01:11:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7CE0A830E3
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 01:11:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CE0A830E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6W1MaIX5d0pM for <buildroot@lists.busybox.net>;
 Tue,  4 Oct 2022 01:11:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77021830C0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 77021830C0
 for <buildroot@buildroot.org>; Tue,  4 Oct 2022 01:11:19 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 h133-20020a1c218b000000b003bd21e3dd7aso11992wmh.1
 for <buildroot@buildroot.org>; Mon, 03 Oct 2022 18:11:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=Hud9u2wQ8UY70xGHeG+ppexlXUdQGoXP10z9sYOL6vI=;
 b=CSr8CG+diqfINQDUe+xEdpBq3qX2I4e2TE/Ttj7xbcQbA787BzVv6R2zY1qx9BEp4Z
 VxWZOMQ+CnvYZYXebRMT6gKW9t33HyE+6YJlHwov8ve9RA7+JDXn0Uw6lGKwMiiAeG2p
 UrN1y/jgmWLxZUb4jYjjGY/Wa64D7eHAJn2+PYzfeDtLF/fa1GL4IR7BlFM7gNqCXIvx
 hJWAYCGYUDdSd+98fb11Jr4eujPKZsU7g07xBeJo8Ilc2xKaNVOdYtaJWnfLXDT5L6UH
 ZbysVazsRF3vRRZeVdb2VxmhaZbr2BChynqpdWJOmffJkIl+Iy9Sv3Kek7eGv1wE1OSZ
 IF6Q==
X-Gm-Message-State: ACrzQf0nvrkB3OZfviOZ1eCcqBwTpziyt5XtDWMQUG+tZZojNxa6YGfP
 t4RMrGo7ikd5Ja7mQL/QiJskt9MNnbOTWA==
X-Google-Smtp-Source: AMsMyM6q1sEiflOna7/j9/UmWITdbt0cwREUJLkGJrQ0xf8M159TFEBy3W0P509Q9/OIaKxVJHu2zw==
X-Received: by 2002:a05:600c:2212:b0:3b4:9ab8:b24e with SMTP id
 z18-20020a05600c221200b003b49ab8b24emr8387691wml.127.1664845877415; 
 Mon, 03 Oct 2022 18:11:17 -0700 (PDT)
Received: from localhost ([207.188.148.24]) by smtp.gmail.com with ESMTPSA id
 f5-20020adfdb45000000b0022cc6b8df5esm10973767wrj.7.2022.10.03.18.11.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Oct 2022 18:11:16 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  4 Oct 2022 03:10:34 +0200
Message-Id: <20221004011034.1283650-1-salvador.joseluis@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=Hud9u2wQ8UY70xGHeG+ppexlXUdQGoXP10z9sYOL6vI=;
 b=RZCBZRnXixUVe00lIux4+dZIrvsJiJA6iONPh+dgtUj3qpIT88En5u+MuB0Q3maNX8
 RfH7NRweEx5O68WlTCbjqGODcumO7T4J+tfcmQNh+fHmjc7DxwecJTR+rs39sy4k7nRo
 koTfTeRLJYTWtxRIlM31kHSvw+6Q56dcjJ2hGnomWbresI2z17sygwzkFgx7ydDPFz4p
 9uQY6GhA3BDEQsE4QPBYACc7oWXf+B5P7E2Lu9cDOXvI/1aVJeGBnrTJ3wVwuAOt8jGU
 qtuL7lMMvn4j/2R/ALEAU3vSxMAsuD4p436Qnxb7KmTFfJEtunmjBQuAlf8XDF/DcIX9
 6S/A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=RZCBZRnX
Subject: [Buildroot] [PATCH 1/2] package/zfs: bump version to 2.1.6
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
Cc: =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogSm9zw6kgTHVpcyBTYWx2YWRvciBSdWZvIDxzYWx2YWRvci5qb3NlbHVp
c0BnbWFpbC5jb20+Ci0tLQogcGFja2FnZS96ZnMvemZzLmhhc2ggfCAyICstCiBwYWNrYWdlL3pm
cy96ZnMubWsgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvemZzL3pmcy5oYXNoIGIvcGFja2FnZS96
ZnMvemZzLmhhc2gKaW5kZXggNDExYWY5NzRjNi4uZDQ0NzQwYTVmNSAxMDA2NDQKLS0tIGEvcGFj
a2FnZS96ZnMvemZzLmhhc2gKKysrIGIvcGFja2FnZS96ZnMvemZzLmhhc2gKQEAgLTEsNSArMSw1
IEBACiAjIEZyb20gaHR0cHM6Ly9naXRodWIuY29tL29wZW56ZnMvemZzL3JlbGVhc2VzL2Rvd25s
b2FkL3pmcy0yLjEuNC96ZnMtMi4xLjQuc2hhMjU2LmFzYwotc2hhMjU2ICAzYjUyYzBkNDkzZjgw
NmY2MzhkY2E4N2RkZTgwOWY1Mzg2MWNkMzE4YzFlYmIwZTYwZGFlYWEwNjFjZjFhY2Y2ICB6ZnMt
Mi4xLjQudGFyLmd6CitzaGEyNTYgIDE1MzM5MDE0ZjhkMjEzMTM0OGViOTM3YmY4ODkzODQ5ODA2
YjZkMjY0NWVhNjA3YTE4YzdmMTE3NzQ5ZGJkN2EgIHpmcy0yLjEuNi50YXIuZ3oKIHNoYTI1NiAg
OTZhMjczNTNmZTcxN2ZmMmM4Yjk1ZGViOGIwMDljNGViNzUwMzAzYzY0MDBlMmQ4YTI1ODJhYjFl
YzEyYjI1YSAgYmMzZjEyYmZhYzE1MmEwYzI4OTUxY2VjOTIzNDBiYTE0ZjljY2VlOS5wYXRjaAog
CiAjIEhhc2ggZm9yIGxpY2Vuc2UgZmlsZXM6CmRpZmYgLS1naXQgYS9wYWNrYWdlL3pmcy96ZnMu
bWsgYi9wYWNrYWdlL3pmcy96ZnMubWsKaW5kZXggOTAwYTcyZjk5Ny4uZjdlNjczYzIzZiAxMDA2
NDQKLS0tIGEvcGFja2FnZS96ZnMvemZzLm1rCisrKyBiL3BhY2thZ2UvemZzL3pmcy5tawpAQCAt
NCw3ICs0LDcgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLVpGU19WRVJTSU9OID0g
Mi4xLjQKK1pGU19WRVJTSU9OID0gMi4xLjYKIFpGU19TSVRFID0gaHR0cHM6Ly9naXRodWIuY29t
L29wZW56ZnMvemZzL3JlbGVhc2VzL2Rvd25sb2FkL3pmcy0kKFpGU19WRVJTSU9OKQogWkZTX1BB
VENIID0gaHR0cHM6Ly9naXRodWIuY29tL29wZW56ZnMvemZzL2NvbW1pdC9iYzNmMTJiZmFjMTUy
YTBjMjg5NTFjZWM5MjM0MGJhMTRmOWNjZWU5LnBhdGNoCiBaRlNfTElDRU5TRSA9IENEREwKLS0g
CjIuMzcuMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
