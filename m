From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Jan 2013 00:00:37 +0100
Subject: [Buildroot] RTLD_DEEPBIND and uClibc
In-Reply-To: <50F6A26D.4030607@petroprogram.com>
References: <50F6A26D.4030607@petroprogram.com>
Message-ID: <20130117000037.39ccc628@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Stefan Fr?berg,

On Wed, 16 Jan 2013 14:51:57 +0200, Stefan Fr?berg wrote:

> Yesterday evening I managed to compile cairo-dock-core and
> cairo-dock-plugins
> version 3.1.2 for buildroot 2012.08.
> 
> It's a nice, lightweight (made with C), Mac OSX feeling application
> dock.
> 
> The problem is that cairo-dock-core has the following line in it's
> code:
> 
> pCairoDockModule->handle = dlopen (pCairoDockModule->cSoFilePath,
> RTLD_LAZY | RTLD_LOCAL | RTLD_DEEPBIND);
> 
> And uClibc does not have RTLD_DEEPBIND. Removing it will allow
> cairo-dock to compile but the result is
> that cairo-dock plugins won't work.

Strange, from a quick look, it seems that it is used to get a single
symbol, called "pre_init" from each plugin. I don't see how pre_init
may conflict with some other global symbol, which is what RTLD_DEEPBIND
is all about. But I've only done a 5 minutes look at cairo-dock code,
so I might have missed the point.

> Is there any workaround to this RTLD_DEEPBIND stuff ?

Since you're using a big stuff like X.org, why do you persist in using
uClibc? Using glibc or eglibc would make a very small size difference,
and would avoid the hassle of all those small, but annoying, uClibc
limitations.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
