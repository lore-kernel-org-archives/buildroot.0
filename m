From: rjbarnet at rockwellcollins.com <rjbarnet@rockwellcollins.com>
Date: Wed, 23 Apr 2014 17:45:18 -0500
Subject: [Buildroot] [PATCH 1/1] linux: Don't enable DEVTMPFS support
 for kernels older than 3.x.
In-Reply-To: <53564749.5060409@lucaceresoli.net>
References: <1397849296-5517-1-git-send-email-rjbarnet@rockwellcollins.com>
 <20140418213924.6d5a3ebf@skate> <53564749.5060409@lucaceresoli.net>
Message-ID: <OF4212D2FC.25E3AE63-ON86257CC3.004F7CF7-86257CC3.007CFC5D@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca, Peter, Thomas, All,

Luca Ceresoli <luca@lucaceresoli.net> wrote on 04/22/2014 05:41:13 AM:

> Hi Ryan, Thomas,
> 
> Thomas Petazzoni wrote:
>> Dear Ryan Barnett,
>>
>> On Fri, 18 Apr 2014 14:28:16 -0500, Ryan Barnett wrote:
>>> From: Matt Poduska <mjpodusk@rockwellcollins.com>
>>>
>>> In the case where DEVTMPFS is desired for older kernels where the
>>> support is experimental, it's still possible to enable the option in
>>> the board's specific linux .config instead of relying on buildroot to
>>> make the modification.
>>>
>>> Signed-off-by: Matt Poduska <mjpodusk@rockwellcollins.com>
>>> Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
>>> ---
>>>   linux/linux.mk |    8 +++++---
>>>   1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> Which problem is this fixing? I remember having used devtmpfs prior to
>> 3.x, and it was working well. For versions prior to 2.6.32, the
> 
> And in fact I have targets here that are stuck on 2.6.37, they happily
> use devtmpfs and it works just fine.
> 
> So I NACK this change, or if there's a strong motivation to apply it
> I would at least conceive a backward-compatibility path.

We recently ran into a issue where brought a board forward to use 
Buildroot 2014.02 that we kept at a kernel version of 2.6.33. Yes, I agree 
that we should be using a new kernel but the work to port to a newer 
version is too great but we needed to upgrade some package versions. The 
system was unable to boot because DEVTMPFS_MOUNT was enabled in kernel 
config. We traced the issue back to Buildroot automatically enabling these 
options in our kernel config. There was no way to not include this kernel 
config option when BR2_ROOTFS_DEVICE_CREATION_STATIC is enabled.

We will try to analyze to see if there is a better way to get around this 
issue but I'm OK with this patch being rejected. Since this is mostly for 
legacy support and who wants to do that ;)

Thanks,
-Ryan
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140423/5fe914d8/attachment.html>
