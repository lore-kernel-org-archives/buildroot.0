From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Jan 2013 12:15:11 +0100
Subject: [Buildroot] [PATCH 1/1] infozip: new package
In-Reply-To: <1357814466-3728-1-git-send-email-jp@jp-embedded.com>
References: <1357814466-3728-1-git-send-email-jp@jp-embedded.com>
Message-ID: <20130110121511.0d25e449@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jan Pedersen,

On Thu, 10 Jan 2013 11:41:06 +0100, Jan Pedersen wrote:

> +INFOZIP_LICENSE_FILES = LICENCE

This is not correct, the file is called LICENSE.

You should run "make legal-info" when you create a new package, to
verify that the LICENSE_FILES field is correct.

> +define INFOZIP_BUILD_CMDS
> +	$(MAKE) -C $(@D) -f unix/Makefile generic CC=$(TARGET_CC)
> +endef
> +
> +define INFOZIP_INSTALL_TARGET_CMDS
> +	$(MAKE) -C $(@D) -f unix/Makefile install prefix=$(TARGET_DIR)/usr CC=$(TARGET_CC)
> +endef

Even though the package does not allow to override CFLAGS, I would
prefer if $(TARGET_CONFIGURE_OPTS) was used. It avoids for example the
mistake of forgetting the quotes around $(TARGET_CC). So, something
like:

define INFOZIP_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) -f unix/Makefile generic
endef

define INFOZIP_INSTALL_TARGET_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) -f unix/Makefile install prefix=$(TARGET_DIR)/usr
endef

Once this is fixed, you get my Acked-by and Tested-by, as I tested this
package.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
