From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 19 May 2020 21:03:03 +0200
Subject: [Buildroot] [PATCH] package/p7zip: fix build with gcc 10
In-Reply-To: <20200519133523.3069943-1-stefan.sorensen@spectralink.com>
References: <20200519133523.3069943-1-stefan.sorensen@spectralink.com>
Message-ID: <20200519190303.GE27030@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Stefan, All,

On 2020-05-19 15:35 +0200, Stefan S?rensen spake thusly:
> Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>

Applied to master, thanks.

I was going to say "do not forget to send upstream", but upstream seems
to dead, or stuck in some mess...

Regards,
Yann E. MORIN.

> ---
>  .../p7zip/0004-Fix-build-with-gcc-10.patch    | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 package/p7zip/0004-Fix-build-with-gcc-10.patch
> 
> diff --git a/package/p7zip/0004-Fix-build-with-gcc-10.patch b/package/p7zip/0004-Fix-build-with-gcc-10.patch
> new file mode 100644
> index 0000000000..b01833db29
> --- /dev/null
> +++ b/package/p7zip/0004-Fix-build-with-gcc-10.patch
> @@ -0,0 +1,32 @@
> +From 78b760eae21d7b340c69e8abab8ca706e1e00adc Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Stefan=20S=C3=B8rensen?= <stefan.sorensen@spectralink.com>
> +Date: Mon, 4 May 2020 09:19:46 +0200
> +Subject: [PATCH] Fix build with gcc 10.
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Add cast to code that mixes HRESULT (aka long) and DWORD (aka unsigned
> +int) which causes an narrowing error with gcc 10.
> +
> +Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
> +---
> + CPP/Windows/ErrorMsg.cpp | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/CPP/Windows/ErrorMsg.cpp b/CPP/Windows/ErrorMsg.cpp
> +index 99684ae..ab48352 100644
> +--- a/CPP/Windows/ErrorMsg.cpp
> ++++ b/CPP/Windows/ErrorMsg.cpp
> +@@ -13,7 +13,7 @@ UString MyFormatMessage(DWORD errorCode)
> +   const char * txt = 0;
> +   AString msg;
> + 
> +-  switch(errorCode) {
> ++  switch((HRESULT)errorCode) {
> +     case ERROR_NO_MORE_FILES   : txt = "No more files"; break ;
> +     case E_NOTIMPL             : txt = "E_NOTIMPL"; break ;
> +     case E_NOINTERFACE         : txt = "E_NOINTERFACE"; break ;
> +-- 
> +2.26.2
> +
> -- 
> 2.25.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
