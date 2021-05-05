From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 5 May 2021 20:52:40 +0200
Subject: [Buildroot] sudo: error while loading shared libraries
In-Reply-To: <AM0PR06MB5923BCE07863B47DBF9AAC02C0599@AM0PR06MB5923.eurprd06.prod.outlook.com>
References: <AM0PR06MB5923A441CD0C1EF1952FC031C05A9@AM0PR06MB5923.eurprd06.prod.outlook.com>
 <20210504214306.378dbbaf@windsurf>
 <AM0PR06MB5923BCE07863B47DBF9AAC02C0599@AM0PR06MB5923.eurprd06.prod.outlook.com>
Message-ID: <dad56610-a708-4d74-ab12-bb2134fb515c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05/05/2021 13:14, Uwe Fechner wrote:
> Dear Thomas,
> 
> Thanks for looking into this issue, but your suggestion did not help:
> 
> $ LD_LIBRARY_PATH=/usr/libexec/sudo sudo dmesg
> sudo: error while loading shared libraries: libsudo_util.so.0: cannot open
> shared object file: No such file or directory

 You can also run readelf -d on the binary (on your build machine) to find out
which RUNPATH it uses, and which library it tries to open. If you don't see
libsudo_util.so.0 in there, then it's a dlopen()ed library after all.

 I've done a build locally, and indeed sudo is built with a RUNPATH pointing to
/usr/libexec/sudo.

 I've just created a runtime test for sudo (which I'll post soon) and I can't
reproduce the problem.

> Any other idea?

 I'd run it with strace to find out exactly where it goes wrong.

strace sudo dmesg

(you obviously have to add the strace package to your build first.)

 Note that it's possible that under strace it suddenly does work. That's because
strace drops the setuid bit, and that may be interfering for whatever reason.

 Regards,
 Arnout
