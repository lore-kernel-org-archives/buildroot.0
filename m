From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Sep 2016 12:30:03 +0200
Subject: [Buildroot] [PATCH 2/2] python-psutil: fix build against musl C
	library
In-Reply-To: <20160920121433.3912ca4a@free-electrons.com> (Thomas Petazzoni's
 message of "Tue, 20 Sep 2016 12:14:33 +0200")
References: <20160920074127.22328-1-peter@korsgaard.com>
 <20160920074127.22328-2-peter@korsgaard.com>
 <20160920121433.3912ca4a@free-electrons.com>
Message-ID: <8760pq50es.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Tue, 20 Sep 2016 09:41:27 +0200, Peter Korsgaard wrote:

 >> We NEED both sys/sysinfo.h and the kernel headers (E.G. for ethtool), so
 >> hack around it by ensuring the content of linux/sysinfo.h doesn't get
 >> expanded when building against musl.
 >> 
 >> We cannot do it unconditionally as glibc/uClibc rely on the linux/sysinfo.h
 >> definition. Musl provides no detection define, so instead detect that we
 >> are NOT on glibc/uClibc.

 > This is not really the solution recommended by the musl developers.
 > Instead, the musl developers would suggest to *not* include
 > <linux/sysinfo.h> at all, and instead duplicate the relevant
 > definitions in the userspace program.

Yes, I know it is a hack (as mentioned in the description). The problem
is that the code DOESN'T include linux/sysinfo.h, but it gets indirectly
included from linux/ethtool.h -> linux/kernel.h -> linux/sysinfo.h.

Do you have any suggestion how to fix this in a cleaner way?

-- 
Venlig hilsen,
Peter Korsgaard 
