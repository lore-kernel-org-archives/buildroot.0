Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08C47CA0FF1
	for <buildroot@archiver.kernel.org>; Fri, 30 Aug 2024 13:27:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E4B642532;
	Fri, 30 Aug 2024 13:27:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aySH2GcmPOVv; Fri, 30 Aug 2024 13:27:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86D074064D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86D074064D;
	Fri, 30 Aug 2024 13:27:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5ADD31BF5B3
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 13:27:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B797613C3
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 13:27:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LOXj-iZnyhVb for <buildroot@lists.busybox.net>;
 Fri, 30 Aug 2024 13:27:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F0528613B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0528613B9
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F0528613B9
 for <buildroot@buildroot.org>; Fri, 30 Aug 2024 13:27:49 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-534366c1aa2so1937708e87.1
 for <buildroot@buildroot.org>; Fri, 30 Aug 2024 06:27:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725024468; x=1725629268;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yjwxSKVEKU8+5nGylRR9NhSfiH9FMkbQYUBwzPTturQ=;
 b=a9tO3Ct6ktK2SpisjyxKRLPrcTTeY0lX6CXCV2NbxjnQZHf0yGmIZI75/C5sDrJhTJ
 p4OwkuPslzfUZ7hEwI9meq7cLVR0OVqQW1a5tYY2va/WgDpVVUyov2ArHO+iHfYJ+Ay+
 kommWRtZpnH0PAFppj9kUK+oVIUBv05sPN0LBw19E+10WMWHUXSP88u2eNKZAIEQ25+u
 T2xvsWpnydhk31d0OvD+9qchBLet68tBq1vzfoplM0czSk3f1MANdwT5SwsRz3Lbdvve
 gmzqcTnQzpE3KTJRC/g7mFSUn3YeLZnqXgsyDOBtRwYkBQ7NyofIoQ1yQDqQw9yeY3Ou
 Z29Q==
X-Gm-Message-State: AOJu0YwNitgnOxEeapv5fiEHtgN46mnaLtsr+9jSlSVUSsL6SQJMn1D0
 sWbZcKwoc1ooTjTO/atjnlZPSM4DjP2ehRuTgUlmmonRCjdgAAempImfEA==
X-Google-Smtp-Source: AGHT+IFlmMWXGJO9oVWAKhuKLBF79BAd1zSUvxZtxXEtnrV9qz9e80m57SYPsLE0zmPFXJjABQIBGQ==
X-Received: by 2002:a05:6512:ad1:b0:52e:9f76:53dc with SMTP id
 2adb3069b0e04-53546a59f62mr1614129e87.0.1725024466760; 
 Fri, 30 Aug 2024 06:27:46 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-535407ac3f4sm604615e87.110.2024.08.30.06.27.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2024 06:27:45 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 30 Aug 2024 15:27:40 +0200
Message-ID: <20240830132741.874584-1-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240828110647.150583-1-roykollensvendsen@gmail.com>
References: <20240828110647.150583-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725024468; x=1725629268; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yjwxSKVEKU8+5nGylRR9NhSfiH9FMkbQYUBwzPTturQ=;
 b=mgRUx6GwBrnJd0KY8u+qK/gMdd1GXEVlb2C0YUeME/5DTMZTz2a1u1jTLzDJEJgMTi
 QJ/tNVPeWlQY4y9FometbxJAdNbFfGGNXNy4Y7rOrulS1w6D9bCSlnoCF6CyTH+aOw0l
 PgSym3LnUt7E9p5hmRViYPc4MJ9uUVPORN6i0r2p3ulEaV3NHsi5YSov4iQR8OYUXOP4
 zqovn/sHycbBts3S8owna3xJhXLsNxGgt/6IOVF4TsAmrolpVyF6U9pcbZZLx0j9GbfZ
 85V+/5jAsi7SgcJAeUtjkWrcOqmcvZsfQFDaIcmFr0aPJhSBnSDMWuJNkXYJNJdv+cdE
 7efQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=mgRUx6Gw
Subject: [Buildroot] [PATCH v2] package/qt6: fix license information
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
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Jesse Van Gavere <jesseevg@gmail.com>,
 Andreas Naumann <ANaumann@ultratronik.de>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

My goal here is to update the license information for the qt6 packages
to be more complete, organized and consistent between packages.

By automating the process it is easier to achieve this and keep the
license-information up to date.

My (private for now) python script walks through all souce files to
gather SPDX-Identifers and then walks through all
qt_attribution.json-files to gather even more license identifiers.

The script sorts all the identifiers, without repeating any of them.

The script ignores the Qt Commercial license to follow the existing
pattern.

It then associates source files to these identifiers. Further it walks
through the qt_attribution.json-files and associates the software
component names (IDs) with the correct license as described within the
qt_attribution.json-files.

The script then generates something like this for all the qt6 packages:

...
QT6SVG_LICENSE = \
	BSD-3-Clause ( \
		CMakeLists.txt \
		...
		src/svg/doc/snippets/doc_src_qtsvg.cpp \
		...
		tests/manual/examples/embedded/fluidlauncher/main.cpp), \
	GFDL-1.3-no-invariants ( \
		doc/src/examples/delayedencoding.qdoc \
		...), \
	GPL-3.0 ( \
		tests/auto/qicon_svg/tst_qicon_svg.cpp \
		...), \
	HPND-sell-variant ( \
		SOFTWARE COMPONENT: xsvg), \
	LGPL-3.0 or GPL-2.0 or GPL-3.0 ( \
		src/plugins/iconengines/svgiconengine/main.cpp \
		...
		src/svg/qsvgnode.cpp \
		...
		src/svgwidgets/qsvgwidget.cpp \
		...)
...

I can then manually go through the list of files and software components
to produce the following:

...
QT6SVG_LICENSE = \
	BSD-3-Clause (buildsystem, examples, snippets), \
	GFDL-1.3-no-invariants (docs), \
	GPL-3.0 (tests), \
	HPND-sell-variant (xsvg), \
	LGPL-3.0 or GPL-2.0 or GPL-3.0 (plugins, modules)
...

OR, AND, WITH is converted to lower-case, to match the pattern used
in buildroot, and the dashes are kept as is. The licenses are not
repeated and they are only listed once. '-once' is also removed from
the license identifiers to follow another existing pattern in buildroot.

The script then goes through the LICENSES-folder and walks through all
the qt_attribution.json-files again to find all the other license files:

QT6SVG_LICENSE_FILES = \
	LICENSES/BSD-3-Clause.txt \
	LICENSES/GFDL-1.3-no-invariants-only.txt \
	LICENSES/GPL-2.0-only.txt \
	LICENSES/GPL-3.0-only.txt \
	LICENSES/LGPL-3.0-only.txt \
	LICENSES/Qt-GPL-exception-1.0.txt \
	src/svg/XSVG_LICENSE.txt
...

And also generates hashes for these files:

...
sha256  fb0d1286a35be3583fee34aeb5843c94719e07193bdf1d4d8b0dc14009caef01  qtsvg-everywhere-src-6.7.2.tar.xz

sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
sha256  3a946598a9f674d44df764279ca0b85b5d6faba08f3bc75d8e0fcf6cd729a9bd  src/svg/XSVG_LICENSE.txt
...

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
Changes v1 -> v2:
  - Describe my intention and process in the commit-message  (suggested by Thomas)
  - Update the script to not remove dashes
  - Also run the script for qt6base and manually summarize the associated files and software components
  - Keep 'Qt-GPL-exception-1.0' in license identifer instead of replacing it with 'exception'
  - Complete the manual summary step also for qt6opcua
  - Go through manual summary step again and make sure I meld all changes from generated qt6 to buildroot qt6
  - Consistantly use license id (not name) from qt_attribution.json

 package/qt6/qt6base/qt6base.hash              |  62 ++++++++++-
 package/qt6/qt6base/qt6base.mk                | 104 ++++++++++++++++--
 .../qt6/qt6core5compat/qt6core5compat.hash    |   7 ++
 package/qt6/qt6core5compat/qt6core5compat.mk  |  19 +++-
 .../qt6/qt6declarative/qt6declarative.hash    |   7 +-
 package/qt6/qt6declarative/qt6declarative.mk  |  26 +++--
 .../qt6languageserver/qt6languageserver.hash  |   1 -
 .../qt6languageserver/qt6languageserver.mk    |  11 +-
 package/qt6/qt6mqtt/qt6mqtt.hash              |   1 -
 package/qt6/qt6mqtt/qt6mqtt.mk                |   9 +-
 package/qt6/qt6opcua/qt6opcua.hash            |   7 ++
 package/qt6/qt6opcua/qt6opcua.mk              |  18 ++-
 package/qt6/qt6serialbus/qt6serialbus.hash    |   1 -
 package/qt6/qt6serialbus/qt6serialbus.mk      |  10 +-
 package/qt6/qt6serialport/qt6serialport.mk    |   8 +-
 .../qt6/qt6shadertools/qt6shadertools.hash    |   5 +
 package/qt6/qt6shadertools/qt6shadertools.mk  |  21 +++-
 package/qt6/qt6svg/qt6svg.hash                |   1 +
 package/qt6/qt6svg/qt6svg.mk                  |  12 +-
 package/qt6/qt6tools/qt6tools.hash            |   5 +-
 package/qt6/qt6tools/qt6tools.mk              |  20 +++-
 .../qt6virtualkeyboard.hash                   |   1 -
 .../qt6virtualkeyboard/qt6virtualkeyboard.mk  |  10 +-
 package/qt6/qt6wayland/qt6wayland.hash        |   3 +-
 package/qt6/qt6wayland/qt6wayland.mk          |  17 ++-
 package/qt6/qt6websockets/qt6websockets.hash  |   1 -
 package/qt6/qt6websockets/qt6websockets.mk    |  11 +-
 27 files changed, 320 insertions(+), 78 deletions(-)

diff --git a/package/qt6/qt6base/qt6base.hash b/package/qt6/qt6base/qt6base.hash
index b1b81b4992..ce22339502 100644
--- a/package/qt6/qt6base/qt6base.hash
+++ b/package/qt6/qt6base/qt6base.hash
@@ -1,14 +1,72 @@
 # Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.2/submodules/qtbase-everywhere-src-6.7.2.tar.xz.sha256
 sha256  c5f22a5e10fb162895ded7de0963328e7307611c688487b5d152c9ee64767599  qtbase-everywhere-src-6.7.2.tar.xz
 
-# Hashes for license files
+# Hashes for license files:
+sha256  93bb4f7417aa775bab9026cc3d0af28aeb64451fc5a8ec651876785edd8eaf9b  LICENSES/AFL-2.1.txt
 sha256  e3ba223bb1423f0aad8c3dfce0fe3148db48926d41e6fbc3afbbf5ff9e1c89cb  LICENSES/Apache-2.0.txt
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
 sha256  3abd6471b9a9a08d65ce771143f8e278bb4c1aeb10c1c2d476935a6b049653f5  LICENSES/BSL-1.0.txt
+sha256  a2010f343487d3f7618affe54f789f5487602331c0a8d03f49e9a7c547cf0499  LICENSES/CC0-1.0.txt
 sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-or-later.txt
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
+sha256  0526625fcc746a42d3f19a0ab357d3dc8479fdbe3bfd168825498f50215c7a63  LICENSES/LicenseRef-BSD-3-Clause-with-PCRE2-Binary-Like-Packages-Exception.txt
+sha256  65d86b8ec6b1cd8b8f6e64fd8710274ba00d6a3c520e00dfdcd1c3d2071f3305  LICENSES/LicenseRef-SHA1-Public-Domain.txt
 sha256  d040359701c01996a017d5c515678929cd1b0625e64cb86db44025fbb6cdf1fc  LICENSES/MIT.txt
 sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
