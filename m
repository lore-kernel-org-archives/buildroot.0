Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B136CA5FA5
	for <buildroot@archiver.kernel.org>; Tue, 29 Sep 2026 18:44:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9C5B810E1;
	Tue, 29 Sep 2026 18:44:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ky9JPjioEdCe; Tue, 29 Sep 2026 18:44:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org DEC66810E9
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790707458;
	b=kyBDB90vPcfgtl3gCZSsX6WIeI+3wYZog3vxQc9X2sL9slfDgCiNnFmjc3vZjrqIwo1E
	 0zmJBZJiWqty2FSz5Qi1tdq61zldiVVyDKE9wvxVfyGj12FJhkaAHHAXvBpFNYPtUgHxo
	 DlOFpi1EXYlVggjYtrBzyVaNF+ZYFY0A3ZCUd+4QfXGzRgVZEso9gG4xebMGZuIrTXfW9
	 sj4MXWoUgf2wD0C5nh6ssumXUpT9Eck+CSzA1Sr1IN01bMYNS8x/H3icf55eNRLgGrdbE
	 o85/SYh5jr8PrZfZLN5ajKvCmKS2/MxDHABaVfkG60ubxRDWLBq4UMYrA9uLAQCWR8g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790707458;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ml+Xwy1CX6Nq/4TlQDctN8ywTY0hQCiRmKKF+Gp2MNw=;
	b=OvUvYcQi/D5PqF4kfrBfzpvjm0aTsRuIsDjgAdAxy8If1Rnp4lIEJ5cTcMcvLhe+IJs+
	 sYnlXPiV8L4++UMVoipV3LpPdSmXuo6IIqimP5SmAZwm6N5ALhkoShbhUE+Sq7cNQ/OEd
	 BbCQIdaoDWKq1/e/hd46QQAXvagP14E9sAoAaaZrYvmkzz0zdZ7UJsMdqM5dW3c/99tHz
	 RYNKTB/Ev+KxuX8/7kXDpce6T7bEuTlgSO79xUcg4CtYJOpT168QSAxx6BaD37Fg3PtNr
	 b9zfkMQzHon/eOQSJrbiGc+Eg5xmqcE2YO7AXDJOZTmjYc1WDYYtgn5aNsiG5ZMWLZw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790707458;
	bh=ml+Xwy1CX6Nq/4TlQDctN8ywTY0hQCiRmKKF+Gp2MNw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JFaswsa/FaHl9NbvTGKR2p5tauxjtuphUovPhiFadRHzfF5VsQp5PhIzua5JntPC+
	 +eygh3H5LnM0nhGdBFsSBPAbsvnHD/h7IBD3Pnwy6xeg51ZW4By+KLOQ1K0AJgx1hw
	 s9LckBkejIKZxYogHJlxYyaCSuBs+5pDGgCQz/3imhhIHbvQ1Nr4p91I1iV3Lrnppv
	 dtzkKkdBoeWx5WgeftAJObnKnRx/llehZte4aWiHcaZhOFncFY7ArvosAQac9pO8A3
	 mOEr5aiTxTAXnxZEZnUy5lt0S5yv86F4uvMmAOu9BqDuYuNC6vE2raJfQvCab1ZNkZ
	 6ps7NQtVfjFNw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEC66810E9;
	Tue, 29 Sep 2026 18:44:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F1AB14C
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:44:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 314C2400D5
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:44:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ACkz78-e2prz for <buildroot@buildroot.org>;
 Tue, 29 Sep 2026 18:44:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 43DB940341
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790707455;
 b=IQbwQ+FuThGMamExEwKAEzQx5v5d5I5hVt+U4cgwYUHUcGw2faDA8XqQ2LNmableasQu
 1rBBNLI3aCpLyTM98gaJX5fgrVs/gp1Pg2DcQEZRgzCCtr/rJScDUsWxfqA4S+l6X6Xu9
 pPbOYqUIG5bvNXDEVKnTXXB30TrszlKz8RWKEa5HToqY3vgaNnaZLONnMy72/mo+xlgoM
 m+IZQKmCwxSXlU4UqSDWvBisNjtWtETQieuHz9QxtUmFK62G14HildGdB3hI/TW/wgS5c
 QiB+JocAwAuffl6xeTw13ncOq4eTssS1lmhdutdWZnrzQwt7i82/nssWHVrwNLVlNxg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790707455;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=mv4AC+taowwAo+GoH7Vfw//yu3tboGbefmD/Cqnpr4M=;
 b=U0LssjYe3I8uhdL2E78F2Pjp09c6SLmNeGvrb7DYcMJzJQ1sS7wnx3RbGnhaGv84/4He
 +kNVfQg3oVq1qdcnAgJVxjNPfibz9sa6i+oZoOo3Vmi5DViXE9meemV1Iq8YE6M0t/nA3
 Zf3SK9EKNYaO/zGVaEwglQN63DubfkbZnBZtyd9u4+eEHiTY7RWHxtA+vHdeMFhC7XrtO
 F/xkVhVMvZ2EXPber7hli8RJ1SManjNTMpHG/vN9I+wAf+YzTsv0Vwi8oeiN2T1qAaP/q
 3Fg/vBm5Jbuk9mELKVCbn2K+ldTqgU5gEE8YwGnEEU3m6nPnAhCHHSKJKGxzWsuJOiQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=tafyfd16; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=tafyfd16
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 43DB940341
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790707028;
 bh=mv4AC+taowwAo+GoH7Vfw//yu3tboGbefmD/Cqnpr4M=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=tafyfd162ZmdgSYGObZOcoBeWTcg6DEVCzETeZsC0s475ntezhygFOOqlcyLoMGXP
 3PHBsTEjNjSdtHApQoKpVvoBEvZax8PiLVaQPyic0yJ9w0OQ/F2IsU+2oYCJgTZLiL
 uXvDheQWC3yFnJTYxft9/DubOxXiATLARYQpWllx/PZiNEz8FvSeNcsN+hLPPZCjAW
 VPs0SYMLaOSagp/KPB64vAUMjF5fTNwJoOJ9iN8Lbuj71qc4Bo+Gj7gKKq5Jo88JAu
 lg68gnmjYFkI4TieSXVSUYBe9x08vEeBNciJhwR7I7JIteNdH/IRuSFkq/G70HZ9KD
 M87/eTiCa/cbA==
