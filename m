From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Aug 2015 08:47:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/mpd: add patch to fix musl gcc5
 build issue
In-Reply-To: <1438771429-15145-1-git-send-email-joerg.krause@embedded.rocks>
References: <1438771429-15145-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20150806084737.356ad5dc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Wed,  5 Aug 2015 12:43:49 +0200, J?rg Krause wrote:
> Add a patch from the Alpine Linux project [1] to fix a musl build issue with
> gcc 5:
> 
> ```
> error: temporary of non-literal type ?pthread_mutex_t? in a constant expression
>   constexpr PosixMutex():mutex(PTHREAD_MUTEX_INITIALIZER) {}
> ```
> 
> Problem has been reported by the Alpine team upstream and was closed by the MPD
> maintainer with WONTFIX:
> http://bugs.musicpd.org/view.php?id=4387
> http://bugs.musicpd.org/view.php?id=4110
> 
> However...
> 
> POSIX does not permit using PTHREAD_COND_INITIALIZER except for static
> initialization, and certainly does not permit using it as a value.
> 
> Also POSIX does not specify the type of the object (it's opaque) so if
> there are any types for which their code would be invalid C++, then their
> code is invalid.
> 
> Also, volatile in the type is necessary. without that, LTO can break the code.
> 
> [1]
> http://git.alpinelinux.org/cgit/aports/log/main/mpd/musl-gcc5-fixes.patch
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/mpd/0002-musl-gcc5-fixes.patch | 56 ++++++++++++++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 package/mpd/0002-musl-gcc5-fixes.patch

Applied, thanks. To be honest, I hesitated quite a bit before applying
this patch. A Buildroot rule is that we don't go against upstream. And
here upstream clearly say that they don't want to do the necessary
effort to support musl, so what we should have done instead is to also
make mpd not available with the musl C library.

But the patch is quite simple, so I made an exception. However, if more
patches are needed in mpd to fix musl build problems, I will reject
them and mark the package as not available in musl. Unhappy users can
go complain to the mpd developers that their decision of not supporting
musl by doing a configure-time check is stupid.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
