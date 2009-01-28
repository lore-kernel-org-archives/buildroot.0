From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 28 Jan 2009 21:54:41 +0100
Subject: [Buildroot] [PATCH] Add radvd to the list of packages
In-Reply-To: <200901282131.37172.amand.tihon@alrj.org> (Amand Tihon's message
	of "Wed\, 28 Jan 2009 21\:31\:31 +0100")
References: <200901282131.37172.amand.tihon@alrj.org>
Message-ID: <874ozjup66.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Amand" == Amand Tihon <amand.tihon@alrj.org> writes:

 Amand> Add radvd, the IPv6 router advertisement daemon.
 Amand> Signed-off-by: Amand Tihon <amand.tihon@alrj.org>
 Amand> ---

 Amand> Second try, I hope I got it right this time.

Yes, almost there ;)

 Amand> --- /dev/null
 Amand> +++ b/package/radvd/Config.in
 Amand> @@ -0,0 +1,8 @@
 Amand> +config BR2_PACKAGE_RADVD
 Amand> +	bool "radvd"
 Amand> +	select BR2_PACKAGE_FLEX
 Amand> +	depends on BR2_INET_IPV6
 Amand> +	help
 Amand> +	  IPv6 Router Advertisement Daemon.
 Amand> +	

Trailing spaces here.

 Amand> +++ b/package/radvd/radvd.mk
 Amand> @@ -0,0 +1,23 @@
 Amand> +#############################################################
 Amand> +#
 Amand> +# radvd
 Amand> +#
 Amand> +#############################################################
 Amand> +RADVD_VERSION:=1.2
 Amand> +RADVD_SOURCE:=radvd-$(RADVD_VERSION).tar.gz
 Amand> +RADVD_SITE:=http://www.litech.org/radvd/dist/
 Amand> +RADVD_AUTORECONF:=no
 Amand> +RADVD_INSTALL_STAGING:=no
 Amand> +RADVD_INSTALL_TARGET:=YES
 Amand> +RADVD_DEPENDENCIES:=uclibc flex
 Amand> +RADVD_MAKE:=$(MAKE1)
 Amand> +
 Amand> +$(eval $(call AUTOTARGETS,package,radvd))
 Amand> +
 Amand> +$(RADVD_HOOK_POST_INSTALL): $(RADVD_TARGET_INSTALL_TARGET)
 Amand> +	mv $(TARGET_DIR)/usr/sbin/$(ARCH)-linux-radvd \
 Amand> +		$(TARGET_DIR)/usr/sbin/radvd

I'm pretty sure you can get it to not prepend that to the binaries by
passing --program-prefix='' in your RADVD_CONF_OPT

Other than that it looks good.

-- 
Bye, Peter Korsgaard
