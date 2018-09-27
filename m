From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Sep 2018 14:11:26 +0200
Subject: [Buildroot] [PATCH 2/2] nilfs-utils: drop NPTL dependency
In-Reply-To: <20180926202356.GC27972@airbook.echont.local> (Kurt Van Dijck's
 message of "Wed, 26 Sep 2018 22:23:56 +0200")
References: <20180926182045.28484-1-fontaine.fabrice@gmail.com>
 <20180926182045.28484-2-fontaine.fabrice@gmail.com>
 <20180926202356.GC27972@airbook.echont.local>
Message-ID: <874lebw369.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Kurt" == Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be> writes:

 > On wo, 26 sep 2018 20:20:45 +0200, Fabrice Fontaine wrote:
 >> The latest uClibc-ng version (1.0.30) provides clock_nanosleep() even
 >> for non NPTL configurations.

 > Do you mean that buildroot must only be built with uClibc-ng > 1.0.30?

I guess you mean >= . Indeed, only uClibc-ng 1.0.30 built with our
defconfig is really supported.

1.0.30 was released back in April, so requiring this for our November
release is IMHO OK.

 >> 
 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 >> ---
 >> package/nilfs-utils/Config.in | 6 ++----
 >> 1 file changed, 2 insertions(+), 4 deletions(-)
 >> 
 >> diff --git a/package/nilfs-utils/Config.in b/package/nilfs-utils/Config.in
 >> index e245dc4656..7b239b1af5 100644
 >> --- a/package/nilfs-utils/Config.in
 >> +++ b/package/nilfs-utils/Config.in
 >> @@ -2,7 +2,6 @@ config BR2_PACKAGE_NILFS_UTILS
 >> bool "nilfs-utils"
 >> depends on BR2_USE_MMU # util-linux libmount, libblkid
 >> depends on BR2_TOOLCHAIN_HAS_THREADS # sem_open()
 >> -	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # clock_nanosleep()

 > I think you break other configurations here.
 > Did you try testbuilds with this change?

It does not introduce breakage as such. Before, if you had an uClibc-ng
config without NPTL you couldn't enable this package - Now you can. If
you are using an old pre-1.0.30 external uClibc-ng toolchain then it
will not actually build, but that is a general problem with external
uClibc-ng toolchains if they are not in sync with the internal
toolchain.

In any case, the solution is simply - Just rebuild your toolchain.


 > I remember a strong debate some time ago where the final outcome was
 > that this constructs is put on several places, and that it would be
 > better to introduce something like BR2_TOOLCHAIN_HAS_CLOCK_NANOSLEEP
 > or something alike instead. This would really solve the issue.

The problem is that a user of an external uClibc-ng toolchain has to
answer all these fine grained configuration options (and we have to
verify them), so it doesn't really scale.

-- 
Bye, Peter Korsgaard
