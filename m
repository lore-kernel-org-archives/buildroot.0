From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Jul 2016 15:31:54 +0200
Subject: [Buildroot] [PATCH v2] toolchain: add gdb wrapper that
 automatically passes the gdbinit file
In-Reply-To: <1461952987-20954-1-git-send-email-patrickdepinguin@gmail.com>
References: <1461952987-20954-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <20160717133154.GD3614@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-04-29 20:03 +0200, Thomas De Schampheleire spake thusly:
> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> Buildroot already provided a gdbinit file to set the right sysroot, but
> required users to pass this file explicitly when invoking gdb.
> 
> Make the process a bit more user-friendly by creating a gdb wrapper that
> passes the gdbinit file to the real gdb program.
> 
> The code needs to take into account several cases (internal toolchain,
> external toolchain, ...) because the name and type of the real gdb program
> differs.
> 
> The documentation is updated to reflect this change.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> ---
[--SNIP--]
> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
> index d28a2ca..be649f3 100644
> --- a/toolchain/helpers.mk
> +++ b/toolchain/helpers.mk
> @@ -387,8 +387,36 @@ check_unusable_toolchain = \
>  	fi
>  
>  #
> -# Generate gdbinit file for use with Buildroot
> -#
> -gen_gdbinit_file = \
> +# Create a gdb wrapper that sources a minimal gdbinit file. We don't need to
> +# create a gdbtui wrapper because that one actually calls gdb.
> +# For internal toolchains:
> +# - if BR2_PACKAGE_HOST_GDB is set, gdb is built by buildroot and a real file at
> +#   $(TARGET_CROSS)gdb ( == $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-gdb )
> +# For external toolchains:
> +# - if BR2_PACKAGE_HOST_GDB is not set, gdb is provided by the external
> +#   toolchain and $(TARGET_CROSS)gdb is a symlink.
> +# - if BR2_PACKAGE_HOST_GDB is set, gdb is built by buildroot and a real file at
> +#   $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-gdb
> +#
> +define setup_gdb_wrapper
>  	mkdir -p $(STAGING_DIR)/usr/share/buildroot/ ; \
> -	echo "set sysroot $(STAGING_DIR)" > $(STAGING_DIR)/usr/share/buildroot/gdbinit
> +	echo "set sysroot $(STAGING_DIR)" > $(STAGING_DIR)/usr/share/buildroot/gdbinit ; \

You don't need a continuation line here.

> +	if [ -f $(TARGET_CROSS)gdb -a ! -e $(TARGET_CROSS)gdb.real ]; then \
> +		gdb_wrapper=$(TARGET_CROSS)gdb ; \
> +		real_gdb=$${gdb_wrapper}.real ; \
> +		mv $${gdb_wrapper} $${real_gdb} ; \
> +	elif [ -L $(TARGET_CROSS)gdb ]; then \
> +		gdb_wrapper=$(TARGET_CROSS)gdb ; \
> +		real_gdb=`readlink -f $(TARGET_CROSS)gdb`; \
> +		rm $(TARGET_CROSS)gdb ; \
> +	elif [ -f $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-gdb ]; then \
> +		gdb_wrapper=$(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-gdb ; \
> +		real_gdb=$${gdb_wrapper}.real ; \
> +		mv $${gdb_wrapper} $${real_gdb} ; \
> +	fi ; \

I was surprised to see that we did not already have code to locate the
cross-gdb, especially for external toolchains...

I could not find where we copy gcc et al. either... :-/

> +	if [ -n "$${gdb_wrapper}" ]; then \
> +		echo "#!/bin/sh" > $${gdb_wrapper} ; \
> +		echo "$${real_gdb} -x $(STAGING_DIR)/usr/share/buildroot/gdbinit \"\$$@\"" >> $${gdb_wrapper} ; \

Please do not introduce another hard-coded abslute path. You should
derive the path to the gdbinit file relative to the gdb executable, if
at all possible.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
