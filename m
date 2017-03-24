From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Mar 2017 23:04:51 +0100
Subject: [Buildroot] [PATCH 2/4] package/mke2img: use mkfs to generate
	rootfs image
In-Reply-To: <ec6c517a-18a2-e6c3-a35e-4c794dad7aaa@mind.be>
References: <1490372432-879-1-git-send-email-sebastien.szymanski@armadeus.com>
 <1490372432-879-2-git-send-email-sebastien.szymanski@armadeus.com>
 <ec6c517a-18a2-e6c3-a35e-4c794dad7aaa@mind.be>
Message-ID: <20170324230451.722ab8c0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 24 Mar 2017 22:58:11 +0100, Arnout Vandecappelle wrote:

> > -    # Remove count- and time-based checks, they are not welcome
> > -    # on embedded devices, where they can cause serious boot-time
> > -    # issues by tremendously slowing down the boot.
> > -    tune2fs -c 0 -i 0 "${image}"
> > +    # Generate the filesystem
> > +    mkfs_opts+=( -d "${root_dir}" -N ${nb_inodes} -T small -F )  
> 
>  I have a small preference to specify the options explicitly instead of -T small
> (i.e. -b 1024 -I 128).

What do we force a block size of 1 KB ? 1 KB is really a terrible
choice for most filesystem sizes in nowadays storage devices, and 4 KB
is often much more appropriate.

mkfs.ext234 is capable of selecting a good block size automatically, so
why should we force a block size here?

See:

      -b block-size
              Specify  the  size  of blocks in bytes.  Valid block-size values
              are 1024, 2048 and 4096 bytes per block.  If omitted, block-size
              is  heuristically  determined  by  the  filesystem  size and the
              expected usage of the filesystem (see the -T option).

So I would not set -T small, and I would not pass any -b or -I option.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
