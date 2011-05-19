From: =?UTF-8?Q?Beno=C3=AEt_Mauduit?= <benoit.mauduit@gmail.com>
Date: Thu, 19 May 2011 10:50:45 +0200
Subject: [Buildroot] [RFC] Override source directories
In-Reply-To: <cover.1305755245.git.thomas.petazzoni@free-electrons.com>
References: <cover.1305755245.git.thomas.petazzoni@free-electrons.com>
Message-ID: <BANLkTiktR9dP6DAtEfpU4U7awRnL0mak4w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, May 18, 2011 at 11:48 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,

Hi Thomas,

> >From an user perspective, it allows ones to create a "local.mk" file
> in the Buildroot main source directory, with variable definitions such
> as :
>
> ?ZLIB_OVERRIDE_SRCDIR = /tmp/zlib
> ?MYAPP_OVERRIDE_SRCDIR = /home/foobar/project/myapp
> ?LIBGLIB2_OVERRIDE_SRCDIR = /home/foobar/git/libglib2
>
> At build time, Buildroot would use those directories at the source for
> the packages, instead of downloading, extracing and patching them in
> the usual way.
>
> Internally, this is implemented inside our package infrastructure, so
> this mechanism should work for all packages that rely on the
> infrastructure. The GENTARGETS macro makes sure that the package build
> process bypasses the download, extract and patch step when
> <pkg>_OVERRIDE_SRCDIR is defined, and instead a symlinking step is
> added. It's very simple.

I do a similar thing but with a python wrapper, so i think it would be
great to have this feature directly inside Buildroot.

> This series of patches also add the <pkg>-reconfigure and
> <pkg>-rebuild targets, which makes it easy for users to restart the
> package build process at the compilation step or at the configuration
> step, without having to mess up with stamp file details.

Very useful for a user point of view :)

> There are still a few issues to solve and discuss, though :
>
> ?* Is local.mk inside the main source directory the good solution?
> ? Should we instead provide a configuration option to set the path to
> ? the override file? Or another solution?

The advantage to have this file on top of Buildroot directory is that
we can easily find it and made local changes.
But a configuration option could be more comprehensive for end user,
and add flexibility.

> ?* As the mechanism is implemented today, "make clean" removes the
> ? symbolic link $(O)/build/<pkg>-<version>, but not the stamp files
> ? created inside this source directory. So next time the build is
> ? started, things will go wrong. To solve this, the only solution I
> ? see is to separate the directory with the stamp files from the
> ? source directory, at least in the case of overriden source
> ? directories.

Maybe i am wrong, but it can be easy to parse the previous local.mk
file and call the updated <pkg>-dirclean rules just for local package
before make clean call 'rm' ?

I will be happy to see this feature inside Buildroot :)

Regards,

-- 
Benoit Mauduit
