From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 21 Aug 2012 22:04:54 +0200
Subject: [Buildroot] BR2_SOURCEFORGE_MIRROR issue in package .mk files
In-Reply-To: <5033D397.1010105@petroprogram.com>
References: <CAJkQPO=k7cmM46OXekN1s6n-Whk8_AG5hs37Q=ELgvzoVOj8XA@mail.gmail.com>
 <5033C059.9060603@petroprogram.com> <5033D397.1010105@petroprogram.com>
Message-ID: <201208212204.55029.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Aras, Stefan, All,

On Tuesday 21 August 2012 20:29:43 Stefan Fr?berg wrote:
> 21.8.2012 20:07, Stefan Fr?berg kirjoitti:
> > 21.8.2012 18:51, Aras Vaichas kirjoitti:
> >> I was rebuilding my Buildroot when I noticed that the
> >> kent.dl.sourceforge.net mirror is down and my build fails.
[--SNIP--]
> It seems that it is possible to let sourceforge pick the right mirror
> automatically with wget

> wget
> http://sourceforge.net/projects/boost/files/boost/1.49.0/boost_1_49_0.tar.bz2/download
> 
> and it produced something like this:
> 
> --2012-08-21 21:21:40-- 
> http://sourceforge.net/projects/boost/files/boost/1.49.0/boost_1_49_0.tar.bz2/download
> Resolving sourceforge.net... 216.34.181.60
> Connecting to sourceforge.net|216.34.181.60|:80... connected.
> HTTP request sent, awaiting response... 302 Found
> Location:
> http://downloads.sourceforge.net/project/boost/boost/1.49.0/boost_1_49_0.tar.bz2?r=&ts=1345573301&use_mirror=garr
         ^^^^^^^^^
> [following]

[--SNIP--]

> So automatic sourceforge mirror selection should be trivial to do if all
> the other sourceforge packages also follow the same syntax:
> http://sourceforge.net/projects/${PACKAGE_NAME}/files/${PACKAGE_NAME}/${PACKAGE_VERSION}/${PACKAGE_FILENAME}/download

Well, to avoid one 302-redirect, it's possible to directly use their mirror
selection mechanism. For boost, that'd simply be:

$ wget http://downloads.sourceforge.net/project/boost/boost/1.49.0/boost_1_49_0.tar.bz2

--2012-08-21 21:52:21--  http://downloads.sourceforge.net/project/boost/boost/1.49.0/boost_1_49_0.tar.bz2
Resolving downloads.sourceforge.net... 216.34.181.59
Connecting to downloads.sourceforge.net|216.34.181.59|:80... connected.
HTTP request sent, awaiting response... 302 Found
Location: http://ignum.dl.sourceforge.net/project/boost/boost/1.49.0/boost_1_49_0.tar.bz2 [following]
--2012-08-21 21:52:21--  http://ignum.dl.sourceforge.net/project/boost/boost/1.49.0/boost_1_49_0.tar.bz2
Resolving ignum.dl.sourceforge.net... 62.109.128.11, 2001:1ab0:7e1f:1:230:48ff:fed1:9c0a
Connecting to ignum.dl.sourceforge.net|62.109.128.11|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 48499961 (46M) [application/x-bzip2]
Saving to: ?boost_1_49_0.tar.bz2?
[--SNIP--]

In buildroot, it could be written thus:
BOOST_SITE = sf://boost/boost/$(BOOST_VERSION)

with 'sf://' automatically turned by the pkg-infa into the canonical SF
download base URL:
  http://downloads.sourceforge.net/project/

and thus giving the full URL:
  http://downloads.sourceforge.net/project/boost/boost/$(BOOST_VERSION)/$(BOOST_SOURCE)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
