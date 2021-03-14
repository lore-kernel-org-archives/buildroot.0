From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Mar 2021 14:07:36 +0100
Subject: [Buildroot] [PATCH v1] package/meson: bump version to 0.57.1
In-Reply-To: <20210313222421.25397-1-ps.report@gmx.net>
References: <20210313222421.25397-1-ps.report@gmx.net>
Message-ID: <20210314130736.GZ2737665@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2021-03-13 23:24 +0100, Peter Seiderer spake thusly:
> - update patch 0001-Prefer-ext-static-libs-when-default-library-static.patch
>   (use get_option(OptionKey()) instead of get_builtin_option())
> 
> - rebase patch 0002-mesonbuild-dependencies-base.py-add-pkg_config_stati.patch
> 
> For details see [1].
> 
> [1] https://mesonbuild.com/Release-notes-for-0-57-0.html
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, thanks.

Please monitor the autobuilders to see if that breaks anything (meson
had a dependency to break some packages when bumped in the past).

Regards,
Yann E. MORIN.

> ---
>  ...atic-libs-when-default-library-static.patch | 12 +++++++-----
>  ...ndencies-base.py-add-pkg_config_stati.patch | 18 ++++++++++--------
>  package/meson/meson.hash                       |  4 ++--
>  package/meson/meson.mk                         |  2 +-
>  4 files changed, 20 insertions(+), 16 deletions(-)
> 
> diff --git a/package/meson/0001-Prefer-ext-static-libs-when-default-library-static.patch b/package/meson/0001-Prefer-ext-static-libs-when-default-library-static.patch
> index 2639915891..4a1325bd6b 100644
> --- a/package/meson/0001-Prefer-ext-static-libs-when-default-library-static.patch
> +++ b/package/meson/0001-Prefer-ext-static-libs-when-default-library-static.patch
> @@ -1,4 +1,4 @@
> -From ea85465e608178080c3b4d51af9765a8c7c0dae3 Mon Sep 17 00:00:00 2001
> +From cf9ad9b79a924081ce3d1e045bba3544815ea5f8 Mon Sep 17 00:00:00 2001
>  From: Matt Weber <matthew.weber@rockwellcollins.com>
>  Date: Sat, 26 Oct 2019 09:17:29 -0500
>  Subject: [PATCH] Prefer ext static libs when --default-library=static
> @@ -22,24 +22,26 @@ http://autobuild.buildroot.net/results/db1740b4777f436324218c52bc7b08e5c21b667d/
>  http://autobuild.buildroot.net/results/c17/c17bbb12d9deadd64a441b36e324cfbbe8aba5be/
>  
>  Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> +[Updated for 0.57.1 - get_builtin_option() vs. get_option(OptionKey())]
> +Signed-off-by: Peter Seiderer <ps.report@gmx.net>
>  ---
>   mesonbuild/compilers/mixins/clike.py | 3 +++
>   1 file changed, 3 insertions(+)
>  
>  diff --git a/mesonbuild/compilers/mixins/clike.py b/mesonbuild/compilers/mixins/clike.py
> -index 47e97d261..729c98acc 100644
> +index ad3bfae..4733910 100644
>  --- a/mesonbuild/compilers/mixins/clike.py
>  +++ b/mesonbuild/compilers/mixins/clike.py
> -@@ -940,6 +940,9 @@ class CLikeCompiler:
> +@@ -999,6 +999,9 @@ class CLikeCompiler(Compiler):
>           elif env.machines[self.for_machine].is_cygwin():
>               shlibext = ['dll', 'dll.a']
>               prefixes = ['cyg'] + prefixes
> -+        elif env.coredata.get_builtin_option('default_library') == 'static':
> ++        elif env.coredata.get_option(OptionKey('default_library')) == 'static':
>  +            # Linux/BSDs
>  +            shlibext = ['a']
>           else:
>               # Linux/BSDs
>               shlibext = ['so']
>  -- 
> -2.25.1
> +2.30.1
>  
> diff --git a/package/meson/0002-mesonbuild-dependencies-base.py-add-pkg_config_stati.patch b/package/meson/0002-mesonbuild-dependencies-base.py-add-pkg_config_stati.patch
> index eda17cadc5..9dbe22c83f 100644
> --- a/package/meson/0002-mesonbuild-dependencies-base.py-add-pkg_config_stati.patch
> +++ b/package/meson/0002-mesonbuild-dependencies-base.py-add-pkg_config_stati.patch
> @@ -1,4 +1,4 @@
> -From 8622d37587169c1e4a4206a9462868ede057f0e8 Mon Sep 17 00:00:00 2001
> +From 885af6ab2e02cca6bd190b8b29a355fdb6516936 Mon Sep 17 00:00:00 2001
>  From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>  Date: Sat, 15 Feb 2020 15:13:59 +0100
>  Subject: [PATCH] mesonbuild/dependencies/base.py: add pkg_config_static
> @@ -18,24 +18,26 @@ Fixes:
>  Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>  [Romain: Fix if condition, pkg_config_static is a string not a boolean]
>  Signed-off-by: Romain Naour <romain.naour@gmail.com>
> +[Rebased on 0.57.1]
> +Signed-off-by: Peter Seiderer <ps.report@gmx.net>
>  ---
>   mesonbuild/dependencies/base.py | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>  
>  diff --git a/mesonbuild/dependencies/base.py b/mesonbuild/dependencies/base.py
> -index 23701da95..83e51626d 100644
> +index cd77b4b..08675e6 100644
>  --- a/mesonbuild/dependencies/base.py
>  +++ b/mesonbuild/dependencies/base.py
> -@@ -849,7 +849,8 @@ class PkgConfigDependency(ExternalDependency):
> -     def _set_libs(self):
> +@@ -883,7 +883,8 @@ class PkgConfigDependency(ExternalDependency):
>           env = None
> -         libcmd = [self.name, '--libs']
> +         libcmd = ['--libs']
> + 
>  -        if self.static:
>  +        if self.static or \
>  +           (self.env.properties[self.for_machine].get('pkg_config_static', None) == 'true'):
>               libcmd.append('--static')
> -         # Force pkg-config to output -L fields even if they are system
> -         # paths so we can do manual searching with cc.find_library() later.
> + 
> +         libcmd.append(self.name)
>  -- 
> -2.25.1
> +2.30.1
>  
> diff --git a/package/meson/meson.hash b/package/meson/meson.hash
> index e07b914be5..d13a605e80 100644
> --- a/package/meson/meson.hash
> +++ b/package/meson/meson.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated after checking pgp signature
> -# https://github.com/mesonbuild/meson/releases/download/0.56.0/meson-0.56.2.tar.gz.asc
> -sha256  3cb8bdb91383f7f8da642f916e4c44066a29262caa499341e2880f010edb87f4  meson-0.56.2.tar.gz
> +# https://github.com/mesonbuild/meson/releases/download/0.57.1/meson-0.57.1.tar.gz.asc
> +sha256  72e1c782ba9bda204f4a1ed57f98d027d7b6eb9414c723eebbd6ec7f1955c8a6  meson-0.57.1.tar.gz
>  sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
> diff --git a/package/meson/meson.mk b/package/meson/meson.mk
> index 7e39883db3..eea5aedc51 100644
> --- a/package/meson/meson.mk
> +++ b/package/meson/meson.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -MESON_VERSION = 0.56.2
> +MESON_VERSION = 0.57.1
>  MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
>  MESON_LICENSE = Apache-2.0
>  MESON_LICENSE_FILES = COPYING
> -- 
> 2.30.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
