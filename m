From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Aug 2016 22:40:04 +0200
Subject: [Buildroot] [PATCH/next] gcc: fix gcc version dependencies for
 the PowerPC64/musl exclusion
In-Reply-To: <1471701919-30534-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1471701919-30534-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160820224004.1878a20a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 20 Aug 2016 16:05:19 +0200, Thomas Petazzoni wrote:
> In commit
> 5ab751ca44e9da6f406876ff582b3a813056b0d4 ("toolchain-buildroot: allow to
> build ppc64(le) musl toolchains"), support for building a musl toolchain
> for ppc64(le) was added. Since this support only works with gcc 6, some
> additional dependencies have been added to the older gcc versions so
> that they cannot be selected on ppc64(le)/musl.
> 
> Unfortunately, the expression of the dependency was wrong, and leads to
> those older gcc versions being non-selectable if you're not using
> musl. Indeed, the dependencies look like this:
> 
>   depends on !BR2_powerpc64 && !BR2_powerpc64le && BR2_TOOLCHAIN_USES_MUSL
> 
> So as soon as you're not using musl, BR2_TOOLCHAIN_USES_MUSL is false,
> so the entire condition is false, and the gcc version is not available.
> 
> Due to this, only gcc 6.x can be selected currently with uclibc or
> glibc, which is clearly not the intended behavior.
> 
> This commit reworks those dependencies to:
> 
>   depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_powerpc64 || BR2_powerpc64el))
> 
> which more clearly expresses what we want:
> 
>  "We don't want to (have a toolchain that uses musl and (be building
>   either for PPC64 or PPC64le))"
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/gcc/Config.in.host | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
