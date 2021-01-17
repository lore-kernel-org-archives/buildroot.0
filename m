From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Jan 2021 15:25:35 +0100
Subject: [Buildroot] [PATCH 1/1] package/resiprocate: resiprocate-apps
 need openssl
In-Reply-To: <20210117100612.1210505-1-bernd.kuhls@t-online.de>
References: <20210117100612.1210505-1-bernd.kuhls@t-online.de>
Message-ID: <20210117152535.07bf1463@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bernd,

On Sun, 17 Jan 2021 11:06:12 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/7ac/7ac82a3ac4b06cb5ad44e92548d66a0f79d149a6/
> 
> In file included from Server.cxx:19:
> ../../resip/stack/ssl/Security.hxx:32:10: fatal error: openssl/ssl.h: No such file or directory
> 
> clicktoall needs openssl:
> https://github.com/resiprocate/resiprocate/blob/resiprocate-1.12/apps/clicktocall/Makefile.am#L16
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/resiprocate/Config.in | 1 +
>  1 file changed, 1 insertion(+)

I have applied, *but* I think the issue should be reported upstream.
Indeed, I see at least two problems:

 (1) ./configure happily succeeds with --with-apps but without SSL
     support... which it should not if one of the applications requires SSL
     support

 (2) the resip/stack/ssl/Security.hxx header gets installed
     unconditionally, even when OpenSSL support is not enabled... and it
     includes an OpenSSL header.

Both of these things seem very wrong in the build system/source code of
resiprocate.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
