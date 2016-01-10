From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 10 Jan 2016 16:58:58 +0100
Subject: [Buildroot] [PATCH] package/inetutils: new package
In-Reply-To: <1452433036-23866-1-git-send-email-yann.morin.1998@free.fr>
References: <1452433036-23866-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <56927FC2.70304@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10-01-16 14:37, Yann E. MORIN wrote:
> From: Karoly Kasza <kaszak@gmail.com>
> 
> GNU Inetutils is a collection of common network programs.
> 
> Clients included:
> dnsdomainname, ftp, hostname, ifconfig, logger, ping, ping6, rcp,
> rexec, rlogin, rsh, talk, telnet, tftp, traceroute, whois
> 
> Servers included:
> ftpd, inetd, rexecd, rlogind, rshd, syslogd, talkd, telnetd, tftpd,
> uucpd
> 
> Signed-off-by: Karoly Kasza <kaszak@gmail.com>
> [yann.morin.1998 at free.fr:
>   - rebase
>   - update version
>   - use ifeq-endif for all tools
>   - ifconfig needs its special post-install hook
>   - use $(foreach) to move/delete programs
>   - only move programs if not using merged /usr
>   - don't check before moving/deleting
>   - chmod +x moved programs
>   - remove IPv6 dependency
>   - no 'default y'
>   - add homepage
> ]
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> ---
> Changes v1 -> v2:
>   - rebase and all the changes in the commit log
> 
> ---
> Note: this patch won't be applicable using pwclient, as it contains a ^L
> character which makes the python xml stack barf like a student during a
> spring break.

 :-) I'll snip that away then.

[snip]
> diff --git a/package/inetutils/Config.in b/package/inetutils/Config.in
> new file mode 100644
> index 0000000..8e0658b
> --- /dev/null
> +++ b/package/inetutils/Config.in
> @@ -0,0 +1,162 @@
> +menuconfig BR2_PACKAGE_INETUTILS
> +	bool "inetutils"
> +	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS

 It's not a policy I'm fond of, but we currently have all of these in
package/Config.in.

 That said, I don't think it should depend on show others because some of the
tools don't exist in busybox (at least rshd, maybe others). And I don't like the
show others anyway, so I prefer to leave it out as much as possible :-)

> +	depends on BR2_USE_WCHAR
> +	help
> +	  GNU Inetutils is a collection of common network programs.
> +
> +	  Clients included:
> +	  dnsdomainname, ftp, hostname, ifconfig, logger, ping, ping6, rcp,
> +	  rexec, rlogin, rsh, talk, telnet, tftp, traceroute, whois
> +
> +	  Servers included:
> +	  ftpd, inetd, rexecd, rlogind, rshd, syslogd, talkd, telnetd, tftpd,
> +	  uucpd
> +
> +	  https://www.gnu.org/software/inetutils/
> +
> +if BR2_PACKAGE_INETUTILS
> +
> +comment "Clients"

 Not sure if it's really worthwhile to make all of these selectable. If you want
it small, use busybox, no? But now that it's there, why not.

[snip]
> diff --git a/package/inetutils/inetutils.mk b/package/inetutils/inetutils.mk
> new file mode 100644
> index 0000000..05a8be1
> --- /dev/null
> +++ b/package/inetutils/inetutils.mk
> @@ -0,0 +1,185 @@
> +################################################################################
> +#
> +# inetutils
> +#
> +################################################################################
> +
> +INETUTILS_VERSION = 1.9.4
> +INETUTILS_SITE = $(BR2_GNU_MIRROR)/inetutils
> +INETUTILS_SOURCE = inetutils-$(INETUTILS_VERSION).tar.xz
> +INETUTILS_LICENSE = GPLv3

 GPLv3+ actually.

> +INETUTILS_LICENSE_FILES = COPYING
> +
> +# libexecdir is defined to have the daemons installed in /usr/sbin instead of /usr/libexec
> +INETUTILS_CONF_OPTS = --libexecdir=/usr/sbin
> +
[snip]
> +ifeq ($(BR2_PACKAGE_INETUTILS_PING),y)
> +INETUTILS_CONF_OPTS += --enable-ping
> +INETUTILS_USR_BINS_MOVE += ping
> +INETUTILS_PERMISSIONS += /bin/ping f 4755 0 0 - - - - -$(sep)

 AFAICS (didn't test), this should be sufficient and the chmod +x shouldn't be
needed, no? All the executables that don't require suid are installed correctly
I think.

> +endif
[snip]
> +ifneq ($(BR2_ROOTFS_MERGED_USR),y)
> +
> +# Move binaries to proper path (possibly overwriting other utility versions)
> +define INETUTILS_MOVE_PROPER_PATH
> +	$(foreach fname,$(INETUTILS_USR_BINS_MOVE),\
> +		mv -f $(TARGET_DIR)/usr/bin/$(fname) $(TARGET_DIR)/bin/$(fname)$(sep)\
> +		chmod +x $(TARGET_DIR)/bin/$(fname)$(sep))

 If the chmod is needed:

- the .mk file should have a comment about it;

- it should be done for the merged usr case as well.

> +	$(foreach fname,$(INETUTILS_USR_SBINS_MOVE),\
> +		mv -f $(TARGET_DIR)/usr/sbin/$(fname) $(TARGET_DIR)/sbin/$(fname)$(sep)\
> +		chmod +x $(TARGET_DIR)/sbin/$(fname)$(sep))
> +endef
> +INETUTILS_POST_INSTALL_TARGET_HOOKS += INETUTILS_MOVE_PROPER_PATH
> +
> +endif # Merged /usr
> +
> +# Remove iputils and rshd-redone utilities to avoid multiply installed tools
> +define INETUTILS_REMOVE_REDUNDANT_TOOLS
> +	$(foreach fname,$(INETUTILS_DEL_OTHER),\
> +		rm -f $(TARGET_DIR)/usr/sbin/in.$(fname)$(sep))

 IMHO it would have been better to add in.foo in _DEL_OTHER rather than adding
it here.

 Also, instead of a loop, I think this is better:

	rm -f $(addprefix $(TARGET_DIR)/usr/sbin/,$(INETUTILS_DEL_OTHER))

(note that rm -f with no files is allowed).



 Regards,
 Arnout

> +endef
> +INETUTILS_POST_INSTALL_TARGET_HOOKS += INETUTILS_REMOVE_REDUNDANT_TOOLS
> +
> +$(eval $(autotools-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
