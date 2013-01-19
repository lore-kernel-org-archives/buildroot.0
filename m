From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 19 Jan 2013 11:25:15 +0100
Subject: [Buildroot] [PATCH] vsftpd: install sample config file to /etc
In-Reply-To: <1358328248-15016-1-git-send-email-sho@relinux.de>
References: <1358328248-15016-1-git-send-email-sho@relinux.de>
Message-ID: <50FA748B.903@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/01/13 10:24, Stephan Hoffmann wrote:
> vsftpd comes with a sample config file that can serve as a starting
> point for customization and enables a basic functionality. Since
> this config refers to a directory "/usr/share/empty" this is also
> created.

  I think the point of /usr/share/empty is that it's a directory that 
doesn't exist, so vsftpd will not allow any up/download unless you change 
the configuration file.

  I think it's a bad idea to default giving access to some random 
location - even if it is read-only non-anonymous access to an empty 
directory.

  But that's just my opinion.

  Regards,
  Arnout

>
> Signed-off-by: Stephan Hoffmann<sho@relinux.de>
> ---
>   package/vsftpd/vsftpd.mk |    4 ++++
>   1 files changed, 4 insertions(+), 0 deletions(-)
>
> diff --git a/package/vsftpd/vsftpd.mk b/package/vsftpd/vsftpd.mk
> index ca711bb..f694b87 100644
> --- a/package/vsftpd/vsftpd.mk
> +++ b/package/vsftpd/vsftpd.mk
> @@ -37,6 +37,10 @@ define VSFTPD_INSTALL_TARGET_CMDS
>   	test -f $(TARGET_DIR)/etc/init.d/S70vsftpd || \
>   		$(INSTALL) -D -m 755 package/vsftpd/vsftpd-init \
>   			$(TARGET_DIR)/etc/init.d/S70vsftpd
> +	test -f $(TARGET_DIR)/etc/vsftpd.conf || \
> +		$(INSTALL) -D -m 644 $(@D)/vsftpd.conf \
> +			$(TARGET_DIR)/etc/vsftpd.conf
> +	$(INSTALL) -d -m 755 $(TARGET_DIR)/usr/share/empty
>   endef
>
>   define VSFTPD_UNINSTALL_TARGET_CMDS


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
