From: Stanislav Vlasic <svlasic@gmail.com>
Date: Sat, 2 Nov 2013 02:46:06 +0100
Subject: [Buildroot] Introducing new package type,
	side to side with generic-package
In-Reply-To: <ca3a5174-c804-48b7-ad60-720f3926223c@email.android.com>
References: <CADYw_JLHofB+VQ2rktw_reWCvAWU9rj7VJ95tgVnW5OujYisow@mail.gmail.com>
 <ca3a5174-c804-48b7-ad60-720f3926223c@email.android.com>
Message-ID: <CADYw_JJuE71mqxSmQtT1JKLN7d0apTS=DAz+KD7of7n3sVsWnw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

thanx for answering my question.

Not sure if you noticed, but currently in my buildroot, xbmc stuff is
tightened to Amlogic ARM platform, as well as xbmc itself. It does not
follow mainline xbmc and also depends on some other amlogic related
packages. Some of these packages (like libamplayerm6) are not hosted on my
github. Reason for that is simple - they have to be rewritten and parts of
it needs to be published as compiled libraries because of license issue
with Amlogic. Your question still stands? :)

Regards,
Stan


On Fri, Nov 1, 2013 at 10:09 PM, Thomas De Schampheleire <
patrickdepinguin@gmail.com> wrote:

> Hi Stanislav,
>
> Stanislav Vlasic <svlasic@gmail.com> wrote:
> >Hi to all,
> >
> >this is my first mail to list, so I'll write short introduction... I'm
> >Stanislav Vlasic, Croatian developer, some of you might know me as
> >Stane1983 from contributions to XBMC, Amlogic buildroot, firmwares to
> >Amlogic devices.... Thats pretty much it :)
> >
> >Here's short story of what I did with my custom buildroot:
> >- included package/pkg-xbmc-addon.mk with xbmc-addon and inner-xbmc-addon
> >macros. Change I did in this make file is one line: $(2)_KCONFIG_VAR =
> >BR2_PACKAGE_XBMC_ADDON_$(2)
> >- I tried to rearrange of adding xbmc addons by creating makefile similar
> >to this:
> >
> >ADDON_NAME = YOUTUBE
> >ADDON_PATH = plugin.video.youtube
> >
> >$(ADDON_NAME)_VERSION = 0a8aa83df0786f5401307ca12080bbc4aefd76f6
> >$(ADDON_NAME)_SITE_METHOD = git
> >$(ADDON_NAME)_SITE = https://github.com/HenrikDK/youtube-xbmc-plugin.git
> >$(ADDON_NAME)_INSTALL_STAGING = YES
> >$(ADDON_NAME)_INSTALL_TARGET = YES
> >$(ADDON_NAME)_DEPENDENCIES = xbmc
> >
> >define $(ADDON_NAME)_INSTALL_STAGING_CMDS
> ># Commands for install to staging
> >endef
> >
> >define $(ADDON_NAME)_INSTALL_TARGET_CMDS
> ># Comands for install to target
> >endef
> >
> >$(eval $(call xbmc-addon,package/thirdparty/xbmcaddons,$(call
> >lc,$(ADDON_NAME))))
> >
> >This actually works. What's not working - if I add another package the
> same
> >way....
> >Version, site_method, site.... all these variables are OK and second
> >package downloads correctly.
> >
> >Problem comes when I try to install it to target or staging folder.
> Example
> >of install:
> >
> >define $(ADDON_NAME)_INSTALL_STAGING_CMDS
> >        # Here in first line I check if folder already exists, if it does
> i
> >delete all content and folder itself
> >        mkdir -p $(STAGING_DIR)/usr/share/xbmc/addons/$(ADDON_PATH)
> >        cp -rf $(@D)/* $(STAGING_DIR)/usr/share/xbmc/addons/$(ADDON_PATH)/
> >endef
> >
> >Now when buildroot hits install to staging, ADDON_PATH becomes
> >'plugin.video.youtube', which it has in another makefile??
> >
> >Does this have any sense to anybody here? :)
>
> The various .mk files are all flat included from the top level Makefile,
> so the last definition of this variable survives. That's why all variable
> names in .mk files have to be unique and the shortcut you tried to save
> typing doesn't work.
>
> Will you submit xbmc support to mainline buildroot?
> Note that you seem to be using an older buildroot version at the moment...
>
> Best regards,
> Thomas
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131102/937e2ae7/attachment-0001.html>
