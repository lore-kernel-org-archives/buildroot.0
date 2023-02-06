Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6096CC636D3
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 15:13:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0B9B408AE;
	Mon,  6 Feb 2023 15:13:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0B9B408AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PwOIzc-dWXFa; Mon,  6 Feb 2023 15:13:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E2FA408B0;
	Mon,  6 Feb 2023 15:13:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E2FA408B0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EE4C01BF3E0
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 15:13:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C75F18140E
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 15:13:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C75F18140E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MP4F4_L7qOCK for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 15:12:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DBA38141F
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4DBA38141F
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 15:12:58 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id z21so4571866iol.0
 for <buildroot@buildroot.org>; Mon, 06 Feb 2023 07:12:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ah9Fk8Y3ba4EDZu/+4lontxuC/HJpVB3bdKnj8xH73o=;
 b=I9y8PW5fpXZpu6tHFCN8ur5lHtD0Yz0pQZI2vKOUd0O2RW/UIq3kp3EIPp6b8KL/6h
 R8+XzeMuyZ8RJ5ntQyxAtFqgf/8rp+yhksYytQom/wblSqdPLVrAno3xEkl5YAnpyKbQ
 TeN7TE8LL1gcy6HwVNqbFaElRVOidOkVI3cx8JgCu/kS8+wU3Bp6zQybYLiZSS6yH4AY
 ZqnLEZGP4SLdGuezhDTE0/RP5icKkoP6wyNjR3amIvNNta5ISqSlnCsIMK31uhmEDc0a
 w5+isPJQqHI0t9pQqxLqUx5CL+dD6jY5givwwnnCfWazaB19k9lMbJJ/InDuC/apYfJT
 3ZxQ==
X-Gm-Message-State: AO0yUKWKIpNUP0ysutzxDUqrw+Z64FX6Tdm8mlu6a/KpUQiF5sphqN7b
 PdvhimGXpRsrm073brEAMEzkqznHI1Btxg==
X-Google-Smtp-Source: AK7set9qCN98gNDVkmIHQX4zKUiDLI898jdidf5dyEncBBCD/G/GGFsESiVvwx71EQ0kjtYChGjQ4g==
X-Received: by 2002:a05:6602:3307:b0:704:6080:32df with SMTP id
 b7-20020a056602330700b00704608032dfmr8893852ioz.21.1675696377218; 
 Mon, 06 Feb 2023 07:12:57 -0800 (PST)
Received: from james-x399.localdomain (71-218-114-73.hlrn.qwest.net.
 [71.218.114.73]) by smtp.gmail.com with ESMTPSA id
 w15-20020a056e0213ef00b0030bfdb6ef60sm419943ilj.58.2023.02.06.07.12.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 07:12:56 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  6 Feb 2023 08:12:53 -0700
Message-Id: <20230206151253.3629954-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ah9Fk8Y3ba4EDZu/+4lontxuC/HJpVB3bdKnj8xH73o=;
 b=JQ2wymbrgtyGekH31qgfDvHHUqJAP3zHe/3heObaHABDdZlSHYkN328/DZQHIUiK/F
 H99dNVqBRzvjNvQ68WD+AJBW6ws11e5z5tw2nil4OJfyjp/hflaYbMuLhEfP/9vHloTq
 bJk4TxYBq2sXlkNRj1s8sRuU0tmtxGblFzkI8BiZgDjcGcexiOIioj0rR0vnHuJadUr8
 y9qqyviTRQ+qXN3aWN65puW3I5ccSq6nvbl6GXB77hm8ypYXcsL2LYblPDuv+BtDmGQR
 arNbzDjfim9A5Fo8KPJAx9TGxOWFczZl57QWTj4y/muXKdHzh3KuvVOSUokzqJi1ZdHU
 D3Jg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=JQ2wymbr
Subject: [Buildroot] [PATCH v2 1/1] utils/genrandconfig: allow overriding
 KCONFIG_PROBABILITY
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

Tweaking this variable should allow us to get better coverage of
packages with larger dependency trees.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - rebase
---
 utils/genrandconfig | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index b3576f8a51..830b85e5c8 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -752,7 +752,7 @@ def gen_config(args):
         make_rand = [
             "make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
             "KCONFIG_SEED=0x%s" % hexlify(os.urandom(4)).decode("ascii").upper(),
-            "KCONFIG_PROBABILITY=%d" % randint(1, 20),
+            "KCONFIG_PROBABILITY=%d" % args.probability,
             "randpackageconfig" if args.toolchains_csv else "randconfig"
         ]
         proc = yield from asyncio.create_subprocess_exec(*make_rand)
@@ -784,6 +784,21 @@ def gen_config(args):
 
 if __name__ == '__main__':
     import argparse
+
+    class Range(argparse.Action):
+        def __init__(self, minimum=None, maximum=None, *args, **kwargs):
+            self.min = minimum
+            self.max = maximum
+            kwargs["metavar"] = "[%d-%d]" % (self.min, self.max)
+            super(Range, self).__init__(*args, **kwargs)
+
+        def __call__(self, parser, namespace, value, option_string=None):
+            if not (self.min <= value <= self.max):
+                msg = 'invalid choice: %r (choose from [%d-%d])' % \
+                    (value, self.min, self.max)
+                raise argparse.ArgumentError(self, msg)
+            setattr(namespace, self.dest, value)
+
     parser = argparse.ArgumentParser(description="Generate a random configuration")
     parser.add_argument("--outputdir", "-o",
                         help="Output directory (relative to current directory)",
@@ -791,6 +806,10 @@ if __name__ == '__main__':
     parser.add_argument("--buildrootdir", "-b",
                         help="Buildroot directory (relative to current directory)",
                         type=str, default='.')
+    parser.add_argument("--probability", "-p",
+                        help="Override the KCONFIG_PROBABILITY value",
+                        type=int, action=Range, minimum=0, maximum=100,
+                        default=randint(1, 20))
 
     toolchains_csv = parser.add_mutually_exclusive_group(required=False)
     toolchains_csv.add_argument("--toolchains-csv",
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
