Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA171C27C53
	for <buildroot@archiver.kernel.org>; Fri,  7 Jun 2024 13:49:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00F07404E3;
	Fri,  7 Jun 2024 13:49:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JRN559tvvHTj; Fri,  7 Jun 2024 13:48:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89E3C4097D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89E3C4097D;
	Fri,  7 Jun 2024 13:48:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BB1751BF215
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 13:48:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A749F404E3
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 13:48:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tejqQtPrSlMZ for <buildroot@lists.busybox.net>;
 Fri,  7 Jun 2024 13:48:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 282BA404DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 282BA404DF
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 282BA404DF
 for <buildroot@buildroot.org>; Fri,  7 Jun 2024 13:48:52 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-35dc0472b7eso1938664f8f.2
 for <buildroot@buildroot.org>; Fri, 07 Jun 2024 06:48:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717768130; x=1718372930;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=PJs65YZ6m5oBwvQrQlJKDf5fP7ww3Ih2gcQWJ1fVqws=;
 b=BHwvFXje4mCb04ZoOQ172IXZyGQTvbFHecIA0cvVK9p70fqL2YN6QamyhesXd8VQJN
 6qLpyKs0PVLdkgVdoF9TwR84Js9GIoCPrWWchxO6pHJRpo+stWtXb4sdNw8sgCCHBrd3
 KzZum57AyuXJoQhqke4GelXF0RtVWfwnW1I/h2xHrm/fQBHCfPNVOxGsqkdvu0Juu3LL
 xkKKlYnVeoskVI8xdGnMdoigOmyEIR7WDO8hkjOVGBUVorFmwZMQjiM5r3dd+87JhYSG
 TxrxAto7mWqpzGPqvU9foPQrH8RV8phkMQgZNU6ya0gkGiK528EMGLqdkgYjWjPl9Gdq
 RyEw==
X-Gm-Message-State: AOJu0Yy8aN0g/eg1/fj4fm2aFxZGUngjEb1zXndTnN0ReWgVl6TDMq1m
 g4SJgwvyvDoTJdYKDucNc0Wp3GHforUKxaGb4ERN9YnWtyuGA1pdMyDYXg==
X-Google-Smtp-Source: AGHT+IGzpWCUsetZxwQolDegCHX8WL3UVD7McDKVNVbe6F8yLDHiqD+lDVN26PcLTY4wwOVkwoEN3A==
X-Received: by 2002:a5d:5651:0:b0:35f:6bb:c5fd with SMTP id
 ffacd0b85a97d-35f06bbc8f7mr1247359f8f.37.1717768130326; 
 Fri, 07 Jun 2024 06:48:50 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35ef5fc3197sm4051627f8f.101.2024.06.07.06.48.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jun 2024 06:48:50 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri,  7 Jun 2024 15:48:48 +0200
Message-ID: <20240607134848.2974069-2-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240607134848.2974069-1-yann.morin.1998@free.fr>
References: <20240607134848.2974069-1-yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717768130; x=1718372930; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PJs65YZ6m5oBwvQrQlJKDf5fP7ww3Ih2gcQWJ1fVqws=;
 b=YuTMk29cK9TYCf7LJ1w+lbgfXvCZX9Mmh27OG1UpChwbrNhQVwiHWX2NYhAu2hSrkH
 NsZ8ZO1wl5S7ihpIiVBR8tz4wq5vNz0yCmPgs6Ogh1YKSCVV2wrGL3hoteu4M9YncLBS
 Ut3JvIgkIQtjZ2koMXz7RU8kbtXMXzC9rkP/NQ7VxOs7t9iPUgx4YGLIbByMEkriOBUg
 bgY3zen6n10B0HUaglaq3S3RpK3eFyJxxWe5cPBww1f3SSuARYQnDzRuBx4nwXNAeEi9
 /84JzUi+VrI6K8E0sPIKPZ+Fqg5La7n6ronkzpyconqYdARJutGteCPNEx46gc/SoPF1
 ZjEQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YuTMk29c
Subject: [Buildroot] [PATCH v2 2/2] utils/checkpackagelib: extend hint about
 unscopped variables
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>, "Frager,
 Neal" <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

User may get confused when they see the current hint, and take that as
the proper replacement, while we're only reporting the stem of the
variable name:

    .../foo.mk:16: possible typo: BLA -> *FOO*

There is usually no easy way to actually suggest the proper variable
name, though, so let's make it a little bit more obvious that we meant
the variable was improperly scoped:

    .../foo.mk:16: possible typo, variable not properly scoped: BLA -> *FOO_XXX*

