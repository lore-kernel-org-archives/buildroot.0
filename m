From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Nov 2017 14:02:04 +0100
Subject: [Buildroot] [PATCH v2 1/1] qt5webengine: enable build for 5.6.3
In-Reply-To: <20171124100411.1a2adc9c@windsurf.lan>
References: <20171123232619.29849-1-gael.portay@savoirfairelinux.com>
 <20171124100411.1a2adc9c@windsurf.lan>
Message-ID: <20171125130204.GB2798@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-11-24 10:04 +0100, Thomas Petazzoni spake thusly:
> +Yann in Cc, since there is licensing stuff involved :)
> 
> On Thu, 23 Nov 2017 18:26:19 -0500, Ga?l PORTAY wrote:
> 
> > +Upstream-Status: Merged
> > +Task-number: QTBUG-57761
> > +Change-Id: I29f037dfe542222b5188a33c7727c81a464a87bb
> > +Reviewed-by: Allan Sandfeld Jensen <allan.jensen@qt.io>
> > +Reviewed-by: Michal Klocek <michal.klocek@qt.io>
> > +Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> > +[gportay: backport from 5.9 and merge conflicts]
> 
> Backporting from 5.9 to 5.6 raises a red flag: Qt changed its licensing
> terms between 5.6 and 5.9, and you can't backport things this way,
> because Qt 5.9 is under GPLv3, while Qt 5.6 is not.

Three things:

0- IANAL, this is not legal advice, blablabla...

1- the real licensing terms are:  LGPL-3.0 or GPL-2.0 or GPL-3.0 or proprietary

Note that this is LGPL-3.0 and not '+', because the source states:

    [...] this file may be used under the terms of the GNU Lesser
    General Public License version 3 as published by [...]

Note that it is not GPL-2.0+, because the source code explicitly says:

    [...] this file may be used under the terms of the GNU General Public
    License version 2.0 or (at your option) the GNU General Public license
    version 3 or any later version approved by the KDE Free Qt Foundation.

Note that the terms are ambiguous, because we don't know what "approved
by the Free Qt Foundation" applies to. We should just assume nothing about
this, hence GPL-3.0 and not '+'.

2- AFAICS, those were already the licensing terms for qtwebengine 5.6, so
it looks like we can indeed backport. But then this should be clearly
stated in the backported patch itself, so we don't come later and worry
again about this issue.

Note that in qt-5.6, some Qt modules were already using the new
licensing terms: new modules that were introduced in Qt-5.6 (and even
those new in Qt-5.5?) have been using the LGPL-3.0/GPL2.0/GPL-3.0 from
the onset.

> However I'm not sure about the specific status of qt5webengine. Also,
> its <pkg>_LICENSE variable says:
> 
> include package/qt5/qt5webengine/chromium.inc
> QT5WEBENGINE_LICENSE = GPL-2.0 or LGPL-3.0 or GPL-3.0 or GPL-3.0 with exception

The exception only applies to some filers in the tests/ and tools/
directories.

So I wonder if that is something that is applicable in the end.

> QT5WEBENGINE_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT \
>         LICENSE.GPLv3 LICENSE.LGPL3 $(CHROMIUM_LICENSE_FILES)
> 
> which I'm not sure is correct for Qt 5.6. Indeed, many of the packages
> have something like this instead:

As explained above, it is valid already for Qt-5.6, becasue qtwebengine
was a new module at that time, so it never had the non-v3 licenses.

> ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
> QT5MULTIMEDIA_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
> QT5MULTIMEDIA_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL
> else
> QT5MULTIMEDIA_LICENSE = GPL-3.0 or LGPL-2.1 with exception or LGPL-3.0, GFDL-1.3 (docs)
> QT5MULTIMEDIA_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
> endif
> 
> Could you double check the license status of qt5webengine, in Qt 5.6
> and Qt 5.9 respectively ?

Yes, a second review of my statements above would be very much
appreciated, please.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
