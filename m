From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Sep 2013 18:35:52 +0200
Subject: [Buildroot] [PATCH 06/10] openssh: add support for SELinux
In-Reply-To: <1378429464-12546-7-git-send-email-rjbarnet@rockwellcollins.com>
References: <1378429464-12546-1-git-send-email-rjbarnet@rockwellcollins.com>
 <1378429464-12546-7-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <20130908183552.45492faa@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ryan Barnett,

On Thu, 5 Sep 2013 20:04:20 -0500, Ryan Barnett wrote:
> Adding configuration options for SELinux along with install
> configuration of Linux-PAM for SSHd when the linux-pam packages is
> selected
> 
> Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
> ---
>  package/openssh/openssh.mk |   12 ++++++++++++
>  1 files changed, 12 insertions(+), 0 deletions(-)
> 
> diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
> index 4a5b125..6324ef8 100644
> --- a/package/openssh/openssh.mk
> +++ b/package/openssh/openssh.mk
> @@ -12,9 +12,21 @@ OPENSSH_CONF_OPT = --disable-lastlog --disable-utmp \
>  
>  OPENSSH_DEPENDENCIES = zlib openssl
>  
> +define OPENSSH_INSTALL_PAM_CONF
> +	$(INSTALL) -D -m 644 $(@D)/contrib/sshd.pam.generic $(TARGET_DIR)/etc/pam.d/sshd
> +	sed -i '/password   required     \/lib\/security\/pam_cracklib.so/d' $(TARGET_DIR)/etc/pam.d/sshd

What about using a different separator than / in order to avoid having
to escape it? I.e:

	'%password   required  /lib/security/pam_cracklib.so%d'

> +	sed -i -e 's/\#UsePAM no/UsePAM yes/' $(TARGET_DIR)/etc/sshd_config

Also, use $(SED) instead of sed -i -e.

Finally, while the first and third commands purpose is obvious, the
purpose of the second command is less obvious. Adding a comment about
OPENSSH_INSTALL_PAM_CONF would be great.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
