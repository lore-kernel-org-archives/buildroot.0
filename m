From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 03 Jun 2015 00:11:00 +0200
Subject: [Buildroot] [PATCH 1/1] Package Additions: tpm-tools and
	TrouSers
In-Reply-To: <DB5PR03MB119252B7F9517E39F5DD8548CEB50@DB5PR03MB1192.eurprd03.prod.outlook.com>
References: <DB5PR03MB119252B7F9517E39F5DD8548CEB50@DB5PR03MB1192.eurprd03.prod.outlook.com>
Message-ID: <556E29F4.7050500@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/02/15 11:15, Al West wrote:
> Hello All,
> 
> I submit two new packages for using the TPM on x86 platform. Please go easy on me this is my first submission. 

 Hi Al,

 Thanks for you contribution!

 Please create a separate patch for each package (first trousers, then
tpm-tools). Each patch should have a subject line like:

tpm-tools: new package


> 
> Kind regards,
> Al
> 
> Signed-off-by: Al West <al.west@v-nova.com>
> ---
>  package/Config.in                             |   2 +
>  package/tpm-tools/Config.in                   |   8 ++
>  package/tpm-tools/tpm-tools.hash              |   2 +
>  package/tpm-tools/tpm-tools.mk                |  16 ++++
>  package/trousers/0001-no-TSS-user-group.patch | 103 ++++++++++++++++++++++++++
>  package/trousers/Config.in                    |   7 ++
>  package/trousers/trousers.hash                |   3 +
>  package/trousers/trousers.mk                  |  16 ++++
>  8 files changed, 157 insertions(+)
>  create mode 100644 package/tpm-tools/Config.in
>  create mode 100644 package/tpm-tools/tpm-tools.hash
>  create mode 100644 package/tpm-tools/tpm-tools.mk
>  create mode 100644 package/trousers/0001-no-TSS-user-group.patch
>  create mode 100644 package/trousers/Config.in
>  create mode 100644 package/trousers/trousers.hash
>  create mode 100644 package/trousers/trousers.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index e0c2e2a..c902ae5 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -727,6 +727,8 @@ menu "Crypto"
>  	source "package/nettle/Config.in"
>  	source "package/openssl/Config.in"
>  	source "package/polarssl/Config.in"
> +        source "package/tpm-tools/Config.in"
> +        source "package/trousers/Config.in"

 These should be indented with a single tab.

>  endmenu
>  
>  menu "Database"
> diff --git a/package/tpm-tools/Config.in b/package/tpm-tools/Config.in
> new file mode 100644
> index 0000000..df704cd
> --- /dev/null
> +++ b/package/tpm-tools/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_TPM_TOOLS
> + bool "tpm-tools"
> + select BR2_PACKAGE_TROUSERS
> + depends on BR2_PACKAGE_OPENSSL
> + help

 Again, indentation with a single tab.

> +   Manpages for the tpm-tools package of TrouSerS.

 Tab + 2 spaces here. But I don't think this is a correct description of the
package - at least I hope it contains more than just the man pages...

> +
> +   http://trousers.sourceforge.net/
> diff --git a/package/tpm-tools/tpm-tools.hash b/package/tpm-tools/tpm-tools.hash
> new file mode 100644
> index 0000000..bdd66da
> --- /dev/null
> +++ b/package/tpm-tools/tpm-tools.hash
> @@ -0,0 +1,2 @@
> +# http://sourceforge.net/projects/trousers/files/tpm-tools/

 You should only mention a link here if it has the hash. In this case, just say

# Locally calculated

> +sha256	66eb4ff095542403db6b4bd4b574e8a5c08084fe4e9e5aa9a829ee84e20bea83  tpm-tools-1.3.8.tar.gz
> diff --git a/package/tpm-tools/tpm-tools.mk b/package/tpm-tools/tpm-tools.mk
> new file mode 100644
> index 0000000..93c8395
> --- /dev/null
> +++ b/package/tpm-tools/tpm-tools.mk
> @@ -0,0 +1,16 @@
> +#############################################################
> +#
> +## tpm-tools
> +#
> +##############################################################
> +TPM_TOOLS_VERSION = 1.3.8
> +TPM_TOOLS_SOURCE = tpm-tools-$(TPM_TOOLS_VERSION).tar.gz

 This line is not needed, .tar.gz is the default.

> +TPM_TOOLS_SITE = http://nchc.dl.sourceforge.net/project/trousers/tpm-tools/$(TPM_TOOLS_VERSION)

 Sourceforge URLs should be http://downloads.sourceforge.net/project/...
so don't refer to a specific mirror.

> +TPM_TOOLS_SUBDIR = tpm-tools-$(TPM_TOOLS_VERSION)
> +TPM_TOOLS_AUTORECONF = NO

 Default, not needed.