-sha256  2a886915de4f296cdae5ed67064f86dba01d0c55286d86e8487f2a5caaf40216  src/3rdparty/harfbuzz-ng/COPYING
+sha256  80bb6294022d8764adb36a9d65ebb6bd94efb1865918a71e31e6c247607d7634  LICENSES/Unicode-3.0.txt
+sha256  1a33fc12a3abb0b3eb14db70e36ef1d0af51c93b1cc1f80f022c3bd406e9b874  LICENSES/Unicode-DFS-2016.txt
+sha256  592db1199aab67aafe4515db9808b420db122083807c5329b2f061951e79acbe  LICENSES/blessing.txt
+sha256  46cde7dc11e64c78d650b4851b88f6704b4665ff60f22a1caf68ceb15e217e5b  cmake/3rdparty/extra-cmake-modules/COPYING-CMAKE-SCRIPTS
+sha256  46cde7dc11e64c78d650b4851b88f6704b4665ff60f22a1caf68ceb15e217e5b  cmake/3rdparty/kwin/COPYING-CMAKE-SCRIPTS
+sha256  1b3941c52b26d42c510afbdf205a8b96a6d64f5a7b8ebff0287979fd91dfd52f  src/3rdparty/D3D12MemoryAllocator/LICENSE.txt
+sha256  846d97c8b74ccaa92b9ad031140a04363b3b3985f318094552f297b8bda1c68e  src/3rdparty/VulkanMemoryAllocator/LICENSE.txt
+sha256  4a51cf7f724f51bedb5fa4f9583a2762f1db8d05e43a577e2487c7aab2fdce18  src/3rdparty/android/LICENSE
+sha256  4103f471877ed0bae500752c5fcd7ecca409d4a4a8dc2ad40437daba60f1a2bc  src/3rdparty/blake2/COPYING
+sha256  4af93c12062c58058378de2397dc1c92bbff9ddfb1d583a01c84127557ce97ca  src/3rdparty/double-conversion/LICENSE
+sha256  92fac99458f1754b73edf50f9c9983e0efaa06ad96e2afd5e538c79f45b4b191  src/3rdparty/easing/LICENSE
+sha256  d0d683ae18e78fbef90eb41168fb781920da2d12bf80704490f0882915c18ae0  src/3rdparty/forkfd/LICENSE
+sha256  e4e792f29e66750f2e410fd7b50a567652c180f6ee15e1a4dfa0bb5cde524537  src/3rdparty/freetype/BDF-LICENSE.txt
+sha256  bf543cdda11864477b8d2ca2aa9afc2aaa8f9133461b4d962ed6ec73646256a1  src/3rdparty/freetype/LICENSE.txt
+sha256  6938597bfdeca0db191a8f9ede52eaf2482c2c71a0094c084747a1235f9958fe  src/3rdparty/freetype/PCF-LICENSE.txt
+sha256  2b1f5d615382a151af3eb71462ad17d89e2efee8fa7664058d35d3d9237ebb19  src/3rdparty/freetype/ZLIB-LICENSE.txt
+sha256  e5bfcf1132c8e12c3fce87d4dfbcb543cfb7202d8fa28ba85c07132e30836437  src/3rdparty/gradle/LICENSE
+sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  src/3rdparty/harfbuzz-ng/COPYING
+sha256  603fb8e9a443c95cb56c0e458a0ad17fdcadfc5bbb7e580d2199ee0145882746  src/3rdparty/iaccessible2/LICENSE
+sha256  9e34ff47b3a44814e183342e7e198d127a6740e29d20e8381fba7688dafc79dd  src/3rdparty/icc/LICENSE.txt
+sha256  f26a2c0b6c1ab7e40444de31cc5b112a534cc589d6fd9b93620054e9692b81c6  src/3rdparty/libjpeg/COPYRIGHT.txt
+sha256  e548c96c0c09397c94b5c5531836c02ff2c403f1f2b130cad8e3ec9439b5a7cc  src/3rdparty/libjpeg/LICENSE
+sha256  1cb448f5e2e6d3aca60943f4eee1a04675628dc0266a074a42bc1560ebc28d61  src/3rdparty/libjpeg/ijg-license.txt
+sha256  7317e078e2d3b5d7ba5a6159e650945153262b44b76f6700f8e9edb261c5143e  src/3rdparty/libpng/LICENSE
+sha256  3f3d9e0024b1921b067d6f7f88deb4a60cbe7a78e76c64e3f1d7fc3b779b9d04  src/3rdparty/libpsl/PSL-LICENSE.txt
+sha256  1d7f52747a9169751cdf2641a8299c0098e9ecdf9429296ffd55bdb14c9ed5b3  src/3rdparty/libpsl/src/LICENSE.chromium
+sha256  d30937367d5413e7eaa218b1640b8946ff76fd34d97152f6979fd96169d5d0fc  src/3rdparty/md4c/LICENSE.md
+sha256  030087e2e8dd7c1bdd26057d25d4ded8f45bbf01ad458d68665ad04b8b0fbedf  src/3rdparty/pcre2/LICENCE
+sha256  48b7773d240da636ed7be0ec470df49de0665f660bba7cb913403bf90e007fb1  src/3rdparty/pcre2/LICENCE-SLJIT
+sha256  942c4f2a80394d3f53599b8382e9f27349b95c45d92b69b84f26d404f4dd74a5  src/3rdparty/pixman/LICENSE
+sha256  7ccebd514aaabc86192f957d773cebf06577c12fe9f25ecd419c6cac5da7a14c  src/3rdparty/rfc6234/LICENSE
+sha256  2fed6f252ca4a7e813811de3cd3cd08183edd4138bdee909410ef6eee394e82c  src/3rdparty/sha3/BRG_ENDIAN_LICENSE
+sha256  1f2786e2c5befeb4dcba6638db6528bf96ef5d2cf24bc85ab5a81ef00abef59d  src/3rdparty/sha3/CC0_LICENSE
+sha256  3c6ba0b5bfa7830505301ffb336a17b0748e0d61c4d34216e9dc98f10e40395e  src/3rdparty/tinycbor/LICENSE
+sha256  7a083b136e64d064794c3419751e5c7dd10d2f64c108fe5ba161eae5e5958a93  src/3rdparty/wasm/DEJAVU-LICENSE
+sha256  71a7629ae51eab38d483b6d5c86a34ab7d459f5319a16746684acca768e38c47  src/3rdparty/wasm/VERA-LICENSE
+sha256  c10225ebbd5191bfdd761b0d7752c785f2453ab665d6c454473fb12d254668aa  src/3rdparty/wintab/LICENSE.txt
+sha256  82775191bc05f85b40404d77bb69b1edeaeb4033f48387e9e5eab4dd67f5d6f1  src/3rdparty/xcb/LICENSE
+sha256  d7e3139972874dc8abdbbfce27ec1e6f942b28279dd7d27453630a8b4610e080  src/3rdparty/zlib/LICENSE
+sha256  e9e5b9f66d21c0e88a4179525ab39cd8d7eac9af78a8404f322c32b0874783d5  src/corelib/kernel/QEVENTDISPATCHER_CF_LICENSE.txt
+sha256  36ffd9dc085d529a7e60e1276d73ae5a030b020313e6c5408593a6ae2af39673  src/corelib/tools/LICENSE.siphash
+sha256  ad90aa08bb1a9b7056aa51e2e215b36630855457cde5dffd36aa0faa7b169f24  src/dbus/LIBDBUS-1-LICENSE.txt
+sha256  2e484f3c26ff5008c704a3ca9dd809d43f24a004a1abb6c202660fbff0d19715  src/gui/opengl/KHRONOS_LICENSE.txt
+sha256  46b3cbfa2f2946b93291506351e9be1dd0a28d2a53260f5aa488abd36fbeca9d  src/gui/painting/QIMAGETRANSFORM_LICENSE.txt
+sha256  a216b01291eb38fc1af93cfccf1fc67b48d9923612e517c2a695e95b3f03c22c  src/gui/painting/XCONSORTIUM_LICENSE.txt
+sha256  cf248820bf1178370bb4f1670a59f8748d46bc96d0f64080cd631511c6046409  src/gui/rhi/MiniEngine_LICENSE.txt
+sha256  40818155548ff41c67d3a40edf355e9658992b292c227f4c1147425cedc746c6  src/gui/text/AGLFN_LICENSE.txt
+sha256  5f618873b0cdd1e84c611c5529212c2524bfc887bdfd7d1f3b568bad3c649612  src/gui/vulkan/LICENSE.txt
+sha256  e9e5b9f66d21c0e88a4179525ab39cd8d7eac9af78a8404f322c32b0874783d5  src/plugins/platforms/cocoa/COCOA_LICENSE.txt
+sha256  cb5aedb296c5246d1f22e9099f925a65146f9f0d6b4eebba97fd27a6cdbbab2d  src/testlib/3rdparty/CYCLE_LICENSE.txt
+sha256  ed71cfca021790f74094e9810f42e31288e7f43cf00c8d9ac8d6f904124bd815  src/testlib/3rdparty/LINUX_LICENSE.txt
+sha256  ec72eebd6326165156787da828caaa18386489387aefaa073c9bd40b8b2a400e  src/testlib/3rdparty/VALGRIND_LICENSE.txt
+sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  tests/auto/testlib/selftests/CATCH_LICENSE.txt
+sha256  9be732e45b638c74f9c0e5248541dd54dc7e8e9a5545df96b5c4b7c9ac0c68ba  util/gradientgen/WEBGRADIENTS_LICENSE.txt
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 4c0392f92d..3ecd6a505d 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -16,24 +16,112 @@ QT6BASE_IGNORE_CVES += CVE-2024-39936
 QT6BASE_CMAKE_BACKEND = ninja
 
 QT6BASE_LICENSE = \
-	GPL-2.0+ or LGPL-3.0, \
-	GPL-3.0 with exception (tools), \
-	GFDL-1.3 (docs), \
-	Apache-2.0, \
-	BSD-3-Clause, \
-	BSL-1.0, \
-	MIT
+	AFL-2.1 or GPL-2.0+ (libdbus-1-headers), \
+	Apache-2.0 (utils), \
+	Apache-2.0 or MIT (vulkan-xml-spec), \
+	BSD-2-Clause (pcre2-sljit, sha3_endian), \
+	BSD-2-Clause and Imlib2 (smooth-scaling-algorithm), \
+	BSD-3-Clause (aglfn, doubleconversion, easing, extra-cmake-modules, \
+		iaccessible2, kwin, libpsl, qeventdispatcher_cf, \
+		rfc6234, buildsystem, examples, snippets, utils), \
+	BSD-4-Clause (valgrind), \
+	BSL-1.0 (catch2), \
+	CC0-1.0 (md4, md5, sha3_keccak, siphash), \
+	CC0-1.0 or Apache-2.0 (blake2), \
+	FTL or GPL-2.0 (freetype, grayraster), \
+	GFDL-1.3-no-invariants (docs), \
+	GPL-2.0 with Linux-syscall-note (linuxperf), \
+	GPL-3.0 (plugins, tests, utils), \
+	GPL-3.0 with Qt-GPL-exception-1.0 (tools, tests, util) \
+	IJG and BSD-3-Clause (libjpeg), \
+	LGPL-3.0 or GPL-2.0 or GPL-3.0 (modules, plugins), \
+	Libpng and libpng-2.0 (libpng), \
+	LicenseRef-BSD-3-Clause-with-PCRE2-Binary-Like-Packages-Exception (pcre2), \
+	LicenseRef-ICC-License (icc-sRGB-color-profile), \
+	LicenseRef-SHA1-Public-Domain (sha1), \
+	MIT (D3D12MemoryAllocator, VulkanMemoryAllocator, cycle, forkfd, \
+		freetype-bdf, harfbuzz-ng, md4c, opengl-es2-headers, \
+		opengl-headers, pixman, rhi-miniengine-d3d12-mipmap, \
+		tinycbor, webgradients, xcb-xinput), \
+	MIT and MIT-open-group (freetype-pcf), \
+	MPL-2.0 (psl-data), \
+	Unicode-3.0 (unicode-cldr), \
+	Unicode-DFS-2016 (unicode-character-database), \
+	X11 and HPND (xserverhelper), \
+	Zlib (freetype-zlib, zlib), \
+	blessing (sqlite), \
+	urn:dje:license:bitstream (dejayvu, vera_font), \
+	urn:dje:license:lcs-telegraphics (wintab)
 
 QT6BASE_LICENSE_FILES = \
