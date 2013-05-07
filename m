From: Spenser Gilliland <spenser@gillilanding.com>
Date: Tue, 7 May 2013 16:49:24 -0500
Subject: [Buildroot] [PATCH v2 1/2] libcec: add libcec for HDMI device
	Control
In-Reply-To: <20130507205914.GC22338@free.fr>
References: <1367618887-25757-1-git-send-email-spenser@gillilanding.com>
 <1367959620-17176-1-git-send-email-spenser@gillilanding.com>
 <20130507205914.GC22338@free.fr>
Message-ID: <CAEBucnDmcVq9QQ_yi-Lqhk3tywGZCg9N0GGg7Dj44u2Ek5Uyhg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, May 7, 2013 at 3:59 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Spenser, All,
>
> On Tue, May 07, 2013 at 03:46:59PM -0500, Spenser Gilliland wrote:
>> This patch adds libcec for HDMI device control.  It enables Raspberry Pi
>> support if the rpi-userland package is installed.
>>
>> Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
> [--SNIP--]
>> diff --git a/package/libcec/libcec.mk b/package/libcec/libcec.mk
>> new file mode 100644
>> index 0000000..cc2fbed
>> --- /dev/null
>> +++ b/package/libcec/libcec.mk
>> @@ -0,0 +1,30 @@
>> +#############################################################
>> +#
>> +# libcec
>> +#
>> +#############################################################
>> +
>> +LIBCEC_VERSION = libcec-2.1.1
>> +LIBCEC_SITE = http://github.com/Pulse-Eight/libcec/tarball/$(LIBCEC_VERSION)
>> +LIBCEC_LICENSE = GPLv2+
>> +LIBCEC_LICENSE_FILE = COPYING
>> +
>> +LIBCEC_AUTORECONF = YES
>
> I guess we need autoreconf because we get an extract of the repository,
> right? Please add a little note about it, it is not obvious at first
> sight.
>
>> +LIBCEC_INSTALL_STAGING = YES
>> +LIBCEC_DEPENDENCIES = host-pkgconf
>> +
>> +ifeq ($(BR2_PACKAGE_LOCKDEV),y)
>
> lockdev is introduced only in a subsequent patch. This should have been
> reversed: lockdev first, then libcec.

Will fix.

>> +LIBCEC_DEPENDENCIES += lockdev
>> +endif
>> +
>> +ifeq ($(BR2_PACKAGE_UDEV),y)
>> +LIBCEC_DEPENDENCIES += udev
>> +endif
>> +
>> +ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
>> +LIBCEC_CONF_OPT = --enable-rpi \
>> +   --with-rpi-include-path=$(STAGING_DIR)/usr/include
>> +LIBCEC_DEPENDENCIES += rpi-userland
>> +endif
>
> Although not strictly required, I'd like an explicit --disable-rpi in
> the case rpi-userland is not available.

I'll add it to the next patch.

> (In my twisted mind, I was imediately thinking of using Buildroot on an
> RPi that does have rpi-userland, but would not want it in my generated
> image, so would not like to pick the system one. Yes, I'm weird.:-] )

if by it you mean libcec. Then, libcec should be able to be used with
USB adapters and RPI at the same time.  I can test this use case as I
have both an RPI and USB-CEC dongle.  I'll let you know soon.

>
> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'



--
Spenser Gilliland
Computer Engineer
Doctoral Candidate
