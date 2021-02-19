From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 19 Feb 2021 22:35:48 +0100
Subject: [Buildroot] [PATCH 1/1] package/botan: fix build with -latomic
In-Reply-To: <20210219193824.2573501-1-fontaine.fabrice@gmail.com>
References: <20210219193824.2573501-1-fontaine.fabrice@gmail.com>
Message-ID: <20210219213548.GF2276@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-02-19 20:38 +0100, Fabrice Fontaine spake thusly:
> Static build with toolchains needing -latomic (e.g sparc) is broken
> since version 2.17.0 and
> https://github.com/randombit/botan/commit/88af81b88976d9a1293280f68df597220ab42767
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/5c03ee53a34a3cdb409cffcda76e5cc2c723778b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...roup-l-flags-from-LDFLAGS-to-the-end.patch | 75 +++++++++++++++++++
>  package/botan/botan.mk                        |  5 +-
>  2 files changed, 76 insertions(+), 4 deletions(-)
>  create mode 100644 package/botan/0001-Add--extra-libs-option-and-group-l-flags-from-LDFLAGS-to-the-end.patch
> 
> diff --git a/package/botan/0001-Add--extra-libs-option-and-group-l-flags-from-LDFLAGS-to-the-end.patch b/package/botan/0001-Add--extra-libs-option-and-group-l-flags-from-LDFLAGS-to-the-end.patch
> new file mode 100644
> index 0000000000..8aa5c68652
> --- /dev/null
> +++ b/package/botan/0001-Add--extra-libs-option-and-group-l-flags-from-LDFLAGS-to-the-end.patch
> @@ -0,0 +1,75 @@
> +From af63fe89228172e5a395f7e6491fae3bfa9da4b1 Mon Sep 17 00:00:00 2001
> +From: Jack Lloyd <jack@randombit.net>
> +Date: Mon, 15 Feb 2021 15:01:38 -0500
> +Subject: [PATCH] Add --extra-libs option and group -l flags from LDFLAGS to
> + the end
> +
> +Ref #2622
> +
> +[Retrieved from:
> +https://github.com/randombit/botan/commit/af63fe89228172e5a395f7e6491fae3bfa9da4b1]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + configure.py               | 14 ++++++++++++++
> + src/build-data/makefile.in |  2 +-
> + 2 files changed, 15 insertions(+), 1 deletion(-)
> +
> +diff --git a/configure.py b/configure.py
> +index 73fc0271e9..865a6c8e62 100755
> +--- a/configure.py
> ++++ b/configure.py
> +@@ -333,6 +333,9 @@ def process_command_line(args): # pylint: disable=too-many-locals,too-many-state
> +     target_group.add_option('--ldflags', metavar='FLAGS',
> +                             help='set linker flags', default=None)
> + 
> ++    target_group.add_option('--extra-libs', metavar='LIBS',
> ++                            help='specify extra libraries to link against', default='')
> ++
> +     target_group.add_option('--ar-command', dest='ar_command', metavar='AR', default=None,
> +                             help='set path to static archive creator')
> + 
> +@@ -2020,6 +2023,12 @@ def choose_cxx_exe():
> +         else:
> +             return '%s %s' % (options.compiler_cache, cxx)
> + 
> ++    def extra_libs(libs, cc):
> ++        if libs is None:
> ++            return ''
> ++
> ++        return ' '.join([(cc.add_lib_option % lib) for lib in libs.split(',')])
> ++
> +     variables = {
> +         'version_major':  Version.major(),
> +         'version_minor':  Version.minor(),
> +@@ -2149,6 +2158,7 @@ def choose_cxx_exe():
> +         'cc_sysroot': sysroot_option(),
> +         'cc_compile_flags': options.cxxflags or cc.cc_compile_flags(options),
> +         'ldflags': options.ldflags or '',
> ++        'extra_libs': extra_libs(options.extra_libs, cc),
> +         'cc_warning_flags': cc.cc_warning_flags(options),
> +         'output_to_exe': cc.output_to_exe,
> +         'cc_macro': cc.macro_name,
> +@@ -3029,6 +3039,10 @@ def canonicalize_build_targets(options):
> +     if options.build_fuzzers == 'libfuzzer' and options.fuzzer_lib is None:
> +         options.fuzzer_lib = 'Fuzzer'
> + 
> ++    if options.ldflags is not None:
> ++        libs = [m.group(1) for m in re.finditer(r'-l([a-z0-9]+)', options.ldflags)]
> ++        options.extra_libs += ','.join(libs)
> ++
> + # Checks user options for consistency
> + # This method DOES NOT change options on behalf of the user but explains
> + # why the given configuration does not work.
> +diff --git a/src/build-data/makefile.in b/src/build-data/makefile.in
> +index 4692d00f71..82f6576650 100644
> +--- a/src/build-data/makefile.in
> ++++ b/src/build-data/makefile.in
> +@@ -20,7 +20,7 @@ LDFLAGS        = %{ldflags}
> + EXE_LINK_CMD   = %{exe_link_cmd}
> + 
> + LIB_LINKS_TO   = %{external_link_cmd} %{link_to}
> +-EXE_LINKS_TO   = %{link_to_botan} $(LIB_LINKS_TO)
> ++EXE_LINKS_TO   = %{link_to_botan} $(LIB_LINKS_TO) %{extra_libs}
> + 
> + BUILD_FLAGS    = $(ABI_FLAGS) $(LANG_FLAGS) $(CXXFLAGS) $(WARN_FLAGS)
> + 
> diff --git a/package/botan/botan.mk b/package/botan/botan.mk
> index f809aa2e0d..c3af4a45d8 100644
> --- a/package/botan/botan.mk
> +++ b/package/botan/botan.mk
> @@ -18,14 +18,11 @@ BOTAN_CONF_OPTS = \
>  	--os=linux \
>  	--cc=gcc \
>  	--cc-bin="$(TARGET_CXX)" \
> -	--ldflags="$(BOTAN_LDFLAGS)" \
>  	--prefix=/usr \
>  	--without-documentation
>  
> -BOTAN_LDFLAGS = $(TARGET_LDFLAGS)
> -
>  ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> -BOTAN_LDFLAGS += -latomic
> +BOTAN_CONF_OPTS += --extra-libs=atomic
>  endif
>  
>  ifeq ($(BR2_SHARED_LIBS),y)
> -- 
> 2.30.0
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
