From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 May 2017 22:16:49 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/cwiid: add optional
 dependency to bluez5_utils
In-Reply-To: <16e63a8d-e200-457d-bd74-01176c67d4fe@mind.be>
References: <20170321072207.5396-1-bernd.kuhls@t-online.de>
 <20170321073124.5qynrhrg4cp5gndm@tarshish>
 <16e63a8d-e200-457d-bd74-01176c67d4fe@mind.be>
Message-ID: <20170507221649.132031c2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 21 Mar 2017 09:36:23 +0100, Arnout Vandecappelle wrote:

> >> -	select BR2_PACKAGE_BLUEZ_UTILS
> >> +	select BR2_PACKAGE_BLUEZ5_UTILS if !BR2_PACKAGE_BLUEZ_UTILS  
> > 
> > You need to add missing bluez5_utils dependencies 
> > (BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4, BR2_TOOLCHAIN_HAS_SYNC_4). Changing 
> > bluez_utils to bluez5_utils in the comments above would also be nice.  
> 
>  Darn, this is getting complicated... We would want to keep the dependencies as
> they are, and use bluez_utils in case bluez5_utils are not available. But that
> would mean something like:
> 
> 	select BR2_PACKAGE_BLUEZ5_UTILS if !BR2_PACKAGE_BLUEZ_UTILS \
> 		&& BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 \
> 		&& BR2_TOOLCHAIN_HAS_SYNC_4
> 	select BR2_PACKAGE_BLUEZ_UTILS if !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 \
> 		|| !BR2_TOOLCHAIN_HAS_SYNC_4
> 
>  Yuk...
> 
>  Perhaps a BR2_PACKAGE_BLUEZ5_UTILS_ARCH_SUPPORTS would help?

Perhaps it's a case where we need to use a "depends on" dependency
rather than a "select" dependency, i.e do:

	depends on BR2_PACKAGE_BLUEZ5_UTILS || BR2_PACKAGE_BLUEZ_UTILS

Bernd, could you resubmit your patch with this idea? Don't forget to
remove the "depends on" on toolchain/architecture features that are no
longer needed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
