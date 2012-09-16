From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 16 Sep 2012 12:15:44 +0200
Subject: [Buildroot] [PATCH 0/11 v2] Rework the gettext handling
In-Reply-To: <201209091837.30483.yann.morin.1998@free.fr>
References: <1346709781-18158-1-git-send-email-yann.morin.1998@free.fr>
 <201209091837.30483.yann.morin.1998@free.fr>
Message-ID: <CAHXCMMLSY73K9CZc+wmhRMk_dqiFXkbYUNoQ==+g66JaY6P7qA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann, all,

2012/9/9 Yann E. MORIN <yann.morin.1998@free.fr>:
> Hello All!
>
> On Tuesday 04 September 2012 00:02:50 Yann E. MORIN wrote:
>> This patch series is an aggregation of the gettext rework by Samuel,
>> Maxime, Thomas, and I.
>
> Ping? Any commnent?

Here is the results of some tests I've run; the review is done in the patches.

After applying the patch series, I tried to build all packages
depending on gettext.

Tests configurations:
1) toolchain based on qemu_arm_versatile defconfig (so, a buildroot
uclibc toolchain):
- with large file support
- with ipv6 support
- with inet-rpc support
- with locale support
- with C++ support
- gettext package enabled + gettext tools installation enabled

2) toolchain based on qemu_arm_versatile defconfig (so, a buildroot
uclibc toolchain):
- with large file support
- with ipv6 support
- with inet-rpc support
- without locale support
- with C++ support
- gettext package enabled + gettext tools installation enabled


Using the test config 1), I managed to build all packages touch by the
series, including gmpc, but not midori :-/ (for some reasons detailed
below, not directly related with the series).
Using the test config 2), I reached some corner cases/issues most of
the time related with libintl.


Here is the issue list:

* midori depends on webkit, which seems depends on some host-perl.
  Depending on host-microperl does not seem to be enough (to be confirmed).
  I've not yet tested if the perl patch series posted by Francois
Perrad could improve this point.

* some packages dependencies seem broken with a  uclibc-based
toolchain without locale support; in such a configuration, gettext
does not build libintl, but:
  - libglib2 seems to depends on gettext and BR2_ENABLE_LOCALE since
it checks for libintl.h during the configuration phase;
  - php: intl extension should depend on BR2_ENABLE_LOCALE, but it is
still available when nls support is disabled in the toolchain;
  - php: gettext extension should depend on BR2_ENABLE_LOCALE since it
checks for libintl existence;
  - lshw should depend on BR2_ENABLE_LOCALE since it includes <libintl.h>;
  - ndisc6 should either depend on BR2_ENABLE_LOCALE or  trigger the
gettext build provided within ndisc6 sources;
  - util-linux should either depend on BR2_ENABLE_LOCALE or  trigger
the gettext build provided within util-linux sources;


Cheers,

-- 
Sam
