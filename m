From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 3 Dec 2011 12:08:16 +0100
Subject: [Buildroot] Real time Linux implementation
In-Reply-To: <201112030453.45164.minimod@morethan.org>
References: <CAO6BqMXyye4TFHf0Pxc99Naq28wWg1ne=--q=e+VmfvPVuwD3w@mail.gmail.com>
 <4ED91A0B.10403@relinux.de> <20111203000854.6dcc2764@skate>
 <201112030453.45164.minimod@morethan.org>
Message-ID: <20111203120816.4c0f862a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Sat, 3 Dec 2011 04:53:41 -0600,
"Michael S. Zick" <minimod@morethan.org> a ?crit :

> And the pending EtherCAT patch which has both kernel version constraints
> and supports only a few specific Ethernet adapters.
> 
> Having the new "kernel extensions" build support is a nice feature.
> 
> And BR does target building embedded systems where "strange and unusual"
> kernel extensions are sometimes a way-of-life, but...

Correct.

> Will the project need a general policy of just how "strange and unusual"
> will be considered for inclusion in the build system?
> 
> My reason for posing this question early in the life-time of the
> "kernel extensions" feature is the on-going maintenace chore of 
> these specializations.

For all these kernel extensions, Buildroot does not even try to make
sure that the kernel selected by the user is compatible with the kernel
extension that was enabled. We leave that work to the user, simply
because it is impossible to keep track of which kernel extension
supports which kernel version on which architecture.

I think that Buildroot is merely a tool to automate the build process
of an embedded Linux system. It doesn't, and it will never, replace the
engineer that makes decision on using Xenomai version X, knowing that
it supports the kernel version Y that he is using on his embedded
device. Buildroot only helps here by making the build process
automated, *once* the engineer has made the right choices in terms of
versions (kernel version and kernel extension version).

For extensions like Xenomai and RTAI, I think having Buildroot
integration make sense because those extensions have userspace parts
that need to be compiled and integrated to the root filesystem.

For something like PREEMPT_RT, which is "only" a kernel patch, the need
for integration in Buildroot is a bit less important, in my opinion.
You can just manage your kernel tree outside of Buildroot (choosing the
right kernel version, applying the right PREEMPT_RT patch set), and
then tell Buildroot to use that particular kernel source tree.

Another illustration of this is that Buildroot does not try to enforce
that Netfilter is enabled in the kernel when the iptables userspace
package is enabled, does not try to ensure that Wireless support is
enabled in the kernel when the wireless userspace tools package is
enabled, etc. And I really think it's good not to go down this road,
because it would create an unmaintainable mess.

> Perhaps this question is too early, but worth bookmarking until
> we see just how many one-user, one-time, things get proposed.

I think there's a question of orthogonality here. If the new package or
extension is completely orthogonal to what exists and its integration
does not require major infrastructure changes, then we can very much
integrate everything that gets proposed, and if it turns out a year or
two later that it is unmaintained, we can simply get rid of it.
However, if the integration of the package or extension requires deep
changes of Buildroot internals, then of course more thought is needed
to ensure that it is really worth it.

Regarding igh-ethercat, I think the solution is not too bad. The
packaging itself does not depend on a specific kernel version (i.e
Buildroot does not try to make sure that you have selected a kernel
version for which igh-ethercat has driver patches), it's up to the user
to ensure this.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
