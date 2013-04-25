From: Simon Dawson <spdawson@gmail.com>
Date: Thu, 25 Apr 2013 20:38:32 +0100
Subject: [Buildroot] [PATCH 2/2] wvdial: new package
In-Reply-To: <20130425155700.3e0d867f@skate>
References: <1366881542-15350-1-git-send-email-spdawson@gmail.com>
 <1366881542-15350-3-git-send-email-spdawson@gmail.com>
 <20130425155700.3e0d867f@skate>
Message-ID: <CAHt8ZCPC9+vMjPkG=Cz8dezkbqsL=_mVTFAXNcP8P2DXYCiSsQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas; thanks for the feedback.

On 25 April 2013 14:57, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>> + BINDIR=${prefix}/bin
>> + MANDIR=${prefix}/share/man
>> +-PPPDIR=/etc/ppp/peers
>> ++PPPDIR=${prefix}/etc/ppp/peers
>
> This one looks suspicious: /etc is usually not in the prefix, other it
> would be in /usr/etc/ppp/peers. Could you explain what's going on here?

You're right --- this needs fixing.

>> +WVDIAL_VERSION = 1.61
>> +WVDIAL_SITE = http://wvdial.googlecode.com/files
>> +WVDIAL_SOURCE = wvdial-$(WVDIAL_VERSION).tar.bz2
>> +WVDIAL_DEPENDENCIES = wvstreams
>> +
>> +WVDIAL_LICENSE = LGPLv2
>
> I haven't checked the code, is it really LGPLv2, and not LGPLv2.1 ? No
> "+" ?

Yes, and it's even titled "GNU LIBRARY GENERAL PUBLIC LICENSE Version
2" in the COPYING.LIB file; I think the codebase is just quite old and
unloved.

>> +WVDIAL_MAKE_ENV += \
>> +     CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" WVSTREAMS="$(WVSTREAMS_DIR)"
>
> Use $(TARGET_CONFIGURE_OPTS) instead of CC/CXX. I don't really like to
> see the wvdial build process poke into the wvstreams build directory.
> Each component should normally build even if the build directories of
> its dependencies have been removed. Is it possible to point it to the
> headers+libraries installed in $(STAGING_DIR) instead?

Okay; understood.

>> +WVDIAL_INSTALL_TARGET_OPT += prefix="$(TARGET_DIR)/usr" install
>> +WVDIAL_UNINSTALL_TARGET_OPT += prefix="$(TARGET_DIR)/usr" uninstall
>
> Those are used only once, so I would rather put them directly into the
> install/uninstall commands below.

Okay.

I'll fix the patch, and resubmit.

Simon.
