From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Feb 2016 22:56:58 +0100
Subject: [Buildroot] [PATCH 14/32] package/systemd: add optional support
 for tmpfiles
In-Reply-To: <1456437341-19025-15-git-send-email-gabe@hashrabbit.co>
References: <1456437341-19025-1-git-send-email-gabe@hashrabbit.co>
 <1456437341-19025-15-git-send-email-gabe@hashrabbit.co>
Message-ID: <20160229225658.6144360b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gabe Evans,

On Thu, 25 Feb 2016 21:55:23 +0000, Gabe Evans wrote:
> Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
> ---
>  package/systemd/Config.in  | 9 +++++++++
>  package/systemd/systemd.mk | 6 ++++++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> index 2ebd825..2f89b0e 100644
> --- a/package/systemd/Config.in
> +++ b/package/systemd/Config.in
> @@ -118,6 +118,15 @@ config BR2_PACKAGE_SYSTEMD_QUOTACHECK
>  
>  	  http://www.freedesktop.org/software/systemd/man/systemd-quotacheck.service.html
>  
> +config BR2_PACKAGE_SYSTEMD_TMPFILES
> +	bool "enable tmpfiles support"
> +	help
> +	  systemd-tmpfiles creates, deletes, and cleans up volatile and temporary
> +	  files and directories, based on the configuration file format and location
> +	  specified in tmpfiles.d(5).
> +
> +	  http://www.freedesktop.org/software/systemd/man/systemd-tmpfiles.html

Can this really be made optional? We have other packages that rely on
the tmpfiles.d feature:

package/audit/audit.mk: mkdir -p $(TARGET_DIR)/usr/lib/tmpfiles.d
package/audit/audit.mk: $(INSTALL) -D -m 644 package/audit/audit_tmpfiles.conf \
package/audit/audit.mk:         $(TARGET_DIR)/usr/lib/tmpfiles.d/audit.conf
package/avahi/avahi.mk: $(INSTALL) -D -m 644 package/avahi/avahi_tmpfiles.conf \
package/avahi/avahi.mk:         $(TARGET_DIR)/usr/lib/tmpfiles.d/avahi.conf
package/dhcp/dhcp.mk:           $(TARGET_DIR)/usr/lib/tmpfiles.d/dhcpd.conf
package/dhcp/dhcp.mk:           $(TARGET_DIR)/usr/lib/tmpfiles.d/dhcpd.conf
package/nfs-utils/nfs-utils.mk: $(INSTALL) -D -m 0644 package/nfs-utils/nfs-utils_tmpfiles.conf \
package/nfs-utils/nfs-utils.mk:         $(TARGET_DIR)/usr/lib/tmpfiles.d/nfs-utils.conf

Maxime, what do you think?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
