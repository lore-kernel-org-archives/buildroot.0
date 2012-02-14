From: Felipe Contreras <felipe.contreras@gmail.com>
Date: Tue, 14 Feb 2012 14:44:03 +0200
Subject: [Buildroot] [PATCH] build: add 'file' option for 'make
	defconfig'
In-Reply-To: <CAAXf6LVPo6hWwJFUm3dzFYPAVvC=_=aBP1B7XSQ26spoyuEYFA@mail.gmail.com>
References: <1328918596-19369-1-git-send-email-felipe.contreras@gmail.com>
 <201202111701.27270.arnout@mind.be>
 <CAAXf6LVPo6hWwJFUm3dzFYPAVvC=_=aBP1B7XSQ26spoyuEYFA@mail.gmail.com>
Message-ID: <CAMP44s2yuoJ38UdeaRbgeLo9QvPDgrv1roPzgjKL-QZdt7W54g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Feb 14, 2012 at 11:46 AM, Thomas De Schampheleire
<patrickdepinguin+buildroot@gmail.com> wrote:
> Hi,
>
> On Sat, Feb 11, 2012 at 5:01 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>> On Saturday 11 February 2012 01:03:16 Felipe Contreras wrote:
>>> So that this works:
>>>
>>> ?% make defconfig file=~/busybox-defconfig
>>>
>>> Right now we have to do:
>>>
>>> ?% make $PWD/output/build/buildroot-config/conf
>>> ?% $PWD/output/build/buildroot-config/conf --defconfig=~/busybox-defconfig Config.in
>>>
>>> And the first command would through an error. Not nice.
>>
>> ?+1! ?And such a graceful solution too!
>>
>> ?One remark, though: we normally use capitals for variables. ?Also I'd make
>> it more clear that the file means the defconfig file, so you can write:
>>
>> make DEFCONFIG=~/my-buildroot.config defconfig world
>>
>> ?And eventually we can even update the non-BR2_HAVE_DOT_CONFIG targets to
>> default to defconfig if DEFCONFIG is defined.
>>
>>
>> ?Note that the way to do it without this patch would be:
>>
>> cp ~/busybox-defconfig configs/busybox_defconfig
>> make busybox_defconfig
>>
>> which doesn't error out. ?However, it does require a writable buildroot
>> directory and it makes it dirty.
>
> Is this really a problem?
> If one creates a defconfig file, why not store it in 'configs' ?

Because it's personal.

I want to be able to clone buildroot, and 'make defconfig
file=/media/drive/notes/my-buildroot-config'.

> Felipe, are you aware of the suggested behavior of placing your
> defconfig file in configs/ and 'enabling' it with:
> make your_defconfig
> ?
> Could you explain why you don't think this is sufficient?

It requires an extra step. Specially annoying when doing 'git clean
-fxd', and specially annoying while bisecting.

Plus, I think this command is perfectly understandable:
% make defconfig file=/media/drive/notes/my-buildroot-config

This not so much:
% cp /media/drive/notes/my-buildroot-config configs/my-defconfig
% make my-defconfig

Cheers.

-- 
Felipe Contreras
