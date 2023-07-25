Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E345C001DE
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 17:32:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8243360769;
	Tue, 25 Jul 2023 17:32:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8243360769
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3ISEYfuCnBxH; Tue, 25 Jul 2023 17:32:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7762160F6F;
	Tue, 25 Jul 2023 17:32:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7762160F6F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C55171BF317
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 17:32:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F9E181F0D
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 17:32:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F9E181F0D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3mrs-0kZsCGl for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 17:32:19 +0000 (UTC)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0CE3E81F08
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 17:32:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CE3E81F08
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-317716a4622so400661f8f.1
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 10:32:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690306337; x=1690911137;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eicuXxK9IO7g4vCxBgrLGdKXR83B0NNUUtnYx2o+Ku0=;
 b=cbh2DruNfwKnifalHwUKtPtlR7dUhldCdPRA95P72JWehGTi1UqE0r4FQg/JoQcryj
 SyVrh/PeaZnSS4DCODd2Y6z0pj04d2fxjmeSISxXR0v/dOVTKa3n2z8ECKrMI1fSN/Ix
 607nWqSMGyhix8UVsqdLmdsvQRVHnNr8U8+r3cIuxH0iSXRRKFooDw5Qycu3t/UMkWsd
 t9iFW/ODIV4YeSBzJjH9kZAWj2hsaXEL58n6IZ0lAKf/3jDNYrBTYlnDUJC8wJgCEnCc
 O6PftFjoskqcSY6b4EFRW3kAiLc8CklH5OYTJAslfz2W47uND5kHF5TXnAPfp7qNxrft
 RFcw==
X-Gm-Message-State: ABy/qLb/3xpMUmOt4ptiUPC22jQusv5onx4mGsDpblG8XM9PH5pdeeUY
 RMLce7BFICv8XgE1xatrd10xbOxoeR1pyNao2Rk=
X-Google-Smtp-Source: APBJJlEh8sDRHogmQw4ByF8uG4zimvcJ4nJHgIRN8CvP0OeNyNEGNfG8dHlm16MlL8ah5+B5CrNXXQ==
X-Received: by 2002:a05:6000:506:b0:316:d887:624a with SMTP id
 a6-20020a056000050600b00316d887624amr9463319wrf.15.1690306336731; 
 Tue, 25 Jul 2023 10:32:16 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:5384:6b50:e537:2825:8aee:d1db])
 by smtp.gmail.com with ESMTPSA id
 q4-20020a5d61c4000000b00316eb7770b8sm11721541wrv.5.2023.07.25.10.31.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 10:31:08 -0700 (PDT)
From: Sebastian Weyer <sebastian.weyer@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 25 Jul 2023 19:30:52 +0200
Message-Id: <20230725173102.543874-1-sebastian.weyer@smile.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1690306337; x=1690911137;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eicuXxK9IO7g4vCxBgrLGdKXR83B0NNUUtnYx2o+Ku0=;
 b=xF5axdvSZFG9CKaBQqq4ZBoGzL6KNFltRnaDyGJkRdDII3ahjUJVTauwf6xTthrhDr
 uavI5Tp8Hx56zS+YhjmWMj8SdXAdt6pwat3LpMlt6A80DHgvEyTuJpojxYpEu9MhEIpr
 bpjbuhMprLexFPhqIxvLyZfJD/EPbV90XG18OwcEPISiF0ZLizwI08eZvu2gpFtXJFEx
 Mw0499ye5yJMludhTrTdqKvzB99Wgtn26tnH8M8YMep2XTcucmaelxiLCItxn8HJnjlp
 s3tcDNnJSkOSnR9a36CBfAbHe7OiZJmKejzTS/2EVVbCOIN/gVuqbh2TEdoeXeIc7UPe
 ERgw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=xF5axdvS
Subject: [Buildroot] [PATCH v2 0/9] Add support for Rusticl in mesa3d
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
Cc: Sebastian Weyer <sebastian.weyer@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This series of patches adds everything necessary to be able to compile
Rusticl inside of mesa3d. It was successfully tested on a Khadas VIM3
board with a Mali-G52 GPU using mesa's Gallium panfrost driver. The
requirements can be found on its documentation website[1].

