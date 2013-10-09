From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 09 Oct 2013 12:46:08 +0200
Subject: [Buildroot] [PATCHv3 04/20] toolchain: introduce a virtual
	package
In-Reply-To: <1381256237-27948-5-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 8 Oct 2013 20:17:01 +0200")
References: <1381256237-27948-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1381256237-27948-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87ob6y4t8v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> This commit introduces a virtual package called 'toolchain', located
 Thomas> in 'toolchain/toolchain', which simply depends on
 Thomas> 'toolchain-buildroot' or 'toolchain-external' depending on the
 Thomas> selected toolchain backend.

[snip]

 Thomas> @@ -317,11 +313,8 @@ include support/dependencies/dependencies.mk
 Thomas>  # We also need the various per-package makefiles, which also add
 Thomas>  # each selected package to TARGETS if that package was selected
 Thomas>  # in the .config file.
 Thomas> -ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 Thomas> -include toolchain/toolchain-buildroot.mk
 Thomas> -else ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
 Thomas> -include toolchain/toolchain-external.mk
 Thomas> -endif
 Thomas> +include toolchain/helpers.mk
 Thomas> +include toolchain/*/*.mk

That's no good. toolchain/*/*.mk doesn't pick up up
toolchain/toolchain-{buildroot,external}.mk:

>>> toolchain undefined Extracting
>>> toolchain undefined Patching toolchain//toolchain
make: *** No rule to make target `toolchain-buildroot', needed by `toolchain-depends'.  Stop.

Did you mean to simply do 'include toolchain/*.mk' instead of those two lines?

-- 
Bye, Peter Korsgaard
