From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 7 Mar 2013 12:14:30 +0100
Subject: [Buildroot] [uclinux-dist-devel] [Announcement] The 2012R2
 buildroot Linux release for Blackfin
In-Reply-To: <DB904C5425BA6F4E8424B3B51A1414D173FF40BA46@NWD2CMBX1.ad.analog.com>
References: <DB904C5425BA6F4E8424B3B51A1414D173F6FB6E58@NWD2CMBX1.ad.analog.com>
 <20130307095939.1316014e@skate>
 <DB904C5425BA6F4E8424B3B51A1414D173FF40BA46@NWD2CMBX1.ad.analog.com>
Message-ID: <20130307121430.2780392a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Zhang, Sonic,

On Thu, 7 Mar 2013 05:40:26 -0500, Zhang, Sonic wrote:

> >Could we find a way of getting your changes upstream, so that your
> >Buildroot is closer to the upstream version?
> 
> I sent some initial Blackfin supporting patches against 2012.08
> upstream release to the buildroot mailing list last Aug. But, I got
> no response.

This is not true. You got some response precisely from me:

 http://lists.busybox.net/pipermail/buildroot/2012-August/057117.html
 http://lists.busybox.net/pipermail/buildroot/2012-August/057116.html
 http://lists.busybox.net/pipermail/buildroot/2012-August/057118.html
 http://lists.busybox.net/pipermail/buildroot/2012-August/057157.html
 http://lists.busybox.net/pipermail/buildroot/2012-August/057471.html
 http://lists.busybox.net/pipermail/buildroot/2012-August/057253.html
 http://lists.busybox.net/pipermail/buildroot/2012-August/057448.html
 http://lists.busybox.net/pipermail/buildroot/2012-August/057254.html
 http://lists.busybox.net/pipermail/buildroot/2012-August/057255.html
 http://lists.busybox.net/pipermail/buildroot/2012-August/057256.html
 http://lists.busybox.net/pipermail/buildroot/2012-August/057252.html
 http://lists.busybox.net/pipermail/buildroot/2012-August/057172.html

For sure, some of your patches regarding override source directory
didn't get any response. I'm currently working on the out-of-tree
support to build packages, which should solve the original problem you
reported.

> So, we can't sent more patches on top. I may sent out
> these patches against for comments after we update to your 2013.02
> release.

Great.

The thing is that your patches didn't take into account that there is a
life beyond Blackfin in Buildroot. While in your own fork you can do a
Blackfin-specific hack, we have to make it generic and maintainable in
Buildroot upstream.

Also, you started with the most complicated patches (such as patches
making modifications to the core infrastructure). I would suggest to
first start to upstream all the fixes you did to get the different
packages build on non-MMU platforms. However, even here, we might ask
you to make some changes compared to your patches. For example,
http://blackfin.uclinux.org/git/?p=buildroot;a=blob;f=package/libglib2/libglib2-nommu.patch;h=3979aa79195cf28876a45e7ed7c884bfaeadb5ad;hb=HEAD
isn't acceptable, because the __NOMMU__ is something that has been
invented specifically in your Buildroot fork.

The right way of handling this specific patch is to add a configure.ac
check for the fork() function, which will define HAVE_FORK if fork() is
available, and then we can use HAVE_FORK in the glib code. This way,
the patch has a chance of getting merged upstream.

> >The Wiki page then describes a number of Config.in files, as if
> >modifying them was necessary to change the configuration. This is
> >obviously completely wrong: users should change the configuration
> >using 'make menuconfig', 'make xconfig, 'make gconfig', and
> >certainly not by editing Config.in files, whose purpose is to
> >*describe* configuration options, not to *define* the value of
> >configuration options.
> 
> The explanation to these Config.in files are aimed to give developers
> a basic concept on how the configure options are generated. Yes,
> developers should only use the make xxxconfig command to change any
> option.

I still find the entire wording still very confusing. "When done, the
saved selections will be written to .config and autoconf.h." This is
not true: only .config is important here, autoconf.h is just generated
from it.

Also, "Default buildroot settings are passed to make as a text file
configs/xxxxx_defconfig." This doesn't mean anything. The
configs/xxxx_defconfig files are minimal defconfig describing a
particular configuration, that one can use as a sample to start a new
configuration:

	make <foobar>_defconfig
	make menuconfig
	make

BTW, the title of the section is still "GNU configure Overview",
which is wrong.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
