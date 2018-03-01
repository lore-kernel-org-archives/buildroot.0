From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 01 Mar 2018 08:42:51 +0100
Subject: [Buildroot] [master,1/2] uboot: use local fdt headers
In-Reply-To: <1519868910.25567.259.camel@impinj.com> (Trent Piepho's message
 of "Thu, 1 Mar 2018 01:48:30 +0000")
References: <20180219155632.30086-2-thomas.de_schampheleire@nokia.com>
 <1519868910.25567.259.camel@impinj.com>
Message-ID: <87371kjl6s.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Trent" == Trent Piepho <tpiepho@impinj.com> writes:

Hi,

 > On Mon, 2018-02-19 at 16:56 +0100, Thomas De Schampheleire wrote:
 >> 
 >> On the expanded compiler command-line, Buildroot's '-I$(HOST_DIR)/include'
 >> is thus present _before_ any -I to local directories, and thus takes
 >> precedence.  And that becomes a problem for header files present both
 >> locally as in the Buildroot host directory, which is the case for libfdt.
 >> 
 >> To fix this problem without having to patch u-boot sources, use '-idirafter'
 >> rather than '-I' to pass the Buildroot host include directory. '-idirafter'
 >> is basically the same thing, but adds the specified directory at the end
 >> of the include precedence chain, rather than at the beginning.

 > This is breaking the build of uboot host tools for me.

Gaah, that's not what I wanted to hear now that Buildroot 2018.02 is
already one day overdue :/

 > It see the include dir order should be:
 > u-boot
 > buildroot host
 > host os

 > But this patch gives:
 > u-boot
 > host os
 > buildroot host

So what do we do? Would it work to use -isystem instead of -idirafter?
As I read it, this would put it after the -I lines but before the built
in system directories. Can you give that a try?

What other alternatives do we have? Reverting this change would fix it
for people using mainline u-boot with a config needing openssl, but
would break it for Thomas' use cases.

-- 
Bye, Peter Korsgaard
