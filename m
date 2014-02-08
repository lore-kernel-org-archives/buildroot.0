From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 08 Feb 2014 22:43:50 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <52F4DEB6.3040703@zacarias.com.ar> (Gustavo Zacarias's message of
 "Fri, 07 Feb 2014 10:25:10 -0300")
References: <20140207073009.C5A85100E3A@stock.ovh.net>
 <20140207135324.4c7cbe3f@skate> <52F4DEB6.3040703@zacarias.com.ar>
Message-ID: <87txc946w9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

Hi,

 >> Missing setns() on CodeSourcery toolchain. Since util-linux is really
 >> needed for many packages, it would be good to find a fix that doesn't
 >> involve disabling util-linux completely.
 >> 
 >> checking for syscall setns... no
 >> configure: WARNING: Unable to detect syscall setns.
 >> configure: error: nsenter selected but setns syscall not found
 >> make: *** [/home/test/test/3/output/build/util-linux-2.23.2/.stamp_configured] Error 1
 >> 
 >> Gustavo, an idea?

 > Yes, blame commit 9f91d79601da42516752318beecfd080dc05aac9
 > Before it was an option util-linux decided if it was appropiate to build
 > it according to setns() being available, now we may be forcing it when
 > the syscall may simply be unavailable (like this toolchain).
 > We can do a ton of toolchain kludges or just revert, i'd prefer the
 > second option since it's not like a super-common command (actually most
 > distros don't have it yet because it's pretty new for util-linux).
 > Regards.

Hmm, looking closer at the issue I think I agree. Without the explicit
option nsenter automatically gets built if possible. Nsenter is very
small compared to the rest of util-linux (~20KB), and people can always
remove it in a post-build script if they really care.

-- 
Bye, Peter Korsgaard
