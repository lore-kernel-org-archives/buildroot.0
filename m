From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Feb 2014 22:02:32 +0100
Subject: [Buildroot] [PATCH v11 0/8] Add support for top-level parallel
 make
In-Reply-To: <1389348368-2509-1-git-send-email-fabio.porcedda@gmail.com>
References: <1389348368-2509-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <20140203220232.4b228965@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Fri, 10 Jan 2014 11:06:00 +0100, Fabio Porcedda wrote:

> this is a patch set for adding support for top-level parallel make in
> buildroot, the common problem scattered in buildroot's top-level
> makefiles is that in the rules it relies on the order of evaluation of
> the prerequisites, to be able to use top-level parallel make instead
> of reling on the left to right ordering of evaluation of the
> prerequisites we must add an explicit rule to describe the
> dependencies.

We have discussed your patch series today at the Buildroot meeting,
Peter and I had a look at it. Our plan is to merge it right after
2014.02-rc1 is released, into the -next branch, which means that it
will be part of the 2014.05 release.

That said, there are two changes that we would like to be made, but
they can be made as follow-up patches:

 * Guarantee that the staging installation is always done before the
   target installation. Specifically for the uclibc and glibc package,
   you've added something like:

+# The uclibc-install-target use files from uclibc-install-staging
+$(UCLIBC_TARGET_INSTALL_TARGET): $(UCLIBC_TARGET_INSTALL_STAGING)

   The problem is that uclibc and glibc are by far not the only
   packages to make this assumption. There are many packages who
   install everything to staging, and then pick whatever they need from
   the staging directory to install things to the target directory. The
   qt and qt5 packages come to mind, but there are many more.
   Therefore, we would like these steps to be serialized for each
   package: first staging installation, then target installation.

 * Also, in glibc and uClibc, you're doing:

-# Before uClibc is built, we must have the second stage cross-compiler
-uclibc-build: host-gcc-intermediate

+# Before uClibc is built, we must have the second stage cross-compiler
+$(UCLIBC_TARGET_BUILD): | host-gcc-intermediate

   But I believe there are a few other tricky cases where the
   dependencies are "non-standard". I'm thinking of at least:

    - linux/linux-ext-rtai.mk, which does not depends on rtai, but
      rtai-patch. Not sure that's problematic in this case, but I was
      wondering.

    - The linux/linux.mk mechanism to rebuild the kernel image after
      the initramfs image has been produced.

Can you cook follow-up patches for the first issue, and maybe
review/investigate the second issue if applicable?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
