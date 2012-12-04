From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 04 Dec 2012 22:28:23 +0100
Subject: [Buildroot] [PATCH 03/51] package/dtc: add option to install
	programs
In-Reply-To: <201211301738.37463.yann.morin.1998@free.fr>
References: <1354146890-27380-1-git-send-email-yann.morin.1998@free.fr>
 <1354146890-27380-4-git-send-email-yann.morin.1998@free.fr>
 <50B77872.80005@mind.be> <201211301738.37463.yann.morin.1998@free.fr>
Message-ID: <50BE6AF7.8090101@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30/11/12 17:38, Yann E. MORIN wrote:
> Arnout, All,
>
> On Thursday 29 November 2012 Arnout Vandecappelle wrote:
>>    I (and I think Peter as well) prefer the more verbose
>>
>> ifeq ($(BR2_PACKAGE_DTC_BINARY),y)
>> DTC_INSTALL_RULE = install
>> else
>> DTC_BUILD_RULE   = libfdt
>> DTC_INSTALL_RULE = libfdt_install
>> endif
>
> Yes, it's easier to read.
>
>>    I would also call it _TARGET instead of _RULE.
>
> Why?

  Because it's not a rule.  A rule is a line with a colon in the Makefile
that is followed by a command.

  But actually target is also not correct - the GNU make manual calls it
a 'goal'. (Never mind that goal and target are synonyms :-)  That's why
the variable is called MAKECMDGOALS. So my suggestion to use _TARGET
was in fact wrong as well.


> DTC_INSTALL_TARGET already exists, and is meant to specify if the
> package is to be installed in tharget.

  Whaa, overloading! There's actually a DTC_TARGET_INSTALL_TARGET as well,
which contains the name of the make goal to install to the target
directory...

  Given that in buildroot the make goals are called targets all the time,
calling it _GOAL here would solve the duplication but reduces consistency.
Unless we change all the current uses of 'target' to 'goal' (which would
resolve some confusion with the target directory, so that would be a good
thing...).

  I realize that this is nitpicking, but if we choose a name now we'll
probably be stuck with it for years, so we need to have this discussion
at some point.


>
> OTOH, DTC_INSTALL_RULE (or DTC_INSTALL_MAKERULE, but it's ugly) is more
> explicit: it is the make rule to install the packag
[snip]

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
