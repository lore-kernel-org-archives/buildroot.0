Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B93C87FCB
	for <buildroot@archiver.kernel.org>; Mon,  4 Aug 2025 18:06:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65633822E3;
	Mon,  4 Aug 2025 18:06:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XZ5Q_W2UJGs3; Mon,  4 Aug 2025 18:06:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 906EB822E9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 906EB822E9;
	Mon,  4 Aug 2025 18:06:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D63F4118
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 18:06:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BF93361333
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 18:06:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xTojnjCfMUfi for <buildroot@buildroot.org>;
 Mon,  4 Aug 2025 18:06:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 37733612E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37733612E7
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 37733612E7
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 18:06:22 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-6154d14d6b7so4144081a12.2
 for <buildroot@buildroot.org>; Mon, 04 Aug 2025 11:06:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754330780; x=1754935580;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bNjvlCE0WFudl+OWsJZlOYiOChbs+QVefRRRwFY4UcY=;
 b=AdZNgUaLrVZ5hLzkE/XGHlNgzi8ovA2ri6pL8aHx6A4ErTW4hNXXHRpcjS5zCc/jVp
 mmsithIptkyMbymwPs4arV6hOjorsbn4vEyY3Wo7VRN2nUdjHeRiN/Yzh1AJkeq+PIAU
 ghgX5kwZ85VmWRSRCk9q+TwNvOZfV0wIK0ch/SQ5gYvxO/NC4pJIYfiHl5SRNfkJ5PKK
 F6mCLfHuQUxhdgO7A+vzLVkVJ1g/NIpmrOmzLyYqAvuOiXgLBbiAxf5idF56JMk+dXSd
 y0PPqhDIMUcL0VlKxX3buNPttVfge0nX+mNzhlHe5okM43GUpEPXRrgBhttbT8L56LWl
 Vqfg==
X-Gm-Message-State: AOJu0YzlK9whZjgiGD79ZKdQOWPyrwIID9RhOXqUoM/oAnd657bhEgR9
 ynJhKuoPj7s3meEAkfhq4dn2Bq4m4RZ5xH+EY+yW45NVXDZOv/tQDNLWQmoOfwI7Yy9XR440hjd
 vgaae
X-Gm-Gg: ASbGncsLsrRlMBlBAyYJM44glrnA/kfjX7VHflV7cqSDehfYnUZuBuKBFLkxga5IMZi
 vCup4A92NGf05FclIodRGYJJ4gCf05D33FMx9z16sn7Ftrdfz2pPsOL1dy36qCZK4F5xY0ffz7q
 flblvYGsHUtRR7L8N4Pp8vM8dyCjbfqyTonQ1zRsKFt6cMou3W5096HZkHXR78xFUKZ3ANuCfYS
 f6UTw+LDthaTLpl/mCRMH3hUKMUPyi05VouDhIJNpH7YIRUq2UT0O5XcrtWEOBRi4M06qu26qQg
 6MLoDKhwxyjbCt0LIADs8OfgMyQBa8xpVQ8mCf/f/pjEw0fA08hQVBothhagYIr8UUZyTNl+Mk4
 OydzgBUI6SpBTwg2nliC+os+lzbRNxJDsvdt5UMLAwoPDSa93O8XV6F04fxYCOi9avkzQedqtbJ
 0gxGmT1bCQx0VDgmHwq3IBBkMcCUZmGzMAvQf8fqo7vIW2bpSzQyab4pyaTxU=
X-Google-Smtp-Source: AGHT+IFu57hPjBF5kJo55s/Qm2U4vI1gGC2wRrMJ5XxmxhZX/Kb4G5usnv7BxY+NymClp4fiJVItIg==
X-Received: by 2002:a17:907:a909:b0:af9:276c:a32f with SMTP id
 a640c23a62f3a-af9401d894fmr1101472966b.53.1754330779936; 
 Mon, 04 Aug 2025 11:06:19 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 (host-87-4-100-178.retail.telecomitalia.it. [87.4.100.178])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a21b0d0sm742891966b.107.2025.08.04.11.06.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Aug 2025 11:06:19 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Mon,  4 Aug 2025 20:06:16 +0200
Message-ID: <20250804180616.613019-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1754330780; x=1754935580;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bNjvlCE0WFudl+OWsJZlOYiOChbs+QVefRRRwFY4UcY=;
 b=XmXISNbMQDHTybl3CkUTyPMpKIsaKSsFWDQUVQoIkjLERcrEDCxzPc3uFNS6fOebZs
 DsQAQaxhS+MwY0sJ5fqpALfQ2O1BakeVwE4V6kGXo/Rwuwcy1BybeJFqxrzMdWuGbAdu
 5Zg+hRvgBBke/+907/jyam+kHuc8GXDrOrGHM=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=XmXISNbM
Subject: [Buildroot] [PATCH 1/1] package/uuu: bump to version 1.5.219
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

Release notes:
https://github.com/nxp-imx/mfgtools/releases/tag/uuu_1.5.218
https://github.com/nxp-imx/mfgtools/releases/tag/uuu_1.5.219

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/uuu/uuu.hash | 2 +-
 package/uuu/uuu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uuu/uuu.hash b/package/uuu/uuu.hash
index 9f978f55cc6b..a56baaaef49b 100644
--- a/package/uuu/uuu.hash
+++ b/package/uuu/uuu.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  c763b87ffdf10ac5499a0c319463759caa336bc6567b56d6d0ef448590c1a76d  uuu_source-uuu_1.5.201.tar.gz
+sha256  5940b1882628531b5786668552207576a5e27b7b890d67def2e22a760ebd5d91  uuu_source-uuu_1.5.219.tar.gz
 sha256  cc8d47f7b9260f6669ecd41c24554c552f17581d81ee8fc602c6d23edb8bf495  LICENSE
diff --git a/package/uuu/uuu.mk b/package/uuu/uuu.mk
index 93d0b97b133f..18438963adf5 100644
--- a/package/uuu/uuu.mk
+++ b/package/uuu/uuu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UUU_VERSION = 1.5.201
+UUU_VERSION = 1.5.219
 UUU_SOURCE = uuu_source-uuu_$(UUU_VERSION).tar.gz
 UUU_SITE = https://github.com/nxp-imx/mfgtools/releases/download/uuu_$(UUU_VERSION)
 UUU_LICENSE = BSD 3-Clause "New" or "Revised" License
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
