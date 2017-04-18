From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Apr 2017 12:32:40 +0200
Subject: [Buildroot] [PATCH 1/1] openssh: add support for HW SSL engines
In-Reply-To: <1492505276-25285-1-git-send-email-gilad@benyossef.com>
References: <1492505276-25285-1-git-send-email-gilad@benyossef.com>
Message-ID: <e67f3248-f689-7b28-7ac5-8c625554ec89@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Gilad,

On 18-04-17 10:47, Gilad Ben-Yossef wrote:
> Add support for OpenSSH to use a hardware SSL engine if cryptodev-linux is
> included.

 I haven't checked, but doesn't openssh work equally well with OCF? In that
case, you should use "cryptodev" instead of "cryptodev-linux" in both the
condition and the DEPENDENCIES line.

 Also, I'm surprised that this is needed at all, I thought openssh handed off
all crypto to openssl, and openssl already has support for cryptodev. Could you
explain that point?

> 
> Signed-off-by: Gilad Ben-Yossef <gilad@benyossef.com>
> ---
>  package/openssh/openssh.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
> index f971e99..4a6c516 100644
> --- a/package/openssh/openssh.mk
> +++ b/package/openssh/openssh.mk
> @@ -28,6 +28,11 @@ endif
>  
>  OPENSSH_DEPENDENCIES = zlib openssl
>  
> +ifeq ($(BR2_PACKAGE_CRYPTODEV_LINUX), y)
> +OPENSSH_DEPENDENCIES += cryptodev-linux
> +OPENSSH_CONF_OPTS += --with-ssl-engine

 We generally like to add

else
OPENSSH_CONF_OPTS += --without-ssl-engine


 Regards,
 Arnout

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