+	LICENSES/AFL-2.1.txt \
 	LICENSES/Apache-2.0.txt \
 	LICENSES/BSD-3-Clause.txt \
 	LICENSES/BSL-1.0.txt \
+	LICENSES/CC0-1.0.txt \
 	LICENSES/GFDL-1.3-no-invariants-only.txt \
 	LICENSES/GPL-2.0-only.txt \
+	LICENSES/GPL-2.0-or-later.txt \
 	LICENSES/GPL-3.0-only.txt \
 	LICENSES/LGPL-3.0-only.txt \
+	LICENSES/LicenseRef-BSD-3-Clause-with-PCRE2-Binary-Like-Packages-Exception.txt \
+	LICENSES/LicenseRef-SHA1-Public-Domain.txt \
 	LICENSES/MIT.txt \
-	LICENSES/Qt-GPL-exception-1.0.txt
+	LICENSES/Qt-GPL-exception-1.0.txt \
+	LICENSES/Unicode-3.0.txt \
+	LICENSES/Unicode-DFS-2016.txt \
+	LICENSES/blessing.txt \
+	cmake/3rdparty/extra-cmake-modules/COPYING-CMAKE-SCRIPTS \
+	cmake/3rdparty/kwin/COPYING-CMAKE-SCRIPTS \
+	src/3rdparty/D3D12MemoryAllocator/LICENSE.txt \
+	src/3rdparty/VulkanMemoryAllocator/LICENSE.txt \
+	src/3rdparty/android/LICENSE \
+	src/3rdparty/blake2/COPYING \
+	src/3rdparty/double-conversion/LICENSE \
+	src/3rdparty/easing/LICENSE \
+	src/3rdparty/forkfd/LICENSE \
+	src/3rdparty/freetype/BDF-LICENSE.txt \
+	src/3rdparty/freetype/LICENSE.txt \
+	src/3rdparty/freetype/PCF-LICENSE.txt \
+	src/3rdparty/freetype/ZLIB-LICENSE.txt \
+	src/3rdparty/gradle/LICENSE \
+	src/3rdparty/harfbuzz-ng/COPYING \
+	src/3rdparty/iaccessible2/LICENSE \
+	src/3rdparty/icc/LICENSE.txt \
+	src/3rdparty/libjpeg/COPYRIGHT.txt \
+	src/3rdparty/libjpeg/LICENSE \
+	src/3rdparty/libjpeg/ijg-license.txt \
+	src/3rdparty/libpng/LICENSE \
+	src/3rdparty/libpsl/PSL-LICENSE.txt \
+	src/3rdparty/libpsl/src/LICENSE.chromium \
+	src/3rdparty/md4c/LICENSE.md \
+	src/3rdparty/pcre2/LICENCE \
+	src/3rdparty/pcre2/LICENCE-SLJIT \
+	src/3rdparty/pixman/LICENSE \
+	src/3rdparty/rfc6234/LICENSE \
+	src/3rdparty/sha3/BRG_ENDIAN_LICENSE \
+	src/3rdparty/sha3/CC0_LICENSE \
+	src/3rdparty/tinycbor/LICENSE \
+	src/3rdparty/wasm/DEJAVU-LICENSE \
+	src/3rdparty/wasm/VERA-LICENSE \
+	src/3rdparty/wintab/LICENSE.txt \
+	src/3rdparty/xcb/LICENSE \
+	src/3rdparty/zlib/LICENSE \
+	src/corelib/kernel/QEVENTDISPATCHER_CF_LICENSE.txt \
+	src/corelib/tools/LICENSE.siphash \
+	src/dbus/LIBDBUS-1-LICENSE.txt \
+	src/gui/opengl/KHRONOS_LICENSE.txt \
+	src/gui/painting/QIMAGETRANSFORM_LICENSE.txt \
+	src/gui/painting/XCONSORTIUM_LICENSE.txt \
+	src/gui/rhi/MiniEngine_LICENSE.txt \
+	src/gui/text/AGLFN_LICENSE.txt \
+	src/gui/vulkan/LICENSE.txt \
+	src/plugins/platforms/cocoa/COCOA_LICENSE.txt \
+	src/testlib/3rdparty/CYCLE_LICENSE.txt \
+	src/testlib/3rdparty/LINUX_LICENSE.txt \
+	src/testlib/3rdparty/VALGRIND_LICENSE.txt \
+	tests/auto/testlib/selftests/CATCH_LICENSE.txt \
+	util/gradientgen/WEBGRADIENTS_LICENSE.txt
 
 QT6BASE_DEPENDENCIES = \
 	host-qt6base \
diff --git a/package/qt6/qt6core5compat/qt6core5compat.hash b/package/qt6/qt6core5compat/qt6core5compat.hash
index 36421b53ca..5139e66a4a 100644
--- a/package/qt6/qt6core5compat/qt6core5compat.hash
+++ b/package/qt6/qt6core5compat/qt6core5compat.hash
@@ -8,3 +8,10 @@ sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENS
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
 sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
+sha256  425475b78739a2985e61c619ba833af364bba405c69e9cf2eb027e5790cc00c8  src/core5/codecs/QBIG5CODEC_LICENSE.txt
+sha256  a2cc13f96cc199017b0e41c4a44faef0cce9a024fac0710e39d8fc499d738bff  src/core5/codecs/QBKCODEC_LICENSE.txt
+sha256  a2a58c25c18cc5c203b2ebf7a706f6baeb93d43fc443bc095acded6d259842ea  src/core5/codecs/QEUCJPCODEC_LICENSE.txt
+sha256  1c1a8f5823b81498368ba5ff489f1c05fb61a71dcbe4ebd8138bde86837ade2c  src/core5/codecs/QEUCKRCODEC_LICENSE.txt
+sha256  a2a58c25c18cc5c203b2ebf7a706f6baeb93d43fc443bc095acded6d259842ea  src/core5/codecs/QJISCODEC_LICENSE.txt
+sha256  a2a58c25c18cc5c203b2ebf7a706f6baeb93d43fc443bc095acded6d259842ea  src/core5/codecs/QSJISCODEC_LICENSE.txt
+sha256  e749770c43d1287fa0c0855b2fefea4efa34e6cfa806cf3dc1efa5351a7774bc  src/core5/codecs/QTSCIICODEC_LICENSE.txt
diff --git a/package/qt6/qt6core5compat/qt6core5compat.mk b/package/qt6/qt6core5compat/qt6core5compat.mk
index 0b6d9369cb..3189c0ca7d 100644
--- a/package/qt6/qt6core5compat/qt6core5compat.mk
+++ b/package/qt6/qt6core5compat/qt6core5compat.mk
@@ -13,10 +13,12 @@ QT6CORE5COMPAT_SUPPORTS_IN_SOURCE_BUILD = NO
 QT6CORE5COMPAT_CMAKE_BACKEND = ninja
 
 QT6CORE5COMPAT_LICENSE = \
-	GPL-2.0+ or LGPL-3.0, \
-	GPL-3.0 with exception (tools), \
-	GFDL-1.3 (docs), \
-	BSD-3-Clause
+	BSD-2-Clause (codecs), \
+	BSD-3-Clause (buildsystem, examples, snippets, utils), \
+	GFDL-1.3-no-invariants (docs), \
+	GPL-3.0 (tests), \
+	GPL-3.0 with Qt-GPL-exception-1.0 (utils), \
+	LGPL-3.0 or GPL-2.0 or GPL-3.0 (codecs, modules, plugins)
 
 QT6CORE5COMPAT_LICENSE_FILES = \
 	LICENSES/BSD-3-Clause.txt \
@@ -24,7 +26,14 @@ QT6CORE5COMPAT_LICENSE_FILES = \
 	LICENSES/GPL-2.0-only.txt \
 	LICENSES/GPL-3.0-only.txt \
 	LICENSES/LGPL-3.0-only.txt \
