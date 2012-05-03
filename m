From: Graham Newton <gnewton@peavey-eu.com>
Date: Thu, 03 May 2012 13:35:39 +0100
Subject: [Buildroot] Console login root needing a password
In-Reply-To: <CAG6aBkWE0X1fm9LatHE9V+c_kvqvpkYkxZzE+xzEiVcgX6LGwA@mail.gmail.com>
References: <CAG6aBkVA-XPByuGaxUdKQAfGrMq_X_DhVdWOfA2Zh+mUt2jq-w@mail.gmail.com>
 <4FA2298E.5000807@visionsystems.de>
 <CAG6aBkWE0X1fm9LatHE9V+c_kvqvpkYkxZzE+xzEiVcgX6LGwA@mail.gmail.com>
Message-ID: <4FA27B9B.3080108@peavey-eu.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/05/12 10:30, Nigel Sollars wrote:
> Hello Yegor,
>
> The only ttyO2 i have is in inittab and it looks like this:
>
> ttyO2::respawn:/sbin/getty -L ttyO2 115200 vt100
>
> This works fine ( I am able to log in ) on a previous build I did 
> without a toolchain.
>
> Here is the link that i referred to ( from google )
>
> http://lists.busybox.net/pipermail/buildroot/2010-May/034546.html
>
> Hope this helps
> Nige
>
> On Thu, May 3, 2012 at 2:45 AM, Yegor Yefremov 
> <yegor_sub1 at visionsystems.de <mailto:yegor_sub1@visionsystems.de>> wrote:
>
>     Am 03.05.2012 01:38, schrieb Nigel Sollars:
>     > Hello,
>     >
>     > Ive built buildroot with a toolchain successfully,  however
>     trying to login over the console requires a password.  The
>     passwd/shadow is the default.
>     >
>     > Looking around google apparently this has to do with wchar is
>     this true?,  if so is there a fix since this is required for gdb
>     on the target.
>
>     Have you tried something like this?
>
>     ttyS0::respawn:-/bin/sh
>
>     Yegor
>
>
>
>
> -- 
> "Science is a differential equation. Religion is a boundary condition."
>                                                                                                              
> Alan Turing
>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
Hi
I recently had this issue when I directly mounted the buildroot 
generated filesystem via NFS.  After a frustrating day I discovered that 
the suid bit had be set on the busybox executable.  So when login was 
run busybox ran as an unknown user (not root) and so failed causing the 
login to fail.  The fix was to run chmod -s busybox on the NFS server.  
What was baffeling was that the issue went away if I copied the 
filesystem somewhere else.
In the course of my investigations I found I could login if I tried 
Yegor's solution but it did not give me root access.
Hope this helps
Graham

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120503/fcf3239d/attachment-0001.html>
