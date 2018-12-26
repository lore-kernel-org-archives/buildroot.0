From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 26 Dec 2018 09:51:29 +0100
Subject: [Buildroot] [PATCH v2 2/2] boot/systemd-boot: new package
In-Reply-To: <1545782200-1312-2-git-send-email-james.hilliard1@gmail.com>
References: <1545782200-1312-1-git-send-email-james.hilliard1@gmail.com>
 <1545782200-1312-2-git-send-email-james.hilliard1@gmail.com>
Message-ID: <20181226085129.GC14286@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2018-12-26 07:56 +0800, james.hilliard1 at gmail.com spake thusly:
> From: James Hilliard <james.hilliard1@gmail.com>
> 
> systemd-boot is the integration of gummiboot into systemd, and gummiboot
> is no longer maintained [0]. However, it is still interesting to use it
> as a simple, stand-alone bootloader.
> 
> Since systemd-boot is really part of systemd, when systemd is enabled
> (as an init system), we rely on it to build the boot blobs, and
> systemd-boot (this package) is not available.
> 
> Now, when systemd is not enabled, systemd-boot (this package) will
> actually build the boot blobs, and only that. No userspace tool is
> built.
> 
> To avoid duplication, we just symlink the systemd patches as-is. We just
> need to add a specific patch, that just relaxes the dependency checks,
> since we're only interested in building the boot blobs.
> 
> [0] https://cgit.freedesktop.org/gummiboot/commit/?id=55df1539c9d330732e88bd196afee386db6e4a1d
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> [yann.morin.1998 at free.fr:
>   - drop the duality due to to interdependence with systemd
>   - share boot files with systemd
>   - add patch to allow building only systemd-boot
>   - specify _SOURCE to be sure to share wth systemd
>   - rename the .hash file
>   - add comment about syncing the version with systemd
> ]
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> 
> ---
> Changes v3 -> v4 (James):
>   - remove more dependencies checks

Why? That was absolutely not necessary.

Besides, since that patch is not upstreamable, we will have to maintain
and fix it every time we bump systemd, which will be a maintainenance
burden. If only the strictly needed changes were made, then it would be
easier to update.

>   - use custom build commands instead of ninja opts

Why did you not include the initial third patch to introduce NINJA_OPTS?
Even if that was not your change but mine, you could have carried it and
sent it; git is smart enough to carry proper authorship, if that were
your concern.

It does make sense to have the possibility to pass arbitrary options to
the ninja backend to build arbitrary targets, like we have for autotools,
cmake, golang. luarocks, perl, python, and waf. meson/ninja and rebar
are the only two for which it's currently not possible...

Also, you forgot to state that this series requires your previous patch
about the CPU famlilly fix to be applied first.

And so, this series should be a 5-patch series (accounting for my last
comment on the CPU-familly fix):

  1. your exe_needs_wrapper fix
  2. your cpu-familly fix
  3- my ninja-opts addition
  4- systemd-boot as a systemd option
  5- standalone systemd-boot

Then, you should provide a cover-letter that explains the overall
changes you're doing.

So, yes, all your changes are related after all, except that they 
were not correctly explained and documented, nor were they correctly
split.

I'll send a series with all the bits gatyhered in a single series, as I
suggested above.

Thank you very much for the initial patches, and for your fortitude in
this journey! :-)

Regards,
Yann E. MORIN.

