From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 16 Jan 2013 23:06:02 +0100
Subject: [Buildroot] [PATCH 1/5] Add a post-image script mechanism
In-Reply-To: <20130116224159.774f3f70@skate>
References: <1358363393-29977-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <201301162103.43793.yann.morin.1998@free.fr> <20130116224159.774f3f70@skate>
Message-ID: <201301162306.02062.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Wednesday 16 January 2013 Thomas Petazzoni wrote:
> On Wed, 16 Jan 2013 21:03:43 +0100, Yann E. MORIN wrote:
> > No need to pass $(BINARIES_DIR) as it now is in the environment.
> I'd prefer to pass $(BINARIES_DIR) as argument, in order to keep a
> symmetry with what we do for the post-build script.
> 
> > Would it make sense to run this under fakeroot?
> Why?

For example, I need to create multiple partitions for my device, so I
need one file system image per partition:
  - vfat on /boot
  - squashfs on /
  - ext2 on /home

So I would :
  - configure Buildroot to build only a tarball
  - configure Buildroot to run my post-image script
  - extract the tarball
  - generate each file system images

But the untar would loose the device nodes and the files UIDs and GIDs,
forcing me do run fakeroot inside the script, saving/loading the fakeroot
DB, for every commands in my script.

Having Buildroot do the fakeroot would ensure this consistency.

> > Also, I wonder if we could instead call these scripts for each image
> > we generate, so it will already be run under fakeroot.
> 
> No, I don't think it's a good idea. For example, in my use-case, it was
> used to create a firmware image that bundles multiple images generated
> by Buildroot. So getting called on a per-image basis doesn't make sense.

OK, so it makes sense to run the scripts only once at the end. Agreed.

[--SNIP--]
> I really don't see the point of putting more complexity into this.
> Let's have something nicely symmetric between the post-build script
> feature and the post-image script feature.

Right, agreed.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