-	LICENSES/Qt-GPL-exception-1.0.txt
+	LICENSES/Qt-GPL-exception-1.0.txt \
+	src/core5/codecs/QBIG5CODEC_LICENSE.txt \
+	src/core5/codecs/QBKCODEC_LICENSE.txt \
+	src/core5/codecs/QEUCJPCODEC_LICENSE.txt \
+	src/core5/codecs/QEUCKRCODEC_LICENSE.txt \
+	src/core5/codecs/QJISCODEC_LICENSE.txt \
+	src/core5/codecs/QSJISCODEC_LICENSE.txt \
+	src/core5/codecs/QTSCIICODEC_LICENSE.txt
 
 QT6CORE5COMPAT_CONF_OPTS = \
 	-DQT_HOST_PATH=$(HOST_DIR) \
diff --git a/package/qt6/qt6declarative/qt6declarative.hash b/package/qt6/qt6declarative/qt6declarative.hash
index 006b49e4b1..0229e17902 100644
--- a/package/qt6/qt6declarative/qt6declarative.hash
+++ b/package/qt6/qt6declarative/qt6declarative.hash
@@ -2,10 +2,15 @@
 sha256  4c29cba1af8c42d425d8eb6e01bad24cb80f4b983d71eef566a0542dfdb9b999  qtdeclarative-everywhere-src-6.7.2.tar.xz
 
 # Hashes for license files:
+sha256  e3ba223bb1423f0aad8c3dfce0fe3148db48926d41e6fbc3afbbf5ff9e1c89cb  LICENSES/Apache-2.0.txt
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
+sha256  e6bc9e9c474700b708f568bac9e5a8a9bcb2b1dad53442f5ba449fcb848b8e76  LICENSES/CC-BY-3.0.txt
 sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
-sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LICENSES/LicenseRef-Qt-Commercial.txt
+sha256  d040359701c01996a017d5c515678929cd1b0625e64cb86db44025fbb6cdf1fc  LICENSES/MIT.txt
+sha256  1d361a8f8e8ce6e68457dcd93fb56e162e6baa3bbb7e7573a290d44399f6b57e  LICENSES/OFL-1.1.txt
 sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
+sha256  9ba0c20a2972274f27e975d79ed3582e322d6891338266a52e2d3a9417fc0a72  src/3rdparty/masm/LICENSE
+sha256  a1c1daa9eec4db907907c0ccc42a4843bb996410f888b972a39fe152e829bc3d  src/quickcontrols/material/LICENSE_ANGULARJS.txt
diff --git a/package/qt6/qt6declarative/qt6declarative.mk b/package/qt6/qt6declarative/qt6declarative.mk
index 57a89a3b6e..929ade541b 100644
--- a/package/qt6/qt6declarative/qt6declarative.mk
+++ b/package/qt6/qt6declarative/qt6declarative.mk
@@ -14,20 +14,30 @@ QT6DECLARATIVE_SUPPORTS_IN_SOURCE_BUILD = NO
 QT6DECLARATIVE_CMAKE_BACKEND = ninja
 
 QT6DECLARATIVE_LICENSE = \
-	LGPL-3.0 or GPL-3.0 or GPL-2.0, \
-	BSD-3-Clause (docs), \
-	GFDL-1.3 no invariants (docs), \
-	BSD-3-Clause (examples), \
-	GPL-3.0 (tests), \
-	GPL-3.0 WITH Qt-GPL-exception-1.0 (tools)
+	Apache-2.0 (weatherforecast example, weather-icons), \
+	BSD-2-Clause (masm), \
+	BSD-3-Clause (buildsystem, examples, snippets), \
+	CC-BY-3.0 (map-of-europe), \
+	GFDL-1.3-no-invariants (docs), \
+	GPL-3.0 (tests, tools), \
+	GPL-3.0 with Qt-GPL-exception-1.0 (plugins, tests, tools), \
+	LGPL-3.0 or GPL-2.0 or GPL-3.0 (modules, plugins), \
+	MIT (gear-icon, shadow_angular_material), \
+	OFL-1.1 (work-sans-font)
 
 QT6DECLARATIVE_LICENSE_FILES = \
+	LICENSES/Apache-2.0.txt \
 	LICENSES/BSD-3-Clause.txt \
+	LICENSES/CC-BY-3.0.txt \
+	LICENSES/GFDL-1.3-no-invariants-only.txt \
 	LICENSES/GPL-2.0-only.txt \
 	LICENSES/GPL-3.0-only.txt \
 	LICENSES/LGPL-3.0-only.txt \
-	LICENSES/GFDL-1.3-no-invariants-only.txt \
-	LICENSES/Qt-GPL-exception-1.0.txt
+	LICENSES/MIT.txt \
+	LICENSES/OFL-1.1.txt \
+	LICENSES/Qt-GPL-exception-1.0.txt \
+	src/3rdparty/masm/LICENSE \
+	src/quickcontrols/material/LICENSE_ANGULARJS.txt
 
 QT6DECLARATIVE_CONF_OPTS = \
 	-DQT_HOST_PATH=$(HOST_DIR) \
diff --git a/package/qt6/qt6languageserver/qt6languageserver.hash b/package/qt6/qt6languageserver/qt6languageserver.hash
index 7266474428..d6dea6f05f 100644
--- a/package/qt6/qt6languageserver/qt6languageserver.hash
+++ b/package/qt6/qt6languageserver/qt6languageserver.hash
@@ -7,5 +7,4 @@ sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENS
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
-sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LICENSES/LicenseRef-Qt-Commercial.txt
 sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
diff --git a/package/qt6/qt6languageserver/qt6languageserver.mk b/package/qt6/qt6languageserver/qt6languageserver.mk
index 7ef5b9d92d..9c34c17405 100644
--- a/package/qt6/qt6languageserver/qt6languageserver.mk
+++ b/package/qt6/qt6languageserver/qt6languageserver.mk
@@ -13,14 +13,19 @@ QT6LANGUAGESERVER_SUPPORTS_IN_SOURCE_BUILD = NO
 QT6LANGUAGESERVER_CMAKE_BACKEND = ninja
 
 QT6LANGUAGESERVER_LICENSE = \
-	GPL-2.0 or LGPL-3.0 or GPL-3.0, \
-	GPL-3.0 (tests)
+	BSD-3-Clause (buildsystem), \
+	GFDL-1.3-no-invariants (docs), \
+	GPL-3.0 (tests), \
+	GPL-3.0 with Qt-GPL-exception-1.0 (utils), \
+	LGPL-3.0 or GPL-2.0 or GPL-3.0
 
 QT6LANGUAGESERVER_LICENSE_FILES = \
+	LICENSES/BSD-3-Clause.txt \
+	LICENSES/GFDL-1.3-no-invariants-only.txt \
 	LICENSES/GPL-2.0-only.txt \
 	LICENSES/GPL-3.0-only.txt \
 	LICENSES/LGPL-3.0-only.txt \
-	LICENSES/GFDL-1.3-no-invariants-only.txt
+	LICENSES/Qt-GPL-exception-1.0.txt
 
 QT6LANGUAGESERVER_CONF_OPTS = \
 	-DQT_HOST_PATH=$(HOST_DIR) \
diff --git a/package/qt6/qt6mqtt/qt6mqtt.hash b/package/qt6/qt6mqtt/qt6mqtt.hash
index 67ae6d0de3..efcb5af41c 100644
--- a/package/qt6/qt6mqtt/qt6mqtt.hash
+++ b/package/qt6/qt6mqtt/qt6mqtt.hash
@@ -4,5 +4,4 @@ sha256  be2d3f12378a8e2a103c328201b1e308f8c6c09bd752322592b3164cebba5bde  qt6mqt
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
 sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
-sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LICENSES/LicenseRef-Qt-Commercial.txt
 sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
diff --git a/package/qt6/qt6mqtt/qt6mqtt.mk b/package/qt6/qt6mqtt/qt6mqtt.mk
index 00c6705cc8..932e8c64a9 100644
--- a/package/qt6/qt6mqtt/qt6mqtt.mk
+++ b/package/qt6/qt6mqtt/qt6mqtt.mk
@@ -14,14 +14,15 @@ QT6MQTT_SUPPORTS_IN_SOURCE_BUILD = NO
 QT6MQTT_CMAKE_BACKEND = ninja
 
 QT6MQTT_LICENSE = \
