Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55CB7C4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 20:54:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0B6461029
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 20:54:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E0B6461029
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2E4240452;
	Sun,  1 Aug 2021 20:54:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FX_s2wQIV67Z; Sun,  1 Aug 2021 20:54:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 039C040444;
	Sun,  1 Aug 2021 20:54:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6B97E1BF5A2
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 20:53:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 579B440444
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 20:53:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tbnnqu-pNFOj for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 20:53:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7425A40436
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 20:53:58 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id p5so19013534wro.7
 for <buildroot@buildroot.org>; Sun, 01 Aug 2021 13:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TWgsHZVdx3aDeYIP7u5IUHBfhMGc0rlU8dz7B3xhdak=;
 b=LAnlNzSt7Z2SNUjmuAiYBOsxLIU2laZN9Q7dm5me6tP9WwGcByQypGyLNrrdl1+f7E
 qYJcitFskdUApOJgC2BJLVNoN/iVRVAifhgRRhZF8NB3643TxWKEzjJS3v4ahumSYCJ6
 lJhnOhOm4SaMo9HQ0C8zo3UHltyRDQD44W6R/0uuTGe18eACtZawbd2JpTlTMyVdD6xT
 KvQjZA0pjz127FZcAxhlTua8ckzWfTqEnLwFoDVJ+w/fFKO4nkbCnpHsq72nAns95nLW
 KqQBedKEcGOzpp+4nSukU+0vEnqKh0lIb0LJ3/kBj+wxwQgDdWO1EC47mfQ715OPetHf
 Qm3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TWgsHZVdx3aDeYIP7u5IUHBfhMGc0rlU8dz7B3xhdak=;
 b=X2MNfccjtbqP2+1KrA5J3huvS6+G+BUcPzEz9jLbGv8c0Kt40lyNMkgYNUGqFi3VDL
 gtcmyTaVByYNWdFIO8jlMDqkVqG+q4D1MVKH58Pmm2iLA9jaxiVH+aR6tkgeu1p67WIP
 kDcOdSaL/2XVynlph8rcp3SWJo835gzPpfJeyClePRIZ6qxzs8Qkv/TFRW/gmaolnfMw
 sd9qA2/VebTGXHBycFG83VTdKcPwerps3No/cA171hspn3h6NUsW9XeosWf/9n5PMmS+
 JHGXLUJkGWC2H5LRbnCFmd40oEtNHPyLNdonP709yPu48clekF0/e1/RVGoU0VinzwWP
 EmHQ==
X-Gm-Message-State: AOAM530VafnZI+bb3ESFGhldPi249vZbd2PdHg/c9l20XelB3ryhC1eV
 gYU5Z3HMDNuDYcrymkDlClCQMSSy6M3dkg==
X-Google-Smtp-Source: ABdhPJz55AwWkVEBuO2FI8XEOIUXQJPG763jhO+M8niXYMWPYgqq7YUP5Cgcc27ls4hBht25MgKoXA==
X-Received: by 2002:adf:f68a:: with SMTP id v10mr14142177wrp.366.1627851236492; 
 Sun, 01 Aug 2021 13:53:56 -0700 (PDT)
Received: from kali.home (pop.92-184-106-87.mobile.abo.orange.fr.
 [92.184.106.87])
 by smtp.gmail.com with ESMTPSA id d8sm9492684wrv.20.2021.08.01.13.53.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Aug 2021 13:53:56 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Aug 2021 22:53:49 +0200
Message-Id: <20210801205349.76294-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/squid: add SELinux module
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Support for squid is added by the services/squid module in the SELinux
refpolicy.

Moreover, add apache module as for now it is unconditionally used in
squid.fc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/squid/squid.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index b23a8d26ed..68eff82093 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -10,6 +10,7 @@ SQUID_SITE = http://www.squid-cache.org/Versions/v4
 SQUID_LICENSE = GPL-2.0+
 SQUID_LICENSE_FILES = COPYING
 SQUID_CPE_ID_VENDOR = squid-cache
+SQUID_SELINUX_MODULES = apache squid
 SQUID_DEPENDENCIES = libcap host-libcap libtool libxml2 host-pkgconf \
 	$(if $(BR2_PACKAGE_LIBNETFILTER_CONNTRACK),libnetfilter_conntrack)
 SQUID_CONF_ENV = \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
