From: Mike <mikez@OpenPlayer.org>
Date: Sat, 4 Jul 2015 21:36:28 -0500
Subject: [Buildroot] Hash checking infrastructure
In-Reply-To: <20150704214734.GC3634@free.fr>
References: <20150704140142.3aa5c982@core2quad.morethan.org>
 <20150704214734.GC3634@free.fr>
Message-ID: <20150704213628.21ff7e6e@core2quad.morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 4 Jul 2015 23:47:34 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Mike, All,
> 
> On 2015-07-04 14:01 -0500, Mike spake thusly:
> > A small nit about how the hash checking is
> > working (or in special cases, not working):
> > 
> > Use case:
> > 
> > When using a package source directory override,
> > the usual version number field is replaced with
> > the string 'custom'.
> > 
> > If the package being over-ridden has a hash file
> > in its Buildroot configuration directory,
> > the hash checker attempts to check the:
> > <package name>-custom-<archive type> in the 
> > download directory.
> 
> I'm a bit surprised of this result. I just tried here with an override
> srcdir or busybox, and I don't see anything related to checking a
> hash, with this defconfig:
> 
>     BR2_x86_i686=y
>     BR2_TOOLCHAIN_EXTERNAL=y
> 
> and this local.mk:
> 
>     BUSYBOX_OVERRIDE_SRCDIR=/home/ymorin/dev/buildroot/foo/busybox
> 
> and here's the output of 'make busybox':
> 
>     >>> busybox custom Syncing from source
>     >>> dir /home/ymorin/dev/buildroot/foo/busybox
>     rsync -au --exclude .svn --exclude .git --exclude .hg
> --exclude .bzr --exclude CVS /home/ymorin/dev/buildroot/foo/busybox/
>     /home/ymorin/dev/buildroot/O/build/busybox-custom
> 
> So, no, there's no message about checking any hash...
> 

Sorry, I wasn't clear -
The build stops with a: "No hash for ...-custom-..." message.

To your test case above add, in a top-level local.mk:
BUSYBOX_OVERRIDE_SRCDIR = <some directory on your system>

Ah, point it at clone of busybox.git just to eliminate any
other strange side effects.

Note: The local.mk file needs to be in the top-level of your
output directory.
So if your doing an out-of-tree build (I am) with O=MyOut,
the local.mk needs to be in the MyOut directory.

(Which isn't mentioned clearly in the manual - that I can
probable send a patch for the description of where to put
the file.)

Mike


> In fact, I can't even see how we could check a hash in such a case, as
> checking the hash is directly done by our download wrapper, in
> support/download/dl-wrapper, which does not get called for packages
> that are overriden.
> 
> Can you provide a .config and a local.mk that exhibit this behaviour?
> 
> > Reference section 8.11.6:
> > "... will no longer attempt to download, extract 
> > and patch the package."
> > 
> > I think the behavior should also include skipping
> > the hash check.
> 
> As far as I can see, that's already the case. Maybe we can add that in
> the manual if that's what you're worried about. Care to send a patch?
> 
> Regards,
> Yann E. MORIN.
> 