-	BSD-3-Clause (examples), \
-	GFDL-1.3-invariants-only (docs), \
-	GPL-3.0
+	BSD-3-Clause (buildsystem, examples), \
+	GFDL-1.3-no-invariants (docs), \
+	GPL-3.0 (modules, tests)
 
 QT6MQTT_LICENSE_FILES = \
 	LICENSES/BSD-3-Clause.txt \
 	LICENSES/GFDL-1.3-no-invariants-only.txt \
-	LICENSES/GPL-3.0-only.txt
+	LICENSES/GPL-3.0-only.txt \
+	LICENSES/Qt-GPL-exception-1.0.txt
 
 QT6MQTT_CONF_OPTS = \
 	-DQT_HOST_PATH=$(HOST_DIR) \
diff --git a/package/qt6/qt6opcua/qt6opcua.hash b/package/qt6/qt6opcua/qt6opcua.hash
index cf54bef98e..3bf3873950 100644
--- a/package/qt6/qt6opcua/qt6opcua.hash
+++ b/package/qt6/qt6opcua/qt6opcua.hash
@@ -7,3 +7,10 @@ sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENS
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
 sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
+sha256  a0065c18af521d2a10ab25ec0e4b2ab660bff9fd1624df8bde05e8627613220f  src/3rdparty/open62541/AUTHORS
+sha256  23bb110e608dcaf9bbc303ba34885b34688dad4fccea3bf45762539d4fa4b6bc  src/3rdparty/open62541/BSD-3-CLAUSE
+sha256  5e436ff8ffbb77d8607220e9bce20c8915d860010feeb6c1ebef5a85688e9b39  src/3rdparty/open62541/CC-BY-SA-4.0
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/open62541/LICENSE-2.0.txt
+sha256  d93cc415382f0013088fa276d9cf82373badf244c78220a926f15ee46f0fe3c4  src/3rdparty/open62541/LICENSE-CC0
+sha256  e239ef69c9c4eead9406bdc6a34f2bd1220c3dcd3b17c8377cb2fb73fdaf0d38  src/3rdparty/open62541/MIT
+sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  src/3rdparty/open62541/mpl-2.0.815ca599c9df.txt
diff --git a/package/qt6/qt6opcua/qt6opcua.mk b/package/qt6/qt6opcua/qt6opcua.mk
index 6c8ff7af89..4b125fc5ed 100644
--- a/package/qt6/qt6opcua/qt6opcua.mk
+++ b/package/qt6/qt6opcua/qt6opcua.mk
@@ -13,16 +13,26 @@ QT6OPCUA_SUPPORTS_IN_SOURCE_BUILD = NO
 QT6OPCUA_CMAKE_BACKEND = ninja
 
 QT6OPCUA_LICENSE = \
-	GPL-2.0 or GPL-3.0 or LGPL-3.0, \
-	GFDL-1.3 no invariants (docs), \
-	BSD-3-Clause (examples + buildsystem)
+	BSD-3-Clause (buildsystem, examples, snippets), \
+	GFDL-1.3-no-invariants (docs), \
+	GPL-3.0 (tests), \
+	LGPL-3.0 or GPL-2.0 or GPL-3.0 (modules, plugins, tools), \
+	MPL-2.0 and CC0-1.0 and CC-BY-SA-4.0 and BSD-3-Clause and Apache-2.0 and MIT (open62541)
 
 QT6OPCUA_LICENSE_FILES = \
 	LICENSES/BSD-3-Clause.txt \
 	LICENSES/GFDL-1.3-no-invariants-only.txt \
 	LICENSES/GPL-2.0-only.txt \
 	LICENSES/GPL-3.0-only.txt \
-	LICENSES/LGPL-3.0-only.txt
+	LICENSES/LGPL-3.0-only.txt \
+	LICENSES/Qt-GPL-exception-1.0.txt \
+	src/3rdparty/open62541/AUTHORS \
+	src/3rdparty/open62541/BSD-3-CLAUSE \
+	src/3rdparty/open62541/CC-BY-SA-4.0 \
+	src/3rdparty/open62541/LICENSE-2.0.txt \
+	src/3rdparty/open62541/LICENSE-CC0 \
+	src/3rdparty/open62541/MIT \
+	src/3rdparty/open62541/mpl-2.0.815ca599c9df.txt
 
 QT6OPCUA_CONF_OPTS = \
 	-DQT_HOST_PATH=$(HOST_DIR) \
diff --git a/package/qt6/qt6serialbus/qt6serialbus.hash b/package/qt6/qt6serialbus/qt6serialbus.hash
index 1b854284a3..3d9634d15c 100644
--- a/package/qt6/qt6serialbus/qt6serialbus.hash
+++ b/package/qt6/qt6serialbus/qt6serialbus.hash
@@ -7,5 +7,4 @@ sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENS
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
-sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LICENSES/LicenseRef-Qt-Commercial.txt
 sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
diff --git a/package/qt6/qt6serialbus/qt6serialbus.mk b/package/qt6/qt6serialbus/qt6serialbus.mk
index 631531e14f..d44492fcfc 100644
--- a/package/qt6/qt6serialbus/qt6serialbus.mk
+++ b/package/qt6/qt6serialbus/qt6serialbus.mk
@@ -13,14 +13,18 @@ QT6SERIALBUS_SUPPORTS_IN_SOURCE_BUILD = NO
 QT6SERIALBUS_CMAKE_BACKEND = ninja
 
 QT6SERIALBUS_LICENSE = \
-	GPL-2.0+ or LGPL-3.0, \
-	GPL-3.0, GFDL-1.3 no invariants (docs)
+	BSD-3-Clause (buildsystem, examples, snippets), \
+	GFDL-1.3-no-invariants (docs), \
+	GPL-3.0 (tests), \
+	LGPL-3.0 or GPL-2.0 or GPL-3.0 (modules, plugins, tools)
 
 QT6SERIALBUS_LICENSE_FILES = \
+	LICENSES/BSD-3-Clause.txt \
+	LICENSES/GFDL-1.3-no-invariants-only.txt \
 	LICENSES/GPL-2.0-only.txt \
 	LICENSES/GPL-3.0-only.txt \
 	LICENSES/LGPL-3.0-only.txt \
-	LICENSES/GFDL-1.3-no-invariants-only.txt
+	LICENSES/Qt-GPL-exception-1.0.txt
 
 QT6SERIALBUS_CONF_OPTS = \
 	-DQT_HOST_PATH=$(HOST_DIR) \
diff --git a/package/qt6/qt6serialport/qt6serialport.mk b/package/qt6/qt6serialport/qt6serialport.mk
index bdb16dd892..6092ddb05c 100644
--- a/package/qt6/qt6serialport/qt6serialport.mk
+++ b/package/qt6/qt6serialport/qt6serialport.mk
@@ -13,10 +13,10 @@ QT6SERIALPORT_SUPPORTS_IN_SOURCE_BUILD = NO
 QT6SERIALPORT_CMAKE_BACKEND = ninja
 
 QT6SERIALPORT_LICENSE = \
-	GPL-2.0+ or LGPL-3.0, \
-	GPL-3.0 with exception (tools), \
-	GFDL-1.3 (docs), \
-	BSD-3-Clause
+	BSD-3-Clause (buildsystem, examples, snippets, tests), \
+	GFDL-1.3-no-invariants (docs), \
+	GPL-3.0 (tests), \
+	LGPL-3.0 or GPL-2.0 or GPL-3.0 (modules)
 
 QT6SERIALPORT_LICENSE_FILES = \
 	LICENSES/BSD-3-Clause.txt \
diff --git a/package/qt6/qt6shadertools/qt6shadertools.hash b/package/qt6/qt6shadertools/qt6shadertools.hash
index 9cb423c90f..06544690d0 100644
--- a/package/qt6/qt6shadertools/qt6shadertools.hash
+++ b/package/qt6/qt6shadertools/qt6shadertools.hash
@@ -8,3 +8,8 @@ sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENS
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
 sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
