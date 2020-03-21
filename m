From: Carlos Santos <unixmania@gmail.com>
Date: Sat, 21 Mar 2020 19:18:08 -0300
Subject: [Buildroot] [[PATCH RFC] 3/6] linux: run depmod in a
 target-finalize hook
In-Reply-To: <20200321205141.GJ4290@scaer>
References: <20200320233547.28586-1-unixmania@gmail.com>
 <20200320233547.28586-4-unixmania@gmail.com>
 <20200321205141.GJ4290@scaer>
Message-ID: <CAJ4jsaeQWUwoW0UE1xU=96L6YieMyBCsDAcxyz5aDbnrbGONLw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Mar 21, 2020 at 5:51 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> CAlros, All,
>
> On 2020-03-20 20:35 -0300, unixmania at gmail.com spake thusly:
> > From: Carlos Santos <unixmania@gmail.com>
> >
> > If a package installs a kernel module then it's necessary to run depmod
> > afterwards, otherwise modprobe fails at run-time, because the module is
> > not included in /lib/modules/<kernel-version>/modules.dep.
> >
> > Pass a dummy depmod (/dev/null) to the kernel build, since we don't want
> > to run depmod after installing the kernel.
> >
> > Signed-off-by: Carlos Santos <unixmania@gmail.com>
> > ---
> >  linux/linux.mk | 11 ++++++++++-
> >  1 file changed, 10 insertions(+), 1 deletion(-)
> >
> > diff --git a/linux/linux.mk b/linux/linux.mk
> > index f8c34c3dca..a5756148cc 100644
> > --- a/linux/linux.mk
> > +++ b/linux/linux.mk
> > @@ -127,12 +127,14 @@ LINUX_POST_EXTRACT_HOOKS += LINUX_XTENSA_OVERLAY_EXTRACT
> >  LINUX_EXTRA_DOWNLOADS += $(ARCH_XTENSA_OVERLAY_URL)
> >  endif
> >
> > +# We don't want to run depmod after installing the kernel. It's done in a
> > +# target-finalize hook, to encompass modules installed by packages.
> >  LINUX_MAKE_FLAGS = \
> >       HOSTCC="$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS)" \
> >       ARCH=$(KERNEL_ARCH) \
> >       INSTALL_MOD_PATH=$(TARGET_DIR) \
> >       CROSS_COMPILE="$(TARGET_CROSS)" \
> > -     DEPMOD=$(HOST_DIR)/sbin/depmod
> > +     DEPMOD="/dev/null"
>
> This causes a spurious, confusing warning:
>
>      DEPMOD  5.4.27
>     ./scripts/depmod.sh: 46: /dev/null: Permission denied
>     make[2]: *** [Makefile:1326: _modinst_post] Error 126
>
> Since that call does not cost musch, I've restored it, and applied to
> master with an extended commit log. Thanks.
>
> Regards,
> Yann E. MORIN.

We can avoid the script by using

    DEPMOD=/bin/false \
    cmd_depmod=":"

So cmd_depmod ensures that the script does not run; DEPMOD=/bin/false
is as a canary, failing if cmd_depmod does not work in a future kernel
version.

-- 
Carlos Santos <unixmania@gmail.com>
