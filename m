From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Mar 2015 23:30:27 +0100
Subject: [Buildroot] [PATCH v2 2/3] package/mesa3d: bump version to
 10.5.1
In-Reply-To: <1426435802-14030-2-git-send-email-bernd.kuhls@t-online.de>
References: <1426435802-14030-1-git-send-email-bernd.kuhls@t-online.de>
 <1426435802-14030-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150317233027.1aee93ce@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 15 Mar 2015 17:10:01 +0100, Bernd Kuhls wrote:
> Dropped several dependencies because the "distribution tarball has been renamed
> and now contains all the generated sources."
> http://lists.freedesktop.org/archives/mesa-announce/2015-March/000145.html
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: updated hash (Baruch), added note about dependency changes (Thomas)

Thanks for the additional explanation, makes a lot more sense now. I've
applied your patch. I however have a comment:

> ++#ifdef __UCLIBC__
> ++float fmaxf(float a, float b)

This is really a crappy solution. I know we use it in various places,
but it simply does not work properly: if a new version of uClibc is
released with an implementation of fmaxf(), then __UCLIBC__ will still
be true, but we'll have a duplicated implementation of fmaxf().

http://autobuild.buildroot.org/results/6f6/6f62dffec0e299a36755184338524e107a932b16/build-end.log
is an excellent demonstration of why using __UCLIBC__ is bad. This
build failure is caused by the patch
package/freerdp/0001-add-support-for-uclibc.patch, wihch just like
yours adds replacement function if __UCLIBC__ is defined.

Now, enters uClibc-ng, which does implement eventfd_read() and
eventfd_write(), and bang, it fails.

Solution: use a proper autoconf test to see if fmax() is available or
not, or provide an alternate implementation only if it's not already
provided.

Since we're doing this __UCLIBC__ trick in lots of places, I've
nonetheless applied your patch, but it'd be good to use proper
solutions in the future.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
