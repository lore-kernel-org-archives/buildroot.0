From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 16 Mar 2016 23:31:11 +0100
Subject: [Buildroot] [PATCH 4/4] lxc: remove dependency on headers >= 3.0
In-Reply-To: <1458159611-5613-4-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 16 Mar 2016 21:20:11 +0100")
References: <1458159611-5613-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1458159611-5613-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87twk66onk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Now that libcap no longer needs kernel headers >= 3.0, we can remove
 > this dependency from lxc. However, building with headers 2.6.32
 > exhibits a build issue caused by the redefinition of the setns()
 > function.

 > Since setns() is not implemented in the C library, lxc provides its
 > own version. However, for some reason, while the C library doesn't
 > implement setns(), it provides a prototype for it, which is not
 > exactly the same as the one in lxc, causing a build failure. We re-use
 > a solution implemented in gdb to solve the same problem: define in lxc
 > a function called do_setns(), which calls setns() when available, or
 > manually does the system call otherwise.

 > Of course, with old kernels the system call will not be available, so
 > things will fail at runtime, but this was anyway already the behavior
 > of lxc's setns() dummy implementation.

But can missing setns() really just be ignored and still have a working
lxc? From the code snippets failures look critical.

From the man page:

VERSIONS

        The setns() system call first appeared in Linux in kernel 3.0;
        library support was added to glibc in version 2.14.

So I think it is safer to just keep the >= 3.0 headers dependency.

-- 
Bye, Peter Korsgaard
