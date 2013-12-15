From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Dec 2013 17:10:59 +0100
Subject: [Buildroot] [ PATCH v4 16/20] busybox: add option to install
 individual binaries
In-Reply-To: <52AA4069.3000707@mind.be>
References: <1386872840-22051-1-git-send-email-clshotwe@rockwellcollins.com>
 <1386872840-22051-17-git-send-email-clshotwe@rockwellcollins.com>
 <52AA4069.3000707@mind.be>
Message-ID: <20131215171059.767cfd8b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Fri, 13 Dec 2013 00:02:01 +0100, Arnout Vandecappelle wrote:

> >
> > +config BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES
> > +	bool "Individual binaries"
> 
>   This really lacks some help text, even I had no idea what it meant
> at first. I guess the text from busybox can just be reused - though
> for SELinux there's obviously a different reason.

In fact, the patches from me in this series were not really meant to be
sent to the list. They are proof-of-concept patches that I did to help
Clayton, but some more work was needed before they could be submit for
real.

>          If your CPU architecture doesn't allow for sharing
> text/rodata sections of running binaries, but allows for runtime
> dynamic libraries, this option will allow you to reduce memory
> footprint when you have many different applets running at once.
> 
>          If your CPU architecture allows for sharing text/rodata,
>          having single binary is more optimal.
> 
>          Each applet will be a tiny program, dynamically linked
>          against libbusybox.so.N.N.N.
> 
>          You need to have a working dynamic linker.

In the context of SELinux, it's because SELinux can only apply
different security policies to the various applets if they use
different binaries.

>   That last sentence makes me think that we're missing a depends on 
> !BR2_PREFER_STATIC here.

Indeed.

Also, I am not sure we want to show this option in the top-level
package menuconfig. So, we can either:

 * Have a sub-menu for Busybox customization options
 * Make this behavior automatic whenever SELinux support is enabled,
   and only in this case

> > +ifeq ($(BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES),y)
> > +define BUSYBOX_PERMISSIONS
> > +/usr/share/udhcpc/default.script f 755  0 0 - - - - -
> 
>   Isn't setuid root needed anymore for /bin/login? Same for passwd,
> su, probably others...

Most likely yes. I have been able to log into the system with this
patch, though.

> > +define BUSYBOX_INSTALL_INDIVIDUAL_BINARIES
> > +	for i in `find -L $(TARGET_DIR) -xtype l -samefile
> > $(TARGET_DIR)/bin/busybox` ; do \
> > +		$(INSTALL) -D -m 0755 $(@D)/0_lib/`basename $$i`
> > $$i ; \
> > +	done
> 
>   Icky, perhaps it's better to make an upstreamable patch that fixes
> the Makefile so it properly installs the binaries if
> INDIVIDUAL_BINARIES is selected?

Yeah, could be interesting indeed.

Thanks for your comments,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
