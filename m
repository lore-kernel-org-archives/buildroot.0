Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 669BBC4167B
	for <buildroot@archiver.kernel.org>; Sun, 26 Nov 2023 20:33:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 088CF40382;
	Sun, 26 Nov 2023 20:33:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 088CF40382
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8kTHhfJUH8wB; Sun, 26 Nov 2023 20:33:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BA7F40347;
	Sun, 26 Nov 2023 20:33:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BA7F40347
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 800921BF42D
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 20:33:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 58AAF606FF
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 20:33:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58AAF606FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jgDgZF_GK5CJ for <buildroot@lists.busybox.net>;
 Sun, 26 Nov 2023 20:33:48 +0000 (UTC)
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7B1C16062F
 for <buildroot@buildroot.org>; Sun, 26 Nov 2023 20:33:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B1C16062F
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-7b3840dff10so74149939f.0
 for <buildroot@buildroot.org>; Sun, 26 Nov 2023 12:33:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701030827; x=1701635627;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iQTMA/G3JOydYO5QonGBNPYV8tQeaRZT6VZxX+KjiW4=;
 b=qmb2yxddN+1vHDixBcXdVrcNlWA8ozEbmvYWd3/cWaFOtbNwcL8i5eSIgjgp8qm5Ed
 yPIqGV3l309yun2tb2pAssnnAbx7+S5sNrGOQqRdjuzGBEnoDklpIoCwUZUIeAqNrzT6
 oscLaC8NupUg0GEvnQWYHYYKP05mK04P4EFHVlGsARx7w251zVZ6FLLq93zyIybamhTu
 /qfJvfueLFYpYwqMbe1LdcB9zEAK52D18Gz40m7AT1TOPPxlTMtzz4ye83NpYHj1JFat
 HkhFw34l5BHjtYxqFkaJpS245Efx4ueJav2+W9+wq55kwnIKX0eVSNg3cb5fCoeS6Bop
 GwaA==
X-Gm-Message-State: AOJu0Yw3hJdtVK6P9z1ouTeClrgSYUVMUdQosc/eyN5+CFS8NSTxVo0j
 Tmx5h/k1kEeBy7OhbEXdYNoE/qBzN2s=
X-Google-Smtp-Source: AGHT+IFESy44j15AHPeuNV/qpGF28kKTOnCwPxkxCS9NAwAihgHlEZ8WlxeJT8sSdvWNycGNOTomAw==
X-Received: by 2002:a6b:3e84:0:b0:7b3:95d6:62df with SMTP id
 l126-20020a6b3e84000000b007b395d662dfmr4514289ioa.21.1701030827032; 
 Sun, 26 Nov 2023 12:33:47 -0800 (PST)
Received: from james-x399.localdomain (97-118-243-253.hlrn.qwest.net.
 [97.118.243.253]) by smtp.gmail.com with ESMTPSA id
 c17-20020a5ea911000000b007b048013330sm2061922iod.44.2023.11.26.12.33.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Nov 2023 12:33:46 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Nov 2023 13:33:41 -0700
Message-Id: <20231126203341.2116704-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701030827; x=1701635627; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iQTMA/G3JOydYO5QonGBNPYV8tQeaRZT6VZxX+KjiW4=;
 b=Cl0e0Bi6ZE72nQlq3epuL6PBHgF8qtPiWJVfRIyxAVx8lGl6q3hEU+Lf6xTkNZ1371
 INizA58NrBJrWLwdOw443onqfmrMKXR5pKi+0O/9efvkv+MFPQKMrq1fGJmfrhSRoeXw
 PH0f1vSCnOQtTEOTdL4FaEeuQ8NHD6MTrFgzh/b5g/S2CIYTcSnbcGtc1diylbHlGQHP
 OsFxbMCxytortc3CyEc7+fh4ZDSDK3apxU5oUhv1CmHNqprxRDn2GV/+7vJXeznAoQV4
 +4B996W6p50qupPhzmaLzBhmpBzRxJ4KLP+36e5BXsN5CS+WoAvGRTMk0jYwjmyh5Y1e
 ghsg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Cl0e0Bi6
Subject: [Buildroot] [PATCH 1/1] package/python-msgpack: fix build without
 cpp toolchain
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
Cc: "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Prior to being updated to version 1.0.7 in
014a66fcde68bd0b612b62ec722ccc93bdc0d7f9 python-msgpack would
automatically fall back to the pure python version if the cpp based
optimized extension would fail to build for any reason.

This however is no longer the case after updating to 1.0.7 where it
is now required that we explicitely set the MSGPACK_PUREPYTHON=1 if
we do not have cpp support enabled in the toolchain.

Fixes:
 - http://autobuild.buildroot.net/results/361/36185a19bed4bd57421a4d909bce1976c89d130f
 - http://autobuild.buildroot.net/results/477/477f822cb196ebc2246bcbdc1b6eaf940fc018cd

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-msgpack/python-msgpack.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/python-msgpack/python-msgpack.mk b/package/python-msgpack/python-msgpack.mk
index 061ff5a761..82110b1776 100644
--- a/package/python-msgpack/python-msgpack.mk
+++ b/package/python-msgpack/python-msgpack.mk
@@ -11,4 +11,8 @@ PYTHON_MSGPACK_LICENSE = Apache-2.0
 PYTHON_MSGPACK_LICENSE_FILES = COPYING
 PYTHON_MSGPACK_SETUP_TYPE = setuptools
 
+ifeq ($(BR2_INSTALL_LIBSTDCPP),)
+PYTHON_MSGPACK_ENV = MSGPACK_PUREPYTHON=1
+endif
+
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
