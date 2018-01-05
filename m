From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 5 Jan 2018 08:29:32 -0600
Subject: [Buildroot] [PATCH] libselinux: add patch to create a proper
 pkg-config file
In-Reply-To: <20180103221529.GA27551@gmail.com>
References: <20180103210851.26851-1-marcus.folkesson@gmail.com>
 <20180103222626.305ff910@windsurf.lan> <20180103221529.GA27551@gmail.com>
Message-ID: <CANQCQpaktisuCN6Ku8G=2f_fj4bjOW_1dc0jeWZemgFP+=+y9g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Marcus,

On Wed, Jan 3, 2018 at 4:15 PM, Marcus Folkesson
<marcus.folkesson@gmail.com> wrote:
>
> On Wed, Jan 03, 2018 at 10:26:26PM +0100, Thomas Petazzoni wrote:
> > Hello,
> >
[snip]
> > > + # Installation directories.
> > > + PREFIX ?= $(DESTDIR)/usr
> > > ++PCPREFIX ?= $(DESTDIR)/usr
> > > + LIBDIR ?= $(PREFIX)/lib
> > > + SHLIBDIR ?= $(DESTDIR)/lib
> > > +-INCLUDEDIR ?= $(PREFIX)/include
> > > ++INCLUDEDIR ?= $(PCPREFIX)/include
> >
> > Meh, this is messy :-/
>
> Yeah.
>
> >
> > Can we instead switch to using the correct semantic for DESTDIR and
> > PREFIX ? I.e:
> >
> >  - PREFIX defines where the program/library will be installed when
> >    executed.
> >
> >  - DESTDIR is only passed at installation, to divert the installation
> >    to a specific folder.
> >
> > I.e, for the target version, PREFIX=/usr DESTDIR=$(TARGET_DIR), and for
> > the host version, PREFIX=$(HOST_DIR).
>

This was really similar to some of the other selinux packages I've had
to deal with prefix/destdir on, so I took a try at resolving the
target piece of this (didn't look at the host build).  What I noticed
is I was getting double include paths, even when the raw PC file looks
correct.  Examples below

++++++Proposed patch++++++
https://nopaste.xyz/?c89837863d676de5#0lBP2mX+omzeRvLYNmvgHjxy/ZE1DZcM+21dK2UKVO8=

+++++Raw libselinux.pc file it generates++++++
prefix=/usr
exec_prefix=${prefix}
libdir=${exec_prefix}/lib
includedir=/usr/include

Name: libselinux
Description: SELinux utility library
Version: 2.7
URL: http://userspace.selinuxproject.org/
Requires.private: libsepol libpcre
Libs: -L${libdir} -lselinux
Cflags: -I${includedir}

++++Output from `output/host/bin/pkg-config -cflags libselinux` using
my patch.  The initial include looks correct now, but I can't find how
I'm getting the second.....++++++
-Ioutput/host/bin/../mips64el-buildroot-linux-gnu/sysroot/usr/include
-Ioutput/host/bin/../mips64el-buildroot-linux-gnu/sysroot/nvme/rc-buildroot-hardening/output/host/mips64el-buildroot-linux-gnu/sysroot/usr/include


Matt
