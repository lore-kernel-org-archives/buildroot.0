From: Joel Stanley <joel@jms.id.au>
Date: Wed, 11 May 2016 12:58:47 +0930
Subject: [Buildroot] [PATCH] host-fakeroot: re-run autotools to fix
 build on ppc64le host
In-Reply-To: <20160303121530.5727120f@free-electrons.com>
References: <1456984671-10123-1-git-send-email-stewart@linux.vnet.ibm.com>
 <20160303121530.5727120f@free-electrons.com>
Message-ID: <CACPK8Xckxuf-4bA27UTNfXZ_C_KpT8Fmw5wRYOBNuM+PUHbWYg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Thu, Mar 3, 2016 at 9:45 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> On Thu,  3 Mar 2016 16:57:51 +1100, Stewart Smith wrote:
>> When building on ppc64le host (notably Ubuntu 14.04, where this was
>> reported), the configure/libtool combination in fakeroot would
>> incorrectly detect that ld doesn't know how to build shared libraries.
>> Instead of checking for ppc64le libs, it was checking if we could build
>> *big* endian libraries, which the native Ubuntu toolchain on Ubuntu 14.04
>> cannot. The end result would be that you wouldn't get libfakeroot.so,
>> causing a build failure later on.
>>
>> However, if we rerun autotools, this works. Additionally, due to
>> the strange way that fakeroot builds, we need to mkdir build-aux as
>> this directory does not exist in the original source package.
>>
>> With this patch, you can now successfully build OpenPower firmware
>> (which uses buildroot infrastructure) on an Ubuntu 14.04 ppc64le
>> system.
>>
>> Fixes: https://github.com/open-power/op-build/issues/194
>> Signed-off-by: Stewart Smith <stewart@linux.vnet.ibm.com>
>
> I understand the issue, but I don't really like the solution, because
> it means that from now on, host-autoconf, host-automake and
> host-libtool are always going to be built as dependencies of
> host-fakeroot, making a "minimal" build longer.
>
> Unfortunately, I don't have a lot of other proposals to make, except
> maybe seeing if there is a more recent version of fakeroot that has
> an already re-generated configure script that works for you.

I'm updating the OpenPower firmware builds to use 2016.05 and came
across Stewarts patch in our tree. It would be good to get a fix
upstream.

Would you take a patch to update the autotools generated files in
fakeroot? This way we can build our firmware on the systems that they
run on, without anyone having to spend the extra time building.

Cheers,

Joel
