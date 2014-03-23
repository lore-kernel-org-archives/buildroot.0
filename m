From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 23 Mar 2014 23:18:49 +0100
Subject: [Buildroot] [PATCH v2 6/6] liburcu: disable build with
	gcc-4.8.x on ARM
In-Reply-To: <1394289511-10524-7-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Sat, 8 Mar 2014 15:38:31 +0100")
References: <1394289511-10524-1-git-send-email-s.martin49@gmail.com>
 <1394289511-10524-7-git-send-email-s.martin49@gmail.com>
Message-ID: <87txaotv7a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 > Because of a gcc bug [1], liburcu checks for compiler version [2] and
 > stops the build prematurely if gcc-4.8.[0-2] is detected for ARM.

 > However a bug fix exists [3] and may be backported by ARM toolchain
 > providers; that's what is done in Buildroot [4] or Linaro [5].

 > So, this change:
 > - add a patch in liburcu to allow build with ARM gcc-4.8.2;
 > - adds a new hidden symbol to reflect the toolchain status with regard
 >   to this bug [1];
 > - and controls liburcu visibility.

 > However, a limitation of this is when the user is using a custom
 > toolchain; that's why the bug details have been added in the liburcu
 > help message.

 > [1] http://gcc.gnu.org/bugzilla/show_bug.cgi?id=58854
 > [2] http://git.lttng.org/?p=userspace-rcu.git;a=commitdiff;h=4b79310
 > [3] http://gcc.gnu.org/viewcvs/gcc?view=revision&revision=204665
 > [4] http://git.buildroot.net/buildroot/commit/?id=c443c2be1768ebbdcb76c55d0a08fd7c983488c8
 > [5] http://bazaar.launchpad.net/~linaro-toolchain-dev/gcc-linaro/4.8/revision/122147

 > Signed-off-by: Samuel Martin <s.martin49@gmail.com>

 > ---
 > changes v1 -> v2:
 > - rebase
 > - do not blindly blacklist all ARM gcc-4.8.2 (ThomasP)
 > - introduce BR2_TOOLCHAIN_HAS_GCC_BUG_58854 symbol (ThomasP)
 > ---
 >  package/liburcu/Config.in                          |  7 ++++
 >  ...01-Only-blacklist-ARM-gcc-4.8.0-and-4.8.1.patch | 40 ++++++++++++++++++++++
 >  package/lttng-libust/Config.in                     |  1 +
 >  package/lttng-tools/Config.in                      |  1 +
 >  toolchain/toolchain-common.in                      |  3 ++
 >  toolchain/toolchain-external/Config.in             |  4 +++
 >  6 files changed, 56 insertions(+)
 >  create mode 100644 package/liburcu/liburcu-0001-Only-blacklist-ARM-gcc-4.8.0-and-4.8.1.patch

 > diff --git a/package/liburcu/Config.in b/package/liburcu/Config.in
 > index 15ad5bd..0975e5e 100644
 > --- a/package/liburcu/Config.in
 > +++ b/package/liburcu/Config.in
 > @@ -1,6 +1,7 @@
 >  config BR2_PACKAGE_LIBURCU
 >  	bool "liburcu"
 >  	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_powerpc || BR2_x86_64
 > +	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_58854 # liburcu/gcc-4.8.x bug
 >  	depends on BR2_TOOLCHAIN_HAS_THREADS
 >  	help
 >  	  Userspace implementation of the Read-Copy-Update (RCU)
 > @@ -8,6 +9,12 @@ config BR2_PACKAGE_LIBURCU
 >  	  the LTTng tracing infrastructure, but can be used for other
 >  	  purposes as well.
 
 > +	  On ARM, because of bug:
 > +	    http://gcc.gnu.org/bugzilla/show_bug.cgi?id=58854
 > +	  liburcu cannot be built using gcc 4.8.0, 4.8.1 or 4.8.2 without the
 > +	  following bug fix:
 > +	    http://gcc.gnu.org/viewcvs/gcc?view=revision&revision=204665
 > +
 >  	  http://lttng.org/urcu
 
 >  comment "liburcu needs a toolchain w/ threads"

The toolchain comment should also depend on !BUG_58854 and another
comment should be added (depending on BUG_58854) explaining why the
package isn't available.

Same for lttng-libusb / lttng-tools.

Committed series with this fixed, thanks!

-- 
Bye, Peter Korsgaard
