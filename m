From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 26 Oct 2009 19:08:13 +0100
Subject: [Buildroot] [PATCH] netkitftp: added package with
	Makefile.autotools.in support
In-Reply-To: <1256573832-11116-2-git-send-email-hugues@hiegel.fr> (Hugues
	Hiegel's message of "Mon\, 26 Oct 2009 17\:17\:12 +0100")
References: <1256573832-11116-1-git-send-email-hugues@hiegel.fr>
	<1256573832-11116-2-git-send-email-hugues@hiegel.fr>
Message-ID: <874opmf2pe.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hugues" == Hugues Hiegel <hugues@hiegel.fr> writes:

Hi,

Thanks for the patch - A few comments:

 Hugues> From: Hugues Hiegel <hugues.hiegel@openwide.fr>
 Hugues> ---
 Hugues>  package/netkitftp/Config.in                        |    9 +++++
 Hugues>  package/netkitftp/netkitftp-configure-noexit.patch |   13 +++++++
 Hugues>  package/netkitftp/netkitftp-configure.patch        |   37 ++++++++++++++++++++
 Hugues>  package/netkitftp/netkitftp.mk                     |   23 ++++++++++++
 Hugues>  4 files changed, 82 insertions(+), 0 deletions(-)
 Hugues>  create mode 100644 package/netkitftp/Config.in
 Hugues>  create mode 100644 package/netkitftp/netkitftp-configure-noexit.patch
 Hugues>  create mode 100644 package/netkitftp/netkitftp-configure.patch
 Hugues>  create mode 100644 package/netkitftp/netkitftp.mk

 Hugues> diff --git a/package/netkitftp/Config.in b/package/netkitftp/Config.in
 Hugues> new file mode 100644
 Hugues> index 0000000..9b37d6e
 Hugues> --- /dev/null
 Hugues> +++ b/package/netkitftp/Config.in
 Hugues> @@ -0,0 +1,9 @@
 Hugues> +config BR2_PACKAGE_NETKITFTP
 Hugues> +	bool "netkitftp"
 Hugues> +	default n

'n' is default, so no need to explictly list that.

 Hugues> +	help
 Hugues> +	  ftp client.
 Hugues> +	  ftp client version 0.17-16 with debian patch.
 Hugues> +	            ftp://ftp.debian.org/debian/pool/main/netkit-ftp/

That's not a good help text. We generally don't list version numbers in
the help text as they tend to get out of sync with the .mk files fast.

 Hugues> +
 Hugues> +	  ftp://ftp.uk.linux.org/pub/linux/Networking/netkit/
 Hugues> diff --git a/package/netkitftp/netkitftp-configure-noexit.patch b/package/netkitftp/netkitftp-configure-noexit.patch
 Hugues> new file mode 100644
 Hugues> index 0000000..f588a46
 Hugues> --- /dev/null
 Hugues> +++ b/package/netkitftp/netkitftp-configure-noexit.patch
 Hugues> @@ -0,0 +1,13 @@
 Hugues> +diff --git a/configure b/configure
 Hugues> +index 0440527..54a5278 100755
 Hugues> +--- a/configure
 Hugues> ++++ b/configure
 Hugues> +@@ -39,7 +39,7 @@ EOF
 Hugues> + 	--manmode=*) MANMODE=`echo $1 | sed 's/^[^=]*=//'` ;;
 Hugues> + 	--with-c-compiler=*) CC=`echo $1 | sed 's/^[^=]*=//'` ;;
 Hugues> + 	--without-readline|--disable-readline) WITHOUT_READLINE=1;;
 Hugues> +-	*) echo "Unrecognized option: $1"; exit 1;;
 Hugues> ++	*) echo "Unrecognized option: $1";;

Please document patches. Why is this needed, and is this something that
should get submitted upstream?

 Hugues> diff --git a/package/netkitftp/netkitftp-configure.patch b/package/netkitftp/netkitftp-configure.patch

That one as well.

 Hugues> +++ b/package/netkitftp/netkitftp.mk
 Hugues> @@ -0,0 +1,23 @@
 Hugues> +#############################################################
 Hugues> +#
 Hugues> +# netkitftp
 Hugues> +#
 Hugues> +#############################################################
 Hugues> +NETKITFTP_VERSION:=0.17
 Hugues> +NETKITFTP_SOURCE:=netkit-ftp_$(NETKITFTP_VERSION).orig.tar.gz
 Hugues> +NETKITFTP_PATCH:=netkit-ftp_0.17-16.diff.gz
 Hugues> +NETKITFTP_SITE:=ftp://ftp.debian.org/debian/pool/main/n/netkit-ftp/

We have BR2_DEBIAN_MIRROR, which should be used.
Is that a stable URL? Would something on snapshot.debian.net be better?

 Hugues> +
 Hugues> +NETKITFTP_CONF_OPT = --installroot=$(TARGET_DIR) \

Something regarding TARGET_DIR at configure time? Doesn't that leak
paths on the build host to the installed binaries?

 Hugues> +					--without-readline
 Hugues> +NETKITFTP_MAKE_ENV = SUB=ftp

A comment to why would be good.

 Hugues> +NETKITFTP_INSTALL_TARGET_OPT = INSTALL_PREFIX=$(TARGET_DIR) install
 Hugues> +
 Hugues> +$(eval $(call AUTOTARGETS,package,netkitftp))
 Hugues> +
 Hugues> +$(NETKITFTP_HOOK_POST_BUILD):
 Hugues> +	[ ! -d $(TARGET_DIR)/usr/man/man1 ] && install -d $(TARGET_DIR)/usr/man/man1 || true
 Hugues> +	[ ! -d $(TARGET_DIR)/usr/man/man5 ] && install -d $(TARGET_DIR)/usr/man/man5 ||?true

You have _true at the man5 line. Simply doing mkdir -p
$(TARGET_DIR)/usr/man/man1 $(TARGET_DIR)/usr/man/man5 would be simpler
to read.

Also don't forget to touch $@ so the target isn't always considered out
of date.

A comment to why the above is needed in the first place would also be
good.

 Hugues> +
 Hugues> +$(NETKITFTP_HOOK_POST_INSTALL):
 Hugues> +	rm -vfr $(TARGET_DIR)/usr/man

Why verbose? That uninstall would also remove all other man pages, so
don't do that.

-- 
Bye, Peter Korsgaard
