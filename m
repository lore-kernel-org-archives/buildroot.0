From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 16 Jan 2019 23:39:12 +0100
Subject: [Buildroot] [PATCH 1/3] package/pkg-kconfig: pass HOSTCC during
 kconfig steps
In-Reply-To: <20190110211500.14368-2-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Thu, 10 Jan 2019 22:14:58 +0100")
References: <20190110211500.14368-1-thomas.petazzoni@bootlin.com>
 <20190110211500.14368-2-thomas.petazzoni@bootlin.com>
Message-ID: <877ef49qi7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > The kconfig build logic uses the HOSTCC variable to find the host
 > compiler. It makes sense to explicitly pass a value to this variable,
 > pointing to the host compiler used by Buildroot.

 > During the kconfig step, host-ccache is not ready (host-ccache is only
 > a dependency to the configure step of packages), so we use
 > $(HOSTCC_NOCCACHE).

 > Packages currently using the kconfig-package fell into two categories:

 >  - Those not passing any HOSTCC value. For such packages, it was the
 >    default host compiler detected by the kconfig build logic that was
 >    used. ccache was therefore never used. With this commit, those
 >    packages will now be using the host compiler detected by
 >    Buildroot. Packages in this situation: at91bootstrap3, barebox,
 >    busybox, swupdate, uclibc, xvisor.

 >  - Those passing a HOSTCC value. Such packages were passing $(HOSTCC),
 >    which doesn't work as host-ccache will not be ready. This commit
 >    does not fix them, as they still override HOSTCC. It will be fixed
 >    in followup commits. Packages in this situation: uboot and
 >    linux. Note that linux was a bit special, because it has a
 >    KCONFIG_DEPENDENCIES on the toolchain package, so in fact
 >    host-ccache was ready.

 > So practically speaking, this commit does not fix anything, as the two
 > only problematic packages that use $(HOSTCC) are not fixed. However,
 > it makes things more correct by explicitly telling kconfig which
 > compiler to use.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
