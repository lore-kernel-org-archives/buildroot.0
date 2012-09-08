From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Sat, 08 Sep 2012 14:28:19 +0300
Subject: [Buildroot] Fixing linux-pam build failures
In-Reply-To: <CADiAo4L2eUCF-2dEBWEJbw1V9z7uaQ-1=AA6z9SE4FA9v529+Q@mail.gmail.com>
References: <CADiAo4L2eUCF-2dEBWEJbw1V9z7uaQ-1=AA6z9SE4FA9v529+Q@mail.gmail.com>
Message-ID: <504B2BD3.5080205@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Dmitry!

Your work on this pam support looks good.

I have attached in this message my very quick, unpolished & very very
very dirty pam (version 1.1.5) hack
(it doesn't bother to even check for if pam is enabled in busybox and it
assumes that pam.d stuff is already in fs/skeleton/etc )

I can't even remember when I did this ugly hack.

Got it somehow working with the help of :
http://www.linuxfromscratch.org/blfs/view/svn/postlfs/linux-pam.html
http://www.linuxfromscratch.org/blfs/view/svn/postlfs/shadow.html
and
http://www.linuxfromscratch.org/blfs/view/svn/postlfs/cracklib.html

Those Linux From Scratch pages are really great starting templates for
any new buildroot package!
:)

Also, those three patches mentioned in this attached file are from
openwrt project witch also
uses buildroot  stuff (???).

https://dev.openwrt.org/browser/packages/libs/libpam

If you find something usefull for your work then by all means salvage
what you need from it.

I just want to get quickly rid of my dirty pam hack as soon as official
support lands on buildroot.

Stefan

P.S:

Your work for v86d ( http://patchwork.ozlabs.org/patch/157286/ )
is working wonderfully in my distro !
Thanks!


8.9.2012 7:32, Dmitry Golubovsky kirjoitti:
> Hi,
>
> My initial assumption about the failures of linux-pam building in
> autobuilder was not correct: the problem was in BerkeleyDB
> configuration.
>
> When BerkeleyDB is not built, the pam_userdb module is not built
> either (via linux-pam configure). In this failed autobuilder
> configuration Berkeley DB was selected. But dbm functionality was not
> enabled in BerkeleyDB configure options. Thus the pam_userdb module
> was attempted to build, but it failed due to the absence of dbm
> functions in Berkeley DB, and this showed up in the build log.
>
> I have submitted a series of patches which address the problem:
>
> * if linux-pam is built, --enable-dbm is added to BerkeleyDB configure options
> * BerkeleyDB is autoselected when linux-pam is selected, and
> BerkeleyDB is now a dependency of linux-pam
>
> I also included my two other patches (since linux-pam is being patched anyway):
>
> * Provide dummy PAM config files to allow password-less logons via busybox login
> * New configuration option for PAM support has been added to the
> Busybox configuration menu.
>
> Any suggestions are welcome.
>
> Thanks.
>

-------------- next part --------------
