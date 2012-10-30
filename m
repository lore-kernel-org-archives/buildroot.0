From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Oct 2012 14:01:56 +0100
Subject: [Buildroot] [PATCH 1/2] php: bump to version 5.3.18
In-Reply-To: <1351599635-21356-1-git-send-email-gustavo@zacarias.com.ar>
References: <1351599635-21356-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20121030140156.4117a077@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 30 Oct 2012 09:20:34 -0300, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/php/Config.in                     |    4 ++
>  package/php/php-force-cross-compile.patch |   50 -----------------------------

So you are sure this patch is no longer needed? See the explanation
below: the problem can only be triggered if the build machine has the
same architecture as the target machine.

> -In its configure script, PHP detects whether we're cross-compiling or
> -not, by compiling and running a simple C program. Depending on whether
> -cross-compiling has been detected or not, then PHP enables or disables
> -the AC_TRY_RUN tests (which verify the availability of something by
> -*executing* a program, which, by definition, cannot work in
> -cross-compilation mode).
> -
> -This works just fine when the target architecture is ARM or PowerPC
> -and the build machine is x86 or x86_64. Unfortunately, when the target
> -architecture is x86_64 and the build machine is also x86_64, the
> -cross-compilation mode detection concludes that we are not
> -cross-compiling, because it succeeds in running this small program.
> -
> -However, while it succeeds in running this basic small program, some
> -other programs executed later through AC_TRY_RUN tests do not work,
> -because they have target library dependencies that are not available
> -on the build machine. For example, the libxml2 test fails to *run*
> -because libxml2 is not available on the build machine, only in the
> -target/staging directories. So trying to run a program linked against
> -libxml2, on the build machine, simply doesn't make sense.
> -
> -We fix this problem by just forcing PHP to think that we're
> -cross-compiling (which is always the case with Buildroot, as we're at
> -the moment never building PHP for the host). Unfortunately, the
> -configure.in file dates back from the autoconf 2.13 era, so the
> -configure script does not understand the ac_cv_prog_cc_cross cache
> -variable, and we cannot easily regenerate the configure script using
> -our package autoconf version. The easiest solution is therefore to
> -simply patch the configure script to make the cross-compilation test
> -fail: we replace the execution of the program by a call to false,
> -which always fail, leading the configure script to understand that we
> -*are* cross-compiling.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