X-KAS-Sym: v3:f51bdf72230551df:KZDLWOub/TH/AK5rtQNnIZeKpqyWm80A2mWGMYTni0A+L
 HjNTkDkCtyQ4DkCAOMhviGUSy/4TxS7mKIVloV7no54wcHC9RI8b/l10/RLTgbKt+Z6X7PZ3W7E
 9fBoZebHygSJzn/FzCAnQhp5IR94ZsDr6y1D7NBXoRWeUDKW8CBH8dLcTDoptoZUrp9hW/iT4GK
 GYAwJkuB2ZB3gwjXQAhV2mwQgd7HdQHIbq50xQ6Tw4m0yNf6pOvygHgCUrCR0dMMYmRoNXzAz6t
 sLKjYK2O8Qy4vTaIbbYZkiyIa5c4PRU4l5CzgcHpDX92flFRqFNwW10OcwTfm3hMxD9YF0Xg==:
 o0nbrPqrkkgNeP4WNHQ8ZhE9n7ZiQrSp3hQaxzV9k61xuHHLtiyAsMMsCxou9sEXOGmUbzuOurn
 5mCUhn8uGkMIwM8xu15YUU6M4W2FAby9bRSWQQRPbeBb5sm3ZvflhkVyCqIOJwnZDedPtPxMb2P
 pXXDwC0PJO61tQBms01e5t7dwijCfCxbzC7n1aKq+oqlLOZwseC1TREDfqwdTxHzCjmLAl+R90I
 YtNhswtuaoWGfEizK3JspHtW/WXj61xut4dUonDICt9H+++8j7rjMAgVLRvTvsS7BcW2guPSZYd
 w8KfBft39YyuPlWFHO8Kt8Bgq74LdS/HsFh/HleK8EMtocqj8oYqR3RPsFakNMhfpthhpKMODzr
 ldbalNDYdjvQqzKYcXcubYJuRLmhlpJGGjkmxZw2CRpOUC+/aG3cH8kKvmeiLWYwFAJ2HVsnEYk
 Cm5ZcLKRyu0O7FLn9QSKpvW4YoUkm9rz4K2tZIcmw5yAl0nnUDCS5joG/HypmJM2we7f5yZpQYc
 Jwhezur+tovRhPOMQBNQpOxbHGbBu1QH1zHbAcdumBEEwk0FML0KaihJ0g6PUT83Lsovl8bjIhf
 SRmhjGFJrR3Zp3muY6kyOWoG8YZaJeCH+uMk2FCPuBxg/O+8PQ==
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8B3C3A4C51DC
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 20:37:08 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54806)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xBcgh-000000006Jn-42Rz
 for buildroot@buildroot.org; Tue, 29 Sep 2026 18:36:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 29 Sep 2026 20:35:29 +0200
