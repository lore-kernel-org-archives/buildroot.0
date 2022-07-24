Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CD58C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 09:11:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C80DD417B1;
	Sun, 24 Jul 2022 09:11:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C80DD417B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RdAccqjrrkXX; Sun, 24 Jul 2022 09:11:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A85A4174A;
	Sun, 24 Jul 2022 09:11:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A85A4174A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EC3071BF2B9
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 09:10:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C4F7C4174A
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 09:10:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4F7C4174A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2XVY2JpZTRha for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 09:10:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82CA241735
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 82CA241735
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 09:10:50 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id v13so4208347wru.12
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 02:10:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=VMss6UTohndfHa5LnPDM5zWoBoRObfT+ZIMxzqt4UEw=;
 b=Skhxy+PcktcJPb501IUt1Pzp0Fz2t50+mrkbWMagfc2Taf7I3nDmzzP7EuiGaAl4Md
 cj72j5EkXA+V46BTeaHCMO8SlOYHYng9LLIkk6IizA8+Olfq6D8n/3dEwHgoGt+LBQ64
 dxHHQAlzO4BL/8NeYS73jcFYJorkyXni1Vh+vH7uRNf8abwqW0Axaiwp/pLwmwGqNu8e
 4+Otq9Hsgn1TBFFA5/3E+AKr4uriFOIZ7gMMprUCw5iPXxYojtIQrms9ChWsSaajDdTe
 1j4nAYGIBzVG45zaUxLWQf5J6Xv9Jo15yXO1DJ0AMjiWXkX9DOSkhLwO6w9DBr/ibHvW
 5Gcg==
X-Gm-Message-State: AJIora8VUgfhZMk9oZyakxacBUotDzSFvYIweSG7mujp4mNbENMSY1Ao
 25538UlH6u39EXGb4kOqs+9Y/Xq+z6A34w==
X-Google-Smtp-Source: AGRyM1taYMWl99rNQros/n6O9YP9TbP3/ydbOn0CujSNehWmR4O5bfUlo0fzjn7zwM+/BbdjMWB4CA==
X-Received: by 2002:adf:f50a:0:b0:21e:73f3:e4da with SMTP id
 q10-20020adff50a000000b0021e73f3e4damr3408256wro.389.1658653849555; 
 Sun, 24 Jul 2022 02:10:49 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 d13-20020adf9c8d000000b0021e4c3b2967sm9270806wre.65.2022.07.24.02.10.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jul 2022 02:10:49 -0700 (PDT)
Message-ID: <7e88bc80-3c9e-f7c5-684d-74fd146fdb3b@mind.be>
Date: Sun, 24 Jul 2022 11:10:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>,
 buildroot@buildroot.org
References: <20220705081330.22435-1-nicolas.cavallari@green-communications.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220705081330.22435-1-nicolas.cavallari@green-communications.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=VMss6UTohndfHa5LnPDM5zWoBoRObfT+ZIMxzqt4UEw=;
 b=MVizJwQrHA3OK64gRUYE6aDqprgsX8550zjZ6klqkYgc6U82f37Ils385EfFkAjGDM
 tbItGAIWmBqMGTqa42QikHhOuU77FJD6uoL4Po6fIZAzj8XWpDbqJenZiN5FAMLXfpAD
 0xpNu2j70rrEToC6yF9BMp+Er8Xr8qa/D6UXIq+Rn6AVoCC4wOyov5SZc1pzDKdWCl/w
 ZgOSN5WlBjfmI2T8eSCCpYlVRZ32qITZAKHsIwpaedIXHRHd3WXb2DZxLDw2pjyajql1
 0ZI1vtkEZC3M5DILK5w8mGo2CGY6jic8Hk6XEiM+5f4aROWtcO2DCOo+tHeC+lkG3tgH
 cNug==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=MVizJwQr
Subject: Re: [Buildroot] [PATCH 1/1] package/pulseaudio: bump to version 16.1
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/07/2022 10:13, Nicolas Cavallari wrote:
> The autotools build system was finally removed in favor of meson,
> so migrate the package to the meson infra.
> 
> Notable changes:
> - c11 is required.

  This actually means that the minimal GCC version is 4.8 or 4.9 (depending on 
which features are used exactly - I did a test with the old Sourcery ARM 
toolchain which is 4.8, and that one works, so it seems to be enough). So there 
should be a dependency that expresses that.

  That would mean propagating to pulseaudio's 6 reverse dependencies, and 
