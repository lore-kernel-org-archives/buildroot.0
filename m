From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 9 Sep 2017 19:01:53 +0200
Subject: [Buildroot] [PATCH] Add package Prosody
In-Reply-To: <1504909108-18547-2-git-send-email-nidujay@gmail.com>
References: <1504909108-18547-2-git-send-email-nidujay@gmail.com>
Message-ID: <20170909170153.GD2850@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dushara, All,

A few comments about this patch.

On 2017-09-09 08:18 +1000, Dushara Jayasinghe spake thusly:
> Description from website:
> 
>   Prosody is a modern XMPP communication server. It aims to be
>   easy to set up and configure, and efficient with system
>   resources.
> 
> This installs the base system with certificates for two domains:
> localhost and example.com

The commit log here mostly repeats what is in the help text. This is
fine, but not very useful.

Instead, a commit log should explain the technical details, like what
problems were encountered and how they were solved, if it is not obvious
from the code.

For example, you could have added in the commit log that prosody only
works with lua-5.1 or luajit, and add a pointer to the relevant mailing
list discussion (which you allude to in your second mail); *this* is a
very interesting information to have in a commit log.

Another information you could have added is the licensing issue. The
COPYING file contains the text for the MIT license, but all the source
files contain the sentence "This project is MIT/X11 licensed." Thus, the
license is MIT/X11.

Finally, you need to sign-off your patch. A signed-off-by line is a
legally-binding statement that you are allowed to provide the patch:
    https://developercertificate.org/

So, what about a commit log that reads as:

    package/prosody: new package

    As stated by the upstram developpers, Prosody only supports lua-5.1
    or luajit (which is a lua-5.1 interpreter):
        [add URL here if publicly available]

    The license terms are not very consistent: the source files all
    state to be "MIT/X11 licensed" and defer to the COPYING file for
    details, but that file only has the text for the MIT license.
    Thus, we believe the license to be MIT/X11, as stated in the source
    files.

    Signed-off-by: Your Name <your@email>

Also, see the manual:
    https://buildroot.org/downloads/manual/manual.html#submitting-patches

A few more nit-picks below...

[--SNIP--]
> diff --git a/package/prosody/Config.in b/package/prosody/Config.in
> new file mode 100644
> index 0000000..21dc037
> --- /dev/null
> +++ b/package/prosody/Config.in
> @@ -0,0 +1,19 @@
> +config BR2_PACKAGE_PROSODY
> +	bool "prosody"
> +	depends on BR2_PACKAGE_LUA_5_1 || BR2_PACKAGE_LUAJIT
> +	select BR2_PACKAGE_LUAEXPAT # runtime
> +	select BR2_PACKAGE_LUASEC # runtime
> +	select BR2_PACKAGE_LUASOCKET # runtime
> +	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_LIBIDN
> +	select BR2_PACKAGE_LUAFILESYSTEM # runtime
> +
> +	help

There is a useless empty line before the help entry.

> +	  Prosody is a modern XMPP communication server. It aims to be
> +	   easy to set up and configure, and efficient with system
> +	   resources.

Line 2 and 3 above have three elading space, only two needed.

> +
> +	  https://prosody.im
> +
> +comment "prosody needs the lua interpreter"
> +	depends on !BR2_PACKAGE_LUA_5_1 && !BR2_PACKAGE_LUAJIT
> diff --git a/package/prosody/prosody.hash b/package/prosody/prosody.hash
> new file mode 100644
> index 0000000..38942ea
> --- /dev/null
> +++ b/package/prosody/prosody.hash
> @@ -0,0 +1,5 @@
> +# Hashes from: https://prosody.im/downloads/source/{MD5,SHA1,SHA256,SHA512}SUMS
> +md5    d743adea6cfbaacc3a24cc0c3928bb1b  prosody-0.9.12.tar.gz
> +sha1   1ee224263a5b3d67960e12edbbe6b2f16b95d147  prosody-0.9.12.tar.gz
> +sha256 1a59a322b71928a21985522aa00d0eab3552208d7bf9ecb318542a1b2fee3e8d  prosody-0.9.12.tar.gz
> +sha512 e87b5f3b3e327722cec9d8d0470684e2ec2788a1c5ae623c4f505a00572ef21f65afe84cd5b7de47d6a65fe8872506fe34e5e8886e20979ff84710669857ca76  prosody-0.9.12.tar.gz
> diff --git a/package/prosody/prosody.mk b/package/prosody/prosody.mk
> new file mode 100644
> index 0000000..5eea40c
> --- /dev/null
> +++ b/package/prosody/prosody.mk
> @@ -0,0 +1,51 @@
> +################################################################################
> +#
> +# prosody
> +#
> +################################################################################
> +
> +PROSODY_VERSION = 0.9.12
> +PROSODY_SOURCE = prosody-$(PROSODY_VERSION).tar.gz
> +PROSODY_SITE = https://prosody.im/downloads/source
> +PROSODY_LICENSE = MIT
> +PROSODY_LICENSE_FILES = COPYING
> +PROSODY_DEPENDENCIES = openssl libidn
> +
> +ifeq ($(BR2_PACKAGE_LUA_5_1),y)
> +	PROSODY_DEPENDENCIES += lua

Don't indent the DEPENDENCIES line (yes, that is a weird rule, but that
is for consistency with all the rest of Buildroot, which does not indent
in such situations).

> +endif
> +
> +ifeq ($(BR2_PACKAGE_LUAJIT),y)
> +	PROSODY_DEPENDENCIES += luajit

Ditto.

> +endif
> +
> +define PROSODY_CONFIGURE_CMDS
> +	(cd $(@D) && \
> +		$(TARGET_CONFIGURE_OPTS) \
> +		./configure --prefix=/usr \
> +		--c-compiler=$(TARGET_CC) \
> +		--cflags="$(TARGET_CFLAGS)" \
> +		--linker=$(TARGET_CC) \
> +		--ldflags="$(TARGET_LDFLAGS) -shared" \
> +		--sysconfdir=/etc/prosody \
> +		--with-lua=$(STAGING_DIR)/usr \
> +	)

No need for the parenthesis here.

Regards,
Yann E. MORIN.

> +endef
> +
> +define PROSODY_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
> +endef
> +
> +define PROSODY_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR="$(TARGET_DIR)" -C $(@D) install
> +endef
> +
> +# make install installs a Makefile and meta data to generate certs
> +define PROSODY_REMOVE_CERT_GENERATOR
> +	rm -f $(TARGET_DIR)/etc/prosody/certs/Makefile
> +	rm -f $(TARGET_DIR)/etc/prosody/certs/*.cnf
> +endef
> +
> +PROSODY_POST_INSTALL_TARGET_HOOKS += PROSODY_REMOVE_CERT_GENERATOR
> +
> +$(eval $(generic-package))
> -- 
> 2.1.4
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
