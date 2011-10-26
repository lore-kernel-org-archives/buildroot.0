From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 27 Oct 2011 00:10:11 +0200
Subject: [Buildroot] Custom automake arguments
In-Reply-To: <CANdC7UEcaK0AkPfL_Rr_f=DwXbT9=ikhn3H9a+NyLA1CEtubfQ@mail.gmail.com>
References: <CANdC7UEcaK0AkPfL_Rr_f=DwXbT9=ikhn3H9a+NyLA1CEtubfQ@mail.gmail.com>
Message-ID: <201110270010.12137.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday, October 25, 2011 15:15:42 Allan Nielsen wrote:
> Hi
> 
> Is it possible to parse custom package specifick arguments to automake
> (run'ed through autorecong)
> 
> I have tried this, but it does not seem to work:
> foo-configure: override AUTOMAKE:=$(HOST_DIR)/usr/bin/automake
> $(FOO_AUTOMAKE_FLAGS)
> 
> Best Regards
> Allan W. Nielsen

 I'm not entirely sure what you mean.  However, if you just want to specify 
arguments to autoreconf:  autoreconf is called as

$(AUTORECONF) $($(PKG)_AUTORECONF_OPT)

 so set FOO_AUTORECONF_OPT before calling AUTOTARGETS to override the default 
(which is empty).

 However, if you want to run automake instead of autoreconf, that's not really 
supported.  You could hack away using overrides, but probably it's much 
cleaner to do something like:

define FOO_AUTOMAKE_HOOK
   $(HOST_DIR)/usr/bin/automake $(FOO_AUTOMAKE_FLAGS)
endef
FOO_PRE_CONFIGURE_HOOKS += FOO_AUTOMAKE_HOOK
FOO_DEPENDENCIES += host-automake


 Regards,
 Arnout


-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
