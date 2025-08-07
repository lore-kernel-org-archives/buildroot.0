Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA1FEC87FDA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 06:23:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE93C84C6F;
	Thu,  7 Aug 2025 06:23:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ko3I35euSeBu; Thu,  7 Aug 2025 06:23:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7FDB84C76
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7FDB84C76;
	Thu,  7 Aug 2025 06:23:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 17450233
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 06:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 097E584C56
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 06:23:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D9ClGZQoI4wS for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 06:23:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=fabien.lehoussel@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5CF9A84C50
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5CF9A84C50
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5CF9A84C50
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 06:23:39 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-458aee6e86aso3350615e9.3
 for <buildroot@buildroot.org>; Wed, 06 Aug 2025 23:23:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754547817; x=1755152617;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u0yr/hjJUFUpQ4DPlEj4p/E0FsZ9ja8Irf4jKRpSLsM=;
 b=rYdKeyhy+eaFivZAzaQvqrnoRrBYvdQmXm5dntJw22Bu5Atg1D+8oXIDoSHWGn2Ejs
 ELnr9VisHYtNlBiaRlWFUQchb14ZPrpE2Na7uGbDvR8DM+hYPybUwgf8f3UIvdtmPX1h
 MwKqjvTesPXmMeKUF6b0WNgv1ERq4APADg8v1DPfQkZ+8+ICr1rJmIfjvFCEGBkUX8WK
 0QuLfNlIwBjgAzxjDp42Hnd5OCKPfp3oBq3++/hxJDdU/nfbtzhS0SIY/RKwpNEO9L+o
 dXt2JAjMbU72nipnPYvVWYwA+kq1VBZDVrWlJhh8kMOKAS8NMcMJqPsAoPUZdEV+IDba
 6vSA==
X-Gm-Message-State: AOJu0YzzA4lRoMYY9kXgGtJHShJuNpbIxTviHpZnTnmITWLmV4s99P8d
 FtXSDBZGG16DyqIaP28v9NdsfHaP9AcRxz9KxOlBnYAYnq4U/GkbKEiniOSQI0TdmLDOlglbWuk
 s5rCTezU=
X-Gm-Gg: ASbGncsApfTZCEkppZBLSyraKMxXQUQJxk5BmlZ2pio+TH5PLCmyy6xFsxKxNVGtyXd
 Bg0ag54V7aH9b9XhhU39vKvTWQIkALP9RBbRtxmFMrvmfApwxEqbxvn5rFvAuvil5Hu+4lBTXNz
 aXoKOqbSWpGKqZNVixmXWxNnCXZhgs/Xd7Brv9Sc1u0vG0/D6fGuNQJWqYWjoHjeZhI6rOSEoN1
 hgriIBpOaJpv9aEZC69rwq+oqU4Bve0lvhmiT5BGEv0+FvMKosHtRQsqkPXsk6kbh4kJgSk4+cG
 QgQns9ftIxy7fB3hQrc0SWyvOupUBdaodf2iKIcxVpAqDhiUvNnhgo3VI2XsvLbBacbj7DvnPIm
 6DQJ7RWC+5ClDOqigPbnKlANt6ntLeqlF8uTbn4UX8FUCDQ==
X-Google-Smtp-Source: AGHT+IFhjUwBk/kOCUuJnc3dvTgJHmomer2dUcwKV/msXJXnLFj3A5RcP7p0ChFEPAa09WNVW8KApA==
X-Received: by 2002:a05:600c:4f4c:b0:450:d37d:7c with SMTP id
 5b1f17b1804b1-459e95af955mr35341125e9.21.1754547816894; 
 Wed, 06 Aug 2025 23:23:36 -0700 (PDT)
Received: from NV4XMB-ME-MZ.. ([2a01:e0a:943:83d0:43e4:39a6:e147:9926])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458b4f9e952sm217803345e9.9.2025.08.06.23.23.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Aug 2025 23:23:36 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
 Fabien Lehoussel <fabien.lehoussel@smile.fr>
Date: Thu,  7 Aug 2025 08:23:26 +0200
Message-ID: <20250807062327.1637333-4-fabien.lehoussel@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250807062327.1637333-1-fabien.lehoussel@smile.fr>
References: <20250807062327.1637333-1-fabien.lehoussel@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1754547817; x=1755152617; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u0yr/hjJUFUpQ4DPlEj4p/E0FsZ9ja8Irf4jKRpSLsM=;
 b=GjCg9D4EtGEqnGAJp+neHiKfZRlFWQcyKxGyPTT7yKN8v8VeM9WyR6MFpZR1CcElTb
 1EzKOEq0PKzuAS4RJRh2iyYptogPquH/4HC3JE10rwvHyaK7ROTPausaS54XhEB4badn
 bXXm5oTlF5jcxu1SUbk+X8I3eCVt+xuiVcD1o=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=GjCg9D4E
Subject: [Buildroot] [PATCH 4/5] utils/generate-cyclonedx: remove buildroot
 dependencies
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
From: Fabien Lehoussel via buildroot <buildroot@buildroot.org>
Reply-To: Fabien Lehoussel <fabien.lehoussel@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot (the generated image) is not a component in this context

Signed-off-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>
---
 utils/generate-cyclonedx | 1 -
 1 file changed, 1 deletion(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 1f601aecd9..1cfe0550c8 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -327,7 +327,6 @@ def main():
             cyclonedx_component(name, comp) for name, comp in filtered_show_info_dict.items()
         ],
         "dependencies": [
-            cyclonedx_dependency("buildroot", list(filtered_show_info_dict)),
             *[cyclonedx_dependency(ref, br2_parse_deps(ref, show_info_dict))
               for ref in filtered_show_info_dict],
         ],
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
