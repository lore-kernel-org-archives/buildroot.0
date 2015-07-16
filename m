From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Jul 2015 22:52:37 +0200
Subject: [Buildroot] Major regression introduced by "Makefile: don't depend
 on the umask"
In-Reply-To: <20150713105928.337D5807AE@busybox.osuosl.org>
References: <20150713105928.337D5807AE@busybox.osuosl.org>
Message-ID: <20150716225237.367d958a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Guido, Arnout,

On Mon, 13 Jul 2015 12:57:58 +0200, Thomas Petazzoni wrote:

> diff --git a/Makefile b/Makefile
> index daf692e..55b1d45 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -24,6 +24,19 @@
>  # You shouldn't need to mess with anything beyond this point...
>  #--------------------------------------------------------------
>  
> +# Trick for always running with a fixed umask
> +UMASK=0022
> +ifneq ($(shell umask),$(UMASK))
> +.PHONY: all $(MAKECMDGOALS)
> +
> +all:
> +	@umask $(UMASK) && $(MAKE) --no-print-directory
> +
> +$(MAKECMDGOALS):
> +	@umask $(UMASK) && $(MAKE) --no-print-directory $@
> +

I believe this unfortunately doesn't work properly: if you do a make
invocation with multiple targets, it will run on sub-make invocation
for each of them, causing all Buildroot makefiles to be parsed for each
target instead of only once.

You can do the test yourself. As a preparation, do something like:

$ make libesmtp-patch fbset-patch findutils-patch fping-patch gamin-patch gesftpserver-patch gmpc-patch iftop-patch jasper-patch less-patch libcap-ng-patch libdvdnav-patch libdvdread-patch libcuefile-patch musepack-patch libreplaygain-patch libsamplerate-patch libsndfile-patch linux-fusion-patch lm-sensors-patch mplayer-patch host-nasm-patch ngircd-patch proftpd-patch sawman-patch sdl_gfx-patch sdl_image-patch sdl_mixer-patch sdl_net-patch sdl_sound-patch sdl_ttf-patch sdl-patch shared-mime-info-patch spice-protocol-patch spice-patch statserial-patch taglib-patch udisks-patch time-patch tcping-patch

Once this is done, we will run this command once again. It should do
nothing since everything has already be done and therefore be fairly
quick. But it's not if your system has a umask different from 022,
since the mechanism invoking the sub-make will invoke one sub-make for
each target:

$ time make libesmtp-patch fbset-patch findutils-patch fping-patch gamin-patch gesftpserver-patch gmpc-patch iftop-patch jasper-patch less-patch libcap-ng-patch libdvdnav-patch libdvdread-patch libcuefile-patch musepack-patch libreplaygain-patch libsamplerate-patch libsndfile-patch linux-fusion-patch lm-sensors-patch mplayer-patch host-nasm-patch ngircd-patch proftpd-patch sawman-patch sdl_gfx-patch sdl_image-patch sdl_mixer-patch sdl_net-patch sdl_sound-patch sdl_ttf-patch sdl-patch shared-mime-info-patch spice-protocol-patch spice-patch statserial-patch taglib-patch udisks-patch time-patch tcping-patch

(during this command, the CPU goes crazy to 100%)

real	1m50.089s
user	1m41.480s
sys	0m3.580s

Now, forcing the umask to 022 before running the command, with bypasses
the new mechanism:

$ umask 022
$ time make libesmtp-patch fbset-patch findutils-patch fping-patch gamin-patch gesftpserver-patch gmpc-patch iftop-patch jasper-patch less-patch libcap-ng-patch libdvdnav-patch libdvdread-patch libcuefile-patch musepack-patch libreplaygain-patch libsamplerate-patch libsndfile-patch linux-fusion-patch lm-sensors-patch mplayer-patch host-nasm-patch ngircd-patch proftpd-patch sawman-patch sdl_gfx-patch sdl_image-patch sdl_mixer-patch sdl_net-patch sdl_sound-patch sdl_ttf-patch sdl-patch shared-mime-info-patch spice-protocol-patch spice-patch statserial-patch taglib-patch udisks-patch time-patch tcping-patch
make: Nothing to be done for 'fbset-patch'.
make: Nothing to be done for 'findutils-patch'.
make: Nothing to be done for 'fping-patch'.
make: Nothing to be done for 'gamin-patch'.
make: Nothing to be done for 'gesftpserver-patch'.
make: Nothing to be done for 'gmpc-patch'.
make: Nothing to be done for 'iftop-patch'.
make: Nothing to be done for 'jasper-patch'.
make: Nothing to be done for 'less-patch'.
make: Nothing to be done for 'libcap-ng-patch'.
make: Nothing to be done for 'libdvdnav-patch'.
make: Nothing to be done for 'libdvdread-patch'.
make: Nothing to be done for 'libcuefile-patch'.
make: Nothing to be done for 'musepack-patch'.
make: Nothing to be done for 'libreplaygain-patch'.
make: Nothing to be done for 'libsamplerate-patch'.
make: Nothing to be done for 'libsndfile-patch'.
make: Nothing to be done for 'linux-fusion-patch'.
make: Nothing to be done for 'lm-sensors-patch'.
make: Nothing to be done for 'mplayer-patch'.
make: Nothing to be done for 'host-nasm-patch'.
make: Nothing to be done for 'ngircd-patch'.
make: Nothing to be done for 'proftpd-patch'.
make: Nothing to be done for 'sawman-patch'.
make: Nothing to be done for 'sdl_gfx-patch'.
make: Nothing to be done for 'sdl_image-patch'.
make: Nothing to be done for 'sdl_mixer-patch'.
make: Nothing to be done for 'sdl_net-patch'.
make: Nothing to be done for 'sdl_sound-patch'.
make: Nothing to be done for 'sdl_ttf-patch'.
make: Nothing to be done for 'sdl-patch'.
make: Nothing to be done for 'shared-mime-info-patch'.
make: Nothing to be done for 'spice-protocol-patch'.
make: Nothing to be done for 'spice-patch'.
make: Nothing to be done for 'statserial-patch'.
make: Nothing to be done for 'taglib-patch'.
make: Nothing to be done for 'udisks-patch'.
make: Nothing to be done for 'time-patch'.
make: Nothing to be done for 'tcping-patch'.

real	0m2.645s
user	0m2.424s
sys	0m0.108s

So what was taking 2.6 seconds is now taking 1 minute and 50 seconds.
Not really a great improvement, as you can imagine :-/

Could you look into this problem?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