We need opencl-icd-loader as an additional package since the Rusticl
library will be installed as libRusticlOpenCL.so. The opencl-icd-loader
package will provide a libOpenCL.so file that can capture the OpenCL API
calls and forward them to the correct implementation. The available
OpenCL providers can be configured by creating a file in
/etc/OpenCL/vendors/[2]. In order to build this package we also need the
C language OpenCL headers which are not yet included in Buildroot since
for now we only have the C++ headers (opencl-clhpp).

The package opencl-icd-loader is included as a dependency in mesa3d as
it needs to be present in the sysroot before packages depending on
libopencl are built.

We need to make the Rust compiler known to the meson infrastructure
since it will abort the build of a Rust package if it isn't found. We
also need to add support for cross compilation in the
cross-compilation.conf.in template file and add a regex so that the
compiler and linker are properly inserted.

[1] https://docs.mesa3d.org/rusticl.html
[2] https://github.com/KhronosGroup/OpenCL-ICD-Loader#registering-icds

v2: remove "experimental" from final commit header since rusticl is not
experimental

Romain Naour (7):
  package/rust-bindgen: new host package
  package/llvm-project/llvm: add llvm dump support
  package/pkg-meson.mk: add rust cross-compiler support
  package/spirv-headers: new package
  package/spirv-tools: new package
  package/spirv-llvm-translator: add target variant to provide
    LLVMSPIRVLib
  package/mesa3d: add RustiCL support

Sebastian Weyer (2):
  package/opencl-headers: new package
  package/opencl-icd-loader: new package

 DEVELOPERS                                    |  5 +++
 package/Config.in                             |  5 +++
 package/llvm-project/llvm/Config.in           |  6 +++
 package/llvm-project/llvm/llvm.mk             |  7 ++++
 package/mesa3d/Config.in                      | 19 ++++++++-
 package/mesa3d/mesa3d.mk                      | 20 ++++++++-
 package/opencl-headers/Config.in              |  7 ++++
 package/opencl-headers/opencl-headers.hash    |  3 ++
 package/opencl-headers/opencl-headers.mk      | 42 +++++++++++++++++++
 package/opencl-icd-loader/Config.in           | 12 ++++++
 .../opencl-icd-loader/opencl-icd-loader.hash  |  3 ++
 .../opencl-icd-loader/opencl-icd-loader.mk    | 19 +++++++++
 package/pkg-meson.mk                          | 13 ++++++
 package/rust-bindgen/rust-bindgen.hash        |  3 ++
 package/rust-bindgen/rust-bindgen.mk          | 17 ++++++++
 package/spirv-headers/Config.in               |  6 +++
 package/spirv-headers/spirv-headers.hash      |  2 +
 package/spirv-headers/spirv-headers.mk        | 15 +++++++
 package/spirv-llvm-translator/Config.in       | 22 ++++++++++
 .../spirv-llvm-translator.mk                  | 13 +++++-
 package/spirv-tools/Config.in                 | 12 ++++++
 package/spirv-tools/spirv-tools.hash          |  2 +
 package/spirv-tools/spirv-tools.mk            | 22 ++++++++++
 support/misc/cross-compilation.conf.in        |  2 +
 24 files changed, 274 insertions(+), 3 deletions(-)
 create mode 100644 package/opencl-headers/Config.in
 create mode 100644 package/opencl-headers/opencl-headers.hash
 create mode 100644 package/opencl-headers/opencl-headers.mk
 create mode 100644 package/opencl-icd-loader/Config.in
 create mode 100644 package/opencl-icd-loader/opencl-icd-loader.hash
 create mode 100644 package/opencl-icd-loader/opencl-icd-loader.mk
 create mode 100644 package/rust-bindgen/rust-bindgen.hash
 create mode 100644 package/rust-bindgen/rust-bindgen.mk
 create mode 100644 package/spirv-headers/Config.in
 create mode 100644 package/spirv-headers/spirv-headers.hash
 create mode 100644 package/spirv-headers/spirv-headers.mk
 create mode 100644 package/spirv-llvm-translator/Config.in
 create mode 100644 package/spirv-tools/Config.in
 create mode 100644 package/spirv-tools/spirv-tools.hash
 create mode 100644 package/spirv-tools/spirv-tools.mk

--
2.34.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
