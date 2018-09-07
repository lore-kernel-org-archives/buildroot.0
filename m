From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Sat, 8 Sep 2018 01:34:27 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] php: pdo mysql
 extension needs hash as well
In-Reply-To: <20180903072218.4E3CD81DF3@busybox.osuosl.org>
References: <20180903072218.4E3CD81DF3@busybox.osuosl.org>
Message-ID: <5562cbe3-3df3-94b7-fe85-2bad30175f69@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Il 03/09/2018 09:22, Peter Korsgaard ha scritto:
> commit: https://git.buildroot.net/buildroot/commit/?id=dc589d21fa268c345cf910f6fa7165240ca8105d
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x
> 
> Fixes:
> http://autobuild.buildroot.net/results/69cf9326539c8df8fa50c5e7acb2ce3bb985ede2/
> 
> The PDO mysql extension also needs the hash extension - so select it,
> similar to how it was done for the mysqli extension in commit 65f96452636
> (php: fix build with mysqli).
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> (cherry picked from commit 45215ffc8a75377228a477bebbf2ad9c78d40a35)
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>   package/php/Config.ext | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/php/Config.ext b/package/php/Config.ext
> index 60ef1aee7c..51dcbbf4a4 100644
> --- a/package/php/Config.ext
> +++ b/package/php/Config.ext
> @@ -132,6 +132,7 @@ if BR2_PACKAGE_PHP_EXT_PDO
>   
>   config BR2_PACKAGE_PHP_EXT_PDO_MYSQL
>   	bool "MySQL"
> +	select BR2_PACKAGE_PHP_EXT_HASH
>   	help
>   	  PDO driver for MySQL
>   
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

Since I don't see any new php patch on queue, I would like to signal 
that this patch and https://patchwork.ozlabs.org/patch/962514/ are 
needed for master branch too.

Fixes:
http://autobuild.buildroot.net/results/444/4447536594ed1a555191b620ecc9923e6eda08aa//
http://autobuild.buildroot.net/results/802/80226270ef871d9768c1fffabaa4d87a86e740ec//
http://autobuild.buildroot.net/results/69c/69cf9326539c8df8fa50c5e7acb2ce3bb985ede2//
http://autobuild.buildroot.net/results/c56/c568edc4b7a41ccc21c40ede901c5a3e67f5e922//
http://autobuild.buildroot.net/results/cee/cee41dc410866f4a409b3feff8f74398f0b38910//
http://autobuild.buildroot.net/results/923/923adb21a2f2c8b7f92992bfca2646c8d5eed113//
http://autobuild.buildroot.net/results/6e4/6e48413e34180936263eba6f0a50f4f789d8d3cc//
http://autobuild.buildroot.net/results/04c/04c6cc738d62baa5ba59566b2f0cf5cd5780eee6//
http://autobuild.buildroot.net/results/048/048bd44f74e435e5db5cac861ab9699b85212d5f//
http://autobuild.buildroot.net/results/e3e/e3e0c0d4a7ec42ca94f6a512dc84d3f4fe297ccb//
http://autobuild.buildroot.net/results/5ab/5ab83fda8f002a317047c4223aac0e07a8d95f56//
http://autobuild.buildroot.net/results/e72/e723b3914462b0f03d3995d1dda93a111f0ce8a8//
http://autobuild.buildroot.net/results/c09/c092d22d948cf8f37b14ea6c3b5fedec6c316f55//
http://autobuild.buildroot.net/results/6da/6da8ac87c89191b0f109032b7a9076f6905f1a55//
http://autobuild.buildroot.net/results/328/3288b742cee650ee47a41c5b4d6aaef1fe67bff1//

and on and on. I omit the rest of build failure for php-7.2.9 since they 
all look like:

mysqlnd_auth.c:(.text+0x11a8): undefined reference to `PHP_SHA256Init'
mysqlnd_auth.c:(.text+0x11b8): undefined reference to `PHP_SHA256Update'
mysqlnd_auth.c:(.text+0x11c4): undefined reference to `PHP_SHA256Final'
mysqlnd_auth.c:(.text+0x11cc): undefined reference to `PHP_SHA256Init'
mysqlnd_auth.c:(.text+0x11e0): undefined reference to `PHP_SHA256Update'
mysqlnd_auth.c:(.text+0x11ec): undefined reference to `PHP_SHA256Final'
mysqlnd_auth.c:(.text+0x11f4): undefined reference to `PHP_SHA256Init'
mysqlnd_auth.c:(.text+0x1204): undefined reference to `PHP_SHA256Update'
mysqlnd_auth.c:(.text+0x1214): undefined reference to `PHP_SHA256Update'
mysqlnd_auth.c:(.text+0x1220): undefined reference to `PHP_SHA256Final'

Caused by missing:
BR2_PACKAGE_PHP_EXT_HASH under
config BR2_PACKAGE_PHP_EXT_PDO_MYSQL
or
config BR2_PACKAGE_PHP_EXT_MYSQLI

I know it's a workaround, but I don't when it's planned a fix, and they 
still generate NOK on autobuild.

Best regards
Giulio Benetti
