Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD452C433EF
	for <buildroot@archiver.kernel.org>; Thu, 24 Mar 2022 21:15:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7004E6101E;
	Thu, 24 Mar 2022 21:15:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dTe5LyEYimgv; Thu, 24 Mar 2022 21:15:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 205D960BC5;
	Thu, 24 Mar 2022 21:15:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 086361BF313
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 21:15:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CAAEF401E1
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 21:15:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f1tI3kiufDLV for <buildroot@lists.busybox.net>;
 Thu, 24 Mar 2022 21:15:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C50C741064
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 21:15:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id AA88285C5C; Thu, 24 Mar 2022 21:06:19 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 24 Mar 2022 21:51:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 45f2609ca2eb5577ec5e6e204aec5a3eb2e80253
X-Git-Newrev: e3aa82ea44462862d56f6e54889741d95684dc84
X-Patchwork-Hint: ignore
Message-Id: <20220324210619.AA88285C5C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/grpc: fix build with libexecinfo
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e3aa82ea44462862d56f6e54889741d95684dc84
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised on uclibc and musl since the
reintroduction of the package in commit
16ff948444c3978d63f483344a3d92d994c64312:

/home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/buildroot/autobuild/instance-1/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libabsl_stacktrace.so.2111.0.0: undefined reference to `backtrace'

Fixes:
 - http://autobuild.buildroot.org/results/63ab2bc86cad03d5258492b17d1707078761d9b3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/grpc/grpc.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
index 23b92f1750..9138b4ea59 100644
--- a/package/grpc/grpc.mk
+++ b/package/grpc/grpc.mk
@@ -21,6 +21,7 @@ HOST_GRPC_DEPENDENCIES = host-protobuf
 # which doesn't do this.  These CARES settings trick the gRPC cmake code into
 # not looking for c-ares at all and yet still linking with the library.
 GRPC_CONF_OPTS = \
+	-DCMAKE_EXE_LINKER_FLAGS="$(GRPC_EXE_LINKER_FLAGS)" \
 	-DgRPC_ABSL_PROVIDER=package \
 	-D_gRPC_CARES_LIBRARIES=cares \
 	-DgRPC_CARES_PROVIDER=none \
@@ -36,10 +37,15 @@ GRPC_CONF_OPTS = \
 	-DgRPC_BUILD_GRPC_PYTHON_PLUGIN=OFF \
 	-DgRPC_BUILD_GRPC_RUBY_PLUGIN=OFF
 
+ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
+GRPC_DEPENDENCIES += libexecinfo
+GRPC_EXE_LINKER_FLAGS += -lexecinfo
+endif
+
 # grpc can use __atomic builtins, so we need to link with
 # libatomic when available
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-GRPC_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
+GRPC_EXE_LINKER_FLAGS += -latomic
 endif
 
 GRPC_CFLAGS = $(TARGET_CFLAGS)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
