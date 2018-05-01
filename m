From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 May 2018 21:52:47 +0200
Subject: [Buildroot] [PATCH 1/2] busybox: add /dev/std{in, out,
 err} symlinks to inittab
In-Reply-To: <20180404180935.15185-2-joerg.krause@embedded.rocks>
 (=?utf-8?Q?=22J=C3=B6rg?=
 Krause"'s message of "Wed, 4 Apr 2018 20:09:34 +0200")
References: <20180404180935.15185-1-joerg.krause@embedded.rocks>
 <20180404180935.15185-2-joerg.krause@embedded.rocks>
Message-ID: <87in87f90w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

 > Some applications, e.g. bashs process subsitution feature, rely on the
 > convention of `/dev/fd` being a symbolic link to `/proc/self/fd`.

 > This symbolic link and his companions `/dev/std*` are created by (e)udev [1],
 > but not by mdev, resulting in the following error when using the following
 > expression:

 > ```
 > bash: /dev/fd/62: No such file or directory
 > ```

 > For the sake of simplicity, lets fix this by creating the symlinks in inittab.
 > It is only really needed if eudev isn't used, but it doesn't really hurt to
 > create them even if eudev will recreate them afterwards.

 > Note, that we do not create the symlink `/dev/core` as `/proc/kcore` is
 > not available on all platforms, e.g. ARM, and the feature is not much
 > appreciated [2].

 > [1]
 > https://github.com/gentoo/eudev/blob/8943501993322c59a6eb5be456b0d716aafff21e/src/shared/dev-setup.c#L35-L40
 > [2] https://lwn.net/Articles/45315/

 > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
 > ---
 >  package/busybox/inittab | 4 ++++
 >  1 file changed, 4 insertions(+)

 > diff --git a/package/busybox/inittab b/package/busybox/inittab
 > index 3f49f6bd7a..0f6b8cbe37 100644
 > --- a/package/busybox/inittab
 > +++ b/package/busybox/inittab
 > @@ -19,6 +19,10 @@
 >  ::sysinit:/bin/mkdir -p /dev/pts
 >  ::sysinit:/bin/mkdir -p /dev/shm
 >  ::sysinit:/bin/mount -a
 > +::sysinit:/bin/ln -sf /proc/self/fd /dev/fd
 > +::sysinit:/bin/ln -sf /proc/self/fd/0 /dev/stdin
 > +::sysinit:/bin/ln -sf /proc/self/fd/1 /dev/stdout
 > +::sysinit:/bin/ln -sf /proc/self/fd/2 /dev/stderr

This will fail on static /dev on a readonly rootfs, so I've redirected
errors to /dev/null.

Committed with that changed, thanks.

-- 
Bye, Peter Korsgaard
