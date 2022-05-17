Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E27FDC433EF
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 07:36:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 725C761181;
	Tue, 17 May 2022 07:36:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c8DMyC6NOMty; Tue, 17 May 2022 07:36:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FFEF60BC0;
	Tue, 17 May 2022 07:36:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E62461BF2F6
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 07:36:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D3A9D41840
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 07:36:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aqr_4bwZXdGn for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 07:36:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4301C4162D
 for <buildroot@buildroot.org>; Tue, 17 May 2022 07:36:00 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E21C5C0006;
 Tue, 17 May 2022 07:35:56 +0000 (UTC)
Message-ID: <f0607b08-10e0-6cf6-acbe-fbadad8e1722@korsgaard.com>
Date: Tue, 17 May 2022 09:35:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220215015307.855341-1-james.hilliard1@gmail.com>
 <20220215015307.855341-5-james.hilliard1@gmail.com>
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20220215015307.855341-5-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH v8 5/5] package/qt5/qt5webengine: bump to
 version 5.15.8
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
Cc: Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?Q?Ga=c3=abl_Portay?= <gael.portay@collabora.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

On 15/02/2022 02.53, James Hilliard wrote:
> We need to use the separate package for the chromium submodule
> which has python3 support patches.
> 
> We also need to apply a patch to qt5webengine to allow building with
> python3.
> 
> Drop a patch which is now upstream.
> 
> We need to set QT5WEBENGINE_SYNC_QT_HEADERS = YES as we are building
> from a repository archive instead of a release archive.
> 
> We need to add some new required dependencies to qt5webengine so that
> it will build.
> 
> Switch libraries to system libraries instead of bundled when possible.
> 
> Migrate unsupported WEBENGINE_CONFIG to new config flag option.
> 
> Override feature detection using config override flags to ensure we
> get the expected features enabled/disabled as autodetection logic
> may otherwise disable features without throwing build errors.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

I tried applying patch 1, 2, 3 and 5 (which took some effort as there 
seems to be some DOS newlines confusing patchwork) and did a test build 
for 32bit ARM:

BR2_arm=y
BR2_cortex_a7=y
BR2_ARM_INSTRUCTIONS_THUMB2=y
BR2_CCACHE=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_QT5=y
BR2_PACKAGE_QT5WEBENGINE=y

But that fails building v8_snapshot/gen-regexp-special-case. Notice the 
-m32 that get passed:

[19941/21833] LINK v8_snapshot/gen-regexp-special-case
FAILED: v8_snapshot/gen-regexp-special-case
/home/peko/source/buildroot/output-qt/build/qt5webengine-5.15.8/host-bin/python 
"../../3rdparty/chromium/build/toolchain/gcc_li 
 
                                 nk_wrapper.py" 
--output="v8_snapshot/gen-regexp-special-case" -- /usr/bin/g++ -pie 
-Wl,--fatal-warnings -Wl,--build-id=sha1 -fP 
 
                              IC -Wl,-z,noexecstack -Wl,-z,relro 
-Wl,-z,now -Wl,-z,defs -Wl,--as-needed -m32 -pie -Wl,--disable-new-dtags 
-Wl,-O2 -Wl,--gc-se 
 
     ctions -L/usr/lib -o "v8_snapshot/gen-regexp-special-case" 
-Wl,--start-group @"v8_snapshot/gen-regexp-special-case.rsp"  -Wl,-- 
 
                                                      end-group  -ldl 
-lpthread -lrt -licui18n -licuuc -licudata
/usr/bin/ld: skipping incompatible 
/usr/lib/x86_64-linux-gnu/libicui18n.so when searching for -licui18n
/usr/bin/ld: skipping incompatible 
/usr/lib/x86_64-linux-gnu/libicui18n.a when searching for -licui18n
/usr/bin/ld: cannot find -licui18n
/usr/bin/ld: skipping incompatible 
/usr/lib/x86_64-linux-gnu/libicui18n.so when searching for -licui18n
/usr/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libicuuc.so 
when searching for -licuuc
/usr/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libicuuc.a 
when searching for -licuuc
/usr/bin/ld: cannot find -licuuc
/usr/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libicuuc.so 
when searching for -licuuc
/usr/bin/ld: skipping incompatible 
/usr/lib/x86_64-linux-gnu/libicudata.so when searching for -licudata
/usr/bin/ld: skipping incompatible 
/usr/lib/x86_64-linux-gnu/libicudata.a when searching for -licudata
/usr/bin/ld: cannot find -licudata
/usr/bin/ld: skipping incompatible 
/usr/lib/x86_64-linux-gnu/libicudata.so when searching for -licudata
collect2: error: ld returned 1 exit status
[19945/21833] CXX v8_snapshot/obj/v8/v8_libsampler/sampler.o
ninja: build stopped: subcommand failed.
make[5]: *** [Makefile.gn_run:362: run_ninja] Error 1
make[4]: *** [Makefile:82: sub-gn_run-pro-make_first] Error 2
make[3]: *** [Makefile:79: sub-core-make_first] Error 2
make[2]: *** [Makefile:49: sub-src-make_first] Error 2
make[1]: *** [package/pkg-generic.mk:293: 
/home/peko/source/buildroot/output-qt/build/qt5webengine-5.15.8/.stamp_built] 
Error 2


Any ideas? Notice that I did NOT apply patch 4 yet.

> ---
> Changes v7 -> v8:
>    - add missing BR2_PACKAGE_QT5BASE_HARFBUZZ select
> 
> Changes v5 -> v6:
>    - switch to python3
>    - fix up config flags and rebase
> 
> Changes v3 -> v4:
>    - linker fixes
> 
> Changes v2 -> v3:
>    - add kconfig entries
> ---
>   package/qt5/qt5.mk                            |    1 -
>   .../0002-Add-python3-build-support.patch      |  168 +++
>   ...m-breakpad-fix-build-with-glibc-2.34.patch |   76 --
>   package/qt5/qt5webengine/Config.in            |   14 +
>   .../qt5/qt5webengine/host-python-wrapper.in   |    3 +
>   package/qt5/qt5webengine/qt5webengine.hash    | 1001 +----------------
>   package/qt5/qt5webengine/qt5webengine.mk      |  160 ++-
>   7 files changed, 323 insertions(+), 1100 deletions(-)
>   create mode 100644 package/qt5/qt5webengine/0002-Add-python3-build-support.patch
>   delete mode 100644 package/qt5/qt5webengine/0002-chromium-breakpad-fix-build-with-glibc-2.34.patch
>   create mode 100644 package/qt5/qt5webengine/host-python-wrapper.in
--
Bye, Peter Korsgaard



_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
