From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Jan 2020 22:45:41 +0100
Subject: [Buildroot] [PATCH 1/3] package/xen: explicitly disable
 checkpolicy logic
In-Reply-To: <564b6b88-967f-f541-1368-2a515fc881af@mind.be> (Arnout
 Vandecappelle's message of "Tue, 21 Jan 2020 22:29:32 +0100")
References: <20200119170358.5408-1-peter@korsgaard.com>
 <564b6b88-967f-f541-1368-2a515fc881af@mind.be>
Message-ID: <8736c8zdoa.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 19/01/2020 18:03, Peter Korsgaard wrote:
 >> Fixes:
 >> http://autobuild.buildroot.net/results/14af2dc3219847a92c6ec2db14ba387159b61fde
 >> 
 >> The Xen build system builds and embeds a default XSM FLASK (Flux Advanced
 >> Security Kernel) security policy if it detects SELinux checkpolicy on the
 >> build machine.
 >> 
 >> If enabled, a gen-policy.py python script is used to convert the binary
 >> FLASK policy to a C array initialization list to embed it in the Xen binary.
 >> Depending on the python version and locale available on the host, this fails

 >  The more appropriate thing to do would be to:

 > - set this XEN_HAS_CHECKPOLICY=n if selinux is disabled;
 > - do not set it when selinux is enabled, and depend on host-checkpolicy

Yes, that can be done in the future by someone interested in xen with
XSM/selinux support.


 > - depend on host-python
 > - set LC_ALL=C

Hmm, where are we setting LC_ALL=C in the package build step?

 >  However, the latter two are already done. So except for incorrectly detecting
 > checkpolicy installed on the system, I wonder what is really triggering this
 > issue...

I was also unable to reproduce the issue locally, but given the > 255
byte values I assume it is related to locale. Looking at the issue I
noticed the invalid checkpolicy logic and that disabling it would get
rid of the entire code path.

But I am fine with people sending patches to improve it. I don't use Xen
myself, I only looked at the build issues while doing security support
and noticed they have been occuring for quite a long time.

-- 
Bye, Peter Korsgaard
