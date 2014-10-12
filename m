From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 12 Oct 2014 11:57:51 +0200
Subject: [Buildroot] [PATCH] [RFC] system: add option to choose what
	/bin/sh points to
In-Reply-To: <1413049741-1340-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sat, 11 Oct 2014 19:49:01 +0200")
References: <1413049741-1340-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87h9z91ug0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Not all our shells do install a pointer to /bin/sh. Besides, between
 > those that do and multiple ones are enabled, the last one to install
 > wins the the symlink.

 > Add a new config choice in the system sub-menu that allows the user to
 > explicitly select the shell to provide /bin/sh.

 > Remove the symlink creation from bash.mk at the same time.

 > Note: for every shell, we select them, except busybox, on which we
 > depend, on the assumption that we do not want to force busybox in case
 > the user decided not to enable it.

But we default to BR2_INIT_BUSYBOX, so you still need to go into the
system menu and disable that before you can deselect busybox.

Another issue with the 'depends on' is that if you disable busybox the
choice then jumps to the next option which pulls in bash (which might
not really be what you want when you try to save space by disabling
busybox).

So I think it is better to use selects everywhere.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > ---
 >  package/bash/bash.mk |  1 -
 >  system/Config.in     | 43 +++++++++++++++++++++++++++++++++++++++++++
 >  system/system.mk     | 12 ++++++++++++
 >  3 files changed, 55 insertions(+), 1 deletion(-)

 > diff --git a/package/bash/bash.mk b/package/bash/bash.mk
 > index 6510af5..34a3a73 100644
 > --- a/package/bash/bash.mk
 > +++ b/package/bash/bash.mk
 > @@ -35,7 +35,6 @@ define BASH_INSTALL_TARGET_CMDS
 >  	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
 >  		DESTDIR=$(TARGET_DIR) exec_prefix=/ install
 >  	rm -f $(TARGET_DIR)/bin/bashbug
 > -	ln -sf bash $(TARGET_DIR)/bin/sh
 >  endef
 
 >  $(eval $(autotools-package))
 > diff --git a/system/Config.in b/system/Config.in
 > index e7e146a..22f37ea 100644
 > --- a/system/Config.in
 > +++ b/system/Config.in
 > @@ -211,6 +211,49 @@ config BR2_TARGET_GENERIC_ROOT_PASSWD
 >  	  in the build log! Avoid using a valuable password if either the
 >  	  .config file or the build log may be distributed!
 
 > +choice
 > +	bool "/bin/sh"
 > +	help
 > +	  Select which shell will provide /bin/sh.
 > +
 > +# busybox has shells that work on noMMU
 > +config BR2_SYSTEM_BIN_SH_BUSYBOX
 > +	bool "busybox' default shell"
 > +	depends on BR2_PACKAGE_BUSYBOX
 > +
 > +config BR2_SYSTEM_BIN_SH_BASH
 > +	bool "bash"
 > +	depends on BR2_USE_MMU # bash
 > +	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS || !BR2_PACKAGE_BUSYBOX

You arguably don't need the || !BR2_PACKAGE_BUSYBOX as we do a trick and
make BR2_PACKAGE_BUSYBOX_SHOW_OTHERS a hidden symbol (=y) when busybox
isn't enabled.

With that said, it doesn't actually work when I change the busybox
option to use select:

system/Config.in:214:error: recursive dependency detected!
system/Config.in:214:   choice <choice> contains symbol BR2_SYSTEM_BIN_SH_BASH
system/Config.in:224:   symbol BR2_SYSTEM_BIN_SH_BASH depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
package/busybox/Config.in:23:   symbol BR2_PACKAGE_BUSYBOX_SHOW_OTHERS depends on BR2_PACKAGE_BUSYBOX
package/busybox/Config.in:1:    symbol BR2_PACKAGE_BUSYBOX is selected by BR2_SYSTEM_BIN_SH_BUSYBOX
system/Config.in:220:   symbol BR2_SYSTEM_BIN_SH_BUSYBOX is part of choice <choice>

Any idea what we can do?

-- 
Bye, Peter Korsgaard
