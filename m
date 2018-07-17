From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Jul 2018 22:32:18 +0200
Subject: [Buildroot] [PATCH 1/3] efitools: new package
In-Reply-To: <1530887774-19479-2-git-send-email-celso.neto.cwi@datacom.com.br>
 (Celso Varella's message of "Fri, 6 Jul 2018 11:36:12 -0300")
References: <1530887774-19479-1-git-send-email-celso.neto.cwi@datacom.com.br>
 <1530887774-19479-2-git-send-email-celso.neto.cwi@datacom.com.br>
Message-ID: <87efg1k3hp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Celso" == Celso Varella <celso.neto.cwi@datacom.com.br> writes:

 > Linux user-space application to manipulate UEFI signatures database
 > Patches 1 and 2 remove dependencies from sbsigntools and perl scripts

These patches are not very nice, as they don't look upstreamable and are
likely to cause conflicts every time this package is bumped. Can you
explain why exactly they are needed? Your series already add a
sbsigntools package, so why would we need to drop the dependency?
host-perl is similary available.

Looking at the code, the sbsigntools dependency seems to be for the
*-signed.efi files that gets signed by a just created key. That indeed
might not be useful for real use cases, but presumably we can just pass
EFISIGNED= to make to drop that?


 > Patch 3 remove "-l" option from mount command in lib/kernel_efivars.c
 > for compatibility with Busybox mount command

Did you try to submit this upstream? What is the -l option used for in
this context? E.G. what are we missing from not using it for builds with
util-linux mount?

 > +################################################################################
 > +#
 > +# efitools
 > +#
 > +################################################################################
 > +
 > +EFITOOLS_VERSION = 1.8.1
 > +EFITOOLS_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/jejb/efitools.git/snapshot
 > +EFITOOLS_LICENSE = GPL-2.0+
 > +EFITOOLS_LICENSE_FILES = COPYING
 > +EFITOOLS_DEPENDENCIES = gnu-efi openssl
 > +
 > +define EFITOOLS_BUILD_CMDS
 > +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)

The Makefile does different things depending on ARCH (which comes from
uname -m). This naturally doesn't work in a cross compilation setup, so
we need to pass ARCH=<value> depending on the target architecture (and
add the needed dependencies to the package so it can only be built for
those supported architectures).

-- 
Bye, Peter Korsgaard
