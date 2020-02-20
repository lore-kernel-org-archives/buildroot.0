From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 20 Feb 2020 10:29:09 +0100
Subject: [Buildroot] [PATCH 1/1] package/meson: fix pkg-config --static
In-Reply-To: <20200215152620.3553021-1-fontaine.fabrice@gmail.com>
References: <20200215152620.3553021-1-fontaine.fabrice@gmail.com>
Message-ID: <b355bbc2-43a2-7ad4-3767-5b44393a8fab@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15/02/2020 16:26, Fabrice Fontaine wrote:
> pkg-config wrapper is not used since commit
> 4e0bc29993376613d200e892d491e31ea5a49622, this raise static build
> failures with libglib2 because --static is not passed anymore to
> pkg-config so add a patch to get back the old behaviour.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/0d36952def63cb69628697fa6408aeb6ce10cb5b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...dencies-base.py-add-pkg_config_stati.patch | 38 +++++++++++++++++++
>  package/meson/cross-compilation.conf.in       |  1 +
>  package/pkg-meson.mk                          |  1 +
>  3 files changed, 40 insertions(+)
>  create mode 100644 package/meson/0004-mesonbuild-dependencies-base.py-add-pkg_config_stati.patch
> 
> diff --git a/package/meson/0004-mesonbuild-dependencies-base.py-add-pkg_config_stati.patch b/package/meson/0004-mesonbuild-dependencies-base.py-add-pkg_config_stati.patch
> new file mode 100644
> index 0000000000..7bb00f3fba
> --- /dev/null
> +++ b/package/meson/0004-mesonbuild-dependencies-base.py-add-pkg_config_stati.patch
> @@ -0,0 +1,38 @@
> +From 3a4962ede0d12bac66b38e0843f6e2ea75b03d50 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sat, 15 Feb 2020 15:13:59 +0100
> +Subject: [PATCH] mesonbuild/dependencies/base.py: add pkg_config_static
> +
> +Allow the user to always call pkg-config with --static thanks to a
> +pkg_config_static property. This will allow to fix static build failures
> +with libglib2:
> +
> +FAILED: gio/gio
> +/home/naourr/work/instance-0/output-1/host/bin/arm-linux-gcc  -o gio/gio 'gio/6ae6c9e@@gio at exe/gio-tool.c.o' 'gio/6ae6c9e@@gio at exe/gio-tool-cat.c.o' 'gio/6ae6c9e@@gio at exe/gio-tool-copy.c.o' 'gio/6ae6c9e@@gio at exe/gio-tool-info.c.o' 'gio/6ae6c9e@@gio at exe/gio-tool-list.c.o' 'gio/6ae6c9e@@gio at exe/gio-tool-mime.c.o' 'gio/6ae6c9e@@gio at exe/gio-tool-mkdir.c.o' 'gio/6ae6c9e@@gio at exe/gio-tool-monitor.c.o' 'gio/6ae6c9e@@gio at exe/gio-tool-mount.c.o' 'gio/6ae6c9e@@gio at exe/gio-tool-move.c.o' 'gio/6ae6c9e@@gio at exe/gio-tool-open.c.o' 'gio/6ae6c9e@@gio at exe/gio-tool-rename.c.o' 'gio/6ae6c9e@@gio at exe/gio-tool-remove.c.o' 'gio/6ae6c9e@@gio at exe/gio-tool-save.c.o' 'gio/6ae6c9e@@gio at exe/gio-tool-set.c.o' 'gio/6ae6c9e@@gio at exe/gio-tool-trash.c.o' 'gio/6ae6c9e@@gio at exe/gio-tool-tree.c.o' -Wl,--as-needed -Wl,--no-undefined -Wl,-O1 -static -Wl,--start-group gio/libgio-2.0.a glib/libglib-2.0.a gobject/libgobject-2.0.a gmodule/libgmodule-2.0.a -pthread /home/naourr/work/instance-0/output-1/host/arm-build
>  root-linux-uclibcgnueabi/sysroot/usr/lib/libz.a /home/naourr/work/instance-0/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libmount.a /home/naourr/work/instance-0/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libpcre.a -lm /home/naourr/work/instance-0/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libffi.a -Wl,--end-group '-Wl,-rpath,$ORIGIN/:$ORIGIN/../glib:$ORIGIN/../gobject:$ORIGIN/../gmodule' -Wl,-rpath-link,/home/naourr/work/instance-0/output-1/build/libglib2-2.62.4/build/gio -Wl,-rpath-link,/home/naourr/work/instance-0/output-1/build/libglib2-2.62.4/build/glib -Wl,-rpath-link,/home/naourr/work/instance-0/output-1/build/libglib2-2.62.4/build/gobject -Wl,-rpath-link,/home/naourr/work/instance-0/output-1/build/libglib2-2.62.4/build/gmodule
> +/home/naourr/work/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/8.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/naourr/work/instance-0/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libmount.a(la-fs.o): in function `__mnt_fs_set_source_ptr':
> +fs.c:(.text+0x5ec): undefined reference to `blkid_parse_tag_string'
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/0d36952def63cb69628697fa6408aeb6ce10cb5b
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + mesonbuild/dependencies/base.py | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/mesonbuild/dependencies/base.py b/mesonbuild/dependencies/base.py
> +index a83e3d6c..913bff6b 100644
> +--- a/mesonbuild/dependencies/base.py
> ++++ b/mesonbuild/dependencies/base.py
> +@@ -840,7 +840,7 @@ class PkgConfigDependency(ExternalDependency):
> +     def _set_libs(self):
> +         env = None
> +         libcmd = [self.name, '--libs']
> +-        if self.static:
> ++        if self.static or self.env.properties[self.for_machine].get('pkg_config_static', False):

 Looks OK-ish to me, *if* we can get it accepted upstream. As is, it probably
