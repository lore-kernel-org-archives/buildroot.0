From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 6 Aug 2014 19:15:00 +0200
Subject: [Buildroot] manipulating raw disk images as non-root user
In-Reply-To: <CAE9DZURSe+ZvKkQsnBLP6eHM7fvYhQypLDRa2Rm7rx6YMxthmg@mail.gmail.com>
References: <CAE9DZUThNrdD2AOHwsJRZG6fJh3=MRGe+Ggnh4ZrRxgXatJvWA@mail.gmail.com>
 <20140804210403.GG3875@free.fr>
 <CAE9DZURSe+ZvKkQsnBLP6eHM7fvYhQypLDRa2Rm7rx6YMxthmg@mail.gmail.com>
Message-ID: <20140806171500.GC3891@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dallas, All,

On 2014-08-05 16:26 -0500, Dallas Clement spake thusly:
> > Also, if you want to have a look, I make use of those tools in my
> > Buildroot.config project:
> >    http://ymorin.is-a-geek.org/git/buildroot.config/
> 
> > You may want to have a look at:
> >
> http://ymorin.is-a-geek.org/git/buildroot.config/tree/scripts/genimages.d
> > and the subfolders for how to use those tools.
> 
> Thanks Yann.  This is good stuff!  The particular challenge I have is that
> I need to create and populate one vfat partition as well as one ext[2,3,4]
> partition, both within the same disk image file.

The easiest is to generate two different images, and then aggregate the
two to form the final image.

If you first create the final image, then create the two filesystems in
it, you have to provide the offsets to each filesystem when you want to
adress one or the other.

For ext2/3/4, I suggest you use genext2fs, which takes a directory and
its content (recursively), to create am ext2 filesystem, which you can
then convert to ext3 or ext4. We already have a script for that in
Buildroot, in fs/ext2/genext2fs.sh, which you can use as a source of
inspiration.

For vfat, I'm not aware of a tool similar to genext2fs, so you'd have to
create an empty file, then format it with nkfs.vfat, then use the mtools
to copy files into that filesystem image.

Finaly, create a partition table, and append the vfat and ext2
filesystem, to get the final image.

That's not trivial, mind you. And that's the reason I've been working on
this in my little buildroot.config project.

I tried to include this into Buildroot itself, but it is far from being
obvious (to say the least), for a lot of reasons I won't enumerate here.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
