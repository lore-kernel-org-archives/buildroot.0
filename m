From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 5 Nov 2016 00:20:31 +0100
Subject: [Buildroot] warp7_defconfig build error
In-Reply-To: <CAOMZO5CjVc=qA2u95KydQrLkkjTUZUdB8t+v_QdX-NViRJs4LQ@mail.gmail.com>
References: <CAOMZO5CjVc=qA2u95KydQrLkkjTUZUdB8t+v_QdX-NViRJs4LQ@mail.gmail.com>
Message-ID: <b6863c63-d744-1e73-20b0-c895d9e74012@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04-11-16 20:52, Fabio Estevam wrote:
> Hi,
> 
> Getting the following build error on a warp7_defconfig build with
> latest mainline:
> 
>>>>   Copying overlay board/warp7/rootfs_overlay
>>>>   Generating root filesystem image rootfs.ext2
[snip]
> PATH="/home/fabio/buildroot/output/host/bin:/home/fabio/buildroot/output/host/sbin:/home/fabio/buildroot/output/host/usr/bin:/home/fabio/buildroot/output/host/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
> /home/fabio/buildroot/output/host/usr/bin/pseudo --
> /home/fabio/buildroot/output/build/_fakeroot.fs
> Warning: PSEUDO_PREFIX unset, defaulting to
> /home/fabio/buildroot/output/host/usr.
> rootdir=/home/fabio/buildroot/output/target
> table='/home/fabio/buildroot/output/build/_device_table.txt'
> makedevs: line 23: Couldnt create node
> /home/fabio/buildroot/output/target/dev/console: File exists
> fs/ext2/ext2.mk:46: recipe for target
> '/home/fabio/buildroot/output/images/rootfs.ext2' failed
> make[1]: *** [/home/fabio/buildroot/output/images/rootfs.ext2] Error 1
> Makefile:76: recipe for target '_all' failed
> make: *** [_all] Error 2
> 
> Does anyone have any ideas on how to fix this error?

 I only get this error when makedevs is run for the second time, i.e. when
building the tarball, not the ext2. But perhaps you took this log by re-running
the build?

 Anyway, the problem is pretty clear: mknod() errors out if the target file
already exists. So the surprising thing really is that it used to work under
fakeroot... I guess fakeroot just implemented its mknod()-wrapper incorrectly to
*not* give an error in that case.

 I guess the solution is to update makedevs to remove any pre-existing file
before creating it.


 Regards,
 Arnout


> 
> Thanks
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
