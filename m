From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 20 Nov 2018 21:32:36 +0100
Subject: [Buildroot] [PATCH next v5 5/9] Makefile: define
 TARGET_DIR_WARNING_FILE relative to TARGET_DIR
In-Reply-To: <20181120163522.4281-6-thomas.petazzoni@bootlin.com>
References: <20181120163522.4281-1-thomas.petazzoni@bootlin.com>
 <20181120163522.4281-6-thomas.petazzoni@bootlin.com>
Message-ID: <20181120203236.GH2601@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-11-20 17:35 +0100, Thomas Petazzoni spake thusly:
> In commit 7e9870ce32d6329d9e3d602247fbe1709a2275a4 ("core: introduce
> intermediate BASE_TARGET_DIR variable"), the definition of
> TARGET_DIR_WARNING_FILE was changed to use $(BASE_TARGET_DIR) instead
> of $(TARGET_DIR).
> 
> However, this change is incompatible with per-package directories, and
> is in fact not needed.
> 
> With per-package directories, using $(BASE_TARGET_DIR) means that
> TARGET_DIR_WARNING_FILE is
> output/target/THIS_IS_NOT_YOUR_ROOT_FILESYSTEM. Due to this, when
> skeleton-init-common or skeleton-custom attempt to install it, it
> fails, because it should be installed to their package per-package
> target directory, and not the global output/target folder that doesn't
> exist yet. The failure looks like this:
> 
> /usr/bin/install -m 0644 support/misc/target-dir-warning.txt /home/thomas/projets/buildroot/output/target/THIS_IS_NOT_YOUR_ROOT_FILESYSTEM
> /usr/bin/install: cannot create regular file '/home/thomas/projets/buildroot/output/target/THIS_IS_NOT_YOUR_ROOT_FILESYSTEM': No such file or directory
> make[1]: *** [package/pkg-generic.mk:336: /home/thomas/projets/buildroot/output/build/skeleton-init-common/.stamp_target_installed] Error 1
> 
> TARGET_DIR_WARNING_FILE is used in three places:
> 
>  - In skeleton-custom.mk and skeleton-init-common.mk, where as
>    explained above, using $(TARGET_DIR) fixes the use of
>    $(TARGET_DIR_WARNING_FILE) in the context of per-package target
>    directories.
> 
>  - In fs/common.mk, where it is used as argument to $(notdir ...) to
>    retrieve just the name of the warning file. So in this case, we
>    really don't care about the path of the file, just its name.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

At the beginning, I was a bit skeptical, and I was also wondering how it
would work with my on-going refactoring due to handling the capabilities,
but I so far can't see any problem with it. So:

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 24c803872d..23032988a5 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -468,7 +468,7 @@ BR_PATH = "$(HOST_DIR)/bin:$(HOST_DIR)/sbin:$(PATH)"
>  
>  # Location of a file giving a big fat warning that output/target
>  # should not be used as the root filesystem.
> -TARGET_DIR_WARNING_FILE = $(BASE_TARGET_DIR)/THIS_IS_NOT_YOUR_ROOT_FILESYSTEM
> +TARGET_DIR_WARNING_FILE = $(TARGET_DIR)/THIS_IS_NOT_YOUR_ROOT_FILESYSTEM
>  
>  ifeq ($(BR2_CCACHE),y)
>  CCACHE = $(HOST_DIR)/bin/ccache
> -- 
> 2.19.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
