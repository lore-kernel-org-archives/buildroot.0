From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 01 Apr 2018 14:32:29 +0200
Subject: [Buildroot] [PATCH] hackrf: new package
In-Reply-To: <87o9j3rtwe.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Sun, 01 Apr 2018 14:30:25 +0200")
References: <20180331205758.9652-1-arnout@mind.be>
 <87o9j3rtwe.fsf@dell.be.48ers.dk>
Message-ID: <87k1trrtsy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

Hi,

 >> +config BR2_PACKAGE_HACKRF
 >> +	bool "hackrf"
 >> +	depends on !BR2_STATIC_LIBS
 >> +	depends on BR2_TOOLCHAIN_HAS_THREADS
 >> +	depends on BR2_PACKAGE_FFTW_PRECISION_SINGLE

 > While not strictly required I think we should select BR2_PACKAGE_FFTW so
 > it cannot easily be deselected in menuconfig.

 > Committed with that fixed, thanks.

Ehh, skip that - kconf gets confused about that:

package/fftw/Config.in:24:error: recursive dependency detected!
package/fftw/Config.in:24:      choice <choice> contains symbol BR2_PACKAGE_FFTW
package/fftw/Config.in:1:       symbol BR2_PACKAGE_FFTW is selected by BR2_PACKAGE_HACKRF
package/hackrf/Config.in:1:     symbol BR2_PACKAGE_HACKRF depends on BR2_PACKAGE_FFTW_PRECISION_SINGLE
package/fftw/Config.in:30:      symbol BR2_PACKAGE_FFTW_PRECISION_SINGLE is part of choice <choice>

grr, I hate choice options :/

Committed without the select.

-- 
Bye, Peter Korsgaard
