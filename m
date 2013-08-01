From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Aug 2013 08:13:03 +0200
Subject: [Buildroot] List of pending patches: what to do?
In-Reply-To: <CANxTyt5V08njumRpKWQJEqThgd_FUKYnjg+XLwbFbWk+MKvx6Q@mail.gmail.com>
References: <20130731191415.545f7dff@skate>
 <CANxTyt5V08njumRpKWQJEqThgd_FUKYnjg+XLwbFbWk+MKvx6Q@mail.gmail.com>
Message-ID: <20130801081303.4d1570aa@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Danomi Manchego,

On Wed, 31 Jul 2013 22:52:34 -0400, Danomi Manchego wrote:
> > http://patchwork.ozlabs.org/patch/172171 avahi: only install
> > default.script/S05avahi-setup.sh if not present in fs skeleton
> >
> 
> This issue has already been fixed a different way; patch can be discarded.

Yep, I've done as part as Gustavo review of the patches.

> http://patchwork.ozlabs.org/patch/179493 relative DL_DIR okay?
> 
> This issue has already been fixed a different way; patch can be discarded.

Ok, thanks.

> > http://patchwork.ozlabs.org/patch/198234 group file: define groups
> > expected by udev
> 
> This patch is still good as-is.

Patch applied.

> > http://patchwork.ozlabs.org/patch/249912 Makefile: change rsync used in
> > overlays to always transfer files
> 
> The patch still applies, with no fuzz but some shifted lines.  The problem
> described still exists, and is still fixed by the patch.

It looks good, but I'd like to have someone ACK or test the patch.
Yann, Gustavo, Arnout?

> http://patchwork.ozlabs.org/patch/165382 [1/1] ccache: expose control
> > interface via 'make ccache-options'
> 
> I've no strong objection, but I think that using a Makefile variable to
> access the ccache binary is cumbersome

Agreed.

>, as cumbersome as having to export
> a BUILDROOT_CACHE_DIR to get ccache to point to the right directory.
>  Mercifully, buildroot avoids forcing us to define environment variables
> for regular use - for everything except setting up ccache options, that is.
>  Because of this, I tend to patch ccache to change the last-ditch cache dir
> value from "format("%s/.ccache", home_directory)" to the value set in the
> .config, which has a much better chance of being correct than
> $HOME/.ccache, but can still be overridden by exporting
> BUILDROOT_CACHE_DIR.  Then output/host/usr/bin/ccache can be invoked
> directly to set max-size, stat-clearing, etc. without needing environment
> variables.

So the problem is that one cannot simply do

  $(O)/host/usr/bin/ccache --max-size=5G

because the BUILDROOT_CACHE_DIR is passed as an environment variable,
and defined by the Buildroot Makefile, so if you want to interact
manually with ccache, you'd have to manually pass BUILDROOT_CACHE_DIR.

This explains why the patch was proposing this CACHE_OPTIONS idea, I
guess. I don't have much other ideas here, though.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
