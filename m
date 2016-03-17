From: Mike Frysinger <vapier@gentoo.org>
Date: Thu, 17 Mar 2016 14:57:47 -0400
Subject: [Buildroot] [PATCH 13/16] elf2flt: disable Werror to avoid
 build issues
In-Reply-To: <20160317091920.6c1453d5@free-electrons.com>
References: <1458164602-16983-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1458164602-16983-14-git-send-email-thomas.petazzoni@free-electrons.com>
 <20160317014051.GN6588@vapier.lan>
 <20160317091920.6c1453d5@free-electrons.com>
Message-ID: <20160317185747.GB6588@vapier.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17 Mar 2016 09:19, Thomas Petazzoni wrote:
> On Wed, 16 Mar 2016 21:40:51 -0400, Mike Frysinger wrote:
> > On 16 Mar 2016 22:43, Thomas Petazzoni wrote:
> > > Some of the debugging printf use incorrect formats, which cause some
> > > warnings. Due to the use of -Werror by default, the build breaks
> > > unnecessarily. Therefore, disable -Werror when building elf2flt.
> > 
> > you should send a patch and/or open an issue.
> > the build bot is clean for all the targets w/Werror:
> > 	https://travis-ci.org/uclinux-dev/elf2flt
> 
> Sure, I'll reproduce and report. It's just some stupid printf specifier
> issue with some of the funky bfd types.

depending on the ABI, printf mismatches can be pretty bad.  consider
that most 32bit arches require splitting 64bit values across two "slots"
and that a 64bit printf length will consume 2 "slots".  so a mismatch
there (either passing too many or consuming too many) with a pointer
following them can lead to crashes :).

the buildbots are only doing one type of build atm (64bit host), so it
might be missing coverage w/a 32bit userland.  we might be able to add
that to the travis matrix.
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160317/14b011e6/attachment.asc>
