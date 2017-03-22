From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Wed, 22 Mar 2017 10:20:41 +0100
Subject: [Buildroot] [PATCH v5 11/19] infra-libtool: pass sysroot
	information to libtool
In-Reply-To: <20170322091437.7ebd63bf@free-electrons.com>
References: <1482241596-31688-1-git-send-email-jezz@sysmic.org>
 <8e7692b2-4ebc-d533-8eda-d4a92fd2a7f8@mind.be>
 <20170322091437.7ebd63bf@free-electrons.com>
Message-ID: <3486005.igxPQ1hGml@sagittae>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wednesday 22 March 2017 09:14:37 CET Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 22 Mar 2017 00:57:39 +0100, Arnout Vandecappelle wrote:
> 
> > > So are you sure that this feature didn't appear in libtool 2.4 ?  
> > 
> >  Yeah, looks like it. E.g. speex has libtool 1.5, and it doesn't have any
> > sysroot support (not in configure, not in ltmain.sh).
> > 
> >  Obviously, *this* patch is not affected by it - it certainly doesn't hurt
> >  to pass the --with-sysroot configure option. It's only patches 12+13 that
> >  we wouldn't be able to remove.
> > 
> >  However, considering:
> > 
> > - most packages install things in /usr/lib, which is already searched by
> > default;
> > 
> > - most packages use libtool 2.4 or later,
> > 
> > I think we can take the risk. The autobuilders will discover any issues,
> > which we can fix per package (e.g. with AUTORECONF = YES).
> 
> Since I would prefer to avoid autoreconfiguring many packages, it would
> be useful to know how many packages are still using libtool versions
> earlier than 2.4.

This is precisely what I wanted to known before to replying.

I extracted all (or nearly all) packages existing in Buildroot. I found 269 
packages that use libool:

$ grep -ho 'VERSION="[0-9.]*' */ltmain.sh  | sort | uniq -c | sort -n
      1 VERSION="1.5.24
      1 VERSION="2.2.4
      3 VERSION="1.5.22
      5 VERSION="1.5.26
     13 VERSION="2.2.6
     29 VERSION="2.4.6
     67 VERSION="2.4.2

There 23 packages that use libtool < 2.4:
  - bellagio
  - celt051
  - dbus-cpp
  - eventlog
  - gtk2-engines
  - lesstif
  - libargtable2
  - libesmtp
  - liblo
  - libmhash
  - libnetfilter_conntrack
  - libnetfilter_log
  - libnfnetlink
  - libpthread-stubs
  - lite
  - log4cxx
  - matchbox-lib
  - metacity
  - sdl_sound
  - sylpheed
  - xapp_xinput-calibrator
  - xdriver_xf86-input-tslib
  - xdriver_xf86-video-imx

4 of them already call autoreconf: bellagio, dbus-cpp, libnetfilter_log, 
libnfnetlink.

I am going to create a configuration with all of these packages.

++

-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
