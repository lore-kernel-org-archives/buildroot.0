From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Wed, 29 Mar 2017 13:29:02 -0400
Subject: [Buildroot] [v5] package: add qt5virtualkeyboard
In-Reply-To: <20170329180311.533db852@free-electrons.com>
References: <20170329155822.32245-1-gael.portay@savoirfairelinux.com>
 <20170329180311.533db852@free-electrons.com>
Message-ID: <20170329172902.wzhphoda4n4fu2wb@gportay>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Mar 29, 2017 at 06:03:11PM +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 29 Mar 2017 11:58:22 -0400, Ga?l PORTAY wrote:
>
> [...]
> 
> This way of concatenating the licenses doesn't work, because the final
> string will be:
> 
> "GPLv3 Apache-2.0"
> 
> while we want "GPLv3, Apache-2.0". Look at other Qt5 packages how they
> are handling this:
> 
> QT5BASE_LICENSE := $(QT5BASE_LICENSE), BSD-3c (examples)
> 
> Note that next to the license, we also want an information on which
> part of the package it applies.
> 

I modified the Makefile so the LICENSE variable is set to (all layouts +
handwriting):

"GPLv3, Apache-2.0 (openwnn), Apache-2.0 (pinyin), Apache-2.0 BSD-3c (tcime), MIT (lipi-toolkit)"

Is it correct?

I can also be more explicit:

"GPLv3, Apache-2.0 (openwnn/ja_JP), Apache-2.0 (pinyin/zh_TW), Apache-2.0 BSD-3c (tcime/zh_TW), MIT (lipi-toolkit/handwriting)"

Thank you for your review. I did not understand why some packages have a comma
in LICENSE while others have 'and/or' or are simply white-space separated.

BTW, here are the modifications:

-QT5VIRTUALKEYBOARD_LICENSE += Apache-2.0
+QT5VIRTUALKEYBOARD_LICENSE := $(QT5VIRTUALKEYBOARD_LICENSE), Apache-2.0 (openwnn)

-QT5VIRTUALKEYBOARD_LICENSE += Apache-2.0
+QT5VIRTUALKEYBOARD_LICENSE := $(QT5VIRTUALKEYBOARD_LICENSE), Apache-2.0 (pinyin)

-QT5VIRTUALKEYBOARD_LICENSE += Apache-2.0 BSD-3c
+QT5VIRTUALKEYBOARD_LICENSE := $(QT5VIRTUALKEYBOARD_LICENSE), Apache-2.0 BSD-3c (tcime)

-QT5VIRTUALKEYBOARD_LICENSE += MIT
+QT5VIRTUALKEYBOARD_LICENSE := $(QT5VIRTUALKEYBOARD_LICENSE), MIT (lipi-toolkit)

> > +QT5VIRTUALKEYBOARD_PINYIN = $(findstring zh_CN,$(QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS))
> > +ifneq ($(strip $(QT5VIRTUALKEYBOARD_PINYIN)$(QT5VIRTUALKEYBOARD_ALL_LAYOUTS)),)
> > +QT5VIRTUALKEYBOARD_3RDPARTY_PARTS += pinyin
> 
> Do you really need the name here? You don't use it anywhere. What about:
> 
> QT5VIRTUALKEYBOARD_INSTALL_3RDPARTY = YES
> 
> instead.

Indeed I did not need them.

I used the white-space separated values for debugging purpose.

The YES value make the Makefile more simple.

-QT5VIRTUALKEYBOARD_3RDPARTY_PARTS += pinyin
+QT5VIRTUALKEYBOARD_3RDPARTY_PARTS = YES

-QT5VIRTUALKEYBOARD_3RDPARTY_PARTS += tcime
+QT5VIRTUALKEYBOARD_3RDPARTY_PARTS = YES

-QT5VIRTUALKEYBOARD_3RDPARTY_PARTS += lipi_toolkit
+QT5VIRTUALKEYBOARD_3RDPARTY_PARTS = YES

> 
> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com

If you agree with those modifications, I will send a v6 of this patch (including
missing prefix for QMAKEFLAGS).

Regards,
Gael
