From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 1 May 2015 23:35:46 +0200
Subject: [Buildroot] [PATCH 6/7] linux: do not check hashes for custom
 versions and tarballs
In-Reply-To: <554380DB.40503@mind.be>
References: <cover.1430260630.git.yann.morin.1998@free.fr>
 <f033e301266baba536c3d63902cc2439e45eb3a4.1430260630.git.yann.morin.1998@free.fr>
 <554380DB.40503@mind.be>
Message-ID: <20150501213546.GI4206@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-05-01 15:34 +0200, Arnout Vandecappelle spake thusly:
>  Hah, this is a tough one...
> 
>  With the combination BR2_LINUX_SAME_AS_HEADERS and BR2_KERNEL_HEADERS_VERSION
> you can still get a custom version...
> 
>  So I'm thinking if it wouldn't be simpler to just always disable the hash:
> BR_NO_CHECK_HASH_FOR += $(LINUX_SOURCE)
> 
>  Note that the hash, if it exists, will still be checked; it just won't be an
> error if the hash doesn't exist (so the variable is not named very accurately in
> fact). Therefore I think it's safe to disable it completely for linux. Or, if
> you prefer you can make it depend on !BR2_LINUX_KERNEL_LATEST_VERSION &&
> !(BR2_LINUX_SAME_AS_HEADERS && !BR2_KERNEL_HEADERS_VERSION) (good luck
> expressing that in make syntax :-).

Well, it seems it was pretty easy to do in the end (when onlt excluding
what needs be, and not everyting), though a bit redundant:

    ifeq ($(BR2_LINUX_KERNEL_CUSTOM_VERSION),y)
    BR_NO_CHECK_HASH_FOR += $(LINUX_SOURCE)
    endif
    ifeq ($(BR2_LINUX_KERNEL_SAME_AS_HEADERS)$(BR2_KERNEL_HEADERS_VERSION),yy)
    BR_NO_CHECK_HASH_FOR += $(LINUX_SOURCE)
    endif

OK, that's not very nice either, but the code is simple enough, and
splits unrelated parts apart.

> On 29/04/15 00:40, Yann E. MORIN wrote:
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > ---
> >  linux/linux.mk | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/linux/linux.mk b/linux/linux.mk
> > index 0c348da..959c564 100644
> > --- a/linux/linux.mk
> > +++ b/linux/linux.mk
> > @@ -13,8 +13,10 @@ ifeq ($(BR2_LINUX_KERNEL_CUSTOM_TARBALL),y)
> >  LINUX_TARBALL = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION))
> >  LINUX_SITE = $(patsubst %/,%,$(dir $(LINUX_TARBALL)))
> >  LINUX_SOURCE = $(notdir $(LINUX_TARBALL))
> > +BR_NO_CHECK_HASH_FOR += $(LINUX_SOURCE)
> >  else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_LOCAL),y)
> >  LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_LOCAL_PATH))
> > +# For 'local', there is no hash check, so no need to set BR_NO_CHECK_HASH_FOR
> 
>  Why do you add that comment here and not in the VCS cases? I don't think it is
> needed, move it to the commit message.

Besides, it is really wrong: there can't be hash checks, because this
is not am archive, but a directory that is rsync-ed. Comment dropped.
Thanks! :-)

Regards,
Yann E. MORIN.

>  Regards,
>  Arnout
> 
> >  LINUX_SITE_METHOD = local
> >  else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_GIT),y)
> >  LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_URL))
> > @@ -24,6 +26,9 @@ LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_URL))
> >  LINUX_SITE_METHOD = hg
> >  else
> >  LINUX_SOURCE = linux-$(LINUX_VERSION).tar.xz
> > +ifeq ($(BR2_LINUX_KERNEL_CUSTOM_VERSION),y)
> > +BR_NO_CHECK_HASH_FOR += $(LINUX_SOURCE)
> > +endif
> >  # In X.Y.Z, get X and Y. We replace dots and dashes by spaces in order
> >  # to use the $(word) function. We support versions such as 4.0, 3.1,
> >  # 2.6.32, 2.6.32-rc1, 3.0-rc6, etc.
> > 
> 
> 
> -- 
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
