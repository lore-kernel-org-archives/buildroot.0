From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Wed, 3 Jan 2018 23:15:42 +0100
Subject: [Buildroot] [PATCH] libselinux: add patch to create a proper
 pkg-config file
In-Reply-To: <20180103222626.305ff910@windsurf.lan>
References: <20180103210851.26851-1-marcus.folkesson@gmail.com>
 <20180103222626.305ff910@windsurf.lan>
Message-ID: <20180103221529.GA27551@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I have played around with this a lot today, and I'am not happy with any
solution I came up with.

On Wed, Jan 03, 2018 at 10:26:26PM +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed,  3 Jan 2018 22:08:51 +0100, Marcus Folkesson wrote:
> > `includedir` in libselinux.pc is set to $(PREFIX)/include if
> > not specified. This result in an incorrect include path when using
> > pkg-config.
> > 
> > Output from `pkg-config -cflags libselinux` without this patch:
> > -I/home/marcus/git/buildroot-ostree/output/host/bin/../mips64el-buildroot-linux-gnu/sysroot/home/marcus/git/buildroot-ostree/output/host/mips64el-buildroot-linux-gnu/sysroot/usr/include
> > -I/home/marcus/git/buildroot-ostree/output/host/bin/../mips64el-buildroot-linux-gnu/sysroot/usr/include
> > 
> > Output from `pkg-config -cflags libselinux` with this patch:
> > -I/home/marcus/git/buildroot-ostree/output/host/bin/../mips64el-buildroot-linux-gnu/sysroot/usr/include
> > 
> > This is normally not an issue unless the depending package is compiled
> > with `-Werror=missing-include-dirs` as it will be treated as an error.
> > 
> > Fixes:
> > http://autobuild.buildroot.net/results/680458dc049d2c286918aeed745515894f8fcefa/
> > 
> > Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> 
> Indeed, the .pc file currently installed is bogus.
> 
> > diff --git a/package/libselinux/0004-libselinux-introduce-PCPREFIX-substitute-variables-f.patch b/package/libselinux/0004-libselinux-introduce-PCPREFIX-substitute-variables-f.patch
> > new file mode 100644
> > index 0000000000..978d0591f3
> > --- /dev/null
> > +++ b/package/libselinux/0004-libselinux-introduce-PCPREFIX-substitute-variables-f.patch
> > @@ -0,0 +1,38 @@
> > +libselinux: introduce PCPREFIX substitute variable for .pc files
> > +
> > +`prefix` in the .pc file may be messed up when using a buildsystem
> > +that has specified a sysroot as DESTDIR.
> > +We need to make it possible to override the default `libdir`
> > +and `includedir`.
> > +
> > +`includedir` may be overridden by `INCLUDEDIR` but `libdir` is using
> > +`PREFIX` to setup the path.
> > +
> > +Therefore, introduce PCPREFIX to make it possible to generate a more
> > +customized .pc file.
> > +
> > +Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> > +
> > +--- libselinux.orig/src/Makefile	2018-01-03 21:44:49.548561421 +0100
> > ++++ libselinux/src/Makefile	2018-01-03 21:44:35.581894904 +0100
> > +@@ -9,9 +9,10 @@
> > + 
> > + # Installation directories.
> > + PREFIX ?= $(DESTDIR)/usr
> > ++PCPREFIX ?= $(DESTDIR)/usr
> > + LIBDIR ?= $(PREFIX)/lib
> > + SHLIBDIR ?= $(DESTDIR)/lib
> > +-INCLUDEDIR ?= $(PREFIX)/include
> > ++INCLUDEDIR ?= $(PCPREFIX)/include
> 
> Meh, this is messy :-/

Yeah.

> 
> Can we instead switch to using the correct semantic for DESTDIR and
> PREFIX ? I.e:
> 
>  - PREFIX defines where the program/library will be installed when
>    executed.
> 
>  - DESTDIR is only passed at installation, to divert the installation
>    to a specific folder.
> 
> I.e, for the target version, PREFIX=/usr DESTDIR=$(TARGET_DIR), and for
> the host version, PREFIX=$(HOST_DIR).

I have tried this but did not get it to compile properly.
I will look at this more tomorrow.

> 
> Using this correct semantic would be a lot more readable. Indeed, with
> your solution, one wonders why PCPREFIX is used for INCLUDEDIR but not
> LIBDIR.

No comment :-)

> 
> Could you have a look into this ?

Sure!

> 
> Thomas

I will try look more to make it right with PREFIX and DESTDIR.

Other solutions I have been looking at is to just set INCLUDEDIR.
`pkg-config --libs libselinux` will still report the messy path, but non
existing library paths is not an issue.
At least it is not worse than it is today.

Or just set OT_DEP_SELINUX_CFLAGS in libostree package to skip the whole
pkg-config thing for selinux. (libostree is the reason why I'm looking at this).

But both is quite hacky.

Thank you

Best regards
Marcus Folkesson
