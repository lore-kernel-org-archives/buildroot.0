From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 May 2019 11:17:07 +0200
Subject: [Buildroot] [PATCH v2 1/1] linux: xenomai: allow URL for the
 ADEOS/IPIPE patch
In-Reply-To: <20190518220632.312f98da@windsurf>
References: <20190517125049.15774-1-sebastien.szymanski@armadeus.com>
 <20190518220632.312f98da@windsurf>
Message-ID: <20190519091707.GB4569@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, S?bastien, All,

On 2019-05-18 22:06 +0200, Thomas Petazzoni spake thusly:
> On Fri, 17 May 2019 14:50:49 +0200
> S?bastien Szymanski <sebastien.szymanski@armadeus.com> wrote:
> > diff --git a/linux/linux-ext-xenomai.mk b/linux/linux-ext-xenomai.mk
> > index d066bb32ac..ed29943e6c 100644
> > --- a/linux/linux-ext-xenomai.mk
> > +++ b/linux/linux-ext-xenomai.mk
> > @@ -8,10 +8,20 @@ LINUX_EXTENSIONS += xenomai
> >  
> >  # Adeos patch version
> >  XENOMAI_ADEOS_PATCH = $(call qstrip,$(BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH))
> > +
> > +ifneq ($(filter ftp://% http://% https://%, $(XENOMAI_ADEOS_PATCH)),)
> > +XENOMAI_ADEOS_PATCH_NAME = $(notdir $(XENOMAI_ADEOS_PATCH))
> > +XENOMAI_ADEOS_PATCH_PATH = $(LINUX_DL_DIR)/$(XENOMAI_ADEOS_PATCH_NAME)
> > +LINUX_EXTRA_DOWNLOADS += $(XENOMAI_ADEOS_PATCH)
> > +BR_NO_CHECK_HASH_FOR += $(XENOMAI_ADEOS_PATCH_NAME)
> > +else
> > +XENOMAI_ADEOS_PATCH_PATH = $(subst file://,,$(XENOMAI_ADEOS_PATCH))
> 
> I don't feel super strongly about this, but everywhere else in
> Buildroot when paths are specified through configuration options, we do
> not support having a file:// URI. For example the
> BR2_LINUX_KERNEL_PATCH option will support file paths only without
> file://.
> 
> So for consistency, I would do the same here, and therefore just do:
> 
> XENOMAI_ADEOS_PATCH_PATH = $(XENOMAI_ADEOS_PATCH)
> 
> Yann, what do you think ?

Indeed, I don't see the point in the file:// scheme. I don't even see
people really using it routinely.

But as far as I can see, the above, although wrong, does not require
that the file:// prefix be used. If it is there, it is scrubbed;
otherwise the filename is used as-is.

And it is wrong, because it should only remove it at the beginning.
$(subst ...) would remove it anywhere. So if we were to use it (and I
think we should not), we'd have to use $(patsubst ...) instead;
    XENOMAI_ADEOS_PATCH_PATH = $(patsubst file://%,%,$(XENOMAI_ADEOS_PATCH))

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
