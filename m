From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 21 Sep 2012 00:24:06 +0200
Subject: [Buildroot] [PATCH 10/11] toolchain/common: introduce blind
 options BR2_NEEDS_GETTEXT{, _IF_LOCALE}
In-Reply-To: <1347836276-24262-11-git-send-email-yann.morin.1998@free.fr>
References: <1347836276-24262-1-git-send-email-yann.morin.1998@free.fr>
 <1347836276-24262-11-git-send-email-yann.morin.1998@free.fr>
Message-ID: <505B9786.9000509@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/17/12 00:57, Yann E. MORIN wrote:
> Introduce two new blind config options:
>    - BR2_NEEDS_GETTEXT
>          selects the gettext package if the toolchain does not provide it
>    - BR2_NEEDS_GETTEXT_IF_LOCALE
>          ditto, but only if locales are enabled

  There are 18 packages that use NEEDS_GETTEXT_IF_LOCALE, and 11 packages that
use NEEDS_GETTEXT.  However, for most of the latter, it looks like it should
be an _IF_LOCALE dependency.  Therefore, I think it's better to remove the
BR2_NEEDS_GETTEXT support and leave it explicit for these packages.  We can
fix those 11 packages (now or later).  Here's an initial analysis:

diffutils: should be _IF_LOCALE
flex: should be _IF_LOCALE
gdk-pixbuf: indirect dependency through libglib2
glib-networking: indirect dependency through libglib2
libglib2: _really_ depends on libintl
libsoup: indirect dependency through libglib2
lshw: add -DNONLS to CFLAGS
pulseaudio: indirect dependency through libglib2
ndisc6: should be _IF_LOCALE
php: gettext module obviously requires gettext
util-linux: should be _IF_LOCALE


  So, only two packages left that need gettext even without LOCALE: libglib2 and
php.  For php: gettext doesn't make much sense without LOCALE, so we can depend
on LOCALE there.  For libglib2: if you build that kind of bloat, you can live
with the overhead of LOCALE, so I'd also depend on LOCALE there...


  My proposal, therefore:

- only introduce BR2_NEEDS_GETTEXT_IF_LOCALE> ---

- Remove the NEEDS_GETTEXT part from the documentation

- we'll fix up these packages separately

- the patches for these packages are independent from patch 10/11 and 11/11
(if the NEEDS_GETTEXT symbol is not introduced), so they can be produced
in parallel.  Note that patch 9/11 is still in the way, but that's a
mechanical change that should anyway be re-done prior to commit (in case
a new package pops up using that symbol).


  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
