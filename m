From: =?UTF-8?B?SsOpcsOpbXkgUm9zZW4=?= <jeremy.rosen@smile.fr>
Date: Sun, 23 Dec 2018 23:19:50 +0100
Subject: [Buildroot] [PATCH 1/1] systemd: bump to v240
In-Reply-To: <20181223011208.43478-1-aduskett@gmail.com>
References: <20181223011208.43478-1-aduskett@gmail.com>
Message-ID: <e371e75c-e3f3-b946-b033-2664ab94de26@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tested-by: J?r?my Rosen <jeremy.rosen@smile.fr>

On 23/12/2018 02:12, aduskett at gmail.com wrote:
> From: Adam Duskett <Aduskett@gmail.com>
>
> In addition:
>    - Remove unused option -Dkill-path.
>     (See commit 9a85778412fa3e3f8d4561064131ba69f3259b28)
>
>    - Change option -Dmyhostname to -Dnss-myhostname.
>
>    - Remove patches from upstream.
>
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>   .../0002-install-don-t-use-ln-relative.patch  |   2 +-
>   ...-whether-struct-statx-is-defined-in-.patch | 111 ------------------
>   ...x-stat.h-check-with-other-checks-and.patch |  77 ------------
>   ...we-have-enough-space-for-the-DHCP6-o.patch |  30 -----
>   ...build-fix-detection-of-Werror-shadow.patch |  34 ------
>   package/systemd/systemd.hash                  |   2 +-
>   package/systemd/systemd.mk                    |   7 +-
>   7 files changed, 5 insertions(+), 258 deletions(-)
>   delete mode 100644 package/systemd/0003-build-sys-Detect-whether-struct-statx-is-defined-in-.patch
>   delete mode 100644 package/systemd/0004-meson-unify-linux-stat.h-check-with-other-checks-and.patch
>   delete mode 100644 package/systemd/0005-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch
>   delete mode 100644 package/systemd/0006-meson.build-fix-detection-of-Werror-shadow.patch
>
> diff --git a/package/systemd/0002-install-don-t-use-ln-relative.patch b/package/systemd/0002-install-don-t-use-ln-relative.patch
> index a024ac4a23..7933207780 100644
> --- a/package/systemd/0002-install-don-t-use-ln-relative.patch
> +++ b/package/systemd/0002-install-don-t-use-ln-relative.patch
> @@ -33,7 +33,7 @@ diff --git a/meson.build b/meson.build
>   index 04331dd41..359042c04 100644
>   --- a/meson.build
>   +++ b/meson.build
> -@@ -559,7 +559,7 @@ endforeach
> +@@ -628,7 +628,7 @@ endforeach
>    conf.set_quoted('TELINIT', get_option('telinit-path'))
>    
>    if run_command('ln', '--relative', '--help').returncode() != 0
> diff --git a/package/systemd/0003-build-sys-Detect-whether-struct-statx-is-defined-in-.patch b/package/systemd/0003-build-sys-Detect-whether-struct-statx-is-defined-in-.patch
> deleted file mode 100644
> index d849659c77..0000000000
> --- a/package/systemd/0003-build-sys-Detect-whether-struct-statx-is-defined-in-.patch
> +++ /dev/null
> @@ -1,111 +0,0 @@
> -From ebe5606eadb1241796ba9747d8e357bd6b3e912e Mon Sep 17 00:00:00 2001
> -From: Filipe Brandenburger <filbranden@google.com>
> -Date: Sun, 15 Jul 2018 22:43:35 -0700
> -Subject: [PATCH] build-sys: Detect whether struct statx is defined in
> - sys/stat.h
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=UTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -Starting with glibc 2.27.9000-36.fc29, include file sys/stat.h will have a
> -definition for struct statx, in which case include file linux/stat.h should be
> -avoided, in order to prevent a duplicate definition.
> -
> -    In file included from ../src/basic/missing.h:18,
> -		     from ../src/basic/util.h:28,
> -		     from ../src/basic/hashmap.h:10,
> -		     from ../src/shared/bus-util.h:12,
> -		     from ../src/libsystemd/sd-bus/bus-creds.c:11:
> -    /usr/include/linux/stat.h:99:8: error: redefinition of ?struct statx?
> -     struct statx {
> -	    ^~~~~
> -    In file included from /usr/include/sys/stat.h:446,
> -		     from ../src/basic/util.h:19,
> -		     from ../src/basic/hashmap.h:10,
> -		     from ../src/shared/bus-util.h:12,
> -		     from ../src/libsystemd/sd-bus/bus-creds.c:11:
> -    /usr/include/bits/statx.h:36:8: note: originally defined here
> -     struct statx
> -	    ^~~~~
> -
> -Extend our meson.build to look for struct statx when only sys/stat.h is
> -included and, in that case, do not include linux/stat.h anymore.
> -
> -Tested that systemd builds correctly when using a glibc version that includes a
> -definition for struct statx.
> -
> -glibc Fedora RPM update:
> -https://src.fedoraproject.org/rpms/glibc/c/28cb5d31fc1e5887912283c889689c47076278ae
> -
> -glibc upstream commit:
> -https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=fd70af45528d59a00eb3190ef6706cb299488fcd
> -
> -(cherry picked from commit 75720bff62a84896e9a0654afc7cf9408cf89a38)
> -Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ----
> - meson.build            | 5 +++++
> - src/basic/missing.h    | 5 ++++-
> - src/basic/xattr-util.c | 1 -
> - 3 files changed, 9 insertions(+), 2 deletions(-)
> -
> -diff --git a/meson.build b/meson.build
> -index 04331dd41..a0e724070 100644
> ---- a/meson.build
> -+++ b/meson.build
> -@@ -425,6 +425,7 @@ decl_headers = '''
> - #include <sys/stat.h>
> - '''
> - # FIXME: key_serial_t is only defined in keyutils.h, this is bound to fail
> -+# FIXME: these should use -D_GNU_SOURCE, since that is defined at build time
> -
> - foreach decl : ['char16_t',
> -                 'char32_t',
> -@@ -439,6 +440,10 @@ foreach decl : ['char16_t',
> -         conf.set10('HAVE_' + decl.underscorify().to_upper(), have)
> - endforeach
> -
> -+conf.set10('HAVE_STRUCT_STATX_IN_SYS_STAT_H', cc.sizeof('struct statx', prefix : '''
> -+#include <sys/stat.h>
> -+''', args : '-D_GNU_SOURCE') > 0)
> -+
> - foreach decl : [['IFLA_INET6_ADDR_GEN_MODE',         'linux/if_link.h'],
> -                 ['IN6_ADDR_GEN_MODE_STABLE_PRIVACY', 'linux/if_link.h'],
> -                 ['IFLA_VRF_TABLE',                   'linux/if_link.h'],
> -diff --git a/src/basic/missing.h b/src/basic/missing.h
> -index 71a07d057..14ad3d491 100644
> ---- a/src/basic/missing.h
> -+++ b/src/basic/missing.h
> -@@ -15,7 +15,6 @@
> - #include <linux/neighbour.h>
> - #include <linux/oom.h>
> - #include <linux/rtnetlink.h>
> --#include <linux/stat.h>
> - #include <net/ethernet.h>
> - #include <stdlib.h>
> - #include <sys/resource.h>
> -@@ -25,6 +24,10 @@
> - #include <uchar.h>
> - #include <unistd.h>
> -
> -+#if !HAVE_STRUCT_STATX_IN_SYS_STAT_H
> -+#include <linux/stat.h>
> -+#endif
> -+
> - #if HAVE_AUDIT
> - #include <libaudit.h>
> - #endif
> -diff --git a/src/basic/xattr-util.c b/src/basic/xattr-util.c
> -index c5c55ea84..0ee097983 100644
> ---- a/src/basic/xattr-util.c
> -+++ b/src/basic/xattr-util.c
> -@@ -2,7 +2,6 @@
> -
> - #include <errno.h>
> - #include <fcntl.h>
> --#include <linux/stat.h>
> - #include <stdint.h>
> - #include <stdlib.h>
> - #include <string.h>
> ---
> -2.14.4
> -
> diff --git a/package/systemd/0004-meson-unify-linux-stat.h-check-with-other-checks-and.patch b/package/systemd/0004-meson-unify-linux-stat.h-check-with-other-checks-and.patch
> deleted file mode 100644
> index 70c35c66e2..0000000000
> --- a/package/systemd/0004-meson-unify-linux-stat.h-check-with-other-checks-and.patch
> +++ /dev/null
> @@ -1,77 +0,0 @@
> -From 17bd864a04a0583cfb343c5621b591bdd76d79ad Mon Sep 17 00:00:00 2001
> -From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
> -Date: Wed, 18 Jul 2018 17:26:17 +0200
> -Subject: [PATCH] meson: unify linux/stat.h check with other checks and use
> - _GNU_SOURCE
> -
> -Using _GNU_SOURCE is better because that's how we include the headers in the
> -actual build, and some headers define different stuff when it is defined.
> -sys/stat.h for example defines 'struct statx' conditionally.
> -
> -(cherry picked from commit 9c869d08d82c73f62ab3527567858ce4b0cf1257)
> -Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ----
> - meson.build         | 20 ++++++++++++++------
> - src/basic/missing.h |  2 +-
> - 2 files changed, 15 insertions(+), 7 deletions(-)
> -
> -diff --git a/meson.build b/meson.build
> -index a0e724070..5dcabdc6c 100644
> ---- a/meson.build
> -+++ b/meson.build
> -@@ -421,11 +421,9 @@ decl_headers = '''
> - #include <uchar.h>
> - #include <linux/ethtool.h>
> - #include <linux/fib_rules.h>
> --#include <linux/stat.h>
> - #include <sys/stat.h>
> - '''
> - # FIXME: key_serial_t is only defined in keyutils.h, this is bound to fail
> --# FIXME: these should use -D_GNU_SOURCE, since that is defined at build time
> -
> - foreach decl : ['char16_t',
> -                 'char32_t',
> -@@ -436,13 +434,23 @@ foreach decl : ['char16_t',
> -                ]
> -
> -         # We get -1 if the size cannot be determined
> --        have = cc.sizeof(decl, prefix : decl_headers) > 0
> -+        have = cc.sizeof(decl, prefix : decl_headers, args : '-D_GNU_SOURCE') > 0
> -+
> -+        if decl == 'struct statx'
> -+                if have
> -+                        want_linux_stat_h = false
> -+                else
> -+                        have = cc.sizeof(decl,
> -+                                         prefix : decl_headers + '#include <linux/stat.h>',
> -+                                         args : '-D_GNU_SOURCE') > 0
> -+                        want_linux_stat_h = have
> -+                endif
> -+        endif
> -+
> -         conf.set10('HAVE_' + decl.underscorify().to_upper(), have)
> - endforeach
> -
> --conf.set10('HAVE_STRUCT_STATX_IN_SYS_STAT_H', cc.sizeof('struct statx', prefix : '''
> --#include <sys/stat.h>
> --''', args : '-D_GNU_SOURCE') > 0)
> -+conf.set10('WANT_LINUX_STAT_H', want_linux_stat_h)
> -
> - foreach decl : [['IFLA_INET6_ADDR_GEN_MODE',         'linux/if_link.h'],
> -                 ['IN6_ADDR_GEN_MODE_STABLE_PRIVACY', 'linux/if_link.h'],
> -diff --git a/src/basic/missing.h b/src/basic/missing.h
> -index 14ad3d491..9044683b1 100644
> ---- a/src/basic/missing.h
> -+++ b/src/basic/missing.h
> -@@ -24,7 +24,7 @@
> - #include <uchar.h>
> - #include <unistd.h>
> -
> --#if !HAVE_STRUCT_STATX_IN_SYS_STAT_H
> -+#if WANT_LINUX_STAT_H
> - #include <linux/stat.h>
> - #endif
> -
> ---
> -2.14.4
> -
> diff --git a/package/systemd/0005-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch b/package/systemd/0005-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch
> deleted file mode 100644
> index 6a72a38988..0000000000
> --- a/package/systemd/0005-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From 49653743f69658aeeebdb14faf1ab158f1f2cb20 Mon Sep 17 00:00:00 2001
> -From: Lennart Poettering <lennart@poettering.net>
> -Date: Fri, 19 Oct 2018 12:12:33 +0200
> -Subject: [PATCH] dhcp6: make sure we have enough space for the DHCP6 option
> - header
> -
> -Fixes CVE-2018-15688:
> -https://security-tracker.debian.org/tracker/CVE-2018-15688
> -
> -Patch downloaded from upstream commit:
> -https://github.com/systemd/systemd/commit/49653743f69658aeeebdb14faf1ab158f1f2cb20
> -
> -Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ----
> - src/libsystemd-network/dhcp6-option.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/src/libsystemd-network/dhcp6-option.c b/src/libsystemd-network/dhcp6-option.c
> -index cbd4bc7a2a3..2806415100c 100644
> ---- a/src/libsystemd-network/dhcp6-option.c
> -+++ b/src/libsystemd-network/dhcp6-option.c
> -@@ -106,7 +106,7 @@ int dhcp6_option_append_ia(uint8_t **buf, size_t *buflen, const DHCP6IA *ia) {
> -                 return -EINVAL;
> -         }
> -
> --        if (*buflen < len)
> -+        if (*buflen < offsetof(DHCP6Option, data) + len)
> -                 return -ENOBUFS;
> -
> -         ia_hdr = *buf;
> diff --git a/package/systemd/0006-meson.build-fix-detection-of-Werror-shadow.patch b/package/systemd/0006-meson.build-fix-detection-of-Werror-shadow.patch
> deleted file mode 100644
> index 0aa3189206..0000000000
> --- a/package/systemd/0006-meson.build-fix-detection-of-Werror-shadow.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From 7bd6e6db3dbb980c099b444c61d9aff7fcc636cf Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Thu, 29 Nov 2018 13:22:08 +0100
> -Subject: [PATCH] meson.build: fix detection of -Werror=shadow
> -
> -Pass -Werror=shadow in args of cc.compiles otherwise test will always
> -succeed
> -This fix a build failure with gcc 4.7.3
> -
> -Fixes:
> - - http://autobuild.buildroot.org/results/ffd71c473d3b29618c18cd2e04705370266696f2
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Upstream status: https://github.com/systemd/systemd/pull/10993]
> ----
> - meson.build | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/meson.build b/meson.build
> -index 37ae27b4a..980150ac8 100644
> ---- a/meson.build
> -+++ b/meson.build
> -@@ -396,7 +396,7 @@ if cc.compiles('''
> -            struct timespec now;
> -            return 0;
> -    }
> --''', name : '-Werror=shadow with local shadowing')
> -+''', args: '-Werror=shadow', name : '-Werror=shadow with local shadowing')
> -         add_project_arguments('-Werror=shadow', language : 'c')
> - endif
> -
> ---
> -2.14.1
> -
> diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
> index 012f1e595e..3e041bd0cc 100644
> --- a/package/systemd/systemd.hash
> +++ b/package/systemd/systemd.hash
> @@ -1,5 +1,5 @@
>   # sha256 locally computed
> -sha256	8a11b1b07d620f4c06a16e95bba4dd2a97e90efdf2a5ba47ed0a935085787a14  	systemd-239.tar.gz
> +sha256	8f15aec1ac926e13a21a04d0ca3fe371f7004951448142a6f8952075c5b5f0b5  	systemd-240.tar.gz
>   sha256	ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6	LICENSE.GPL2
>   sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	LICENSE.LGPL2.1
>   sha256	37ab495827a3cdbbc35ceaba3066764d69b6490e514e0c8a1acdb3c2fdb9e921	README
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index e53f0b699a..15db1969e5 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -SYSTEMD_VERSION = 239
> +SYSTEMD_VERSION = 240
>   SYSTEMD_SITE = $(call github,systemd,systemd,v$(SYSTEMD_VERSION))
>   SYSTEMD_LICENSE = LGPL-2.1+, GPL-2.0+ (udev), Public Domain (few source files, see README)
>   SYSTEMD_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1 README
> @@ -34,7 +34,6 @@ SYSTEMD_CONF_OPTS += \
>   	-Dsystem-uid-max=999 \
>   	-Dsystem-gid-max=999 \
>   	-Dtelinit-path=$(TARGET_DIR)/sbin/telinit \
> -	-Dkill-path=/usr/bin/kill \
>   	-Dkmod-path=/usr/bin/kmod \
>   	-Dkexec-path=/usr/sbin/kexec \
>   	-Dsulogin-path=/usr/sbin/sulogin \
> @@ -251,9 +250,9 @@ SYSTEMD_CONF_OPTS += -Dhostnamed=false
>   endif
>   
>   ifeq ($(BR2_PACKAGE_SYSTEMD_MYHOSTNAME),y)
> -SYSTEMD_CONF_OPTS += -Dmyhostname=true
> +SYSTEMD_CONF_OPTS += -Dnss-myhostname=true
>   else
> -SYSTEMD_CONF_OPTS += -Dmyhostname=false
> +SYSTEMD_CONF_OPTS += -Dnss-myhostname=false
>   endif
>   
>   ifeq ($(BR2_PACKAGE_SYSTEMD_TIMEDATED),y)

-- 
SMILE <http://www.smile.eu/>

20 rue des Jardins
92600 Asni?res-sur-Seine

	
*J?r?my ROSEN*
Architecte technique
Responsable de l'expertise Smile-ECS

email jeremy.rosen at smile.fr <mailto:jeremy.rosen@smile.fr>
phone +33141402967
url http://www.smile.eu

Twitter <https://twitter.com/GroupeSmile> Facebook 
<https://www.facebook.com/smileopensource> LinkedIn 
<https://www.linkedin.com/company/smile> Github 
<https://github.com/Smile-SA>


D?couvrez l?univers Smile, rendez-vous sur smile.eu 
<http://smile.eu/?utm_source=signature&utm_medium=email&utm_campaign=signature>

eco Pour la plan?te, n'imprimez ce mail que si c'est n?cessaire
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181223/e6d1a830/attachment.html>
