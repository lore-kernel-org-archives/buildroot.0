From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 22 Jun 2017 13:31:20 +0200
Subject: [Buildroot] [PATCH 1/2] uboot: add support for generating
 U-Boot boot scripts
In-Reply-To: <87h8z8i8o5.fsf@dell.be.48ers.dk>
References: <20170621214143.7184-1-thomas.petazzoni@free-electrons.com>
 <87h8z8i8o5.fsf@dell.be.48ers.dk>
Message-ID: <20170622133120.735b26c2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 22 Jun 2017 13:06:02 +0200, Peter Korsgaard wrote:

>  > More and more of our defconfigs need to generate a U-Boot boot
>  > script. It's a simple call to mkimage, but we already have 12
>  > instances of this logic in board/, and there are patch series waiting
>  > in patchwork adding 3 more boards that need this.  
> 
>  > So let's add an option in the U-Boot package to generate such a boot
>  > script image easily.  
> 
>  > Note that we assume a single script needs to be generated, and the
>  > output file name is boot.scr. The only platform for which it seems to
>  > not be the case are the Boundary Devices platforms: they generate two
>  > boot scripts, 6x_bootscript and 6x_upgrade, but they are anyway
>  > installed inside TARGET_DIR, not BINARIES_DIR.  
> 
>  > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  
> 
> Makes sense to me. Committed, thanks.

Wow, that was fast. I was wondering if we should extend it to multiple
boot scripts, but then the syntax would be a bit horrible:

BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="script1src:script1dest script2src:script2dest"

We could still keep the compatibility by having:

BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="script1src"

just generate script1src and install it as boot.scr.

Or maybe it's something we can take care of later?

>  > Retrospectively, I believe the choice of adding such a helper script
>  > for genimage was wrong. Having a proper option would be much
>  > cleaner/nicer IMO.  
> 
> Yes, agreed. My idea was also to add a kconfig option for it. This could
> also have sub options like "support creating fat partitions" that would
> pull in the needed host packages.

Also my thinking.

> The reason we went with the script solution was afaik that some projects
> might want to extra processing before or after creating the image, so it
> wasn't clear if it should run before or after the post-image scripts.
> 
> You can argue though that for such "special" situations you should just
> manually call genimage from the post-image script instead though.

Absolutely. I don't think we should try in those options to cover *all*
cases, only the most common ones. As long as the more special cases can
be covered by custom logic in post-build/post-image scripts, we're good
IMO.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
