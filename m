From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Dec 2015 11:21:03 +0100
Subject: [Buildroot] [PATCH] package/libnspr: disable for musl toolchains
In-Reply-To: <1440870131-17263-1-git-send-email-romain.naour@openwide.fr>
References: <1440870131-17263-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20151224112103.2ad48d11@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain,

On Sat, 29 Aug 2015 19:42:11 +0200, Romain Naour wrote:
> libnspr use getprotobyname_r() which is not available on musl.
> 
> Also there is another error due to missing _PR_HAVE_GETHOSTBYNAME2 define:
> prnetdb.c: In function ?PR_GetIPNodeByName?:
> prnetdb.c:898:2: error: #error "Unknown name-to-address translation function"
>  #error "Unknown name-to-address translation function"
> 
> _PR_HAVE_GETHOSTBYNAME2 is only set in pr/include/md/_linux.h if __GLIBC__
> is defined.
> 
> To conclude, libnspr is not ready for musl.
> Add reverse dependency on ecryptfs-utils and libnss.
> 
> Fixes:
> http://autobuild.buildroot.net/results/c75/c756f82dfc49611fa3f650d9cf2a71b59d23c3d0/
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  package/ecryptfs-utils/Config.in | 5 +++--
>  package/libnspr/Config.in        | 5 +++--
>  package/libnss/Config.in         | 5 +++--
>  3 files changed, 9 insertions(+), 6 deletions(-)

At
https://git.busybox.net/buildroot/commit/?id=8c6bf50828ee2c027a37ddad0f655ddb1c8b4fd0,
I've committed a different fix, which consists in making libnspr build
properly with musl. This is simpler as we don't have to propagate the
reverse dependency to other packages. Consequently, I've marked your
patch as Rejected in patchwork.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
