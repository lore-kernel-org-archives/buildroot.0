Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE306CF9C68
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 09:24:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DAA3406EF;
	Sun, 22 Sep 2024 09:24:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pqRdoamRCu7Y; Sun, 22 Sep 2024 09:24:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E9C4406F3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E9C4406F3;
	Sun, 22 Sep 2024 09:24:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 574EF1BF4D6
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 09:23:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A88D813F2
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 09:23:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cXCqxr1PzIXF for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 09:23:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A471A813F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A471A813F3
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A471A813F3
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 09:23:46 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a8d446adf6eso510703066b.2
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 02:23:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726997024; x=1727601824;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Sm/DDXPO2xPeh95hLe2m6X5Nso22usfjyTAfZ7Z1YY0=;
 b=TYF8LwAXfOCTf38MSBUwslW7++7sPcSkmI3DMSy+YhAWtam7lGu3cvrfDiLE/CA7Ia
 I5E/VzGkkjB6vhMH5tdpS/V7qlOWzxo0Zb9/mlMkzLGRLHQsRrNz/WuhGQn0Cipfsi5n
 Ve8GmF1HsugN4A+O7KZDFYrQZF6lU08FtNrW1hlaX5bPACz2q5OFZBmpEplHQ1/q50Wk
 Mb8g/QqaN1rMMZkGlpYWZCXPQeaCZyF1BxMridzLN2z73GTiVu9QL9daELc/myFGXS79
 Eep/DZbaNY9yNBxO2BRdoFOJqqKKjLBhchHgRBE2mOONDRZZiaXli5vw1jNpmZZb45bH
 usvQ==
X-Gm-Message-State: AOJu0YymhzQOmLofh9RuNuzwpzb6/0Iu5bQYqY9zESzkwiliLZKNfPLz
 DRoxT2zjNQPZVG17Ljwj5L5ysoaB16o/rbFdlSDLvM4tKJiHVJYm3qeDzS+kBKMgL/zCuMwyGCs
 nNok=
X-Google-Smtp-Source: AGHT+IHz+ywGYudgNdWLTj+0jokd/6eYgclB5ejod2B64SUhSBY3LmZe5VFZGWtuqqN0iZRVjuu/pA==
X-Received: by 2002:a17:907:1c19:b0:a8a:86f8:4eed with SMTP id
 a640c23a62f3a-a90d4fbc65cmr834257266b.10.1726997024527; 
 Sun, 22 Sep 2024 02:23:44 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-20-102-52.retail.telecomitalia.it. [79.20.102.52])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90612b33fasm1065235866b.139.2024.09.22.02.23.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Sep 2024 02:23:44 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 11:23:11 +0200
Message-ID: <20240922092312.2061358-9-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240922092312.2061358-1-dario.binacchi@amarulasolutions.com>
References: <20240922092312.2061358-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1726997024; x=1727601824;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Sm/DDXPO2xPeh95hLe2m6X5Nso22usfjyTAfZ7Z1YY0=;
 b=PBwg8Dshn+li5FQIKlfpCMa445cfLimq/rW9z6y/ANUsya08tufpj/n0taAlQjDKPd
 +M53g9xbHS8jVPOD81uGd5xPhOfDFnHN40UYpQpiAhSfmB7MsUhr+Y5RCNHj/SnFxmaP
 1d5PVqyIY40LGnD0Ah2fie2rLhuprCF2nfjVM=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=PBwg8Dsh
Subject: [Buildroot] [PATCH v2 8/9] package/busybox: remove STATIC from
 busybox-minimal.config
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
Cc: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>, yann.morin.1998@free.fr,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Waldemar Brodkorb <wbx@openadk.org>

With FDPIC we want a shared busybox executable even with noMMU.
Static is already handled by busybox.mk for static toolchains.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
No changes since v1

 package/busybox/busybox-minimal.config | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/busybox/busybox-minimal.config b/package/busybox/busybox-minimal.config
index 5d2a30806ac8..9733dd215682 100644
--- a/package/busybox/busybox-minimal.config
+++ b/package/busybox/busybox-minimal.config
@@ -40,7 +40,7 @@ CONFIG_FEATURE_SYSLOG=y
 #
 # Build Options
 #
-CONFIG_STATIC=y
+# CONFIG_STATIC is not set
 # CONFIG_PIE is not set
 # CONFIG_NOMMU is not set
 # CONFIG_BUILD_LIBBUSYBOX is not set
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
