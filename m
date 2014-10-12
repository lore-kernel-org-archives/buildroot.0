From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 12 Oct 2014 17:22:40 +0200
Subject: [Buildroot] [PATCHv2 1/2] getent: new package
In-Reply-To: <1408355649-28891-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1408355649-28891-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1408355649-28891-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <543A9CC0.7020802@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/08/14 11:54, Thomas Petazzoni wrote:
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
> This patch proposes to solve this problem by introducing a getent
> package, which has the following behavior:
> 
>  - When the toolchain is glibc based (either internal or external), it
>    installs the getent program that was built and installed in the
>    staging directory. This covers cases 1/ a/ and 2/ a/ above.
> 
>  - When the toolchain is uclibc or musl based, it installs a version
>    of uclibc's getent wrapper script that is built into the getent
>    package. This script is unlikely to change over time, so having it
>    directly built into the package should not cause much issues moving
>    forward. This covers all other cases above.
> 
> This solution allows to install a NSS-capable getent when glibc/eglibc
> is used, and otherwise to rely on uClibc's wrapper script.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Fixes a (run-time) bug, so please apply.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
