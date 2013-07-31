From: Paul B. Henson <henson@acm.org>
Date: Tue, 30 Jul 2013 19:41:10 -0700
Subject: [Buildroot] [PATCH] kobs-ng: new package
In-Reply-To: <20130729205402.6fff1ad4@skate>
References: <20130729031743.9E00A5C125@zaphod.pbhware.com>
 <20130729205402.6fff1ad4@skate>
Message-ID: <51F87946.2090508@acm.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 7/29/2013 11:54 AM, Thomas Petazzoni wrote:

> Not sure it should be with the filesystem tools. Maybe just Hardware
> handling?

The menu says "Filesystem and flash utilities", kobs-ng is a flash 
utility, so it initially made sense to me. I can move it to the hardware 
section if you prefer.

>> +	bool "kobs-ng"
>> +	help
>> +	  Build freescale kobs-ng utility for burning bootstreams to NAND
>
> Missing upstream URL.

There isn't really an upstream URL for this specific package. Although 
it is GPL, and freely distributable, Freescale releases it as part of 
their board support packages, not as a standalone package. The only way 
to get it from Freescale is by downloading an entire BSP, each one of 
which usually has a different version of kobs-ng in it.

It's similar to the existing Freescale elftosb package already in the 
tree. Although it doesn't look like there is a Config.in in the elftosb 
directory, only elftosb.mk, so I'm not sure what the current status of 
that package is.

I see there are also a few other Freescale specific firmware and library 
packages in the tree (freescale-imx directory), they all say "This 
library is provided by Freescale as-is and doesn't have an upstream.", 
should I just put something similar?

>> +# kobs-ng versions have never made much sense :(
>> +KOBS_NG_VERSION = 3.0.35-4.0.0
>> +KOBS_NG_SOURCE = kobs-ng-$(KOBS_NG_VERSION).tar.gz
>
> Not needed, this is the default.

You mean the source line, not the version line, right?

> Isn't the default 'make install' working properly?

I remember having problems with it on an earlier version, I'll test 
again with this version and see if they were resolved.

> I'm not sure to understand how this tool is typically used. On the
> target itself? But then how do you get something on the target from the
> first place if the tool is needed to flash a bootloader in NAND?

Yes, the tool is typically used on the target itself. I don't have 
extensive experience with freescale, but my understanding is you 
typically bootstrap via some other boot method (SD card, USB-DFU, etc) 
to initially burn a bootstream to NAND. At that point, you can update 
the bootloader in an environment booted from NAND. u-boot has a tool 
called mxsboot that tries to generate a bootstream image that can be 
burned directly to NAND, but it makes a lot of assumptions about things 
kobs-ng determines dynamically and it seems more reliable to use the 
freescale purposed tool on the actual target environment.

> This patch lacks a header with description and Signed-off-by. Also, is
> there a chance that you can submit it upstream?

I'll add a header. I'm really not sure how one would submit changes to 
freescale upstream; AFAIK their code repository is not public and they 
don't have a mailing list for this tool's development. They have some 
general-purpose forums, and there are a fair number of freescale 
employees subscribed to various embedded oriented mailing lists (perhaps 
even this one?), but short of purchasing a support contract I don't know 
that there is any way to get official freescale notice of a patch 
submission.

Thanks?
