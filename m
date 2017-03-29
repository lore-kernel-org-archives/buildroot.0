From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Mar 2017 18:03:11 +0200
Subject: [Buildroot] [v5] package: add qt5virtualkeyboard
In-Reply-To: <20170329155822.32245-1-gael.portay@savoirfairelinux.com>
References: <20170329155822.32245-1-gael.portay@savoirfairelinux.com>
Message-ID: <20170329180311.533db852@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 29 Mar 2017 11:58:22 -0400, Ga?l PORTAY wrote:
> +QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS = $(call qstrip,$(BR2_PACKAGE_QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS))
> +QT5VIRTUALKEYBOARD_ALL_LAYOUTS = $(findstring all,$(QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS))
> +ifneq ($(strip $(QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS)),)
> +QMAKEFLAGS += CONFIG+="$(foreach lang,$(QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS),lang-$(lang))"
> +
> +QT5VIRTUALKEYBOARD_OPENWNN = $(findstring ja_JP,$(QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS))
> +ifneq ($(strip $(QT5VIRTUALKEYBOARD_OPENWNN)$(QT5VIRTUALKEYBOARD_ALL_LAYOUTS)),)
> +QT5VIRTUALKEYBOARD_LICENSE += Apache-2.0

This way of concatenating the licenses doesn't work, because the final
string will be:

"GPLv3 Apache-2.0"

while we want "GPLv3, Apache-2.0". Look at other Qt5 packages how they
are handling this:

QT5BASE_LICENSE := $(QT5BASE_LICENSE), BSD-3c (examples)

Note that next to the license, we also want an information on which
part of the package it applies.

> +QT5VIRTUALKEYBOARD_PINYIN = $(findstring zh_CN,$(QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS))
> +ifneq ($(strip $(QT5VIRTUALKEYBOARD_PINYIN)$(QT5VIRTUALKEYBOARD_ALL_LAYOUTS)),)
> +QT5VIRTUALKEYBOARD_3RDPARTY_PARTS += pinyin

Do you really need the name here? You don't use it anywhere. What about:

QT5VIRTUALKEYBOARD_INSTALL_3RDPARTY = YES

instead.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