> +TPM_TOOLS_INSTALL_STAGING = YES

 This package installs a shared library but no include files. So is it really
meant to be linked with some other program?

> +TPM_TOOLS_INSTALL_TARGET = YES

 Default, not needed.

> +TPM_TOOLS_DEPENDENCIES = trousers
> +
> +$(eval $(autotools-package))
> +

 Redundant empty line.

> diff --git a/package/trousers/0001-no-TSS-user-group.patch b/package/trousers/0001-no-TSS-user-group.patch
> new file mode 100644
> index 0000000..d602371
> --- /dev/null
> +++ b/package/trousers/0001-no-TSS-user-group.patch
> @@ -0,0 +1,103 @@

 Patches should have a description and a Signed-off-by line. Preferably they
should also be sent upstream.

 But in fact I doubt if we really need this patch?

> + configure.in         |    7 +++++++
> + dist/Makefile.am     |   13 ++++++++++---

 You're patching configure.in and Makefile.am, but not running AUTORECONF, so
this patch has no effect...

> + src/tcsd/svrside.c   |    2 ++
> + src/tcsd/tcsd_conf.c |    2 ++
> + 4 files changed, 21 insertions(+), 3 deletions(-)
> +
> +diff --git a/configure.in b/configure.in
> +index c37177f..8dda289 100644
> +--- a/configure.in
> ++++ b/configure.in
> + <at>  <at>  -86,6 +86,13  <at>  <at>  AC_ARG_ENABLE(strict-spec-compliance,

 Something weird happened to the @ here. Because of this, the patch applies
silently but doesn't actually make any changes (it's not recognized as the start
of a hunk).

