From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Thu, 09 Aug 2018 10:24:59 +0200
Subject: [Buildroot] [Buildroot & ArchLinux] can not build host-m4 on
 machine with glibc-2.28 installed
In-Reply-To: <20180808225558.GB3148@momiji>
References: <20180808031502.GE1085@techyauld.com>
 <87lg9gg8sg.fsf@dell.be.48ers.dk> <20180808225558.GB3148@momiji>
Message-ID: <87c75540d51a0d520aa7e8549eaa51b36bb35aeb.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Adrian,

On Wed, 2018-08-08 at 22:55 +0300, Adrian Perez de Castro wrote:
> Hello,
> 
> On Wed, 08 Aug 2018 17:47:11 +0200, Peter Korsgaard <peter@korsgaard.com> wrote:
> > > > > > > "?" == ? ? <yzheng@techyauld.com> writes:
> > 
> > Please mail the buildroot mailing list and not individual contributors,
> > thanks!
> > 
> >  > Hi,
> >  > 	I found that failure and do some hacking.
> > 
> >  > 	(1) m4 source, lib/freadahead.c: It use the internal symbols to guess the C runtime lib's type.
> > 
> >  > 	(2) glibc-2.28 removed the header file /usr/include/bits/libio.h.
> >  > 	    In fact, libio.h seems an internal header. The content of it has been
> >  > 	    moved into <glibc source>/libio/libio.h, which is not installed.
> > 
> > 
> >  > 	Anyone can help me out? M4 has not released new version since 1.4.18(2016-12-31).
> > 
> >  > Allan,
> >  > 	It seems that that bug will hit our lovely ArchLinux!
> > 
> > What is the build failure you are seeing exactly? Looking around, it
> > seems linuxfromscratch has some workarounds for building against
> > glibc-2.28, perhaps we can do the same?
> > 
> > http://www.linuxfromscratch.org/lfs/view/development/chapter05/m4.html
> 
> I don't have a build log at hand, but the gnulib sources would complain e.g.
> that ?freadahead()? is unimplemented for the current target platform, and its
> source would ?#error?. I have a crappy local patch which patches a few files
> from gnulib to the most recent version available in the repository. I also
> have a similar one for Bison, but they are a bit crappy and should be done
> properly, updating all gnulib bits that the packages use instead of just the
> bare minimum to make things work (see the attached patches, you can drop them
> in a local patches directory).
> 
> Also: gnulib is horrible, and I am baffled that it's still being used in
> 2018... I refuse to think that something like M4 or Bison (which basically
> process some input text and generate some output text) needs functions from
> gnulib which rely on the internals of the system C library. It was quite
> disheartening for me to find out this ~_~
> 
> Regards,
> 
> -Adri?n

I've tested your m4 patch and it works for me (Arch Linux).

Best regards,
J?rg Krause
