From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 27 Apr 2019 19:56:17 +0200
Subject: [Buildroot] Possible conflict with systemd and e2fsprogs?
In-Reply-To: <4dcaadcb-0ef8-887e-6681-1f326194315c@digineo.de>
References: <4dcaadcb-0ef8-887e-6681-1f326194315c@digineo.de>
Message-ID: <7bb7a201-cdd2-7e66-deee-6175a264366c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 25/04/2019 20:15, Dominik Menke wrote:
> Greetings,
> 
> I've run into trouble with the following configuration on Buildroot
> 2019.02.1-100-g88eff22a9e (current 2019.02.x branch):
> 
> ??? (
> ????? echo BR2_INIT_SYSTEMD=y
> ????? echo BR2_PACKAGE_E2FSPROGS=y
> ??? ) | cat configs/raspberrypi3_defconfig - > configs/myrpi_defconfig
> ??? make myrpi_defconfig
[snip]
> Looking at /usr/lib/systemd/systemd-fsck (which is executed by
> systemd-fsck-root.service), it calls to /sbin/fsck only if /sbin/fsck.$type
> exists [3]. My guess is that it then fails to proceed because e2fsprog's fsck
> behaves differently then fsck (of package util linux).

 It would be good to find out what exactly is going wrong.
package/systemd/Config.in does select BR2_PACKAGE_UTIL_LINUX_FSCK precisely for
this reason...
I'm adding Carlos (who added that) in Cc, maybe he has something to say about it.

 If it now needs the fsck from e2fsprogs, then it is getting a little tricky to
do the right thing. We'd have to revert the dependency between e2fsprogs fsck
and util-linux fsck.

 However, I seem to recall that e2fsprogs fsck was considered deprecated.

 Regards,
 Arnout