And while at it, throw in the URL to the corresponding manual entry.

Adapt the test accordingly.

Reported-by: "Frager, Neal" <neal.frager@amd.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>

---
Note that this uncovered an issue in the composer package, and that was
recently fixed in master with 139e47861724. No other new issues were
reported with this change.
---
 utils/checkpackagelib/lib_mk.py      |  4 ++--
 utils/checkpackagelib/test_lib_mk.py | 14 +++++++-------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
index 831a8afe61..4def07e3a2 100644
--- a/utils/checkpackagelib/lib_mk.py
+++ b/utils/checkpackagelib/lib_mk.py
@@ -313,8 +313,8 @@ class TypoInPackageVariable(_CheckFunction):
         if self.ALLOWED.match(variable):
             return
         if self.REGEX.search(variable) is None:
-            return ["{}:{}: possible typo: {} -> *{}*"
-                    .format(self.filename, lineno, variable, self.package),
+            return ["{}:{}: possible typo, variable not properly scoped: {} -> *{}_XXXX* ({}#_tips_and_tricks)"
+                    .format(self.filename, lineno, variable, self.package, self.url_to_manual),
                     text]
 
 
diff --git a/utils/checkpackagelib/test_lib_mk.py b/utils/checkpackagelib/test_lib_mk.py
index 2086237ebb..2ccf53dee5 100644
--- a/utils/checkpackagelib/test_lib_mk.py
+++ b/utils/checkpackagelib/test_lib_mk.py
@@ -512,27 +512,27 @@ TypoInPackageVariable = [
     ('bad =',
      'any.mk',
      'OTHER_VAR = \n',
-     [['any.mk:1: possible typo: OTHER_VAR -> *ANY*',
+     [['any.mk:1: possible typo, variable not properly scoped: OTHER_VAR -> *ANY_XXXX* (url#_tips_and_tricks)',
        'OTHER_VAR = \n']]),
     ('bad +=',
      'any.mk',
      'OTHER_VAR += \n',
-     [['any.mk:1: possible typo: OTHER_VAR -> *ANY*',
+     [['any.mk:1: possible typo, variable not properly scoped: OTHER_VAR -> *ANY_XXXX* (url#_tips_and_tricks)',
        'OTHER_VAR += \n']]),
     ('ignore missing space',
      'any.mk',
      'OTHER_VAR= \n',
-     [['any.mk:1: possible typo: OTHER_VAR -> *ANY*',
+     [['any.mk:1: possible typo, variable not properly scoped: OTHER_VAR -> *ANY_XXXX* (url#_tips_and_tricks)',
        'OTHER_VAR= \n']]),
     ('use path in the warning',
      './any.mk',
      'OTHER_VAR = \n',
-     [['./any.mk:1: possible typo: OTHER_VAR -> *ANY*',
+     [['./any.mk:1: possible typo, variable not properly scoped: OTHER_VAR -> *ANY_XXXX* (url#_tips_and_tricks)',
        'OTHER_VAR = \n']]),
     ('another name',
      'other.mk',
      'ANY_VAR = \n',
-     [['other.mk:1: possible typo: ANY_VAR -> *OTHER*',
+     [['other.mk:1: possible typo, variable not properly scoped: ANY_VAR -> *OTHER_XXXX* (url#_tips_and_tricks)',
        'ANY_VAR = \n']]),
     ('libc exception',
      './any.mk',
@@ -549,7 +549,7 @@ TypoInPackageVariable = [
     ('host (bad)',
      'any.mk',
      'HOST_OTHER_VAR = \n',
-     [['any.mk:1: possible typo: HOST_OTHER_VAR -> *ANY*',
+     [['any.mk:1: possible typo, variable not properly scoped: HOST_OTHER_VAR -> *ANY_XXXX* (url#_tips_and_tricks)',
        'HOST_OTHER_VAR = \n']]),
     ('provides',
      'any.mk',
@@ -565,7 +565,7 @@ TypoInPackageVariable = [
      'any.mk',
      'ANY_PROVIDES = other\n'
      'OTHERS_VAR = \n',
-     [['any.mk:2: possible typo: OTHERS_VAR -> *ANY*',
+     [['any.mk:2: possible typo, variable not properly scoped: OTHERS_VAR -> *ANY_XXXX* (url#_tips_and_tricks)',
        'OTHERS_VAR = \n']]),
     ]
 
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
