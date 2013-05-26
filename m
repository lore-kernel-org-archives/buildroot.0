From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 26 May 2013 22:24:33 +0200
Subject: [Buildroot] f2fs support
In-Reply-To: <51A287E9.2090308@gmail.com>
References: <51A287E9.2090308@gmail.com>
Message-ID: <20130526202433.GE3380@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Victor, All,

On 2013-05-27 00:08 +0200, Victor Hiairrassary spake thusly:
> I am trying to add support for f2fs file system in buildroot.
> For now I have already added f2fs-tools for the host, i.e. mkfs.f2fs.
> 
> But I cannot create a f2fs file system image since mkfs.f2fs takes
> a device as parameter (/dev/sda1 for example). This is different than
> jffs2's syntax : '$(MKFS_JFFS2) -d $(TARGET_DIR) -o $@' for example,
> which takes a directory as input.
> 
> Does anybody have an idea about this issue?

Yes, I encountered the same issue when I tried. Since I did not really
need it, I skipped it.

AFAIK, there is currently no way to generate f2fs images like we do for
the other filesystems, like ext2, squashfs or jffs2.

The only solution would be to use a post-image script that would
basically do something like:

  - dd if=/dev/zero of=image.f2fs bs=1M count=0 seek=${size_in_MiB}
  - mkfs.f2fs image.f2fs
  - sudo mount -o loop image.f2fs /somewhere
  - cp foo bar /somewhere
  - sudo umount /somewhere

Otherwise, no idea, except do your own genf2fs util.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
