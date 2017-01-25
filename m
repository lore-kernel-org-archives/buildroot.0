From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Jan 2017 23:35:34 +1300
Subject: [Buildroot] [PATCH v2] sslh: new package
In-Reply-To: <1483371929-13907-6-git-send-email-david.bachelart@bbright.com>
References: <1483371929-13907-1-git-send-email-david.bachelart@bbright.com>
 <1483371929-13907-6-git-send-email-david.bachelart@bbright.com>
Message-ID: <20170125233534.0df859f3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for your contribution, and this new iteration. However, there
are still a number of issues that need to be resolved before we can
apply your patch. See below for the comments.

On Mon,  2 Jan 2017 16:45:27 +0100, David Bachelart wrote:
> diff --git a/package/sslh/0100-version-messup-with-git.patch b/package/sslh/0100-version-messup-with-git.patch

Patches should starts at 0001, and we like them to be generated with
"git format-patch" when the upstream project uses Git as its version
control system.

> new file mode 100644
> index 0000000..f4bc7c9
> --- /dev/null
> +++ b/package/sslh/0100-version-messup-with-git.patch
> @@ -0,0 +1,47 @@

All patches must have a description and Signed-off-by line, formatted
like all git commits.

> +diff --git a/genver.sh b/genver.sh
> +index 4d6e76a..7e9176f 100755
> +--- a/genver.sh
> ++++ b/genver.sh
> +@@ -7,7 +7,7 @@ else
> + 	QUIET=0
> + fi
> + 
> +-if ! `(git status | grep -q "On branch") 2> /dev/null`; then
> ++#if ! `(git status | grep -q "On branch") 2> /dev/null`; then

Please remove code instead of commenting it.

However, since sslh seems to be actively developed, we would very much
prefer a solution that can be upstreamed. So something like an option
we can pass, or another mechanism that allows to disable this "let's
determine the version from git" thing.

> diff --git a/package/sslh/Config.in b/package/sslh/Config.in
> new file mode 100644
> index 0000000..3794175
> --- /dev/null
> +++ b/package/sslh/Config.in
> @@ -0,0 +1,14 @@
> +config BR2_PACKAGE_SSLH
> +	bool "sslh"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	# uses fork()
> +	depends on BR2_USE_MMU
> +	select BR2_PACKAGE_LIBCONFIG
> +	help
> +	  Applicative protocol multiplexer
> +
> +	  http://www.rutschle.net/tech/sslh.shtml
> +
> +comment "iperf needs a toolchain w/ C++"

I guess this package is sslh, not iperf :)

> +start()
> +{
> +	echo -n "Starting $NAME: "

Use printf here instead of echo -n.

> +	start-stop-daemon -S -q --exec $DAEMON -- $DAEMON_OPTS --pidfile $PIDFILE && echo "OK" || echo "Failed"

Please use the same syntax as other init scripts. Look at
package/dropbear/S50dropbear for an example.

> +stop()
> +{
> +	echo -n "Stopping $NAME: "
> +	start-stop-daemon -K -q -x $DAEMON && echo "OK" || echo "Failed"
> +	rm -f $PIDFILE

Removing the pidfile is not really needed.

> diff --git a/package/sslh/sslh.default b/package/sslh/sslh.default
> new file mode 100644
> index 0000000..2d2a1b1
> --- /dev/null
> +++ b/package/sslh/sslh.default
> @@ -0,0 +1,14 @@
> +# Default options for sslh initscript
> +# sourced by /etc/init.d/sslh

There is no such file in Buildroot.

> +# Disabled by default, to force yourself
> +# to read the configuration:
> +# - /usr/share/doc/sslh/README.Debian (quick start)
> +# - /usr/share/doc/sslh/README, at "Configuration" section
> +# - sslh(8) via "man sslh" for more configuration details.

All these references don't really make sense in a Buildroot context.

> +# Once configuration ready, you *must* set RUN to yes here
> +# and try to start sslh (standalone mode only)
> +
> +RUN=yes

Not used by Buildroot.

> +
> +DAEMON_OPTS="--user root --listen 0.0.0.0:8090 --ssh 127.0.0.1:22 --http 127.0.0.1:80"

In general, we do not provide an default file for /etc/default, the
init script is self sufficient. So please put the default value for
DAEMON_OPTS into the init script, and simply include /etc/default/sslh
afterwards so that it can override the options.

> diff --git a/package/sslh/sslh.mk b/package/sslh/sslh.mk
> new file mode 100644
> index 0000000..962300f
> --- /dev/null
> +++ b/package/sslh/sslh.mk
> @@ -0,0 +1,29 @@
> +################################################################################
> +#
> +# sslh
> +#
> +################################################################################
> +
> +SSLH_VERSION = 1.18
> +SSLH_SITE = http://www.rutschle.net/tech/sslh
> +SSLH_SOURCE = sslh-v$(SSLH_VERSION).tar.gz

The "v" should be part of SSLH_VERSION, and then SSLH_SOURCE can be
removed as it's the default version.

> +SSLH_LICENSE = GPL-v2+

Should be GPLv2+.

> +SSLH_LICENSE_FILES = COPYING
> +
> +SSLH_DEPENDENCIES = libconfig
> +
> +define SSLH_BUILD_CMDS
> +  $(TARGET_MAKE_ENV) make CC=$(TARGET_CC) -C $(SSLH_DIR)

This should be:

	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)

notice that the indentation is done with one tab, not with spaces.

> +endef
> +
> +define SSLH_INSTALL_TARGET_CMDS
> +  $(INSTALL) -m 755 -D $(@D)/sslh-fork $(TARGET_DIR)/usr/sbin/sslh
> +  $(INSTALL) -m 644 -D package/sslh/sslh.default $(TARGET_DIR)/etc/default/sslh

The Makefile has an "install" target that seems to do the right thing,
you should use it.

> +endef
> +
> +define SSLH_INSTALL_INIT_SYSV
> +  $(INSTALL) -m 755 -D package/sslh/S35sslh $(TARGET_DIR)/etc/init.d/S35sslh

This is OK, except the indentation: should be one tab, not some spaces.

Could you address those different issues (I believe they are all quite
easy to resolve) and submit an updated version of your patch?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
