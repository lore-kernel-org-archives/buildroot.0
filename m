From: Hamish Moffatt <hamish@cloud.net.au>
Date: Thu, 4 Sep 2008 12:50:35 +1000
Subject: [Buildroot] Makefile.autotools.in stamp files breaks multiple
	projects
Message-ID: <20080904025034.GA18148@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As previously discussed, Makefile.autotools.in creates stamp files in
$(BUILD_DIR)/$(PKG) such as .stamp_installed. This will prevent the
package being properly installed into multiple projects built out of the
same source tree. (The first project will build ok but subsequent
projects won't install the files.)

I see a few solutions;

1. Each autotools-using package could (optionally?) specify the name of
a test target file to use, instead of using an explicit stamp file.
Hans-Christian sent a patch for this already.

Obseleting (some or all of) the stamp files wouldn't be bad anyway. Many
of them could be replaced with actual targets, eg Makefile depends on
running configure (rather than using .stamp_configured).

2. The .stamp_install files could be put somewhere under $(TARGET_DIR)
instead of $(BUILD_DIR); they'd need to be stripped out by the various
generators in target/.. though.

3. Sharing $(BUILD_DIR) between multiple projects should be scrapped. In
practice, redefining BUILD_DIR = $(PROJECT_BUILD_DIR) would do it.


I think sharing $(BUILD_DIR) between multiple projects is quite broken.
The only benefit is that the packages only need to be compiled once. As
a negative though, we've got
- packages not being installed properly due to stamp files (the problem
  above).
- different projects might be using different compilers or different
  compiler flags, and the right ones won't be used for each project.
- same for different kernel headers potentially.
- We've already got exceptions for packages which can be customised,
  like busybox and the kernel.


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