> Changes v2 -> v3 (Yann):
>   - changes identified in the commit log
> 
> Changes v1 -> v2 (James):
>   - split off from systemd into its own package  (Yann)
> ---
>  boot/Config.in                                     |    1 +
>  boot/systemd-boot/0001-fix-getty-unit.patch        |    1 +
>  .../0002-install-don-t-use-ln-relative.patch       |    1 +
>  ...etect-whether-struct-statx-is-defined-in-.patch |    1 +
>  ...-linux-stat.h-check-with-other-checks-and.patch |    1 +
>  ...sure-we-have-enough-space-for-the-DHCP6-o.patch |    1 +
>  ...eson.build-fix-detection-of-Werror-shadow.patch |    1 +
>  ...lax-depenencies-to-be-able-to-just-build-.patch | 1496 ++++++++++++++++++++
>  boot/systemd-boot/Config.in                        |   32 +
>  boot/systemd-boot/boot-files                       |    1 +
>  boot/systemd-boot/systemd-boot.hash                |    1 +
>  boot/systemd-boot/systemd-boot.mk                  |  104 ++
>  package/systemd/Config.in                          |    2 +-
>  package/systemd/systemd.mk                         |    1 +
>  14 files changed, 1643 insertions(+), 1 deletion(-)
>  create mode 120000 boot/systemd-boot/0001-fix-getty-unit.patch
>  create mode 120000 boot/systemd-boot/0002-install-don-t-use-ln-relative.patch
>  create mode 120000 boot/systemd-boot/0003-build-sys-Detect-whether-struct-statx-is-defined-in-.patch
>  create mode 120000 boot/systemd-boot/0004-meson-unify-linux-stat.h-check-with-other-checks-and.patch
>  create mode 120000 boot/systemd-boot/0005-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch
>  create mode 120000 boot/systemd-boot/0006-meson.build-fix-detection-of-Werror-shadow.patch
>  create mode 100644 boot/systemd-boot/1000-buildsys-relax-depenencies-to-be-able-to-just-build-.patch
>  create mode 100644 boot/systemd-boot/Config.in
>  create mode 120000 boot/systemd-boot/boot-files
>  create mode 120000 boot/systemd-boot/systemd-boot.hash
>  create mode 100644 boot/systemd-boot/systemd-boot.mk
> 
> diff --git a/boot/Config.in b/boot/Config.in
> index 8e0c8e5..5b7f606 100644
> --- a/boot/Config.in
> +++ b/boot/Config.in
> @@ -16,6 +16,7 @@ source "boot/mxs-bootlets/Config.in"
>  source "boot/riscv-pk/Config.in"
>  source "boot/s500-bootloader/Config.in"
>  source "boot/syslinux/Config.in"
> +source "boot/systemd-boot/Config.in"
>  source "boot/ts4800-mbrboot/Config.in"
>  source "boot/uboot/Config.in"
>  source "boot/vexpress-firmware/Config.in"
> diff --git a/boot/systemd-boot/0001-fix-getty-unit.patch b/boot/systemd-boot/0001-fix-getty-unit.patch
> new file mode 120000
> index 0000000..ffb5f53
> --- /dev/null
> +++ b/boot/systemd-boot/0001-fix-getty-unit.patch
> @@ -0,0 +1 @@
> +../../package/systemd/0001-fix-getty-unit.patch
> \ No newline at end of file
> diff --git a/boot/systemd-boot/0002-install-don-t-use-ln-relative.patch b/boot/systemd-boot/0002-install-don-t-use-ln-relative.patch
> new file mode 120000
> index 0000000..cfe0291
> --- /dev/null
> +++ b/boot/systemd-boot/0002-install-don-t-use-ln-relative.patch
> @@ -0,0 +1 @@
> +../../package/systemd/0002-install-don-t-use-ln-relative.patch
> \ No newline at end of file
> diff --git a/boot/systemd-boot/0003-build-sys-Detect-whether-struct-statx-is-defined-in-.patch b/boot/systemd-boot/0003-build-sys-Detect-whether-struct-statx-is-defined-in-.patch
> new file mode 120000
> index 0000000..ded8b4f
> --- /dev/null
> +++ b/boot/systemd-boot/0003-build-sys-Detect-whether-struct-statx-is-defined-in-.patch
> @@ -0,0 +1 @@
> +../../package/systemd/0003-build-sys-Detect-whether-struct-statx-is-defined-in-.patch
> \ No newline at end of file
> diff --git a/boot/systemd-boot/0004-meson-unify-linux-stat.h-check-with-other-checks-and.patch b/boot/systemd-boot/0004-meson-unify-linux-stat.h-check-with-other-checks-and.patch
> new file mode 120000
> index 0000000..32bc435
> --- /dev/null
> +++ b/boot/systemd-boot/0004-meson-unify-linux-stat.h-check-with-other-checks-and.patch
> @@ -0,0 +1 @@
> +../../package/systemd/0004-meson-unify-linux-stat.h-check-with-other-checks-and.patch
> \ No newline at end of file
> diff --git a/boot/systemd-boot/0005-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch b/boot/systemd-boot/0005-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch
> new file mode 120000
> index 0000000..003d6a7
> --- /dev/null
> +++ b/boot/systemd-boot/0005-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch
> @@ -0,0 +1 @@
> +../../package/systemd/0005-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch
> \ No newline at end of file
> diff --git a/boot/systemd-boot/0006-meson.build-fix-detection-of-Werror-shadow.patch b/boot/systemd-boot/0006-meson.build-fix-detection-of-Werror-shadow.patch
> new file mode 120000
> index 0000000..0e0a5cf
> --- /dev/null
> +++ b/boot/systemd-boot/0006-meson.build-fix-detection-of-Werror-shadow.patch
> @@ -0,0 +1 @@
> +../../package/systemd/0006-meson.build-fix-detection-of-Werror-shadow.patch
> \ No newline at end of file
> diff --git a/boot/systemd-boot/1000-buildsys-relax-depenencies-to-be-able-to-just-build-.patch b/boot/systemd-boot/1000-buildsys-relax-depenencies-to-be-able-to-just-build-.patch
> new file mode 100644
> index 0000000..2136d88
> --- /dev/null
> +++ b/boot/systemd-boot/1000-buildsys-relax-depenencies-to-be-able-to-just-build-.patch
> @@ -0,0 +1,1496 @@
> +From 71ee1948e3dd1c43f4c084750b854bbbbf58e840 Mon Sep 17 00:00:00 2001
> +From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> +Date: Tue, 25 Dec 2018 10:36:32 +0100
> +Subject: [PATCH] buildsys: relax depenencies to be able to just build
> + systemd-boot
> +
> +Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> +---
> + meson.build | 1423 +----------------------------------------------------------
> + 1 file changed, 4 insertions(+), 1419 deletions(-)
> +
> +diff --git a/meson.build b/meson.build
> +index b96ae38..347d3bd 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -577,7 +577,7 @@ endif
> + 
> + ############################################################
> + 
> +-gperf = find_program('gperf')
> ++gperf = find_program('gperf', required : false)
> + 
> + gperf_test_format = '''
> + #include <string.h>
> +@@ -604,7 +604,7 @@ conf.set('GPERF_LEN_TYPE', gperf_len_type,
> + ############################################################
> + 
> + if not cc.has_header('sys/capability.h')
> +-        error('POSIX caps headers not found')
> ++        warning('POSIX caps headers not found')
> + endif
> + foreach header : ['crypt.h',
> +                   'linux/btrfs.h',
> +@@ -802,10 +802,10 @@ libcrypt = cc.find_library('crypt')
> + libcap = dependency('libcap', required : false)
> + if not libcap.found()
> +         # Compat with Ubuntu 14.04 which ships libcap w/o .pc file
> +-        libcap = cc.find_library('cap')
> ++        libcap = cc.find_library('cap', required : false)
> + endif
> + 
> +-libmount = dependency('mount',
> ++libmount = dependency('mount', required : false,
> +                       version : fuzzer_build ? '>= 0' : '>= 2.30')
> + 
> + want_seccomp = get_option('seccomp')
> +@@ -1313,66 +1313,8 @@ includes = include_directories('src/basic',
> + 
> + add_project_arguments('-include', 'config.h', language : 'c')
> + 
> +-subdir('po')
> + subdir('catalog')
> + subdir('src/systemd')
> +-subdir('src/basic')
> +-subdir('src/libsystemd')
> +-subdir('src/libsystemd-network')
> +-subdir('src/journal')
> +-subdir('src/login')
> +-
> +-libjournal_core = static_library(
> +-        'journal-core',
> +-        libjournal_core_sources,
> +-        journald_gperf_c,
> +-        include_directories : includes,
> +-        install : false)
> +-
> +-libsystemd_sym_path = '@0@/@1@'.format(meson.current_source_dir(), libsystemd_sym)
> +-libsystemd = shared_library(
> +-        'systemd',
> +-        'src/systemd/sd-id128.h', # pick a header file at random to work around old meson bug
> +-        version : libsystemd_version,
> +-        include_directories : includes,
> +-        link_args : ['-shared',
> +-                     '-Wl,--version-script=' + libsystemd_sym_path],
> +-        link_with : [libbasic,
> +-                     libbasic_gcrypt],
> +-        link_whole : [libsystemd_static,
> +-                      libjournal_client],
> +-        dependencies : [threads,
> +-                        librt,
> +-                        libxz,
> +-                        liblz4],
> +-        link_depends : libsystemd_sym,
> +-        install : true,
> +-        install_dir : rootlibdir)
> +-
> +-static_libsystemd = get_option('static-libsystemd')
> +-static_libsystemd_pic = static_libsystemd == 'true' or static_libsystemd == 'pic'
> +-
> +-install_libsystemd_static = static_library(
> +-        'systemd',
> +-        libsystemd_sources,
> +-        journal_client_sources,
> +-        basic_sources,
> +-        basic_gcrypt_sources,
> +-        include_directories : includes,
> +-        build_by_default : static_libsystemd != 'false',
> +-        install : static_libsystemd != 'false',
> +-        install_dir : rootlibdir,
> +-        pic : static_libsystemd == 'true' or static_libsystemd == 'pic',
> +-        dependencies : [threads,
> +-                        librt,
> +-                        libxz,
> +-                        liblz4,
> +-                        libcap,
> +-                        libblkid,
> +-                        libmount,
> +-                        libselinux,
> +-                        libgcrypt],
> +-        c_args : libsystemd_c_args + (static_libsystemd_pic ? [] : ['-fno-PIC']))
> + 
> + ############################################################
> + 
> +@@ -1380,1305 +1322,8 @@ install_libsystemd_static = static_library(
> + # usually, but not always, installed in /bin.
> + public_programs = []
> + 
> +-subdir('src/libudev')
> +-subdir('src/shared')
> +-subdir('src/core')
> +-subdir('src/udev')
> +-subdir('src/network')
> +-
> +-subdir('src/analyze')
> +-subdir('src/journal-remote')
> +-subdir('src/coredump')
> +-subdir('src/hostname')
> +-subdir('src/import')
> +-subdir('src/kernel-install')
> +-subdir('src/locale')
> +-subdir('src/machine')
> +-subdir('src/portable')
> +-subdir('src/nspawn')
> +-subdir('src/resolve')
> +-subdir('src/timedate')
> +-subdir('src/timesync')
> +-subdir('src/vconsole')
> + subdir('src/boot/efi')
> + 
> +-subdir('src/test')
> +-subdir('src/fuzz')
> +-subdir('rules')
> +-subdir('test')
> +-
> +-############################################################
> +-
> +-# only static linking apart from libdl, to make sure that the
> +-# module is linked to all libraries that it uses.
> +-test_dlopen = executable(
> +-        'test-dlopen',
> +-        test_dlopen_c,
> +-        include_directories : includes,
> +-        link_with : [libbasic],
> +-        dependencies : [libdl])
> +-
> +-foreach tuple : [['myhostname', 'ENABLE_MYHOSTNAME'],
> +-                 ['systemd',    'ENABLE_NSS_SYSTEMD'],
> +-                 ['mymachines', 'ENABLE_MACHINED'],
> +-                 ['resolve',    'ENABLE_RESOLVE']]
> +-
> +-        condition = tuple[1] == '' or conf.get(tuple[1]) == 1
> +-        if condition
> +-                module = tuple[0]
> +-
> +-                sym = 'src/nss- at 0@/nss- at 0@.sym'.format(module)
> +-                version_script_arg = join_paths(meson.current_source_dir(), sym)
> +-
> +-                nss = shared_library(
> +-                        'nss_' + module,
> +-                        'src/nss- at 0@/nss- at 0@.c'.format(module),
> +-                        version : '2',
> +-                        include_directories : includes,
> +-                        # Note that we link NSS modules with '-z nodelete' so that mempools never get orphaned
> +-                        link_args : ['-Wl,-z,nodelete',
> +-                                     '-shared',
> +-                                     '-Wl,--version-script=' + version_script_arg,
> +-                                     '-Wl,--undefined'],
> +-                        link_with : [libsystemd_static,
> +-                                     libbasic],
> +-                        dependencies : [threads,
> +-                                        librt],
> +-                        link_depends : sym,
> +-                        install : true,
> +-                        install_dir : rootlibdir)
> +-
> +-                # We cannot use shared_module because it does not support version suffix.
> +-                # Unfortunately shared_library insists on creating the symlink?
> +-                meson.add_install_script('sh', '-c',
> +-                                         'rm $DESTDIR at 0@/libnss_ at 1@.so'
> +-                                         .format(rootlibdir, module))
> +-
> +-                test('dlopen-nss_' + module,
> +-                     test_dlopen,
> +-                     args : [nss.full_path()]) # path to dlopen must include a slash
> +-        endif
> +-endforeach
> +-
> +-############################################################
> +-
> +-executable('systemd',
> +-           systemd_sources,
> +-           include_directories : includes,
> +-           link_with : [libcore,
> +-                        libshared],
> +-           dependencies : [threads,
> +-                           librt,
> +-                           libseccomp,
> +-                           libselinux,
> +-                           libmount,
> +-                           libblkid],
> +-           install_rpath : rootlibexecdir,
> +-           install : true,
> +-           install_dir : rootlibexecdir)
> +-
> +-meson.add_install_script(meson_make_symlink,
> +-                         join_paths(rootlibexecdir, 'systemd'),
> +-                         join_paths(rootsbindir, 'init'))
> +-
> +-exe = executable('systemd-analyze',
> +-                 systemd_analyze_sources,
> +-                 include_directories : includes,
> +-                 link_with : [libcore,
> +-                              libshared],
> +-                 dependencies : [threads,
> +-                                 librt,
> +-                                 libseccomp,
> +-                                 libselinux,
> +-                                 libmount,
> +-                                 libblkid],
> +-                 install_rpath : rootlibexecdir,
> +-                 install : true)
> +-public_programs += [exe]
> +-
> +-executable('systemd-journald',
> +-           systemd_journald_sources,
> +-           include_directories : includes,
> +-           link_with : [libjournal_core,
> +-                        libshared],
> +-           dependencies : [threads,
> +-                           libxz,
> +-                           liblz4,
> +-                           libselinux],
> +-           install_rpath : rootlibexecdir,
> +-           install : true,
> +-           install_dir : rootlibexecdir)
> +-
> +-exe = executable('systemd-cat',
> +-                 systemd_cat_sources,
> +-                 include_directories : includes,
> +-                 link_with : [libjournal_core,
> +-                              libshared],
> +-                 dependencies : [threads],
> +-                 install_rpath : rootlibexecdir,
> +-                 install : true)
> +-public_programs += [exe]
> +-
> +-exe = executable('journalctl',
> +-                 journalctl_sources,
> +-                 include_directories : includes,
> +-                 link_with : [libshared],
> +-                 dependencies : [threads,
> +-                                 libqrencode,
> +-                                 libxz,
> +-                                 liblz4,
> +-                                 libpcre2],
> +-                 install_rpath : rootlibexecdir,
> +-                 install : true,
> +-                 install_dir : rootbindir)
> +-public_programs += [exe]
> +-
> +-executable('systemd-getty-generator',
> +-           'src/getty-generator/getty-generator.c',
> +-           include_directories : includes,
> +-           link_with : [libshared],
> +-           install_rpath : rootlibexecdir,
> +-           install : true,
> +-           install_dir : systemgeneratordir)
> +-
> +-executable('systemd-debug-generator',
> +-           'src/debug-generator/debug-generator.c',
> +-           include_directories : includes,
> +-           link_with : [libshared],
> +-           install_rpath : rootlibexecdir,
> +-           install : true,
> +-           install_dir : systemgeneratordir)
> +-
> +-executable('systemd-fstab-generator',
> +-           'src/fstab-generator/fstab-generator.c',
> +-           'src/core/mount-setup.c',
> +-           include_directories : includes,
> +-           link_with : [libshared],
> +-           install_rpath : rootlibexecdir,
> +-           install : true,
> +-           install_dir : systemgeneratordir)
> +-
> +-if conf.get('ENABLE_ENVIRONMENT_D') == 1
> +-        executable('30-systemd-environment-d-generator',
> +-                   'src/environment-d-generator/environment-d-generator.c',
> +-                   include_directories : includes,
> +-                   link_with : [libshared],
> +-                   install_rpath : rootlibexecdir,
> +-                   install : true,
> +-                   install_dir : userenvgeneratordir)
> +-
> +-        meson.add_install_script(meson_make_symlink,
> +-                                 join_paths(sysconfdir, 'environment'),
> +-                                 join_paths(environmentdir, '99-environment.conf'))
> +-endif
> +-
> +-if conf.get('ENABLE_HIBERNATE') == 1
> +-        executable('systemd-hibernate-resume-generator',
> +-                   'src/hibernate-resume/hibernate-resume-generator.c',
> +-                   include_directories : includes,
> +-                   link_with : [libshared],
> +-                   install_rpath : rootlibexecdir,
> +-                   install : true,
> +-                   install_dir : systemgeneratordir)
> +-
> +-        executable('systemd-hibernate-resume',
> +-                   'src/hibernate-resume/hibernate-resume.c',
> +-                   include_directories : includes,
> +-                   link_with : [libshared],
> +-                   install_rpath : rootlibexecdir,
> +-                   install : true,
> +-                   install_dir : rootlibexecdir)
> +-endif
> +-
> +-if conf.get('HAVE_BLKID') == 1
> +-        executable('systemd-gpt-auto-generator',
> +-                   'src/gpt-auto-generator/gpt-auto-generator.c',
> +-                   'src/basic/blkid-util.h',
> +-                   include_directories : includes,
> +-                   link_with : [libshared],
> +-                   dependencies : libblkid,
> +-                   install_rpath : rootlibexecdir,
> +-                   install : true,
> +-                   install_dir : systemgeneratordir)
> +-
> +-        exe = executable('systemd-dissect',
> +-                         'src/dissect/dissect.c',
> +-                         include_directories : includes,
> +-                         link_with : [libshared],
> +-                         install_rpath : rootlibexecdir,
> +-                         install : true,
> +-                         install_dir : rootlibexecdir)
> +-        public_programs += [exe]
> +-endif
> +-
> +-if conf.get('ENABLE_RESOLVE') == 1
> +-        executable('systemd-resolved',
> +-                   systemd_resolved_sources,
> +-                   include_directories : includes,
> +-                   link_with : [libshared,
> +-                                libbasic_gcrypt,
> +-                                libsystemd_resolve_core],
> +-                   dependencies : systemd_resolved_dependencies,
> +-                   install_rpath : rootlibexecdir,
> +-                   install : true,
> +-                   install_dir : rootlibexecdir)
> +-
> +-        exe = executable('resolvectl',
> +-                         resolvectl_sources,
> +-                         include_directories : includes,
> +-                         link_with : [libshared,
> +-                                      libbasic_gcrypt,
> +-                                      libsystemd_resolve_core],
> +-                         dependencies : [threads,
> +-                                         libgpg_error,
> +-                                         libm,
> +-                                         libidn],
> +-                         install_rpath : rootlibexecdir,
> +-                         install : true)
> +-        public_programs += [exe]
> +-
> +-        meson.add_install_script(meson_make_symlink,
> +-                         join_paths(bindir, 'resolvectl'),
> +-                         join_paths(rootsbindir, 'resolvconf'))
> +-
> +-        meson.add_install_script(meson_make_symlink,
> +-                         join_paths(bindir, 'resolvectl'),
> +-                         join_paths(bindir, 'systemd-resolve'))
> +-endif
> +-
> +-if conf.get('ENABLE_LOGIND') == 1
> +-        executable('systemd-logind',
> +-                   systemd_logind_sources,
> +-                   include_directories : includes,
> +-                   link_with : [liblogind_core,
> +-                                libshared],
> +-                   dependencies : [threads,
> +-                                   libacl],
> +-                   install_rpath : rootlibexecdir,
> +-                   install : true,
> +-                   install_dir : rootlibexecdir)
> +-
> +-        exe = executable('loginctl',
> +-                         loginctl_sources,
> +-                         include_directories : includes,
> +-                         link_with : [libshared],
> +-                         dependencies : [threads,
> +-                                         liblz4,
> +-                                         libxz],
> +-                         install_rpath : rootlibexecdir,
> +-                         install : true,
> +-                         install_dir : rootbindir)
> +-        public_programs += [exe]
> +-
> +-        exe = executable('systemd-inhibit',
> +-                         'src/login/inhibit.c',
> +-                         include_directories : includes,
> +-                         link_with : [libshared],
> +-                         install_rpath : rootlibexecdir,
> +-                         install : true,
> +-                         install_dir : rootbindir)
> +-        public_programs += [exe]
> +-
> +-        if conf.get('HAVE_PAM') == 1
> +-                version_script_arg = join_paths(meson.current_source_dir(), pam_systemd_sym)
> +-                pam_systemd = shared_library(
> +-                        'pam_systemd',
> +-                        pam_systemd_c,
> +-                        name_prefix : '',
> +-                        include_directories : includes,
> +-                        link_args : ['-shared',
> +-                                     '-Wl,--version-script=' + version_script_arg],
> +-                        link_with : [libsystemd_static,
> +-                                     libshared_static],
> +-                        dependencies : [threads,
> +-                                        libpam,
> +-                                        libpam_misc],
> +-                        link_depends : pam_systemd_sym,
> +-                        install : true,
> +-                        install_dir : pamlibdir)
> +-
> +-                test('dlopen-pam_systemd',
> +-                     test_dlopen,
> +-                     args : [pam_systemd.full_path()]) # path to dlopen must include a slash
> +-        endif
> +-endif
> +-
> +-executable('systemd-user-runtime-dir',
> +-           user_runtime_dir_sources,
> +-           include_directories : includes,
> +-           link_with : [libshared, liblogind_core],
> +-           install_rpath : rootlibexecdir,
> +-           install : true,
> +-           install_dir : rootlibexecdir)
> +-
> +-if conf.get('HAVE_PAM') == 1
> +-        executable('systemd-user-sessions',
> +-                   'src/user-sessions/user-sessions.c',
> +-                   include_directories : includes,
> +-                   link_with : [libshared],
> +-                   install_rpath : rootlibexecdir,
> +-                   install : true,
> +-                   install_dir : rootlibexecdir)
> +-endif
> +-
> +-if conf.get('ENABLE_EFI') == 1 and conf.get('HAVE_BLKID') == 1
> +-        exe = executable('bootctl',
> +-                         'src/boot/bootctl.c',
> +-                         include_directories : includes,
> +-                         link_with : [libshared],
> +-                         dependencies : [libblkid],
> +-                         install_rpath : rootlibexecdir,
> +-                         install : true)
> +-        public_programs += [exe]
> +-endif
> +-
> +-exe = executable('systemd-socket-activate', 'src/activate/activate.c',
> +-                 include_directories : includes,
> +-                 link_with : [libshared],
> +-                 dependencies : [threads],
> +-                 install_rpath : rootlibexecdir,
> +-                 install : true)
> +-public_programs += [exe]
> +-
> +-
> +-if get_option('link-systemctl-shared')
> +-        systemctl_link_with = [libshared]
> +-else
> +-        systemctl_link_with = [libsystemd_static,
> +-                               libshared_static,
> +-                               libjournal_client,
> +-                               libbasic_gcrypt]
> +-endif
> +-
> +-exe = executable('systemctl', 'src/systemctl/systemctl.c',
> +-                 include_directories : includes,
> +-                 link_with : systemctl_link_with,
> +-                 dependencies : [threads,
> +-                                 libcap,
> +-                                 libselinux,
> +-                                 libxz,
> +-                                 liblz4],
> +-                 install_rpath : rootlibexecdir,
> +-                 install : true,
> +-                 install_dir : rootbindir)
> +-public_programs += [exe]
> +-
> +-if conf.get('ENABLE_PORTABLED') == 1
> +-        executable('systemd-portabled',
> +-                   systemd_portabled_sources,
> +-                   include_directories : includes,
> +-                   link_with : [libshared],
> +-                   dependencies : [threads],
> +-                   install_rpath : rootlibexecdir,
> +-                   install : true,
> +-                   install_dir : rootlibexecdir)
> +-
> +-        exe = executable('portablectl', 'src/portable/portablectl.c',
> +-                         include_directories : includes,
> +-                         link_with : [libshared],
> +-                         dependencies : [threads],
> +-                         install_rpath : rootlibexecdir,
> +-                         install : true,
> +-                         install_dir : rootlibexecdir)
> +-        public_programs += [exe]
> +-endif
> +-
> +-foreach alias : ['halt', 'poweroff', 'reboot', 'runlevel', 'shutdown', 'telinit']
> +-        meson.add_install_script(meson_make_symlink,
> +-                                 join_paths(rootbindir, 'systemctl'),
> +-                                 join_paths(rootsbindir, alias))
> +-endforeach
> +-
> +-if conf.get('ENABLE_BACKLIGHT') == 1
> +-        executable('systemd-backlight',
> +-                   'src/backlight/backlight.c',
> +-                   include_directories : includes,
> +-                   link_with : [libshared],
> +-                   install_rpath : rootlibexecdir,
> +-                   install : true,
> +-                   install_dir : rootlibexecdir)
> +-endif
> +-
> +-if conf.get('ENABLE_RFKILL') == 1
> +-        executable('systemd-rfkill',
> +-                   'src/rfkill/rfkill.c',
> +-                   include_directories : includes,
> +-                   link_with : [libshared],
> +-                   install_rpath : rootlibexecdir,
> +-                   install : true,
> +-                   install_dir : rootlibexecdir)
> +-endif
> +-
> +-executable('systemd-system-update-generator',
> +-           'src/system-update-generator/system-update-generator.c',
> +-           include_directories : includes,
> +-           link_with : [libshared],
> +-           install_rpath : rootlibexecdir,
> +-           install : true,
> +-           install_dir : systemgeneratordir)
> +-
> +-if conf.get('HAVE_LIBCRYPTSETUP') == 1
> +-        executable('systemd-cryptsetup',
> +-                   'src/cryptsetup/cryptsetup.c',
> +-                   include_directories : includes,
> +-                   link_with : [libshared],
> +-                   dependencies : [libcryptsetup],
> +-                   install_rpath : rootlibexecdir,
> +-                   install : true,
> +-                   install_dir : rootlibexecdir)
> +-
> +-        executable('systemd-cryptsetup-generator',
> +-                   'src/cryptsetup/cryptsetup-generator.c',
> +-                   include_directories : includes,
> +-                   link_with : [libshared],
> +-                   dependencies : [libcryptsetup],
> +-                   install_rpath : rootlibexecdir,
> +-                   install : true,
> +-                   install_dir : systemgeneratordir)
> +-
> +-        executable('systemd-veritysetup',
> +-                   'src/veritysetup/veritysetup.c',
> +-                   include_directories : includes,
> +-                   link_with : [libshared],
> +-                   dependencies : [libcryptsetup],
> +-                   install_rpath : rootlibexecdir,
> +-                   install : true,
> +-                   install_dir : rootlibexecdir)
> +-
> +-        executable('systemd-veritysetup-generator',
> +-                   'src/veritysetup/veritysetup-generator.c',
> +-                   include_directories : includes,
> +-                   link_with : [libshared],
> +-                   dependencies : [libcryptsetup],
> +-                   install_rpath : rootlibexecdir,
> +-                   install : true,
> +-                   install_dir : systemgeneratordir)
> +-endif
> +-
> +-if conf.get('HAVE_SYSV_COMPAT') == 1
> +-        executable('systemd-sysv-generator',
> +-                   'src/sysv-generator/sysv-generator.c',
> +-                   include_directories : includes,
> +-                   link_with : [libshared],
> +-                   install_rpath : rootlibexecdir,
> +-                   install : true,
> +-                   install_dir : systemgeneratordir)
> +-
> +-        executable('systemd-rc-local-generator',
> +-                   'src/rc-local-generator/rc-local-generator.c',
> +-                   include_directories : includes,
> +-                   link_with : [libshared],
> +-                   install_rpath : rootlibexecdir,
> +-                   install : true,
> +-                   install_dir : systemgeneratordir)
> +-endif
> +-
> +-if conf.get('ENABLE_HOSTNAMED') == 1
> +-        executable('systemd-hostnamed',
> +-                   'src/hostname/hostnamed.c',
> +-                   include_directories : includes,
> +-                   link_with : [libshared],
> +-                   install_rpath : rootlibexecdir,
> +-                   install : true,
> +-                   install_dir : rootlibexecdir)
> +-
> +-        exe = executable('hostnamectl',
> +-                         'src/hostname/hostnamectl.c',
> +-                         include_directories : includes,
> +-                         link_with : [libshared],
> +-                         install_rpath : rootlibexecdir,
> +-                         install : true)
> +-        public_programs += [exe]
> +-endif
> +-
> +-if conf.get('ENABLE_LOCALED') == 1
> +-        if conf.get('HAVE_XKBCOMMON') == 1
> +-                # logind will load libxkbcommon.so dynamically on its own
> +-                deps = [libdl]
> +-        else
> +-                deps = []
> +-        endif
> +-
> +-        executable('systemd-localed',
> +-                   systemd_localed_sources,
> +-                   include_directories : includes,
> +-                   link_with : [libshared],
> +-                   dependencies : deps,
> +-                   install_rpath : rootlibexecdir,
> +-                   install : true,
> +-                   install_dir : rootlibexecdir)
> +-
> +-        exe = executable('localectl',
> +-                         localectl_sources,
> +-                         include_directories : includes,
> +-                         link_with : [libshared],
> +-                         install_rpath : rootlibexecdir,
> +-                         install : true)
> +-        public_programs += [exe]
> +-endif
> +-
> +-if conf.get('ENABLE_TIMEDATED') == 1
> +-        executable('systemd-timedated',
> +-                   'src/timedate/timedated.c',
> +-                   include_directories : includes,
> +-                   link_with : [libshared],
> +-                   install_rpath : rootlibexecdir,
> +-                   install : true,
> +-                   install_dir : rootlibexecdir)
> +-endif
> +-
> +-if conf.get('ENABLE_TIMEDATECTL') == 1
> +-        exe = executable('timedatectl',
> +-                         'src/timedate/timedatectl.c',
> +-                         include_directories : includes,
> +-                         install_rpath : rootlibexecdir,
> +-                         link_with : [libshared],
> +-                         dependencies : [libm],
> +-                         install : true)
> +-        public_programs += [exe]
> +-endif
> +-
> +-if conf.get('ENABLE_TIMESYNCD') == 1
> +-        executable('systemd-timesyncd',
> +-                   systemd_timesyncd_sources,
> +-                   include_directories : includes,
> +-                   link_with : [libshared],
> +-                   dependencies : [threads,
> +-                                   libm],
> +-                   install_rpath : rootlibexecdir,
> +-                   install : true,
> +-                   install_dir : rootlibexecdir)
> +-
> +-        executable('systemd-time-wait-sync',
> +-                   'src/time-wait-sync/time-wait-sync.c',
> +-                   include_directories : includes,
> +-                   link_with : [libshared],
> +-                   install_rpath : rootlibexecdir,
> +-                   install : true,
> +-                   install_dir : rootlibexecdir)
> +-endif
> +-
> +-if conf.get('ENABLE_MACHINED') == 1
> +-        executable('systemd-machined',
> +-                   systemd_machined_sources,
> +-                   include_directories : includes,
> +-                   link_with : [libmachine_core,
> +-                                libshared],
> +-                   install_rpath : rootlibexecdir,
> +-                   install : true,
> +-                   install_dir : rootlibexecdir)
> +-
> +-        exe = executable('machinectl',
> +-                         'src/machine/machinectl.c',
> +-                         include_directories : includes,
> +-                         link_with : [libshared],
> +-                         dependencies : [threads,
> +-                                         libxz,
> +-                                         liblz4],
> +-                         install_rpath : rootlibexecdir,
> +-                         install : true,
> +-                         install_dir : rootbindir)
> +-        public_programs += [exe]
> +-endif
> +-
> +-if conf.get('ENABLE_IMPORTD') == 1
> +-        executable('systemd-importd',
> +-                   systemd_importd_sources,
> +-                   include_directories : includes,
> +-                   link_with : [libshared],
> +-                   dependencies : [threads],
> +-                   install_rpath : rootlibexecdir,
> +-                   install : true,
> +-                   install_dir : rootlibexecdir)
> +-
> +-        systemd_pull = executable('systemd-pull',
> +-                                  systemd_pull_sources,
> +-                                  include_directories : includes,
> +-                                  link_with : [libshared],
> +-                                  dependencies : [libcurl,
> +-                                                  libz,
> +-                                                  libbzip2,
> +-                                                  libxz,
> +-                                                  libgcrypt],
> +-                                  install_rpath : rootlibexecdir,
> +-                                  install : true,
> +-                                  install_dir : rootlibexecdir)
> +-
> +-        systemd_import = executable('systemd-import',
> +-                                    systemd_import_sources,
> +-                                    include_directories : includes,
> +-                                    link_with : [libshared],
> +-                                    dependencies : [libcurl,
> +-                                                    libz,
> +-                                                    libbzip2,
> +-                                                    libxz],
> +-                                    install_rpath : rootlibexecdir,
> +-                                    install : true,
> +-                                    install_dir : rootlibexecdir)
> +-
> +-        systemd_export = executable('systemd-export',
> +-                                    systemd_export_sources,
> +-                                    include_directories : includes,
> +-                                    link_with : [libshared],
> +-                                    dependencies : [libcurl,
> +-                                                    libz,
> +-                                                    libbzip2,
> +-                                                    libxz],
> +-                                    install_rpath : rootlibexecdir,
> +-                                    install : true,
> +-                                    install_dir : rootlibexecdir)
> +-        public_programs += [systemd_pull, systemd_import, systemd_export]
> +-endif
> +-
> +-if conf.get('ENABLE_REMOTE') == 1 and conf.get('HAVE_LIBCURL') == 1
> +-        exe = executable('systemd-journal-upload',
> +-                         systemd_journal_upload_sources,
> +-                         include_directories : includes,
> +-                         link_with : [libshared],
> +-                         dependencies : [threads,
> +-                                         libcurl,
> +-                                         libgnutls,
> +-                                         libxz,
> +-                                         liblz4],
> +-                         install_rpath : rootlibexecdir,
> +-                         install : true,
> +-                         install_dir : rootlibexecdir)
> +-        public_programs += [exe]
> +-endif
> +-
> +-if conf.get('ENABLE_REMOTE') == 1 and conf.get('HAVE_MICROHTTPD') == 1
> +-        s_j_remote = executable('systemd-journal-remote',
> +-                                systemd_journal_remote_sources,
> +-                                include_directories : includes,
> +-                                link_with : [libshared,
> +-                                             libsystemd_journal_remote],
> +-                                dependencies : [threads,
> +-                                                libmicrohttpd,
> +-                                                libgnutls,
> +-                                                libxz,
> +-                                                liblz4],
> +-                                install_rpath : rootlibexecdir,
> +-                                install : true,
> +-                                install_dir : rootlibexecdir)
> +-
> +-        s_j_gatewayd = executable('systemd-journal-gatewayd',
> +-                                  systemd_journal_gatewayd_sources,
> +-                                  include_directories : includes,
> +-                                  link_with : [libshared],
> +-                                  dependencies : [threads,
> +-                                                  libmicrohttpd,
> +-                                                  libgnutls,
> +-                                                  libxz,
> +-                                                  liblz4],
> +-                                  install_rpath : rootlibexecdir,
> +-                                  install : true,
> +-                                  install_dir : rootlibexecdir)
> +-        public_programs += [s_j_remote, s_j_gatewayd]
> +-endif
> +-
> +-if conf.get('ENABLE_COREDUMP') == 1
> +-        executable('systemd-coredump',
> +-                   systemd_coredump_sources,
> +-                   include_directories : includes,
> +-                   link_with : [libshared],
> +-                   dependencies : [threads,
> +-                                   libacl,
> +-                                   libdw,
> +-                                   libxz,
> +-                                   liblz4],
> +-                   install_rpath : rootlibexecdir,
> +-                   install : true,
> +-                   install_dir : rootlibexecdir)
> +-
> +-        exe = executable('coredumpctl',
> +-                         coredumpctl_sources,
> +-                         include_directories : includes,
> +-                         link_with : [libshared],
> +-                         dependencies : [threads,
> +-                                         libxz,
> +-                                         liblz4],
> +-                         install_rpath : rootlibexecdir,
> +-                         install : true)
> +-        public_programs += [exe]
> +-endif
> +-
> +-if conf.get('ENABLE_BINFMT') == 1
> +-        exe = executable('systemd-binfmt',
> +-                         'src/binfmt/binfmt.c',
> +-                         include_directories : includes,
> +-                         link_with : [libshared],
> +-                         install_rpath : rootlibexecdir,
> +-                         install : true,
> +-                         install_dir : rootlibexecdir)
> +-        public_programs += [exe]
> +-
> +-        meson.add_install_script('sh', '-c',
> +-                                 mkdir_p.format(binfmtdir))
> +-        meson.add_install_script('sh', '-c',
> +-                                 mkdir_p.format(join_paths(sysconfdir, 'binfmt.d')))
> +-endif
> +-
> +-if conf.get('ENABLE_VCONSOLE') == 1
> +-        executable('systemd-vconsole-setup',
> +-                   'src/vconsole/vconsole-setup.c',
> +-                   include_directories : includes,
> +-                   link_with : [libshared],
> +-                   install_rpath : rootlibexecdir,
> +-                   install : true,
> +-                   install_dir : rootlibexecdir)
> +-endif
> +-
> +-if conf.get('ENABLE_RANDOMSEED') == 1
> +-        executable('systemd-random-seed',
> +-                   'src/random-seed/random-seed.c',
> +-                   include_directories : includes,
> +-                   link_with : [libshared],
> +-                   install_rpath : rootlibexecdir,
> +-                   install : true,
> +-                   install_dir : rootlibexecdir)
> +-endif
> +-
> +-if conf.get('ENABLE_FIRSTBOOT') == 1
> +-        executable('systemd-firstboot',
> +-                   'src/firstboot/firstboot.c',
> +-                   include_directories : includes,
> +-                   link_with : [libshared],
> +-                   dependencies : [libcrypt],
> +-                   install_rpath : rootlibexecdir,
> +-                   install : true,
> +-                   install_dir : rootbindir)
> +-endif
> +-
> +-executable('systemd-remount-fs',
> +-           'src/remount-fs/remount-fs.c',
> +-           'src/core/mount-setup.c',
> +-           'src/core/mount-setup.h',
> +-           include_directories : includes,
> +-           link_with : [libshared],
> +-           install_rpath : rootlibexecdir,
> +-           install : true,
> +-           install_dir : rootlibexecdir)
> +-
> +-executable('systemd-machine-id-setup',
> +-           'src/machine-id-setup/machine-id-setup-main.c',
> +-           'src/core/machine-id-setup.c',
> +-           'src/core/machine-id-setup.h',
> +-           include_directories : includes,
> +-           link_with : [libshared],
> +-           install_rpath : rootlibexecdir,
> +-           install : true,
> +-           install_dir : rootbindir)
> +-
> +-executable('systemd-fsck',
> +-           'src/fsck/fsck.c',
> +-           include_directories : includes,
> +-           link_with : [libshared],
> +-           install_rpath : rootlibexecdir,
> +-           install : true,
> +-           install_dir : rootlibexecdir)
> +-
> +-executable('systemd-growfs',
> +-           'src/partition/growfs.c',
> +-           include_directories : includes,
> +-           link_with : [libshared],
> +-           dependencies : [libcryptsetup],
> +-           install_rpath : rootlibexecdir,
> +-           install : true,
> +-           install_dir : rootlibexecdir)
> +-
> +-executable('systemd-makefs',
> +-           'src/partition/makefs.c',
> +-           include_directories : includes,
> +-           link_with : [libshared],
> +-           install_rpath : rootlibexecdir,
> +-           install : true,
> +-           install_dir : rootlibexecdir)
> +-
> +-executable('systemd-sleep',
> +-           'src/sleep/sleep.c',
> +-           include_directories : includes,
> +-           link_with : [libshared],
> +-           install_rpath : rootlibexecdir,
> +-           install : true,
> +-           install_dir : rootlibexecdir)
> +-
> +-exe = executable('systemd-sysctl',
> +-                 'src/sysctl/sysctl.c',
> +-                 include_directories : includes,
> +-                 link_with : [libshared],
> +-                 install_rpath : rootlibexecdir,
> +-                 install : true,
> +-                 install_dir : rootlibexecdir)
> +-public_programs += [exe]
> +-
> +-executable('systemd-ac-power',
> +-           'src/ac-power/ac-power.c',
> +-           include_directories : includes,
> +-           link_with : [libshared],
> +-           install_rpath : rootlibexecdir,
> +-           install : true,
> +-           install_dir : rootlibexecdir)
> +-
> +-exe = executable('systemd-detect-virt',
> +-                 'src/detect-virt/detect-virt.c',
> +-                 include_directories : includes,
> +-                 link_with : [libshared],
> +-                 install_rpath : rootlibexecdir,
> +-                 install : true)
> +-public_programs += [exe]
> +-
> +-exe = executable('systemd-delta',
> +-                 'src/delta/delta.c',
> +-                 include_directories : includes,
> +-                 link_with : [libshared],
> +-                 install_rpath : rootlibexecdir,
> +-                 install : true)
> +-public_programs += [exe]
> +-
> +-exe = executable('systemd-escape',
> +-                 'src/escape/escape.c',
> +-                 include_directories : includes,
> +-                 link_with : [libshared],
> +-                 install_rpath : rootlibexecdir,
> +-                 install : true,
> +-                 install_dir : rootbindir)
> +-public_programs += [exe]
> +-
> +-exe = executable('systemd-notify',
> +-                 'src/notify/notify.c',
> +-                 include_directories : includes,
> +-                 link_with : [libshared],
> +-                 install_rpath : rootlibexecdir,
> +-                 install : true,
> +-                 install_dir : rootbindir)
> +-public_programs += [exe]
> +-
> +-executable('systemd-volatile-root',
> +-           'src/volatile-root/volatile-root.c',
> +-           include_directories : includes,
> +-           link_with : [libshared],
> +-           install_rpath : rootlibexecdir,
> +-           install : true,
> +-           install_dir : rootlibexecdir)
> +-
> +-executable('systemd-cgroups-agent',
> +-           'src/cgroups-agent/cgroups-agent.c',
> +-           include_directories : includes,
> +-           link_with : [libshared],
> +-           install_rpath : rootlibexecdir,
> +-           install : true,
> +-           install_dir : rootlibexecdir)
> +-
> +-exe = executable('systemd-path',
> +-                 'src/path/path.c',
> +-                 include_directories : includes,
> +-                 link_with : [libshared],
> +-                 install_rpath : rootlibexecdir,
> +-                 install : true)
> +-public_programs += [exe]
> +-
> +-exe = executable('systemd-ask-password',
> +-                 'src/ask-password/ask-password.c',
> +-                 include_directories : includes,
> +-                 link_with : [libshared],
> +-                 install_rpath : rootlibexecdir,
> +-                 install : true,
> +-                 install_dir : rootbindir)
> +-public_programs += [exe]
> +-
> +-executable('systemd-reply-password',
> +-           'src/reply-password/reply-password.c',
> +-           include_directories : includes,
> +-           link_with : [libshared],
> +-           install_rpath : rootlibexecdir,
> +-           install : true,
> +-           install_dir : rootlibexecdir)
> +-
> +-exe = executable('systemd-tty-ask-password-agent',
> +-                 'src/tty-ask-password-agent/tty-ask-password-agent.c',
> +-                 include_directories : includes,
> +-                 link_with : [libshared],
> +-                 install_rpath : rootlibexecdir,
> +-                 install : true,
> +-                 install_dir : rootbindir)
> +-public_programs += [exe]
> +-
> +-exe = executable('systemd-cgls',
> +-                 'src/cgls/cgls.c',
> +-                 include_directories : includes,
> +-                 link_with : [libshared],
> +-                 install_rpath : rootlibexecdir,
> +-                 install : true)
> +-public_programs += [exe]
> +-
> +-exe = executable('systemd-cgtop',
> +-                 'src/cgtop/cgtop.c',
> +-                 include_directories : includes,
> +-                 link_with : [libshared],
> +-                 install_rpath : rootlibexecdir,
> +-                 install : true)
> +-public_programs += [exe]
> +-
> +-executable('systemd-initctl',
> +-           'src/initctl/initctl.c',
> +-           include_directories : includes,
> +-           link_with : [libshared],
> +-           install_rpath : rootlibexecdir,
> +-           install : true,
> +-           install_dir : rootlibexecdir)
> +-
> +-exe = executable('systemd-mount',
> +-                 'src/mount/mount-tool.c',
> +-                 include_directories : includes,
> +-                 link_with : [libshared],
> +-                 install_rpath : rootlibexecdir,
> +-                 install : true)
> +-public_programs += [exe]
> +-
> +-meson.add_install_script(meson_make_symlink,
> +-                         'systemd-mount', join_paths(bindir, 'systemd-umount'))
> +-
> +-exe = executable('systemd-run',
> +-                 'src/run/run.c',
> +-                 include_directories : includes,
> +-                 link_with : [libshared],
> +-                 install_rpath : rootlibexecdir,
> +-                 install : true)
> +-public_programs += [exe]
> +-
> +-exe = executable('systemd-stdio-bridge',
> +-                 'src/stdio-bridge/stdio-bridge.c',
> +-                 include_directories : includes,
> +-                 link_with : [libshared],
> +-                 install_rpath : rootlibexecdir,
> +-                 install : true)
> +-public_programs += [exe]
> +-
> +-exe = executable('busctl',
> +-                 'src/busctl/busctl.c',
> +-                 'src/busctl/busctl-introspect.c',
> +-                 'src/busctl/busctl-introspect.h',
> +-                 include_directories : includes,
> +-                 link_with : [libshared],
> +-                 install_rpath : rootlibexecdir,
> +-                 install : true)
> +-public_programs += [exe]
> +-
> +-if conf.get('ENABLE_SYSUSERS') == 1
> +-        exe = executable('systemd-sysusers',
> +-                         'src/sysusers/sysusers.c',
> +-                         include_directories : includes,
> +-                         link_with : [libshared],
> +-                         install_rpath : rootlibexecdir,
> +-                         install : true,
> +-                         install_dir : rootbindir)
> +-        public_programs += [exe]
> +-endif
> +-
> +-if conf.get('ENABLE_TMPFILES') == 1
> +-        exe = executable('systemd-tmpfiles',
> +-                         'src/tmpfiles/tmpfiles.c',
> +-                         include_directories : includes,
> +-                         link_with : [libshared],
> +-                         dependencies : [libacl],
> +-                         install_rpath : rootlibexecdir,
> +-                         install : true,
> +-                         install_dir : rootbindir)
> +-        public_programs += [exe]
> +-
> +-        test('test-systemd-tmpfiles',
> +-             test_systemd_tmpfiles_py,
> +-             args : exe.full_path())
> +-        # https://github.com/mesonbuild/meson/issues/2681
> +-endif
> +-
> +-if conf.get('ENABLE_HWDB') == 1
> +-        exe = executable('systemd-hwdb',
> +-                         'src/hwdb/hwdb.c',
> +-                         'src/libsystemd/sd-hwdb/hwdb-internal.h',
> +-                         include_directories : includes,
> +-                         link_with : [libudev_static],
> +-                         install_rpath : udev_rpath,
> +-                         install : true,
> +-                         install_dir : rootbindir)
> +-        public_programs += [exe]
> +-endif
> +-
> +-if conf.get('ENABLE_QUOTACHECK') == 1
> +-        executable('systemd-quotacheck',
> +-                   'src/quotacheck/quotacheck.c',
> +-                   include_directories : includes,
> +-                   link_with : [libshared],
> +-                   install_rpath : rootlibexecdir,
> +-                   install : true,
> +-                   install_dir : rootlibexecdir)
> +-endif
> +-
> +-exe = executable('systemd-socket-proxyd',
> +-                 'src/socket-proxy/socket-proxyd.c',
> +-                 include_directories : includes,
> +-                 link_with : [libshared],
> +-                 dependencies : [threads],
> +-                 install_rpath : rootlibexecdir,
> +-                 install : true,
> +-                 install_dir : rootlibexecdir)
> +-public_programs += [exe]
> +-
> +-exe = executable('systemd-udevd',
> +-                 systemd_udevd_sources,
> +-                 include_directories : includes,
> +-                 c_args : ['-DLOG_REALM=LOG_REALM_UDEV'],
> +-                 link_with : [libudev_core,
> +-                              libsystemd_network,
> +-                              libudev_static],
> +-                 dependencies : [threads,
> +-                                 libkmod,
> +-                                 libidn,
> +-                                 libacl,
> +-                                 libblkid],
> +-                 install_rpath : udev_rpath,
> +-                 install : true,
> +-                 install_dir : rootlibexecdir)
> +-public_programs += [exe]
> +-
> +-exe = executable('udevadm',
> +-                 udevadm_sources,
> +-                 c_args : ['-DLOG_REALM=LOG_REALM_UDEV'],
> +-                 include_directories : includes,
> +-                 link_with : [libudev_core,
> +-                              libsystemd_network,
> +-                              libudev_static],
> +-                 dependencies : [threads,
> +-                                 libkmod,
> +-                                 libidn,
> +-                                 libacl,
> +-                                 libblkid],
> +-                 install_rpath : udev_rpath,
> +-                 install : true,
> +-                 install_dir : rootbindir)
> +-public_programs += [exe]
> +-
> +-executable('systemd-shutdown',
> +-           systemd_shutdown_sources,
> +-           include_directories : includes,
> +-           link_with : [libshared],
> +-           dependencies : [libmount],
> +-           install_rpath : rootlibexecdir,
> +-           install : true,
> +-           install_dir : rootlibexecdir)
> +-
> +-executable('systemd-update-done',
> +-           'src/update-done/update-done.c',
> +-           include_directories : includes,
> +-           link_with : [libshared],
> +-           install_rpath : rootlibexecdir,
> +-           install : true,
> +-           install_dir : rootlibexecdir)
> +-
> +-executable('systemd-update-utmp',
> +-           'src/update-utmp/update-utmp.c',
> +-           include_directories : includes,
> +-           link_with : [libshared],
> +-           dependencies : [libaudit],
> +-           install_rpath : rootlibexecdir,
> +-           install : true,
> +-           install_dir : rootlibexecdir)
> +-
> +-if conf.get('HAVE_KMOD') == 1
> +-        executable('systemd-modules-load',
> +-                   'src/modules-load/modules-load.c',
> +-                   include_directories : includes,
> +-                   link_with : [libshared],
> +-                   dependencies : [libkmod],
> +-                   install_rpath : rootlibexecdir,
> +-                   install : true,
> +-                   install_dir : rootlibexecdir)
> +-
> +-        meson.add_install_script('sh', '-c',
> +-                                 mkdir_p.format(modulesloaddir))
> +-        meson.add_install_script('sh', '-c',
> +-                                 mkdir_p.format(join_paths(sysconfdir, 'modules-load.d')))
> +-endif
> +-
> +-exe = executable('systemd-nspawn',
> +-                 systemd_nspawn_sources,
> +-                 'src/core/mount-setup.c', # FIXME: use a variable?
> +-                 'src/core/mount-setup.h',
> +-                 'src/core/loopback-setup.c',
> +-                 'src/core/loopback-setup.h',
> +-                 include_directories : includes,
> +-                 link_with : [libnspawn_core,
> +-                              libshared],
> +-                 dependencies : [libblkid],
> +-                 install_rpath : rootlibexecdir,
> +-                 install : true)
> +-public_programs += [exe]
> +-
> +-if conf.get('ENABLE_NETWORKD') == 1
> +-        executable('systemd-networkd',
> +-                   systemd_networkd_sources,
> +-                   include_directories : includes,
> +-                   link_with : [libnetworkd_core,
> +-                                libsystemd_network,
> +-                                libudev_static,
> +-                                libshared],
> +-                   dependencies : [threads],
> +-                   install_rpath : rootlibexecdir,
> +-                   install : true,
> +-                   install_dir : rootlibexecdir)
> +-
> +-        executable('systemd-networkd-wait-online',
> +-                   systemd_networkd_wait_online_sources,
> +-                   include_directories : includes,
> +-                   link_with : [libnetworkd_core,
> +-                                libshared],
> +-                   install_rpath : rootlibexecdir,
> +-                   install : true,
> +-                   install_dir : rootlibexecdir)
> +-
> +-        exe = executable('networkctl',
> +-                   networkctl_sources,
> +-                   include_directories : includes,
> +-                   link_with : [libsystemd_network,
> +-                              libshared],
> +-                   install_rpath : rootlibexecdir,
> +-                   install : true,
> +-                   install_dir : rootbindir)
> +-        public_programs += [exe]
> +-endif
> +-
> +-executable('systemd-sulogin-shell',
> +-           ['src/sulogin-shell/sulogin-shell.c'],
> +-           include_directories : includes,
> +-           link_with : [libshared],
> +-           install_rpath : rootlibexecdir,
> +-           install : true,
> +-           install_dir : rootlibexecdir)
> +-
> +-############################################################
> +-
> +-foreach tuple : tests
> +-        sources = tuple[0]
> +-        link_with = tuple[1].length() > 0 ? tuple[1] : [libshared]
> +-        dependencies = tuple[2]
> +-        condition = tuple.length() >= 4 ? tuple[3] : ''
> +-        type = tuple.length() >= 5 ? tuple[4] : ''
> +-        defs = tuple.length() >= 6 ? tuple[5] : []
> +-        incs = tuple.length() >= 7 ? tuple[6] : includes
> +-        timeout = 30
> +-
> +-        name = sources[0].split('/')[-1].split('.')[0]
> +-        if type.startswith('timeout=')
> +-                timeout = type.split('=')[1].to_int()
> +-                type = ''
> +-        endif
> +-        if want_tests == 'false'
> +-                message('Not compiling @0@ because tests is set to false'.format(name))
> +-        elif condition == '' or conf.get(condition) == 1
> +-                exe = executable(
> +-                        name,
> +-                        sources,
> +-                        include_directories : incs,
> +-                        link_with : link_with,
> +-                        dependencies : dependencies,
> +-                        c_args : defs,
> +-                        install_rpath : rootlibexecdir,
> +-                        install : install_tests,
> +-                        install_dir : join_paths(testsdir, type))
> +-
> +-                if type == 'manual'
> +-                        message('@0@ is a manual test'.format(name))
> +-                elif type == 'unsafe' and want_tests != 'unsafe'
> +-                        message('@0@ is an unsafe test'.format(name))
> +-                else
> +-                        test(name, exe,
> +-                             env : test_env,
> +-                             timeout : timeout)
> +-                endif
> +-        else
> +-                message('Not compiling @0@ because @1@ is not true'.format(name, condition))
> +-        endif
> +-endforeach
> +-
> +-exe = executable(
> +-        'test-libsystemd-sym',
> +-        test_libsystemd_sym_c,
> +-        include_directories : includes,
> +-        link_with : [libsystemd],
> +-        install : install_tests,
> +-        install_dir : testsdir)
> +-test('test-libsystemd-sym', exe)
> +-
> +-exe = executable(
> +-        'test-libsystemd-static-sym',
> +-        test_libsystemd_sym_c,
> +-        include_directories : includes,
> +-        link_with : [install_libsystemd_static],
> +-        dependencies : [threads], # threads is already included in dependencies on the library,
> +-                                  # but does not seem to get propagated. Add here as a work-around.
> +-        build_by_default : static_libsystemd_pic,
> +-        install : install_tests and static_libsystemd_pic,
> +-        install_dir : testsdir)
> +-if static_libsystemd_pic
> +-        test('test-libsystemd-static-sym', exe)
> +-endif
> +-
> +-exe = executable(
> +-        'test-libudev-sym',
> +-        test_libudev_sym_c,
> +-        include_directories : includes,
> +-        c_args : ['-Wno-deprecated-declarations'],
> +-        link_with : [libudev],
> +-        install : install_tests,
> +-        install_dir : testsdir)
> +-test('test-libudev-sym', exe)
> +-
> +-exe = executable(
> +-        'test-libudev-static-sym',
> +-        test_libudev_sym_c,
> +-        include_directories : includes,
> +-        c_args : ['-Wno-deprecated-declarations'],
> +-        link_with : [install_libudev_static],
> +-        build_by_default : static_libudev_pic,
> +-        install : install_tests and static_libudev_pic,
> +-        install_dir : testsdir)
> +-if static_libudev_pic
> +-        test('test-libudev-static-sym', exe)
> +-endif
> +-
> +-############################################################
> +-
> +-fuzzer_exes = []
> +-
> +-foreach tuple : fuzzers
> +-        sources = tuple[0]
> +-        link_with = tuple[1].length() > 0 ? tuple[1] : [libshared]
> +-        dependencies = tuple[2]
> +-        defs = tuple.length() >= 4 ? tuple[3] : []
> +-        incs = tuple.length() >= 5 ? tuple[4] : includes
> +-
> +-        if fuzzer_build
> +-                dependencies += fuzzing_engine
> +-        else
> +-                sources += 'src/fuzz/fuzz-main.c'
> +-        endif
> +-
> +-        name = sources[0].split('/')[-1].split('.')[0]
> +-
> +-        fuzzer_exes += executable(
> +-                name,
> +-                sources,
> +-                include_directories : [incs, include_directories('src/fuzz')],
> +-                link_with : link_with,
> +-                dependencies : dependencies,
> +-                c_args : defs,
> +-                install : false)
> +-endforeach
> +-
> +-run_target('fuzzers',
> +-        depends : fuzzer_exes,
> +-        command : ['true'])
> +-
> + ############################################################
> + 
> + make_directive_index_py = find_program('tools/make-directive-index.py')
> +@@ -2739,58 +1384,6 @@ endforeach
> + 
> + ############################################################
> + 
> +-# Enable tests for all supported sanitizers
> +-foreach tuple : sanitizers
> +-        sanitizer = tuple[0]
> +-        build = tuple[1]
> +-
> +-        have = run_command(check_compilation_sh,
> +-                           cc.cmd_array(), '-x', 'c',
> +-                           '-fsanitize=@0@'.format(sanitizer),
> +-                           '-include', link_test_c).returncode() == 0
> +-        message('@0@ sanitizer supported: @1@'.format(sanitizer, have ? 'yes' : 'no'))
> +-
> +-        if have
> +-                prev = ''
> +-                foreach p : fuzz_regression_tests
> +-                        b = p.split('/')[-2]
> +-                        c = p.split('/')[-1]
> +-
> +-                        name = '@0@:@1@'.format(b, sanitizer)
> +-
> +-                        if name != prev
> +-                                if want_tests == 'false'
> +-                                        message('Not compiling @0@ because tests is set to false'.format(name))
> +-                                elif slow_tests
> +-                                        exe = custom_target(
> +-                                                name,
> +-                                                output : name,
> +-                                                depends : build,
> +-                                                command : [env, 'ln', '-fs',
> +-                                                           join_paths(build.full_path(), b),
> +-                                                           '@OUTPUT@'],
> +-                                                build_by_default : true)
> +-                                else
> +-                                        message('Not compiling @0@ because slow-tests is set to false'.format(name))
> +-                                endif
> +-                        endif
> +-                        prev = name
> +-
> +-                        if want_tests != 'false' and slow_tests
> +-                                test('@0@:@1@:@2@'.format(b, c, sanitizer),
> +-                                     env,
> +-                                     args : [exe.full_path(),
> +-                                             join_paths(meson.source_root(),
> +-                                                        'test/fuzz-regressions',
> +-                                                        p)])
> +-                        endif
> +-                endforeach
> +-        endif
> +-endforeach
> +-
> +-
> +-############################################################
> +-
> + if git.found()
> +         all_files = run_command(
> +                 git,
> +@@ -2836,14 +1429,6 @@ endif
> + 
> + ############################################################
> + 
> +-meson_check_api_docs_sh = find_program('tools/meson-check-api-docs.sh')
> +-run_target(
> +-        'check-api-docs',
> +-        depends : [man, libsystemd, libudev],
> +-        command : [meson_check_api_docs_sh, libsystemd.full_path(), libudev.full_path()])
> +-
> +-############################################################
> +-
> + status = [
> +         '@0@ @1@'.format(meson.project_name(), meson.project_version()),
> + 
> +-- 
> +2.7.4
> +
> diff --git a/boot/systemd-boot/Config.in b/boot/systemd-boot/Config.in
> new file mode 100644
> index 0000000..51dcebb
> --- /dev/null
> +++ b/boot/systemd-boot/Config.in
> @@ -0,0 +1,32 @@
> +config BR2_TARGET_SYSTEMD_BOOT
> +	bool "systemd-boot"
> +	depends on BR2_i386 || BR2_x86_64
> +	depends on !BR2_PACKAGE_SYSTEMD
> +	select BR2_PACKAGE_GNU_EFI
> +	help
> +	  systemd-boot is a simple UEFI boot manager which executes
> +	  configured EFI images. The default entry is selected by a
> +	  configured pattern (glob) or an on-screen menu.
> +
> +	  systemd-boot operates on the EFI System Partition (ESP)
> +	  only. Configuration file fragments, kernels, initrds, other
> +	  EFI images need to reside on the ESP. Linux kernels need to
> +	  be built with CONFIG_EFI_STUB to be able to be directly
> +	  executed as an EFI image.
> +
> +	  See the Grub2 help text for details on preparing an EFI
> +	  capable disk image using systemd-boot: the instructions are
> +	  exactly the same, except that the systemd-boot configuration
> +	  files will be located in /loader/ inside the EFI partition.
> +
> +	  https://www.freedesktop.org/wiki/Software/systemd/systemd-boot/
> +
> +config BR2_TARGET_SYSTEMD_BOOT_EFI_ARCH
> +	string
> +	default "ia32"  if BR2_i386
> +	default "x64"   if BR2_x86_64
> +	depends on BR2_TARGET_SYSTEMD_BOOT
> +
> +comment "systemd-boot is provided by systemd"
> +	depends on BR2_i386 || BR2_x86_64
> +	depends on BR2_PACKAGE_SYSTEMD
> diff --git a/boot/systemd-boot/boot-files b/boot/systemd-boot/boot-files
> new file mode 120000
> index 0000000..0ff51d4
> --- /dev/null
> +++ b/boot/systemd-boot/boot-files
> @@ -0,0 +1 @@
> +../../package/systemd/boot-files
> \ No newline at end of file
> diff --git a/boot/systemd-boot/systemd-boot.hash b/boot/systemd-boot/systemd-boot.hash
> new file mode 120000
> index 0000000..4259f40
> --- /dev/null
> +++ b/boot/systemd-boot/systemd-boot.hash
> @@ -0,0 +1 @@
> +../../package/systemd/systemd.hash
> \ No newline at end of file
> diff --git a/boot/systemd-boot/systemd-boot.mk b/boot/systemd-boot/systemd-boot.mk
> new file mode 100644
> index 0000000..0a9dd15
> --- /dev/null
> +++ b/boot/systemd-boot/systemd-boot.mk
> @@ -0,0 +1,104 @@
> +################################################################################
> +#
> +# systemd-boot
> +#
> +################################################################################
> +
> +# When updating this version, please also update it in package/systemd/
> +SYSTEMD_BOOT_VERSION = 239
> +SYSTEMD_BOOT_SITE = $(call github,systemd,systemd,v$(SYSTEMD_BOOT_VERSION))
> +SYSTEMD_BOOT_SOURCE = systemd-239.tar.gz
> +SYSTEMD_BOOT_DL_SUBDIR = systemd
> +
> +SYSTEMD_BOOT_LICENSE = LGPL-2.1+, GPL-2.0+ (udev), Public Domain (few source files, see README)
> +SYSTEMD_BOOT_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1 README
> +
> +SYSTEMD_BOOT_DEPENDENCIES = gnu-efi
> +
> +SYSTEMD_BOOT_INSTALL_TARGET = NO
> +SYSTEMD_BOOT_INSTALL_IMAGES = YES
> +
> +SYSTEMD_BOOT_CONF_OPTS += \
> +	-Drootlibdir='/usr/lib' \
> +	-Dblkid=false \
> +	-Dman=false \
> +	-Dima=false \
> +	-Dlibcryptsetup=false \
> +	-Defi=true \
> +	-Dgnu-efi=true \
> +	-Defi-cc=$(TARGET_CC) \
> +	-Defi-ld=$(TARGET_LD) \
> +	-Defi-libdir=$(STAGING_DIR)/usr/lib \
> +	-Defi-ldsdir=$(STAGING_DIR)/usr/lib \
> +	-Defi-includedir=$(STAGING_DIR)/usr/include/efi \
> +	-Dldconfig=false \
> +	-Ddefault-dnssec=no \
> +	-Dtests=false \
> +	-Dnobody-group=nogroup \
> +	-Didn=false \
> +	-Dnss-systemd=false \
> +	-Dacl=false \
> +	-Daudit=false \
> +	-Delfutils=false \
> +	-Dlibidn=false \
> +	-Dlibidn2=false \
> +	-Dseccomp=false \
> +	-Dxkbcommon=false \
> +	-Dbzip2=false \
> +	-Dlz4=false \
> +	-Dpam=false \
> +	-Dxz=false \
> +	-Dzlib=false \
> +	-Dlibcurl=false \
> +	-Dgcrypt=false \
> +	-Dpcre2=false \
> +	-Dmicrohttpd=false \
> +	-Dqrencode=false \
> +	-Dselinux=false \
> +	-Dhwdb=false \
> +	-Dbinfmt=false \
> +	-Dvconsole=false \
> +	-Dquotacheck=false \
> +	-Dtmpfiles=false \
> +	-Dsysusers=false \
> +	-Dfirstboot=false \
> +	-Drandomseed=false \
> +	-Dbacklight=false \
> +	-Drfkill=false \
> +	-Dlogind=false \
> +	-Dmachined=false \
> +	-Dimportd=false \
> +	-Dhostnamed=false \
> +	-Dmyhostname=false \
> +	-Dtimedated=false \
> +	-Dlocaled=false \
> +	-Dcoredump=false \
> +	-Dpolkit=false \
> +	-Dnetworkd=false \
> +	-Dresolve=false \
> +	-Dtimesyncd=false \
> +	-Dsmack=false \
> +	-Dhibernate=false
> +
> +SYSTEMD_BOOT_CONF_ENV = $(HOST_UTF8_LOCALE_ENV)
> +SYSTEMD_BOOT_NINJA_ENV = $(HOST_UTF8_LOCALE_ENV)
> +
> +SYSTEMD_BOOT_TARGET_EFI_ARCH = $(call qstrip,$(BR2_TARGET_SYSTEMD_BOOT_EFI_ARCH))
> +define SYSTEMD_BOOT_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(SYSTEMD_BOOT_NINJA_ENV) \
> +		$(NINJA) $(NINJA_OPTS) -C $(@D)/build \
> +		src/boot/efi/{systemd-boot$(SYSTEMD_BOOT_TARGET_EFI_ARCH).efi,linux$(SYSTEMD_BOOT_TARGET_EFI_ARCH).efi.stub}
> +endef
> +
> +define SYSTEMD_BOOT_INSTALL_IMAGES_CMDS
> +	$(INSTALL) -D -m 0644 $(@D)/build/src/boot/efi/systemd-boot$(SYSTEMD_BOOT_TARGET_EFI_ARCH).efi \
> +		$(BINARIES_DIR)/efi-part/EFI/BOOT/boot$(SYSTEMD_BOOT_TARGET_EFI_ARCH).efi
> +	echo "boot$(SYSTEMD_BOOT_TARGET_EFI_ARCH).efi" > \
> +		$(BINARIES_DIR)/efi-part/startup.nsh
> +	$(INSTALL) -D -m 0644 $(SYSTEMD_BOOT_PKGDIR)/boot-files/loader.conf \
> +		$(BINARIES_DIR)/efi-part/loader/loader.conf
> +	$(INSTALL) -D -m 0644 $(SYSTEMD_BOOT_PKGDIR)/boot-files/buildroot.conf \
> +		$(BINARIES_DIR)/efi-part/loader/entries/buildroot.conf
> +endef
> +
> +$(eval $(meson-package))
> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> index 50d09b3..a99358f 100644
> --- a/package/systemd/Config.in
> +++ b/package/systemd/Config.in
> @@ -101,9 +101,9 @@ config BR2_PACKAGE_SYSTEMD_BOOT
>  
>  config BR2_PACKAGE_SYSTEMD_BOOT_EFI_ARCH
>  	string
> -	depends on BR2_PACKAGE_SYSTEMD_BOOT
>  	default "ia32"  if BR2_i386
>  	default "x64"   if BR2_x86_64
> +	depends on BR2_PACKAGE_SYSTEMD_BOOT
>  
>  config BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY
>  	bool "HTTP server for journal events"
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 2822d44..3f8f7aa 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -4,6 +4,7 @@
>  #
>  ################################################################################
>  
> +# When updating this version, please also update it in boot/systemd-boot/
>  SYSTEMD_VERSION = 239
>  SYSTEMD_SITE = $(call github,systemd,systemd,v$(SYSTEMD_VERSION))
>  SYSTEMD_LICENSE = LGPL-2.1+, GPL-2.0+ (udev), Public Domain (few source files, see README)
> -- 
> 2.7.4
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
