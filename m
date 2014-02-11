From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 11 Feb 2014 09:24:53 +0100
Subject: [Buildroot] [RFC PATCH] toolchain-external: instrument wrapper
 to warn about unsafe paths
In-Reply-To: <20140211062140.GE5170@tarshish>
References: <1392074881-12508-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20140211062140.GE5170@tarshish>
Message-ID: <20140211092453.431aa101@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Tue, 11 Feb 2014 08:21:40 +0200, Baruch Siach wrote:

> On Tue, Feb 11, 2014 at 12:28:01AM +0100, Thomas Petazzoni wrote:
> > The CodeSourcery toolchains have a very interesting feature: they warn
> > the user when an unsafe header or library path is used, i.e a path
> > that will lead host headers or libraries to leak into the build.
> > 
> > This commit adds a similar functionality into our external toolchain
> > wrapper, so that it can be used with all external toolchains, and can
> > also be tuned as needed. By default, the external toolchain wrapper
> > now gives warnings such as:
> > 
> >   WARNING: unsafe header/library path used in cross-compilation: '-I /usr/foo'
> >   WARNING: unsafe header/library path used in cross-compilation: '-L /usr/bleh'
> 
> I'd mention that this makes Buildroot builds under /usr even more problematic. 

Yes, this is true. Technically speaking, testing for -I/usr or -L/usr
is not the ideal way to achieve this. The ideal way would be to look if
only headers/libraries from the toolchain sysroot, and from the package
source tree are used. But this is fairly hard to achieve,
unfortunately. I am open to suggestions on how to achieve this.

But in any case, this mechanism will have to have a mechanism to be
entirely disabled.

> I thought this limitation appears in the documentation, but I can't find it 
> there now.

I don't think it's written in the documentation, but we have a bug
report for it, at https://bugs.busybox.net/show_bug.cgi?id=5750.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
