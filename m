From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 31 Aug 2012 15:07:54 +0000 (UTC)
Subject: [Buildroot] [Bug 5486] libglib2 build fails on qsort r test
In-Reply-To: <bug-5486-163@https.bugs.busybox.net/>
References: <bug-5486-163@https.bugs.busybox.net/>
Message-ID: <20120831150754.6AA36994DA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5486

--- Comment #7 from twobob <seetwobob@live.co.uk> 2012-08-31 15:07:54 UTC ---
(In reply to comment #6)
> Well, yes, the fix that Peter committed specifically addresses the uCLibC case.
> If your external toolchain doesn't provide qsort_r, then your build will still
> fail.
> 
> I am not sure if this can be fixed properly in buildroot as we can't know all
> details about any possible external toolchain. But you can work around this by
> adding "glib_cv_have_qsort_r=no" to LIBGLIB2_CONF_ENV in your tree.

Okay some progress.

As I said I am unsure why but defaulting the values via your method. Now read
up on the process so I understand that should have defaulted the value to yes -
which *is* the case for the TC.

so to *get further* I simply elided the test as per the patch I referenced
above which got me one step farther; past the qsort_r error with it correctly
identified to the positive.

Which led to a fail testing the stack growth. I razed everything to the ground
and started again. applied the qsort_r.patch I referenced and this time I get.

tests'
make[5]: Nothing to be done for `install-exec-am'.
make[5]: Nothing to be done for `install-data-am'.
make[5]: Leaving directory
`/home/simon/GIT/buildroot/output/build/host-libglib2-2.30.2/gobject/tests'
make[4]: Leaving directory
`/home/simon/GIT/buildroot/output/build/host-libglib2-2.30.2/gobject/tests'
make[3]: Leaving directory
`/home/simon/GIT/buildroot/output/build/host-libglib2-2.30.2/gobject'
make[2]: Leaving directory
`/home/simon/GIT/buildroot/output/build/host-libglib2-2.30.2/gobject'
Making install in gio
make[2]: Entering directory
`/home/simon/GIT/buildroot/output/build/host-libglib2-2.30.2/gio'
/usr/bin/make  install-recursive
make[3]: Entering directory
`/home/simon/GIT/buildroot/output/build/host-libglib2-2.30.2/gio'
Making install in gdbus-2.0/codegen
make[4]: Entering directory
`/home/simon/GIT/buildroot/output/build/host-libglib2-2.30.2/gio/gdbus-2.0/codegen'
make[5]: Entering directory
`/home/simon/GIT/buildroot/output/build/host-libglib2-2.30.2/gio/gdbus-2.0/codegen'
 /bin/mkdir -p '/home/simon/GIT/buildroot/output/host/usr/bin'
 /bin/mkdir -p
'/home/simon/GIT/buildroot/output/host/usr/lib/gdbus-2.0/codegen'
 /usr/bin/install -c gdbus-codegen
'/home/simon/GIT/buildroot/output/host/usr/bin'
 /usr/bin/install -c -m 644 __init__.py codegen.py codegen_main.py
codegen_docbook.py config.py dbustypes.py parser.py utils.py
'/home/simon/GIT/buildroot/output/host/usr/lib/gdbus-2.0/codegen'
../../../py-compile: Missing argument to --destdir.
make[5]: *** [install-codegenPYTHON] Error 1
make[5]: Leaving directory
`/home/simon/GIT/buildroot/output/build/host-libglib2-2.30.2/gio/gdbus-2.0/codegen'
make[4]: *** [install-am] Error 2
make[4]: Leaving directory
`/home/simon/GIT/buildroot/output/build/host-libglib2-2.30.2/gio/gdbus-2.0/codegen'
make[3]: *** [install-recursive] Error 1
make[3]: Leaving directory
`/home/simon/GIT/buildroot/output/build/host-libglib2-2.30.2/gio'
make[2]: *** [install] Error 2
make[2]: Leaving directory
`/home/simon/GIT/buildroot/output/build/host-libglib2-2.30.2/gio'
make[1]: *** [install-recursive] Error 1
make[1]: Leaving directory
`/home/simon/GIT/buildroot/output/build/host-libglib2-2.30.2'
make: ***
[/home/simon/GIT/buildroot/output/build/host-libglib2-2.30.2/.stamp_host_installed]
Error 2

Is this related to the other python patch - and should I change the title of
the bug report? Attempting to become more useful.

Many thanks.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
