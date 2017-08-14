From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Aug 2017 21:29:52 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/mtd: integck needs threads
In-Reply-To: <20170814190123.6828-1-bernd.kuhls@t-online.de>
References: <20170814190123.6828-1-bernd.kuhls@t-online.de>
Message-ID: <20170814212952.69e2033c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 14 Aug 2017 21:01:23 +0200, Bernd Kuhls wrote:
> The test programs depend on pthreads:
> http://git.infradead.org/mtd-utils.git/blob/1bfee8660131fca7a18f68e9548a18ca6b3378a0:/configure.ac#l43
> 
> Our option BR2_PACKAGE_MTD_INTEGCK is the only option which enables
> building the test programs so it needs to depend on threads because
> BR2_PACKAGE_MTD_TESTS as a hidden option cannot be selected.

I don't understand this explanation, and actually, I believe it is
wrong, and the thread dependency should be added to
BR2_PACKAGE_MTD_TESTS. Indeed, it's the fact of enabling
BR2_PACKAGE_MTD_TESTS that passes --enable-tests, which requires thread
support.

The thread dependency should be added to BR2_PACKAGE_MTD_TESTS, so that
is other people add more visible options to enable other tests in the
future, they will notice this dependency.

Of course, this thread dependency should then be propagated to all
existing reverse dependencies of BR2_PACKAGE_MTD_TESTS, which means
doing exactly your patch.

So basically, your patch + a "depends on BR2_TOOLCHAIN_HAS_THREADS" on
BR2_PACKAGE_MTD_TESTS and a reworked commit log would be good.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
