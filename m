From: Andreas Ziegler <br015@umbiko.net>
Date: Fri, 21 Feb 2020 13:51:18 +0100
Subject: [Buildroot] SSH server starts too late
In-Reply-To: <mailman.11.1582286403.41897.buildroot@busybox.net>
References: <mailman.11.1582286403.41897.buildroot@busybox.net>
Message-ID: <33327ed4301c921b1ded444b5b7c3b89@umbiko.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Omar,

On 2020-02-21 13:00, Hammami Omar <omar18hammami@gmail.com> wrote
> I am using the buildroot version "2019.11.1" and I have noticed that my 
> SSH
> server starts too late.
> I was using an old version "2017.08" and the SSH server was starting
> normally.

This issue is not related to Buildroot, but caused by changes in 
libopenssl (which in turn is used by OpenSSH), starting around the 
middle of last year. You will find a lot of background information when 
you search the www for 'boot-time entropy starvation'; the cause is, 
reading random data from /dev/urandom blocks until the kernel entropy 
pool has been initialized.

Workarounds:

(a) Patch libopenssl (not recommended for nodes directly connected to 
the WAN).
(b) Use a more recent kernel; version 5.4.y introduced a temporary fix 
for this issue.
(c) Use other sources of extra randomness, as proposed by Peter 
Seiderer.

Kind regards,
Andreas
