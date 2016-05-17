From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 May 2016 08:44:30 +0200
Subject: [Buildroot] [PATCH 2/9] glibc: disable build of glibc 2.22 with
	gcc 6.x
In-Reply-To: <1463436782-17051-3-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 17 May 2016 00:12:55 +0200")
References: <1463436782-17051-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1463436782-17051-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87bn45dvzl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > glibc-2.22 does not build with gcc 6.x. The first issues can be fixed
 > by:

 >  - Using the same 0004-gcc6.patch as we're using with glibc 2.23 since
 >    Buildroot commit ab8de336eb39ae1cb019a72be65bd0504c86e527.

 >  - Backport glibc commit 5542236837c5c41435f8282ec92799f480c36f18 to fix
 >    strchr() build failure.

 > But then, there are some more failures caused by the fact that numerous
 > glibc files were not using modern prototypes in the function
 > definitions, causing build failures such as:

 > ../sysdeps/unix/sysv/linux/dl-openat64.c:26:1: error: 'openat64' defined as variadic function without prototype [-Werror]
 >  openat64 (dfd, file, oflag)
 >  ^~~~~~~~
 > In file included from ../include/fcntl.h:2:0,
 >                  from ../sysdeps/unix/sysv/linux/dl-openat64.c:21:
 > ../io/fcntl.h:214:12: note: previous declaration of 'openat64' was here
 >  extern int openat64 (int __fd, const char *__file, int __oflag, ...)
 >             ^~~~~~~~

 > This could be fixed by backporting glibc commit
 > 9dd346ff431fc761f1b748bd4da8bb59f7652094, but this is a large commit,
 > touching a significant number of files. We probably don't want to take
 > this path, and instead making glibc 2.22 as not available with gcc 6.x
 > seems like the right course of action.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