won't get accepted because it misses a documentation update.

 Maybe we should go upstream and ask advice...


 Regards,
 Arnout

> +             libcmd.append('--static')
> +         # Force pkg-config to output -L fields even if they are system
> +         # paths so we can do manual searching with cc.find_library() later.
> +-- 
> +2.24.1
> +
> diff --git a/package/meson/cross-compilation.conf.in b/package/meson/cross-compilation.conf.in
> index 369e225b3e..d80c472de6 100644
> --- a/package/meson/cross-compilation.conf.in
> +++ b/package/meson/cross-compilation.conf.in
> @@ -18,6 +18,7 @@ cpp_args = [@TARGET_CXXFLAGS@]
>  cpp_link_args = [@TARGET_LDFLAGS@]
>  sys_root = '@STAGING_DIR@'
>  pkg_config_libdir = '@STAGING_DIR@/usr/lib/pkgconfig:@STAGING_DIR@/usr/share/pkgconfig'
> +pkg_config_static = '@STATIC@'
>  
>  [host_machine]
>  system = 'linux'
> diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
> index 642b715938..9482845cd3 100644
> --- a/package/pkg-meson.mk
> +++ b/package/pkg-meson.mk
> @@ -76,6 +76,7 @@ define $(2)_CONFIGURE_CMDS
>  	    -e 's%@TARGET_CXXFLAGS@%$$(call make-comma-list,$$($(2)_CXXFLAGS))%g' \
>  	    -e 's%@HOST_DIR@%$$(HOST_DIR)%g' \
>  	    -e 's%@STAGING_DIR@%$$(STAGING_DIR)%g' \
> +	    -e 's%@STATIC@%$$(if $$(BR2_STATIC_LIBS),true,false)%g' \
>  	    $$(foreach x,$$($(2)_MESON_EXTRA_BINARIES), \
>  	        -e "/^\[binaries\]$$$$/s:$$$$:\n$$(x):" \
>  	    ) \
> 
