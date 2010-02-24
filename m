From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 Feb 2010 09:59:33 +0100
Subject: [Buildroot] madplay build failure
In-Reply-To: <99b73aa81002232342sc7823d6oda84f4e766122832@mail.gmail.com>
References: <99b73aa81002232342sc7823d6oda84f4e766122832@mail.gmail.com>
Message-ID: <20100224095933.77a91600@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Josh,

On Wed, 24 Feb 2010 15:42:59 +0800
Josh Wu <rainyfeeling@gmail.com> wrote:

> I am new in buildroot, when building madplay, I get the following build
> failure. Does anybody can point out a hint for me why this happened?
> I use the today's snapshot. 2010.02_rc2. Attached is the configuration file.

> -Wl,/home/josh/buildroot/latest_version/buildroot/output/staging/usr/lib
> audio_alsa.o: In function `config':
> audio_alsa.c:(.text+0x200): undefined reference to
> `snd_pcm_hw_params_set_rate_near at ALSA_0.9'
> audio_alsa.c:(.text+0x25c): undefined reference to
> `snd_pcm_hw_params_set_buffer_time_near at ALSA_0.9'
> audio_alsa.c:(.text+0x284): undefined reference to
> `snd_pcm_hw_params_get_buffer_size at ALSA_0.9'
> audio_alsa.c:(.text+0x2a4): undefined reference to
> `snd_pcm_hw_params_set_period_time_near at ALSA_0.9'
> audio_alsa.c:(.text+0x2d4): undefined reference to
> `snd_pcm_hw_params_get_period_size at ALSA_0.9'
> collect2: ld returned 1 exit status

I've reproduced your problem with the same .config. The problem is that
we build alsa-lib without symbol versioning (the "@ALSA_0.9" thing at
the end of symbol names), but madplay thinks that we compiled alsa-lib
with symbol versioning. This is probably due to the fact that the
alsa-lib installed on the host system (x86 or x86_64) is indeed
compiled with symbol versioning. So it's a typical case of host
information leaking into the target build.

However, I don't yet know how to prevent this information leakage. In
the mean time, two possible workarounds:

 * Uninstall alsa-lib from your host. But you'll loose sound and
   probably all your desktop :-)

 * Try to compile alsa-lib for the target without the
   --without-versioned option.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
