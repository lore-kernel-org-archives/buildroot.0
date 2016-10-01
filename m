From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 01 Oct 2016 23:11:48 +0200
Subject: [Buildroot] [PATCHv2 1/2] mksh: new package
In-Reply-To: <20160928123952.GA27218@waldemar-brodkorb.de> (Waldemar
 Brodkorb's message of "Wed, 28 Sep 2016 14:39:53 +0200")
References: <20160928123952.GA27218@waldemar-brodkorb.de>
Message-ID: <87lgy7rcyz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > The MirOS Korn Shell is a quite complete posix shell implementation,
 > is rather small and supports vi mode properly.

 > Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
 > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
 > ---
 > v1 -> v2:
 >  - split off system shell patch, suggested by Thomas Petazzoni
 >  - wrap description to 72, suggested by  Thomas Petazzoni
 >  - simplify building in one step, suggested by Thorsten Glaser
 >  - remove License file, add URL for MirOS License

 > An example mkshrc can be added later.
 > +++ b/package/mksh/mksh.mk
 > @@ -0,0 +1,26 @@
 > +################################################################################
 > +#
 > +# mksh
 > +#
 > +################################################################################
 > +
 > +MKSH_VERSION = R53a
 > +MKSH_SOURCE = mksh-$(MKSH_VERSION).tgz
 > +MKSH_SITE = https://www.mirbsd.org/MirOS/dist/mir/mksh
 > +# For MirOS License see https://www.mirbsd.org/TaC-mksh.txt
 > +MKSH_LICENSE = MirOS, ISC

It would be good with a license file as well. The man page does a have a
license snippet, so I've added:

MKSH_LICENSE_FILES = mksh.1

> +
 > +define MKSH_BUILD_CMDS
 > +	cd $(@D) && $(TARGET_MAKE_ENV) \
 > +		CPPFLAGS="$(TARGET_CPPFLAGS)" \
 > +		CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
 > +		LD="$(TARGET_LD)" LDFLAGS="$(TARGET_LDFLAGS)" \
 > +		TARGET_OS=Linux \
 > +		sh ./Build.sh

I've changed this to use TARGET_CONFIGURE_OPTS.

> +endef
 > +
 > +define MKSH_INSTALL_TARGET_CMDS
 > +	$(INSTALL) -m 0755 $(@D)/mksh $(TARGET_DIR)/bin/mksh

And use the -D option to ensure /bin gets created if needed.

Committed with these fixes, thanks.

-- 
Bye, Peter Korsgaard
