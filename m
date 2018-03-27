From: Adrian Perez de Castro <aperez@igalia.com>
Date: Tue, 27 Mar 2018 20:11:59 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2018-03-25
In-Reply-To: <20180326060025.8B6EC20729@mail.bootlin.com>
References: <20180326060025.8B6EC20729@mail.bootlin.com>
Message-ID: <20180327201159.GD20140@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Mon, 26 Mar 2018 08:00:25 +0200 (CEST), Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Build failures related to your packages:
> 
>          arm |                   brotli-1.0.3 | http://autobuild.buildroot.net/results/74d20ff38766466623cc4a9eb18afcda831bc20b
>          arm |                   brotli-1.0.3 | http://autobuild.buildroot.net/results/f1c4b5aeb12af7b7a3e8ae01c219004ecd9befd6

For those two build failures the issue is that ?BR2_SHARED_LIBS? is unset, so
Buildroot passes ?-DBUILD_SHARED_LIBS=OFF? to CMake in order to compile only
static libraries. Unfortunately, the brotli CMake files do not respect the
?BUILD_SHARED_LIBS? variable and always build both static+shared libraries.
I have a PR sent upstream, which is being discussed and I'll send soon for
inclusion in Buildroot:

   https://github.com/google/brotli/pull/655

Also, I have discovered that the woff2 package won't build after patching
brotli, for a different reason: It includes a couple of ?FindBrotlidec.cmake?
and ?FindBrotlienc.cmake? files which assume that pkg-config returns a single
library name; but a static build of brotli will have both e.g. libbrotlienc
and libbrotlicommon, so the latter never gets passed to the linker resulting
in missing symbols. I am also working on a patch for this.

If it gets too hairy, I might consider making the brotli package depend on
?BR2_SHARED_LIBS? until a fix is available.

Cheers,


--
 Adri?n ?
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180327/e7b8372c/attachment.asc>
