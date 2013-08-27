From: James Potts <bg@pottsylvania.com>
Date: Tue, 27 Aug 2013 21:21:53 +0000 (UTC)
Subject: [Buildroot] Kernel download problem.
References: <25A17A429F5A404F8323F087DD6980C4@JohanW7>
 <20130614194141.24ed6dee@skate>
Message-ID: <loom.20130827T231336-119@post.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni@...> writes:

> On Fri, 14 Jun 2013 12:02:44 +0200, Sagaert Johan wrote:
> 
> > There seems to be a problem with the downloading of a kernel when a 
longterm release is selected.
> > 
> > Buildroot tries 
> > 
> > http://www.kernel.org/pub//linux/kernel/v2.6/linux-2.6.34.14.tar.xz 
> > 
> > While the real kernel is at 
> > https://www.kernel.org/pub/linux/kernel/v2.6/longterm/v2.6.34/linux-
2.6.34.14.tar.xz
> > 
> > So maybe it should be copied to the buildroot sources mirror.
> 
> Could you show which Buildroot configuration exhibits the problem? From
> a quick look, the only way for Buildroot to be told to use 2.6.34.14 is
> by specifying a custom kernel version. And in this case, it's the user
> responsibility to make sure the URL is correct. Why would we keep
> 2.6.34.14 in our mirror specifically and not the myriad of other kernel
> versions that the user may select?

Sorry to respond to an older post, but I just ran into the same problem.  
The issue here is how you specify the kernel.  When not using the default 
version, we have the option of "Custom version" or "Custom tarball."  When 
you choose "Custom version" it asks you to fill in the version number, and 
it builds the URL for downloading from kernel.org.  But this only works for 
non-longterm kernels.

I.e, if I choose "Custom version" and specify "2.6.34.6" as the version, 
everything works as expected.  But if I choose "2.6.34.12" as the version, 
buildroot breaks, because it doesn't build the correct URL.

Mind you, this is due to silliness on the part of the kernel.org maintainers 
IMO, for splitting different kernel sub-versions into different directories.

Regardless, buildroot currently doesn't do what's expected, since you can't 
just type in a kernel version and expect it to work.  It would be nice if it 
either (a) knew where to find the various "longterm" kernels, or (b) gave a 
warning that you might need to locate the kernel, and specify the URL under 
the "Custom tarball" option.

-Jim
