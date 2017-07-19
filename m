From: Markus Mayer <mmayer@broadcom.com>
Date: Wed, 19 Jul 2017 13:08:14 -0700
Subject: [Buildroot] [PATCH] package/linux-tools: add tmon
In-Reply-To: <20170719213905.34cc4c8b@windsurf>
References: <1500415831-17747-1-git-send-email-mmayer@broadcom.com>
 <20170719213905.34cc4c8b@windsurf>
Message-ID: <CAGt4E5s3Yp7zu4vgSCWCZEaRo0W5r5yNSwTrLcM3u07nSteAKQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19 July 2017 at 12:39, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Tue, 18 Jul 2017 15:10:31 -0700, Markus Mayer wrote:
>> Add the tmon package to linux-tools.
>>
>> Signed-off-by: Markus Mayer <mmayer@broadcom.com>
>
> I've applied, but after doing a number of fixes. See below.

Thanks for fixing everything up.

>> diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
>> index 9d5bf7a..a7f8056 100644
>> --- a/package/linux-tools/Config.in
>> +++ b/package/linux-tools/Config.in
>> @@ -77,4 +77,11 @@ comment "selftests needs BR2_PACKAGE_BUSYBOX_SHOW_OTHERS"
>>       depends on BR2_USE_MMU
>>       depends on !BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>>
>> +config BR2_PACKAGE_LINUX_TOOLS_TMON
>> +     bool "tmon"
>> +     select BR2_PACKAGE_LINUX_TOOLS
>
>         select BR2_PACKAGE_NCURSES
>
> was missing here. Without this, Buildroot does not even start the build
> because ncurses is in the dependencies of this package, but is not
> selected by anything in Buildroot.

Hm. Interesting. I never hit this problem. It probably means I had
some other package turned on that depends on ncurses, so it was always
turned on for me.

>> +LINUX_TOOLS += tmon
>> +
>> +TMON_DEPENDENCIES = ncurses
>
> I've added host-pkgconf in the dependencies, because pkg-config is used
> to find ncurses. Without this, it uses the host pkg-config, which
> returns results valid for host ncurses, but not for the target ncurses.

This makes sense.

A side note, it *was* actually working for me with the host's
pkg-config due to the makefile passing in PKG_CONFIG_PATH. This makes
the host's pkg-config look at the target's config database, therefore
making it return the right thing (until the day it doesn't). I was
never fond of this solution (it's a pretty ugly hack), but I didn't
know there was a better way.

The new approach seems much more sane.

>> +TMON_MAKE_OPTS = $(LINUX_MAKE_FLAGS) \
>> +     CC=$(TARGET_CC) \
>> +     PKG_CONFIG_PATH=$(STAGING_DIR)/usr/lib/pkgconfig
>> +
>> +define TMON_BUILD_CMDS
>> +     $(Q)if ! grep install $(LINUX_DIR)/tools/thermal/tmon/Makefile >/dev/null 2>&1 ; then \
>> +             echo "Your kernel version is too old and does not have the tmon tool." ; \
>> +             echo "At least kernel 3.13 must be used." ; \
>> +             exit 1 ; \
>> +     fi
>> +     $(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools \
>> +             $(TMON_MAKE_OPTS) \
>> +             tmon
>
> It failed to build for me, because the tmon Makefile forces
> -fstack-protector, which doesn't work with toolchains that lack SSP
> support. So I've added a small tweak that removes -fstack-protector
> from tmon's Makefile if the toolchain doesn't have SSP support.

Yikes! Having to support multiple different toolchains can lead to
some good fun. Yeah, I kind of took the easy route of just trying a
single one. Sorry.

> What would be nice is to have a test case in our support/testing/
> infrastructure to build all those Linux tools. Would you be willing to
> work on something like this ? :-)

That does sound like a good thing to have. I'll take a look.

Regards,
-Markus
