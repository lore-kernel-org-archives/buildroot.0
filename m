Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C02A7C52D7C
	for <buildroot@archiver.kernel.org>; Tue, 20 Aug 2024 00:03:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7228660626;
	Tue, 20 Aug 2024 00:03:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tOUvobMry8FX; Tue, 20 Aug 2024 00:03:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 852496083F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 852496083F;
	Tue, 20 Aug 2024 00:03:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 255671BF955
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 00:03:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D98080FFB
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 00:03:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f52yyqBDzTr4 for <buildroot@lists.busybox.net>;
 Tue, 20 Aug 2024 00:03:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::136; helo=mail-il1-x136.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4D93C80FD8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D93C80FD8
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4D93C80FD8
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 00:03:29 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-39d30564949so11722335ab.2
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 17:03:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724112208; x=1724717008;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XlVOxjLizqOnh1CJIK754srxd0iQtMPLNJStCMuJGTw=;
 b=PGqevlVY5xwy4v7p8kLziPWeZpVSsmgLdySIMpeXKYdmVwIVv6yck9vifUBEePTGFz
 +uE0TVC9FCxWninNzNAWeJSz+IljJ4tJpGchys4lQih2ukIQvgSxQM32L+8qkovg8147
 AKZ8/8emGzQK2iL+teTJ6JF+AR6k3RVJ3k+QOowJ5Q89uyAW2+CJSkxRyiqn3cDerYEa
 hp+fExm1eDC3Ud0VQOQBlvRieTdPfst4K7qTSgiCScciJsYSbXi0zPPkX/YX0ZLt77N2
 c7V6ue5RGP0pZoToQlGrfFCk01HBsjeZC444Oq4hhYlJkAl4EskqTuCiqFSUlD3suCPs
 zGng==
X-Gm-Message-State: AOJu0YzZYKGCWaZdLmt+9rKz0qAWgQI+lAkMwUz1onKj7Obe+pqTM0HX
 eOGREYeRFo5/2De75MeOttv3Qlqdl5j6fCXXv361ZQo18bZ4noAJSfvBBheo
X-Google-Smtp-Source: AGHT+IEbByQ45sSFjtAkMCIcSMjMc6qaQQFI+gJSIUvG9H2j3zSkZB+Z/KfIQwJy7Z9cOqwHEIFBfQ==
X-Received: by 2002:a05:6e02:20c2:b0:39b:369e:ae47 with SMTP id
 e9e14a558f8ab-39d585372c8mr6756395ab.6.1724112207901; 
 Mon, 19 Aug 2024 17:03:27 -0700 (PDT)
Received: from james-x399.localdomain (97-118-128-240.hlrn.qwest.net.
 [97.118.128.240]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-39d37ad2976sm20264295ab.59.2024.08.19.17.03.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2024 17:03:27 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 19 Aug 2024 18:03:25 -0600
Message-Id: <20240820000325.2453824-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724112208; x=1724717008; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XlVOxjLizqOnh1CJIK754srxd0iQtMPLNJStCMuJGTw=;
 b=OcMraqGyulxNtEuOVWA72AGsRJCmf7vaFnT3RQYFkvNo/EyOi7z0Jmz+iNdg4djT/N
 xqQpyahlsFgPcKvzHSK+xT1vEyV24PcxEpsUNOnhgVWNZen+VUarrWohvf5aQGUphryo
 d3EyDWYQw6VPVEibws0G9bhlpEBHPh2m4aTe7+VX4U9bSlF6axPFyiPtI89oAskae12U
 rdPsuSpVFiUbySfCJ1Rd1HRmLffF19e9jmP07314dxxJO7UcU/WUu1Z7UylqWgrg05wV
 979nFFmvcCPjZ87OlpO9cJPzrxGXnBnGz5jkZuE7zs/HRrsAvjrAFZ/qaB1MAYTTSp+W
 7jsw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=OcMraqGy
Subject: [Buildroot] [PATCH v4 1/1] utils/genrandconfig: allow overriding
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
Changes v3 -> v4:
  - rebase
Changes v2 -> v3:
  - rebase
Changes v1 -> v2:
  - rebase
---
 utils/genrandconfig | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 8e60fd3f9e..94dbd37393 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -542,7 +542,7 @@ async def gen_config(args):
         proc = await asyncio.create_subprocess_exec(
             "make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
             "KCONFIG_SEED=0x%s" % hexlify(os.urandom(4)).decode("ascii").upper(),
-            "KCONFIG_PROBABILITY=%d" % randint(1, 20),
+            "KCONFIG_PROBABILITY=%d" % args.probability,
             "randconfig",
             stdout=asyncio.subprocess.DEVNULL,
             stderr=asyncio.subprocess.DEVNULL)
@@ -603,6 +603,21 @@ async def gen_config(args):
 
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
@@ -610,6 +625,10 @@ if __name__ == '__main__':
     parser.add_argument("--buildrootdir", "-b",
                         help="Buildroot directory (relative to current directory)",
                         type=str, default='.')
+    parser.add_argument("--probability", "-p",
+                        help="Override the KCONFIG_PROBABILITY value",
+                        type=int, action=Range, minimum=0, maximum=100,
+                        default=randint(1, 20))
     parser.add_argument("--toolchains-csv", help="Legacy, unused", type=str)
     parser.add_argument("--no-toolchains-csv", help="Legacy, unused")
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