> + 		 SPEC_COMP=1
> + 		 AC_MSG_RESULT([*** Enabling spec compliance at user request ***])],)
> +
> ++# user+group checking
> ++AC_ARG_ENABLE(usercheck,
> ++		[AC_HELP_STRING([--disable-usercheck], [build TrouSerS without checking and setting of
> +user/group tss [default=on] (Caution: This is intended for development purposes only.)])],

 The patch got line-wrapped here.

 But actually, this already seems to be present in the 0.3.13 source, so this
patch is completely redundant...

> ++		[AS_IF([test "x$enableval" = "xno"], [CFLAGS="$CFLAGS -DNOUSERCHECK"
> ++		AC_MSG_RESULT([*** Disabling user checking at user request ***])])],)
> ++AM_CONDITIONAL(NOUSERCHECK, [test "x$enable_usercheck" = "xno"])
> ++
> + # daa math lib: gmp or openssl (default openssl)
> + MATH_DEFINE=BI_OPENSSL
> + AC_ARG_WITH([gmp],
> +diff --git a/dist/Makefile.am b/dist/Makefile.am
> +index 09448fd..372736a 100644
> +--- a/dist/Makefile.am
> ++++ b/dist/Makefile.am
> + <at>  <at>  -1,19 +1,26  <at>  <at> 
> + EXTRA_DIST = system.data.auth system.data.noauth \
> +        fedora/fedora.initrd.tcsd
> ++
> + install: install-exec-hook
> + 	if test ! -e ${DESTDIR}/ <at> sysconfdir <at> /tcsd.conf; then mkdir -p ${DESTDIR}/ <at> sysconfdir <at>  && cp
> +tcsd.conf ${DESTDIR}/ <at> sysconfdir <at> ; fi
> ++if !NOUSERCHECK
> + 	/bin/chown tss:tss ${DESTDIR}/ <at> sysconfdir <at> /tcsd.conf || true

 Because there's a || true at the end, this chown doesn't actually break the build.


> + 	/bin/chmod 0600 ${DESTDIR}/ <at> sysconfdir <at> /tcsd.conf
> ++endif
> +
> + install-exec-hook:
> ++	/bin/sh -c 'if [ ! -e ${DESTDIR}/ <at> localstatedir <at> /lib/tpm ];then mkdir -p
> +${DESTDIR}/ <at> localstatedir <at> /lib/tpm; fi'
> ++if !NOUSERCHECK
> + 	/usr/sbin/groupadd tss || true
> + 	/usr/sbin/useradd -r tss -g tss || true

 Perhaps this package needs a _USERS and _PERMISSIONS definition, to actually
create a user tss and make these files owned by that user?

> +-	/bin/sh -c 'if [ ! -e ${DESTDIR}/ <at> localstatedir <at> /lib/tpm ];then mkdir -p
> +${DESTDIR}/ <at> localstatedir <at> /lib/tpm; fi'
> + 	/bin/chown tss:tss ${DESTDIR}/ <at> localstatedir <at> /lib/tpm || true
> + 	/bin/chmod 0700 ${DESTDIR}/ <at> localstatedir <at> /lib/tpm
> ++endif
> +
> + uninstall-hook:
> +-	/usr/sbin/userdel tss || true
> +-	/usr/sbin/groupdel tss || true
> + 	rm ${DESTDIR}/ <at> sysconfdir <at> /tcsd.conf
> + 	rmdir ${DESTDIR}/ <at> localstatedir <at> /lib/tpm
> ++if !NOUSERCHECK
> ++	/usr/sbin/userdel tss || true
> ++	/usr/sbin/groupdel tss || true
> ++endif
> +diff --git a/src/tcsd/svrside.c b/src/tcsd/svrside.c
> +index fca9d18..a29704f 100644
> +--- a/src/tcsd/svrside.c
> ++++ b/src/tcsd/svrside.c
> + <at>  <at>  -441,6 +441,7  <at>  <at>  main(int argc, char **argv)
> + 	if ((result = tcsd_startup()))
> + 		return (int)result;
> +
> ++#ifndef NOUSERCHECK
> + #ifndef SOLARIS
> + 	pwd = getpwnam(TSS_USER_NAME);
> + 	if (pwd == NULL) {
> + <at>  <at>  -454,6 +455,7  <at>  <at>  main(int argc, char **argv)
> + 	}
> + 	setuid(pwd->pw_uid);
> + #endif
> ++#endif
> +
> + 	if (setup_server_sockets(socks_info) == -1) {
> + 		LogError("Could not create sockets to listen to connections. Aborting...");
> +diff --git a/src/tcsd/tcsd_conf.c b/src/tcsd/tcsd_conf.c
> +index 587f933..a31503d 100644
> +--- a/src/tcsd/tcsd_conf.c
> ++++ b/src/tcsd/tcsd_conf.c
> + <at>  <at>  -770,6 +770,7  <at>  <at>  conf_file_init(struct tcsd_config *conf)
> + 		}
> + 	}
> +
> ++#ifndef NOUSERCHECK
> + #ifndef SOLARIS
> + 	/* find the gid that owns the conf file */
> + 	errno = 0;
> + <at>  <at>  -809,6 +810,7  <at>  <at>  conf_file_init(struct tcsd_config *conf)
> + 		return TCSERR(TSS_E_INTERNAL_ERROR);
> + 	}
> + #endif /* SOLARIS */
> ++#endif /* NOUSERCHECK */
> +
> + 	if ((f = fopen(tcsd_config_file, "r")) == NULL) {
> + 		LogError("fopen(%s): %s", tcsd_config_file, strerror(errno));
> +
> diff --git a/package/trousers/Config.in b/package/trousers/Config.in
> new file mode 100644
> index 0000000..f9cf58f
> --- /dev/null
> +++ b/package/trousers/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_TROUSERS
> + bool "trousers"
> + depends on BR2_PACKAGE_OPENSSL
> + help
> +   The open-source TCG Software Stack.

 A bit more explanation of what this package does would be good.

> +
> +   http://trousers.sourceforge.net/
> diff --git a/package/trousers/trousers.hash b/package/trousers/trousers.hash
> new file mode 100644
> index 0000000..86d08a7
> --- /dev/null
> +++ b/package/trousers/trousers.hash
> @@ -0,0 +1,3 @@
> +# http://sourceforge.net/projects/trousers/files/trousers/

 # Locally calculated

> +sha256	bb908e4a3c88a17b247a4fc8e0fff3419d8a13170fe7bdfbe0e2c5c082a276d3  trousers-0.3.13.tar.gz
> +
> diff --git a/package/trousers/trousers.mk b/package/trousers/trousers.mk
> new file mode 100644
> index 0000000..52ade3c
> --- /dev/null
> +++ b/package/trousers/trousers.mk
> @@ -0,0 +1,16 @@
> +#############################################################
> +#
> +## trousers
> +#
> +##############################################################
> +TROUSERS_VERSION = 0.3.13
> +TROUSERS_SOURCE = trousers-$(TROUSERS_VERSION).tar.gz

 Not needed.

> +TROUSERS_SITE = http://nchc.dl.sourceforge.net/project/trousers/trousers/$(TROUSERS_VERSION)

 download.sourceforge.net

> +TROUSERS_AUTORECONF = NO

 Not needed.

> +TROUSERS_INSTALL_STAGING = YES
> +TROUSERS_INSTALL_TARGET = YES

 Not needed.

> +TROUSERS_DEPENDENCIES = openssl
> +
> +TROUSERS_CONF_OPTS += --disable-usercheck

 I don't think this is needed (cfr. above).


 Care to fix all this and repost?

 Thanks!

 Regards,
 Arnout

> +
> +$(eval $(autotools-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
