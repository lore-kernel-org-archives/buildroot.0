From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 4 Jul 2015 23:47:34 +0200
Subject: [Buildroot] Hash checking infrastructure
In-Reply-To: <20150704140142.3aa5c982@core2quad.morethan.org>
References: <20150704140142.3aa5c982@core2quad.morethan.org>
Message-ID: <20150704214734.GC3634@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mike, All,

On 2015-07-04 14:01 -0500, Mike spake thusly:
> A small nit about how the hash checking is
> working (or in special cases, not working):
> 
> Use case:
> 
> When using a package source directory override,
> the usual version number field is replaced with
> the string 'custom'.
> 
> If the package being over-ridden has a hash file
> in its Buildroot configuration directory,
> the hash checker attempts to check the:
> <package name>-custom-<archive type> in the 
> download directory.

I'm a bit surprised of this result. I just tried here with an override
srcdir or busybox, and I don't see anything related to checking a hash,
with this defconfig:

    BR2_x86_i686=y
    BR2_TOOLCHAIN_EXTERNAL=y

and this local.mk:

    BUSYBOX_OVERRIDE_SRCDIR=/home/ymorin/dev/buildroot/foo/busybox

and here's the output of 'make busybox':

    >>> busybox custom Syncing from source dir /home/ymorin/dev/buildroot/foo/busybox
    rsync -au --exclude .svn --exclude .git --exclude .hg --exclude .bzr
    --exclude CVS /home/ymorin/dev/buildroot/foo/busybox/
    /home/ymorin/dev/buildroot/O/build/busybox-custom

So, no, there's no message about checking any hash...

In fact, I can't even see how we could check a hash in such a case, as
checking the hash is directly done by our download wrapper, in
support/download/dl-wrapper, which does not get called for packages that
are overriden.

Can you provide a .config and a local.mk that exhibit this behaviour?

> Reference section 8.11.6:
> "... will no longer attempt to download, extract 
> and patch the package."
> 
> I think the behavior should also include skipping
> the hash check.

As far as I can see, that's already the case. Maybe we can add that in
the manual if that's what you're worried about. Care to send a patch?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
