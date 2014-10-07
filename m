From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 8 Oct 2014 00:29:33 +0200
Subject: [Buildroot] [Patch v2 1/1] Fix selection of bootloaders from
 $(BR2_EXTERNAL)
In-Reply-To: <20141007212938.GA2949@itchy>
References: <1412686892-29394-1-git-send-email-eric.le.bihan.dev@free.fr>
 <20141007154851.4a94c0f7@free-electrons.com>
 <20141007212938.GA2949@itchy>
Message-ID: <20141007222933.GC27580@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Eric, Thomas, All,

On 2014-10-07 23:29 +0200, Eric Le Bihan spake thusly:
> On Tue, Oct 07, 2014 at 03:48:51PM +0200, Thomas Petazzoni wrote:
> > Dear Eric Le Bihan,
> >
> > On Tue,  7 Oct 2014 15:01:32 +0200, Eric Le Bihan wrote:
> > > If a package is based on "generic-package", pkg-generic.mk will compute
> > > the name of the Kconfig variable to use for checking if this package has
> > > been selected by the user.
> > >
> > > Unfortunately, this mechanism does not take into account the case where
> > > a bootloader is declared in a $(BR2_EXTERNAL)/boot directory.
> > >
> > > So, even if the bootloader has been selected, it will not be added to
> > > $(TARGETS) and will not be built.
> > >
> > > This patch fixes this issue, as well as handle toolchains.
[--SNIP--]
> > Well, this makes the assumption that $(BR2_EXTERNAL) bootloaders should
> > be in boot/ and $(BR2_EXTERNAL) toolchain stuff should be in toolchain/.
> >
> > In practice, the boot/ and toolchain/ organization in the main
> > Buildroot does not necessarily need to be reflected in $(BR2_EXTERNAL):
> > you can have a bootloader in $(BR2_EXTERNAL)/package/foobar/, just name
> > its option BR2_PACKAGE_FOOBAR and not BR2_TARGET_FOOBAR.
> 
> On the contrary, I find it confusing *not* to reflect the main Buildroot
> organization in $(BR2_EXTERNAL).
> 
> To me, the $(BR2_EXTERNAL)/package directory should contain Makefiles for
> programs to be deployed in the rootfs of the target or host tools to build
> them. But a bootloader is not to be deployed on the rootfs, but to be built
> next to it. So it is more sensible to put the Makefile for a new/proprietary
> bootloader in $(BR2_EXTERNAL)/boot.

I have to agree with Eric here: I think allowing (not enforcing) the
same layout in br2-external as in Buildroot is a good thing.

> For $(BR2_EXTERNAL)/toolchain, a user may want to use a proprietary toolchain
> that is not available as a tarball and thus not installable via the
> traditional means.

But does that even work at all?

Toolchains are not packages; br2-external was not designed to get new
toolchain definitions. That it works, if it does at all, is just merely
happenstance.

I wonder if/how we should/could get this to work.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
