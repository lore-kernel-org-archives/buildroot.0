From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Dec 2017 08:43:41 +0100
Subject: [Buildroot] [PATCH v2] lynx: new package
In-Reply-To: <20171212184128.29536-1-mlang@blind.guru>
References: <20171212184128.29536-1-mlang@blind.guru>
Message-ID: <20171213084341.0cc77602@windsurf.png.is.keysight.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 12 Dec 2017 19:41:28 +0100, Mario Lang wrote:

> +config BR2_PACKAGE_LYNX
> +	bool "lynx"
> +	select BR2_PACKAGE_NCURSES if !BR2_PACKAGE_SLANG

Sadly, this causes a recursive dependency:

package/slang/Config.in:1:error: recursive dependency detected!
package/slang/Config.in:1:	symbol BR2_PACKAGE_SLANG is selected by BR2_PACKAGE_NCURSES
package/ncurses/Config.in:1:	symbol BR2_PACKAGE_NCURSES is selected by BR2_PACKAGE_SLANG
configuration written to /home/thomas/projets/buildroot/.config

It's not clear from the log, but I guess it's because the mc package
does it the other way around: select slang if !ncurses.

So, I've changed your lynx package to also do select slang if !ncurses.
I had to propagate the BR2_USE_MMU dependency of slang to lynx as a
consequence.

Applied with this fixed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