Message-ID: <20260929183607.1849293-31-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929183607.1849293-1-bernd@kuhls.net>
References: <20260929183607.1849293-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v7 30/66] package/xtables-addons: use
 kernel-module infra
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

This package does not need the kernel-module infra because the kernel
module is build by autoconf but the MIPS fix from buildroot commit
1d8d9e8d6cd824b2a43a0b92d71cfb25a3f9300a is not added to _LINUX_CONFIG_
FIXUPS causing a build error with this defconfig:

  BR2_mips64el=y
  # BR2_MIPS_SOFT_FLOAT is not set
  BR2_TOOLCHAIN_EXTERNAL=y
  BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_GLIBC_STABLE=y
  BR2_PER_PACKAGE_DIRECTORIES=y
  BR2_LINUX_KERNEL=y
  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
  BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.156"
  BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
  BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
  BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
  BR2_PACKAGE_XTABLES_ADDONS=y
  # BR2_TARGET_ROOTFS_TAR is not set
  BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y

  MODPOST /home/buildroot/buildroot/output/build/xtables-addons-3.24/extensions/Module.symvers
ERROR: modpost: "memcmp" [/home/buildroot/buildroot/output/build/xtables-addons-3.24/extensions/compat_xtables.ko] undefined!
ERROR: modpost: "register_pernet_subsys" [/home/buildroot/buildroot/output/build/xtables-addons-3.24/extensions/ACCOUNT/xt_ACCOUNT.ko] undefined!
ERROR: modpost: "_printk" [/home/buildroot/buildroot/output/build/xtables-addons-3.24/extensions/ACCOUNT/xt_ACCOUNT.ko] undefined!
ERROR: modpost: "nf_register_sockopt" [/home/buildroot/buildroot/output/build/xtables-addons-3.24/extensions/ACCOUNT/xt_ACCOUNT.ko] undefined!
ERROR: modpost: "unregister_pernet_subsys" [/home/buildroot/buildroot/output/build/xtables-addons-3.24/extensions/ACCOUNT/xt_ACCOUNT.ko] undefined!
ERROR: modpost: "xt_register_target" [/home/buildroot/buildroot/output/build/xtables-addons-3.24/extensions/ACCOUNT/xt_ACCOUNT.ko] undefined!
ERROR: modpost: "nf_unregister_sockopt" [/home/buildroot/buildroot/output/build/xtables-addons-3.24/extensions/ACCOUNT/xt_ACCOUNT.ko] undefined!
ERROR: modpost: "kfree" [/home/buildroot/buildroot/output/build/xtables-addons-3.24/extensions/ACCOUNT/xt_ACCOUNT.ko] undefined!
ERROR: modpost: "free_pages" [/home/buildroot/buildroot/output/build/xtables-addons-3.24/extensions/ACCOUNT/xt_ACCOUNT.ko] undefined!
ERROR: modpost: "xt_unregister_target" [/home/buildroot/buildroot/output/build/xtables-addons-3.24/extensions/ACCOUNT/xt_ACCOUNT.ko] undefined!
WARNING: modpost: suppressed 342 unresolved symbol warnings because there were too many)

To fix the problem we add the kernel-module infra to the package.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/xtables-addons/Config.in         | 2 +-
 package/xtables-addons/xtables-addons.mk | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/xtables-addons/Config.in b/package/xtables-addons/Config.in
index 36a42c7efc..8943276843 100644
--- a/package/xtables-addons/Config.in
+++ b/package/xtables-addons/Config.in
@@ -10,7 +10,7 @@ config BR2_PACKAGE_XTABLES_ADDONS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS # extensions are .so
 	select BR2_PACKAGE_IPTABLES
-	select BR2_LINUX_NEEDS_MODULES # not using kernel-module infra
+	select BR2_LINUX_NEEDS_MODULES
 	help
 	  Xtables-addons is the successor to patch-o-matic(-ng).
 	  Likewise, it contains extensions that were not, or are not
diff --git a/package/xtables-addons/xtables-addons.mk b/package/xtables-addons/xtables-addons.mk
index efd8bd98ce..a3174725d0 100644
--- a/package/xtables-addons/xtables-addons.mk
+++ b/package/xtables-addons/xtables-addons.mk
@@ -39,4 +39,5 @@ define XTABLES_ADDONS_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_NAT)
 endef
 
+$(eval $(kernel-module))
 $(eval $(autotools-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
