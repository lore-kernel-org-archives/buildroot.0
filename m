Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78970C433F5
	for <buildroot@archiver.kernel.org>; Mon,  3 Jan 2022 21:56:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D50EF408A3;
	Mon,  3 Jan 2022 21:56:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GA9u-SbKJoA2; Mon,  3 Jan 2022 21:56:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D32E4088C;
	Mon,  3 Jan 2022 21:56:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 10BB71BF285
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 21:56:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 081044088C
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 21:56:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rfjO4HFKXV7F for <buildroot@lists.busybox.net>;
 Mon,  3 Jan 2022 21:56:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 06AD440887
 for <buildroot@buildroot.org>; Mon,  3 Jan 2022 21:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1641246980;
 bh=WjI6oC/+F/6LRuMlbUQbRxnHdxV0I36LWXI633VH4I0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=gHZqNltDSP994PZRwtmzWhtC3dLRAngveg1D8kuihrNWZLWPfeiXPxgj6zuH2AAF5
 MQEjck0BzQdfdBnCbkkryHcrLuEhZZEYp+eSZswHjZM2LW2XE4Uu3s7xOXP/zV5iim
 FzbO3AJjdXrb2CYRiYTxqcCsYye32Nprw4L3TXk0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.105]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MHXFr-1n8ZnO3o6D-00DYDB; Mon, 03 Jan 2022 22:56:20 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Mon,  3 Jan 2022 22:56:19 +0100
Message-Id: <20220103215619.4580-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:8pFaqCmMmEjTZkSFYNbgYm/4eIPXt3/uXN0+IjFGcLvLvDLIya+
 qGmGAYS+t/3kdPpktqdlr9JGGMurCH0QPPx8K+xW3GeO3VzkIPouNeRTYBhhJWHUYxyNaLT
 7aC799jO9Uj6TiMLOWsukr7hveWHd3OAbE3hzMkHVBm7icfD+tX0qXf8bwpQuWWF2TcqLpv
 XIxFsQizsAHmnkZCZCPmA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:b+UX1F5f3TU=:QaE3a+l0yBH7vaahYfgXzA
 NbXox0ZNp9C4m2O4OAR1wBKRH0MHAf0XciFXq3AltSqbrpEwAaTuXu4FedBLQFe8Ds7YJRiqP
 Ns9TMQKE7yFGW/uztUjt8O8muKdIFJf6t4SGobTfwu6NFLsFtKhd636R7ZnpPacGvQtZkdwYK
 Y1Y9Npon0V1Nw83fN9UJ024HSBK2QtipKA0FvaKmYjFi4XfsbXgilsQ50trPkBwbhPyqF7Eeg
 mB7ASHwMRIjzpyeaRDUtZldniw8RKX+dOJsVwvti/piDfvacD1G7brp+4ezczsOB7OfDNPf66
 XGyAwGJJspRrDLD4L1mXZPOIGTVA0oGNiCaRl1HkHDLlm92ASa3jwCirFpByZV0lBLcyw3d/e
 Fo180Vm6QMv8zJDwIZdaQfX9bqGGlPBDjWWG/51DUQfO2z03jxCNU8D1dWY8brXeAu45zulLY
 q+1QBjiXE9JzNiOc5PGQZtfX4WNG7oO54uBIbnyvBSmGiYorsrxGPkow8s1N6OEeAcFCPvkwd
 kiSUWlZKStvWqsdA0JBGvnvjchxWO5KseFOJldzsdLZUzAwha7crSVc0Sye9a/MOi+WSFVFgN
 gGv+jd960PyZaZj56lvScP5bw0m5OdD++iQWjLdLJ54hlCg9EIspCNbVvCM/Gm2vhaTYI7Hjo
 38x3Ji0qQVWSh4HAhCqmuXEnxT3AMwmbkshQq3rXBZsY9NvgFysdkP66D66a0ALwpA4+tMfkz
 3otd2yeeA7pZs6r4VF++om7YMMZ7yuEvEith6m/a/hTpvmpwb2xBIuSrI7rVH4kRe5e5VJiQE
 hdY0vJjF7vuey/W+vf09mEvgIxEGywCqwyU7ckqU9hNMmsgd1h0N15gHV/zhJiJq+qo6hA/od
 6Q/gapwUHJbCAnudP81i52CHhS0M0OXrCq/XxFySTMYmfGfGuCigBn1rWzeoreZKd0kzbwCXR
 AlBbpa5mNLsgfk1Ul5II8ZNR0qvTKwLZf5niYrtSV7wnP4dLWxJJXZgEm2Mg5Zrhz2SyvTw7A
 O//5nDqKPMWY6KiIl+wTycda0FWpw+LYFnaaRbAj9oGcnH6YE+XxFm71sBedt9U0ql9xTKZVT
 BfWDLoIrLSjIjI=
Subject: [Buildroot] [PATCH v1] package/pkg-waf.mk: enable verbose compile
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Honour the buildroot verbose flag ('V=1') for the waf compile step by
adding '-v' to the build command.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/pkg-waf.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/pkg-waf.mk b/package/pkg-waf.mk
index a593476a69..0239862ac6 100644
--- a/package/pkg-waf.mk
+++ b/package/pkg-waf.mk
@@ -20,6 +20,8 @@
 #
 ################################################################################
 
+WAF_OPTS	= $(if $(VERBOSE),-v) -j $(PARALLEL_JOBS)
+
 ################################################################################
 # inner-waf-package -- defines how the configuration, compilation and
 # installation of a waf package should be done, implements a few hooks
@@ -74,7 +76,7 @@ ifndef $(2)_BUILD_CMDS
 define $(2)_BUILD_CMDS
 	cd $$($$(PKG)_SRCDIR) && \
 	$$(TARGET_MAKE_ENV) $$(HOST_DIR)/bin/python3 $$($(2)_WAF) \
-		build -j $$(PARALLEL_JOBS) $$($(2)_BUILD_OPTS) \
+		build $$(WAF_OPTS) $$($(2)_BUILD_OPTS) \
 		$$($(2)_WAF_OPTS)
 endef
 endif
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
