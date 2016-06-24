From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Jun 2016 00:02:03 +0200
Subject: [Buildroot] [PATCH 1/7] audit: bump to version 2.5.2
In-Reply-To: <1466803929-5513-1-git-send-email-Aduskett@gmail.com>
References: <1466803929-5513-1-git-send-email-Aduskett@gmail.com>
Message-ID: <20160624220203.GC4157@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam, All,

[Note: I did not really look at the previous iteration, and only had a
cursory look at Thomas previous review. However, here are my comments;
if they clash with Thomas', then Thomas is right.]

Since this is the second iteration, you should have added:

  - a 'v2' in the mail subjects;

  - a commit changelog in the message, stating what you changed.

For example:


    [PATCH 1/7 v2] audit: bump to version 2.5.2

    Update to version 2.5.2, needed for blabla foo bar
    buz...

    Signed-off-by: Your NAME <you@there>

    ---
    Changes v1 -> v2:
      - do not drop bundeld patches  (Thomas)


See the manual:
    https://buildroot.org/downloads/manual/manual.html#submitting-patches

and especially chap. 21.5.4, Patch revision changelog.

On 2016-06-24 17:32 -0400, Adam Duskett spake thusly:
> Added the ability to compile audit against host as well, this is needed as the host version of libsemanage requires libaudit.h

Messages should be wrapped at <80 chars per line (I cut mines@73).

So, this patch does two things:
  - bump the version,
  - add the host variants,

Which is a good indication that it should have been two patches (first
to bump, second to add host variant).

> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  package/audit/audit.hash |  2 +-
>  package/audit/audit.mk   | 24 +++++++++++++++++++++++-
>  2 files changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/package/audit/audit.hash b/package/audit/audit.hash
> index f234fdb..ad7f09a 100644
> --- a/package/audit/audit.hash
> +++ b/package/audit/audit.hash
> @@ -1,2 +1,2 @@
>  #Locally computed
> -sha256	25f57f465f3230d7b1166b615ffd6748818a3dc225d0e8b396c5b2e951674e23	audit-2.4.4.tar.gz
> +sha256	f7c35a8c27d98255303f0e828d1045df43f968957bc733338335c64f2ede024d audit-2.5.2.tar.gz
> diff --git a/package/audit/audit.mk b/package/audit/audit.mk
> index 1fbc623..f705483 100644
> --- a/package/audit/audit.mk
> +++ b/package/audit/audit.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -AUDIT_VERSION = 2.4.4
> +AUDIT_VERSION = 2.5.2
>  AUDIT_SITE = http://people.redhat.com/sgrubb/audit
>  AUDIT_LICENSE = GPLv2
>  AUDIT_LICENSE_FILES = COPYING
> @@ -46,6 +46,7 @@ define AUDIT_INSTALL_INIT_SYSTEMD
>  	ln -fs ../../../../usr/lib/systemd/system/auditd.service \
>  		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/auditd.service
>  
> +	mkdir -p $(TARGET_DIR)/usr/lib/tmpfiles.d

Not needed, as "install -D" will create the necessary directory
structure.

>  	$(INSTALL) -D -m 644 package/audit/audit_tmpfiles.conf \
>  		$(TARGET_DIR)/usr/lib/tmpfiles.d/audit.conf
>  endef
> @@ -56,4 +57,25 @@ define AUDIT_INSTALL_CLEANUP
>  endef
>  AUDIT_POST_INSTALL_TARGET_HOOKS += AUDIT_INSTALL_CLEANUP
>  
> +HOST_AUDIT_CONF_OPTS = --without-python --without-python3 --disable-zos-remote --with-libcap-ng=no

Please split long lines so that they are no longer than 80-chars:

However, in this case, it would not even be needed, as you don't need
the trailing "--with-libcap-ng=no" , as you're deaing with it below.

> +ifeq ($(BR2_PACKAGE_LIBCAP_NG),y)
> +HOST_AUDIT_DEPENDENCIES += libcap-ng

This looks wrong: the host variant of the package depends on the target
variant?

Instead you want it to depend on host-libcap-ng (but we do not have a
host variant of libcap-ng, so you'd have to add it first).

And anyway, is it required that the host variant has the same set of
features as the target variant? Can't we always and unconditionally build
with libcap-ng?

> +HOST_AUDIT_CONF_OPTS += --with-libcap-ng=yes
> +else
> +HOST_AUDIT_CONF_OPTS += --with-libcap-ng=no
> +endif
> +
> +ifeq ($(BR2_INIT_SYSTEMD),y)
> +HOST_AUDIT_CONF_OPTS += --enable-systemd

Similarly: why the target init system should have an impact on the host
variant?

I think we would not need systemd at all on the host variant, would we?

> +else
> +HOST_AUDIT_CONF_OPTS += --disable-systemd
> +endif
> +
> +define AUDIT_INSTALL_CLEANUP
> +	$(RM) -rf $(HOST_DIR)/etc/rc.d
> +	$(RM) -rf $(HOST_DIR)/etc/sysconfig
> +endef

First: unucessaru to cleanup the host directory. Second: this macro is
not assigned to any hook, so it's not used.

Regards,
Yann E. MORIN.

> +
>  $(eval $(autotools-package))
> +$(eval $(host-autotools-package))
> -- 
> 2.7.4
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
