From: Wade Berrier <wberrier@gmail.com>
Date: Wed, 31 Dec 2008 16:04:37 -0700
Subject: [Buildroot] shell issues when /bin/sh is 'dash' instead of 'bash'
Message-ID: <bbbeeccd0812311504p2e7f96a6l923c938acac8acf0@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

There are a few Makefiles that rely on some bash specific code:

findutils
sed
tar
tftpd

(grep used to, but was fixed by Jacmet circa 6 months ago)

The culprit is the "-ot" operator.  From the advanced bash scripting guide:

[ FILE1 -ot FILE2 ]	True if FILE1 is older than FILE2, or is FILE2
exists and FILE1 does not.

'dash' doesn't follow the "or is FILE2 exists and FILE1 does not." portion.

The result is that some files don't get installed into the target
system when /bin/sh points to dash (like on recent ubuntu and debian?
distros)

Attached is a patch to use CONFIG_SHELL.

Question: is this the best way to fix this?  Or maybe these packages
should be fixed more in the style of how Jacmet fixed grep? (see
http://sources.uclibc.org/index.py/trunk/buildroot/package/grep/grep.mk?r1=22930&r2=22931
)

Feedback?

Wade
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot-CONFIG_SHELL.patch
Type: text/x-diff
Size: 4161 bytes
Desc: not available
Url : http://lists.busybox.net/pipermail/buildroot/attachments/20081231/8cefe290/attachment.bin 
