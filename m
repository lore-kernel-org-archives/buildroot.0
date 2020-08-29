From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 29 Aug 2020 15:40:53 +0200
Subject: [Buildroot] [PATCH] fs/cpio/init: unbreak ttyname_r() on glibc
 after dropping /dev/console exec
In-Reply-To: <20200829132405.GE14354@scaer> (Yann E. MORIN's message of "Sat, 
 29 Aug 2020 15:24:05 +0200")
References: <20200829130911.19760-1-peter@korsgaard.com>
 <20200829132405.GE14354@scaer>
Message-ID: <87mu2din8a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 >> +# use the /dev/console device node from devtmpfs if possible to not
 >> +# confuse glibc's ttyname_r().
 >> +# This may fail (E.G. booted with console=), and errors from exec will
 >> +# terminate the shell, so use a subshell for the test
 >> +if (exec 0</dev/console) 2>/dev/null; then
 >> +    exec 0</dev/console
 >> +    exec 1>/dev/console
 >> +    exec 2>/dev/console
 >> +fi

 > You forgot the else part, which should redirect to /dev/null, so that we
 > do have valid fds in the case /dev/console does not really exist, no?

Well, the kernel already takes care of that since commit 2bd3a997befc2
(E.G. as explained by buildroot commit 98a6f1fc02e41), so I am not sure
what explicitly reopening /dev/null would achive?

ttyname_r() / tty already returns ENOENT (not a tty) for this case
without reopening /dev/null:

tty </dev/null
not a tty

-- 
Bye, Peter Korsgaard
