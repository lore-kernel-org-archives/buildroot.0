From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Aug 2015 09:00:24 +0200
Subject: [Buildroot] [PATCH 1/1] package/nodejs/0.10.x: add patch to fix
 musl build error
In-Reply-To: <1438447939-25905-1-git-send-email-joerg.krause@embedded.rocks>
References: <1438447939-25905-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20150806090024.7f772dc4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Sat,  1 Aug 2015 18:52:19 +0200, J?rg Krause wrote:
> The musl C library does not understand the feature test macro __USE_MISC and so
> libuv (built-in dependency of nodejs) does not use the correct struct stat
> definition for musl:
> 	error: ?uv_statbuf_t? has no member named ?st_ctimensec?
> 	error: ?uv_statbuf_t? has no member named ?st_mtimensec?
> 
> The macro __USE_MISC is defined by glibc if _BSD_SOURCE or _SVID_SOURCE is
> defined.
> 
> The libuv build system enables the feature test macro _GNU_SOURCE for linux
> builds.
> 
> Since glibc 2.19, defining _GNU_SOURCE also has the effect of implicitly
> defining _DEFAULT_SOURCE - the replacement for _BSD_SOURCE and _SVID_SOURCE.
> 
> In glibc versions before 2.20, defining _GNU_SOURCE also had the effect of
> implicitly defining _BSD_SOURCE and _SVID_SOURCE. This is also true for uClibc.
> 
> Alltogether, we can safely replace __USE_MISC by _GNU_SOURCE to support building
> nodejs 0.10.x with the musl C library.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  .../0005-fix-musl-USE-MISC-build-issue.patch       | 47 ++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 package/nodejs/0.10.40/0005-fix-musl-USE-MISC-build-issue.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
