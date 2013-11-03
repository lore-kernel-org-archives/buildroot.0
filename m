From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 3 Nov 2013 12:06:13 +0100
Subject: [Buildroot] [PATCH] util-linux: disable fallocate for avr32
In-Reply-To: <20131103113407.2b5cf76c@skate>
References: <1383472585-1876-1-git-send-email-spdawson@gmail.com>
 <20131103113407.2b5cf76c@skate>
Message-ID: <20131103110613.GB3615@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Simon, Thomas, All,

On 2013-11-03 11:34 +0100, Thomas Petazzoni spake thusly:
> On Sun,  3 Nov 2013 09:56:25 +0000, spdawson at gmail.com wrote:
> > From: Simon Dawson <spdawson@gmail.com>
> > 
> > The fallocate syscall is not implemented in the avr32 toolchain.
> > 
> > Fixes build failures such as the following.
> > 
> >   http://autobuild.buildroot.net/results/bc4/bc41a3fea20181526eb247ac910244aa2aa4c4c0/
> > 
> > Signed-off-by: Simon Dawson <spdawson@gmail.com>
> > ---
> >  package/util-linux/Config.in | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
> > index 41e0986..d56e631 100644
> > --- a/package/util-linux/Config.in
> > +++ b/package/util-linux/Config.in
> > @@ -72,6 +72,7 @@ config BR2_PACKAGE_UTIL_LINUX_EJECT
> >  
> >  config BR2_PACKAGE_UTIL_LINUX_FALLOCATE
> >  	bool "fallocate"
> > +	depends on !BR2_avr32 # fallocate not implemented
> >  	help
> >  	  Preallocate space to a file
> >  
> 
> Situation is a bit fuzzy here.
> 
> We have added a patch to uClibc that implements fallocate support:
> package/uclibc/0.9.33.2/uclibc-0041-libc-add-posix_fallocate.patch. So
> internal toolchains based on 0.9.33.2 should now have fallocate support.
> 
> However:
> 
>  * The AVR32 toolchain used in the autobuilders predates the addition
>    of this patch, and therefore does not have the fallocate support
>    (the autobuilders uses a Buildroot generated toolchain, but
>    generated with Buildroot 2013.05).
> 
>  * The AVR32 support at the moment is using 0.9.33.2, but you told us
>    that 0.9.33.2 is basically not working properly on AVR32, and that
>    reverting to 0.9.31 was the only solution to get a working AVR32
>    system. This would indeed mean that fallocate support would not be
>    available on AVR32 (but it would more be related to the uClibc
>    version rather than the architecture).
> 
>  * A larger problem that I have already raised several times is that
>    adding feature patches to the uClibc package in Buildroot is causing
>    issues with external toolchain support for uClibc toolchains. These
>    external toolchains are very unlikely to carry the same backported
>    feature patches as we do, and therefore the build will break with
>    those external toolchains if Buildroot relies on uClibc having those
>    features.
> 
> I'm Cc'ing Arnout, Peter, Yann and Thomas DS on this one, because we
> really need to define a policy on this topic.

Our stance has always been 'no feature-patch in Buildroot'.
OTOH, I can understand that fallocate is really required (being in
POSIX).

But since uClibc is highly configurable, it could happen that an
external toolchain would have fallocate disabled (being in Advanced
RT in POSIX).

So, I'm a bit fuzzy as to what we should do here.

The best approach would be to push all of our changes upstream uClibc,
and hope for a release soon, so we can bump. But it looks like upstream
is not really alive those days.

Another approach would be to add yet one more toolchain knob that tells
whether the toolchain has fallocate (defaults to 'y' for (e)glibc and
internal, prompts for external uClibc).

My preference would be to remove feature-patches, but that is really
gonna hurt newcomers (and may bite long-timers as well).

In the end, I'm not much of any help on that one, sorry... :-(

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
