From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 5 Nov 2016 10:23:28 +0100
Subject: [Buildroot] warp7_defconfig build error
In-Reply-To: <b6863c63-d744-1e73-20b0-c895d9e74012@mind.be>
References: <CAOMZO5CjVc=qA2u95KydQrLkkjTUZUdB8t+v_QdX-NViRJs4LQ@mail.gmail.com>
 <b6863c63-d744-1e73-20b0-c895d9e74012@mind.be>
Message-ID: <20161105092328.GA3743@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2016-11-05 00:20 +0100, Arnout Vandecappelle spake thusly:
> On 04-11-16 20:52, Fabio Estevam wrote:
> > Hi,
> > 
> > Getting the following build error on a warp7_defconfig build with
> > latest mainline:
> > 
> >>>>   Copying overlay board/warp7/rootfs_overlay
> >>>>   Generating root filesystem image rootfs.ext2
> [snip]
> > PATH="/home/fabio/buildroot/output/host/bin:/home/fabio/buildroot/output/host/sbin:/home/fabio/buildroot/output/host/usr/bin:/home/fabio/buildroot/output/host/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
> > /home/fabio/buildroot/output/host/usr/bin/pseudo --
> > /home/fabio/buildroot/output/build/_fakeroot.fs
> > Warning: PSEUDO_PREFIX unset, defaulting to
> > /home/fabio/buildroot/output/host/usr.
> > rootdir=/home/fabio/buildroot/output/target
> > table='/home/fabio/buildroot/output/build/_device_table.txt'
> > makedevs: line 23: Couldnt create node
> > /home/fabio/buildroot/output/target/dev/console: File exists
> > fs/ext2/ext2.mk:46: recipe for target
> > '/home/fabio/buildroot/output/images/rootfs.ext2' failed
> > make[1]: *** [/home/fabio/buildroot/output/images/rootfs.ext2] Error 1
> > Makefile:76: recipe for target '_all' failed
> > make: *** [_all] Error 2
> > 
> > Does anyone have any ideas on how to fix this error?
> 
>  I only get this error when makedevs is run for the second time, i.e. when
> building the tarball, not the ext2. But perhaps you took this log by re-running
> the build?
> 
>  Anyway, the problem is pretty clear: mknod() errors out if the target file
> already exists. So the surprising thing really is that it used to work under
> fakeroot... I guess fakeroot just implemented its mknod()-wrapper incorrectly to
> *not* give an error in that case.
> 
>  I guess the solution is to update makedevs to remove any pre-existing file
> before creating it.

No, I prefer this is considered an error: the file should not be there
in the first place if the devtable says it is a dev-node.

In this specific case, as you guessed, that's because we build two FS,
one ext2 then a tarball. This is indeed an error, but it is an error
about how pseudo behaves.

After I re-read the entire pseudo doc, it appears that it is not a
drop-in replacement for fakeroot... In basic cases, it appears to work
as if it were, but once you reach not-really-complex scenarii, it ceases
to work as we expect.

That's because pseudo uses a "DB" and a daemon-mode. The daemon we
really don't care about; or more appropriately, it goes in our way.
As I understand it, the DB would be there to avoid all these issues, but
it fails.

I'm working on this, at least to understand what happens.

But I'm more and more convinced we should revert for this release.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
