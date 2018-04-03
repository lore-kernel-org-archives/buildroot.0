From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 3 Apr 2018 10:35:15 +0200
Subject: [Buildroot] [PATCH] pkg-generic.mk: fix
 FOO_ACTUAL_SOURCE_TARBALL handling after DOWNLOAD rework
In-Reply-To: <20180403065616.9640-1-peter@korsgaard.com>
References: <20180403065616.9640-1-peter@korsgaard.com>
Message-ID: <20180403083515.GA2725@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2018-04-03 08:56 +0200, Peter Korsgaard spake thusly:
> Fixes:
> http://autobuild.buildroot.net/results/b4a/b4af0de4ae9630ccbe7890f69047f216f2ff5119/
> 
> With the change to the DOWNLOAD macro, packages using FOO_ACTUAL_SOURCE_TARBALL fails:
> 
> >>> skeleton-init-common  Collecting legal info
> sourceryg++-2017.05-4-nios2-linux-gnu.src.tar.bz2: OK (md5: 529a7fecf33d0d113a446413b9d1e173)
> sourceryg++-2017.05-4-nios2-linux-gnu.src.tar.bz2: OK (sha256: 6e65878d0453708ee19098d3d68985bda244938d35999f3859915a2f5574fa08)
> /bin/bash: line 1: @mkdir: command not found
> package/pkg-generic.mk:148: recipe for target '/accts/mlweber1/rclinux/rc-buildroot-test/scripts/instance-1/output/build/toolchain-external-codesourcery-niosII-2017.05-4/.stamp_actual_downloaded' failed
> 
> Which is caused by the continuation character '\'.  This has been present
> since the make target was introduced in commit eace9d6133b9
> (core/legal-info: ensure legal-info works in off-line mode).  It isn't clear
> to me why it was done like that, but it fails with the DOWNLOAD macro
> rework, so drop it.

No idea why i did that. Probably a bad copy-paste from somewhere else in
another .mk...

> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/pkg-generic.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 3c6a1839ff..1c9dd1d734 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -145,7 +145,7 @@ $(BUILD_DIR)/%/.stamp_downloaded:
>  
>  # Retrieve actual source archive, e.g. for prebuilt external toolchains
>  $(BUILD_DIR)/%/.stamp_actual_downloaded:
> -	$(call DOWNLOAD,$($(PKG)_ACTUAL_SOURCE_SITE)/$($(PKG)_ACTUAL_SOURCE_TARBALL)); \
> +	$(call DOWNLOAD,$($(PKG)_ACTUAL_SOURCE_SITE)/$($(PKG)_ACTUAL_SOURCE_TARBALL))
>  	$(Q)mkdir -p $(@D)
>  	$(Q)touch $@
>  
> -- 
> 2.11.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
