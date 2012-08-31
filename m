From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 31 Aug 2012 13:18:10 +0000 (UTC)
Subject: [Buildroot] [Bug 5486] libglib2 build fails on qsort r test
In-Reply-To: <bug-5486-163@https.bugs.busybox.net/>
References: <bug-5486-163@https.bugs.busybox.net/>
Message-ID: <20120831131810.EBCA397004@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5486

--- Comment #5 from twobob <seetwobob@live.co.uk> 2012-08-31 13:18:10 UTC ---
(In reply to comment #4)
> Shouldn't this be fixed already by the following commit ?
> 
> commit 78a5c27cc37f1d0453defa8d3f59762ca7f4c7ef
> Author: Sven Neumann <s.neumann@raumfeld.com>
> Date:   Wed Feb 29 07:05:49 2012 +0100
> 
>     libglib2: fix build with legacy uClibc versions
> 
>     qsort_r was only added in uClibc 0.9.33, so only enable it when we're sure
>     it's available. For external/ctng toolchains we cannot easily know, so
>     simply disable it there.
> 
>     Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>

I see the changes from
http://git.buildroot.net/buildroot/commit/?id=97165f123bd67b8d1a9a0a3bb41f2c4b8475156d
in my local .mk

They appear to specifically target uClibc use cases? I'm no expert in these
matters.

+ifeq
($(BR2_UCLIBC_VERSION_0_9_31)$(BR2_UCLIBC_VERSION_0_9_32)$(BR2_TOOLCHAIN_CTNG_uClibc)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC),y)
+LIBGLIB2_CONF_ENV += glib_cv_have_qsort_r=no
+else
+LIBGLIB2_CONF_ENV += glib_cv_have_qsort_r=yes
+endif

Should I refactor this to encompass my TC use case?

Given this unsurity: To move forward I attempted removing the test entirely,
this leads to:

checking for format to printf and scanf a guint64... none
checking for an ANSI C-conforming const... yes
checking if malloc() and friends prototypes are gmem.h compatible... yes
checking for growing stack pointer... configure: error: in
`/home/simon/BLDS/buildroot/build/libglib2-2.30.2':
configure: error: cannot run test program while cross compiling
See `config.log' for more details
make[2]: *** [config.status] Error 1
make[1]: *** [/home/simon/BLDS/buildroot/build/libglib2-2.30.2/.stamp_built]
Error 2
make: *** [all] Error 2

Which would suggest that even if this worked as intended it would not be a
complete solution. Currently endeavouring to bypass this next hurdle.

Many thanks.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
