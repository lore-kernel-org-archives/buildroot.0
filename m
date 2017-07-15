From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Jul 2017 11:51:23 +0200
Subject: [Buildroot] [PATCH 1/1] pulseaudio: add bluez5_utils as
 dependency
In-Reply-To: <20170714162137.9402-1-ccrisan@gmail.com>
References: <20170714162137.9402-1-ccrisan@gmail.com>
Message-ID: <20170715115123.51b9da0c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 14 Jul 2017 19:21:35 +0300, Calin Crisan wrote:
> The pulseaudio configure script autodetects the presence of
> bluez 4.x and 5.x packages on the system and will exclude the
> bluetooth-related modules in their absence.
> 
> This commit ensures that bluez5_utils, if selected, are installed
> before pulseaudio. The same already happens for bluez_utils (4.x).
> 
> Signed-off-by: Calin Crisan <ccrisan@gmail dot com>

Thanks, I've applied to master. However, I have a comment below.

> ---
>  package/pulseaudio/pulseaudio.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
> index ddd503a9f..2f2cfbbed 100644
> --- a/package/pulseaudio/pulseaudio.mk
> +++ b/package/pulseaudio/pulseaudio.mk
> @@ -32,6 +32,7 @@ PULSEAUDIO_DEPENDENCIES = \
>  	$(if $(BR2_PACKAGE_AVAHI_DAEMON),avahi) \
>  	$(if $(BR2_PACKAGE_DBUS),dbus) \
>  	$(if $(BR2_PACKAGE_BLUEZ_UTILS),bluez_utils) \
> +	$(if $(BR2_PACKAGE_BLUEZ5_UTILS),bluez5_utils) \
>  	$(if $(BR2_PACKAGE_OPENSSL),openssl) \
>  	$(if $(BR2_PACKAGE_FFTW),fftw) \
>  	$(if $(BR2_PACKAGE_SYSTEMD),systemd)

I've applied because you've followed how it's already done for this
package, but I'm not super happy with how it's done. Indeed, pulseaudio
configure script has explicit enable/disable options such as
--enable-bluez4, --enable-bluez5, --enable-openssl, etc.

And it would be a lot better to use them. One benefit is that if we
pass --enable-bluez4, but there is a dependency missing, pulseaudio
configure.ac script will bail out with an error, instead of silently
ignoring and building without pulseaudio support.

Would you be interested in reworking the pulseaudio package to take
advantage of those --enable/--disable options?

One example is that the bluez support (either 4 or 5) requires the sbc
library... which is not expressed at all in the current pulseuadio.mk.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
