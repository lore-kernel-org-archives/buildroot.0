From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 13 Apr 2016 00:31:19 +0200
Subject: [Buildroot] [PATCH] xdriver_x86-input-joystick: Install server
 config
In-Reply-To: <1460439467-29560-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1460439467-29560-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <570D7737.2090505@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/12/16 07:37, Ezequiel Garcia wrote:
> In order for joysticks to be detected and used with this
> driver, we need an xorg-server configuration file. This commit
> installs such conf file to the default X11 xorg.conf.d path,
> so we can at least provide a working template.
>
> Users with specific needs can of course override it.
>
> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> ---
>   package/x11r7/xdriver_xf86-input-joystick/50-joystick.conf        | 6 ++++++
>   .../xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk    | 8 ++++++++
>   2 files changed, 14 insertions(+)
>   create mode 100644 package/x11r7/xdriver_xf86-input-joystick/50-joystick.conf
>
> diff --git a/package/x11r7/xdriver_xf86-input-joystick/50-joystick.conf b/package/x11r7/xdriver_xf86-input-joystick/50-joystick.conf
> new file mode 100644
> index 000000000000..95a295ab0010
> --- /dev/null
> +++ b/package/x11r7/xdriver_xf86-input-joystick/50-joystick.conf
> @@ -0,0 +1,6 @@
> +Section "InputClass"
> +	Identifier "joystick catchall"
> +	MatchIsJoystick "on"
> +	MatchDevicePath "/dev/input/event*"
> +	Driver "joystick"
> +EndSection
> diff --git a/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk b/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk
> index c63312dd099f..8054743af038 100644
> --- a/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk
> +++ b/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk
> @@ -11,4 +11,12 @@ XDRIVER_XF86_INPUT_JOYSTICK_LICENSE = MIT
>   XDRIVER_XF86_INPUT_JOYSTICK_LICENSE_FILES = COPYING
>   XDRIVER_XF86_INPUT_JOYSTICK_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
>
> +define XDRIVER_XF86_INPUT_JOYSTICK_CONF
> +	$(INSTALL) -m 0644 -D \
> +		package/x11r7/xdriver_xf86-input-joystick/50-joystick.conf \
> +		$(TARGET_DIR)/usr/share/X11/xorg.conf.d/

  With -D, you should put the target filename as well, so

	$(INSTALL) -m 0644 -D \
		package/x11r7/xdriver_xf86-input-joystick/50-joystick.conf \
		$(TARGET_DIR)/usr/share/X11/xorg.conf.d/50-joystick.conf


  With that:
  Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  Regards,
  Arnout

> +
> +endef
> +XDRIVER_XF86_INPUT_JOYSTICK_POST_INSTALL_TARGET_HOOKS += XDRIVER_XF86_INPUT_JOYSTICK_CONF
> +
>   $(eval $(autotools-package))
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
