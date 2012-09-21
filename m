From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Sep 2012 07:13:59 +0200
Subject: [Buildroot] [PATCH 10/11] toolchain/common: introduce blind
 options BR2_NEEDS_GETTEXT{, _IF_LOCALE}
In-Reply-To: <505B9786.9000509@mind.be>
References: <1347836276-24262-1-git-send-email-yann.morin.1998@free.fr>
 <1347836276-24262-11-git-send-email-yann.morin.1998@free.fr>
 <505B9786.9000509@mind.be>
Message-ID: <20120921071359.337a7876@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Fri, 21 Sep 2012 00:24:06 +0200, Arnout Vandecappelle wrote:

> diffutils: should be _IF_LOCALE
> flex: should be _IF_LOCALE
> gdk-pixbuf: indirect dependency through libglib2
> glib-networking: indirect dependency through libglib2
> libglib2: _really_ depends on libintl
> libsoup: indirect dependency through libglib2
> lshw: add -DNONLS to CFLAGS
> pulseaudio: indirect dependency through libglib2
> ndisc6: should be _IF_LOCALE
> php: gettext module obviously requires gettext
> util-linux: should be _IF_LOCALE
> 
> 
>   So, only two packages left that need gettext even without LOCALE: libglib2 and
> php.  For php: gettext doesn't make much sense without LOCALE, so we can depend
> on LOCALE there.  For libglib2: if you build that kind of bloat, you can live
> with the overhead of LOCALE, so I'd also depend on LOCALE there...

Ok. Just to make it clear: php itself does not depend on gettext, it's
only the gettext module that does. So even if we adopt your
solution, it remains to built the PHP interpreter with a toolchain that
doesn't have locale support, only building the gettext module will not
be possible, which indeed makes sense.

>   My proposal, therefore:
> 
> - only introduce BR2_NEEDS_GETTEXT_IF_LOCALE> ---
> 
> - Remove the NEEDS_GETTEXT part from the documentation
> 
> - we'll fix up these packages separately
> 
> - the patches for these packages are independent from patch 10/11 and 11/11
> (if the NEEDS_GETTEXT symbol is not introduced), so they can be produced
> in parallel.  Note that patch 9/11 is still in the way, but that's a
> mechanical change that should anyway be re-done prior to commit (in case
> a new package pops up using that symbol).

A full Acked-by from me on this approach. Thanks a lot for the in-depth
analysis of the problem that leads to this simplification, really great.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
