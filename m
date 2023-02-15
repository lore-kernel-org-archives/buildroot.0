Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D89BAC6379F
	for <buildroot@archiver.kernel.org>; Wed, 15 Feb 2023 21:16:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CDD84175D;
	Wed, 15 Feb 2023 21:16:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CDD84175D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0fpV5h5yQV1N; Wed, 15 Feb 2023 21:16:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C8C441757;
	Wed, 15 Feb 2023 21:16:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C8C441757
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 862B11BF3A0
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 21:16:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D25481773
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 21:16:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D25481773
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KLgTkuuh9GSY for <buildroot@lists.busybox.net>;
 Wed, 15 Feb 2023 21:16:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F172E81432
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F172E81432
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 21:16:20 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id v13so103548iln.4
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 13:16:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=stk85CQaTnKPOFf12S4cGkRm/EKZdwUgPGGUTzhkork=;
 b=FEShZ9pzTKaNLSaFmM5ncfAMY1cLwTHxVmb3Hz/XUKwwuap/rlFIJh4cQnMH8k/7EI
 XP5A247IJIrYLFso8FbPj8pY13geFBpJSWFTGMZRDHMgR3Em97GpvGX2/kk7GbC9Lj8t
 DZK1oAMDEe2EEnlWBcrn30XZ1DN7iA/z/YGxLi7YPvtT8Zq5aNKEsibOpuEtaAnXjTTM
 wq1Te9d1dxW5VPyc1ylAEiqcoAcSau16Kpc7piId2Tfmxb2WxspZmJ8iZt8FKm54ya5y
 apbGeyQLxuLZJpIOAQfmeb1Z/gSdr1CyMokYbgVg49T/BNWPqK//2CNT6x1WlC+wrdxG
 82og==
X-Gm-Message-State: AO0yUKXZQKZVu4oir+kIJe6wFh9X4L0LB/Nqq9cxPpmsexQ8fIGt72Wv
 Z88hqpV0GVnW8OJQWTXkkQlgPrJNbGg=
X-Google-Smtp-Source: AK7set+ZPJ8p1v2alGD2VoNLLsHTlraeMpb1eeYEpT5lr3Qa0R7OJT1K/ISDK0Aavt+3b+56qj8qgA==
X-Received: by 2002:a92:9404:0:b0:310:c6f7:c1e9 with SMTP id
 c4-20020a929404000000b00310c6f7c1e9mr2474730ili.5.1676495779812; 
 Wed, 15 Feb 2023 13:16:19 -0800 (PST)
Received: from james-x399.localdomain (71-218-114-73.hlrn.qwest.net.
 [71.218.114.73]) by smtp.gmail.com with ESMTPSA id
 g15-20020a92dd8f000000b00313f2279f06sm5819000iln.73.2023.02.15.13.16.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 13:16:19 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 15 Feb 2023 14:15:31 -0700
Message-Id: <20230215211531.331246-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=stk85CQaTnKPOFf12S4cGkRm/EKZdwUgPGGUTzhkork=;
 b=kta+awSWyMtKKeujCAxgzIg9TXBrYCtzkwbQoq6C3ksbiMUhSztYmVuVjbOkdWCR8F
 t3onpFS4100jYglmuWqsNWH8bqnYYbNxRcKLx2AXyV8BUmddbhS0/yqDUyryq0WX7W5K
 WOrpRd4UrwNyPrqdDukxouAxaDUvEjix4XI2IvahCKkWJK1DJ5y08LaJN5UEsHWkg3zm
 vd3dUYKsnTT/1zcVTydXP1xlOzz/Ocy5LonPJWlpb1dRHoRwzTHFl+MEANdgzCOY0iJZ
 yUqCr/flfvlG203HPs75bPaRk+8PagVp04nMts8OCXf+dCJ3xxEdhCRRtzs2FouW1yYL
 KDvQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=kta+awSW
Subject: [Buildroot] [PATCH v2 1/1] utils/genrandconfig: make default
 toolchain_csv path absolute
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The default toolchain_csv path is a relative path to the buildroot
directory.

If we run genrandconfig with a cwd that is not the buildroot directory
the default toolchain_csv path will be wrong.

To fix this make the default toolchain_csv path absolute.

Fixes:
FileNotFoundError: [Errno 2] No such file or directory: 'support/config-fragments/autobuild/toolchain-configs.csv'

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - set default path as absolute
---
 utils/genrandconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index b3576f8a51..3552b83694 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -801,7 +801,9 @@ if __name__ == '__main__':
                                 dest="toolchains_csv",
                                 help="Generate random toolchain configuration",
                                 action='store_false')
-    parser.set_defaults(toolchains_csv="support/config-fragments/autobuild/toolchain-configs.csv")
+    buildroot_abs = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
+    parser.set_defaults(toolchains_csv=os.path.join(buildroot_abs,
+                        "support/config-fragments/autobuild/toolchain-configs.csv"))
 
     args = parser.parse_args()
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
