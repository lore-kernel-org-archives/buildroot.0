From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Mar 2015 23:04:59 +0100
Subject: [Buildroot] [PATCH 1/1] Add dvd+rw-tools as package dvdrw-tools
In-Reply-To: <1424553133-5501-1-git-send-email-skenton@ou.edu>
References: <1424553133-5501-1-git-send-email-skenton@ou.edu>
Message-ID: <20150315230459.657411d5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Steve Kenton,

On Sat, 21 Feb 2015 15:12:13 -0600, Steve Kenton wrote:
> Signed-off-by: Steve Kenton <skenton@ou.edu>
> ---
>  package/dvdrw-tools/0001-limits.h.patch | 19 ++++++++++++
>  package/dvdrw-tools/Config.in           | 53 +++++++++++++++++++++++++++++++++
>  package/dvdrw-tools/dvdrw-tools.hash    |  3 ++
>  package/dvdrw-tools/dvdrw-tools.mk      | 38 +++++++++++++++++++++++
>  4 files changed, 113 insertions(+)
>  create mode 100644 package/dvdrw-tools/0001-limits.h.patch
>  create mode 100644 package/dvdrw-tools/Config.in
>  create mode 100644 package/dvdrw-tools/dvdrw-tools.hash
>  create mode 100644 package/dvdrw-tools/dvdrw-tools.mk

Thanks for this patch, and sorry for the slow response time. However, I
have a number of comments, see below.

> diff --git a/package/dvdrw-tools/0001-limits.h.patch b/package/dvdrw-tools/0001-limits.h.patch
> new file mode 100644
> index 0000000..a5c7484
> --- /dev/null
> +++ b/package/dvdrw-tools/0001-limits.h.patch

All patches need a description + a Signed-off-by line. See
http://buildroot.uclibc.org/downloads/manual/manual.html#_format_and_licensing_of_the_package_patches.

> diff --git a/package/dvdrw-tools/Config.in b/package/dvdrw-tools/Config.in
> new file mode 100644
> index 0000000..48254b3
> --- /dev/null
> +++ b/package/dvdrw-tools/Config.in
> @@ -0,0 +1,53 @@
> +config BR2_PACKAGE_DVDRW_TOOLS
> +	bool "dvdrw-tools"
> +	depends on BR2_USE_WCHAR
> +	depends on BR2_LARGEFILE
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_USE_MMU # fork()
> +	help
> +	  The dvd+rw-tools are used to master Blu-ray Disc
> +	  and DVD Disc media, both +RW/+R and -RW/-R. The
> +	  +RW in the name is a historical artifact. This
> +	  package contains the widely used growisofs program.
> +
> +	  Buildroot does not support packages with a '+' sign
> +	  in their name, which explains why it is named
> +	  dvdrw-tools and not dvd+rw-tools.
> +
> +	  Because dvd+rw-tools does not directly interact with
> +	  disc media it uses a separate media backend program.
> +	  The usual backend is mkisofs from the cdrtools package.
> +	  However, cdrtools is not currently part of buildroot.
> +
> +	  The Linux From Scratch project uses uses xorriso for the
> +	  media backend and Ubuntu uses cdrkit for the backend.
> +	  Choose the one which seems most appropriate for your use.
> +	  NOTE: xorriso does not currently support UDF.
> +	  
> +	  http://fy.chalmers.se/~appro/linux/DVD+RW/tools
> +
> +comment "dvdrw-tools needs a toolchain w/ wchar, largefile"
> +	depends on !BR2_USE_WCHAR || !BR2_LARGEFILE \
> +		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_MMU

This is not properly written. It should be:

comment "dvdrw-tools needs a toolchain w/ wchar, largefile, threads"
	depends on BR2_USE_MMU
	depends on !BR2_USE_WCHAR || !BR2_LARGEFILE || \
		!BR2_TOOLCHAIN_HAS_THREADS

The two issues with your proposal was:
 
 - The thread dependency was not mentioned in the comment.

 - The BR2_USE_MMU dependency must be handled specially: we don't want
   to see the comment if BR2_USE_MMU is disabled.

Also, since there is some C++ code, you probably need a dependency on
BR2_INSTALL_LIBSTDCPP and the corresponding comment update.

> +
> +if BR2_PACKAGE_DVDRW_TOOLS && !BR2_PACKAGE_CDRTOOLS

BR2_PACKAGE_CDRTOOLS does not exist in Buildroot, so why do we have a
reference to this non exiting variable?

> +config BR2_PACKAGE_DVDRW_CDRKIT

All Config.in variables of a package must start with the Config.in
option of the package itself. I.e, this should be:

   BR2_PACKAGE_DVDRW_TOOLS_CDRKIT

or maybe even better:

   BR2_PACKAGE_DVDRW_TOOLS_CDRKIT_BACKEND

> +define DVDRW_TOOLS_BUILD_CMDS
> +	$(MAKE) -C $(@D)
> +endef

How can this even cross-compile? You're not specifying the
cross-compiler path. Most likely, it at least needs to be:

	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)

> +BACKEND =

Not needed, variables are empty by default.

And BACKEND is not a proper variable name: the namespace of variables
in Buildroot is global. So all variables defined by a package must be
prefixed by the package name, to avoid conflicts with variables defined
by other packages.

> +ifneq ($(BR2_PACKAGE_CDRTOOLS),y)

Not needed, BR2_PACKAGE_CDRTOOLS does not exist in Buildroot.

> +ifeq ($(BR2_PACKAGE_DVDRW_CDRKIT),y)
> +	BACKEND = genisoimage
> +endif
> +
> +ifeq ($(BR2_PACKAGE_DVDRW_XORRISO),y)
> +	BACKEND = xorrisofs
> +endif
> +endif

This should probably be:

ifeq ($(BR2_PACKAGE_DVDRW_TOOLS_CDRKIT_BACKEND),y)
DVDRW_TOOLS_BACKEND = genisoimage
else ifeq ($(BR2_PACKAGE_DVDRW_TOOLS_XORRISO_BACKEND),y)
DVDRW_TOOLS_BACKEND = xorrisofs
endif

> +
> +define DVDRW_TOOLS_INSTALL_TARGET_CMDS
> +	$(INSTALL) -m 0755 -D $(@D)/dvd-ram-control $(TARGET_DIR)/usr/bin/dvd-ram-control
> +	$(INSTALL) -m 0755 -D $(@D)/dvd+rw-booktype $(TARGET_DIR)/usr/bin/dvd+rw-booktype
> +	$(INSTALL) -m 0755 -D $(@D)/dvd+rw-format $(TARGET_DIR)/usr/bin/dvd+rw-format
> +	$(INSTALL) -m 0755 -D $(@D)/dvd+rw-mediainfo $(TARGET_DIR)/usr/bin/dvd+rw-mediainfo
> +	$(INSTALL) -m 0755 -D $(@D)/growisofs $(TARGET_DIR)/usr/bin/growisofs
> +	test -z "$(BACKEND)" || ln -s -f /usr/bin/$(BACKEND) $(TARGET_DIR)/usr/bin/mkisofs

No need for the test -z test, since you're using a choice for the
backend, there is no way the BACKEND variable can be empty.

I've marked your patch as Changes Requested in our patch tracking
system, so please resubmit an updated version of your patch!

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
