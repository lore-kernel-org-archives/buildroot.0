From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 29 May 2016 20:54:20 +0200
Subject: [Buildroot] [PATCH 2/2] toolchain/helper: don't follow symlinks
 when copying libs to target
In-Reply-To: <16dd334fb29148489afa344c652208a4c512f445.1464534979.git.yann.morin.1998@free.fr>
References: <cover.1464534979.git.yann.morin.1998@free.fr>
 <16dd334fb29148489afa344c652208a4c512f445.1464534979.git.yann.morin.1998@free.fr>
Message-ID: <CAAXf6LXQ0Ncmh71qb48dS3isFhePWkbpqyvH5ZjFX=isQLVvTg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, May 29, 2016 at 5:17 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> In 2a87b64 (toolchain-external: align library locations in target and
> staging dir), copying the libraries from the sysroot to the target was
> changed to a simple find-based solution.
>
> To be sure that the staging directory was entered to find the libraries,
> in case the variable was pointing to a symlink, the -L clause to find
> was used.
>
> However, that causes extraneous libraries to be copied over.
>
> For example, a ct-ng toolchain would have this sysroot (e.g for an arm
> 32-bit toolchain):
>
>     .../sysroot/lib/
>     .../sysroot/lib32 -> lib
>     .../sysroot/lib64 -> lib
>     .../sysroot/usr/lib/
>     .../sysroot/usr/lib32 -> lib
>     .../sysroot/usr/lib64 -> lib
>
> Which we would carry as-is to our own sysroot.
>
> But then, in target, our skeleton creates the /lib/ and /usr/lib
> directories, with the necessary lib32 or lib64 symlink pointing to it.
> In this case, a lib32->lib symlink is created, but no lib64 symlink
> since this is a 32-bit architecture.

Until here, the explanation is clear to me.

>
> So, when we copy over the libraries from our staging to the target
> directory, we end creating a /usr/lib64/ directory.

But this could be expanded upon, I think, as this is the actual
problem statement.

>
> This was very difficult to observe, as no /lib64/ directory is created
> and this only happens with a merged /usr.
>
> Since the reason to use -L was to be sure to enter our staging
> directory, we just need to ensure that the path ends up with a slash, as
> was already talked about in this thread:
>     http://lists.busybox.net/pipermail/buildroot/2016-April/159737.html

While the trailing slash is indeed a fine solution, it is kind of dirty.
I wonder if -H would do the trick too:

       -H     Do  not  follow symbolic links, except while processing the com?
              mand line arguments.  When find examines or  prints  information
              about  files, the information used shall be taken from the prop?
              erties of the symbolic link itself.   The only exception to this
              behaviour is when a file specified on the command line is a sym?
              bolic link, and the link can be resolved.  For  that  situation,
              the  information  used is taken from whatever the link points to
              (that is, the link is followed).  The information about the link
              itself  is used as a fallback if the file pointed to by the sym?
              bolic link cannot be examined.  If -H is in effect  and  one  of
              the  paths specified on the command line is a symbolic link to a
              directory, the contents  of  that  directory  will  be  examined
              (though of course -maxdepth 0 would prevent this).

It should make sure that only STAGING_DIR is resolved, not any other
symbolic link encountered.

/Thomas
