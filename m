Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4275C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:20:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8ADB660F0F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:20:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8ADB660F0F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F3DFC405F6;
	Tue,  3 Aug 2021 21:20:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jfnd7mEiPPzY; Tue,  3 Aug 2021 21:20:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E059F405FA;
	Tue,  3 Aug 2021 21:20:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3BE6C1BF9C2
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C74B4827D2
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DT60J1BWYFUb for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C890829B1
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 75E538399D; Tue,  3 Aug 2021 21:09:40 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 18 May 2021 15:14:26 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: dba10b3a76c3855aee14b1df561e02ead232d7aa
X-Git-Newrev: c68efce50c88f6d5f2fa548b4082e423d1828991
X-Patchwork-Hint: ignore
Message-Id: <20210803210940.75E538399D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gerbera: fix build
 with -Os and gcc 9 or 10
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=c68efce50c88f6d5f2fa548b4082e423d1828991
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

For an unknown reason, gerbera fails to build with -Os and gcc 9 or 10
since bump to version 1.8.0 in commit 8974596836945eada8e162844fb87f88adec9100:

[100%] Linking CXX executable gerbera
/home/giuliobenetti/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-gnu/10.2.0/../../../../x86_64-buildroot-linux-gnu/bin/ld: liblibgerbera.a(content_manager.cc.o): in function `ContentManager::_rescanDirectory(std::shared_ptr<AutoscanDirectory>&, int, std::shared_ptr<GenericTask> const&)':
content_manager.cc:(.text+0xb53b): undefined reference to `std::__shared_ptr<std::filesystem::__cxx11::_Dir, (__gnu_cxx::_Lock_policy)2>::swap(std::__shared_ptr<std::filesystem::__cxx11::_Dir, (__gnu_cxx::_Lock_policy)2>&)'
collect2: error: ld returned 1 exit status

A similar build failure has been reported as gcc bug 91067:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=91067

But this bug has been fixed since gcc 9.3 and 10.1 and build failures
are raised with gcc 10.2

To fix this build failure, set optimisation to -O2 if needed

Fixes:
 - http://autobuild.buildroot.org/results/a4ee8ad7ff93939716673b611c7cc3f68dafa3d0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gerbera/gerbera.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/gerbera/gerbera.mk b/package/gerbera/gerbera.mk
index 73917c7721..9627209d60 100644
--- a/package/gerbera/gerbera.mk
+++ b/package/gerbera/gerbera.mk
@@ -18,6 +18,10 @@ GERBERA_DEPENDENCIES = \
 	zlib
 GERBERA_CONF_OPTS = -DWITH_DEBUG=OFF
 
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_9)$(BR2_OPTIMIZE_S),yy)
+GERBERA_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -O2"
+endif
+
 # Uses __atomic_fetch_add_4
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 GERBERA_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
