From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Thu, 4 Sep 2008 06:02:27 +0200
Subject: [Buildroot] Makefile.autotools.in stamp files breaks
	multipleprojects
References: <20080904025034.GA18148@cloud.net.au>
Message-ID: <1D28C7EE66C2440FB30AEE54DA90C54B@aeglos>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> As previously discussed, Makefile.autotools.in creates stamp files in
> $(BUILD_DIR)/$(PKG) such as .stamp_installed. This will prevent the
> package being properly installed into multiple projects built out of the
> same source tree. (The first project will build ok but subsequent
> projects won't install the files.)
>
> I see a few solutions;
>
> 1. Each autotools-using package could (optionally?) specify the name of
> a test target file to use, instead of using an explicit stamp file.
> Hans-Christian sent a patch for this already.
>

That seems to be a good solution, except that if the build breaks after
that file has been installed, other neccessary files might not be copied.
You have to ensure that this is the last file that gets installed by the 
package build.
Even if this happens, then it could break if the package version gets 
updated
and the install order changes.

> Obseleting (some or all of) the stamp files wouldn't be bad anyway. Many
> of them could be replaced with actual targets, eg Makefile depends on
> running configure (rather than using .stamp_configured).
>
> 2. The .stamp_install files could be put somewhere under $(TARGET_DIR)
> instead of $(BUILD_DIR); they'd need to be stripped out by the various
> generators in target/.. though.

You can install the stamps in "project_build_<arch>/<project>/.stamps"
as long as the make clean stuff cleans that up as well.

Populating the target file system with stamps is not a good idea.

> 3. Sharing $(BUILD_DIR) between multiple projects should be scrapped. In
> practice, redefining BUILD_DIR = $(PROJECT_BUILD_DIR) would do it.

Packages which can be configured by buildroot should remain in $(BUILD_DIR)
while packages that can be configured should be in $(PROJECT_BUILD_DIR).
Until this happens you should not have projects with different options or
use a separate buildroot tree.

You can have projects which have totally different set of packages.

>
> I think sharing $(BUILD_DIR) between multiple projects is quite broken.
> The only benefit is that the packages only need to be compiled once.

Which is a significant time saving, if you have to build multiple projects.

> As a negative though, we've got packages not being installed
> properly due to stamp files (the problem above).

That is a bug which was introduced by the Makefile.autotools.in, so this 
file needs to be fixed.

> - different projects might be using different compilers or different
>  compiler flags, and the right ones won't be used for each project.
> - same for different kernel headers potentially.

If you want different options for the toolchain, you need to use a separate 
buildroot tree.

> - We've already got exceptions for packages which can be customised,
>  like busybox and the kernel.
>
>
> Hamish
> -- 


Best Regards
Ulf Samuelsson                ulf at atmel.com
Atmel Nordic AB
Mail:  Box 2033, 174 02 Sundbyberg, Sweden
Visit:  Kavalleriv?gen 24, 174 58 Sundbyberg, Sweden
Phone +46 (8) 441 54 22     Fax +46 (8) 441 54 29
GSM    +46 (706) 22 44 57


Technical support when I am not available:
AT90 AVR Applications Group: mailto:avr at atmel.com
AT91 ARM Applications Group: mailto:at91support at atmel.com
AVR32 Applications Group        mailto:avr32 at atmel.com
http://www.avrfreaks.net/;            http://avr32linux.org/
http://www.at91.com/ ;                 http://www.linux4sam.org/ 
