From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Tue, 28 Feb 2017 10:22:40 +1100
Subject: [Buildroot] [RFC PATCH 1/2] package/gobject-introspection: add
 package
In-Reply-To: <20170227150637.ljo2c6dv3izstddn@tarshish>
References: <cover.1487811280.git.sam.bobroff@au1.ibm.com>
 <b5cbc35d4d8e4457563fdf5b8dfd04360c6616a5.1487811280.git.sam.bobroff@au1.ibm.com>
 <20170223101820.127d5700@free-electrons.com>
 <20170224040713.GA4446@tungsten.ozlabs.ibm.com>
 <20170224092549.2c560db3@free-electrons.com>
 <8eeadd56-4c2b-94ff-c182-50e18e81f749@mind.be>
 <20170227150637.ljo2c6dv3izstddn@tarshish>
Message-ID: <20170227232240.GB2535@tungsten.ozlabs.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 27, 2017 at 05:06:37PM +0200, Baruch Siach wrote:
> Hi Arnout,
> 
> On Mon, Feb 27, 2017 at 03:58:54PM +0100, Arnout Vandecappelle wrote:
> > On 24-02-17 09:25, Thomas Petazzoni wrote:
> > > On Fri, 24 Feb 2017 15:07:13 +1100, Sam Bobroff wrote:
> > > 
> > >> Yes, absolutely, and I really don't know how we should handle it. I
> > >> searched fairly hard for another solution but the only other one seems
> > >> to be to rewrite gobject-introspection completely and the other
> > >> projects that have attempted this have used the same host-qemu approach
> > >> (that's yocto and cygwin).
> > > Can you summarize what is Qemu used for in the context of building
> > > gobject-introspection ?
> > > 
> > > If it's to generate some architecture-specific file, can we
> > > pre-generate it, and bundle it with Buildroot ?
> > 
> >  As far as I can see, it just runs ldd under qemu, to find the paths to the
> > libraries that will actually be used (i.e., the libraries that have to be
> > introspected, I guess). That's why Jerome suggested to use his cross-ldd
> > scriptlet [1], which would also work with musl and uClibc.
> > 
> >  However, as far as I understand, it really only needs to find a list of shared
> > libraries used by a program. In our case, instead of going through ldd, we can
> > just use readelf because there is normally only a single instance of each SONAME
> > in the target.
> 
> My understanding is that the process is more involved than that. Quoting the 
> Yocto summary[1]:
> 
>   The data is generated when building such a library, by linking the library 
>   with a small executable binary that asks the library to describe itself, 
>   then executing the binary and processing its output.
> 
> I didn't verify this myself yet.
> 
> [1] https://lists.yoctoproject.org/pipermail/yocto/2016-April/029579.html
> 
> baruch

That matches my understanding too, and I can add a little bit that I've
deduced by trying to build it:

It operates in two modes: one for libraries and one for binaries.

For binaries, they must be compiled and linked against
gobject-introspection and some function calls added to get access to
argv[], then when the "scanner" is run it executes the target and passes
some magic command line options which trigger those functions to output
the introspection data.

For libraries, it begins by running "ldd" on them and scraping the
output but I'm not sure what happens after that.

In both cases the data that's gathered is target-specific and can't be
generated on a different arch.

To complicate things gobject-introspection uses it's scanner on itself
as part of it's own build process.

So the problems aren't strictly do do with compiling, but with the build
process as a whole. And the real fix is probably to re-design
gobject-introspection so that it can "cross-inspect" data but the
problem with any redesign is that a lot of packages use it so any
change would require all of them to change. When I was digging around
the 'net looking for solutions I found people complaining about this
cross-build problem with it's design from years ago so it doesn't look
like it's going to be changed any time soon.

So what I've done is first build gobject-introspection for the host,
unaltered. We don't need to run it on any host binaries but we need a
gobject-introspection that can run on the host. We patch the binary so
that we have a way to get it to use QEMU to run ldd (that's ldd-cross)
or QEMU to run binaries directly. We don't use this to build the host
version, however. (Oddly, upstream have accepted a patch to add a wrapper
for binaries but not for libraries. Probably because running the
target's 'ldd' directly under QEMU usermode doesn't work -- that's why
I had to add the ldd-cross script.)

Then I fake a staging install by manually creating scripts with the
names of the scanner and other tools, and the scripts invoke the host
tools with the wrappers activated, so they can analyse target binaries.

Using this staging version we can build a native target version. We need
this because target executables that use gobject-introspection have
linked against it. We won't ever use the gi code in these target
versions, on the target, it's just using during the cross building but
they won't run later on the real target if they can't link.

Now we can use the real target verion's libaries to link binaries and the
staging wrapped cross-version to analyse them. As long as the house
of cards stays up it works ;-)

As I said before I feel quite conflicted about this overall -- it's
necessary for so many packages but it's easy to break and when it does
it can be very hard to debug (for example, I hit a bug in QEMU usermode
and it's pretty hard to debug that deep inside cross building!).

Apart from that, it has been so laborious just to get this much working
that I feel a lot of empathy for the poor souls who run into
cross compiling gobject-introspeciton themselves... So I want to help
them if I can ;-)

Cheers,
Sam.
