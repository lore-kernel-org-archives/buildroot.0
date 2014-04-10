From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 10 Apr 2014 22:32:02 +0200
Subject: [Buildroot] [PATCH v11] xbmc: new package
In-Reply-To: <4a3j1bxkro.ln2@ID-313208.user.individual.net>
References: <1395875160-14253-1-git-send-email-yann.morin.1998@free.fr>
 <4a3j1bxkro.ln2@ID-313208.user.individual.net>
Message-ID: <20140410203202.GA4037@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-04-10 20:08 +0200, Bernd Kuhls spake thusly:
> while testing Gotham beta3 using configs/raspberrypi_defconfig I stumbled 
> across this part of xbmc.mk. The defconfig does not enable the BR2
> _PACKAGE_RPI_USERLAND package,

Yes, this is expected. The defconfig files are the minimum to get the
system up-n-running up to a shell prompt. rpi-userland is not part of
what is required for that, so it is explicitly not enabled.

> so xbmc is configured without its special 
> raspberry platform option.

This should not be possible, since XBMC depends on an OpenGL ES and EGL
backend to be selected, and rpi-suerland is such a provider for EGL and
GLES.

If you managed to be able to select XBMC without selecting rpi-userland,
that's because you enabled another OpenGL es and EGL provider. If no
provider for OpenGL ES and EGL is selected, then XBMC should not be
visible.

> Changing the above if-clause to check for package 
> BR2_PACKAGE_RPI_FIRMWARE, which is used in raspberrypi_defconfig, seems to 
> work better, at least Gotham beta3 is compiled without errors.

That's wrong, because rpi-firmware is not an OpenGL ES and EGL provider.
rpi-firmware only provides the boot files for the RPi.

> I have to add that I do not own a Raspberry system, this was the first time 
> ever I compiled code for it ;) What do you think about this patch?
> 
> diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
> index 9169698..e1885fc 100644
> --- a/package/xbmc/xbmc.mk
> +++ b/package/xbmc/xbmc.mk
> @@ -43,7 +43,7 @@ XBMC_CONF_OPT +=  \
>         --disable-rsxs \
>         --enable-optimizations
> 
> -ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
> +ifeq ($(BR2_PACKAGE_RPI_FIRMWARE),y)

This is incorrect, as I said above: the real dependency is on
rpi-userland.

At worst, this is because you have *another* OpenGL ES and EGL provider
selected in the menuconfig (see above).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
