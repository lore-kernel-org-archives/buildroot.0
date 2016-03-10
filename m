From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 10 Mar 2016 16:44:57 +0000
Subject: [Buildroot] [Bug 8786] gdb fails to build with xz and expat support
	at the same
In-Reply-To: <bug-8786-163@https.bugs.busybox.net/>
References: <bug-8786-163@https.bugs.busybox.net/>
Message-ID: <bug-8786-163-mY1u9Z7p63@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8786

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
The problem seems related to the fact that you have lzma installed on your
build machine, including the development files.

I've tested your last defconfig (on ARM), and I'm not able to reproduce, either
with lzma development files installed or not installed.

The failure:

/lib64/liblzma.so.5: undefined reference to `clock_gettime at GLIBC_2.17'

is related to the fact that it finds your host lzma, tries to link with it, but
fails because it lacks -lrt.

Can you try --with-lzma-prefix=$(HOST_DIR)/usr in GDB_CONF_OPTS ?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
