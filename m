From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Jun 2014 19:54:42 +0200
Subject: [Buildroot] [PATCH 1/1] atftp: new package
In-Reply-To: <1403297857-3987-1-git-send-email-ryan.barnett@rockwellcollins.com>
References: <1403297857-3987-1-git-send-email-ryan.barnett@rockwellcollins.com>
Message-ID: <20140621195442.79deacf5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ryan Barnett,

Thanks, but there are a couple of issues with the package. See below.

On Fri, 20 Jun 2014 15:57:37 -0500, Ryan Barnett wrote:

> diff --git a/package/atftp/Config.in b/package/atftp/Config.in
> new file mode 100644
> index 0000000..65c14d8
> --- /dev/null
> +++ b/package/atftp/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_ATFTP
> +	bool "atftp"

This package needs IPv6 support and thread support in the toolchain, so
you should add the relevant dependencies.

> +	help
> +	  atftp is a client/server implementation of the TFTP
> +	  protocol that implements RFCs 1350, 2090, 2347, 2348,
> +	  and 2349. The server is multi-threaded and the client
> +	  presents a friendly interface using libreadline.
> +
> +	  http://sourceforge.net/projects/atftp/

... and comment here.

> diff --git a/package/atftp/atftp.mk b/package/atftp/atftp.mk
> new file mode 100644
> index 0000000..27fa0df
> --- /dev/null
> +++ b/package/atftp/atftp.mk
> @@ -0,0 +1,22 @@
> +################################################################################
> +#
> +# atftp
> +#
> +################################################################################
> +
> +ATFTP_VERSION  = 0.7.1
> +ATFTP_SITE = http://sourceforge.net/projects/atftp/files/
> +ATFTP_LICENSE = GPLv2

The license is actually GPLv2+.

> +ATFTP_LICENSE_FILES = LICENSE
> +
> +ifeq ($(BR2_PACKAGE_READLINE),y)
> +ATFTP_DEPENDENCIES += readline
> +ATFTP_CONF_OPT += --enable-libreadline
> +endif
> +
> +ifeq ($(BR2_PACKAGE_PCRE),y)
> +ATFTP_DEPENDENCIES += pcre
> +ATFTP_CONF_OPT += --enable-libpcre
> +endif

For both of those cases, it'd be good to have an 'else' clause that
does the appropriate --disable-<foo>.

Also, adding --disable-libwrap and --disable-mtftp would be nice, so
that these features don't get mistakenly enabled.

Another problem is that the package fails to build on Blackfin (at
least Blackfin FLAT), because it doesn't link atftp against
libpthread. A patch like this is needed to the Makefile.am:

-atftp_LDADD      = $(LIBTERMCAP) $(LIBREADLINE)
+atftp_LDADD      = $(LIBTERMCAP) $(LIBREADLINE) $(LIBPTHREAD)

Probably the problem can be reproduce on ARM by doing a pure static
build, but I haven't tested.

Can you fix those issues and submit a v2 ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
