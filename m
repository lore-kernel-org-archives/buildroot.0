Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD171CCF2DA
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 09:38:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8429760762;
	Mon, 19 Oct 2026 09:38:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RPY-14rwxiaA; Mon, 19 Oct 2026 09:38:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CBBED6075B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792402732;
	b=meOqmn2v2hzaCsbXpfCl2XxkhQA3jGMu6lmBIZ5HLsJR8D0hNMbexiP6WM1GxQzQ0vTp
	 yhh72XXym/1AWK9OKVO6Ben+Fuamo9ZAy4Tp/Fhl+cEFLN1fBGTvuXgya1a9FxNtT1+gN
	 2hCSvqIQXBxne5UVOS/tsc2iTlcLtnWFa4UUd7HwUCzFNrA5K7VubKn9wflUVBnVVZGdf
	 Yo9Run0YNfYqrdJI0/QBzZqp8IdEwInUJJFgN6/xiTEK6U2ni02BJzonoZdAPjSHSLyIE
	 kW5aeu5pklQafbymil8PNLBOVEwtY2aw+i5XIvEnYVKCrQObL70FKDi3UfFEOcoPgrg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792402732;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=NtmVC7eJktyGT6AO8svpHwSbDO4Id5IpThdWBqrHDI0=;
	b=fM8d7eEqMhKrP7WmC2DDcERXpxdpB3a2Bk1kAnN4Xb5lhnyo8JPEN3e5JdWMQfFpdXNW
	 smHUixUZMIJnFj8SHauLA4ZqklrmmpmxXcFwrehEtZXlDgsYzK+9CYpjas/981MhKaqHb
	 0i5pKSMKwA8yDjjf40Jg2LcIRjaV7kWcxuaSk+RWsNj3+0gJ7xL+smRVNrK1GVxrFxO43
	 0R65JxWBgW8cS8bXM/9alrNKkijltUUfO9E4vObPNPqy3z+/Ug5gs1h4dA7LdisTajgrl
	 2/z7PS5woDxT+7CJmq35o1ldqTQhdDBcYg3wwyhJrShVKfAvMlokpHz0W10rnPE1Rjg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792402732;
	bh=NtmVC7eJktyGT6AO8svpHwSbDO4Id5IpThdWBqrHDI0=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FwDOFwMToyvdQCzBxbWDqe0nuQslR8reDBWtn6crby1X9ZlwXFZShiiLFK2bnsCnH
	 DCNt/5qHorB8L9wDZr8XW2BaHQy7o2x5hLxQQXri/9QeASzMg60ZuuR2Qe5ulJDrIX
	 cejuqIpYKpvfGoQja0mO9GuneXGw++uX75oOOSM7a8P9GsQl1PB3lW1a1PX4dYKRBm
	 tJrCrGtz1Yc3X7235akeuZiOOHhUkjUtYR6zBBHRqh6TLPt+CrOHxLMoj+m5U6mwIv
	 TmaYgM1cMxQ6yhK0Xx/PuvXKjqUCRRzEbl4WtigHCgr1BdPriEhSrsb06AVPe9HmDQ
	 M5RlLO6Wqofeg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBBED6075B;
	Mon, 19 Oct 2026 09:38:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D26023F
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 09:38:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 53884400B0
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 09:38:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YfZk-w5zMI60 for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 09:38:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 857E64008E
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::132c"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792402730;
 b=cYWZjZNQUmCfYbIwbYnmt034/j2e6lByOSMEA38ywzh+ouN5Rl4mNBWX9BB+gAcFYLv/
 Cg672eevFK21mKPnLttjaUgOw7g7BgvcQpUY5ijjglFStcUjTTP/Kv1spfetrEmvklxnb
 J0TMuVFf8geCw+Ey0teFVEN1AtV+OBQCSgRJVrPdFR4QaweAMoNvuVeABJf82eiJhRVji
 OMmYhivgbpu/vAy/Dz2knlx2utg2JdUnpmHBfKd7MsyQV3UsXUo5r7+Ljekl8juOGlY1D
 ym25J23gVf5fiiL2vMMaOKRPHjUueU6J/LSIvazz65XOo42Y8haZDFk9RPpW3KcLE7g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792402730;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=O/0HYSfFeeVLObMOtGlHDwPpQFdDKE11oZXzA4ecJpA=;
 b=ZdfHjt0nnQTXgIcqxW4jqc9fuCgjrE3nLxN55EHoiLerE6NeG5UAYvu4qSk7TnUkSiDA
 C1nuGxK4dR8CUOqDmpuJYOEJGZjLepoMureVLaqdZo300c0EICXOBtkjjYfB/8CLSD519
 bj89/OL0ICh2RCrrO+I/6h6d0WXvxJJ5TbP03cMgfS0Gytr1r7teuADnmwVch2sVz8Wkn
 qvl/P1h4nyYoZAzxFkf98ylU8BD3erUsCfBOyqsPyJ43FksIWoXuxV8SUwLBUN743pXP8
 7N+w0rNDeS9sOpmF8QB4nP3dZQCBfgWXtzTAaKI5XQy7jyinMNSOZdwEcotk9+Y5FiQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=eEtAHZP5; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::132c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::132c; helo=mail-dy1-x132c.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=eEtAHZP5
