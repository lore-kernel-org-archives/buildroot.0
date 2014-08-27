From: Romain Naour <romain.naour@openwide.fr>
Date: Wed, 27 Aug 2014 23:52:58 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/xscreensaver: fix linking
 with intl
Message-ID: <53FE533A.1040502@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 26/08/2014 09:23, Thomas Petazzoni a ?crit :
> Dear Romain Naour,
> 
> On Tue, 26 Aug 2014 01:13:06 +0200, Romain Naour wrote:
> 
>> +	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
> 
> Have you verified if it's really BR2_NEEDS_GETTEXT or
> BR2_NEEDS_GETTEXT_IF_LOCALE that should be used?
> 

gettext package is always selected with xscreensaver when BR2_NEEDS_GETTEXT is
set due to dependencies on libgtk2 and libglib2.

This is libglib2 that select gettext package when BR2_NEEDS_GETTEXT is set.

But, It seems that xscreensaver can live without gettext by looking at
utils/xscreensaver-intl.h.

So, it's seems correct to select gettext package when
BR2_NEEDS_GETTEXT_IF_LOCALE is set but the build fail with the following link error:

xscreensaver.o: In function `main':
undefined reference to `libintl_bindtextdomain'
undefined reference to `libintl_textdomain'

That why I added BR2_NEEDS_GETTEXT...

Ok, I just found a patch that fix this issue in version 5.28.
Please see v3.

Thanks for your review !

Best regards
Romain