+sha256  afe3458e2431963def8b2c1520d342566725a07b46344aa34c5d327531bf2873  src/3rdparty/SPIRV-Cross/COPYRIGHT.txt
+sha256  c7d81f456bf5488fec8b2d249eec6b02e70bbdc353c373cd5a077e898345e943  src/3rdparty/SPIRV-Cross/KHRONOS-LICENSE.txt
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/SPIRV-Cross/LICENSE
+sha256  7a0986b241205c038dcea76b343dd9b7030a424b644a7d59585200824831dae8  src/3rdparty/glslang/COPYRIGHT.txt
+sha256  adb783e734e906d1f46db5df29991dbde84bdb0ceab502ac2febb44fe3c2b5f4  src/3rdparty/glslang/LICENSE.txt
diff --git a/package/qt6/qt6shadertools/qt6shadertools.mk b/package/qt6/qt6shadertools/qt6shadertools.mk
index 660dc5a78d..95eec62ad7 100644
--- a/package/qt6/qt6shadertools/qt6shadertools.mk
+++ b/package/qt6/qt6shadertools/qt6shadertools.mk
@@ -13,17 +13,28 @@ QT6SHADERTOOLS_SUPPORTS_IN_SOURCE_BUILD = NO
 QT6SHADERTOOLS_CMAKE_BACKEND = ninja
 
 QT6SHADERTOOLS_LICENSE = \
+	Apache-2.0 and urn:dje:license:khronos (SPIRV-Cross), \
 	Apache-2.0 or MIT (SPIRV-Cross), \
-	GPL-2.0 or LGPL-3.0 or GPL-3.0, \
-	GPL-3.0 (tests), GFDL-1.3 no invariants (docs), \
-	GPL-3.0 WITH Qt-GPL-exception-1.0 (tools)
+	BSD-3-Clause (buildsystem), \
+	BSD-3-Clause and urn:dje:license:khronos and Apache-2.0 and GPL-3.0+ with Bison-exception-2.2 and AML-glslang (glslang), \
+	GFDL-1.3-no-invariants (docs), \
+	GPL-3.0 (tests), \
+	GPL-3.0 with Qt-GPL-exception-1.0 (qsb), \
+	LGPL-3.0 or GPL-2.0 or GPL-3.0 (modules), \
+	MIT (SPIRV-Cross)
 
 QT6SHADERTOOLS_LICENSE_FILES = \
+	LICENSES/BSD-3-Clause.txt \
+	LICENSES/GFDL-1.3-no-invariants-only.txt \
 	LICENSES/GPL-2.0-only.txt \
 	LICENSES/GPL-3.0-only.txt \
 	LICENSES/LGPL-3.0-only.txt \
-	LICENSES/GFDL-1.3-no-invariants-only.txt \
-	LICENSES/Qt-GPL-exception-1.0.txt
+	LICENSES/Qt-GPL-exception-1.0.txt \
+	src/3rdparty/SPIRV-Cross/COPYRIGHT.txt \
+	src/3rdparty/SPIRV-Cross/KHRONOS-LICENSE.txt \
+	src/3rdparty/SPIRV-Cross/LICENSE \
+	src/3rdparty/glslang/COPYRIGHT.txt \
+	src/3rdparty/glslang/LICENSE.txt
 
 QT6SHADERTOOLS_CONF_OPTS = \
 	-DBUILD_WITH_PCH=OFF \
diff --git a/package/qt6/qt6svg/qt6svg.hash b/package/qt6/qt6svg/qt6svg.hash
index 7adfd7f2fb..9d0e5d7690 100644
--- a/package/qt6/qt6svg/qt6svg.hash
+++ b/package/qt6/qt6svg/qt6svg.hash
@@ -8,3 +8,4 @@ sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENS
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
 sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
+sha256  3a946598a9f674d44df764279ca0b85b5d6faba08f3bc75d8e0fcf6cd729a9bd  src/svg/XSVG_LICENSE.txt
diff --git a/package/qt6/qt6svg/qt6svg.mk b/package/qt6/qt6svg/qt6svg.mk
index a9d7eaef51..01d41ef223 100644
--- a/package/qt6/qt6svg/qt6svg.mk
+++ b/package/qt6/qt6svg/qt6svg.mk
@@ -13,10 +13,11 @@ QT6SVG_SUPPORTS_IN_SOURCE_BUILD = NO
 QT6SVG_CMAKE_BACKEND = ninja
 
 QT6SVG_LICENSE = \
-	GPL-2.0+ or LGPL-3.0, \
-	GPL-3.0 with exception (tools), \
-	GFDL-1.3 (docs), \
-	BSD-3-Clause
+	BSD-3-Clause (buildsystem, examples, snippets), \
+	GFDL-1.3-no-invariants (docs), \
+	GPL-3.0 (tests), \
+	HPND-sell-variant (xsvg), \
+	LGPL-3.0 or GPL-2.0 or GPL-3.0 (modules, plugins)
 
 QT6SVG_LICENSE_FILES = \
 	LICENSES/BSD-3-Clause.txt \
@@ -24,7 +25,8 @@ QT6SVG_LICENSE_FILES = \
 	LICENSES/GPL-2.0-only.txt \
 	LICENSES/GPL-3.0-only.txt \
 	LICENSES/LGPL-3.0-only.txt \
-	LICENSES/Qt-GPL-exception-1.0.txt
+	LICENSES/Qt-GPL-exception-1.0.txt \
+	src/svg/XSVG_LICENSE.txt
 
 QT6SVG_CONF_OPTS = \
 	-DQT_HOST_PATH=$(HOST_DIR) \
diff --git a/package/qt6/qt6tools/qt6tools.hash b/package/qt6/qt6tools/qt6tools.hash
index 622df4a00f..6854e68832 100644
--- a/package/qt6/qt6tools/qt6tools.hash
+++ b/package/qt6/qt6tools/qt6tools.hash
@@ -8,5 +8,8 @@ sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENS
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
-sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LICENSES/LicenseRef-Qt-Commercial.txt
 sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
+sha256  01728bacf4137aeb434d81a19d9542928d0937976c8f6b54ae0475b5376aa0ee  src/assistant/qlitehtml/src/3rdparty/GUMBO-AUTHORS.txt
+sha256  71bd488e77ee821bf38d89e2b8a9c5ebe687553fcae9cefa00a96499792a3e23  src/assistant/qlitehtml/src/3rdparty/litehtml/LICENSE
+sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  src/qdoc/catch/CATCH_LICENSE.txt
+sha256  8d85c1057d742e597985c7d4e6320b015a9139385cff4cbae06ffc0ebe89afee  src/qdoc/qdoc/src/qdoc/clang/AST/LLVM_LICENSE.txt
diff --git a/package/qt6/qt6tools/qt6tools.mk b/package/qt6/qt6tools/qt6tools.mk
index 09c986cfc6..b101cf0432 100644
--- a/package/qt6/qt6tools/qt6tools.mk
+++ b/package/qt6/qt6tools/qt6tools.mk
@@ -13,19 +13,27 @@ QT6TOOLS_SUPPORTS_IN_SOURCE_BUILD = NO
 QT6TOOLS_CMAKE_BACKEND = ninja
 
 QT6TOOLS_LICENSE = \
-	BSD-3-Clause (examples), \
-	BSD-3-Clause (corecon), \
-	BSL-1.0 (catch), \
-	LGPL-3.0 or GPL-3.0 or GPL-2.0, \
-	GPL-3.0 WITH Qt-GPL-exception-1.0
+	Apache-2.0 and MIT (litehtml-gumbo), \
+	Apache-2.0 with LLVM-exception (llvm_clang_typename_namespace), \
+	BSD-3-Clause (buildsystem, examples, litehtml, snippets), \
+	BSL-1.0 (catch2), \
+	GFDL-1.3-no-invariants (docs), \
+	GPL-3.0 (tests), \
+	GPL-3.0 with Qt-GPL-exception-1.0 (tests, tools, utils), \
+	LGPL-3.0 or GPL-2.0 or GPL-3.0 (modules, plugins)
 
 QT6TOOLS_LICENSE_FILES = \
 	LICENSES/BSD-3-Clause.txt \
 	LICENSES/BSL-1.0.txt \
