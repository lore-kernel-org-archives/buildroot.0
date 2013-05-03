From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 May 2013 20:46:56 +0200
Subject: [Buildroot] [PATCH v6 6/7] arch: toolchain: Install blackfin
 FDPIC and FLAT libraries in external toolchain makefile.
In-Reply-To: <CAJxxZ0NC2O2D5m4COx-r=-cT_TJoyGkXRxqNYXt-=7ze5+xcmg@mail.gmail.com>
References: <1366279592-9055-1-git-send-email-sonic.adi@gmail.com>
 <1366279592-9055-6-git-send-email-sonic.adi@gmail.com>
 <CAJxxZ0M4jZccZF3i3OM8-B7bWT1NzEXf62qsKEg4-wfAJqjnJA@mail.gmail.com>
 <20130502120120.5fd9b4e0@skate>
 <CAJxxZ0NC2O2D5m4COx-r=-cT_TJoyGkXRxqNYXt-=7ze5+xcmg@mail.gmail.com>
Message-ID: <20130503204656.23563490@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sonic Zhang,

On Thu, 2 May 2013 18:11:40 +0800, Sonic Zhang wrote:

> > Wasn't my suggestion:
> >
> > config BR2_BFIN_INSTALL_FLAT_SHARED
> >         bool "Install FLAT shared libraries" if !BR2_BINFMT_FLAT_SHARED
> >         depends on BR2_bfin
> >         default y if BR2_BINFMT_FLAT_SHARED
> >
> > So: option enabled by default when BR2_BINFMT_FLAT_SHARED, and the
> > prompt is shown to optionally enable/disable it when
> > BR2_BINFMT_FLAT_SHARED is not selected.
> 
> In this way, the developer can disable the option
> BR2_BFIN_INSTALL_FLAT_SHARED in share flat binary mode. This is
> incorrect. My solution ensures the developer have no way to disable
> BR2_BFIN_INSTALL_FLAT_SHARED when BR2_BINFMT_FLAT_SHARED is selected.

This is what my proposed code is doing. I've just tested it on a small
example:

config BR2_OPTIONA
	bool "optionA"

config BR2_OPTIONB
	bool "optionB" if !BR2_OPTIONA
	default y if BR2_OPTIONA

With the following results:

 * If the user selects option A, then the possibility of choosing the
   value for option B disappears, and option B is forcefully enabled.

 * If the user doesn't select option A, then he is free to select or
   not select option B.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
