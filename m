Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB39C636D7
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 16:00:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DCDF83122;
	Tue, 21 Feb 2023 16:00:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DCDF83122
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EwYltHEuBLir; Tue, 21 Feb 2023 16:00:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B6C2830C2;
	Tue, 21 Feb 2023 16:00:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B6C2830C2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 26A121BF390
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 16:00:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F37DE42DD9
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 16:00:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F37DE42DD9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w_2pMQnXx4ZE for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 16:00:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71F4F42DDA
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 71F4F42DDA
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 16:00:41 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id r7so4805083wrz.6
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 08:00:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+THbVI/eEZINj65NEZ+0YByZ093wsKTbxLqahIxYbVc=;
 b=qnPzFGmWuesjLFUbe+lwaMiam2+VfIXjGM8XjfmIDYRlFYHw/hSBAnCWHiYcvR0oHs
 kj6WxqJOsXpfkXguA9kXIz8P0W/OjJY1Ox3+QBRknMHNGBOFFtnlu4Y6jRHe7YdAYa5N
 J3cZgEj0VNm946v4je+GMNZp1NTlbQ8xi7ujRz432pSuNYNq8SZkHpPBLfkCL3qAWp7h
 cpWqTvkNNmJvBV0V7xL6NhkiRBMUuQ1VQXl0dFyadkUouNm9F+V/rK7OWJakXJl0jWHw
 44o+ZS/eenvwmy0OZQy6+BTxiAZc4XoCMX8Rb2hVsfRcAPWlxC3un7hVLxv23jsFFqlw
 hpHA==
X-Gm-Message-State: AO0yUKWNuVT+W64a7F6RbL+YKSqEjkVxgXDndw7mj3dqk0Ea+PbxrFNP
 roeUnv6Yj57OK4iq1LtCdcLVt6U67eA=
X-Google-Smtp-Source: AK7set/11kw2ZzIvSSdul0u8Ac+q3ddZMILani5NnBOmlsRzKtq3LbBJd617IgdsP3ibjA2SXCsVxQ==
X-Received: by 2002:a5d:65c1:0:b0:2c5:a15d:8c34 with SMTP id
 e1-20020a5d65c1000000b002c5a15d8c34mr3840090wrw.25.1676995239257; 
 Tue, 21 Feb 2023 08:00:39 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 u13-20020a5d434d000000b002c55ec7f661sm3779248wrr.5.2023.02.21.08.00.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 08:00:38 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Feb 2023 17:00:36 +0100
Message-Id: <20230221160036.2903448-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+THbVI/eEZINj65NEZ+0YByZ093wsKTbxLqahIxYbVc=;
 b=kflu9WhJtCRAbnwQFUGX9wUmZwC1EWYqji1X3RGmQ7LNnkSR+eTZLwkdGTrYzSTOtc
 zlY5raOhZwlu1RzYKirXjXE5bvPXjYCp15n6D9XQ717XxPvhh40e55wBmjlBYR8VKpZ0
 ccjzFgS+2JYhOOZfN1NucnRrVopIjldeml301++vl1hvZOEp2p27/ESdi573OetgzDZL
 IYHGZtTrwbMVPn+kV+Cv91pL070mmf3QDCGkk7Fe1T6a3/YWtuve3Nj7fD/wKAbNrmEK
 Fbt54Fv0SPKbkx5ZK0KGT5LDUqYGFSenPInXlO3uDRoCw6mS7RxPzxT8jZVxxeZShhRB
 xccQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=kflu9WhJ
Subject: [Buildroot] [PATCH 1/1]
 toolchain/toolchain-external/toolchain-external-codescape-mti-mips: disable
 gdbserver
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure:

>>> toolchain-external-codescape-mti-mips 2018.09-02 Copying gdbserver
Could not find gdbserver in external toolchain

Fixes:
 - http://autobuild.buildroot.org/results/ead304285a9cf32bf6b9dcc7fc30acece25ec680

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../toolchain-external-codescape-mti-mips/Config.in              | 1 +
 1 file changed, 1 insertion(+)

diff --git a/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in b/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in
index 8217ddc38c..720d705d14 100644
--- a/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in
@@ -5,6 +5,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_MIPS_CPU_MIPS32R2 || (BR2_MIPS_CPU_MIPS64R2 && !BR2_MIPS_SOFT_FLOAT)
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_7
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_6
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
