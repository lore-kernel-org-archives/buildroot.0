From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Apr 2013 09:45:53 +0200
Subject: [Buildroot] [PATCH] support/kconfig: use kconfig-provided way
 of setting the CONFIG_ prefix
In-Reply-To: <20130416213424.GA14974@free.fr>
References: <1365943997-23601-1-git-send-email-yann.morin.1998@free.fr>
 <20130416230625.1656d877@skate> <20130416213424.GA14974@free.fr>
Message-ID: <20130417094553.3a47343b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Tue, 16 Apr 2013 23:34:24 +0200, Yann E. MORIN wrote:

> That's the whole point of this patch: use Kconfig ability to understand
> any prefix other than the default 'CONFIG_', and even an empty prefix:
> 
> -HOST_EXTRACFLAGS += -I$(obj)
> +HOST_EXTRACFLAGS += -I$(obj) -DCONFIG_=\"\"
>                               ^^^^^^^^^^^^^^
> 
> This tells that the option prefix is empty, so:
>     Config.in               .config
>     --------------------------------------------
>     config FOO              FOO=y
>     config BR2_BAR          # BR2_BAR is not set
> 
> 
> If I did use:  -DCONFIG_=\"YEM\" , then that would give:
>     Config.in               .config
>     --------------------------------------------
>     config FOO              YEM_FOO=y
>     config BR2_BAR          # YEM_BR2_BAR is not set
> 
> 
> So yes, this patch maintains our do-not-add-a-prefix-to-options policy. ;-)

Aah, ok. That explains why I wasn't seeing our 'BR2_' prefix anywhere
in your change. It's because we tell kconfig "We don't have a prefix",
and in fact our prefix is hardcoded directly into each and every
Config.in option. Makes sense.

So I haven't tested your patch, but on the principle, it definitely
looks great.

> PS. It is even possible to override that prefix at runtime, too, but
>     that's not the path I choose in this patch.

I think the compile time choice you made is fine.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
