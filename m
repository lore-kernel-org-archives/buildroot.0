From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 9 Sep 2019 11:16:04 +0200
Subject: [Buildroot] [PATCH v2] package/nfs-utils: enable IPv6
In-Reply-To: <20190909100305.6ed6662d@windsurf>
References: <20190812173712.23202-1-unixmania@gmail.com>
 <20190909100305.6ed6662d@windsurf>
Message-ID: <6a13e0d0-9beb-99f0-436d-5a9d6fd7feb5@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 09/09/2019 10:03, Thomas Petazzoni wrote:
> Hello,
> 
> Arnout, Peter added in Cc, see below.
> 
> On Mon, 12 Aug 2019 14:37:12 -0300
> unixmania at gmail.com wrote:
> 
>> From: Carlos Santos <unixmania@gmail.com>
>>
>> IPv6 requires libtirpc, so select BR2_PACKAGE_LIBTIRPC inconditionally.
>>
>> Fixes: https://bugs.busybox.net/show_bug.cgi?id=10806
>>
>> Signed-off-by: Carlos Santos <unixmania@gmail.com>
> 
> Arnout, Peter, do you have an opinion about this change ?

 Yes I do :-)

 This thread was on my todo list of things I still had to reply to...


> Basically, this change makes libtirpc mandatory for nfs-utils, because
> it is necessary to have IPv6 RPC support.
> 
> However, libtirpc is always necessary if you want RPC on IPv6, so if we
> take the decision of making libtirpc mandatory for nfs-utils, we should
> make it mandatory for all packages that use RPC support, and remove the
> support for RPC from the toolchain.
> 
> My opinion is that we should keep things are they are today: nfs-utils
> uses libtirpc if it's there, and otherwise uses the toolchain RPC
> support. If a user wants IPv6 support, he should enable libtirpc.

 I agree with this analysis.

 When we switched to "assume IPv6 support is there", this was about the
toolchain, i.e. we can assume that the libc functions and the kernel have IPv6
support when building packages. It doesn't mean that we will force all packages
to be built with IPv6 support. That is still a case-by-case decision based on
what the size impact is.

 nfs-utils is not that large, but still: with br-arm-full (note that this
toolchain doesn't have native RPC, so libtirpc is built anyway; but native RPC
in uClibc doesn't add much to the size anyway):

toolchain (excluding libstdc++): 763KiB
nfs-utils: 395KiB
libtirpc: 104KiB
rpcbind: 55KiB

 So I would say that 104/395KiB is borderline of what we want to keep
configurable, but just on the side of keeping it configurable.

 In other words, I agree with your analysis that it's better to keep libtirpc
optional.


 Regards,
 Arnout
