Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD079C28B20
	for <buildroot@archiver.kernel.org>; Wed,  2 Apr 2025 16:59:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3A676F5EA;
	Wed,  2 Apr 2025 16:59:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id orzPvAHSDS4d; Wed,  2 Apr 2025 16:59:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09DD861B25
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09DD861B25;
	Wed,  2 Apr 2025 16:59:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C5ECF11F
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 16:59:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ABF5340FBA
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 16:59:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ezlWYrzCUZUu for <buildroot@buildroot.org>;
 Wed,  2 Apr 2025 16:59:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6C6F64019E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C6F64019E
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6C6F64019E
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 16:59:48 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-ac34257295dso286658566b.2
 for <buildroot@buildroot.org>; Wed, 02 Apr 2025 09:59:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743613186; x=1744217986;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V0SfEqi8KuRKRja7Pux9qawpmnvvwg07ycX50kZAJmA=;
 b=i4XcpAnsM2XY8D8iGps9LhTtwJT89oHpmABUiOApCELuV0/I4DE7x75sCllHvDfyDA
 qb4SVmm7fi8ig+4lh+ambRR+5Wp+eozLEvQ4u/J3ZUHDDBuxTTrWicPiwi42miPbzx3R
 nrdV3ds91qIPcJeSQ+ySNHZMAPiMORKuYpScDveY+sm+O0RCSnbf3T+MMfOFBREbB7IG
 hqb4YuUJ4AhUTktGO9dbTwpGcjxFEFWSZfcryMVEd/Y2b9ZlvIc6fj5smkcaQestppZk
 YgXqHKZQj2ziRez9lDFuZ4/gvG6dtxlUbLp+xvpp5aYUEJdDLMod5OsYSWDOVGc/pQxy
 NExA==
X-Gm-Message-State: AOJu0Yxu3vTB5Xne0nY54LeLKlGUonKVyhuo4VLFz9bxa+SLGIRW7ml+
 tXvhdt8QPGzvE8ixTXdlZnJdD6G+l0iNVQoVp0gqQehKbT/9IeqGOFqAv2Q=
X-Gm-Gg: ASbGncsGpWv7aMAuVIv2GgL/gco8cZGnL7ghOw06IguV7hpsnkoGcWpSznXTTuY+MDt
 DXCQStQFhppMw1m2tGt7UdstGu7udU2KFkn+FvRokOT7GmeAoMB4HU6XsB8O6SDo+EmRhmFWjjP
 kXIgXXjVCWWUtipPG804aMq1RQzKDuhHAqpEEi2Dl8gaaVfwuMO4dtYXYbqPe0iZaqiM7PEKiG9
 +uIv80GBy4JHdjDwqMTfJ+/EabT0buZwn3XCqne4hvYUg8aQ1t/7GpEh7BnDJfvldFt7N0hiyeR
 1w+B/xKaoe+oRIQ5ySeR8hhwUdi9BbDGUJYAsOeZhkUY/yHEMhe1fQokZPA=
X-Google-Smtp-Source: AGHT+IFFWLFB2ZRdaklb9mAwlCd6mJkh/SyrT+VxLQlc8eKaHoCWglCC+fEwJUqhXcJV4d17r2WshQ==
X-Received: by 2002:a17:906:aacf:b0:ac7:4d45:f13e with SMTP id
 a640c23a62f3a-ac74d460c41mr1150391366b.13.1743613185779; 
 Wed, 02 Apr 2025 09:59:45 -0700 (PDT)
Received: from devhost1.play.pl ([2a02:a319:a1e0:eb00:92eb:221f:6fb6:f3ab])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac71922ba33sm938093066b.23.2025.04.02.09.59.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 09:59:45 -0700 (PDT)
From: Alexander Shirokov <shirokovalexs@gmail.com>
To: buildroot@buildroot.org
Cc: romain.naour@openwide.fr, romain.naour@smile.fr,
 Alexander Shirokov <shirokovalexs@gmail.com>
Date: Wed,  2 Apr 2025 18:59:10 +0200
Message-ID: <20250402165913.39797-1-shirokovalexs@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743613186; x=1744217986; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=V0SfEqi8KuRKRja7Pux9qawpmnvvwg07ycX50kZAJmA=;
 b=nimPrG4Dr8rjiQ9ogTY2lqS2PIOL+/1b1X2zpD+ijtpNBUkMh/Gl1W9DRoByx69A3K
 OrS9H9qKkJPpvy2CEtN8mhvmpPtAIAA3/xWI3h/oLvE+kZla0xyMhEFbUUeCuKwzECf8
 tKPuktA3zhpaK6RyIZlPUNdzGAiASciPQ1Z4KgpZ8PO20w+zQbQ0hi7mmFRqe+XDSI+d
 OqRUVGNGfNOleRDO/OQ34LocIgQKKr7ebY4FwKLJX0CCNjWPoFb8b2SZdHuJXCr616aZ
 Af3rmFgSM5sFVvyM6qAvflBdwsSOyb5F7MtODok+je3KDnYjr9EN/8yiEgwI3Pe084Dx
 17Gg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=nimPrG4D
Subject: [Buildroot] [PATCH v4 0/1] package/uutils-coreutils: new package
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

Hello Romain and All,

This is a continuation of the work started in [1] and [2], introducing:

- fresh version of uutils-coreutils (now 0.0.30).
- build fixes and improvements: excluding a package that injects the -m64 flag
  and breaks the ARM build, avoiding unnecessary rebuilding during installation,
  adding a flag to enable/disable the multicall binary.
- tests to ensure the binary is present and executable.

Any comments and suggestions are welcome.

Thank you!

Links:
[1] https://patchwork.ozlabs.org/project/buildroot/patch/20230317151802.1242858-1-sebastian.weyer@smile.fr/
[2] https://patchwork.ozlabs.org/project/buildroot/patch/20241208134004.143901-1-shirokovalexs@gmail.com/

Alexander Shirokov (1):
  package/uutils-coreutils: new package

 DEVELOPERS                                    |   3 +
 package/Config.in                             |   1 +
 package/busybox/busybox.mk                    |   1 +
 package/coreutils/Config.in                   |   1 +
 package/uutils-coreutils/Config.in            |  28 +++++
 .../uutils-coreutils/uutils-coreutils.hash    |   3 +
 package/uutils-coreutils/uutils-coreutils.mk  | 111 ++++++++++++++++++
 support/testing/tests/package/test_rust.py    |   9 ++
 8 files changed, 157 insertions(+)
 create mode 100644 package/uutils-coreutils/Config.in
 create mode 100644 package/uutils-coreutils/uutils-coreutils.hash
 create mode 100644 package/uutils-coreutils/uutils-coreutils.mk

-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
