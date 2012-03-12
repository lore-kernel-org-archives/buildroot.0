From: bifferos <bifferos@yahoo.co.uk>
Date: Mon, 12 Mar 2012 01:23:35 +0000
Subject: [Buildroot] [PATCH] bifferboard: new board
In-Reply-To: <1330788921-27127-1-git-send-email-arnout@mind.be>
References: <201203031529.36487.arnout@mind.be>
 <1330788921-27127-1-git-send-email-arnout@mind.be>
Message-ID: <4F5D5017.2080908@yahoo.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/03/2012 03:35 PM, Arnout Vandecappelle (Essensium/Mind) wrote:
> From: "Arnout Vandecappelle (Essensium/Mind)"<arnout@mind.be>
>
> Includes linux and busybox config (to make it fit in 1MB).
>
> Based on
> https://sites.google.com/site/bifferboard/Home/boards-with-1mb-flash/buildroot
>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind)<arnout@mind.be>
<snip>

I noticed the bzImage is slightly larger than it should be, at 978064 
bytes.  It actually has only 0xf0000 - 0x2000 bytes of space available 
for the firmware, since some of the space is taken up by the bootloader 
and a config block.  This leaves only 974848, so some applets (not very 
many) need to be removed for it to work on 1MB devices.  Perhaps the 
better way is to just start with a very minimal configuration which is 
guaranteed to fit.  Anyhow, I tested out the patch with a version of the 
hardware which has 8MB flash.  Unfortunately it doesn't work:

Write protecting the kernel text: 1048k
Write protecting the kernel read-only data: 164k
init[1]: segfault at 0 ip   (null) sp bf95bf40 error 4 in 
busybox[8048000+7c000]
Kernel panic - not syncing: Attempted to kill init!
Pid: 1, comm: init Not tainted 3.1.4-biff #5
Call Trace:
  [<c02035a1>] ? 0xc02035a1
  [<c01164c4>] ? 0xc01164c4
  [<c011698b>] ? 0xc011698b
  [<c011e52d>] ? 0xc011e52d
  [<c0101a33>] ? 0xc0101a33
  [<c0156dba>] ? 0xc0156dba
  [<c010d72f>] ? 0xc010d72f
  [<c014c76d>] ? 0xc014c76d
  [<c014ce59>] ? 0xc014ce59
  [<c014e529>] ? 0xc014e529
  [<c014cea7>] ? 0xc014cea7
  [<c010d591>] ? 0xc010d591
  [<c0204674>] ? 0xc0204674
  [<c010d591>] ? 0xc010d591


The kernel panic is odd.  I'll try to get a better call stack and 
experiment with other kernel versions if I have time, although I've been 
really busy lately, hence the delay in testing out your patch.

best regards,
Biff.
