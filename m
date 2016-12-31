From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 1 Jan 2017 00:56:50 +0200
Subject: [Buildroot] [PATCH 1/1] toolchain/wrapper: fix building without
 glibc
In-Reply-To: <20161231153017.10545-1-marcinch7@gmail.com>
References: <20161231153017.10545-1-marcinch7@gmail.com>
Message-ID: <20161231225649.x6lp2l6oavetrbth@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Marcin,

On Sat, Dec 31, 2016 at 04:30:17PM +0100, Marcin Chojnacki wrote:
> toolchain-wrapper.c now uses program_invocation_short_name, which is
> a glibc specific extension. This causes build to fail when using a
> system with libc different than glibc (musl, BSD libc, etc.)
> 
> This change makes toolchain-wrapper.c portable, by setting it's value
> to getprogname() when __GLIBC__ is not defined, and thus makes running
> buildroot possible on glibc-less systems.

getprogname() is BSD specific[1]. None of the major Linux libcs (glibc, 
uclibc-ng, musl) provide it.

[1] https://www.freebsd.org/cgi/man.cgi?query=getprogname&sektion=3

baruch

> Signed-off-by: Marcin Chojnacki <marcinch7@gmail.com>
> ---
>  toolchain/toolchain-wrapper.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
> index 100aa18..8eb0aca 100644
> --- a/toolchain/toolchain-wrapper.c
> +++ b/toolchain/toolchain-wrapper.c
> @@ -141,6 +141,9 @@ static void check_unsafe_path(const char *arg,
>  			      int arg_has_path)
>  {
>  	const struct str_len_s *p;
> +#ifndef __GLIBC__
> +	const char *program_invocation_short_name = getprogname();
> +#endif
>  
>  	for (p=unsafe_paths; p->str; p++) {
>  		if (strncmp(path, p->str, p->len))

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
