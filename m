From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 16 Apr 2013 23:34:24 +0200
Subject: [Buildroot] [PATCH] support/kconfig: use kconfig-provided way
 of setting the CONFIG_ prefix
In-Reply-To: <20130416230625.1656d877@skate>
References: <1365943997-23601-1-git-send-email-yann.morin.1998@free.fr>
 <20130416230625.1656d877@skate>
Message-ID: <20130416213424.GA14974@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Tue, Apr 16, 2013 at 11:06:25PM +0200, Thomas Petazzoni wrote:
> On Sun, 14 Apr 2013 14:53:17 +0200, Yann E. MORIN wrote:
> > It's now been a while since it has been possible to build the kconfig
> > parser to understand a prefix other than CONFIG_, and even no prefix
> > at all, by setting the CONFIG_ macro (#define) at biuld time.
> > 
> > Just use that, insted of patching, it will make it easier for us in the
> > future.
> 
> I haven't tested your patch nor looked at it carefully. However, I know
> there is a difference between what the kernel does and what Buildroot
> does in terms of Kconfig options.
> 
> In a kernel Kconfig file, the option names are not prefixed by
> 'CONFIG_', but when used in Makefiles, they are.
> 
> In Buildroot, option names are prefixed with 'BR2_' in both the
> Config.in files and in the Makefiles. Does your change takes this into
> account?

That's the whole point of this patch: use Kconfig ability to understand
any prefix other than the default 'CONFIG_', and even an empty prefix:

-HOST_EXTRACFLAGS += -I$(obj)
+HOST_EXTRACFLAGS += -I$(obj) -DCONFIG_=\"\"
                              ^^^^^^^^^^^^^^

This tells that the option prefix is empty, so:
    Config.in               .config
    --------------------------------------------
    config FOO              FOO=y
    config BR2_BAR          # BR2_BAR is not set


If I did use:  -DCONFIG_=\"YEM\" , then that would give:
    Config.in               .config
    --------------------------------------------
    config FOO              YEM_FOO=y
    config BR2_BAR          # YEM_BR2_BAR is not set


So yes, this patch maintains our do-not-add-a-prefix-to-options policy. ;-)

Regards,
Yann E. MORIN.

PS. It is even possible to override that prefix at runtime, too, but
    that's not the path I choose in this patch.
YEM.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
