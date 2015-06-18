From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Jun 2015 11:02:11 +0200
Subject: [Buildroot] Busybox build fails on raspberrypi defconfig
In-Reply-To: <CAJtjsKaR=yJDgzzC0JupB7DJYvuxvOwvU2Ziv_6eU1-a8fhyFg@mail.gmail.com>
References: <CAJtjsKZ9zeYzwSkMKiAvUz50e_7L9HKbNLY8WWwz5e59=AHGSw@mail.gmail.com>
 <CAJtjsKa9Osr3VjF6jBysCFPEKhh4c8HAHVP7FfVj07_N_B1FMQ@mail.gmail.com>
 <20150617164134.01411faf@free-electrons.com>
 <CAJtjsKaR=yJDgzzC0JupB7DJYvuxvOwvU2Ziv_6eU1-a8fhyFg@mail.gmail.com>
Message-ID: <20150618110211.2bc21e04@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 18 Jun 2015 10:54:23 +0200, Johan Oudinet wrote:

> As I don't know how to do better than make clean and make defconfig to
> rebuild from scratch, I've cloned the repository elsewhere.
> Indeed, this time, it successfully compiles.
> 
> I still don't know why it didn't compile before, as I'm pretty sure
> the .config was using uClibc-ng configuration file (because I've
> manually changed it to uClibc-0.9.33.config when I reverted to uClibc
> 0.9.33). At least, I know the problem is not in the git master branch.

I told you in my previous e-mail, but maybe it wasn't clear. It's due
to a kconfig limitation/bug. Basically, here is the scenario:

 * You start from a fresh configuration.

 * You select uClibc 0.9.33, and exit menuconfig.

 * Automatically, the file package/uclibc/uClibc-0.9.33.config is used
   as the uclibc configuration file (option BR2_UCLIBC_CONFIG)

 * Now, you go back to menuconfig, and you decide to switch to
   uClibc-ng.

-> And now, instead of automatically switching to
package/uclibc/uClibc-ng.config, package/uclibc/uClibc-0.9.33.config is
kept as the value of BR2_UCLIBC_CONFIG. This is the limitation of
kconfig I'm talking about above.

See the log below:

$ make distclean
$ make menuconfig
[ no changes, so uClibc 0.9.33 is chosen, at least as long as you are
using Buildroot 2015.05 or older ]
$ grep -E "(BR2_UCLIBC_VERSION|BR2_UCLIBC_CONFIG)" .config
[...]
BR2_UCLIBC_VERSION_0_9_33=y
# BR2_UCLIBC_VERSION_NG is not set
[...]
BR2_UCLIBC_CONFIG="package/uclibc/uClibc-0.9.33.config"
$ make menuconfig
[ switch to uClibc-ng, save and exit ]
$ grep -E "(BR2_UCLIBC_VERSION|BR2_UCLIBC_CONFIG)" .config
[...]
# BR2_UCLIBC_VERSION_0_9_33 is not set
BR2_UCLIBC_VERSION_NG=y
[...]
BR2_UCLIBC_CONFIG="package/uclibc/uClibc-0.9.33.config"

So you end up doing a build of uClibc-ng, but using the uClibc 0.9.33
configuration file, which does not have UTMP=y (because that option did
not exist back in uClibc 0.9.33). So from the point of view of
uClibc-ng, UTMP support is disabled.

One way we could get around this problem is by making the
BR2_UCLIBC_CONFIG option visible only if the user selects another
option like "Use a custom uClibc configuration file".

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
