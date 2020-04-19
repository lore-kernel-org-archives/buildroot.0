From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 19 Apr 2020 16:26:54 +0200
Subject: [Buildroot] [PATCH v4 1/8] package/libselinux: bump version to
 3.0
In-Reply-To: <20200415125921.57648-2-matthew.weber@rockwellcollins.com>
References: <20200415125921.57648-1-matthew.weber@rockwellcollins.com>
 <20200415125921.57648-2-matthew.weber@rockwellcollins.com>
Message-ID: <20200419162654.57768ee9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 15 Apr 2020 07:59:14 -0500
Matt Weber <matthew.weber@rockwellcollins.com> wrote:

> From: Adam Duskett <aduskett@gmail.com>
> 
> Other changes:
>   - Remove upstream packages.
>   - Modify existing patches to work with 3.0.
>   - Remove Python2 check, as 3.0 has removed Python2 support.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> ---
> Changes
> v3 -> v4
>  - Switched back to using x.y for versioning

This breaks the build with some old glibc versions where <fts.h> is
incompatible with FILE_OFFSET_BITS=64. We already have a work-around
for this in libselinux.mk, but it seems it's no longer sufficient, as
-D_FILE_OFFSET_BITS=64 gets into the command line:

/home/buildroot/autobuild/instance-1/output-1/host/bin/arm-none-linux-gnueabi-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -Os -I../include -D_GNU_SOURCE   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -lpcre -lpthread -L../src  selabel_get_digests_all_partial_matches.c  -lselinux  -o selabel_get_digests_all_partial_matches
In file included from selabel_get_digests_all_partial_matches.c:7:0:
/home/buildroot/autobuild/instance-1/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/fts.h:41:3: error: #error "<fts.h> cannot be used with -D_FILE_OFFSET_BITS==64"
 # error "<fts.h> cannot be used with -D_FILE_OFFSET_BITS==64"
   ^

Could you have a look ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
