From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 08 May 2020 09:22:06 +0200
Subject: [Buildroot] [PATCH/2020.02.x 1/1] package/openjdk: fix
 installation with merged usr directories
In-Reply-To: <20200417232944.3762457-1-aduskett@gmail.com> (aduskett's message
 of "Fri, 17 Apr 2020 16:29:44 -0700")
References: <20200417232944.3762457-1-aduskett@gmail.com>
Message-ID: <87d07euc0x.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "aduskett" == aduskett  <aduskett@gmail.com> writes:

 > From: Adam Duskett <Aduskett@gmail.com>
 > Currently, Buildroot installs the jre libraries using
 > cp -dprf /build/linux-*-release/images/jre/lib/* $(TARGET_DIR)/usr/lib/

 > However, if a system has a merged /usr directory, and there is a
 > built kernel before installing OpenJDK, the installation fails because
 > jre/lib has binary modules file, which causes the following error:
 > cp: cannot overwrite directory '/usr/lib/modules with non-directory

 > The obvious fix is to install the modules to /usr/lib/jvm/ and set the
 > appropriate rpaths via the --with-extra-ldflags conf option. However, this fix
 > does not work because the binaries themselves do not link against libjava.so
 > and instead search for libjava.so with hardcoded paths in the following
 > directories:
 >   - /usr/lib
 >   - /usr/jre/lib
 >   - $(dirname $0)/../lib

 > As such, most distributions such as Redhat create the directory
 > /usr/lib/jvm/java-$(JAVA_VERSION)/ and install all directories and files
 > found in images/jre to that directory, and then symlink the binaries to
 > /usr/bin.

 > However, because Buildroot does not need to support multiple versions of java
 > concurrently, there is no need for the java-$(JAVA_VERSION) directory.

 > To fix the above error, perform the following changes:
 >   - Introduce the variable "OPENJDK_INSTALL_BASE" which points to usr/lib/jvm
 >   - Set the --with-extra-ldflags conf_opt to
 >       "-Wl,-rpath,/$(OPENJDK_INSTALL_BASE)/lib,-rpath,
 >       /$(OPENJDK_INSTALL_BASE)/lib/$(OPENJDK_JVM_VARIANT)"
 >   - Run "mkdir -p $(TARGET_DIR)/usr/lib/jvm" in the INSTALL_TARGET_CMDS step.
 >   - Copy both the lib and bin directories to /usr/lib/jvm/
 >   - Symlink the binaries in /usr/lib/jvm/bin/ to /usr/bin.

 > Fixes: https://bugs.busybox.net/show_bug.cgi?id=12751

 > Signed-off-by: Adam Duskett <Aduskett@gmail.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
