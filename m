From: Steve Kenton <skenton@ou.edu>
Date: Sun, 11 Jan 2015 16:17:54 -0600
Subject: [Buildroot] Fwd: Re:  [PATCH] libpng: add  libpng12
In-Reply-To: <54B2F652.4020402@ou.edu>
References: <54B2F652.4020402@ou.edu>
Message-ID: <54B2F692.7010304@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net




-------- Forwarded Message --------
Subject: Re: [Buildroot] [PATCH] libpng: add  libpng12
Date: Sun, 11 Jan 2015 16:16:50 -0600
From: Steve Kenton <skenton@ou.edu>
To: Gustavo Zacarias <gustavo@zacarias.com.ar>

On 01/11/2015 01:58 PM, Steve Kenton wrote:
>> The freetype support in dvdauthor specifies libpng12
> I'll try changing to libpng16 and see if it works
> 
The source of the libpng12 problem is information leaking in
from the Ubuntu 14.04 host. When configure is run for
dvdauthor it finds the wrong freetype-config

config.log:configure:5176: checking for freetype-config
config.log:configure:5192: found /usr/bin/freetype-config

which results in

config.log:FREETYPE_LIBS='-L/usr/lib/x86_64-linux-gnu -lfreetype -lz -lpng12'

The Config.in and dvdauthor.mk files (below) are pretty basic
Any thoughts on where I went wrong?

Thanks - Steve


###############################################################################
# dvdauthor
#
###############################################################################

DVDAUTHOR_VERSION = 0.7.1
#DVDAUTHOR_SOURCE = dvdauthor-$(DVDAUTHOR_VERSION).tar.gz
DVDAUTHOR_SITE = http://sourceforge.net/projects/dvdauthor/files/dvdauthor/$(DVDAUTHOR_VERSION)
DVDAUTHOR_DEPENDENCIES = host-pkgconf host-libxml2 libxml2 libpng freetype libdvdread
DVDAUTHOR_LICENSE = GPLv2
DVDAUTHOR_LICENSE_FILES = COPYING

$(eval $(autotools-package))



config BR2_PACKAGE_DVDAUTHOR
	bool "dvdauthor"
	select BR2_PACKAGE_LIBXML2
	select BR2_PACKAGE_LIBPNG
	select BR2_PACKAGE_FREETYPE
	select BR2_PACKAGE_LIBDVDREAD
	help
	  DVDAuthor is a set of tools to help you author the file and directory
	  structure of a DVD-Video disc, including programmatic commands for
	  implementing interactive behaviour. It is driven by command lines and
	  XML control files, though there are other programs that provide
	  GUI-based front ends if you prefer
	
	  http://dvdauthor.sourceforge.net
