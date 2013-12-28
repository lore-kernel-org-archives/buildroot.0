From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Dec 2013 17:38:57 +0100
Subject: [Buildroot] [PATCH 1/1] chdkptp CLI added
In-Reply-To: <1387798250-2437-2-git-send-email-matthew.j.urry@gmail.com>
References: <1387798250-2437-1-git-send-email-matthew.j.urry@gmail.com>
 <1387798250-2437-2-git-send-email-matthew.j.urry@gmail.com>
Message-ID: <20131228173857.33b43f76@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Matthew Urry,

Thanks for this contribution. Note that for a single patch, there is no
real need to send a cover letter (i.e the mail title PATCH 0/1). The
text of your cover letter could almost as is have been part of the
commit log itself (with just "I have only enabled the command line
interface and not the GUI." changed to something less personal like
"The package only builds the command line interface and not the GUI").

Some more comments below.

On Mon, 23 Dec 2013 11:30:50 +0000, Matthew Urry wrote:

> diff --git a/package/chdkptp/chdkptp-02-create_sh_script_to_launch_chdkptp.patch b/package/chdkptp/chdkptp-02-create_sh_script_to_launch_chdkptp.patch
> new file mode 100644
> index 0000000..aadd6c7
> --- /dev/null
> +++ b/package/chdkptp/chdkptp-02-create_sh_script_to_launch_chdkptp.patch

There is no description for this patch. And it seems to only be
renaming a file. Why is this needed? Why don't you do it in the
package .mk file instead?

> --- /dev/null
> +++ b/package/chdkptp/chdkptp.mk
> @@ -0,0 +1,27 @@
> +################################################################################
> +#
> +# chdkptp
> +#
> +################################################################################
> +
> +CHDKPTP_VERSION = 461
> +CHDKPTP_SITE = http://subversion.assembla.com/svn/chdkptp/trunk
> +CHDKPTP_SITE_METHOD = svn
> +CHDKPTP_DEPENDENCIES = libusb-compat lua

Is 'lua' really a build dependency? Or is it only a runtime dependency?

> +CHDKPTP_LICENSE = GPLv2

License seems to be GPLv2+.

> +define CHDKPTP_BUILD_CMDS
> +	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) 

We generally like to also pass CFLAGS and LDFLAGS here by doing:

	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)

though that might require changing a bit the project Makefile to use
constructs like:

override CFLAGS += ...
override LDFLAGS += ...

Note that doing that would also allow to avoid the -lm patch altogether.

> +endef
> +
> +define CHDKPTP_INSTALL_TARGET_CMDS
> +        $(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/share/chdkptp
> +        $(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/share/chdkptp/lua
> +        $(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/share/chdkptp/lua/extras

I believe that last one is sufficient: $(INSTALL) automatically creates
intermediate directories if needed.

> +    	$(INSTALL) -m 0755 $(@D)/chdkptp $(TARGET_DIR)/usr/share/chdkptp
> +        $(INSTALL) -m 0755 $(@D)/lua/*.lua $(TARGET_DIR)/usr/share/chdkptp/lua
> +        $(INSTALL) -m 0755 $(@D)/lua/extras/*.lua $(TARGET_DIR)/usr/share/chdkptp/lua/extras
> +        $(INSTALL) -m 0755 $(@D)/chdkptp.sh $(TARGET_DIR)/usr/bin/chdkptp

I haven't looked, but why is usr/bin/chdkptp a shell script, and the
real binary installed in /usr/share/chdkptp ? Adding a comment above
the install target commands macro explaining why it is needed would be
useful.

Could you take into account these comments and submit an updated
version? Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
