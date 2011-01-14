From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Jan 2011 08:59:41 +0100
Subject: [Buildroot] [PATCH] htop: new package
In-Reply-To: <9AC3F0E75060224C8BBC5BA2DDC8853A1EE63C42@EXV1.corp.adtran.com>
References: <9AC3F0E75060224C8BBC5BA2DDC8853A1EE63C42@EXV1.corp.adtran.com>
Message-ID: <20110114085941.6df4841d@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Andy,

On Wed, 12 Jan 2011 15:15:30 -0600
ANDY KENNEDY <ANDY.KENNEDY@adtran.com> wrote:

> The following adds support for version 0.8.3 of htop.  0.9 is the
> latest, however, is dependant on backtrace.  The next version is to
> remove the hard dependencies of backtrace and make it a compile-time
> check.

Your patch is word-wrapped. Could you check your e-mail
client configuration ? You should probably try git send-email, as this
will guarantee that your patches will make it properly to the list,
without being word-wrapped or damaged in anyway by the mail client
you're using.

> Signed-off-by: Andy Kennedy <andy.kennedy@adtran.com>
> ---
> diff -Naur a/package/htop/Config.in b/package/htop/Config.in
> --- a/package/htop/Config.in    1969-12-31 18:00:00.000000000 -0600
> +++ b/package/htop/Config.in    2011-01-11 15:16:01.000000000 -0600
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_HTOP
> +       bool "htop"
> +       select BR2_PACKAGE_NCURSES
> +       select UCLIBC_HAS_BACKTRACE if BR2_TOOLCHAIN_BUILDROOT

We can't do that. UCLIBC_HAS_BACKTRACE does not exist in the current
version of Buildroot. Probably a left over from the packaging of htop
0.9, which requires backtrace support.

However, even when you'll package htop 0.9, the current policy is not
to do something like selecting a given UCLIBC option. We either :

 *) Enable the needed option in our default uClibc build, if the
    footprint impact is reasonable and the option is sufficiently useful
    for different packages.

 *) Or add a comment in the package help in Config.in stating that the
    package would not build with the default uClibc configuration.

None of those options are perfect, but we'd like to avoid adding dozens
and dozens of options at the Buildroot level to tweak every possible
option of uClibc.

> diff -Naur a/package/htop/htop-cross-no-proc-check.patch
> b/package/htop/htop-cross-no-proc-check.patch
> --- a/package/htop/htop-cross-no-proc-check.patch       1969-12-31
> 18:00:00.000000000 -0600
> +++ b/package/htop/htop-cross-no-proc-check.patch       2011-01-12
> 14:51:53.000000000 -0600

Patch lacks a description of why it is needed and the Signed-off-by
line.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
