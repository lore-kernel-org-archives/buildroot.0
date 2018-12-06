From: David J. Fogle <Dave@exitstrategytech.com>
Date: Thu, 6 Dec 2018 01:41:41 +0000
Subject: [Buildroot] Docker client does not function correctly in 2018.11
In-Reply-To: <6e255ac5c09e4841ac67d6f383249556@exitstrategytech.com>
References: <ac041379a2d04fbeb3900fae7bab51be@exitstrategytech.com>
 <8dcf0b32c7fe49e8b30b10a482f3f23a@exitstrategytech.com>
 <CA+h8R2pH=BTTh+farCMfJOW8dzYsUhN_ompMtc=Aaz4tQVbVXg@mail.gmail.com>
 <5db9d4aa533e4e8590b5c33d2bb47665@exitstrategytech.com>
 <p05ed2odjpa9vgdmd5cx9cew.1544054248971@email.android.com>,
 <CA+h8R2orLF5mjc6g8qDwG5Sh0WMXicnLb9DTB_qQiTBoJd45yA@mail.gmail.com>,
 <6e255ac5c09e4841ac67d6f383249556@exitstrategytech.com>
Message-ID: <99kkgapwmjckouvyyw5vo6pe.1544060571584@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ok, after adding in overlay, I am closer I think. One more kernel build with cgroup support. Is there any form of official documentation on docker and buildroot, or is it shoot first ask questions later?


Sent from Samsung Focus


-------- Original message --------
From: "David J. Fogle" <Dave@exitstrategytech.com>
Date: 12/5/18 6:41 PM (GMT-06:00)
To: Christian Stewart <christian@paral.in>
Cc: Matthew Weber <matthew.weber@rockwellcollins.com>, Hamilton Southworth <hamilton@aperturerobotics.com>, buildroot at busybox.net
Subject: Re: Re: Docker client does not function correctly in 2018.11

I'm not seeing that behaviour though, it's the deamon starting, erroring out, then restarting again, a few times a second. Only message anywhere is the one about the invalid flag from the go error output, about -metrics-interval. Last time I ran into something like this was Debian had a mismatch between runc and docker at one point, and it did similar things.



David Fogle

CTO - Exit Strategy


-------- Original message --------
From: Christian Stewart <christian@paral.in>
Date: 12/5/18 6:36 PM (GMT-06:00)
To: "David J. Fogle" <Dave@exitstrategytech.com>
Cc: Christian Stewart <christian@paral.in>, Matthew Weber <matthew.weber@rockwellcollins.com>, Hamilton Southworth <hamilton@aperturerobotics.com>, buildroot at busybox.net
Subject: Re: Re: Docker client does not function correctly in 2018.11

Hi David,

Please provide your defconfig, the commit hash you built from (of
Buildroot), and any relevant log files.

On Wed, Dec 5, 2018 at 3:57 PM David J. Fogle <Dave@exitstrategytech.com> wrote:
> This also may be due to a lack of any functional docker filesystem drivers, as aufs patches break when applied, and overlay apparently is not usable either.

We have witnessed this issue already, and in fact, it occurs on my
laptop (Gentoo, latest) during the boot-up phase.

Docker will hang for about a minute or two. If I press keys on my
keyboard sometimes it will start up, but it seems to hang with no log
output for a while.

We looked at an strace before (Matthew and I both) and found the issue
to be related to reading random data from the system at startup. Since
Docker starts at the end of the boot-up phase, it seems that something
in this process is causing Docker to either not have enough random
data available from the system, or encounter some other hang.

Overlay works fine, why is it "apparently not usable?" I have multiple
machines running overlay based filesystems with this version of
Docker, including Raspberry Pis and Odroids (ARM machines). They all
suffer from the sporadic Docker hang on start, however.

Best,
Christian
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181206/bfa036c5/attachment.html>
