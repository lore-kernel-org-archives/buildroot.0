From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Jul 2020 21:54:23 +0200
Subject: [Buildroot] [PATCH] package/openjdk-bin: install to
 host/usr/lib/jvm
In-Reply-To: <20200617215520.3600744-1-aduskett@gmail.com> (aduskett's message
 of "Wed, 17 Jun 2020 14:55:20 -0700")
References: <20200617215520.3600744-1-aduskett@gmail.com>
Message-ID: <87r1tcy2og.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "aduskett" == aduskett  <aduskett@gmail.com> writes:

 > From: Adam Duskett <Aduskett@gmail.com>
 > Buildroot currently installs openjdk-bin to $(HOST_DIR)/ instead of the more
 > traditional (for java installations) $(HOST_DIR)/usr/lib/jvm.

 > As described in https://bugs.busybox.net/show_bug.cgi?id=13001

 > "Openjdk-bin provides it's own libfreetype.so and places it into
 > $(HOST_DIR)/lib/. This library causes build failures with the
 > host-xapp_mkfontscale package due to the overwritten libfreetype.so.

 > mkfontscale.o: In function `doDirectory':
 > mkfontscale.c:(.text+0x1a80): undefined reference to `FT_Get_BDF_Property'
 > collect2: error: ld returned 1 exit status

 > Reproducing the error is done by repeating the following steps.
 > make host-freetype
 > make host-openjdk-bin
 > make host-xapp_mkfontscale"

 > There are two options for fixing this problem:

 > 1) Add host-freetype and host-lksctp-tools as dependencies to host-openjdk-bin
 >    and then remove the provided libfreetype.so and libsctp.so libraries in a
 >    post_extract_hook.

 > 2) Change the installation directory from $(HOST_DIR)/ to
 >    $(HOST_DIR)/usr/lib/jvm just like the target OpenJDK package and copy the
 >    entire source directories contents to the above location.

 > The second option provides the following advantages:
 >  - The directory structure is consistent with how we handle the target OpenJDK.

 >  - The HOST_OPENJDK_BIN_INSTALL_CMDS step is simplified.

 >  - Packages such as Maven require directories of which we are currently not
 >    copying. These missing directories cause programs such as Maven to crash
 >    when running with an error such as
 >    "Can't read cryptographic policy directory: unlimited."

 > Because the second option is both simple, easier to implement, is low-impact,
 > and fixes the problems described above wholly, it is the best to implement.

 > To implement the above changes, we must also modify the following files in the
 > same patch to match the host's new directory paths:

 >  - openjdk.mk
 >  - openjdk-jni-test.mk
 >  - openjdk-hello-world.mk

 > Tested with:
 > ./support/testing/run-tests -o out -d dl tests.package.test_openjdk.TestOpenJdk

 > Fixes: https://bugs.busybox.net/show_bug.cgi?id=13001

 > Signed-off-by: Adam Duskett <Aduskett@gmail.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
