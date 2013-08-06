From: =?iso-8859-1?Q?Pl=FCss_Tobias_TA=2EE=2E1001?= <tobias.pluess@stud.hslu.ch>
Date: Tue, 6 Aug 2013 08:02:14 +0000
Subject: [Buildroot] Buildroot and NOMMU
In-Reply-To: <38F83949ED76A946BE17B6F2F98F362E0DA4F3@MX33.campus.intern>
References: <38F83949ED76A946BE17B6F2F98F362E0DA4F3@MX33.campus.intern>
Message-ID: <38F83949ED76A946BE17B6F2F98F362E0DA5D1@MX33.campus.intern>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi together,

it looks like nobody knows an answer to my question, so I'll answer myself in case anybody has once some similar problems.

Buildroot offers an option which enables an MMU-less build. However, if this option is checked in buildroot, uClibc and BusyBox are still built with MMU on. In order to disable the MMU for BusyBox and uClibc as well, one has to

make uclibc-menuconfig, as well as
make busybox-menuconfig

and disable the MMU in these individual menuconfigs. However, building BusyBox without MMU works without problems, but uClibc definitely *wants* an MMU, and I was unable to figure out some settings which allow disabling the MMU. It always produces the same warning: undefined reference to "fork". Which is very plausible, since fork() needs an MMU; the replacement would be vfork() but uClibc doesn't know that, and in the standard implementation, it looks like vfork() is missing or so. So the quintessence of this is: for ARM targets, it is - at least without modifying some code - not possible to force an NO MMU build for uClibc.

But then I wonder what the NOMMU option is for, if uClibc build fails when this option is enabled? and why can one build uClibc for targets like Blackfin, which do not have an MMU as well? Could somebody clarify?

Tobias.

________________________________
Von: Pl?ss Tobias TA.E.1001
Gesendet: Sonntag, 4. August 2013 16:38
An: buildroot at busybox.net
Betreff: Buildroot and NOMMU

Hi all,

I would like to use Buildroot for my self made embedded system which uses an ARM7TDMI processor. It doesn't have an MMU. So my question is:

is it sufficient to disable MMU support in the

make menuconfig

of Buildroot, or do I have to do

make uclibc-menuconfig

and

make busybox-menuconfig

as well and disable MMU support in each of these? Or shall I left the uClibc and Busybox settings unchanged? Because I want only a very minimalistic system for my first tests.

Thanks in advance,

Tobias

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130806/87585ffb/attachment.html>
