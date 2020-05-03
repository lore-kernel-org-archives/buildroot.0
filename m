From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 3 May 2020 14:11:01 +0200
Subject: [Buildroot] [PATCH] package/kmod - fix host build dependecies
In-Reply-To: <D9E5771A-69D4-4D5F-98AB-8E408976E4CB@gmail.com>
References: <20200503075401.GU15673@scaer>
 <D9E5771A-69D4-4D5F-98AB-8E408976E4CB@gmail.com>
Message-ID: <20200503121101.GX15673@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Lucian, All,

On 2020-05-03 12:13 +0300, Lucian Buga spake thusly:
> To be more precise, the patch fixes the host depmod utility from kmod
> package. 

Exactly.

> Host depmod runs in target-finalize and in will create emty modules.dep
> if not buit with compression support.
> 
> So the issue is not insmod/modprobe on target. 

But the two are linked, in fact: if insmod/modprobe on target do not
have compression support, they would not be able to load compresed
modules. As a consequence, we don't care that the host variant was able
to generate a modules.dep or not.

But really, the problem is even deeper than that: the target kmod
package may very well be missing, if busybox' implementation is used.
Adn that too supports compressed modules. So if the kernel compresses
its installed modules, and busybox is used (instead of kmod) on the
target, then the host-kmod, which is still built, will not generate a
proper modules.dep.

So in the end, we _do_ have to decorelate the host compression support
from the target ones.

And we're  back to the point we were two years ago when I initially
proposed that: if we unconditionally build host-kmod with compression
support, this is an overhead that is paid by everyone, for the benefit
of the few who wants compressed modules.

So, I'm marling your patch as changes-requested because it indeed does
not work.

Please, could you have a look at the branch I linked to earlier, to see
if it would fir your needs:
    https://git.buildroot.org/~ymorin/git/buildroot/log?h=yem/host-kmod

Regards,
Yann E. MORIN.

> Regards,
> Lucian
> 
> > On 3 May 2020, at 10:54, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > 
> > ?Lucian, All,
> > 
> > +Thomas +Peter: question for you.
> > 
> > On 2020-05-03 09:51 +0300, Lucian Buga spake thusly:
> >> When kernel is configured with CONFIG_MODULE_COMPRESS, host-kmod must
> >> be built with zlib / xz support to be able to properly generate
> >> dependency files for target.
> >> Signed-off-by: Lucian Buga <lucianbuga@gmail.com>
> >> ---
> >> package/kmod/kmod.mk | 4 ++++
> >> 1 file changed, 4 insertions(+)
> >> diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
> >> index e2dfea5c7b..7149658ac7 100644
> >> --- a/package/kmod/kmod.mk
> >> +++ b/package/kmod/kmod.mk
> >> @@ -35,11 +35,15 @@ endif
> >> ifeq ($(BR2_PACKAGE_ZLIB),y)
> >> KMOD_DEPENDENCIES += zlib
> >> KMOD_CONF_OPTS += --with-zlib
> >> +HOST_KMOD_DEPENDENCIES += host-zlib
> >> +HOST_KMOD_CONF_OPTS += --with-zlib
> > 
> > At first, I was going to say that this was incorrect, because support
> > for gz/xz on the target should not mandate whether the host variant has
> > such support of not.
> > 
> > However, it is my understanding that the uncompressing of modules is
> > done by the modprobe/insmod, and the uncompressed blurb is handled to
> > the kernel.
> > 
> > If that is true, then indeed, this patch makes sense:
> > 
> > - if the target variant does not have compression support, then it
> >   will not be able to load compresed modules, so it would be useless
> >   or the host variant to have compression support,
> > 
> > - if the target variant has compression support, then it may have to
> >   handle compressed modules, and thus the host variant must have
> >   ompression support.
> > 
> > So this patch kinda makes sense in the end.
> > 
> > However, there is still a gotcha: the kernel can be configured to
> > compress modules on installation, and that is (in Buildroot) orthogonal
> > with the selection of BR2_PACKAGE_ZLIB or BR2_PACKAGE_XZ.
> > 
> > So, it would be invaliud, but possible to have a Buildroot configuration
> > that contains:
> > 
> >   # BR2_PACKAGE_ZLIB is not set
> >   # BR2_PACKAGE_XZ is not set
> > 
> > while at the same time having a kernel configuration that contains:
> > 
> >   CONFIG_MODULE_COMPRESS=y
> >   CONFIG_MODULE_COMPRESS_GZIP=y  (or XZ, you get the point)
> > 
> > To address this problem, I did a 6-patch series two years ago:
> >   https://git.buildroot.org/~ymorin/git/buildroot/log?h=yem/host-kmod
> > 
> > I just rebased it, but I did not pursue this endeavour much further than
> > just posting it once...
> > 
> > I think your patch is good, but I'd like some feedback from Thomas or
> > Peter. Or any other that can confirm who is responsible for
> > uncompressing kernel modules on load...
> > 
> > Regards,
> > Yann E. MORIN.
> > 
> >> endif
> >> ifeq ($(BR2_PACKAGE_XZ),y)
> >> KMOD_DEPENDENCIES += xz
> >> KMOD_CONF_OPTS += --with-xz
> >> +HOST_KMOD_DEPENDENCIES += host-xz
> >> +HOST_KMOD_CONF_OPTS += --with-xz
> >> endif
> >> ifeq ($(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),y)
> >> --
> >> 2.17.1
> >> _______________________________________________
> >> buildroot mailing list
> >> buildroot at busybox.net
> >> http://lists.busybox.net/mailman/listinfo/buildroot
> > 
> > -- 
> > .-----------------.--------------------.------------------.--------------------.
> > |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> > | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> > | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> > | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> > '------------------------------^-------^------------------^--------------------'

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
