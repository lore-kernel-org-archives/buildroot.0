From: Atharva Lele <itsatharva@gmail.com>
Date: Mon, 16 Sep 2019 17:24:01 +0530
Subject: [Buildroot] [PATCH v2 2/2] toolchain/toolchain-wrapper: handle
 __FILE__ macro for reproducibility
In-Reply-To: <4675dbb2-7b28-3002-d18b-1760de956933@smile.fr>
References: <20190831180113.16025-1-itsatharva@gmail.com>
 <20190831180113.16025-2-itsatharva@gmail.com>
 <4675dbb2-7b28-3002-d18b-1760de956933@smile.fr>
Message-ID: <CABM+sgpPSEbWvbi36=tMPfnyC_GSTZ0QqhRSNdtQJ2YhB7WBbw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Sep 7, 2019 at 8:04 PM Romain Naour <romain.naour@smile.fr> wrote:
>
> Hi Atharva,
>
> Le 31/08/2019 ? 20:01, Atharva Lele a ?crit :
> > Many tools use __FILE__ for debugging and __FILE__ captures the build path.
> > This results in non-reproducible images when building in different directories.
>
> Based on the commit log in gcc adding this option [1], -ffile-prefix-map also
> remap file names in __BASE_FILE__ and __builtin_FILE().
>
> Specifying -ffile-prefix-map option is equivalent to specifying all the
> individual options -f*-prefix-map (-fmacro-prefix-map and -fdebug-prefix-map).
>
> [1]
> https://github.com/gcc-mirror/gcc/commit/859b51f83662d01e4f158ea9327db9ca37fe70b3
>
> >
> > If the config uses GCC 8 or above, we use -ffile-prefix-map=old=new and let gcc
> > take care of the path remapping in __FILE__. Since GCC versions before v8 did
> > not have this feature, we use a dummy string in that case.
> >
> > Signed-off-by: Atharva Lele <itsatharva@gmail.com>
> > ---
> > Changes v2:
> >   - New patch
> > ---
> >  toolchain/toolchain-wrapper.mk | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
> > index 88695a5b2d..6d0ae2c85b 100644
> > --- a/toolchain/toolchain-wrapper.mk
> > +++ b/toolchain/toolchain-wrapper.mk
> > @@ -23,6 +23,11 @@ TOOLCHAIN_WRAPPER_OPTS = \
> >
> >  ifeq ($(BR2_REPRODUCIBLE),y)
> >  TOOLCHAIN_WRAPPER_OPTS += -Wl,--build-id=none
> > +ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_8),y)
> > +TOOLCHAIN_WRAPPER_OPTS += -ffile-prefix-map=$(BASE_DIR)=buildroot
> > +else
> > +TOOLCHAIN_WRAPPER_OPTS += -D__FILE__=\"file-path-replaced-by-buildroot-for-reproducibility\"
>
> Maybe __BASE_FILE__ should be handle here too in order to have the save
> behaviour as -ffile-prefix-map.

You're right. I will update the patch to handle __BASE__FILE__ as well.

> I'm not sure about __builtin_FILE().

I'm not sure either.. maybe we should keep it as is for now.
Arnout, any thoughts on this?
>
> Best regards,
> Romain
>
> > +endif
> >  endif
> >
> >  # We create a list like '"-mfoo", "-mbar", "-mbarfoo"' so that each flag is a
> >
>


-- 
Regards,
Atharva Lele
