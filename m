From: Mike Frysinger <vapier@gentoo.org>
Date: Wed, 8 Dec 2010 03:50:45 -0500
Subject: [Buildroot] helper tool handling in build system (sed/install/...)
Message-ID: <201012080350.46424.vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

i cant seem to figure out why we bother looking up the full path:
	SED:=$(shell which sed || type -p sed) -i -e

we dont build up host versions, nor do we have to worry about them being found 
in the cross-compiled PATH since we arent adding that to the host PATH.  the 
only things this which/type logic is doing is shortcutting the shell's 
implicit PATH lookup -- which is pretty much useless since it isnt saving us 
any forks.  if anything, it just adds shell overhead whenever someone does 
`make` because of the usage of ":=".

further, it isnt like we're trying to be portable.  the sed's -i usage is 
purely GNU and not POSIX compliant at all.  which makes me wonder why the -e 
is even there since the default behavior of `sed` is to treat the first 
argument as a script.  and then makes me wonder why we have $(SED) at all -- 
there are plenty of places in the dist where people just go through `sed`.

so am i missing something or is this all purely vestigial ?
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 836 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101208/25fae0b3/attachment.pgp>
