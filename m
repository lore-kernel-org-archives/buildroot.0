Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F29DCC43458
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 18:04:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A09E9606CC;
	Fri,  3 Jul 2026 18:04:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mJ4h0fUBXkmn; Fri,  3 Jul 2026 18:04:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB3B26077F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783101860;
	bh=mV01Qw26wtF4RnIfHNlwOQtv7M5CiQr490n0b99omLY=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=ReufuYrXmjQwTIsdfj1nhCwMyVRQhOuBbPiF0Wa42sRHzrBOQ8EDmGe0iRAprJhkn
	 NbAMhgrdX5NBt4txXIbQlZ9qXMbMDCbEaxe1zD6OGgLVmYGiGUgIw2Cy2fnb9vfBYY
	 FiUd7m3ya1w655EtM7dK2e9BrjKyWxYg/OdkQCUqbt/f9sv49RfwhWCaxvpBBUOxz7
	 z39XGmytAuaJzfDH/7V59JU2YWHA/d/45axNVo9gIuHlD6MUPR6urCa0XLQp1itEgS
	 VjZESWsApc5U3MQXmReovX339r3WimnZbwhRyYfAvC2LZSeN6YngDn4GC4B+n7X8n9
	 mpe3GUNRPYCQw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB3B26077F;
	Fri,  3 Jul 2026 18:04:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7412D14F
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 18:04:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 51BD46077F
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 18:04:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A31SnX5Zbczt for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 18:04:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0CBA9606CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CBA9606CC
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0CBA9606CC
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 18:04:17 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MG9kM-1wtxKK0L7s-004Or8; Fri, 03
 Jul 2026 20:04:12 +0200
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Dowan Gullient <dowan.gullient@smile.fr>,
 Fiona Klute <fiona.klute@gmx.de>
Date: Fri,  3 Jul 2026 20:03:54 +0200
Message-ID: <20260703180354.600761-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:9gGhawaFCPeNy6JbVAdT5baaXdDDnPIKHIi2w7A4x1eq5uVAzSV
 R//X3rXT04VXtGmSO+kX56xib5iW64bfP9X/htNLllStKnnFcO6wtD5kfAwpsDqjEr7CKYp
 0ZdbvHCuLt8hfFFj9eaD2eaXuHXeuyNwoYZSxvQoCoRDbAf5JIIfnMI8feXSOpKzMn4zuJd
 wwrUBqQs5d6ltYIiF4E1A==
UI-OutboundReport: notjunk:1;M01:P0:XD62oKnt/A4=;Dk1PQFDo4dVTPRhGMpcLVltFVwC
 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
 fDf4JT160orRR9E3VYm4OiZ/LlgiqA+XpPYoel5
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1783101852; x=1783706652; i=fiona.klute@gmx.de;
 bh=JCXrbWeXdBgf24b+sZMZt/R/+VgstvCQnG488GHOxfA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=kEMERh91g8uL51oeyUrt/IaPb1fDHw15wqwlav1flbE+iw1+r/OrXPc+bMeqM31d
 mwGeDPLfxwQGV3QbNVPkPoEe2z8Ckcm154CazF2NxOikr2o0dq+KC3KcMOj6chmlN
 HGX1f6a7ofIGwkyn8ZYR5B55XS/u+BRnlrJoF3qnoGVFPmodpWt3M1NiDDqoi81id
 ZOfad+TGPxZg3Pvk6002bqZM4gchxAU/U9gp45ZPNH9yDiwwNswujpH4Ph4RMbANg
 acHfdQBm+o1Sn0ATDDLpg30YzbYXDPZFwNdJ8c85jgaSrWCIZXse7pNed79NNABgb
 9SHcFk1+O5oqF63xjA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=kEMERh91
Subject: [Buildroot] [PATCH 1/1] package/apr: fix build failure with GCC >=
 14
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The workaround in 3d06661fc1bf0f88356981a44cb93b7b0c76a669 for the
broken C23 check was incorrect: When overriding ac_cv_prog_cc_c23 the
value must either be "no" (to indicate that C23 is not supported) or
contain the command line parameters to enable C23 with the C compiler
in use (e.g. "-std=gnu23", may be an empty string if appropriate). The
workaround set it to "yes" for host GCC >= 14, making builds fail.

However, the original issue was that apr may try to enable C23 in host
CC calls if the target CC supports it. So instead of figuring out the
correct arguments for GCC >= 14, we can set ac_cv_prog_cc_c23=no only
for host GCC <= 13 and leave it unset otherwise, as in that case
enabling C23 will do no harm.

Fixes: 3d06661fc1bf0f88356981a44cb93b7b0c76a669
Fixes:
- https://autobuild.buildroot.net/results/77c/77cd5456169e04c2f92dc328c4b6828513d1195f/
- https://autobuild.buildroot.net/results/7a4/7a4fb2b21027f98df607871d9fe0dd234d44aebb/
- https://autobuild.buildroot.net/results/a6c/a6cef4c5965fdeb40d3b39cbd40941329f4fc1c8/
(and more)

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/apr/apr.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/apr/apr.mk b/package/apr/apr.mk
index e8cf0f309e..f7f7553e54 100644
--- a/package/apr/apr.mk
+++ b/package/apr/apr.mk
@@ -34,7 +34,6 @@ APR_CONF_ENV = \
 	ac_cv_mmap__dev_zero=yes \
 	ac_cv_func_setpgrp_void=yes \
 	apr_cv_process_shared_works=yes \
-	ac_cv_prog_cc_c23=$(if $(BR2_HOST_GCC_AT_LEAST_14),yes,no) \
 	apr_cv_mutex_robust_shared=no \
 	apr_cv_tcp_nodelay_with_cork=yes \
 	ac_cv_sizeof_struct_iovec=8 \
@@ -51,6 +50,10 @@ APR_CONF_ENV = \
 	apr_preload_done=yes
 APR_CONFIG_SCRIPTS = apr-1-config
 
+ifeq ($(BR2_HOST_GCC_AT_LEAST_14),)
+APR_CONF_ENV += ac_cv_prog_cc_c23=no
+endif
+
 # Doesn't even try to guess when cross compiling
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 APR_CONF_ENV += apr_cv_pthreads_lib="-lpthread"
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
