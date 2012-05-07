From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 07 May 2012 22:47:02 +0200
Subject: [Buildroot] [PATCH 1/2] iperf: fix build on !MMU platforms
In-Reply-To: <1336408773-27312-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 7 May 2012 18:39:31 +0200")
References: <1336408773-27312-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87ipg7iurd.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Build tested on sh2a and blackfin architectures.

Thanks. Have you sent these patches upstream?

 Thomas> ++++ b/src/Listener.cpp
 Thomas> +@@ -679,7 +679,11 @@
 Thomas> +     pid_t pid; 
 Thomas> + 
 Thomas> +     /* Create a child process & if successful, exit from the parent process */ 
 Thomas> ++#ifndef HAVE_FORK
 Thomas> ++    if ( (pid = vfork()) == -1 ) {
 Thomas> ++#else
 Thomas> +     if ( (pid = fork()) == -1 ) {
 Thomas> ++#endif
 Thomas> +         fprintf( stderr, "error in first child create\n");     
 Thomas> +         exit(0); 

I believe you aren't allowed to call exit() after vfork (but should use
_exit() instead).

http://unix.stackexchange.com/questions/5364/why-should-a-child-of-a-vfork-or-fork-call-exit-instead-of-exit
-- 
Bye, Peter Korsgaard
