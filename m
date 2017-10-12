From: Markus Mayer <code@mmayer.net>
Date: Thu, 12 Oct 2017 14:06:11 -0700
Subject: [Buildroot] Aarch32 support on aarch64
Message-ID: <CANEuBv6hKFwqNw+4YXpyjdUF2wEu9s_0-Z1f8LzAQFhgfaMbUQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I was wondering if it is currently supported to bundle aarch32
libraries with an aarch64 root file system.

From what I can see in system/system.mk, this doesn't currently seem
possible. Buildroot will install the "native" libraries in target/lib
and then create a lib32 or lib64 symlink pointing to target/lib.

In order to bundle 32 bit and 64 bit libraries for ARM, 64 bit
libraries need to go in /lib64 and 32 bit libraries need to go in
/lib. One could make the latter lib32 and have lib -> lib32. Either
way, the 32 bit library loader, looks in /lib and the 64 bit library
loader looks in /lib64. At least in our toolchain, and I don't think
these paths were customized by us.

The point of this exercise is to allow 32 bit binaries to be executed
in a 64 bit environment. This is for binaries that are currently
available in 32 bit format only.

If this feature doesn't exist yet, would it be reasonably easy to add?
I am willing to give it a shot if you could provide some pointers. I'd
prefer this to be a part of the official buildroot system rather than
being a local hack that just lives in our sources.

So far, I have tried my luck using a post-install script. It works to
the point that I get a root file system that can execute both types of
binaries, but because the post-install script needs to muck with
directory names and symlinks under target/lib*, this approach doesn't
really work very well doing incremental builds. Buildroot as a whole
still expects target/lib to be the destination for 64 bit libraries,
but that is no longer the case after the post-install script changed
this and placed the 32 bit libraries there.

What are your thoughts?

Thanks,
-Markus
