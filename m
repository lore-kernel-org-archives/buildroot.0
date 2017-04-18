From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Apr 2017 20:05:21 +0200
Subject: [Buildroot] [PATCH v2 1/1] openssh: add support for HW SSL
	engines
In-Reply-To: <1492520583-13537-1-git-send-email-gilad@benyossef.com>
References: <1492520583-13537-1-git-send-email-gilad@benyossef.com>
Message-ID: <9512a327-53f7-fa8b-ef6a-c8c2c49c337e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18-04-17 15:03, Gilad Ben-Yossef wrote:
> Enable support for OpenSSH to use a hardware SSL engine if
> cryptodev-linux is included. Without this, OpenSSH uses only
> OpenSSL software crypto implementation.

 You should have also explained that you haven't tested OCF, but OK.

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> 
> Signed-off-by: Gilad Ben-Yossef <gilad@benyossef.com>
> CC: Baruch Siach <baruch@tkos.co.il>
> CC: Arnout Vandecappelle <arnout@mind.be>
> ---
> 
> Changes from v1:
> Incorporated style feedback from Baruch and Arnout.
> 
>  package/openssh/openssh.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
> index f971e99..7e197b0 100644
> --- a/package/openssh/openssh.mk
> +++ b/package/openssh/openssh.mk
> @@ -28,6 +28,13 @@ endif
>  
>  OPENSSH_DEPENDENCIES = zlib openssl
>  
> +ifeq ($(BR2_PACKAGE_CRYPTODEV_LINUX),y)
> +OPENSSH_DEPENDENCIES += cryptodev-linux
> +OPENSSH_CONF_OPTS += --with-ssl-engine
> +else
> +OPENSSH_CONF_OPTS += --without-ssl-engine
> +endif
> +
>  ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
>  define OPENSSH_INSTALL_PAM_CONF
>  	$(INSTALL) -D -m 644 $(@D)/contrib/sshd.pam.generic $(TARGET_DIR)/etc/pam.d/sshd
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