+	LICENSES/GFDL-1.3-no-invariants-only.txt \
 	LICENSES/GPL-2.0-only.txt \
 	LICENSES/GPL-3.0-only.txt \
 	LICENSES/LGPL-3.0-only.txt \
-	LICENSES/Qt-GPL-exception-1.0.txt
+	LICENSES/Qt-GPL-exception-1.0.txt \
+	src/assistant/qlitehtml/src/3rdparty/GUMBO-AUTHORS.txt \
+	src/assistant/qlitehtml/src/3rdparty/litehtml/LICENSE \
+	src/qdoc/catch/CATCH_LICENSE.txt \
+	src/qdoc/qdoc/src/qdoc/clang/AST/LLVM_LICENSE.txt
 
 QT6TOOLS_CONF_OPTS = \
 	-DQT_HOST_PATH=$(HOST_DIR) \
diff --git a/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash b/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash
index f34eb11e9e..1e6184a1ab 100644
--- a/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash
+++ b/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash
@@ -5,7 +5,6 @@ sha256  320664b55a0960ff79c1b822dcf6e8cebe3e08b791147d41b570996d81ce180f  qtvirt
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
 sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
-sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LICENSES/LicenseRef-Qt-Commercial.txt
 sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
 sha256  05cc719deafd0ab083b03296bb2911de10d116953b626a7629b9ca59938038b1  src/plugins/openwnn/3rdparty/openwnn/NOTICE
 sha256  b5830d96fb5a7e7e7ebcc295f352846b4b998e78fdc8f9aa68e134d2e4b39986  src/plugins/pinyin/3rdparty/pinyin/NOTICE
diff --git a/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.mk b/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.mk
index 5c61ed7ec4..7fa7d38974 100644
--- a/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.mk
+++ b/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.mk
@@ -14,13 +14,17 @@ QT6VIRTUALKEYBOARD_SUPPORTS_IN_SOURCE_BUILD = NO
 QT6VIRTUALKEYBOARD_CMAKE_BACKEND = ninja
 
 QT6VIRTUALKEYBOARD_LICENSE = \
-	BSD-3-Clause (examples), \
-	GPL-3.0, \
-	Apache-2.0 (openwnn, pinyin, tcime plugins)
+	Apache-2.0 (openwnn, pinyin), \
+	Apache-2.0 and BSD-3-Clause (tcime), \
+	BSD-3-Clause (buildsystem, examples, snippets), \
+	GFDL-1.3-no-invariants (docs), \
+	GPL-3.0 (modules, plugins, tests)
 
 QT6VIRTUALKEYBOARD_LICENSE_FILES = \
 	LICENSES/BSD-3-Clause.txt \
+	LICENSES/GFDL-1.3-no-invariants-only.txt \
 	LICENSES/GPL-3.0-only.txt \
+	LICENSES/Qt-GPL-exception-1.0.txt \
 	src/plugins/openwnn/3rdparty/openwnn/NOTICE \
 	src/plugins/pinyin/3rdparty/pinyin/NOTICE \
 	src/plugins/tcime/3rdparty/tcime/COPYING
diff --git a/package/qt6/qt6wayland/qt6wayland.hash b/package/qt6/qt6wayland/qt6wayland.hash
index 3d0ded7bec..4b0685e450 100644
--- a/package/qt6/qt6wayland/qt6wayland.hash
+++ b/package/qt6/qt6wayland/qt6wayland.hash
@@ -7,5 +7,6 @@ sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENS
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
-sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LICENSES/LicenseRef-Qt-Commercial.txt
 sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
+sha256  8172d52f3b7bba7d10af2f9134c63d0f699ba6b20a47e35f5ac45654c500bfd7  src/3rdparty/protocol/HPND_LICENSE.txt
+sha256  a8341b9c90ef447a77f55d550e6691e370d3ac15d60edb584def356e348ab828  src/3rdparty/protocol/MIT_LICENSE.txt
diff --git a/package/qt6/qt6wayland/qt6wayland.mk b/package/qt6/qt6wayland/qt6wayland.mk
index 29fc25edb0..cbd458466b 100644
--- a/package/qt6/qt6wayland/qt6wayland.mk
+++ b/package/qt6/qt6wayland/qt6wayland.mk
@@ -14,18 +14,23 @@ QT6WAYLAND_SUPPORTS_IN_SOURCE_BUILD = NO
 QT6WAYLAND_CMAKE_BACKEND = ninja
 
 QT6WAYLAND_LICENSE = \
-	BSD-3-Clause (examples, tests), \
-	GPL-3.0 (compositor), \
-	LGPL-3.0 or GPL-2.0 or GPL-3.0, \
-	GPL-3.0 WITH Qt-GPL-exception-1.0 (tests), \
-	GFDL-1.3 no invariants (docs)
+	BSD-3-Clause (buildsystem, examples, tests), \
+	GFDL-1.3-no-invariants (docs), \
+	GPL-3.0 (compositor, modules, plugins), \
+	GPL-3.0 with Qt-GPL-exception-1.0 (tests, tools), \
+	HPND (wayland-text-input-unstable-v2), \
+	LGPL-3.0 or GPL-2.0 or GPL-3.0 (client, modules, plugins, tests), \
+	MIT (protocol)
 
 QT6WAYLAND_LICENSE_FILES = \
 	LICENSES/BSD-3-Clause.txt \
+	LICENSES/GFDL-1.3-no-invariants-only.txt \
 	LICENSES/GPL-2.0-only.txt \
 	LICENSES/GPL-3.0-only.txt \
 	LICENSES/LGPL-3.0-only.txt \
-	LICENSES/GFDL-1.3-no-invariants-only.txt
+	LICENSES/Qt-GPL-exception-1.0.txt \
+	src/3rdparty/protocol/HPND_LICENSE.txt \
+	src/3rdparty/protocol/MIT_LICENSE.txt
 
 QT6WAYLAND_CONF_OPTS = \
 	-DQT_HOST_PATH=$(HOST_DIR) \
diff --git a/package/qt6/qt6websockets/qt6websockets.hash b/package/qt6/qt6websockets/qt6websockets.hash
index 5dfeeef01d..f222971846 100644
--- a/package/qt6/qt6websockets/qt6websockets.hash
+++ b/package/qt6/qt6websockets/qt6websockets.hash
@@ -7,5 +7,4 @@ sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENS
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
-sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LICENSES/LicenseRef-Qt-Commercial.txt
 sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
diff --git a/package/qt6/qt6websockets/qt6websockets.mk b/package/qt6/qt6websockets/qt6websockets.mk
index 5e6da70e63..667f56d15a 100644
--- a/package/qt6/qt6websockets/qt6websockets.mk
+++ b/package/qt6/qt6websockets/qt6websockets.mk
@@ -14,15 +14,18 @@ QT6WEBSOCKETS_SUPPORTS_IN_SOURCE_BUILD = NO
 QT6WEBSOCKETS_CMAKE_BACKEND = ninja
 
 QT6WEBSOCKETS_LICENSE = \
-	LGPL-3.0 or GPL-2.0 or GPL-3.0, \
-	BSD-3-Clause (examples), \
-	GPL-3.0 (tests)
+	BSD-3-Clause (buildsystem, examples, snippets), \
+	GFDL-1.3-no-invariants (docs), \
+	GPL-3.0 (tests), \
+	LGPL-3.0 or GPL-2.0 or GPL-3.0 (modules, plugins)
 
 QT6WEBSOCKETS_LICENSE_FILES = \
+	LICENSES/BSD-3-Clause.txt \
+	LICENSES/GFDL-1.3-no-invariants-only.txt \
 	LICENSES/GPL-2.0-only.txt \
 	LICENSES/GPL-3.0-only.txt \
 	LICENSES/LGPL-3.0-only.txt \
-	LICENSES/BSD-3-Clause.txt
+	LICENSES/Qt-GPL-exception-1.0.txt
 
 QT6WEBSOCKETS_CONF_OPTS = \
 	-DQT_FEATURE_thread=ON \
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
