From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Jul 2018 23:25:31 +0200
Subject: [Buildroot] [PATCH 3/3] sbsigntools: new package
In-Reply-To: <1530887774-19479-4-git-send-email-celso.neto.cwi@datacom.com.br>
 (Celso Varella's message of "Fri, 6 Jul 2018 11:36:14 -0300")
References: <1530887774-19479-1-git-send-email-celso.neto.cwi@datacom.com.br>
 <1530887774-19479-4-git-send-email-celso.neto.cwi@datacom.com.br>
Message-ID: <87a7qpk110.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Celso" == Celso Varella <celso.neto.cwi@datacom.com.br> writes:

 > Linux user-space utility for signing and verifying files for UEFI Secure
 > Boot.

 > The recipe is a bit complicated because sbsigntools requires a specific
 > version of CCAN (see https://github.com/rustyrussell/ccan/) and uses a
 > script to download, configure and build it. We must patch configure.ac,
 > Makefile.am and the ccan Makefile to remove hard-coded paths and git
 > invocations.

Does the script (I take it that you are referring to
lib/ccan.git/tools/create-ccan-tree) really download anything? To me it
just looks like it copies a number of files from lib/ccan.git to
lib/ccan?

As this package comes from git and it already has submodule pointing to
the specific version of ccan, perhaps the easiest solution is to get it
from git and set SBSIGNTOOL_GIT_SUBMODULES = YES to also fetch the
submodule?

 > We must also apply two patches already sent to the maintainer by email

 > - Fix an automake warning that source file 'ccan/time/time.c' is in a
 >   subdirectory but option 'subdir-objects' is disabled.
 > - Improve error handling and prevent a memory leak in an internal
 >   function.

While certainly nice, these doesn't sound like something really
critical as sbsign isn't a long running program.

 > +################################################################################
 > +#
 > +# sbsigntools
 > +#
 > +################################################################################
 > +
 > +SBSIGNTOOLS_VERSION = 0.9.1
 > +SBSIGNTOOLS_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/jejb/sbsigntools.git/snapshot
 > +SBSIGNTOOLS_LICENSE = GPL-3.0+
 > +SBSIGNTOOLS_LICENSE_FILES = COPYING \
 > +	lib/ccan.git/licenses/BSD-3CLAUSE \
 > +	lib/ccan.git/licenses/BSD-MIT \
 > +	lib/ccan.git/licenses/GPL-2 \
 > +	lib/ccan.git/licenses/GPL-3 \
 > +	lib/ccan.git/licenses/LGPL-2.1 \
 > +	lib/ccan.git/licenses/LGPL-3
 > +SBSIGNTOOLS_AUTORECONF = YES
 > +
 > +SBSIGNTOOLS_DEPENDENCIES = host-pkgconf binutils gnu-efi openssl util-linux
 > +SBSIGNTOOLS_CFLAGS = \
 > +	-I$(BINUTILS_DIR)/bfd \
 > +	-I$(BINUTILS_DIR)/include \
 > +	 $(TARGET_CFLAGS)

Hmm, looking directly in the files of binutils isn't really
nice. Doesn't the binutils package install these under
$STAGING_DIR/usr/include? If not, shouldn't it?

 > +SBSIGNTOOLS_EFI_CPPFLAGS = -I$(HOST_DIR)/include/efi \
 > +	-I$(HOST_DIR)/include/efi/$(HOST_GNU_EFI_PLATFORM)

Hmm, why would a target package need to look at host includes? This
variable doesn't seem to be used anywhere?

 > +define SBSIGNTOOLS_FIX_EFI_CPPFLAGS
 > +	$(SED) 's|^EFI_ARCH=.*|EFI_ARCH=$(GNU_EFI_PLATFORM)|;\
 > +		s|/usr/include/efi|$(STAGING_DIR)/usr/include/efi|g' \
 > +		$(@D)/configure.ac
 > +endef
 > +define HOST_SBSIGNTOOLS_FIX_EFI_CPPFLAGS
 > +	$(SED) 's|^EFI_ARCH=.*|EFI_ARCH=$(HOST_GNU_EFI_PLATFORM)|;\
 > +		s|/usr/include/efi|$(HOST_DIR)/include/efi|g' \
 > +		$(@D)/configure.ac
 > +endef
 > +SBSIGNTOOLS_POST_EXTRACT_HOOKS += SBSIGNTOOLS_POST_EXTRACT SBSIGNTOOLS_FIX_EFI_CPPFLAGS
 > +HOST_SBSIGNTOOLS_POST_EXTRACT_HOOKS += SBSIGNTOOLS_POST_EXTRACT HOST_SBSIGNTOOLS_FIX_EFI_CPPFLAGS

As we already autoreconf this package it would be great if we could
create upstreamable patches add configure options for EFI_ARCH and the
efi includes.

-- 
Bye, Peter Korsgaard
