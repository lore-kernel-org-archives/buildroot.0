From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 21 Sep 2015 12:22:43 +0300
Subject: [Buildroot] [PATCH] micropython: Disable for Blackfin
In-Reply-To: <1442825517-28669-1-git-send-email-judge.packham@gmail.com>
References: <20150921091356.17452d5c@free-electrons.com>
 <1442825517-28669-1-git-send-email-judge.packham@gmail.com>
Message-ID: <20150921092243.GL2782@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Chris,

On Mon, Sep 21, 2015 at 08:51:57PM +1200, Chris Packham wrote:
> There are two problems building micropython for Blackfin. The first is
> some printf format specifier warnings/errors that seem to be triggered
> only for that architecture/compiler. This could be worked around by
> specifying CFLAGS=-Wno-error=format.
> 
> The second problem is that libffi doesn't provide the closure
> implementation on Blackfin. There is no known workaround for this issue.
> 
> For now disable micropython on Blackfin.
> 
> Signed-off-by: Chris Packham <judge.packham@gmail.com>
> ---
>  package/micropython/Config.in | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/micropython/Config.in b/package/micropython/Config.in
> index c62b3ab..4664494 100644
> --- a/package/micropython/Config.in
> +++ b/package/micropython/Config.in
> @@ -1,6 +1,8 @@
>  config BR2_PACKAGE_MICROPYTHON
>  	bool "micropython"
>  	select BR2_PACKAGE_LIBFFI
> +	# libffi doesn't provide the closure implementation on Blackfin
> +	depends on !BR2_bfin

Please add the same dependency to the comment below. No need to repeat the 
explanation there. The reason is that the comment is useless when the package 
is disabled for the current architecture.

baruch

>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	help
>  	  Micro Python is a lean and fast implementation of the Python 3

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
