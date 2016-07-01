From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 11:10:38 +0200
Subject: [Buildroot] [PATCH v6 4/6] libselinux: bump to version 2.5
In-Reply-To: <1466980753-667-5-git-send-email-Aduskett@gmail.com>
References: <1466980753-667-1-git-send-email-Aduskett@gmail.com>
 <1466980753-667-5-git-send-email-Aduskett@gmail.com>
Message-ID: <20160701111038.66168e29@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 26 Jun 2016 18:39:11 -0400, Adam Duskett wrote:
> In addition, if a user is using glibc 2.22, the default CFLAG
> D_FILE_OFFSET_BITS=64 will cause a compile error.  This flag is now
> removed from the CFLAGS in the make file to ensure that toolchains
> compiled against glibc 2.22 will build the new version of the package
> properly.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
> Changes v3 - v6:
>  - Patch series version bump.

fts() is only available in glibc:

 - It is not available at all in musl

 - It is only available optionally in uClibc, and our default uClibc
   configuration does not have it enabled.

Since it's anyway not available in musl, I've decided to add a
dependency of libselinux on glibc.

In addition, I've sent a mail to the SELinux guys to ask them to move
from the fts() interface to the POSIX-compliant nftw() interface. Of
course, if you are interested in submitting a patch that changes
libselinux to use nftw() instead of fts(), it would be more than
welcome.

Applied with the glibc dependency added (and propagated to all
libselinux reverse dependencies). Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
