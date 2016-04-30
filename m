From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Apr 2016 18:48:38 +0200
Subject: [Buildroot] [RFC PATCH v2 1/2] toolchain/helper: check for
 symlink from lib to lib64
In-Reply-To: <1451485816-17554-1-git-send-email-romain.naour@gmail.com>
References: <1451485816-17554-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160430184838.70ee582a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 30 Dec 2015 15:30:15 +0100, Romain Naour wrote:
> Buildroot picks up libc/lib64 and all its contents, but does not
> pickup libc/lib to populate the staging and target directories.
> 
> With the CodeSourcery AArch64 2014.05 toolchain the extracted sources
> contains a single symlink in the aarch64-linux-gnu/libc/lib directory
> which is lost during Buildroot staging import.
> 
> aarch64-linux-gnu/libc/lib/ld-linux-aarch64.so.1 -> ../lib64/ld-2.18.so
> 
> So, if we use a 64 bits toolchain we also look at "lib" directory to
> see if there are some symlink to libraries belonging to "lib64".
> If yes, we create the corresponding symlink in STAGING_DIR in
> copy_toolchain_sysroot()
> 
> The same kind of change should be done in copy_toolchain_lib_root()
> to copy the dynamic loader.
> In the common case, we expect that it match this pattern: ld*.so.*
> But it's not the case here because the symlink to the dynamic loader
> is in another directory (lib) and we are looking for it in (lib64).
> So the LIB_EXTERNAL_LIBS += ld*.so.* doesn't match any library during
> the copy to TARGET_DIR.
> That's why the system doesn't boot at runtime.
> 
> If the path to the dynamic loader is found in lib directory, it's
> appended to LIBSPATH.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

In the end, I found this solution to be really complicated, just to
solve the use case of one specific toolchain. So instead, I've applied
your original fix which is just a one line tweak only for the
CodeSourcery AArch64 toolchain. If we see more toolchains with the same
issue, we will revisit this.

See:

  https://git.busybox.net/buildroot/commit/?id=4d39ca1c2ab19766abf0430abe9b65ba0e16602b

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