probably further to recursive dependencies, which is tiresome...

  Since more and more packages are depending on C11 (including recent kernels), 
I discussed this with other maintainers and we decided to just make 4.9 the 
minimum. This is actually already the minimum for the host compiler, we'll make 
it the minimum for the target as well. We can't stay in the past forever.

> - glib is no longer optional.
> - there is no option to choose if libcap or neon must be used or not.
> - support for libatomic_ops is broken and must be extensively patched.
> 
> Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
> --
> Tested with test-pkg -a for pulseaudio only and for pulseaudio+avahi+
> dbus+ncurses+libopenssl+fftw+samplerate+gdbm+orc+libcap+libsoxr+alsa
> on top of efd215c79
> ---
>   ...c_assert-instead-of-static_assert-fo.patch |  32 +++++
>   ...ild-sys-Fix-atomic-support-detection.patch |  59 ++++++++
>   ...d-missing-libatomic_ops-dependencies.patch | 129 ++++++++++++++++++
>   package/pulseaudio/Config.in                  |   1 +
>   package/pulseaudio/pulseaudio.hash            |   4 +-
>   package/pulseaudio/pulseaudio.mk              |  73 ++++------
>   6 files changed, 250 insertions(+), 48 deletions(-)
>   create mode 100644 package/pulseaudio/0001-shm.c-use-_Static_assert-instead-of-static_assert-fo.patch
>   create mode 100644 package/pulseaudio/0002-build-sys-Fix-atomic-support-detection.patch
>   create mode 100644 package/pulseaudio/0003-build-sys-Add-missing-libatomic_ops-dependencies.patch
> 
> diff --git a/package/pulseaudio/0001-shm.c-use-_Static_assert-instead-of-static_assert-fo.patch b/package/pulseaudio/0001-shm.c-use-_Static_assert-instead-of-static_assert-fo.patch
> new file mode 100644
> index 0000000000..8cdc23e1e0
> --- /dev/null
> +++ b/package/pulseaudio/0001-shm.c-use-_Static_assert-instead-of-static_assert-fo.patch
> @@ -0,0 +1,32 @@
> +From fb39f9600d464ce761917c0e787b940097f6024c Mon Sep 17 00:00:00 2001
> +From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
> +Date: Thu, 23 Jun 2022 16:52:49 +0200
> +Subject: [PATCH] shm.c: use _Static_assert instead of static_assert for uclibc
> +
> +Both are C11 constructs.  The first one is defined by the compiler in
> +gnu11 mode, but the second one should be a macro defined in assert.h
> +
> +The macro exists in glibc >= 2.16 and musl >= 1.1.10 but not in
> +uclibc 1.0.41.  It is expected to be present in uclibc 1.0.42.
> +
> +Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>

  Didn't you sent this patch upstream?

