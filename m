From: Thomas Preston <thomas.preston@codethink.co.uk>
Date: Wed, 20 Nov 2019 14:46:03 +0000
Subject: [Buildroot] [PATCH 2/2] package/libv4l: link with libatomic
 when needed
In-Reply-To: <20191030232618.5cd32feb@gmx.net>
References: <20191030065303.22948-1-bernd.kuhls@t-online.de>
 <20191030065303.22948-2-bernd.kuhls@t-online.de>
 <20191030113040.474a31f9@windsurf> <20191030232618.5cd32feb@gmx.net>
Message-ID: <d90c679a-a4f6-d825-63c8-ae90baf1ea73@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey,

On 30/10/2019 22:26, Peter Seiderer wrote:
> Adding the (missing?) '-L/home/seiderer/Work/Buildroot/build_sparc_qt5multimedia_001/host/bin/../sparc-buildroot-linux-uclibc/sysroot/usr/lib'
> libtool command line parameter fixes the linking for the actual build...
> 
> Any hint which (buildroot?) change triggered the remove of the link/library path removal?
> 

As previously discussed [0], the missing `-L..` is because pkgconf no longer
returns "system" include or library directories with -I and -L  (see [1]).
These are already in the compiler's default search path and were causing
include-order related bugs when using -isystem.

However, it looks like that change has caused a problem here, where the output
from pkgconf is being passed to libtool to point it at the "system" library
directory in the sysroot.

I don't know enough about libtool yet, but I think there are a few ways around
this:
1. Tell libtool where the sysroot is by some other mechanism
2. Tell pkgconf that we want to keep the system lib directories, when it is
   used to create arguments to libtool. The following argument will always 
   return -L, as expected above:

        pkg-config --keep-system-libs

I'm looking into this, but someone with a more intimate knowledge of libtool +
pkg-autotools.mk, might be able to help here.

Thanks,
Thomas Preston

[0] http://lists.busybox.net/pipermail/buildroot/2019-November/266369.html
[1] http://lists.busybox.net/pipermail/buildroot/2019-October/263178.html
