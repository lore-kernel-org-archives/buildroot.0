From: Sven Neumann <s.neumann@raumfeld.com>
Date: Wed, 19 Dec 2012 23:03:58 +0100
Subject: [Buildroot] [PATCH 1/4] libglib2: bumped version to 2.32.4
In-Reply-To: <1898585649.1424283.1355934492400.JavaMail.root@advansee.com>
References: <1355936324-9585-1-git-send-email-bogdan@nimblex.org>
 <1898585649.1424283.1355934492400.JavaMail.root@advansee.com>
Message-ID: <1355954638.17510.17.camel@bender>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, 2012-12-19 at 17:28 +0100, Beno?t Th?baudeau wrote:

> > -		ac_cv_func_posix_getgrgid_r=no glib_cv_long_long_format=ll \
> > -		ac_cv_func_printf_unix98=yes ac_cv_func_vsnprintf_c99=yes \
> 
> Can you explain in detail why you removed these? Did you test that gst-inspect
> still works fine after that?

No, actually you added this to buildroot way after we've done our
changes to update libglib2. So the removal of these two lines is
probably just an artefact from rebasing our old patch on top of current
buildroot. I don't think we've removed them on purpose.

It's been a while since we've done the switch to libglib2. And as I said
in the patch that Bogdan submitted, not all the changes are ready for
inclusion in buildroot. But let me try to give some background on the
changes that we've done. I've collected this from our buildroot git log,
so bear with me if I don't remember all the details.

+ ac_cv_alignof_guint32=4 ac_cv_alignof_guint64=4 ac_cv_alignof_unsigned_long=4 \

These are definitely not right for all platforms. But I found that the
alignment checks in the glib configure script don't get the correct
result when cross-compiling. So I've added this to force the correct
values for our platforms (ARM and Geode).

+               CPPFLAGS=-D__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 \

This turned out to be necessary on our ARM platform. On ARMv5 atomic
operations are not actually available as inlines but libgcc does still
provide them as functions. Without tricking glib into using the
functions it would use mutex-based fallbacks.

+               ac_cv_func_newlocale=no ac_cv_func_uselocale=no \
+               ac_cv_func_strtod_l=no ac_cv_func_strtoll_l=no ac_cv_func_strtoull_l=no \

The xlocale based implementations of g_ascii_strto{d,ll,ull} and
g_ascii_formatd crash with uClibC. At least they did this with the
version of uCLibC that we used back then (that was version 0.9.32 as far
as I can see). So this change tricks the configure script into believing
that this functionality was not available so that the good old
home-grown code is used again as it was the case before 2.32.

So the submitted patch for libglib2 should not be taken as final. But I
hope that this will nevertheless help to get libglib2 updated in
buildroot for the next release.


Regards,
Sven
