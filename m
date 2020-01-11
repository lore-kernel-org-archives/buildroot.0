From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Jan 2020 17:08:45 +0100
Subject: [Buildroot] [PATCH 1/1] package/poppler: really disable test
 programs
In-Reply-To: <CAPi7W80=Gn0SsFg0MWDBiJYd2DLriDredJYcbYGVpBjw6jXhfA@mail.gmail.com>
References: <20200111115054.864819-1-fontaine.fabrice@gmail.com>
 <20200111153537.66974300@windsurf>
 <CAPi7W80=Gn0SsFg0MWDBiJYd2DLriDredJYcbYGVpBjw6jXhfA@mail.gmail.com>
Message-ID: <20200111170845.1239c29a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 11 Jan 2020 15:44:44 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> > What is the problem with C++ executables, since poppler depends on C++
> > anyway ?
> >
> > Of course, it is good to disable building tests if possible, but I'm
> > just curious to understand the motivation for the change: did you
> > encounter a build failure? Or it is just that you realized the tests
> > were being built while they should not?  
> Following your comment on the leveldb patch that was fixing the
> -latomic build failure, I'm going through the different -latomic
> workarounds used in the cmake packages.
> I'm trying to replace these workarounds by upstreamable patches.
> However, in some cases such as libraries (like poppler) these
> workarounds/patches are not strictly needed if we don't build any
> executable.

It's not true: if libpoppler.so uses some symbols that are defined in
libatomic.so, then it should link against libatomic.so (i.e
libpoppler.so should have a DT_NEEDED entry for libatomic.so).
Otherwise any application linking against libpoppler.so will have to
know that it should also link against libatomic.so, which is not good.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
