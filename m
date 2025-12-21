Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E62D2E66886
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 22:37:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE5F0821E0;
	Sun, 21 Dec 2025 22:37:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VScDiEy-9P12; Sun, 21 Dec 2025 22:37:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9467080AC3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766356643;
	bh=R87UTBowpoukx/pSh1SboPxdUsgQeYrzK7RhIMqR5tI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=I56TmfJv7+aK3mzyvr9X9+ja30DXr1LIqf/FE2YeOCVQdNfdgv6//x89ZNA97htJQ
	 pEdAoyQPdCefNrvmEPTVtndffTerf7+sJ4uC8whlSiC0v1TzvDI7EQDW4+0JM9U8Nv
	 bZacvmnyKXTq56hjnjklNbrD6pkINDHlLLNDWeLijsYCnRWGgSK7frw1506o2jihYZ
	 OW62vuaE6U40zqgVbPxLSfhB3BqEt/r7U/BulBMYAhKrtnlgbizk+1DfHk/OZtNnr9
	 +AyErCho1y2TK5p8SHw6WEuq9uvPJ3WUCFOcGZ77AFjn7p2P8tN2R8XlxhxssAvnYy
	 pA74QJlLqi31w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9467080AC3;
	Sun, 21 Dec 2025 22:37:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 08F29195
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:37:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E3F13400C5
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:37:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mP1mdxEAiRjV for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 22:37:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C700C40089
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C700C40089
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C700C40089
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:37:20 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c75a.dip0.t-ipconnect.de [79.214.199.90])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 274BFA4C4E45;
 Sun, 21 Dec 2025 23:35:05 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60652)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vXS0g-000000005pH-16he;
 Sun, 21 Dec 2025 22:34:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 21 Dec 2025 23:34:32 +0100
Message-ID: <20251221223441.185169-14-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251221223441.185169-1-bernd@kuhls.net>
References: <20251221223441.185169-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766356505;
 bh=2iiwy40VfUWiDmv6RtLRaCk/qljdPW7vzCxr6FLCLmc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=QcB/wlBMbQ0eC/4BIl3e8oa2i3gOgoUBc2+py2w87IWEMdyL2Qy2OER1aNSYKAlMO
 bjhK7C76+mjvTq/Pca4BrFjqKoH9yofO+EmcliSY9UnrnEyM5WUNtLazPBdMQXEsYZ
 KeJsWq54shb92M81d+yvvx3lvhTJppNfHuMkFW1GQWZ7z1SgKNX0oV37jQ/LZxFi2s
 ScRVOTAk5XJMZLVFN+jBp4PfwiaUBMXGzL7qHtJnVNCybGy7qPHwfwmBDT/sZg9DVO
 qH2RzfNylkmpLmjOxBIHoYu+1tHGx0p/onqDfrHCWr17BsHhy/wqJaorXgVOv4ZroT
 vwrRWCBZVKeHQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=QcB/wlBM
Subject: [Buildroot] [PATCH v2 14/23] package/python-minimalmodbus: add md5
 hash
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Updated package as computed by scanpypi.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-minimalmodbus/python-minimalmodbus.hash | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/python-minimalmodbus/python-minimalmodbus.hash b/package/python-minimalmodbus/python-minimalmodbus.hash
index 635090fae7..ee688e49d3 100644
--- a/package/python-minimalmodbus/python-minimalmodbus.hash
+++ b/package/python-minimalmodbus/python-minimalmodbus.hash
@@ -1,4 +1,5 @@
-# sha256 from https://pypi.org/project/minimalmodbus
+# md5, sha256 from https://pypi.org/pypi/minimalmodbus/json
+md5  a981b31df61c7dd9fa04d0def72f8486  minimalmodbus-2.1.1.tar.gz
 sha256  c3f5a56e107d537e4bb420f7e735841ab2939c8ca6fb528f5fe4124571315b64  minimalmodbus-2.1.1.tar.gz
-# Hash for license file
+# Locally computed sha256 checksums
 sha256  abe787d472ae2069e935c84eb13fd770518dfb08b92d5f190f3cd7ff6d1f6f32  LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
