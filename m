From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 27 Oct 2009 14:10:58 +0100
Subject: [Buildroot] [PATCH] netkitftp: ftp client from netkit project
In-Reply-To: <1256647300-19012-1-git-send-email-hugues@hiegel.fr> (Hugues
	Hiegel's message of "Tue\, 27 Oct 2009 13\:41\:40 +0100")
References: <1256573832-11116-2-git-send-email-hugues@hiegel.fr>
	<1256647300-19012-1-git-send-email-hugues@hiegel.fr>
Message-ID: <871vkpdlst.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hugues" == Hugues Hiegel <hugues@hiegel.fr> writes:

 Hugues> From: Hugues Hiegel <hugues.hiegel@openwide.fr>

Thanks, looks a lot better, but we're still not quite there yet.

It would be good if you could add a signed-of-by line to the end of the
commit message - E.G.

Signed-off-by: Hugues Hiegel <hugues.hiegel@openwide.fr>

 Hugues> +++ b/package/netkitftp/Config.in
 Hugues> @@ -0,0 +1,6 @@
 Hugues> +config BR2_PACKAGE_NETKITFTP
 Hugues> +	bool "netkitftp"
 Hugues> +	help
 Hugues> +	  "Classic" ftp client with standard behaviour from 

Trailing space.

 Hugues> +++ b/package/netkitftp/netkitftp.mk
 Hugues> @@ -0,0 +1,25 @@
 Hugues> +#############################################################
 Hugues> +#
 Hugues> +# netkitftp
 Hugues> +#
 Hugues> +#############################################################
 Hugues> +NETKITFTP_VERSION:=0.17
 Hugues> +NETKITFTP_PATCH_VERSION:=16
 Hugues> +NETKITFTP_SOURCE:=netkit-ftp_$(NETKITFTP_VERSION).orig.tar.gz
 Hugues> +NETKITFTP_PATCH:=netkit-ftp_$(NETKITFTP_VERSION)-$(NETKITFTP_PATCH_VERSION).diff.gz
 Hugues> +NETKITFTP_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/n/netkit-ftp/

You'll need to disable the configure cache as the configure script
doesn't understand it:

Unrecognized option: --cache-file=/tmp/br/build/tgt-config.cache
make: *** [/tmp/br/build/netkitftp-0.17/.stamp_configured] Error 1

E.G. add NETKITFTP_USE_CONFIG_CACHE:=NO

You'll also need to prepend netkitftp- to the patch names, as they will
otherwise not get applied and configure errors out on unrecognized
options.

With that fixed the configure script still fails with:

Checking for BSD signal semantics... yes
Checking for ncurses... no
Checking for traditional termcap... not found
This package needs termcap to run.

So you probably need to depend on ncurses. Notice that the configure
script doesn't return an error code here, so the build continues (and
then fails later on).

Are you testing this in some other tree than mainline?

 Hugues> +
 Hugues> +# Netkitftp does not understands the INSTALL_PREFIX envvar,
 Hugues> +#?we have to use the --installroot configure option instead...
 Hugues> +NETKITFTP_CONF_OPT = --installroot=$(TARGET_DIR) \
 Hugues> +					 --without-readline
 Hugues> +NETKITFTP_INSTALL_TARGET_OPT = install
 Hugues> +
 Hugues> +$(eval $(call AUTOTARGETS,package,netkitftp))
 Hugues> +
 Hugues> +$(NETKITFTP_HOOK_POST_BUILD):
 Hugues> +	# The 'install' rule of netkitftp would install manpages, but the
 Hugues> +	#?folders generally do not exist on the TARGET_PATH, so we create
 Hugues> +	#?them in order to let 'make install' successfully perform.
 Hugues> +	mkdir -p $(TARGET_DIR)/usr/man/man1 $(TARGET_DIR)/usr/man/man5

You still have odd unicode chars here.

You forgot to actually include the Config.in to package/Config.in, so
the package cannot get selected.

Could you fix those issues please?

-- 
Bye, Peter Korsgaard
