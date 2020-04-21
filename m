From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Tue, 21 Apr 2020 12:12:32 -0500
Subject: [Buildroot] [PATCH v2 1/3] package/openjdk: fix installation
 with merged usr directories
In-Reply-To: <20200418190701.2629613-1-aduskett@gmail.com>
References: <20200418190701.2629613-1-aduskett@gmail.com>
Message-ID: <CAMQcK5LLcoXUV2LBN9Kyupj-cKQ+y_P_meTPNbM1HMaOGdcAhw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam/All,

On Sat, Apr 18, 2020 at 2:12 PM <aduskett@gmail.com> wrote:
>
> From: Adam Duskett <Aduskett@gmail.com>
>
> Currently, Buildroot installs the jre libraries using
> cp -dprf /build/linux-*-release/images/jre/lib/* $(TARGET_DIR)/usr/lib/
>
> However, if a system has a merged /usr directory, and there is a built kernel
> before installing OpenJDK, the installation fails because jre/lib has binary
> modules file, which causes the following error: cp: cannot overwrite directory
> '/usr/lib/modules with non-directory
>
> The obvious fix is to install the modules to /usr/lib/jvm/ and set the
> appropriate rpaths via the --with-extra-ldflags conf option. However, this fix
> does not work because the built binaries themselves do not link against
> libjava.so
>
> Indeed, running readelf on the built java binary reports the following:
> "(RUNPATH) Library runpath: [/usr/lib/jvm]" and /usr/lib/jvm/libjava.so exists.
> However, when running the Java binary on the target, the following error
> occurs: "Error: could not find libjava.so."
>
> The following is the result of "strace java" ran on the target:
> faccessat(AT_FDCWD, "/usr/lib/libjava.so", F_OK) = -1 ENOENT
> faccessat(AT_FDCWD, "/usr/jre/lib/libjava.so", F_OK) = -1 ENOENT
> newfstatat(AT_FDCWD, "/usr/lib/libjava.so", 0x7ffe7b4af8, 0) = -1 ENOENT
> newfstatat(AT_FDCWD, "/usr/lib/jvm/libjli.so", [sic] AT_SYMLINK_NOFOLLOW) = 0
>
> As seen above, the java binary searches for libjli.so in /usr/lib/jvm,
> but libjava.so has the search paths hardcoded to the following directories:
>   - /usr/lib/
>   - /usr/jre/lib/
>   - $(dirname $0)/../lib/
>
> The reason behind the hardcoded paths given by the maintainers is due to
> historical purposes for the need to support several java versions at the
> same time on a single system, and that changing the above behavior is not
> likely to ever happen.
>
> As such, most distributions such as Redhat do the following:
>   - Create the directory /usr/lib/jvm/java-$(JAVA_VERSION)/
>   - Install all directories and files found in images/jre to that directory.
>   - Symlink the binaries to in /usr/lib/jvm/java-$(JAVA_VERSION)/bin to
>     /usr/bin.
>
> However, because Buildroot does not need to support multiple versions of java
> concurrently, there is no need for the additional java-$(JAVA_VERSION)
> directory.
>
> To fix the above issue, the following changes are performed:
>   - Introduce the variable "OPENJDK_INSTALL_BASE" which points to /usr/lib/jvm
>   - Set the --with-extra-ldflags conf_opt to
>       "-Wl,-rpath,$(OPENJDK_INSTALL_BASE)/lib,-rpath,
>       $(OPENJDK_INSTALL_BASE)/lib/$(OPENJDK_JVM_VARIANT)"
>   - Run "mkdir -p $(TARGET_DIR)/usr/lib/jvm/" in the INSTALL_TARGET_CMDS step.
>   - Copy both the lib and bin directories to /usr/lib/jvm/
>   - Symlink the binaries in /usr/lib/jvm/bin/ to /usr/bin.
>
> Fixes: https://bugs.busybox.net/show_bug.cgi?id=12751
>
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
> Changes v1 -> v2:
>   - Fixed comments in openjdk.mk (Yann)
>   - Added spaces around the = sign for OPENJDK_INSTALL_BASE (Yann)
>   - Added trailing /'s for copying (Yann)
>   - Added a more complete commit message.
>
>  package/openjdk/openjdk.mk | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)

Reviewed-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Tested-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>

Built and runtime tested on x86-64 platform.

Thanks,
-Ryan

---
Ryan Barnett | Sr Systems Engineer | Commercial Avionics
COLLINS AEROSPACE
400 Collins Rd NE, Cedar Rapids, IA 52498 USA
ryan.barnett at collins.com | collinsaerospace.com

CONFIDENTIALITY WARNING: This message may contain proprietary and/or
privileged information of Collins Aerospace and its affiliated
companies. If you are not the intended recipient, please 1) Do not
disclose, copy, distribute or use this message or its contents. 2)
Advise the sender by return email. 3) Delete all copies (including all
attachments) from your computer. Your cooperation is greatly
appreciated.
