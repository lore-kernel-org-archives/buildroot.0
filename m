From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 16 May 2015 15:38:51 +0200
Subject: [Buildroot] [PATCH] acl, attr: fix libdir variable in .la files
In-Reply-To: <1431780866-26839-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 16 May 2015 14:54:26 +0200")
References: <1431780866-26839-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87siawabh0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > The acl and attr packages are using autoconf and libtool, but not
 > automake, which causes all sort of troubles. Some of them are already
 > worked around in acl.mk and attr.mk, but there is another one: the
 > libdir variable in the .la file remains empty, which causes libtool to
 > sometimes be confused about where the acl and attr libraries are
 > installed.

 > This was causing build issues with libarchive, but interestingly only
 > in situations where we had zlib *and* libxml2 also part of the build,
 > which maybe affects how libtool in libarchive behaves since libarchive
 > can use zlib and libxml2 as optional dependencies.

 > So what this patch does is to mungle the libattr.la and libacl.la
 > files to make sure they contain the right libdir values. Yocto is
 > doing exactly the same thing.

 > Upstream attr and acl have been converted fully to automake, so
 > hopefully the upcoming upstream release will allow us to get rid of
 > those hacks, but in the mean time, it seems to be the most appropriate
 > solution.

 > Here is a minimal defconfig that exhibits the problem, and which
 > allows to show that this patch fixes it:

 > BR2_bfin=y
 > BR2_BINFMT_FLAT=y
 > BR2_COMPILER_PARANOID_UNSAFE_PATH=y
 > BR2_INIT_NONE=y
 > BR2_PACKAGE_LIBARCHIVE=y
 > BR2_PACKAGE_LIBARCHIVE_BSDCPIO=y
 > BR2_PACKAGE_ZLIB=y
 > BR2_PACKAGE_LIBXML2=y
 > BR2_PACKAGE_ACL=y

Committed, thanks. I still find it odd that it only happens with that
specific combination through.

-- 
Bye, Peter Korsgaard
