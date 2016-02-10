From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 10 Feb 2016 01:28:27 +0100
Subject: [Buildroot] [PATCH v3] ShellInABox: new package
In-Reply-To: <1454771503-116304-1-git-send-email-lucas.zampar@gmail.com>
References: <1454771503-116304-1-git-send-email-lucas.zampar@gmail.com>
Message-ID: <56BA842B.1030901@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Lucas,

 Thank you for your patch. There are still some things missing, do you care to
fix that and repost?

 In the subject line, you should put shellinabox in lower case since that is the
(buildroot) name of the package.

On 06-02-16 16:11, Lucas Zampar Bernardi wrote:
> This patch add new package ShellInABox that is a program that implements
> an in-browser command line shell. It works on any JavaScript and CSS
> enabled web browser.
> 
> Installing it on your Linux board you can get the access to the command
> prompt directly from web without any needs to install terminal software
> on your PC.
> 
> Signed-off-by: Lucas Zampar Bernardi <lucas.zampar@gmail.com>
[snip]
> diff --git a/package/shellinabox/Config.in b/package/shellinabox/Config.in
> new file mode 100644
> index 0000000..1b9525c
> --- /dev/null
> +++ b/package/shellinabox/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_SHELLINABOX
> +       bool "shellinabox"

 Indentation should be with a tab.

> +       select BR2_PACKAGE_ZLIB
> +       help
> +       Shell in a box - implements a web server that can

 And here a tab + two spaces.

> +       export arbitrary command line tools to a web based terminal emulator.
> +       This emulator is accessible to any JavaScript and CSS
> +       enabled web browser and does not require any additional browser plugins.

 Please re-wrap the paragraph at 72 columns, where the tab counts for 8 (so that
means 62 characters in the text itself).

> +
> +         http://shellinabox.googlecode.com

 Since google code is shutting down, this is not the best imaginable URL. And
since we anyway use the github fork, better point to that.

> diff --git a/package/shellinabox/S51shellinabox b/package/shellinabox/S51shellinabox
> new file mode 100644
> index 0000000..b16f03d
> --- /dev/null
> +++ b/package/shellinabox/S51shellinabox

 There is also a start script in the debian directory. It has many things that I
think would be useful for buildroot as well, like setting a non-privileged user.
If you use that, don't forget to install the defaults file as well, and to
create the user and group with SHELLINABOX_USERS.

 That said, this version is acceptable as well.

> @@ -0,0 +1,33 @@
> +#! /bin/sh
> +
> +NAME=shellinaboxd
> +DAEMON=/usr/bin/$NAME
> +ARGS="-s/:LOGIN -t --no-beep -b" # start without SSL support
> +
> +# Gracefully exit if the package has been removed.
> +test -x $DAEMON || exit 0

 It's better not to do that. If the program isn't there, it means something has
gone wrong. Better not be silent about it.

> +
> +case "$1" in
> +  start)
> +    printf "Starting $NAME: "
> +    start-stop-daemon -S -q -x $DAEMON -- $ARGS
> +    [ $? = 0 ] && echo "OK" || echo "FAIL"
> +    ;;
> +  stop)
> +    printf "Stopping $NAME: "
> +    start-stop-daemon -K -q -n $NAME
> +    [ $? = 0 ] && echo "OK" || echo "FAIL"
> +    ;;
> +  restart|reload)
> +    echo "Restarting $NAME: "
> +    $0 stop
> +    sleep 1
> +    $0 start
> +    ;;
> +  *)
> +    echo "Usage: $0 {start|stop|restart|reload}" >&2
> +    exit 1
> +    ;;
> +esac
> +
> +exit 0
> diff --git a/package/shellinabox/shellinabox-2.19-remove-static-library.patch b/package/shellinabox/shellinabox-2.19-remove-static-library.patch

 Patches should be named <number>-<description>.patch, so in this case
0001-remove-static-library.patch.

> new file mode 100644
> index 0000000..66b46b7
> --- /dev/null
> +++ b/package/shellinabox/shellinabox-2.19-remove-static-library.patch

 Patches need to have a description as if they are a full commit. In particular,
explain why this is needed. They also need a Signed-off-by line, to indicate
that you agree with submitting it under the upstream license.

 Also, please send your patch upstream as well. Since upstream is on github,
that probably means you'll end up creating a git-formatted patch, which we
anyway prefer.

> @@ -0,0 +1,12 @@
> +diff -rup shellinabox-2.19_original/Makefile.am shellinabox-2.19/Makefile.am
> +--- shellinabox-2.19_original/Makefile.am      2016-02-03 14:17:44.699913649 -0200
> ++++ shellinabox-2.19/Makefile.am       2016-02-03 14:08:59.795376662 -0200
> +@@ -126,7 +126,7 @@ BUILT_SOURCES        = shellinabox/beep.
> +
> + shellinaboxd_LDADD   = liblogging.la                                          \
> +                        libhttp.la
> +-shellinaboxd_LDFLAGS = -static
> ++#shellinaboxd_LDFLAGS = -static
> + ## Added this for compatibility with older versions of autoconf/automake
> + docdir               = ${datadir}/doc/${PACKAGE}
> +
> diff --git a/package/shellinabox/shellinabox.mk b/package/shellinabox/shellinabox.mk
> new file mode 100644
> index 0000000..6f84765
> --- /dev/null
> +++ b/package/shellinabox/shellinabox.mk
> @@ -0,0 +1,25 @@
> +################################################################################
> +#
> +# shellinabox
> +#
> +################################################################################
> +
> +SHELLINABOX_VERSION = 2.19
> +SHELLINABOX_SOURCE = v$(SHELLINABOX_VERSION).tar.gz
> +SHELLINABOX_SITE = https://github.com/shellinabox/shellinabox/archive

 This doesn't look like a uploaded file, so you should use the github helper
instead.

> +SHELLINABOX_AUTORECONF = YES

 Add a comment above why autoreconf is needed, e.g.:
# source from git without configure, and 0001-remove-static-library.patch
# touches Makefile.am


> +SHELLINABOX_DEPENDENCIES = zlib
> +
> +ifeq ($(BR2_PACKAGE_OPENSSL),y)
> +SHELLINABOX_DEPENDENCIES += openssl

 You should also pass --enable-ssl and --disable-ssl explicitly, as appropriate.
> +endif

 It looks like there is also an optional dependency on linux-pam, with
--enable/disable-pam. Can you check? Alternatively, pass --disable-pam
unconditionally.

> +
> +SHELLINABOX_LICENSE = GPLv2

 Add "with OpenSSL exception"

 Also add
SHELLINABOX_LICENSE_FILES = COPYING GPL-2

> +
> +
> +define SHELLINABOX_INSTALL_INIT_SYSV
> +       $(INSTALL) -D -m 755 package/shellinabox/S51shellinabox $(TARGET_DIR)/etc/init.d/S51shellinabox
> +endef
> +
> +
> +$(eval $(autotools-package))
> 

 There should also be a shellinabox.hash file containing the locally calculated
sha256 of the tarball.


 There are also a few toolchain issues you need to consider:

- I'm pretty sure it will not work with musl. Can you test? Don't forget to add
the appropriate comment.

- It is using dlopen, but I think that can be avoided with
--disable-runtime-loading. But possibly it will do that automatically. Can you
test with static-library-only?

- It's using fork() pretty drastically, so it will have to depend on BR2_USE_MMU.


 So, quite some work still :-)


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
