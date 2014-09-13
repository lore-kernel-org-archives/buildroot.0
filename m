From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 14 Sep 2014 00:01:54 +0200
Subject: [Buildroot] [PATCH V3 2/4] avrdude: Depend on elfutils instead
	of libelf to get the libelf library
In-Reply-To: <1409228494-19492-3-git-send-email-gregory.clement@free-electrons.com>
 (Gregory CLEMENT's message of "Thu, 28 Aug 2014 14:21:32 +0200")
References: <1409228494-19492-1-git-send-email-gregory.clement@free-electrons.com>
 <1409228494-19492-3-git-send-email-gregory.clement@free-electrons.com>
Message-ID: <87sijv5gdp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gregory" == Gregory CLEMENT <gregory.clement@free-electrons.com> writes:

 > The elfutils package provides a more recent version of the libelf, so
 > let's use it. It will allow to remove the libelf package and to avoid
 > conflicts with two packages providing the same library.

 > Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
 > ---
 >  package/avrdude/Config.in  | 6 +++++-
 >  package/avrdude/avrdude.mk | 2 +-
 >  2 files changed, 6 insertions(+), 2 deletions(-)

 > diff --git a/package/avrdude/Config.in b/package/avrdude/Config.in
 > index 8eac014..9a9b3fb 100644
 > --- a/package/avrdude/Config.in
 > +++ b/package/avrdude/Config.in
 > @@ -1,10 +1,14 @@
 >  config BR2_PACKAGE_AVRDUDE
 >  	bool "avrdude"
 > -	select BR2_PACKAGE_LIBELF
 > +	select BR2_PACKAGE_ELFUTILS
 >  	select BR2_PACKAGE_LIBUSB
 >  	select BR2_PACKAGE_LIBUSB_COMPAT
 >  	select BR2_PACKAGE_NCURSES
 >  	depends on BR2_TOOLCHAIN_HAS_THREADS
 > +	depends on BR2_LARGEFILE # elfutils
 > +	depends on BR2_USE_WCHAR # elfutils
 > +	depends on !BR2_avr32 # elfutils
 > +	depends on !BR2_bfin # elfutils
 >  	help
 >  	  avrdude is a programmer for Atmel AVR microcontrollers
 >  	  this package provides a version with new linuxspi driver

You forgot to update the toolchain options comment below.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
