From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 17 Oct 2012 23:33:23 +0200
Subject: [Buildroot] [PATCH 0/7] Introduce the _AVAILABLE mechanism
In-Reply-To: <201210161934.53711.yann.morin.1998@free.fr>
References: <1347234052-10527-1-git-send-email-yann.morin.1998@free.fr>
 <20121014193849.019347dd@skate> <507CF328.5090505@mind.be>
 <201210161934.53711.yann.morin.1998@free.fr>
Message-ID: <507F2423.7080909@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/10/12 19:34, Yann E. MORIN wrote:
> The most problematic issue I've encountered is with X11r7. The top-level
> config option is BR2_PACKAGE_XORG7, but it is*not*  a package.

  I don't see what is the problem with that.  USE_WCHAR is also not a package.
Except maybe the name is inconvenient.

> What I would suggest is something like (just out of my tired brain):
>
>      choice
>          prompt "X Window System server type"
>
>      config BR2_PACKAGE_XSERVER_none
>          bool "None"
>
>      config BR2_PACKAGE_XSERVER_xorg  #<-- Note how it currently is lower-case
>          bool "Modular X.org"         #     'xorg' in the repository...
>          depends on BR2_PACKAGE_XSERVER_xorg_AVAILABLE
>          select BR2_HAS_XORG7
>
>      comment 'X.org requires largefile and C++ support'
>          depends on !BR2_PACKAGE_XSERVER_xorg_AVAILABLE
>
>      config BR2_PACKAGE_XSERVER_tinyx  #<-- Ditto lower-case 'tinyx'...
>          bool "TinyX"
>          depends on BR2_PACKAGE_XSERVER_tinyx_AVAILABLE
>          select BR2_HAS_XORG7

  Actually, the XSERVER_tinyx/xorg option is wrongly placed: it should be
a sub-option of BR2_PACKAGE_XSERVER_XORG_SERVER.  The choice has no real
effect unless BR2_PACKAGE_XSERVER_XORG_SERVER is also selected (and all
the xorg-server modules select the xorg-server).  But that's a wholly
different story.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
