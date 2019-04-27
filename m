From: Dominik Menke <dom@digineo.de>
Date: Sat, 27 Apr 2019 23:20:22 +0200
Subject: [Buildroot] Possible conflict with systemd and e2fsprogs?
In-Reply-To: <7bb7a201-cdd2-7e66-deee-6175a264366c@mind.be>
References: <4dcaadcb-0ef8-887e-6681-1f326194315c@digineo.de>
 <7bb7a201-cdd2-7e66-deee-6175a264366c@mind.be>
Message-ID: <1780e90c-9198-e9b6-5b38-9b27930337e2@digineo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 4/27/19 7:56 PM, Arnout Vandecappelle wrote:
> On 25/04/2019 20:15, Dominik Menke wrote:
>> I've run into trouble with the following configuration on Buildroot
>> 2019.02.1-100-g88eff22a9e (current 2019.02.x branch):
>>
>>  ??? (
>>  ????? echo BR2_INIT_SYSTEMD=y
>>  ????? echo BR2_PACKAGE_E2FSPROGS=y
>>  ??? ) | cat configs/raspberrypi3_defconfig - > configs/myrpi_defconfig
>>  ??? make myrpi_defconfig

As pointed out in another response, BR2_TOOLCHAIN_BUILDROOT_GLIBC=y is 
missing here.


> [snip]
>> Looking at /usr/lib/systemd/systemd-fsck (which is executed by
>> systemd-fsck-root.service), it calls to /sbin/fsck only if /sbin/fsck.$type
>> exists [3]. My guess is that it then fails to proceed because e2fsprog's fsck
>> behaves differently then fsck (of package util linux).
> 
>   It would be good to find out what exactly is going wrong.

Any advise on how I can to get more information? I'm struggeling with 
the UART of the RPi 3B+ to be usable (this may be related to issue 11766 
[0]). Currently, I only have the output on the Monitor connected on the 
HDMI port, only a few pages of scrollback buffer, and no way to interact 
with the system.

[0]: https://bugs.busybox.net/show_bug.cgi?id=11766


> package/systemd/Config.in does select BR2_PACKAGE_UTIL_LINUX_FSCK precisely for
> this reason...
> I'm adding Carlos (who added that) in Cc, maybe he has something to say about it.
> 
>   If it now needs the fsck from e2fsprogs, then it is getting a little tricky to
> do the right thing. We'd have to revert the dependency between e2fsprogs fsck
> and util-linux fsck.

I don't think systemd needs e2fsprog's fsck. *I* need e2fsprogs, but 
only for its resize2fs (nevertheless, it also installs /sbin/fsck.ext4). 
However, systemd finds /sbin/fsck.ext4, and proceeds to execute /sbin/fsck.

My current working theory is that /sbin/fsck then in turn calls out to 
/sbin/fsck.ext4. As far as I can tell, /sbin/fsck originates from 
util-linux, while /sbin/fsck.* come from e2fsprogs.


>   However, I seem to recall that e2fsprogs fsck was considered deprecated.
> 
>   Regards,
>   Arnout

Kind Regards,
Dominik
