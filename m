From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 31 Jan 2016 08:49:59 +0100
Subject: [Buildroot] [PATCH 1/1] RFC: musl: Fix gettext support
References: <1454194293-17572-1-git-send-email-bernd.kuhls@t-online.de>
 <20160131083325.73aab970@free-electrons.com>
Message-ID: <7uq0ocx40l.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sun, 31 Jan 2016 08:33:25 +0100 schrieb Thomas Petazzoni:

> Why is this part needed ? By passing ac_cv_gnu_library_2_1=yes and
> ac_cv_gnu_library_2=yes, aren't you convincing gettext to not
> build/install its libintl library ? If so, why is gettext still
> installing its own libintl.h ?

Hi Thomas,

gettext-0.19.7/gettext-runtime/intl/Makefile.in, line 403 installs 
libintl.h to $DESTDIR if @USE_INCLUDED_LIBINTL@ was set to "yes" by the 
configure script. Despite the ac_cv* variables, which are necessary 
anyway, at the end they fail to prevent installing libintl.h, therefore I 
hacked gettext-0.19.7/gettext-runtime/intl/Makefile.in by removing line 
403. I did not spent hours in analyzing the package, maybe there is a way 
to set @USE_INCLUDED_LIBINTL@ to "no", but I did not find it. Therefore I 
consider my patch as an ugly hack. I tried to set other variables in 
_CONF_ENV as well, like
	nls_cv_use_gnu_gettext
	nls_cv_force_use_gnu_gettext
	gt_included_intl
but they did not fix the problem.

Regards, Bernd
