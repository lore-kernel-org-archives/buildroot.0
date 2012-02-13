From: Johannes Teiwes <jteiwes@informatik.uni-bremen.de>
Date: Mon, 13 Feb 2012 13:43:50 +0100
Subject: [Buildroot] simple question about dropbear
In-Reply-To: <871uq32cin.fsf@macbook.be.48ers.dk>
References: <853BA8D0-AD4E-4B14-A9E7-EC9908AE5C9A@informatik.uni-bremen.de>
 <871uq32cin.fsf@macbook.be.48ers.dk>
Message-ID: <E38CC59C-6BA9-4775-9A90-5D4C13A78902@informatik.uni-bremen.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 10.02.2012 um 11:44 schrieb Peter Korsgaard:

>>>>>> "Johannes" == Johannes Teiwes <jteiwes@informatik.uni-bremen.de> writes:
> 
> Johannes> Good morning!
> 
> Johannes> I have dropbear configured to run on my target system. The
> Johannes> deamon process shows up in the process list. But as soon as i
> Johannes> connect from the outside via ssh the spawned dropbear process
> Johannes> takes up 100% cpu and never releases is, even when the
> Johannes> external connection request gets canceled.  I have tried to
> Johannes> use the generated rsa/dss keys, login as a regular user (non
> Johannes> root) but its not changing anything.  Have i overlooked
> Johannes> something? Does dropbear has a config like the openssh module
> Johannes> which can forbid (root-)login per default?
> 
> It works fine here. Could you enable strace and use it to see what the
> dropbear process is doing?
> 
> -- 
> Bye, Peter Korsgaard


I managed to get strace running after digging a patch for my architecture (microblaze) but the output of tracing dropbear is not of great value.. i guess, that this is because the kernel is not compiled with tracing support - So the next problem, which arises then, is that the kernel (linux-2.6-xlnx) i am using does not support tracing (but i am still trying to find a workaroud for that)

Nonetheless, i attached strace to the /usr/sbin/dropbear process, which is running from the start. Then i started a ssh connection from another computer and this is whats happened:

# strace -p 58 -f
Process 58 attached - interrupt to quit
restart_syscall(<... resuming interrupted call ...>) = 0
restart_syscall(<... resuming interrupted call ...>) = 0
restart_syscall(<... resuming interrupted call ...>) = 0
restart_syscall(<... resuming interrupted call ...>) = 0
restart_syscall(<... resuming interrupted call ...>) = 0
restart_syscall(<... resuming interrupted call ...>) = 0
restart_syscall(<... resuming interrupted call ...> <unfinished ...>
Process 58 detached
#

So far i can only tell, that dropbear gets stuck in the 7th system call it issues. Any ideas, which/what that could be?

--
Johannes Teiwes - jteiwes at tzi.de



-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120213/b2ec8f71/attachment.html>
