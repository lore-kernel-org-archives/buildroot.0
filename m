From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 11 Aug 2020 23:53:16 +0200
Subject: [Buildroot] [PATCH 1/1] package/librtlsdr: bump to more recent
 upstream master version
In-Reply-To: <20200809093538.126676-1-titouan.christophe@railnova.eu>
References: <20200809093538.126676-1-titouan.christophe@railnova.eu>
Message-ID: <20200811235316.46cda2de@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  9 Aug 2020 11:35:38 +0200
Titouan Christophe <titouan.christophe@railnova.eu> wrote:

> Since 948666dfde1e0a5d149442f80facc162a83016ad, librtlsdr in Buildroot is no longer
> built from an official release, but from a commit on the master branch. However, the
> commit that was referenced has a broken pkgconfig file templating, such that
> other packages using `pkgconfig --libs librtlsdr` as part of their build process
> (such as dump1090) could not be built anymore:
> 
> Before 948666dfde1e0a5d149442f80facc162a83016ad:
> $ cat staging/usr/lib/pkgconfig/librtlsdr.pc
> prefix=/usr
> exec_prefix=${prefix}
> libdir=${exec_prefix}/lib
> includedir=${prefix}/include
> 
> Name: RTL-SDR Library
> Description: C Utility Library
> Version: 0.6.0
> Cflags: -I${includedir}/
> Libs: -L${libdir} -lrtlsdr -lusb-1.0
> Libs.private:
> 
> On 948666dfde1e0a5d149442f80facc162a83016ad:
> $ cat staging/usr/lib/pkgconfig/librtlsdr.pc
> prefix=
> exec_prefix=
> libdir=
> includedir=
> 
> Name: RTL-SDR Library
> Description: C Utility Library
> Version: 7082
> Cflags: -I${includedir}/
> Libs: -L${libdir} -lrtlsdr
> Libs.private:  -lusb-1.0
> 
> In the meantime, upstream released a bugfix for that ([1]), so we bump to that
> commit as well, and update the only patch for shared libs accordingly, because
> upstream also added a new tool called `rtl_biast` in the meantime.
> 
> Finaly, we update the hash file to the two-spaces convention.
> 
> Fixes: http://autobuild.buildroot.net/results/b4c/b4cdcb59cc61c51c024197a64865ad4b60023d0c/
> 
> [1]: https://github.com/steve-m/librtlsdr/commit/ed0317e6a58c098874ac58b769cf2e609c18d9a5
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
> ---
>  .../0001-disable_shared_library_target_in_build.patch    | 9 +++++----
>  package/librtlsdr/librtlsdr.hash                         | 4 ++--
>  package/librtlsdr/librtlsdr.mk                           | 2 +-
>  3 files changed, 8 insertions(+), 7 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
