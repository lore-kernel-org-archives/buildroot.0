From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 28 Aug 2018 21:35:57 +0200
Subject: [Buildroot] [PATCH] json-c: needs host-autoconf
In-Reply-To: <49134bd0971955402d38a456443d4fb8dba45957.1535468087.git.baruch@tkos.co.il>
References: <49134bd0971955402d38a456443d4fb8dba45957.1535468087.git.baruch@tkos.co.il>
Message-ID: <20180828213557.069e855e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 28 Aug 2018 17:54:47 +0300, Baruch Siach wrote:
> The json-c configure script uses the autoheader utility. Use the
> host-autoconf provided autoheader, as this tool is not always installed
> on the host.
> 
> Fixes:
> http://autobuild.buildroot.net/results/030/030fddceda4f5bc6379f7bfcc405e92d2e24184a/
> http://autobuild.buildroot.net/results/e48/e482f174b8124ace0690a26bb7daf073fe5fcd75/
> http://autobuild.buildroot.net/results/482/4829425c38c58d9844aa07108532a93d47191d23/
> 
> Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/json-c/json-c.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/json-c/json-c.mk b/package/json-c/json-c.mk
> index 57d8c35dd5e3..bee57577ceec 100644
> --- a/package/json-c/json-c.mk
> +++ b/package/json-c/json-c.mk
> @@ -10,5 +10,9 @@ JSON_C_INSTALL_STAGING = YES
>  JSON_C_LICENSE = MIT
>  JSON_C_LICENSE_FILES = COPYING
>  
> +# configure requires autoheader
> +JSON_C_DEPENDENCIES = host-autoconf
> +HOST_JSON_C_DEPENDENCIES = host-autoconf

Wait, wait, why is this needed? This is a standard autotools package,
it shouldn't need autoheader at build time.

Isn't it that there is a bogus timestamp or something like that forces
some files to be re-generated ?

This problem only appears on Joseph's machine:
http://autobuild.buildroot.net/?reason=json-glib%.

It doesn't happen on my autobuilder, even though it doesn't have
autoheader installed system-wide.

So I'm skeptical about this fix.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
