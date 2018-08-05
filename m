From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 05 Aug 2018 23:39:32 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-08-04
References: <20180805060022.2DF08207A8@mail.bootlin.com>
Message-ID: <kd7k3fx875.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sun, 05 Aug 2018 08:00:22 +0200 schrieb Thomas Petazzoni:

>          arc |                   samba4-4.8.3 | NOK | http://
autobuild.buildroot.net/results/9188530d80f7bb8edc1394f3e9ad60806279f698 
|     
>     mips64el |                   samba4-4.8.3 | NOK | http://
autobuild.buildroot.net/results/7235cd53dd2eae02b9c25724da8e0ef2c789af3c 
|     
>     mips64el |                   samba4-4.8.3 | NOK | http://
autobuild.buildroot.net/results/8638d46e51333209c264fe3f21d9cf04602522f7 
|     

Hi,

finally I was able to reproduce the build error. The reason for the bug 
is described in an upstream bug report which was closed as WONTFIX:
https://bugzilla.samba.org/show_bug.cgi?id=9515

If installed, samba4 uses the docbook-xsl package from the host system to 
build parts of the documentation. On my Debian system the bug reported to 
samba4 was fixed in the docbook-xsl package:
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=765567

Looking at http://autobuild.buildroot.net/?reason=samba4-4.8.3 I saw the 
system from Matt Weber being called "(U14.04 RC LARGO)" so I installed 
Ubuntu 14.04.5, which does not carry the fix and voila, I could reproduce 
the error.

This patch fixes the problem by disabling the build of the documentation:
https://github.com/LibreELEC/LibreELEC.tv/blob/master/packages/network/
samba/patches/samba-950-no-man.patch

Are you willing to accept this patch for buildroot or should the docbook-
xsl package on the autobuilder instances instead be patched? At the end 
the bug is neither in the samba4 package nor in buildroot itself.

Regards, Bernd
