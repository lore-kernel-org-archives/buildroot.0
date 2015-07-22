From: Brendan Heading <brendanheading@gmail.com>
Date: Thu, 23 Jul 2015 00:35:17 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2015-07-21
In-Reply-To: <20150722063018.99E6B101957@stock.ovh.net>
References: <20150722063018.99E6B101957@stock.ovh.net>
Message-ID: <CA+BsyQ5EOK1tceNu17UHmehbKVOQam=-qy6XwJJko-7MNf2AJw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some more.


>          arm |              exfat-utils-1.1.1 | NOK |
> http://autobuild.buildroot.net/results/c60d0f9a93c90d41c3c86c78b0a07ddfed22c56d/


exfat-utils looks like it is broken for any architecture when using musl.
Again I think we will have to take it up with upstream.

It's not straightforward as they don't use autotools; they have an #if
(GLIBC) #elif (APPLE) #elif (OpenBSD) #else #error #endif thing going on,
which they're using to decide which byteswap functions to use. musl by
design refuses to identify itself at compile time, so this will have to be
reworked. My best idea - changing it to use the glibc case as the default
fallback, as musl's byteswap functions appear to be the same as glibcs -
isn't very appealing.

      x86_64 |                   libftdi-0.20 | NOK |
> http://autobuild.buildroot.net/results/4d0009cf6f5b294d2246286e1383f663a4215648/


This is a more forgiveable musl issue, but again it probably needs to go
upstream.

libftdi includes usb.h from libusb-compat. usb.h uses some typedefs (eg
u_int8_t and friends) which, in musl's stricter world, I suspect are only
enabled when _GNU_SOURCE or _BSD_SOURCE is defined.

I tried to test this theory but, strangely, libftdi seemed to resist my
attempts to add -D_GNU_SOURCE into the LIBFTDI_CONF_ENV variable. Maybe it
will behave in the morning ..

I am not sure whether the patch should be directed at libusb-compat or
libftdi. To fix it in libusb-compat we'll have to #define _GNU_SOURCE in
the same header file which sounds slightly off; then again the library has
been written from the outset to assume glibc.

Brendan
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150723/3808f6da/attachment.html>
