From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 8 Nov 2013 13:17:15 +0100
Subject: [Buildroot] [git commit] openpgm: disable on AVR32
In-Reply-To: <20131107085841.8061F9BB05@busybox.osuosl.org>
References: <20131107085841.8061F9BB05@busybox.osuosl.org>
Message-ID: <20131108131715.0c03641e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Simon, Peter,

On Thu, 7 Nov 2013 09:56:24 +0100, Peter Korsgaard wrote:

>  config BR2_PACKAGE_OPENPGM
>  	bool "openpgm"
> +	depends on !BR2_GCC_VERSION_4_2_2_AVR32_2_1_5 # lacks required builtins

I apologize, but I'm going to contradict myself :-(

Your original patch had 'depends on !BR2_avr32' and I said it would be
more exact to have 'depends on !BR2_GCC_VERSION_4_2_2_AVR32_2_1_5',
since it's actually the compiler version that is causing the problem
(an hypothetical more recent gcc version for AVR32 might fix the
problem). And therefore, you sent an updated patch that uses a depends
on the compiler version, and it got committed.

But in fact, this has a significant drawback: it means that the
openpgm package can still be enabled when we're using an external AVR32
toolchain (which is what the autobuilders are doing).

Since for external toolchains we don't have any information about the
compiler version being used, I would in fact suggest to revert back to
'depends on !BR2_avr32' as you proposed originally.

I'm really sorry for this change of opinion, I just forgot the external
toolchain case when I made the comment previously.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
