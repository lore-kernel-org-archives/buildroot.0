From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 18 Feb 2017 20:09:11 +0100
Subject: [Buildroot] [PATCH] package/sngrep: add missing ncurses
 dependencies
In-Reply-To: <XnsA720C4EB5F912berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <20170218154333.24496-1-romain.naour@gmail.com>
 <20170218164928.59e0f1c5@free-electrons.com>
 <XnsA720C4EB5F912berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <d241ad80-f3a4-2c18-4d8a-60a4f2baff5c@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd, Thomas, All,

Le 18/02/2017 ? 19:21, Bernd Kuhls a ?crit :
> Hi Thomas,
> 
> Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
> @public.gmane.org> wrote in news:20170218164928.59e0f1c5 at free-electrons.com:
> 
>> However, I still don't understand how it can fail on the autobuilders.
> 
> because the autobuilders fail with BR2_PACKAGE_NCURSES_WCHAR=y:
> http://lists.busybox.net/pipermail/buildroot/2017-January/182468.html

Thanks Bernd for the link.

You're right, the problem come from --disable-unicode option which force sngrep
to use the the non-wide-character ncurses library.
So sngrep is looking for libpanel.so and libform.so even if
BR2_PACKAGE_NCURSES_WCHAR is selected.

When BR2_PACKAGE_NCURSES_WCHAR is selected a symlink between libncurses.so and
libncursesw.so is created unconditionally. But this is not the case for the
other ncurses libraries like libpanel and libfrom!
The symlink is only created when BR2_PACKAGE_NCURSES_TARGET_PANEL and
BR2_PACKAGE_NCURSES_TARGET_FORM are selected

See [1]:

NCURSES_LIBS-y = ncurses
NCURSES_LIBS-$(BR2_PACKAGE_NCURSES_TARGET_MENU) += menu
NCURSES_LIBS-$(BR2_PACKAGE_NCURSES_TARGET_PANEL) += panel
NCURSES_LIBS-$(BR2_PACKAGE_NCURSES_TARGET_FORM) += form

[...]

ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
NCURSES_CONF_OPTS += --enable-widec
NCURSES_LIB_SUFFIX = w

[...]

define NCURSES_LINK_LIBS_SHARED
	$(foreach lib,$(NCURSES_LIBS-y:%=lib%), \
		ln -sf $(lib)$(NCURSES_LIB_SUFFIX).so $(1)/usr/lib/$(lib).so
	)
	ln -sf libncurses$(NCURSES_LIB_SUFFIX).so \
		$(1)/usr/lib/libcurses.so
endef

[...]

NCURSES_LINK_STAGING_LIBS = \
	$(if $(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),$(call
NCURSES_LINK_LIBS_SHARED,$(STAGING_DIR)))

[...]

else # BR2_PACKAGE_NCURSES_WCHAR
NCURSES_ABI_VERSION = 5
endif # BR2_PACKAGE_NCURSES_WCHAR

So selecting BR2_PACKAGE_NCURSES_TARGET_PANEL and
BR2_PACKAGE_NCURSES_TARGET_FORM is the right thing to do here to create a the
missing symlinks in staging directory.

But the help text in BR2_PACKAGE_NCURSES_TARGET_[FORM,MENU,PANEL] is about
target directory only. But staging is also affected.

Best regards,
Romain

[1] https://git.busybox.net/buildroot/tree/package/ncurses/ncurses.mk

> 
> Regards, Bernd
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
