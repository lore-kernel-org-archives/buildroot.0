From: Hamish Moffatt <hamish@cloud.net.au>
Date: Thu, 1 Nov 2007 17:07:31 +1100
Subject: [Buildroot] project support: "make BOARD=xyz getconfig" does not
	work unless	you already have a .config
Message-ID: <20071101060731.GA20265@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm using multiple-project support for a task here (one of the reasons I
was attracted to buildroot) and I've encountered a few issues.

One is that "make BOARD=xyz oldconfig" does not work. Bug#1568, with
patch. Could somebody please apply this?

Another problem is that "make BOARD=xyz getconfig" does not work. This
one is a bit harder to solve. The situation is that getconfig is defined 
in project/project.mk, but that files is included after a .config.cmd,
which you don't have until after running "make oldconfig".

Thus you have to do

make BOARD=xyz oldconfig
make BOARD=xyz getconfig
make world

while you should logically be able to do

make BOARD=xyz getconfig
make oldconfig
make world

You need to be able to execute getconfig even if .config.cmd doesn't
exist (it doesn't appear to need it). Is it better to move getconfig
to the top-level Makefile to somewhere that doesn't depend on
.config.cmd? Logically it belongs in project/project.mk though.

Thanks
Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
