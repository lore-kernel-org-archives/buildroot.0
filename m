From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 13 Sep 2015 23:13:12 +0200
Subject: [Buildroot] [PATCH 1/1] package/dhrystone: fix musl compilation
	issue
In-Reply-To: <1441111142-8561-1-git-send-email-brendanheading@gmail.com>
 (Brendan Heading's message of "Tue, 1 Sep 2015 13:39:02 +0100")
References: <1441111142-8561-1-git-send-email-brendanheading@gmail.com>
Message-ID: <87k2ruauqf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Brendan" == Brendan Heading <brendanheading@gmail.com> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/1b6cb1b40431bf484db2d99bfdc8237cbae6a9d7/
 > http://autobuild.buildroot.net/results/20e669d6e4bc3d872a355ef658ddad8f34676624/

 > Include a more appropriate header file to pick up the definition of HZ
 > from the kernel headers.

 > Signed-off-by: Brendan Heading <brendanheading@gmail.com>

 > ---
 > v1 - This looks a bit hacky, but it seems to compile fine against
 > the uclibc, glibc and musl toolchain combos without any other packages
 > enabled. Comments welcome.

Looking at the implementation I see we end up using the times(2)
interface, which returns clock_t values. The kernel defines clock_t in
terms of USER_HZ which is always 100 (see kernel/time/time.c::jiffies_to_clock_t()).
So it is simpler to just pass -DHZ=100 to dhrystone.

So I have committed a fix to do so instead, thanks.

-- 
Bye, Peter Korsgaard
