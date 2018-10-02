From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 2 Oct 2018 21:26:24 +0200
Subject: [Buildroot] [PATCH] fs/common: ROOTFS_USERS_TABLES has priority
In-Reply-To: <1538059007-36692-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1538059007-36692-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20181002192624.GB2189@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Matt, All,

On 2018-09-27 09:36 -0500, Matt Weber spake thusly:
> This patch moves the PACKAGES_USERS to be appended to the USERS_TABLES
> before ROOTFS_USERS_TABLES.  This allows the ROOTFS_USERS_TABLES to
> update the existing users created by packages with different settings
> like home directory, pid, gid, etc.

So, I do understand the rationale behind this, and I was almost ready to
ack the patch, when I thought of a potential trap this could open under
the unsuspectign user's feet.

So, let's consider a hypotetical package that:

  - defines a user, say 'foo', with home set to e.g. /run/foo

  - installs a daemon to run under user 'foo'

  - installs a config file that contains (e.g.) chroot_dir=/run/foo

Then your custom users table overrides the home dir to (e.g.) /home/foo.

You better be prepared to also override the config file with your own,
and so on (e.g. maybe the startup script too...)

I don't think it is too bad, though, so I'm OK with the change.

I would however suggest a rephrasing of the commit log, something along
the lines of:

    fs/common: allow custom user table to override package-defined users

    Currently, when a custom user table and a package define the same user,
    the settings from the package takes precedence over the ones from the
    custom user table.

    Hwever, it makes sense to allow the settings from the custom user table
    take precedence. For example, it woould allow redirecting the user's
    home directory to an alternate location (e.g. away from tmp and into a
    partition that is persistent).

    The support/scripts/mkusers script will only retain settings from the
    latest definition it finds.

    Thus, by passing the custom user table after the package defined users,
    it is possible to override the packageprovided user definitions.

With that commit log updated:

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.


> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
>  fs/common.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/common.mk b/fs/common.mk
> index abf3541..453da60 100644
> --- a/fs/common.mk
> +++ b/fs/common.mk
> @@ -75,10 +75,11 @@ $(ROOTFS_COMMON_TAR): $(ROOTFS_COMMON_DEPENDENCIES) target-finalize
>  	echo '#!/bin/sh' > $(FAKEROOT_SCRIPT)
>  	echo "set -e" >> $(FAKEROOT_SCRIPT)
>  	echo "chown -h -R 0:0 $(TARGET_DIR)" >> $(FAKEROOT_SCRIPT)
> +
> +	$(call PRINTF,$(PACKAGES_USERS)) >> $(USERS_TABLE)
>  ifneq ($(ROOTFS_USERS_TABLES),)
>  	cat $(ROOTFS_USERS_TABLES) >> $(USERS_TABLE)
>  endif
> -	$(call PRINTF,$(PACKAGES_USERS)) >> $(USERS_TABLE)
>  	PATH=$(BR_PATH) $(TOPDIR)/support/scripts/mkusers $(USERS_TABLE) $(TARGET_DIR) >> $(FAKEROOT_SCRIPT)
>  ifneq ($(ROOTFS_DEVICE_TABLES),)
>  	cat $(ROOTFS_DEVICE_TABLES) > $(FULL_DEVICE_TABLE)
> -- 
> 1.9.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
