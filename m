Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 999DCC19F2D
	for <buildroot@archiver.kernel.org>; Tue,  9 Aug 2022 07:58:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3FB7860BE0;
	Tue,  9 Aug 2022 07:58:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FB7860BE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FwhzSoo52x3p; Tue,  9 Aug 2022 07:58:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FEC960BBE;
	Tue,  9 Aug 2022 07:58:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FEC960BBE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CA4FC1BF27E
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 07:57:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B246560BBE
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 07:57:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B246560BBE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BDcYep6GrJh5 for <buildroot@lists.busybox.net>;
 Tue,  9 Aug 2022 07:57:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 817096068A
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 817096068A
 for <buildroot@buildroot.org>; Tue,  9 Aug 2022 07:57:26 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id gk3so20774141ejb.8
 for <buildroot@buildroot.org>; Tue, 09 Aug 2022 00:57:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=1BeTNGV21Zns165GiC3LPb/iwBlMGu3g6waM452bKKI=;
 b=lHWIXvtlXDmpcgPCsytVn0RHjWK5rMbOvL2h4oiHD7Zyg1iLfy7IahPDi9oLj3jg1H
 VtHKLtAgHVgQy1Hw61x4+FXGtdmwgEgmDYK9GS0uFgd3AFiavPhExvkbrm/G//aB2RgN
 fOjoeRgUmDF2G/ilai7P2zhFswnUmEhU+RFxZdNQtW0R2YbhH07HToNo1xfc4vXUXiIJ
 6IOsbZXIllHK4bO2HWiEM4J1s5FK1zp7kK4aCLLobKksysixEQ9/lQ33ssS5tsNdVxos
 rlWA6qPhSKx7eu/KHLf43ojnEhFnaLz2yioR+knv4W+3zQSZjVX17nqemWzYs2OdI5ZX
 91LA==
X-Gm-Message-State: ACgBeo1zgX/EAm9bdCjurIacFAjmRW3yr2tvrbX19p+CYhLDb/VrY8xJ
 BbfGwgFY6CDzx1Txm5/Z1iAueNGsmcM=
X-Google-Smtp-Source: AA6agR5EUGi1oW/MXbGLIBUjs1IklaZ+ig8M5gW4OLL64dxtV1gvTvFnRBWUWOzef/0LgaEtMa0oqA==
X-Received: by 2002:a17:907:288a:b0:730:7ee5:e6a with SMTP id
 em10-20020a170907288a00b007307ee50e6amr15909936ejc.218.1660031844424; 
 Tue, 09 Aug 2022 00:57:24 -0700 (PDT)
Received: from mercury.. ([188.27.130.4]) by smtp.gmail.com with ESMTPSA id
 pk9-20020a170906d7a900b0073065767404sm819341ejb.34.2022.08.09.00.57.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 00:57:24 -0700 (PDT)
From: Alexandru Ardelean <ardeleanalex@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Aug 2022 10:56:55 +0300
Message-Id: <20220809075704.86472-5-ardeleanalex@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220809075704.86472-1-ardeleanalex@gmail.com>
References: <20220809075704.86472-1-ardeleanalex@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=1BeTNGV21Zns165GiC3LPb/iwBlMGu3g6waM452bKKI=;
 b=D2/rxabooCXGklj8/tZF6ADHIwYVhLJvciiZOfNbzG9Lh4MW+20S+ydc7ReSqbnTB5
 Utl2U9n6iGJFQ7FGbw39Z9CltMBK4JMWRgLuGKG/DBtSoPegthanfDTFlMg5/lnKIM2l
 ZkdEEgzLI4yD9MesezaHfsR+ONJkIYz4lZT/cU8LAnlRAyEJcl7ae3+LHe4DAtrVt2GD
 ky/ZH/6uHmKa5SIGuxCZ2xlEgZwtH/swuBxOWAxVo7IXPOqy8e5kkNdqLQFMTTEbwo3o
 uiej0Zl0HNtg/Acg4QAJuEG3SiQ9oLgG6B/Z4nl/4Mlj7AQkvaB/0yMij9FRmplHBF0u
 WCYg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=D2/rxabo
Subject: [Buildroot] [PATCH 04/13] nodejs: fix 'Duplicate v8 target errors
 when cross-compiling' error
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
Cc: Alexandru Ardelean <ardeleanalex@gmail.com>, fontaine.fabrice@gmail.com,
 aduskett@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Reported also via:
  https://github.com/nodejs/node/issues/37441

Patched in:
  https://github.com/minrk/node/commit/5e533cb943eef68b270f55f0cba02c0ec67c699d

