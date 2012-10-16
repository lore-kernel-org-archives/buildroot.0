From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 16 Oct 2012 18:09:45 +0200
Subject: [Buildroot] no /dev/console;
 /dev/null when booting with initrd of type 'ext2'
In-Reply-To: <507D6C50.4060607@wanadoo.fr>
References: <507D6C50.4060607@wanadoo.fr>
Message-ID: <507D86C9.2050008@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/10/12 16:16, Thierry Bultel wrote:
> When booting with an initrd of type "ext2", as it is the case when using a generated ISO image,

  ISO?

> the kernel (a 3.2.21 in my case) does not automagically create the "/dev/null" and "dev/console" entries,
> whereas it does when using a cpio.

  The kernel doesn't, but buildroot does.  We copy fs/cpio/init to /init
for cpio (and initramfs) archives, because those are the ones that are
normally used for initrd.

  You can copy fs/cpio/init to /init in your post-build script, if you like.


> Would the solution be to always have these inodes created in 'device_table.txt' ?
> (Works in my case, I do not plan to use the static table)

  Not really: the kernel doesn't automount devtmps for initrd.

> Or change the ISO generation for using cpio instead of ext2 ?

  There's no point in using ext2 for initrd, it just adds overhead.
So yes, switch to cpio.

  Oh, now I see your point with the iso image: fs/iso9660 uses an ext2
initrd...  Hm, that seems like a bad idea.  Someone should rewrite that.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
