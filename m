Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2158DC433EF
	for <buildroot@archiver.kernel.org>; Tue, 29 Mar 2022 19:53:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD7EB61123;
	Tue, 29 Mar 2022 19:53:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yfKxL-1hxv0m; Tue, 29 Mar 2022 19:53:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE83861119;
	Tue, 29 Mar 2022 19:53:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 073F61BF83B
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 19:53:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA1B440188
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 19:53:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CN1BEek8h68w for <buildroot@lists.busybox.net>;
 Tue, 29 Mar 2022 19:53:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A3C454014C
 for <buildroot@buildroot.org>; Tue, 29 Mar 2022 19:53:01 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5FEFC1C0003;
 Tue, 29 Mar 2022 19:52:59 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nZHti-00FzqR-HZ; Tue, 29 Mar 2022 21:52:58 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220315173231.1943484-1-fontaine.fabrice@gmail.com>
Date: Tue, 29 Mar 2022 21:52:58 +0200
In-Reply-To: <20220315173231.1943484-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 15 Mar 2022 18:32:31 +0100")
Message-ID: <87czi4a63p.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/grpc: fix build with libexecinfo
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
Cc: Robert Rose <robertroyrose@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following build failure raised on uclibc and musl since the
 > reintroduction of the package in commit
 > 16ff948444c3978d63f483344a3d92d994c64312:

Huh? This is the commit where ola was reintroduced, but this is a
failure in grpc and the config doesn't even have ola enabled?

 > /home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
 > /home/buildroot/autobuild/instance-1/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libabsl_stacktrace.so.2111.0.0:
 > undefined reference to `backtrace'

 > Fixes:
 >  - http://autobuild.buildroot.org/results/63ab2bc86cad03d5258492b17d1707078761d9b3

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 >  package/grpc/grpc.mk | 8 +++++++-
 >  1 file changed, 7 insertions(+), 1 deletion(-)

 > diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
 > index 23b92f1750..9138b4ea59 100644
 > --- a/package/grpc/grpc.mk
 > +++ b/package/grpc/grpc.mk
 > @@ -21,6 +21,7 @@ HOST_GRPC_DEPENDENCIES = host-protobuf
 >  # which doesn't do this.  These CARES settings trick the gRPC cmake code into
 >  # not looking for c-ares at all and yet still linking with the library.
 >  GRPC_CONF_OPTS = \
 > +	-DCMAKE_EXE_LINKER_FLAGS="$(GRPC_EXE_LINKER_FLAGS)" \
 >  	-DgRPC_ABSL_PROVIDER=package \
 >  	-D_gRPC_CARES_LIBRARIES=cares \
 >  	-DgRPC_CARES_PROVIDER=none \
 > @@ -36,10 +37,15 @@ GRPC_CONF_OPTS = \
 >  	-DgRPC_BUILD_GRPC_PYTHON_PLUGIN=OFF \
 >  	-DgRPC_BUILD_GRPC_RUBY_PLUGIN=OFF
 
 > +ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
 > +GRPC_DEPENDENCIES += libexecinfo
 > +GRPC_EXE_LINKER_FLAGS += -lexecinfo
 > +endif
 > +
 >  # grpc can use __atomic builtins, so we need to link with
 >  # libatomic when available
 >  ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 > -GRPC_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
 > +GRPC_EXE_LINKER_FLAGS += -latomic
 >  endif
 
 >  GRPC_CFLAGS = $(TARGET_CFLAGS)
 > -- 

 > 2.35.1

 > _______________________________________________
 > buildroot mailing list
 > buildroot@buildroot.org
 > https://lists.buildroot.org/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
