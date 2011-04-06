From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Apr 2011 16:42:59 +0200
Subject: [Buildroot] Binary ATI driver package in buildroot
In-Reply-To: <BANLkTinVhQdOqVJdkO9gK8Q==1j1uf_=BA@mail.gmail.com>
References: <1302088845-15193-1-git-send-email-a@awn.dk>
	<20110406153502.13c6affd@surf>
	<BANLkTinVhQdOqVJdkO9gK8Q==1j1uf_=BA@mail.gmail.com>
Message-ID: <20110406164259.561b2511@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Allan,

(It would be better to keep the Buildroot list CC'ed)

On Wed, 6 Apr 2011 16:34:42 +0200
Allan Nielsen <a@awn.dk> wrote:

> > However, your package does not use the GENTARGETS infrastructure,
> > which it should do. We don't include packages that don't rely on
> > one of the GENTARGETS, AUTOTARGETS or CMAKETARGETS infrastructure.
> 
> I'am converting it to GENTARGETS right now, but I'am having some
> problem with the extracting step, here is what I tried:
> 
> define FGLRX_EXTRACT_CMDS
>         mkdir -p $(@D)
>         sh $(DL_DIR)/$(FGLRX_SOURCE) --extract $(@D)
> endef
> 
> But for some reason this does not seems to have any effect, hare are a
> snippet from the output:
> 
> echo ">>> fglrx 11-2 "Extracting""
> mkdir -p /home/awn/git/buildroot/output/build/fglrx-11-2
> /home/awn/src/ati-driver-installer-11-2-x86.x86_64.run | tar
> --strip-components=1 -C
> /home/awn/git/buildroot/output/build/fglrx-11-2  -xf -
> chmod -R ug+rw /home/awn/git/buildroot/output/build/fglrx-11-2
> touch /home/awn/git/buildroot/output/build/fglrx-11-2/.stamp_extracted
> 
> Is this not the correct way to use GENTARGETS?

Unfortunately for the moment, it is not possible to override the
extraction step of a package by defining the <pkg>_EXTRACT_CMDS
variable. Buildroot asumes that each package is a tarball that can be
extracted as usual.

There are however several packages (usually non-open source stuff) with
strange extraction needs, so it would be great to be able to override
this step.

As a hack, you can do something like:

$(BUILD_DIR)/dhrystone-$(DHRYSTONE_VERSION)/.stamp_extracted:
        @$(call MESSAGE,"Extracting")
        $(Q)mkdir -p $(@D)
        $(Q)cd $(@D) && $(SHELL) $(DL_DIR)/$($(PKG)_SOURCE)
        $(Q)cp $($(PKG)_DIR_PREFIX)/dhrystone/Makefile $(@D)/
        $(Q)touch $@

(see package/dhrystone/dhryistone.mk)

Or if you want to do it the clean way, add the possibility of
overriding the extraction step in the package infrastructure.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
