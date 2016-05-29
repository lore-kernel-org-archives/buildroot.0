From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 May 2016 23:12:24 +0200
Subject: [Buildroot] [PATCH 2/2] toolchain/helper: don't follow symlinks
 when copying libs to target
In-Reply-To: <CAAXf6LXQ0Ncmh71qb48dS3isFhePWkbpqyvH5ZjFX=isQLVvTg@mail.gmail.com>
References: <cover.1464534979.git.yann.morin.1998@free.fr>
 <16dd334fb29148489afa344c652208a4c512f445.1464534979.git.yann.morin.1998@free.fr>
 <CAAXf6LXQ0Ncmh71qb48dS3isFhePWkbpqyvH5ZjFX=isQLVvTg@mail.gmail.com>
Message-ID: <20160529211224.GC29556@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas DS, All,

On 2016-05-29 20:54 +0200, Thomas De Schampheleire spake thusly:
> On Sun, May 29, 2016 at 5:17 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > In 2a87b64 (toolchain-external: align library locations in target and
> > staging dir), copying the libraries from the sysroot to the target was
> > changed to a simple find-based solution.
> >
> > To be sure that the staging directory was entered to find the libraries,
> > in case the variable was pointing to a symlink, the -L clause to find
> > was used.
> >
> > However, that causes extraneous libraries to be copied over.
> >
> > For example, a ct-ng toolchain would have this sysroot (e.g for an arm
> > 32-bit toolchain):
> >
> >     .../sysroot/lib/
> >     .../sysroot/lib32 -> lib
> >     .../sysroot/lib64 -> lib
> >     .../sysroot/usr/lib/
> >     .../sysroot/usr/lib32 -> lib
> >     .../sysroot/usr/lib64 -> lib
> >
> > Which we would carry as-is to our own sysroot.
> >
> > But then, in target, our skeleton creates the /lib/ and /usr/lib
> > directories, with the necessary lib32 or lib64 symlink pointing to it.
> > In this case, a lib32->lib symlink is created, but no lib64 symlink
> > since this is a 32-bit architecture.
> 
> Until here, the explanation is clear to me.
> 
> >
> > So, when we copy over the libraries from our staging to the target
> > directory, we end creating a /usr/lib64/ directory.
> 
> But this could be expanded upon, I think, as this is the actual
> problem statement.

OK, here's what happens:

    $ ls -lF /home/ymorin/dev/buildroot/O/host/usr/arm-buildroot-linux-gnueabihf/sysroot \
             /home/ymorin/dev/buildroot/O/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr
    /home/ymorin/dev/buildroot/O/host/usr/arm-buildroot-linux-gnueabihf/sysroot:
    total 8
    lrwxrwxrwx 1 ymorin ymorin    7 May 29 23:03 bin -> usr/bin/
    drwxr-xr-x 2 ymorin ymorin 4096 May 16 23:59 etc/
    lrwxrwxrwx 1 ymorin ymorin    7 May 29 23:03 lib -> usr/lib/
    lrwxrwxrwx 1 ymorin ymorin    3 May 29 23:03 lib32 -> lib/
    lrwxrwxrwx 1 ymorin ymorin    8 May 29 23:03 sbin -> usr/sbin/
    drwxr-xr-x 8 ymorin ymorin 4096 May 16 23:58 usr/

    /home/ymorin/dev/buildroot/O/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr:
    total 24
    drwxr-xr-x  2 ymorin ymorin 4096 May 16 23:59 bin/
    drwxr-xr-x 33 ymorin ymorin 4096 May 16 23:59 include/
    drwxr-xr-x  5 ymorin ymorin 4096 May 17 00:02 lib/
    lrwxrwxrwx  1 ymorin ymorin    3 May 16 23:39 lib32 -> lib/
    lrwxrwxrwx  1 ymorin ymorin    3 May 16 23:39 lib64 -> lib/
    drwxr-xr-x  3 ymorin ymorin 4096 May 16 23:58 libexec/
    drwxr-xr-x  2 ymorin ymorin 4096 May 16 23:59 sbin/
    drwxr-xr-x  4 ymorin ymorin 4096 May 17 00:11 share/

    $ find -L /home/ymorin/dev/buildroot/O/host/usr/arm-buildroot-linux-gnueabihf/sysroot -name 'libatomic.so.*'
    /home/ymorin/dev/buildroot/O/host/usr/arm-buildroot-linux-gnueabihf/sysroot/lib/libatomic.so.1.1.0
    /home/ymorin/dev/buildroot/O/host/usr/arm-buildroot-linux-gnueabihf/sysroot/lib/libatomic.so.1
    /home/ymorin/dev/buildroot/O/host/usr/arm-buildroot-linux-gnueabihf/sysroot/lib32/libatomic.so.1.1.0
    /home/ymorin/dev/buildroot/O/host/usr/arm-buildroot-linux-gnueabihf/sysroot/lib32/libatomic.so.1
    /home/ymorin/dev/buildroot/O/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libatomic.so.1.1.0
    /home/ymorin/dev/buildroot/O/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libatomic.so.1
    /home/ymorin/dev/buildroot/O/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib32/libatomic.so.1.1.0
    /home/ymorin/dev/buildroot/O/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib32/libatomic.so.1
    /home/ymorin/dev/buildroot/O/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib64/libatomic.so.1.1.0
    /home/ymorin/dev/buildroot/O/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib64/libatomic.so.1

So, the 'find -L' follows symlinks to directories, and thus finds the
required libraries in multiple locations.

I'll see to improve that part of the commit log.

> > This was very difficult to observe, as no /lib64/ directory is created
> > and this only happens with a merged /usr.
> >
> > Since the reason to use -L was to be sure to enter our staging
> > directory, we just need to ensure that the path ends up with a slash, as
> > was already talked about in this thread:
> >     http://lists.busybox.net/pipermail/buildroot/2016-April/159737.html
> 
> While the trailing slash is indeed a fine solution, it is kind of dirty.
> I wonder if -H would do the trick too:
[--SNIP--]
> It should make sure that only STAGING_DIR is resolved, not any other
> symbolic link encountered.

Well, appending a slash is a sure mean to make it sure the target of the
symlink (if it is a symlink to start with) is entered. I don't see where
it is dirty.

Yes, -H does the job, too. But I think it is better that we append a
slash: it makes it explicit we want to treat it as a directory, not a
potential symlink.

However, why would we need to handle the symlink case, to begin with? We
are controlling the variable passed in this case and it points to a copy
of the sysroot we did make. I.e. that variable is not provided by the
user; it is always filled by our infra.

Surely, if we really, really, like really-really, want to make it
explicit we want the directory pointed-to by the symlink, then, we
should probably do:

    find $$(readlink -f $(STAGING_DIR)) -name blabla

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
