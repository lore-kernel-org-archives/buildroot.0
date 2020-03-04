From: Antoine Tenart <antoine.tenart@bootlin.com>
Date: Wed, 4 Mar 2020 19:37:54 +0100
Subject: [Buildroot] [PATCH] package/linux-firmware: fix special cases
 of symlinks
In-Reply-To: <20200304170009.GA5357@scaer>
References: <20200304105304.986863-1-antoine.tenart@bootlin.com>
 <20200304170009.GA5357@scaer>
Message-ID: <20200304183754.GL3179@kwain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Wed, Mar 04, 2020 at 06:00:09PM +0100, Yann E. MORIN wrote:
> On 2020-03-04 11:53 +0100, Antoine Tenart spake thusly:
> > diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
> > index 009202d604d4..e367d4c5e7b8 100644
> > --- a/package/linux-firmware/linux-firmware.mk
> > +++ b/package/linux-firmware/linux-firmware.mk
> > @@ -609,13 +609,24 @@ endif
> >  # automatically by its copy-firmware.sh script during the installation, which
> >  # parses the WHENCE file where symlinks are described. We follow the same logic
> >  # here, adding symlink only for firmwares installed in the target directory.
> > -# The grep/sed parsing is taken from the script mentioned before.
> > +#
> > +# For testing the presence of firmwares in the target directory we first make
> > +# sure the directories under which the symlinks could be created exist, to
> > +# handle symlinks of the form a/foo -> ../b/foo where a/ doesn't exist. We then
> > +# remove any previously created empty directory. As the symlinks could be in
> > +# nested (empty) directories, we use the --parents option of rmdir; this is why
> > +# we're changing the current directory to $(TARGET_DIR)/lib/firmware/ before
> > +# doing anything.
> >  define LINUX_FIRMWARE_CREATE_SYMLINKS
> > +	cd $(TARGET_DIR)/lib/firmware/ ; \
> >  	sed -r -e '/^Link: (.+) -> (.+)$$/!d; s//\1 \2/' $(@D)/WHENCE | \
> >  	while read f d; do \
> > -		if test -f $(TARGET_DIR)/lib/firmware/$$d; then \
> > -			ln -sf $$d $(TARGET_DIR)/lib/firmware/$$f || exit 1; \
> > +		dir=$$(dirname $$f) ; \
> > +		mkdir -p $$dir ; \
> > +		if test -f $$dir/$$d; then \
> > +			ln -sf $$d $$f || exit 1; \
> >  		fi ; \
> > +		test "$$dir" != "." && rmdir --parents --ignore-fail-on-non-empty $$dir ; \
> 
> I was not too happy about this create-a-directory-then-remove-it-if-it-turned-
> out-we-did-not-need-it dance.
> 
> So, I hacked it, using readlink -m, and come up with something that I
> think is simpler and easier to grok:
> 
>     https://patchwork.ozlabs.org/patch/1249126/

I considered `readlink -m`, but its man pages says: "Note realpath(1) is
the preferred command to use for canonicalization functionality". So I
could have used realpath, but to use it I would have to define a
dependency on host-coreutils... which seemed a bit overkill. That's why
I move to a create-then-remove solution which I agree isn't perfect :-)

> I think even the cd into the firmware directory was not even needed, but
> I firgit to remove it to test...

Right, you can drop the cd statement (you have to use the full path in
the ln command then).

Thanks,
Antoine

-- 
Antoine T?nart, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
