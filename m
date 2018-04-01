From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 01 Apr 2018 16:59:15 +0200
Subject: [Buildroot] [PATCH 1/1] go: bump to 1.10
In-Reply-To: <87po3js3j3.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Sun, 01 Apr 2018 11:02:24 +0200")
References: <20180219072718.28895-1-christian@paral.in>
 <87po3js3j3.fsf@dell.be.48ers.dk>
Message-ID: <87y3i7q8fw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Christian" == Christian Stewart <christian@paral.in> writes:
 >> This commit bumps the Go programming language to the 1.10 release.
 >> Signed-off-by: Christian Stewart <christian@paral.in>

 > This causes a number of build issues (strangely enough only from March
 > 13th). Care to take a look?

 > http://autobuild.buildroot.net/?reason=host-go-1.1

Sorry, there actually were earlier failures (going back to Feb 20th, so
right after bumping the version).

What is common for all the failures is that the target arch == host arch
(x86-64) AND the C library is different (musl/uclibc-ng).

I did a quick test here and the reason is that host-go gets linked with
the target C library:

ls -lah build/host-go-1.10/bin/go
-rwxr-xr-x 1 peko peko 11M Apr  1 16:44 build/host-go-1.10/bin/go

./build/host-go-1.10/bin/go
zsh: no such file or directory: ./build/host-go-1.10/bin/go

ldd ./build/host-go-1.10/bin/go
        linux-vdso.so.1 (0x00007ffcd2bae000)
        libc.so.0 => not found

libc.so.0 is uClibc-ng.

Care to take a look?

-- 
Bye, Peter Korsgaard