> +---
> + src/pulsecore/shm.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/pulsecore/shm.c b/src/pulsecore/shm.c
> +index e464f6bce..5220cc90d 100644
> +--- a/src/pulsecore/shm.c
> ++++ b/src/pulsecore/shm.c
> +@@ -94,7 +94,7 @@ struct shm_marker {
> + };
> +
> + // Ensure struct is appropriately packed
> +-static_assert(sizeof(struct shm_marker) == 8 * 5, "`struct shm_marker` is not tightly packed");
> ++_Static_assert(sizeof(struct shm_marker) == 8 * 5, "`struct shm_marker` is not tightly packed");
> +
> + static inline size_t shm_marker_size(pa_mem_type_t type) {
> +     if (type == PA_MEM_TYPE_SHARED_POSIX)
> +--
> +2.36.1
> +
> diff --git a/package/pulseaudio/0002-build-sys-Fix-atomic-support-detection.patch b/package/pulseaudio/0002-build-sys-Fix-atomic-support-detection.patch
> new file mode 100644
> index 0000000000..631cb7f016
> --- /dev/null
> +++ b/package/pulseaudio/0002-build-sys-Fix-atomic-support-detection.patch
> @@ -0,0 +1,59 @@
> +From a5392576ceba92d04706cefc1929ddd5ace5537a Mon Sep 17 00:00:00 2001
> +From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
> +Date: Fri, 1 Jul 2022 14:03:44 +0200
> +Subject: [PATCH] build-sys: Fix atomic support detection
> +
> +Attempting to use atomics operations on an architecture that does not
> +support them generally results in a link error:
> +
> +ld: /tmp/ccjYcMPP.o: in function `func':
> +testfile.c:(.text+0x1c): undefined reference to `__sync_bool_compare_and_swap_4'
> +
> +The current build system uses cc.compiles() to check if atomic ops are
> +supported, but cc.compiles() does not attempt to link, so the test fails
> +to enable libatomics_opts.
> +
> +Fix this by using cc.links() instead of cc.compiles().
> +
> +Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
> +Upstream-status: Submitted [https://gitlab.freedesktop.org/pulseaudio/pulseaudio/-/merge_requests/732]
> +---
> + meson.build | 10 ++++++----
> + 1 file changed, 6 insertions(+), 4 deletions(-)
> +
> +diff --git a/meson.build b/meson.build
> +index c6db7e670..c5135330f 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -498,22 +498,24 @@ endif
> +
> + need_libatomic_ops = false
> +
> +-atomictest = '''void func() {
> ++atomictest = '''int main() {
> +   volatile int atomic = 2;
> +   __sync_bool_compare_and_swap (&atomic, 2, 3);
> ++  return 0;
> + }
> + '''
> +
> +-if cc.compiles(atomictest)
> ++if cc.links(atomictest)
> +   cdata.set('HAVE_ATOMIC_BUILTINS', 1)
> +
> +-  newatomictest = '''void func() {
> ++  newatomictest = '''int main() {
> +     int c = 0;
> +     __atomic_store_n(&c, 4, __ATOMIC_SEQ_CST);
> ++    return 0;
> +   }
> +   '''
> +
> +-  if(cc.compiles(newatomictest))
> ++  if(cc.links(newatomictest))
> +     cdata.set('HAVE_ATOMIC_BUILTINS_MEMORY_MODEL', 1)
> +   endif
> +
> +--
> +2.36.1
> +
> diff --git a/package/pulseaudio/0003-build-sys-Add-missing-libatomic_ops-dependencies.patch b/package/pulseaudio/0003-build-sys-Add-missing-libatomic_ops-dependencies.patch
> new file mode 100644
> index 0000000000..fac441e7dd
> --- /dev/null
> +++ b/package/pulseaudio/0003-build-sys-Add-missing-libatomic_ops-dependencies.patch
> @@ -0,0 +1,129 @@
> +From 96361ff2a8f37dd3ce7ea188ce4e7b038bb6a5aa Mon Sep 17 00:00:00 2001
> +From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
> +Date: Mon, 4 Jul 2022 13:49:34 +0200
> +Subject: [PATCH] build-sys: Add missing libatomic_ops dependencies
> +
> +Add libatomic_ops dependencies to libraries/modules that showed a
> +failure on an arch that does not have native atomic operations support.
> +
> +Not all optional dependencies were tested, so it is possible that
> +some optional modules are still missing libatomic_ops dependencies.
> +
> +Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
> +Upstream-status: Submitted [https://gitlab.freedesktop.org/pulseaudio/pulseaudio/-/merge_requests/732]
> +---
> + src/meson.build           |  2 +-
> + src/modules/meson.build   |  6 +++---
> + src/pulse/meson.build     |  2 +-
> + src/pulsecore/meson.build | 10 +++++-----
> + 4 files changed, 10 insertions(+), 10 deletions(-)
> +
> +diff --git a/src/meson.build b/src/meson.build
> +index 96dcec354..9efb561d8 100644
> +--- a/src/meson.build
> ++++ b/src/meson.build
> +@@ -205,7 +205,7 @@ else
> +       libm_dep, thread_dep, dl_dep, shm_dep, iconv_dep, sndfile_dep, dbus_dep,
> +       x11_dep, libsystemd_dep, glib_dep.partial_dependency(compile_args: true),
> +       gtk_dep.partial_dependency(compile_args: true), asyncns_dep, libintl_dep,
> +-      platform_dep, platform_socket_dep, execinfo_dep,
> ++      platform_dep, platform_socket_dep, execinfo_dep, libatomic_ops_dep,
> +     ],
> +     implicit_include_directories : false)
> +
> +diff --git a/src/modules/meson.build b/src/modules/meson.build
> +index 1d8004300..1e12569dc 100644
> +--- a/src/modules/meson.build
> ++++ b/src/modules/meson.build
> +@@ -14,7 +14,7 @@ all_modules = [
> +   [ 'module-cli-protocol-tcp', 'module-protocol-stub.c', [], ['-DUSE_PROTOCOL_CLI', '-DUSE_TCP_SOCKETS'], [], libprotocol_cli ],
> +   [ 'module-cli-protocol-unix', 'module-protocol-stub.c', [], ['-DUSE_PROTOCOL_CLI', '-DUSE_UNIX_SOCKETS'], [], libprotocol_cli ],
> +   [ 'module-combine', 'module-combine.c' ],
> +-  [ 'module-combine-sink', 'module-combine-sink.c' ],
> ++  [ 'module-combine-sink', 'module-combine-sink.c', [], [], [libatomic_ops_dep] ],
> + #  [ 'module-coreaudio-detect', 'macosx/module-coreaudio-detect.c' ],
> + #  [ 'module-coreaudio-device', 'macosx/module-coreaudio-device.c' ],
> +   [ 'module-default-device-restore', 'module-default-device-restore.c', [], [], [], libprotocol_native ],
> +@@ -73,7 +73,7 @@ endif
> +
> + if host_machine.system() != 'windows'
> +   all_modules += [
> +-    [ 'module-rtp-recv', 'rtp/module-rtp-recv.c', [], [], [], librtp ],
> ++    [ 'module-rtp-recv', 'rtp/module-rtp-recv.c', [], [], [libatomic_ops_dep], librtp ],
> +     [ 'module-rtp-send', 'rtp/module-rtp-send.c' , [], [], [], librtp ],
> +   ]
> + endif
> +@@ -243,7 +243,7 @@ module_echo_cancel_sources = [
> + ]
> + module_echo_cancel_orc_sources = []
> + module_echo_cancel_flags = []
> +-module_echo_cancel_deps = []
> ++module_echo_cancel_deps = [libatomic_ops_dep]
> + module_echo_cancel_libs = []
> +
> + if get_option('adrian-aec')
> +diff --git a/src/pulse/meson.build b/src/pulse/meson.build
> +index c2128e087..1b82c807c 100644
> +--- a/src/pulse/meson.build
> ++++ b/src/pulse/meson.build
> +@@ -85,7 +85,7 @@ libpulse = shared_library('pulse',
> +   link_args : [nodelete_link_args, versioning_link_args],
> +   install : true,
> +   install_rpath : privlibdir,
> +-  dependencies : [libm_dep, thread_dep, libpulsecommon_dep, dbus_dep, dl_dep, iconv_dep, libintl_dep, platform_dep, platform_socket_dep],
> ++  dependencies : [libm_dep, thread_dep, libpulsecommon_dep, dbus_dep, dl_dep, iconv_dep, libintl_dep, platform_dep, platform_socket_dep, libatomic_ops_dep],
> +   implicit_include_directories : false)
> +
> + libpulse_dep = declare_dependency(link_with: libpulse)
> +diff --git a/src/pulsecore/meson.build b/src/pulsecore/meson.build
> +index b30264b3a..b37fec499 100644
> +--- a/src/pulsecore/meson.build
> ++++ b/src/pulsecore/meson.build
> +@@ -251,7 +251,7 @@ libcli = shared_library('cli',
> +   c_args : [pa_c_args, server_c_args, database_c_args],
> +   link_args : [nodelete_link_args],
> +   include_directories : [configinc, topinc],
> +-  dependencies : [libpulse_dep, libpulsecommon_dep, libpulsecore_dep],
> ++  dependencies : [libpulse_dep, libpulsecommon_dep, libpulsecore_dep, libatomic_ops_dep],
> +   install : true,
> +   install_rpath : privlibdir,
> +   install_dir : modlibexecdir,
> +@@ -268,7 +268,7 @@ libprotocol_cli = shared_library('protocol-cli',
> +   c_args : [pa_c_args, server_c_args, database_c_args],
> +   link_args : [nodelete_link_args],
> +   include_directories : [configinc, topinc],
> +-  dependencies : [libpulse_dep, libpulsecommon_dep, libpulsecore_dep, libcli_dep],
> ++  dependencies : [libpulse_dep, libpulsecommon_dep, libpulsecore_dep, libcli_dep, libatomic_ops_dep],
> +   install : true,
> +   install_rpath : rpath_dirs,
> +   install_dir : modlibexecdir,
> +@@ -280,7 +280,7 @@ libprotocol_http = shared_library('protocol-http',
> +   c_args : [pa_c_args, server_c_args, database_c_args],
> +   link_args : [nodelete_link_args],
> +   include_directories : [configinc, topinc],
> +-  dependencies : [libpulse_dep, libpulsecommon_dep, libpulsecore_dep],
> ++  dependencies : [libpulse_dep, libpulsecommon_dep, libpulsecore_dep, libatomic_ops_dep],
> +   install : true,
> +   install_rpath : privlibdir,
> +   install_dir : modlibexecdir,
> +@@ -292,7 +292,7 @@ libprotocol_native = shared_library('protocol-native',
> +   c_args : [pa_c_args, server_c_args, database_c_args],
> +   link_args : [nodelete_link_args],
> +   include_directories : [configinc, topinc],
> +-  dependencies : [libpulse_dep, libpulsecommon_dep, libpulsecore_dep, dbus_dep],
> ++  dependencies : [libpulse_dep, libpulsecommon_dep, libpulsecore_dep, dbus_dep, libatomic_ops_dep],
> +   install : true,
> +   install_rpath : privlibdir,
> +   install_dir : modlibexecdir,
> +@@ -304,7 +304,7 @@ libprotocol_simple = shared_library('protocol-simple',
> +   c_args : [pa_c_args, server_c_args, database_c_args],
> +   link_args : [nodelete_link_args],
> +   include_directories : [configinc, topinc],
> +-  dependencies : [libpulse_dep, libpulsecommon_dep, libpulsecore_dep],
> ++  dependencies : [libpulse_dep, libpulsecommon_dep, libpulsecore_dep, libatomic_ops_dep],
> +   install : true,
> +   install_rpath : privlibdir,
> +   install_dir : modlibexecdir,
> +--
> +2.36.1
> +
> diff --git a/package/pulseaudio/Config.in b/package/pulseaudio/Config.in
> index dcc88f3841..78b7da906e 100644
> --- a/package/pulseaudio/Config.in
> +++ b/package/pulseaudio/Config.in
> @@ -15,6 +15,7 @@ config BR2_PACKAGE_PULSEAUDIO
>   	depends on !BR2_STATIC_LIBS
>   	depends on BR2_USE_MMU # fork()
>   	select BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_AUDIO if BR2_PACKAGE_BLUEZ5_UTILS # runtime
> +	select BR2_PACKAGE_LIBGLIB2
>   	select BR2_PACKAGE_LIBTOOL
>   	select BR2_PACKAGE_LIBSNDFILE
>   	select BR2_PACKAGE_PULSEAUDIO_ENABLE_ATOMIC
> diff --git a/package/pulseaudio/pulseaudio.hash b/package/pulseaudio/pulseaudio.hash
> index b3e19fdcca..acbb56a07d 100644
> --- a/package/pulseaudio/pulseaudio.hash
> +++ b/package/pulseaudio/pulseaudio.hash
> @@ -1,5 +1,5 @@
> -# From https://lists.freedesktop.org/archives/pulseaudio-discuss/2021-January/031990.html
> -sha256  75d3f7742c1ae449049a4c88900e454b8b350ecaa8c544f3488a2562a9ff66f1  pulseaudio-14.2.tar.xz
> +# From https://lists.freedesktop.org/archives/pulseaudio-discuss/2022-June/032287.html
> +sha256  8eef32ce91d47979f95fd9a935e738cd7eb7463430dabc72863251751e504ae4  pulseaudio-16.1.tar.xz
>   # Locally computed
>   sha256  c38aee9e3c8c4d5d594ff548a1be05453023016d6286931f6512db215ec1fd42  GPL
>   sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  LGPL
> diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
> index a238315778..3b85f13cf9 100644
> --- a/package/pulseaudio/pulseaudio.mk
> +++ b/package/pulseaudio/pulseaudio.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -PULSEAUDIO_VERSION = 14.2
> +PULSEAUDIO_VERSION = 16.1
>   PULSEAUDIO_SOURCE = pulseaudio-$(PULSEAUDIO_VERSION).tar.xz
>   PULSEAUDIO_SITE = https://freedesktop.org/software/pulseaudio/releases
>   PULSEAUDIO_INSTALL_STAGING = YES
> @@ -13,15 +13,12 @@ PULSEAUDIO_LICENSE_FILES = LICENSE GPL LGPL
>   PULSEAUDIO_CPE_ID_VENDOR = pulseaudio
>   PULSEAUDIO_SELINUX_MODULES = pulseaudio xdg
>   PULSEAUDIO_CONF_OPTS = \
> -	--disable-default-build-tests \
> -	--disable-legacy-database-entry-format \
> -	--disable-manpages \
> -	--disable-running-from-build-tree
> +	-Dtests=false -Dman=false -Drunning-from-build-tree=false \
> +	-Dlegacy-database-entry-format=false -Dc_std=gnu11

  I changed this to one per line and ordered them alphabetically.

  I also removed the c_std=gnu11 - it's a meson option (i.e. not mentioned in 
meson_options.txt) and it's set to gnu11 by meson.build itself, so I don't see a 
reason to repeat that (especially since upstream is liable to change that and 
actually require the updated one).

  Applied to master with those changes, thanks.

  Regards,
  Arnout

>   
>   PULSEAUDIO_DEPENDENCIES = \
> -	host-pkgconf libtool libsndfile speex \
> +	host-pkgconf libtool libsndfile speex libglib2 \
>   	$(TARGET_NLS_DEPENDENCIES) \
> -	$(if $(BR2_PACKAGE_LIBGLIB2),libglib2) \
>   	$(if $(BR2_PACKAGE_AVAHI_DAEMON),avahi) \
>   	$(if $(BR2_PACKAGE_DBUS),dbus) \
>   	$(if $(BR2_PACKAGE_NCURSES),ncurses) \
> @@ -30,103 +27,87 @@ PULSEAUDIO_DEPENDENCIES = \
>   	$(if $(BR2_PACKAGE_SYSTEMD),systemd)
>   
>   ifeq ($(BR2_PACKAGE_LIBSAMPLERATE),y)
> -PULSEAUDIO_CONF_OPTS += --enable-samplerate
> +PULSEAUDIO_CONF_OPTS += -Dsamplerate=enabled
>   PULSEAUDIO_DEPENDENCIES += libsamplerate
>   else
> -PULSEAUDIO_CONF_OPTS += --disable-samplerate
> +PULSEAUDIO_CONF_OPTS += -Dsamplerate=disabled
>   endif
>   
>   ifeq ($(BR2_PACKAGE_GDBM),y)
> -PULSEAUDIO_CONF_OPTS += --with-database=gdbm
> +PULSEAUDIO_CONF_OPTS += -Ddatabase=gdbm
>   PULSEAUDIO_DEPENDENCIES += gdbm
>   else
> -PULSEAUDIO_CONF_OPTS += --with-database=simple
> +PULSEAUDIO_CONF_OPTS += -Ddatabase=simple
>   endif
>   
>   ifeq ($(BR2_PACKAGE_JACK2),y)
> -PULSEAUDIO_CONF_OPTS += --enable-jack
> +PULSEAUDIO_CONF_OPTS += -Djack=enabled
>   PULSEAUDIO_DEPENDENCIES += jack2
>   else
> -PULSEAUDIO_CONF_OPTS += --disable-jack
> +PULSEAUDIO_CONF_OPTS += -Djack=disabled
>   endif
>   
>   ifeq ($(BR2_PACKAGE_LIBATOMIC_OPS),y)
>   PULSEAUDIO_DEPENDENCIES += libatomic_ops
>   ifeq ($(BR2_sparc_v8)$(BR2_sparc_leon3),y)
> -PULSEAUDIO_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -DAO_NO_SPARC_V9"
> +PULSEAUDIO_CFLAGS = $(TARGET_CFLAGS) -DAO_NO_SPARC_V9
>   endif
>   endif
>   
>   ifeq ($(BR2_PACKAGE_ORC),y)
>   PULSEAUDIO_DEPENDENCIES += orc
>   PULSEAUDIO_CONF_ENV += ORCC=$(HOST_DIR)/bin/orcc
> -PULSEAUDIO_CONF_OPTS += --enable-orc
> +PULSEAUDIO_CONF_OPTS += -Dorc=enabled
>   else
> -PULSEAUDIO_CONF_OPTS += --disable-orc
> +PULSEAUDIO_CONF_OPTS += -Dorc=disabled
>   endif
>   
>   ifeq ($(BR2_PACKAGE_LIBCAP),y)
>   PULSEAUDIO_DEPENDENCIES += libcap
> -PULSEAUDIO_CONF_OPTS += --with-caps
> -else
> -PULSEAUDIO_CONF_OPTS += --without-caps
>   endif
>   
>   # gtk3 support needs X11 backend
>   ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
>   PULSEAUDIO_DEPENDENCIES += libgtk3
> -PULSEAUDIO_CONF_OPTS += --enable-gtk3
> +PULSEAUDIO_CONF_OPTS += -Dgtk=enabled
>   else
> -PULSEAUDIO_CONF_OPTS += --disable-gtk3
> +PULSEAUDIO_CONF_OPTS += -Dgtk=disabled
>   endif
>   
>   ifeq ($(BR2_PACKAGE_LIBSOXR),y)
> -PULSEAUDIO_CONF_OPTS += --with-soxr
> +PULSEAUDIO_CONF_OPTS += -Dsoxr=enabled
>   PULSEAUDIO_DEPENDENCIES += libsoxr
>   else
> -PULSEAUDIO_CONF_OPTS += --without-soxr
> +PULSEAUDIO_CONF_OPTS += -Dsoxr=disabled
>   endif
>   
>   ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS)$(BR2_PACKAGE_SBC),yy)
> -PULSEAUDIO_CONF_OPTS += --enable-bluez5
> +PULSEAUDIO_CONF_OPTS += -Dbluez5=enabled
>   PULSEAUDIO_DEPENDENCIES += bluez5_utils sbc
>   else
> -PULSEAUDIO_CONF_OPTS += --disable-bluez5
> +PULSEAUDIO_CONF_OPTS += -Dbluez5=disabled
>   endif
>   
>   ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
> -PULSEAUDIO_CONF_OPTS += --enable-udev
> +PULSEAUDIO_CONF_OPTS += -Dudev=enabled
>   PULSEAUDIO_DEPENDENCIES += udev
>   else
> -PULSEAUDIO_CONF_OPTS += --disable-udev
> +PULSEAUDIO_CONF_OPTS += -Dudev=disabled
>   endif
>   
>   ifeq ($(BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING),y)
> -PULSEAUDIO_CONF_OPTS += --enable-webrtc-aec
> +PULSEAUDIO_CONF_OPTS += -Dwebrtc-aec=enabled
>   PULSEAUDIO_DEPENDENCIES += webrtc-audio-processing
>   else
> -PULSEAUDIO_CONF_OPTS += --disable-webrtc-aec
> -endif
> -
> -# neon intrinsics not available with float-abi=soft
> -ifeq ($(BR2_ARM_SOFT_FLOAT),)
> -ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
> -PULSEAUDIO_USE_NEON = y
> -endif
> -endif
> -
> -ifeq ($(PULSEAUDIO_USE_NEON),y)
> -PULSEAUDIO_CONF_OPTS += --enable-neon-opt=yes
> -else
> -PULSEAUDIO_CONF_OPTS += --enable-neon-opt=no
> +PULSEAUDIO_CONF_OPTS += -Dwebrtc-aec=disabled
>   endif
>   
>   # pulseaudio alsa backend needs pcm/mixer apis
>   ifeq ($(BR2_PACKAGE_ALSA_LIB_PCM)$(BR2_PACKAGE_ALSA_LIB_MIXER),yy)
>   PULSEAUDIO_DEPENDENCIES += alsa-lib
> -PULSEAUDIO_CONF_OPTS += --enable-alsa
> +PULSEAUDIO_CONF_OPTS += -Dalsa=enabled
>   else
> -PULSEAUDIO_CONF_OPTS += --disable-alsa
> +PULSEAUDIO_CONF_OPTS += -Dalsa=disabled
>   endif
>   
>   ifeq ($(BR2_PACKAGE_LIBXCB)$(BR2_PACKAGE_XLIB_LIBSM)$(BR2_PACKAGE_XLIB_LIBXTST),yyy)
> @@ -143,7 +124,7 @@ PULSEAUDIO_POST_PATCH_HOOKS += PULSEAUDIO_FIXUP_DESKTOP_FILES
>   endif
>   
>   else
> -PULSEAUDIO_CONF_OPTS += --disable-x11
> +PULSEAUDIO_CONF_OPTS += -Dx11=disabled
>   endif
>   
>   # ConsoleKit module init failure breaks user daemon startup
> @@ -175,4 +156,4 @@ endef
>   
>   endif
>   
> -$(eval $(autotools-package))
> +$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
