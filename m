From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 10 Aug 2018 22:58:55 +0200
Subject: [Buildroot] [PATCH 5/6] package/checksec: new package
In-Reply-To: <20180711143113.11927-6-matthew.weber@rockwellcollins.com>
References: <20180711143113.11927-1-matthew.weber@rockwellcollins.com>
 <20180711143113.11927-6-matthew.weber@rockwellcollins.com>
Message-ID: <20180810225855.4cb005dc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Matt, Paresh,

On Wed, 11 Jul 2018 09:31:12 -0500, Matt Weber wrote:
> From: Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>
> 
> This patch added host-checksec package support. This tool

added -> adds

> diff --git a/package/checksec/0001-checksec-Fixed-issue-with-relative-path.patch b/package/checksec/0001-checksec-Fixed-issue-with-relative-path.patch
> new file mode 100644
> index 0000000000..43a882d991
> --- /dev/null
> +++ b/package/checksec/0001-checksec-Fixed-issue-with-relative-path.patch
> @@ -0,0 +1,43 @@
> +From b48a2dfae26fa3b4af8e65fb5953b3caf62c137b Mon Sep 17 00:00:00 2001
> +From: Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>
> +Date: Mon, 21 May 2018 14:34:23 -0500
> +Subject: [PATCH] checksec: Fixed issue with relative path
> +
> +Before this patch script was not able find exists directory when user pass
> +relative directory path with '--dir' or '-d' option and also we faced this error
> +when we execute script with relative path.

The english wording seems weird here, even though I'm not a native
speaker. Perhaps:

"""
Before this patch, the checksec script was not able to find existing
directories when the user passes a relative path with --dir/-d,
aborting with a "No such file or directory". The same error was
reported when the script is executed through a relative path.
"""

I'm sure Matt, as a native speaker, can come up with an even better
wording.

> diff --git a/package/checksec/Config.in.host b/package/checksec/Config.in.host
> new file mode 100644
> index 0000000000..7f86f46b50
> --- /dev/null
> +++ b/package/checksec/Config.in.host
> @@ -0,0 +1,16 @@
> +config BR2_PACKAGE_HOST_CHECKSEC
> +	bool "host checksec"
> +	help
> +	  This tool provides a shell script to check the
> +	  properties of the executables
> +	  (like PIE,RELRO,PaX,Canaries,ASLR,Fortify Source).
> +
> +	  https://github.com/slimm609/checksec.sh.git
> +
> +	  NOTE: This tool has a hard-coded path to the standard
> +	  libraries for some of the fortify test cases and
> +	  requires you to either test the local filesystem or be
> +	  in a chroot'd environment.  The tool can still be used
> +	  against a folder of files but requires discretion of
> +	  which the tests may not report consistently vs
> +	  chroot/on-target.

When I look at this and the comment from the maintainer at [0], I am
not sure about the usefulness of such a tool in the context of
Buildroot. Chrooting into the target filesystem is generally not
possible, because the target architecture is different than the build
system architecture. To me, this limitation makes the tool essentially
useless in the context of Buildroot. Could you comment on this a bit
more ?

Also, the formulation "requires discretion of which the test may not
report consistently vs chroot/on-target" doesn't make any sense to me.

[0] https://github.com/slimm609/checksec.sh/issues/62#issuecomment-389880584

> diff --git a/package/checksec/checksec.hash b/package/checksec/checksec.hash
> new file mode 100644
> index 0000000000..e3d1ffd5d1
> --- /dev/null
> +++ b/package/checksec/checksec.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256 510b0b0528f15d0bf13fa1ae7140d2b9fc9261323c98ff76c011bef475a69c14 checksec-cdefe53eb72e6e8f23308417d2fc6b68cba9dbac.tar.gz
> +sha256 c5e2a8e188040fc34eb9362084778a2e25f8d1f888e47a2be09efa7cecd9c70d LICENSE.txt
> diff --git a/package/checksec/checksec.mk b/package/checksec/checksec.mk
> new file mode 100644
> index 0000000000..31ceb43e21
> --- /dev/null
> +++ b/package/checksec/checksec.mk
> @@ -0,0 +1,16 @@
> +################################################################################
> +#
> +# checksec
> +#
> +################################################################################
> +
> +CHECKSEC_VERSION = cdefe53eb72e6e8f23308417d2fc6b68cba9dbac
> +CHECKSEC_SITE = $(call github,slimm609,checksec.sh,$(CHECKSEC_VERSION))
> +CHECKSEC_LICENSE = BSD-3-Clause
> +CHECKSEC_LICENSE_FILES = LICENSE.txt
> +
> +define HOST_CHECKSEC_INSTALL_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/checksec $(HOST_DIR)/bin/

There should be a full destination path here.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
