From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 May 2017 21:48:10 +0200
Subject: [Buildroot] [PATCH] package/ntp: fix aarch64/mips build,
 -fPIC required
In-Reply-To: <20170513214917.3305-1-romain.naour@gmail.com>
References: <20170513214917.3305-1-romain.naour@gmail.com>
Message-ID: <20170517214810.35d31ce4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 13 May 2017 23:49:17 +0200, Romain Naour wrote:

> +# ntp build unconditionnaly some static libraries (libntpq.a, libntp.a etc...)
> +# The build system fail to create ntpsnmpd while linking these libraries when
> +# built without -fPIC.
> +NTP_CONF_ENV += \
> +	CFLAGS="-fPIC $(TARGET_CFLAGS)"

Thanks for this analysis. However, I was a bit surprised by your patch,
because I saw many -fPIC all over the place in the ntp build log, even
without your patch.

So I dug a little bit deeper, and found this Gentoo patch
https://gitweb.gentoo.org/repo/gentoo.git/commit/?id=494143c3b4921a5c8b8596d58f2c8b98296bf688,
which simply re-adds the proper flags to just the ntpq module. And this
does indeed solve the issue.

So I've instead committed a patch that adds the Gentoo patch. Thanks
anyway for your initial analysis, it was very useful to understand what
was going on.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
