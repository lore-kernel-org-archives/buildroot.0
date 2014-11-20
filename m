From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Nov 2014 11:25:11 +0100
Subject: [Buildroot] [PATCH] arch/Config.in: Drop unused BR2_BINFMT_ELF
In-Reply-To: <da642e089b9c4f19e755d4ef1f3b7477ac7a7201.1416476239.git.baruch@tkos.co.il>
References: <da642e089b9c4f19e755d4ef1f3b7477ac7a7201.1416476239.git.baruch@tkos.co.il>
Message-ID: <20141120112511.38477b25@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Thu, 20 Nov 2014 11:37:19 +0200, Baruch Siach wrote:
> The BR2_BINFMT_ELF symbol (introduced in commit 57133825c930) can't possibly
> be selected because it depends on (!BR2_bfin && !BR2_m68k), while the
> surrounding choice depends on (BR2_bfin || BR2_m68k). This symbol is never
> used.
> 
> Cc: Sonic Zhang <sonic.zhang@analog.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  arch/Config.in | 8 --------
>  1 file changed, 8 deletions(-)

Well, it's true that it's never selected today. However, it can be
useful in a number of situations, with some changes: better support for
static/shared library selection, support for ARM noMMU, etc. For
example, I have one commit in one of my branches that does this:

commit f31d45345e3e260b2942324e43b0a366ec279007
Author: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date:   Sat Sep 21 07:31:07 2013 +0200

    arch: ensure BR2_BINFMT_ELF is really used
    
    Currently, the binary format choice is only shown for the Blackfin and
    m68k architectures, since we assume that all other architectures are
    using the ELF binary format. However, due to this, the BR2_BINFMT_ELF
    symbol is in fact not set to 'y' for those architectures that use the
    ELF format.
    
    This will be causing problems for the refactoring of the static/shared
    library support, as we will need to know if the binary format supports
    shared libraries or not.
    
    Therefore, it moves out the BR2_BINFMT_ELF option outside of the
    choice, ensures it is enabled on all architectures but Blackfin and
    m68k, and turns the option within the choice into
    BR2_BINFMT_ELF_CHOICE (but in fact this option can never be seen at
    the moment, since it depends on !blackfin && !m68k, but the choice it
    self depends on blackfin || m68k).
    
    Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

diff --git a/arch/Config.in b/arch/Config.in
index 204b543..0a4d36d 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -225,15 +225,20 @@ config BR2_GCC_TARGET_FLOAT_ABI
 config BR2_GCC_TARGET_MODE
        string
 
+config BR2_BINFMT_ELF
+       bool
+       default y if !BR2_bfin && !BR2_m68k
+
 # Set up target binary format
 choice
        prompt "Target Binary Format"
        depends on BR2_bfin || BR2_m68k
        default BR2_BINFMT_FDPIC
 
-config BR2_BINFMT_ELF
+config BR2_BINFMT_ELF_CHOICE
        bool "ELF"
        depends on !BR2_bfin && !BR2_m68k
+       select BR2_BINFMT_ELF
        help
          ELF (Executable and Linkable Format) is a format for libraries and
          executables used across different architectures and operating

However, I'm fine with BR2_BINFMT_ELF being removed for now, and
re-added later when actually needed.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
