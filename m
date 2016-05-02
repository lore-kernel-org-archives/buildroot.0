From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Mon, 02 May 2016 10:48:41 +0200
Subject: [Buildroot] [PATCH 3/3] swupdate: bump to version 2016.04
In-Reply-To: <20160501224841.396f3844@free-electrons.com>
References: <1461916620-5170-1-git-send-email-joerg.krause@embedded.rocks>
 <1461916620-5170-4-git-send-email-joerg.krause@embedded.rocks>
 <20160501224841.396f3844@free-electrons.com>
Message-ID: <1462178921.5359.5.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On So, 2016-05-01 at 22:48 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Fri, 29 Apr 2016 09:57:00 +0200, J?rg Krause wrote:
> > Also:
> > ?* Update the .config file and the help text:
> > ????- clarify project name is SWupdate
> 
> This doesn't really belong in the same commit. Also even
> https://github.com/sbabic/swupdate is not really consistent. In just
> three sentences, they use:
> 
> SWupdate - Software Update for Embedded Systems
> 
> SWuPdate is a Linux Update agent with the goal to provide an
> efficient
> and safe way to update an embedded system. SWUpdate supports local...
> 
> So: SWupdate, SWuPdate and SWUpdate. Do we really care?

Not really.

> > ????- U-Boot supports needs now BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV
> 
> Are you sure? Isn't this simply because you made the installation of
> libubootenv conditional on BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV ?

You're right! I haven't seen that?BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV is
only for installation and not for building the fw_printenv tool.

I fix this by using BR2_PACKAGE_UBOOT_TOOLS.

> > ?* Remove comment about bundled lsqlite3, it has been removed.
> > ?* Remove upstream patches:
> > ????- "Kbuild: Fix link error for CONFIG_UBOUT and missing libz"
> > [1]
> > ????- "Kbuild: Link with GCC instead of LD" [2]
> > ?* Add patch from upstream:
> > ????- "Fix build without MTD support" [3]
> > ?* Add optional dependency for libarchive
> > ?* Add optional dependency for uboot-tools
> > ?* Lua support is not restricted to Lua 5.2
> > 
> > [1] https://github.com/sbabic/swupdate/commit/5a5ef5909f5da5b2070d5
> > 8ffaee924bb8e6a51e1
> > [2] https://github.com/sbabic/swupdate/commit/f26577423eb65728fcd10
> > f78f9978dd07d51dcb9
> > [3] https://github.com/sbabic/swupdate/commit/69c0e66994f01ce1bf229
> > 9fbce86aee7a1baa37b
> > 
> > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> 
> > ?	??* Select BR2_PACKAGE_ZLIB if you want to deal with gzip
> > compressed
> > ?	????archives.
> > +	??* Select BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV and
> > BR2_PACKAGE_ZLIB to
> > +	????add support for setting the U-Boot environment.
> 
> But in the .mk file itself you're setting HAVE_LIBUBOOTENV=y as soon
> as
> BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV=y, even if BR2_PACKAGE_ZLIB is
> disabled. Isn't that somewhat inconsistent?

No. It's not about enable U-Boot support, but setting the available
libraries through the environment. With this, swupdates KConfig checks
for?HAVE_LIBUBOOTENV and?HAVE_ZLIB to enable U-Boot support.

Best regards
J?rg Krause