The error is:
```
>>> nodejs 16.15.0 Building
PATH="<buildroot>/output/host/bin:<buildroot>/output/host/sbin:/home/aardelean/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/snap/bin" PYTHON=<buildroot>/output/host/bin/python3 /usr/bin/make  -C <buildroot>/output/build/nodejs-16.15.0 PATH="<buildroot>/output/host/bin:<buildroot>/output/host/sbin:/home/aardelean/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/snap/bin" AR="<buildroot>/output/host/bin/aarch64-none-linux-gnu-gcc-ar" AS="<buildroot>/output/host/bin/aarch64-none-linux-gnu-as" LD="<buildroot>/output/host/bin/aarch64-none-linux-gnu-ld" NM="<buildroot>/output/host/bin/aarch64-none-linux-gnu-gcc-nm" CC="<buildroot>/output/host/bin/aarch64-none-linux-gnu-gcc" GCC="<buildroot>/output/host/bin/aarch64-none-linux-gnu-gcc" CPP="<buildroot>/output/host/bin/aarch64-none-linux-gnu-cpp" CXX="<buildroot>/output/host/bin/aarch64-none-linux-gnu-g++" FC="<buildroot>/output/h
 ost/bin/aarch64-none-linux-gnu-gfortran" F77="<buildroot>/output/host/bin/aarch64-none-linux-gnu-gfortran" RANLIB="<buildroot>/output/host/bin/aarch64-none-linux-gnu-gcc-ranlib" READELF="<buildroot>/output/host/bin/aarch64-none-linux-gnu-readelf" STRIP="<buildroot>/output/host/bin/aarch64-none-linux-gnu-strip" OBJCOPY="<buildroot>/output/host/bin/aarch64-none-linux-gnu-objcopy" OBJDUMP="<buildroot>/output/host/bin/aarch64-none-linux-gnu-objdump" AR_FOR_BUILD="/usr/bin/ar" AS_FOR_BUILD="/usr/bin/as" CC_FOR_BUILD="<buildroot>/output/host/bin/ccache /usr/bin/gcc" GCC_FOR_BUILD="<buildroot>/output/host/bin/ccache /usr/bin/gcc" CXX_FOR_BUILD="<buildroot>/output/host/bin/ccache /usr/bin/g++" LD_FOR_BUILD="/usr/bin/ld" CPPFLAGS_FOR_BUILD="-I<buildroot>/output/host/include" CFLAGS_FOR_BUILD="-O2 -I<buildroot>/output/host/include" CXXFLAGS_FOR_BUILD="-O2 -I<buildroot>/output/host/include" LDFLAGS_FOR_BUILD="-L<buildroot>/output/host/lib -Wl,-rpath,<buildroot>/output/host/lib" FCFLAGS_FOR_BUI
 LD="" DEFAULT_ASSEMBLER="<buildroot>/output/host/bin/aarch64-none-linux-gnu-as" DEFAULT_LINKER="<buildroot>/output/host/bin/aarch64-none-linux-gnu-ld" CPPFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64" CFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0 -D_FORTIFY_SOURCE=1" CXXFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0 -D_FORTIFY_SOURCE=1" LDFLAGS="" FCFLAGS=" -Os -g0" FFLAGS=" -Os -g0" PKG_CONFIG="<buildroot>/output/host/bin/pkg-config" STAGING_DIR="<buildroot>/output/host/aarch64-buildroot-linux-gnu/sysroot" INTLTOOL_PERL=/usr/bin/perl NO_LOAD=cctest.target.mk PATH=<buildroot>/output/build/nodejs-16.15.0/bin:"<buildroot>/output/host/bin:<buildroot>/output/host/sbin:/home/aardelean/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/snap/bin" LDFLAGS=" -latomic" LD="<buildroot>/output/host/bin/aarch64-none-linux-gnu-g++"
ninja -C out/Release
ninja: Entering directory `out/Release'
ninja: error: obj.host/tools/v8_gypfiles/run_torque.ninja:1356: multiple rules generate gen/torque-generated/bit-fields.h [-w dupbuild=err]

make[2]: *** [Makefile:127: node] Error 1
make[1]: *** [package/pkg-generic.mk:293: <buildroot>/output/build/nodejs-16.15.0/.stamp_built] Error 2
make: *** [Makefile:84: _all] Error 2

```

Maybe it's not the final patch, but it's good enough to get us going.

Signed-off-by: Alexandru Ardelean <ardeleanalex@gmail.com>
---
 ...lude-obj-name-in-shared-intermediate.patch | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 package/nodejs/0002-include-obj-name-in-shared-intermediate.patch

diff --git a/package/nodejs/0002-include-obj-name-in-shared-intermediate.patch b/package/nodejs/0002-include-obj-name-in-shared-intermediate.patch
new file mode 100644
index 0000000000..6628499362
--- /dev/null
+++ b/package/nodejs/0002-include-obj-name-in-shared-intermediate.patch
@@ -0,0 +1,24 @@
+--- a/tools/gyp/pylib/gyp/generator/ninja.py	2022-04-27 01:03:31.000000000 +0300
++++ b/tools/gyp/pylib/gyp/generator/ninja.py	2022-07-13 10:20:33.573771172 +0300
+@@ -42,7 +42,7 @@
+     # the start of a string, while $| is used for variables that can appear
+     # anywhere in a string.
+     "INTERMEDIATE_DIR": "$!INTERMEDIATE_DIR",
+-    "SHARED_INTERMEDIATE_DIR": "$!PRODUCT_DIR/gen",
++    "SHARED_INTERMEDIATE_DIR": "$!PRODUCT_DIR/$|OBJ/gen",
+     "PRODUCT_DIR": "$!PRODUCT_DIR",
+     "CONFIGURATION_NAME": "$|CONFIGURATION_NAME",
+     # Special variables that may be used by gyp 'rule' targets.
+@@ -285,6 +285,12 @@
+         CONFIGURATION_NAME = "$|CONFIGURATION_NAME"
+         path = path.replace(CONFIGURATION_NAME, self.config_name)
+ 
++        obj = "obj"
++        if self.toolset != "target":
++            obj += "." + self.toolset
++
++        path = path.replace("$|OBJ", obj)
++
+         return path
+ 
+     def ExpandRuleVariables(self, path, root, dirname, source, ext, name):
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
