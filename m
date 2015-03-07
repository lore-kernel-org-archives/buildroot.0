From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 Mar 2015 15:28:52 +0100
Subject: [Buildroot] [PATCH v2 1/1] toolchain: add
 link-time-optimization support
In-Reply-To: <1425645246-3800-1-git-send-email-syntheticpp@gmx.net>
References: <1425645246-3800-1-git-send-email-syntheticpp@gmx.net>
Message-ID: <20150307152852.179340dd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter K?mmel,

On Fri,  6 Mar 2015 13:34:06 +0100, Peter K?mmel wrote:
> Add a new option BR2_GCC_ENABLE_LTO that builds gcc and binutils with LTO support.
> 
> Individual packages still have to enable LTO explicitly by passing '-flto' to
> GCC, which passes it on to the linker. This option does not add that flag
> globally. Some packages detect if the compiler supports LTO and enable the flag
> if it does.
> 
> To support LTO, ar and ranlib must be called with an argument which triggers the
> usage of the LTO plugin. Since GCC doesn't call these tools itself, it instead
> provides wrappers for ar and ranlib that pass the LTO arguments. This way
> existing Makefiles don't need to be changed for LTO support. However, these
> wrappers are called <tuple>-gcc-ar which matches the pattern to link to the
> buildroot wrapper in the external toolchain logic. So the external toolchain
> logic is updated to provide the correct symlink.
> 
> Signed-off-by: Peter K?mmel <syntheticpp@gmx.net>

Thanks, applied, after doing a few changes:

    [Thomas:
      - Add a separate BR2_BINUTILS_ENABLE_LTO option to enable LTO
        support in binutils. This is a blind option, selected by
        BR2_GCC_ENABLE_LTO. It just avoids having binutils.mk poke
        directly into gcc Config.in options.
      - Remove the check on the AVR32 special gcc version, which we don't
        support anymore.
      - Adapt the help text of the LTO Config.in option to no longer
        mention "Since version 4.5", since we only support gcc >= 4.5 in
        Buildroot anyway.
      - Fix typo in toolchain-external.mk comment.]

I did a test build, and I could see the difference in the generated
code between a -flto build a non -flto build of a stupid test
application.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
