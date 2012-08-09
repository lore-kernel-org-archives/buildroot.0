From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Aug 2012 10:41:55 +0200
Subject: [Buildroot] [PATCH] buildroot: Makefile: Allow target board
 makefile fill in default target_skeleton path.
In-Reply-To: <1344409039-32071-1-git-send-email-sonic.adi@gmail.com>
References: <1344409039-32071-1-git-send-email-sonic.adi@gmail.com>
Message-ID: <20120809104155.563af2a2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 8 Aug 2012 14:57:19 +0800,
Sonic Zhang <sonic.adi@gmail.com> a ?crit :

> If the target skeleton path is empty in config, don't change variable
> TARGET_SKELETON in buildroot Makefile. Allow the target board makefile
> fill in a default path.

The concept of "target board makefile" does not exist. It used to exist
in earlier versions of Buildroot, but it no longer exists in newer
versions. Thus, I have the feeling that rather than fixing this, it is
the way your boards are supported that should be modified according to
the newer Buildroot good practices.

The practices in terms of board support are:

 * One defconfig file per board in configs/, generally named
   <vendor>_<boardname>_defconfig. Those files must be generated with
   'make savedefconfig'

 * Utility files (kernel patches, kernel configuration files and other
   stuff), should be stored in board/<vendor>/<boardname>/. Kernel
   configuration files must be generated with 'make savedefconfig' as
   well.

 * Using a different skeleton from the default one provided by
   Buildroot is really *not* recommended. Instead, if anything needs to
   be tweaked in the filesystem, use the post-build script for that
   effect. This allows to avoid duplicating the skeleton for each and
   every board, causing a maintenance nightmare when we want to change
   something in this skeleton.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
