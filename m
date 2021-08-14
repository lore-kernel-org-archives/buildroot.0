Return-Path: <SRS0=c1N3=NF=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17128C4338F
	for <buildroot@archiver.kernel.org>; Sat, 14 Aug 2021 19:08:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B89B860F21
	for <buildroot@archiver.kernel.org>; Sat, 14 Aug 2021 19:08:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B89B860F21
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54BF5403CE;
	Sat, 14 Aug 2021 19:08:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1jV9fAuXQeph; Sat, 14 Aug 2021 19:08:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF86E403CF;
	Sat, 14 Aug 2021 19:08:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BAE621BF31D
 for <buildroot@lists.busybox.net>; Sat, 14 Aug 2021 19:08:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A9E93403CF
 for <buildroot@lists.busybox.net>; Sat, 14 Aug 2021 19:08:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1CXHMNTaCI6a for <buildroot@lists.busybox.net>;
 Sat, 14 Aug 2021 19:08:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 76D27403C4
 for <buildroot@buildroot.org>; Sat, 14 Aug 2021 19:08:23 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 79-20020a1c0452000000b002e6cf79e572so2748911wme.1
 for <buildroot@buildroot.org>; Sat, 14 Aug 2021 12:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=6PJntklO6AiYl0/OB+KgfgVpq5+EOD+Ymz4OGnn5r7Y=;
 b=csbCoTMhG3WTNPoty8NjI3EMJhC0vOs6o91pW7GxgW84BXQC/AovCSwq0sk8PvBX+n
 wwdJSg823CdKAGKIhwaxNm6okMGJVp7F+i8pX0fjMBs4Xt7CVhh7C7Xjc0ftJbKe7ZqA
 5oZ3HjnMrxvkVmIOuBi+xhf4dEMd9Y7kMJPSQoL3ZkgsrR7PUiYyNMWR35U0iF/W+T1J
 5PFKyiQaREADrGYV6BV2iT8z7LuxGEoSNBBaGO9qEwp0da+cM0txdPxXzK6nCDqbMA4M
 FlLFQ1qGHN52Hkpq5JLrt2FAsJQVl0KFtrWiOt6D78KcqavewKsQa5Mp44pRk7JmSBFk
 XX4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=6PJntklO6AiYl0/OB+KgfgVpq5+EOD+Ymz4OGnn5r7Y=;
 b=RsFq+tUrzUPz1qZPO4Vjw1JwPghydJSN6kxwRqO9JZuexA6iJcq3pUWYKnI7PQptlb
 yzL/hpBAkNjkr5cjYK6SAONE8bOlBzG26CegtUqTBwnJMH5hjWt324bv5wNktNfhy4Kz
 lCTAYIEVDFnc49bkjcKz1PBBpmMppUwA50IQFwhEdKUgEdDaGJ863h5OPqt4U/j4vyxF
 +qcTaQXTa4lvKnOlDGbc/gpGaKeQRLatQXe08CXx+Sy9W3fa75ftF/TKhz7rpoXbMMjy
 8U+PB+SSYUeUzh3nndRpfdfczWe4BlqIwlwI7TyjY3fae2+/DAc7GbRKd3PDEjI4VtGM
 qSZg==
X-Gm-Message-State: AOAM532mHo4oVr0n0Ec8AEVksk2txWu+aCmSPBNPqncKrmrYgdnrDjHF
 hHxkW0kG/sk2lvLG1b4KEWsvDN5XvGQ=
X-Google-Smtp-Source: ABdhPJzgZJrN4RHVljY9kZ2GS3ZsvOXrpJbb0qMx93+jDL4xKN520H0MN2eX8ApM9CegNkwo96VBPA==
X-Received: by 2002:a05:600c:2283:: with SMTP id
 3mr8294732wmf.149.1628968101189; 
 Sat, 14 Aug 2021 12:08:21 -0700 (PDT)
Received: from menoah.home ([2a01:cb19:190:c500:88fa:8cd:d232:f99b])
 by smtp.gmail.com with ESMTPSA id u5sm5480137wrr.94.2021.08.14.12.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Aug 2021 12:08:20 -0700 (PDT)
From: Pierre-Jean Texier <texier.pj2@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Aug 2021 21:08:18 +0200
Message-Id: <20210814190818.24308-1-texier.pj2@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [Buildroot] [PATCH/next] package/ipset: bump to version 7.15
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

This includes the following changes:

7.15
    - Kernel part changes
        - netfilter: ipset: Fix maximal range check in hash_ipportnet4_uadt() (Nathan Chancellor)

7.14
    - Userspace changes
        - Add missing function to libipset.map and bump library version (reported by Jan Engelhardt)
    - Kernel part changes
        - 64bit division isn't allowed on 32bit, replace it with shift

7.13
    - Userspace changes
        - When parsing protocols by number, do not check it in /etc/protocols.
        - Add missing hunk to patch "Allow specifying protocols by number"
    - Kernel part changes
        - Limit the maximal range of consecutive elements to add/delete fix

7.12
    - Userspace changes
        - Allow specifying protocols by number (Haw Loeung)
        - Fix example in ipset.8 manpage discovered by Pablo Neira Ayuso.
        - tests: add tests ipset to nftables (Pablo Neira Ayuso)
        - add ipset to nftables translation infrastructure (Pablo Neira Ayuso)
        - lib: Detach restore routine from parser (Pablo Neira Ayuso)
        - lib: split parser from command execution (Pablo Neira Ayuso)
        - Fix patch "Parse port before trying by service name"
    - Kernel part changes
        - Limit the maximal range of consecutive elements to add/delete (reported by Brad Spengler)
        - Backport "netfilter: use nfnetlink_unicast()"
        - Backport "netfilter: nfnetlink: consolidate callback type"
        - Backport "netfilter: nfnetlink: add struct nfnl_info and pass it to callbacks"
        - Backport "netfilter: add helper function to set up the nfnetlink header and use it"

Signed-off-by: Pierre-Jean Texier <texier.pj2@gmail.com>
---
 package/ipset/ipset.hash | 4 ++--
 package/ipset/ipset.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ipset/ipset.hash b/package/ipset/ipset.hash
index afe83f6dce..9c251be27e 100644
--- a/package/ipset/ipset.hash
+++ b/package/ipset/ipset.hash
@@ -1,4 +1,4 @@
-# From https://ipset.netfilter.org/ipset-7.11.tar.bz2.sha512sum.txt
-sha512  20890de32c17c04d9d3ae42fff64acfe21a252974bee5843ae39bdda707fcef55fde11cffccab9f987bf7e18f5445443c46c50eb854fb6f93f172f7bad07f922  ipset-7.11.tar.bz2
+# From https://ipset.netfilter.org/ipset-7.15.tar.bz2.sha512sum.txt
+sha512  0fc936d971c30a0925c585d506c8840e782fdaeec09bc8fd249e874fe838fa55a4dbb697f6e1423a6769abf07a1ce2195abc37cb641e8e4ad70f1b4c7130916a  ipset-7.15.tar.bz2
 # Locally calculated
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/ipset/ipset.mk b/package/ipset/ipset.mk
index 07f865d4ec..4eda65e81b 100644
--- a/package/ipset/ipset.mk
+++ b/package/ipset/ipset.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPSET_VERSION = 7.11
+IPSET_VERSION = 7.15
 IPSET_SOURCE = ipset-$(IPSET_VERSION).tar.bz2
 IPSET_SITE = http://ipset.netfilter.org
 IPSET_DEPENDENCIES = libmnl host-pkgconf
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
