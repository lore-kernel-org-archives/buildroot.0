From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 8 Apr 2015 22:49:17 +0200
Subject: [Buildroot] [PATCH 2/2] infra/pkg-kconfig: require an non-empty
 KCONFIG_FILE
In-Reply-To: <55258DE8.9020207@mind.be>
References: <cover.1428512591.git.yann.morin.1998@free.fr>
 <c5c81694cabca70c5651fe42a7de99247275659c.1428512591.git.yann.morin.1998@free.fr>
 <55258DE8.9020207@mind.be>
Message-ID: <20150408204917.GC4197@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-04-08 22:22 +0200, Arnout Vandecappelle spake thusly:
> On 08/04/15 19:08, Yann E. MORIN wrote:
> > Currently, we only check that the variable is defined, which is not
> > enough since we really want it to be non-empty.
> 
>  Have you tested this? According to the make documentation, this is not true...
> 
> > 
> > We however can't check it points to an existing file, because the
> > package might well not be extracted yet, and we may use an internal
> > defconfig. If that file does not eventually exist, there will be a
> > failure down the road at build time when we try to copy it...
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> > ---
> >  package/pkg-kconfig.mk | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
> > index fd9f19d..fe8d266 100644
> > --- a/package/pkg-kconfig.mk
> > +++ b/package/pkg-kconfig.mk
> > @@ -68,7 +68,7 @@ $$($(2)_TARGET_CONFIGURE): $$($(2)_DIR)/.stamp_kconfig_fixup_done
> >  ifeq ($$($$($(2)_KCONFIG_VAR)),y)
> >  
> >  # FOO_KCONFIG_FILE is required
> > -ifndef $(2)_KCONFIG_FILE
> > +ifeq ($$($(2)_KCONFIG_FILE),)
> 
>  These two are exactly the same, cfr. [1]:
> 
> >      The 'ifdef' form takes the _name_ of a variable as its argument,
> >      not a reference to a variable.  The value of that variable has a
> >      non-empty value, the TEXT-IF-TRUE is effective; otherwise, the
>        ^^^^^^^^^^^^^^^
> >      TEXT-IF-FALSE, if any, is effective.  Variables that have never
> >      been defined have an empty value.  The text VARIABLE-NAME is
> >      expanded, so it could be a variable or function that expands to the
>        ^^^^^^^^
> >      name of a variable.

Weird, because we do have, for example when the linux kernel is not
enabled:

  171 ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
  172 KERNEL_SOURCE_CONFIG = $(KERNEL_ARCH_PATH)/configs/$(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG))_defconfig
  173 else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG),y)
  174 KERNEL_SOURCE_CONFIG = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE))
  175 endif
  176 
  177 LINUX_KCONFIG_FILE = $(KERNEL_SOURCE_CONFIG)

So, because neither "use defconfig" nor "use custom config" is set,
KERNEL_SOURCE_CONFIG is not set, so LINUX_KCONFIG_FILE ends up empty.

However, our ifndef did not trigger so far.

Maybe it is because there is a space between the '=' sign and the
expansion of KERNEL_SOURCE_CONFIG...

Well, I don't care that much. ;-] So I'll mark this patch rejected.

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
