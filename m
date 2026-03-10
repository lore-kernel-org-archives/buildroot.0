Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74B95F3C27D
	for <buildroot@archiver.kernel.org>; Tue, 10 Mar 2026 10:10:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CE3660A9D;
	Tue, 10 Mar 2026 10:10:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z1hawT1Hs04w; Tue, 10 Mar 2026 10:10:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4357960ACB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773137427;
	bh=s2lN13TEFPZvaiJzwmbcM6XjlBZO5I3Ks05beLGWi+M=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=cNvj5F52fg+KNfs3ASB/lghchID0bSE6G8dpNLyf5soxAGLDjyITKLHgPO9kk8rZ2
	 86nxPpNUSiqYA1gZe/q4V7LwAqVfaI7mkyEe0ypPtEVoR/kPk+aBNJ9JTGTgQs9tI4
	 7hlE4WgVFgJqGhni5lGkw/FbtrG53SIpclVKY5SvrkZEVliL/hYJONQfb6PdSL517y
	 RysLlwOxyKkPaGVDV/3xyixNrlVM2YdPl75KKMHIPM4BFgi5UsqcungRUZWok2aUAT
	 JWFqYlKAhFgL3dip4lhqnLd+9uMuPJ/+X46mcqtyNeuW34U7yLfbvFiBOlx4GpYpof
	 u5hq1DBowEGnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4357960ACB;
	Tue, 10 Mar 2026 10:10:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BD128201
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 10:10:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE6548428E
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 10:10:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HAxFBe3cAYZr for <buildroot@buildroot.org>;
 Tue, 10 Mar 2026 10:10:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3478084286
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3478084286
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3478084286
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 10:10:23 +0000 (UTC)
Received: from framework-OT (ip-109-41-178-45.web.vodafone.de [109.41.178.45])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 4A3572C800F1;
 Tue, 10 Mar 2026 11:10:19 +0100 (CET)
To: buildroot@buildroot.org
Cc: Manuel Diener <manuel.diener@oss.othermo.de>
Date: Tue, 10 Mar 2026 11:10:36 +0100
Message-ID: <20260310101037.470940-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1773137420; bh=dBY1nIQRpmGSDs/WMp2If3scMvyYjK1BHqWiV7emAK8=;
 h=From:To:Cc:Subject:Date;
 b=LkAUFulrxccULAkVp0BmkqXEB1A+cqj/RItRjQ8tJOuN0UcVuwsc0Y0jAWoYZ9JjZ
 /4QaYG4mclPZcOS3tMOXzZ9MkewecyZ914dXjKbuy2JpFfgsFUaQVcXBSxlijofDKV
 cu+fRPV2Rc/g3VwONd4Zmg5GHHO/MJUFXNjroKxWeTIj8TcYf1C5EETEWQxwUS8Fye
 tYj2tsklm017be58FcHtEu3quOVEsuPnG/LzaIcODn13oFwCplT2wID8LW05zVZT6+
 fFf0hk12d5cWT1b6g46xP+wQnlMSG95KvV4oJ3GdBYdD5Dtzy3cm013Jj9VI7bm5Xw
 UAdq1HUsHA8Gg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=LkAUFulr
Subject: [Buildroot] [PATCH] DEVELOPERS: remove Marcus Hoffmann from no
 longer used packages
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Remove myself from packages that I'm no longer personally interested in.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 DEVELOPERS | 35 -----------------------------------
 1 file changed, 35 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 106510ea84..b7d19bc299 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2266,55 +2266,20 @@ F:	utils/diffconfig
 
 N:	Marcus Hoffmann <bubu@bubu1.eu>
 F:	package/nethogs/
-F:	package/pico-sdk/
-F:	package/picotool/
-F:	package/python-annotated-doc/
-F:	package/python-apscheduler/
-F:	package/python-crc/
-F:	package/python-diskcache/
 F:	package/python-django/
 F:	package/python-gpiod/
-F:	package/python-immutabledict/
 F:	package/python-jc/
-F:	package/python-log-rate-limit/
-F:	package/python-pydantic/
-F:	package/python-pydantic-core/
-F:	package/python-pydantic-settings/
-F:	package/python-ruamel-yaml-clib/
-F:	package/python-typing-inspection/
-F:	package/python-tzlocal/
-F:	package/python-sdbus-modemmanager/
-F:	package/python-sdbus-systemd/
 F:	package/python-varlink/
 F:	package/python-waitress/
 F:	package/python-whitenoise/
-F:	support/testing/tests/package/test_python_apscheduler.py
-F:	support/testing/tests/package/test_python_crc.py
-F:	support/testing/tests/package/test_python_diskcache.py
 F:	support/testing/tests/package/test_python_django.py
-F:	support/testing/tests/package/test_python_fastapi.py
-F:	support/testing/tests/package/test_python_pydantic.py
-F:	support/testing/tests/package/test_python_pydantic_settings.py
 F:	support/testing/tests/package/test_python_requests.py
-F:	support/testing/tests/package/test_python_ruamel_yaml.py
-F:	support/testing/tests/package/test_python_sdbus_modemmanager.py
-F:	support/testing/tests/package/test_python_sdbus_systemd.py
-F:	support/testing/tests/package/test_python_tzlocal.py
 F:	support/testing/tests/package/test_python_varlink.py
 F:	support/testing/tests/package/test_python_varlink/
 F:	support/testing/tests/package/test_python_waitress.py
 F:	support/testing/tests/package/test_python_whitenoise.py
-F:	support/testing/tests/package/sample_python_apscheduler.py
-F:	support/testing/tests/package/sample_python_crc.py
-F:	support/testing/tests/package/sample_python_diskcache.py
 F:	support/testing/tests/package/sample_python_django.py
-F:	support/testing/tests/package/sample_python_fastapi.py
-F:	support/testing/tests/package/sample_python_pydantic.py
-F:	support/testing/tests/package/sample_python_pydantic_settings.py
 F:	support/testing/tests/package/sample_python_requests.py
-F:	support/testing/tests/package/sample_python_ruamel_yaml.py
-F:	support/testing/tests/package/sample_python_sdbus_modemmanager.py
-F:	support/testing/tests/package/sample_python_sdbus_systemd.py
 
 N:	Marek Belisko <marek.belisko@open-nandra.com>
 F:	package/libatasmart/
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
