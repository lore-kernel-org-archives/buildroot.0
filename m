From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 15 Nov 2015 22:54:04 +0100
Subject: [Buildroot] [PATCH 0/6] core: ditch LD_LIBRARY_PATH (branch
 yem/no-ld-library-path)
In-Reply-To: <cover.1447449754.git.yann.morin.1998@free.fr>
References: <cover.1447449754.git.yann.morin.1998@free.fr>
Message-ID: <5648FEFC.7070308@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Peter,

On 13-11-15 22:48, Yann E. MORIN wrote:
> Hello All!
> 
> This series is an attempt to ditch LD_LIBRARY_PATH for host binaries.
> 
> Using LD_LIBRARY_PATH is causing build issues on certain distributions,
> like Fedore 23, see:
>     https://bugs.busybox.net/show_bug.cgi?id=8456
>     http://lists.busybox.net/pipermail/buildroot/2015-October/142898.html
> 
> Basically, on Fedora 23, ls (from coreutils) is now linked to libcap,
> which is also linked to libattr. However, outr own libcap is not linked
> to libattr, and ls is too. However, because of our LD_LIBRARY_PATH, the
> host ls is using our libcap, and thus fails to run.
> 
> This series:
>   - ?xes a few host packages, add RPATH to packages where it is missing
>   - fixes the host-mysql definition, allow it to be built always
>   - removes host-perl-file-util, it is not used anywhere and is broken
>   - cleanups libcurl about LD_LIBRARY_PATH
>   - adds a script to check that host binaries have appropriate RPATH
>   - finally removes LD_LIBRARY_PATH
> 
> Even though this is a relatively intrusive change, it in my opinion
> should go in master now, otherwise, we'd get a full release cycle broken
> on Fedora, which would really be a shame... :-/
> 
> Regards,
> Yann E. MORIN.

 Please commit this series ASAP so it can still get some autobuilder exposure.
Except for patch 5/6 which could use some work, but that's anyway not essential.


 Regards,
 Arnout

> 
> 
> The following changes since commit 2bc7c2e009ac08ae80cbf3ce736ade16a6cfcb26:
> 
>   zxing-cpp: needs dynamic library (2015-11-13 16:39:29 +0100)
> 
> are available in the git repository at:
> 
>   git://git.busybox.net/~ymorin/git/buildroot yem/no-ld-library-path
> 
> for you to fetch changes up to 0a14a9ff7f39c78d2a39f8ccde40a9f7a6d020b2:
> 
>   core/pkg-infrastructures: remove LD_LIBRARY_PATH from the environment (2015-11-13 19:51:07 +0100)
> 
> ----------------------------------------------------------------
> Ben Boeckel (1):
>       core/pkg-infrastructures: remove LD_LIBRARY_PATH from the environment
> 
> Yann E. MORIN (5):
>       package/axfsutils: fix Makefile
>       package/mysql: unconditionally define host variables
>       package/perl-file-util: remove host variant
>       package/libcurl: carefully override LD_LIBRARY_PATH
>       core: check host executables have appropriate RPATH
> 
>  package/Makefile.in                      |  2 -
>  package/axfsutils/0001-fix-cflags.patch  | 19 +++++++++
>  package/axfsutils/0002-use-ldflags.patch | 20 +++++++++
>  package/axfsutils/axfsutils.mk           |  2 +-
>  package/libcurl/libcurl.mk               |  2 +-
>  package/mysql/mysql.mk                   | 39 +++++++++---------
>  package/perl-file-util/perl-file-util.mk |  1 -
>  package/pkg-generic.mk                   |  8 ++++
>  support/scripts/check-host-rpath         | 71 ++++++++++++++++++++++++++++++++
>  9 files changed, 140 insertions(+), 24 deletions(-)
>  create mode 100644 package/axfsutils/0001-fix-cflags.patch
>  create mode 100644 package/axfsutils/0002-use-ldflags.patch
>  create mode 100755 support/scripts/check-host-rpath
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