Received: from mail-dy1-x132c.google.com (mail-dy1-x132c.google.com
 [IPv6:2607:f8b0:4864:20::132c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 857E64008E
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 09:38:49 +0000 (UTC)
Received: by mail-dy1-x132c.google.com with SMTP id
 5a478bee46e88-35cd4e8bdbdso4738507eec.1
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 02:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792402729; x=1793007529; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=O/0HYSfFeeVLObMOtGlHDwPpQFdDKE11oZXzA4ecJpA=;
 b=eEtAHZP5UAIiNCik5HNkkok0XxYTDQB2bNNsWTx0/5IVyA6+/3GvYrQ/2q8kAAPTiF
 Pc+l2IGC7tuLmzuQhJSTaFp2RNoyajuHYtC+lPiOzw/8ouvwCwbLup7EJ8QQb3leoJDU
 2QxvGmTZdj8JIqFmUuaZ26XUIZlqWNAJQ1pqfOrNAgCxgopVHJHp4swS8MYBm1M8dtoh
 WZ4Ewoy840ExDHvbPkQoFXFxnzWxoZMVUDnYFedFGj5YdctcV0Espz/ATg0RmF9pXexj
 U0FB/MUKsEf/HSu/vYPXK9aOQ78PDHjSukVT3wFkpbLBpq80f1oRGwlhSyP0ycFxO69u
 3DnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792402729; x=1793007529;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=O/0HYSfFeeVLObMOtGlHDwPpQFdDKE11oZXzA4ecJpA=;
 b=x2RqeAzgLMmOwGY/N/iSawF9aamJ+dDR1AMs5UIQRQpNtLew0si+dDQVATahg4RCSF
 hit3Q098z60ERUEbobu7yrBR+KVCIyo2V2cR/0Sh18o/LvZCS3ebgEmjM7ei57QzaBEa
 xk0Mwoss820l2BP8FRGab5AdBUsEzILa+RbDqyNcBWoPSOhGBVQlotNy91EfECpuaB3r
 KzylmBG5ZoZjUDk7O9iYzvHJ/m8iSPGIlAxse4XCUsKE8bSHu7DlpTcntuaiPa+M5wtB
 /EcTwh6wnZ5I5lWJ7qdgc0ohs532AcWchG2YceLHPwZac/UONtyam3VNi4QAU/Emd7Dt
 YKDw==
X-Gm-Message-State: AFq9FYKzCnGdokle3mg7xDJzQpKKQD9JA8IeFBUzn6g6WYln9AchkQfW
 X9Q9Ii+1vyOsT50iLga16aACd0F8FaP7qursDapCeElesp/ziqyiYiwgflnGpZmEFm4=
X-Gm-Gg: AYBFou3KTMEoJAyGyJHWkiHYpH2kgMw80ZHBzrKqy3hZ8C+FY/nrv0SPnPlcLmtxhGl
 IWs1uLa4rNRdUwwoXC1eLTxE2znzAKL82WalKEZ9oHs1rknUpUDnxLbIzoXB92jMaecDOFpbsgy
 0FhDzB33o7Bk2R5kPV00RfI5K3U/Dg4epY3Q6hbTLwmwbxajEFk7vNUH1nRoU4yB3veOdeG5MHM
 66HLz+MD/VWQs+ioNdWEPVBgLs56r75i9P4hk2N024TeUHStnQNZ/TKOmsv+2RezKrGsH5kaXXi
 7ULBJiTPCID2iDT3UbZzW0nrsXUGD0JDx6fLLf5YpHarKhgcK3W1aDz17psPGoJx6J3QuiZvmjZ
 BawtW2Fq6nU0AAy09KsoVXlpqeB2zQ6gosO7W4nXruaOoZdxItnuuftZtLc+5Xs19olobJxP8CY
 hmPosDzG2rpUlQaGbxa/reOvbtWuSTJlNLj6HmxX0imlbJHMweN/yjmBrs00iAZZOfu6uiHJ341
 EPUMuLhAyshW1FfqYtJhjqcN781v+Ae
X-Received: by 2002:a05:693c:83d2:10b0:351:8cc4:e18b with SMTP id
 5a478bee46e88-361a2053bf3mr11960778eec.20.1792402728872; 
 Mon, 19 Oct 2026 02:38:48 -0700 (PDT)
Received: from fedora.taildae27b.ts.net
 ([2405:201:9008:10c1:dea5:be99:85df:68ae])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36082a7b33bsm56489599eec.24.2026.10.19.02.38.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2026 02:38:48 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Shubham Chakraborty <chakrabortyshubham66@gmail.com>,
 Davide Viti <zinosat@gmail.com>
Date: Mon, 19 Oct 2026 15:08:37 +0530
Message-ID: <20261019093840.104537-2-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261019093840.104537-1-chakrabortyshubham66@gmail.com>
References: <20260810113154.1955756-1-chakrabortyshubham66@gmail.com>
 <20261019093840.104537-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 1/2] package/tcllib: bump to version 2.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump tcllib to version 2.0. This is the first major revision of Tcllib
after the 1.x series.

Key changes in Tcllib 2.0:
 - Adds support for Tcl 9 (Tcllib 1.21 and older do not work with Tcl 9).
 - Drops support for Tcl versions before 8.5 (all packages require Tcl 8.5
   as their minimum runtime).
 - 440 packages updated across 131 modules.

Update the site URL from http:// to https://.

In Tcllib 2.0, upstream changed the Makefile's default 'all' target to
'install' (to install Tcllib and optional Critcl accelerators). Since
Buildroot runs 'make all' during the build phase when DESTDIR is empty,
this attempts to install directly to the host filesystem (/usr/lib/tcllib2.0).
Override TCLLIB_BUILD_CMDS to a no-op as Tcllib is an interpreted Tcl
script package with no compilation step, allowing the standard target
installation step (make DESTDIR=$(TARGET_DIR) install) to install cleanly.

More Details & Changelogs:
 - https://core.tcl-lang.org/tcllib/doc/tcllib-2-0/support/releases/history/README-2.0.txt

Tested using:
 utils/test-pkg -c tcllib.config -p tcllib
 (Result: 6 builds, 2 skipped, 0 build failed)

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 package/tcllib/tcllib.hash |  4 ++--
 package/tcllib/tcllib.mk   | 11 +++++++++--
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/package/tcllib/tcllib.hash b/package/tcllib/tcllib.hash
index fe0ece238e..b7e8e7b335 100644
--- a/package/tcllib/tcllib.hash
+++ b/package/tcllib/tcllib.hash
@@ -1,5 +1,5 @@
-# From https://core.tcl-lang.org/tcllib/uv/tcllib-1.21.SHA256
-sha256  10c7749e30fdd6092251930e8a1aa289b193a3b7f1abf17fee1d4fa89814762f  tcllib-1.21.tar.xz
+# From https://core.tcl-lang.org/tcllib/uv/tcllib-2.0.SHA256
+sha256  642c2c679c9017ab6fded03324e4ce9b5f4292473b62520e82aacebb63c0ce20  tcllib-2.0.tar.xz
 
 # Locally computed:
 sha256  38e1f556213f4008cfd280457af57c76a1fe043dc026ece1c704c09b5f6e865c  license.terms
diff --git a/package/tcllib/tcllib.mk b/package/tcllib/tcllib.mk
index 1f2b575b29..37745041a1 100644
--- a/package/tcllib/tcllib.mk
+++ b/package/tcllib/tcllib.mk
@@ -4,12 +4,19 @@
 #
 ################################################################################
 
-TCLLIB_VERSION = 1.21
+TCLLIB_VERSION = 2.0
 TCLLIB_SOURCE = tcllib-$(TCLLIB_VERSION).tar.xz
-TCLLIB_SITE = http://downloads.sourceforge.net/project/tcllib/tcllib/$(TCLLIB_VERSION)
+TCLLIB_SITE = https://downloads.sourceforge.net/project/tcllib/tcllib/$(TCLLIB_VERSION)
 TCLLIB_LICENSE = TCL
 TCLLIB_LICENSE_FILES = license.terms
 TCLLIB_DEPENDENCIES = host-tcl
 TCLLIB_CONF_ENV = ac_cv_path_tclsh="$(HOST_DIR)/bin/tclsh$(TCL_VERSION_MAJOR)"
 
+# tcllib is a pure Tcl library with no compilation step. Upstream 2.0 set
+# "all: install" in its Makefile, which tries to install to host /usr during
+# the build stage when DESTDIR is empty. Override BUILD_CMDS to do nothing.
+define TCLLIB_BUILD_CMDS
+	true
+endef
+
 $(eval $(autotools-package))
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
