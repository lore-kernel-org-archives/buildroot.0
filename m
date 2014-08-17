From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Aug 2014 10:27:44 +0200
Subject: [Buildroot] [PATCH 1/2] toolchain: add mechanism to install the
 getent program
In-Reply-To: <1408199992-26942-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1408199992-26942-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1408199992-26942-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20140817102744.585db2db@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 16 Aug 2014 16:39:51 +0200, Thomas Petazzoni wrote:
> The ecryptfs-utils scripts require the 'getent' program to be
> installed to find the home directory of users. However, Buildroot
> currently never installs this program, and therefore bug #7142 was
> reported, explaining that ecryptfs-utils is not working properly.
> 
> In normal Linux systems, the getent program is provided by glibc, and
> allows to query not only /etc/passwd, but also other NSS databases
> such as LDAP and others.
> 
> In the context of Buildroot, this gives us several cases:
> 
>  1/ Internal toolchain
> 
>     a/ glibc/eglibc. In this case, the getent program is already built
>        and installed by Buildroot in the staging directory, so the
>        only thing missing is installing it in the target directory.
> 
>     b/ uclibc. uClibc provides a simple shell script that emulates the
>        behavior of getent. It is located in extra/scripts/getent in
>        the uClibc sources, but is currently never installed.
> 
>     c/ musl. There seems to be no getent implementation, and musl does
>        not support NSS.
> 
>  2/ External toolchain
> 
>     a/ glibc/eglibc. In several external toolchains that we tested,
>        there is a pre-built getent binary available in the sysroot,
>        but Buildroot is not installing it to the target.
> 
>     b/ uclibc. The getent wrapper script is typically not part of any
>        external uClibc toolchain.
> 
>     c/ musl. There is no getent implementation.
> 
> This patch proposes to solve this problem by introducing a hidden
> BR2_TOOLCHAIN_INSTALL_GETENT Config.in option, which packages needing
> 'getent' should select, and that toolchain packages should use to know
> whether getent should be installed or not.
> 
> On the toolchain side of things, the behavior is as follows:
> 
>  - For 1/ a/ above, the glibc package is modified to install the
>    getent program that was built.
> 
>  - For 1/ b/ above, the uclibc package is modified to install the
>    getent wrapper script available as part of the uClibc sources.
> 
>  - For 1/ c/ above, the musl package is modified to depend on the new
>    'getent' package, which simply bundles the 'getent' wrapper script
>    of uClibc 0.9.33.
> 
>  - For 2/ a/ above, the toolchain-external package installs the
>    'getent' program that is available as part of the external
>    toolchain sysroot.
> 
>  - For 2/ b/ and 2/ c/ above, the toolchain-external package depends
>    on the new 'getent' package.
> 
> This solution allows to install a NSS-capable getent when glibc/eglibc
> is used, and otherwise to rely on uClibc's wrapper script.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

In fact, I think I have a simpler solution to propose, with just a
getent package, and no need for a BR2_TOOLCHAIN_INSTALL_GETENT stuff.
The getent package would:

 * If the toolchain is glibc/eglibc based (regardless of whether it's
   internal of external), the package would install the getent program
   from STAGING_DIR to TARGET_DIR.

 * If the toolchain is uClibc or musl based, it would install the
   built-in getent wrapper script, which has been extracted from uClibc
   0.9.33.

This solution has the same result as the previously proposed solution,
except for case 1/ b/ (internal uClibc toolchain): with the previous
solution, the getent program of the current uClibc version being used
was installed, while with the new solution, a fixed version of the
getent program will be installed. However, since I don't think the
getent wrapper script is going to change often in uClibc, I don't think
this difference really matters.

This makes the entire patch must simpler. I'll respin with this idea
unless some of you disagree.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
