From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Date: Thu, 28 May 2015 17:36:42 +0200
Subject: [Buildroot] [PATCH v2 0/2] fcgiwrap: new package
In-Reply-To: <87twuyw3yz.fsf@dell.be.48ers.dk>
References: <87twuyw3yz.fsf@dell.be.48ers.dk>
Message-ID: <1432827404-1096-1-git-send-email-thomas.claveirole@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> configure.ac:32: error: possibly undefined macro: AC_DEFINE
> [...]
>
> From a quick look it seems like you are missing a dependency on
> host-pkgconf.

Right.  Thanks for pointing this out.

> With that added autoreconf works, but configure fails to detect
> libfcgi when linking statically because you are passing LIBS=-lm to
> it.

I investigated that and found it is actually a bug with libfcgi.
libfcgi's Buildroot package does already include a patch to address
that, but the patch is wrong: it adds -lm to libfcgi programs that
link against libfcgi, while it should directly add -lm to libfcgi
instead.  See first patch in my new series.

By the way, I reproduced it, fixed it, and tested with both static and
dynamic libraries.  This works, at least on my system.

> Care to fix these issues and resend? Thanks!

Yes, here it is.  Thanks for the help. :-)

Thomas Claveirole (2):
  libfcgi (0003-link-against-math.patch): Do actually link when needed.
  fcgiwrap: new package

 package/Config.in                            |  1 +
 package/fcgiwrap/Config.in                   | 10 ++++++++
 package/fcgiwrap/fcgiwrap.mk                 | 13 ++++++++++
 package/libfcgi/0003-link-against-math.patch | 36 +++++++++-------------------
 4 files changed, 35 insertions(+), 25 deletions(-)
 create mode 100644 package/fcgiwrap/Config.in
 create mode 100644 package/fcgiwrap/fcgiwrap.mk

-- 
2.1.4
