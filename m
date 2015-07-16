From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Jul 2015 23:07:22 +0200
Subject: [Buildroot] [PATCH] package: Fix overwrite inittab w/ default
 skeleton
In-Reply-To: <1437064235-32432-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1437064235-32432-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20150716230722.304e5f9a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Thu, 16 Jul 2015 18:30:35 +0200, Maxime Hadjinlian wrote:
> If you select a custom skeleton, and have busybox or sysvinit as init,
> the install of their inittab would trigger, rendering yours useless.
> 
> The hooks doing the sed in the skeleton package would only trigger for a
> default skeleton.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  package/busybox/busybox.mk   | 2 +-
>  package/sysvinit/sysvinit.mk | 8 +++++++-
>  2 files changed, 8 insertions(+), 2 deletions(-)

Unfortunately, even if Gustavo gave his Acked-by, I'm tempted to not
apply this patch. There are *tons* of other stuff that we don't install
conditionally. For example, we used to install init scripts only if an
init script was not already installed to allow a custom skeleton to
provide such init scripts. But a while ago, we decided to get rid of
this policy, and install init scripts and configuration files
unconditionally. Just a few commits related to that:

649a6a64290ea214a034e5fb138d5c205eb44d98 mpd: install configuration file unconditionally
f1557b855c57c2f0dd24230213b3875ae75ef341 inadyn: install configuration file unconditionally
e07c97adcb55629dc0cc72aed2bb652f7af640a5 php: install configuration file unconditionally
e3d6179bb767c4a6d726cf897d47a076892357db usbmount: install configuration file unconditionally
963bbf266bfebc240888cf8bce502a2fadb38c48 screen: install configuration file unconditionally
428f1e7e70c6bc410b12bbb6f8137eae1fffaa6e sysklogd: install configuration file unconditionally
5ad5d55924bcc7086f834a28db9c227371728470 ifplugd: install configuration files unconditionally
0a28ed55f84ac75ac1b3f2374ef0b10aafb61d7f logrotate: install configuration file unconditionally
e0e56499354d41a3512b674004d84f9e82f98b15 samba: install configuration file unconditionally
0e18b0a4e12e739aed6eb892a246d3d27a007a38 proftpd: install configuration file unconditionally
82f82117eeebb2694565d26c1d76019823c7c057 fluxbox: install session file unconditionally
19c8fa96b5a1396c49abe21efda8a31b9a743816 input-event-daemon: install configuration file unconditionally
c51ec898127767a28d366ab69a230dd382f361fc stunnel: install configuration file unconditionally
aa6c7a8a994adad042668b569543e308318ecc5b transmission: install init script unconditionally
8a6482db88fc9f6076bc25f9b2b9defadc8fc809 rsyslog: install init script and config file unconditionally
1c8369ce3f9d3c3316b36885f9124e5ae89a1837 rpcbind: install init script unconditionally
bb231c7c2fa1e5cd70372aa416a7c63e641e8b09 lighttpd: install configuration files with sensible (0644) permissions
fa36ccd2f549b141c241bf2232dd56dedd218d9d lighttpd: install init script and config file unconditionally
febe876dcc18938b43fe1012b0acc689176188ac iucode-tool: install init script unconditionally
e31c6b961aff7e5018f8f5c72d938f1ad577c21f dmraid: install init script unconditionally
de78a9896fb89b3d5cff18c592ac1a61e2db23bf busybox: install init script and config file unconditionally
dc82dea73b878432bde1b2b164f4c746036fd772 aiccu: install init script and config file unconditionally

Our reasoning is that using a custom skeleton is highly discouraged,
and people should instead use a rootfs overlay or a post-build script
for their customization.

I don't see why inittab should be handled differently.

I'll mark your patch as Rejected for the time being. If there is some
more arguments on why we should have a special handling of inittab,
then we can rediscuss the patch of course.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
