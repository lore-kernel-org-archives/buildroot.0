Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 052A3C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 02:32:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2005B61002
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 02:32:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2005B61002
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E32C140368;
	Mon, 25 Oct 2021 02:32:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o4QYQwSyXNG9; Mon, 25 Oct 2021 02:32:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 362E640322;
	Mon, 25 Oct 2021 02:32:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 649671BF378
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 02:32:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 616EE80E34
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 02:32:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aol.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZDg4KNB36xIM for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 02:32:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from sonic301-30.consmr.mail.ne1.yahoo.com
 (sonic301-30.consmr.mail.ne1.yahoo.com [66.163.184.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B1F2780E31
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 02:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1635129132; bh=4wBn3RB5qhuig9+yqpAp1IgllzcR0pBlZ00exWhRoho=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=jSM90DohLoFEdOOk0wCR3MQUjZ3ihsTFd5WEv/7kmwJx10rSxFmDid6swJT3JbxPqvMPj7yij9Zx+nXOz0DiZUwkqq/WBGCwlEwuTSVB/9/yyG6lSBwy6aC9vBvLDchjj7/8REwKprONyxJaOlEVlk3t1z8i6pOpz4g0NayYlh/fAOJSzoISPqTdWuOqRKHrI6+haQWIjAJXC4yNw75U0oGAxBLlIH4I0VxVa/C6L8dz5nLHl7FDQDkNk7o5GdJidyT9cT089F48E83+C6rxSW524S7mTm3NWse/9ogOKKg2GsVCZa385C5yJRirke2FX13BOApDFlTtmcGNNN2wNA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1635129132; bh=O301ioNrLYvIUVMX/xITp0Y0UlxLHTouLBG/cxUemGb=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=koespfs9hUGHBiM/QtzfIUxdCJbwLQIJ1qh/OFjzYN91Xw4b5BQQrzYkqe6U/pNt12lqgzx8+4vd5YMfgndRMcWMLjfOjrebBJFtzksnfpocH3eKBPhMBRdaZh1wdXRKo8Eq0u5ZSRPeHZ/bug+gIFrPx6HdcCr6DlMQ+GJVms/T+SbfDrbgAbDxCTdWOUdurUgKzIO47MJQSAc0b/65RMrVrQb7+xmmK2Er6LfxH6q6rOw/PNYRXcCItyuuEJNBsWsWxXk1xIwJUfbmw+3pDAFyq5DPwyz1RPIHTk/mRffOErRHhbGQNuVvGowP8RqH6XGleuXblq/PNevOggvSIw==
X-YMail-OSG: UoKfAeoVM1nrc4bF.TflFUGeWqHMkpGXnaZ14brhz2MfnRi08YU78pKHVww3gM6
 xv50udXcQC3_gV_qi3_K7giEtpDNPATqVPPUlWmpwSmu5hZBmnB2qgwR5rVm.5OEOccdI2budv24
 CgF5g9uz.vfW_gpV.lU9PQgRcb82cvPhmF.vhZHp3RvTVxnymjvaSYxiz5UO3Mh1z5kEXqC_XRNM
 pzeZ5Y1lpNQGIqihK.BmgamX8yz7Emr5NmqDA5QZM_QDADS9oaFoxEgc0NKy87DPsnkCWND3YSsE
 BM.sVgfHTBpSKvMXP.TDHs2DAHKIW8AucgBXpiwqPSPKdXmqL0TTo_EJG18yp8Zq3sgx4vmUvIqA
 svDe0NKOQlAUnuGs6aBZxy6SASK1JKQGAieFBat2zfrXKFSDpZph4cg5DsZioAzIuJSwO9Jb9JBu
 9Twn8NkAWq5ZG9w0VAh5VdLG21vLiWKjFf6vtX.NWAKIkcmmXJwgAlgjO7zGgOI0MIOQrTNMYibx
 tU9DhWqfBr1ssGqlCvsxd1KXNKkKHLGfTUeg4uQPSCrU7cQ9v6p1AN4VOdU4A57O0H2AD2cO8cUh
 XicW0Xk9oJ1EGSUkVK.CxP.eexAlaB1379eG1WsrOf1y2jX.6F0dUTmU2E1tqXbLTh_11y0BW0hx
 A3OWO4w_mR_AFmg0zoKY_bay9aSMWI4vdwhqlQzkScWdApzxStA3zAqkdVNLUnA9950COUxnPKF5
 3DbQvZo2_ICMEzfPX7SgU1llQshE8UMm7mPqFFkIcSZezjzvoExBCfOEYiTtRi.ip_JofnEp8Uyg
 sYmMMJM.RxuQ4TWBG1ojeo_yUurHQyddxU2RpwjYXca3mveaAoy_Dw3HSh1CkkwYVMmIQUe3Pu9p
 R47Q5YFOyMQblKFLCvvN6s1jO.UMO2djux1MKHwmrDSOCz4sIn6cMu_hryWyMKNWBs6QcLkzx2bN
 kPMO2BZdIuTjHHzNimMtv9tsXzSejcrH6ylyaXSCTqLARI2XzrxsvNOoxASucZuMvf3cxnq5CWyj
 alzxoDVa2R7nZ467_EBqx4GfndOZWqKIoadtpkY7Ek23UC3sofojr.gLnIFQL5.735zoKyS2dEXj
 5_ch.34vdy5nmiky4c7UxZyogJE2o14tuN57Xz9CDZGER2ryKzb93XUftTyC8rvzpHn8bClCzwB_
 l0pL0IWIQsqG84Qe0r.5VFJwSSdpQNE_Ho51F_QF.q52ngOKTVhcBoCkdTm_FYMuJTpDQIXwPr6y
 DDx7YJVXZ48eXvhScffW7bsijHd0HtlFqdDv9orBzzFyYIegjpvS1FsYq5UqtzTg9iR4g0S0qE5j
 l3wRvDgaXwyDOkhoGlA8mg8vm_o_fUTBQNv05M.RG7.Ecj_Q3IosS8OBnl77Tgzz84q9UwZm.bsx
 7Wrg6WekhljwbE0zftZeJX.1zEibQsDMvTadqz3Zdg3s3O91AJHyJ0.GvezwX5PjQ2DLDbrLArjl
 SkEIvBE7Shrv72LN3M.C_jH9HHNz89B2a3LrASHAyBc0Ve8UI2O_L5iTZgTjfORuFFKk_dTTvVyW
 nZneqio9D.oPX7xCktWU.lKCuPQNMW39E1s8E5EQwOYjh_sJBJzZsM2teOPnR8sEH0emCwW4NozT
 uNQDNwLboYxWKBiP2t9OcGfRZYehZOhCJ8zxXpUXdF1Ji1vtpH2RH0lOUPMJ08rSUNt6TPajBoQ7
 kfQrYA2T5ZgCY4m.yeuBGtWQNPl6gq_AFxZco3Qw5IA.DjEQTylgpg1USpyTHP3lOScpFHTpbPuA
 iVa.BJVcFIbOeT2NsnndkJ3bLN1gVQTR5e_eyOolsWFKEcd4rfcjzcLwPYptDGokEnxKI9Kf_n_u
 M.UCu0.ieXgdbptd2LyyaAx4AqQ.OB.ezgMyKd68vEH2net69ktyvlU3HElMxWbP6gGnEz4jWjrk
 CUpOt6cLrcQ0MzokZOjBbd05uT77qYCbs27a6aGfvLcY7.GY10bYWkLFgB8ifi1veq1ug8Fau8Hg
 rKF6aLt8i22EzAwtcgjPl7B2g9s0vMYM9RGJx6arGiiKS41IOWS4nurVdFlddtpd8DU.yUylhro8
 2OlaYJs8J2zZDEAjFFveKfJeF2manlob1TnUMOt1h66D9.XQOUx4.JhtJycNOMhAW_jyZ2sU1zwt
 DP4lTMfWWDAmwfntsG7OPSncvqR7RhM0I.P4QNjBxKXe11juFZ_yTrP6ExaEx6ZQj59cKcGIH.we
 iDA--
X-Sonic-MF: <xiangyu.chen@aol.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic301.consmr.mail.ne1.yahoo.com with HTTP; Mon, 25 Oct 2021 02:32:12 +0000
Received: by kubenode538.mail-prod1.omega.gq1.yahoo.com (VZM Hermes SMTP
 Server) with ESMTPA ID 8431685fae607a09bfd078d560945454; 
 Mon, 25 Oct 2021 02:22:08 +0000 (UTC)
To: buildroot@buildroot.org,
	thomas.petazzoni@bootlin.com
Date: Mon, 25 Oct 2021 10:21:46 +0800
Message-Id: <20211025022146.2556-2-xiangyu.chen@aol.com>
X-Mailer: git-send-email 2.13.1
In-Reply-To: <20211025022146.2556-1-xiangyu.chen@aol.com>
References: <[Buildroot] [PATCH] boot/at91bootstrap3: add svn repository
 method> <20211025022146.2556-1-xiangyu.chen@aol.com>
Subject: [Buildroot] [PATCH 1/1] [PATCH v2 1/1] boot/at91bootstrap3: add svn
 repository method
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
From: CHEN Xiangyu via buildroot <buildroot@buildroot.org>
Reply-To: CHEN Xiangyu <xiangyu.chen@aol.com>
Cc: CHEN Xiangyu <xiangyu.chen@aol.com>, spdawson@gmail.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since more and more traditional companies are starting using buildroot
with AT91SAM9x chipset as their product firmware, much of them are still
using SVN as their version control system. So add svn repository method
to AT91bootstrap3 package.

Signed-off-by: CHEN Xiangyu <xiangyu.chen@aol.com>
---
 boot/at91bootstrap3/Config.in         | 12 +++++++++---
 boot/at91bootstrap3/at91bootstrap3.mk |  4 ++++
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/boot/at91bootstrap3/Config.in b/boot/at91bootstrap3/Config.in
index 650d3a23c8..b3e18fce7c 100644
--- a/boot/at91bootstrap3/Config.in
+++ b/boot/at91bootstrap3/Config.in
@@ -30,6 +30,12 @@ config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT
 	  This option allows Buildroot to get the AT91 Bootstrap 3
 	  source code from a Git repository.
 
+config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_SVN
+	bool "Custom SVN repository"
+	help
+	  This option allows Buildroot to get the AT91 Bootstrap 3
+	  source code from a Subversion repository
+
 config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL
 	bool "Custom tarball"
 
@@ -39,7 +45,7 @@ config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION
 	string "URL of custom AT91Bootstrap tarball"
 	depends on BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL
 
-if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT
+if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT || BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_SVN
 
 config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL
 	string "URL of custom repository"
@@ -47,7 +53,7 @@ config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL
 config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION
 	string "Custom repository version"
 	help
-	  Revision to use in the typical format used by Git
+	  Revision to use in the typical format used by Git or SVN
 	  E.G. a sha id, a tag, branch, ..
 
 endif
@@ -57,7 +63,7 @@ config BR2_TARGET_AT91BOOTSTRAP3_VERSION
 	default "v4.0.0" if BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION
 	default "v3.10.3" if BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X
 	default BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION \
-		if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT
+		if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT || BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_SVN
 	default "custom"	if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL
 
 config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_PATCH_DIR
diff --git a/boot/at91bootstrap3/at91bootstrap3.mk b/boot/at91bootstrap3/at91bootstrap3.mk
index 1e2a3a44b0..4bbe7cc718 100644
--- a/boot/at91bootstrap3/at91bootstrap3.mk
+++ b/boot/at91bootstrap3/at91bootstrap3.mk
@@ -15,6 +15,10 @@ else ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT),y)
 AT91BOOTSTRAP3_SITE = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL))
 AT91BOOTSTRAP3_SITE_METHOD = git
 BR_NO_CHECK_HASH_FOR += $(AT91BOOTSTRAP3_SOURCE)
+else ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_SVN),y)
+AT91BOOTSTRAP3_SITE = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL))
+AT91BOOTSTRAP3_SITE_METHOD = svn
+BR_NO_CHECK_HASH_FOR += $(AT91BOOTSTRAP3_SOURCE)
 else
 AT91BOOTSTRAP3_SITE = $(call github,linux4sam,at91bootstrap,$(AT91BOOTSTRAP3_VERSION))
 endif
-- 
2.13.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
