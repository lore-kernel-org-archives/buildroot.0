From: Andy Gibbs <andyg1001@hotmail.co.uk>
Date: Wed, 7 Jul 2010 18:35:58 +0200
Subject: [Buildroot] Fw: Crosstool/Buildroot integration issue
Message-ID: <BLU0-SMTP603DF137A3AEB6AF9F7333E7B30@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday, July 07, 2010 5:22 PM, Thomas Petazzoni wrote:

> Hello Andy,
>
> ...
>
> I definitely haven't looked at this. Can you provide a simple example
> of an application where this is causing an issue, that I could use as a
> test case ?
>

 I'm not sure how I can provide a test case for you.  The problem is not 
evident in the packages provided within buildroot and the code that best 
demonstrates it, I am not at liberty to post publically.  However, I may be 
able to isolate enough of the salient features to make a snippet of demo 
code out of.

 The code in question revolves around libanthy and libuim, both of which I 
cross-compile manually after the main buildroot part is done. Unfortunately, 
in both cases, a number of modifications must be done to the sources to 
enable the cross-compile since they need to run dictionary creation scripts 
on the host.  I can easily make the patches available here, and give you 
example configure switches, if you'd like to try to compile these packages 
yourself.

The problem that manifests itself is that uim doesn't handle the EUC-JP to 
UTF-8 conversion.  The solution was simply to take the 
'sys-root/usr/lib/gconv' folder from crosstool and place it in the 
'/usr/lib' on the target, and this solved the problem instantly.  (But it 
took some hours to find that this was the problem!).

My guess is that these extra libraries are simply part of eglibc and loaded 
by it on demand.  The toolchain that crosstool makes is gcc 4.4.4 with 
eglibc 2.10.

I have some free time tomorrow and I'll see if I can't write some simple 
code that can demonstrate this problem without the need to compile 
uim/anthy.  How hard can it be???  I'll post again when I've got something 
more definite to share!

Thanks

Andy
