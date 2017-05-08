From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 May 2017 21:49:11 +0200
Subject: [Buildroot] [PATCH] package/espeak: add comment to ignore
 'unmet dependencies'
In-Reply-To: <20170507203856.5328-1-yann.morin.1998@free.fr>
References: <20170507203856.5328-1-yann.morin.1998@free.fr>
Message-ID: <20170508214911.6c0abdb4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  7 May 2017 22:38:56 +0200, Yann E. MORIN wrote:
> On master 86b4eeccc4, espeak can generate spurious 'unmet dependencies'
> messages:
> 
>     $ make KCONFIG_SEED=0x7A85DEE0 randconfig
>     warning: (BR2_PACKAGE_ESPEAK_AUDIO_BACKEND_ALSA) selects
>     BR2_PACKAGE_PORTAUDIO_CXX which has unmet directdependencies
>     (BR2_PACKAGE_PORTAUDIO && BR2_INSTALL_LIBSTDCPP)
> 
> However, the dpendency chain *is* correct. There is something that
> causes the kconfig parser to get really confused...
> 
> Add a comment statng the issue is spurious, so noone tries to fix it.

Indeed, I don't see anything wrong in this dependency chain.

>  config BR2_PACKAGE_ESPEAK_AUDIO_BACKEND_ALSA
>  	bool "alsa via portaudio"
> +	# Selecting portaudio generates spurious "unmet dependencies"
> +	# warnings. Unless you are changing the dependencies of espeak
> +	# or portaudio, just ignore those spurious warnings.
>  	select BR2_PACKAGE_PORTAUDIO
>  	select BR2_PACKAGE_PORTAUDIO_CXX

Perhaps we could simply add a "depends on BR2_INSTALL_LIBSTDCPP" here,
which most likely would silence the warning?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
