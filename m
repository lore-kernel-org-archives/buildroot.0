From: bugs at busybox.net <bugs@busybox.net>
Date: Sun, 21 Sep 2008 05:11:09 -0700
Subject: [Buildroot] [buildroot 0001779]: Asterisk PBX threading issues when
	compiled against uClibc on buildroot system (recursive lock
	test hangs)
Message-ID: <1f9341d66669ac826dc32caf239493be@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1779 
====================================================================== 
Reported By:                hwstar
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1779
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             12-15-2007 15:02 PST
Last Modified:              09-21-2008 05:11 PDT
====================================================================== 
Summary:                    Asterisk PBX threading issues when compiled against
uClibc on buildroot system (recursive lock test hangs)
Description: 
I created a buildroot system with the development tools installed on the
target.
When compiling the Asterisk PBX on the target system, the function
test_for_thread_safety() which tests for recursive mutexes in main/utils.c
never finishes causing asterisk.ctl to never be created. I attached a code
snippet from utils.c and an strace dump in the "additional information"
box below. It shows that the test thread is being created, and from within
the test thread, the system never returns from the lock right after the
message "Test thread body stated\n".
In the main process code, nothing happens after the the call to
ast_pthread_create().

My uClibc library .config file is also attached as a file.

Are recursive mutex locks an issue in uClibc?




====================================================================== 

---------------------------------------------------------------------- 
 hwstar - 12-15-07 17:44  
---------------------------------------------------------------------- 
I forgot to mention that this is only an issue with asterisk when it is run
as a daemon. Running it in the foreground works as expected. It seems that
running it as a daemon affects the operation of the thread library,
because if I comment out the thread safe test, the code will run until it
executes ast_pthread_create_background then it never returns. 

---------------------------------------------------------------------- 
 spblinux - 09-21-08 05:11  
---------------------------------------------------------------------- 
Same issue with mipsel architecture. - But if the call to daemon() inside
asterisk.c: main() is removed or replaced by the code found in
uClibc-0.9.29/libc/unistd/daemon.c (see attached patch) the error
disappears.

It seems to make a difference if fork() is called inside the main()
function or inside a uClibc library function (that is inside daemon()
routine). - In the situation described above daemon() returns with 0, but
recursive mutex locking fails. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
12-15-07 15:02  hwstar         New Issue                                    
12-15-07 15:02  hwstar         Status                   new => assigned     
12-15-07 15:02  hwstar         Assigned To               => buildroot       
12-15-07 15:02  hwstar         File Added: uClibc.config                    
12-15-07 15:02  hwstar         Issue Monitored: hwstar                      
12-15-07 17:44  hwstar         Note Added: 0003179                          
09-21-08 05:11  spblinux       Note Added: 0011784                          
======================================================================
