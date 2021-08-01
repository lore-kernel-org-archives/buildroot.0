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
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAE8EC4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 11:42:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CBBE60EBB
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 11:42:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6CBBE60EBB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CE64607B4;
	Sun,  1 Aug 2021 11:42:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o45QGk4JcwZh; Sun,  1 Aug 2021 11:42:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BC496079A;
	Sun,  1 Aug 2021 11:42:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6094F1BF303
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 11:42:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 501F4403EA
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 11:42:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q9Nky1auibfB for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 11:42:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8C90F403E0
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 11:42:13 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 d131-20020a1c1d890000b02902516717f562so9274907wmd.3
 for <buildroot@buildroot.org>; Sun, 01 Aug 2021 04:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zwVym9KyFhsdZKK08dYmVFDpTt7fnfW/zR+MZZf2RY8=;
 b=DS7dvC1u1vkabinxo1bvPH2qvAzKYEPRs44Otj0wpuxKeaK4pE6Z3NvmsOcLOp3gp5
 yPrQo4Et/7dzJaOjWEyhUKYhsV8PDHcKSo7Wos0lvlVouhYTnVkIG/rVrXj+S/ewJDhR
 MNNUWKcirIhQIVCgF+X+LRjcQGoHXnxTitgyIzyURNZAKCDyi7XmW4hz98vAoa3nfC1z
 ENbCiJ5EO8ZZvZ20PosbjfXt920g4Xs+IkuU32ecriizBOPV5GFsAzynaFKV/nHdA7Tx
 cwOtNmEbxG/bvAfk/HwXtmFUGKTJMRXpqnxVOwFQC6yVRZffpmP8M5CGZAg+WvL2E959
 x4vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zwVym9KyFhsdZKK08dYmVFDpTt7fnfW/zR+MZZf2RY8=;
 b=jPJ/G4n5SNB2ujoeNT4KkfXDaAmOE5xcFyun1LhT8Xah+XjzZt2QM9JynYd4IJuOym
 QvorIxFxjq68b8y1J2Wm1xfyMAApkp21XDWmhNx6tIDvwqHpK8uPtSvCUpcUvW9VAQ1p
 gIqUNRDHTphdCAdKQNsT7qOOqpcvAoLPq5186WG8KAU8//vPVEkz1kfspsHzTvS7yyMW
 fE5E8ltPzPQEmojDWZDabtjgh90+Wwl94rvATXJ83ylVJnURlGGQSXqjGK0e/gv2ZB/Z
 MLBk9xzcvC4Zsc3B+cmAup622Fqfo50HfESf6xRMjcLi/dn4F54vt4kQ5+xQVu1S0QoW
 VLeA==
X-Gm-Message-State: AOAM531rbjHWcY1aQzLMhNNwTXjvl3pKBjqLUNUr+RUguc6pNVTQuEUP
 /PZpZh0GmgOGi7gUg8bgEBb+797J/YVK7g==
X-Google-Smtp-Source: ABdhPJzZNkOYFduSVz3gvhXa8slsn8QDHax8kNQPX0N1rcCgDLdebxWJkRApKXziBLa7iyfKPCAa+w==
X-Received: by 2002:a7b:cf2e:: with SMTP id m14mr12105384wmg.95.1627818131177; 
 Sun, 01 Aug 2021 04:42:11 -0700 (PDT)
Received: from kali.home (pop.92-184-116-62.mobile.abo.orange.fr.
 [92.184.116.62])
 by smtp.gmail.com with ESMTPSA id s1sm7148280wmj.8.2021.08.01.04.42.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Aug 2021 04:42:10 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Aug 2021 13:42:00 +0200
Message-Id: <20210801114200.2762991-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/rpcbind: add SELinux module
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Support for rpcbind is added by the services/rpcbind module in the
SELinux refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rpcbind/rpcbind.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rpcbind/rpcbind.mk b/package/rpcbind/rpcbind.mk
index 725075f962..2eee116755 100644
--- a/package/rpcbind/rpcbind.mk
+++ b/package/rpcbind/rpcbind.mk
@@ -10,6 +10,7 @@ RPCBIND_SOURCE = rpcbind-$(RPCBIND_VERSION).tar.bz2
 RPCBIND_LICENSE = BSD-3-Clause
 RPCBIND_LICENSE_FILES = COPYING
 RPCBIND_CPE_ID_VENDOR = rpcbind_project
+RPCBIND_SELINUX_MODULES = rpcbind
 
 RPCBIND_CONF_ENV += \
 	CFLAGS="$(TARGET_CFLAGS) `$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc`"
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
