From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 28 Aug 2016 23:40:47 +0200
Subject: [Buildroot] [PATCH] android-tools: disable on some architecture
	with old kernel headers
In-Reply-To: <1472248480-23992-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Fri, 26 Aug 2016 23:54:40 +0200")
References: <1472248480-23992-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87zinw8tcw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > The android-tools code is somewhat ugly, and defines its own u64 typedef
 > becore including kernel headers. Unfortunately, there are specific cases
 > where that doesn't work properly.

 > The android-tools code defines u64 as "unsigned long long", which is now
 > correct in the kernel. However, it used to be a time where u64 was
 > defined as "unsigned long" on a few 64 bits architecture (at least
 > PowerPC64 and MIPS64). The kernel headers have introduced a
 > __SANE_USERSPACE_TYPES__ macro that userspace can define in order to get
 > the "sane" definition, i.e "unsigned long long" for u64.

 > Unfortunately, this __SANE_USERSPACE_TYPES__ mechanism only appeared in
 > 3.10 on PowerPC64, and in 3.16 on MIPS64.

 > Since android-tools is not using the autotools, and there's no easy way
 > to test types with the C pre-processor, we simply add some more
 > Config.in dependencies. They are a bit convoluted, but that's what the
 > dependency really is.

 > In our autobuilders, this issue was only showing up with an old MIPS64
 > toolchain that uses 3.9 kernel headers.

 > Also, since the problem is limited to the "fastboot" tool, the
 > dependency is only added for fastboot. Both adb and adbd build fine with
 > this toolchain.

 > Fixes:

 >   http://autobuild.buildroot.net/results/ce45c995bd6abda6487ae3a11b4f45a7b9b3f8eb/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
