From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Date: Mon, 06 Jul 2015 16:33:29 -0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2015-06-29
In-Reply-To: <20150630140738.526d72b8@free-electrons.com>
References: <20150630063014.44429100A75@stock.ovh.net>
 <20150630140738.526d72b8@free-electrons.com>
Message-ID: <559AD809.4050305@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 30/06/15 09:07, Thomas Petazzoni wrote:

>>           arm | f2fs-tools-fd32210229d4ad7d... | NOK | http://autobuild.buildroot.net/results/f5c2b5177ca187ec598a07b2e4254d6161177452/
>
> <command-line>:0:0: note: this is the location of the previous definition
> f2fs_io_parse.c:16:23: fatal error: sys/queue.h: No such file or directory
>   #include <sys/queue.h>
>
> Another musl issue. Gustavo, can you have a look?

>>           arm |              transmission-2.84 | NOK | http://autobuild.buildroot.net/results/4564fdb2ca8618336ab015ca92071d4f842ab70a/
>
> musl build problem:
>
> In file included from upnpcommands.h:10:0,
>                   from miniupnpc.c:90:
> upnpreplyparse.h:14:23: fatal error: sys/queue.h: No such file or directory
>   #include <sys/queue.h>

These two boil down to musl not shipping sys/queue.h
See:
http://wiki.musl-libc.org/wiki/FAQ#Q:_why_is_sys.2Fqueue.h_not_included_.3F
http://www.openwall.com/lists/musl/2013/06/28/9

For transmission this can be worked around easily by defining 
NO_SYS_QUEUE_H and using a bundled version - however that's not enough 
for it to build with musl.
In the f2fs-tools case it's not that simple since sys/queue.h is BSD-3c 
licensed and couldn't be easily included in a GPL-only source i think.
Maybe we should just disable it for musl for now?
Regards.
