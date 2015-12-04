From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 4 Dec 2015 13:02:45 +0100
Subject: [Buildroot] [PATCH 12/51] core/apply-patches: store full path
 of applied patches
In-Reply-To: <20151203185229.GF3834@free.fr>
References: <cover.1448289515.git.yann.morin.1998@free.fr>
 <5a0a287345904fab50326aa020b60e8cb08ca5be.1448289515.git.yann.morin.1998@free.fr>
 <56607974.9090508@lucaceresoli.net> <20151203185229.GF3834@free.fr>
Message-ID: <566180E5.2090501@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann,

Yann E. MORIN wrote:
> Luca, All,
>
> On 2015-12-03 18:18 +0100, Luca Ceresoli spake thusly:
>> Yann E. MORIN wrote:
>>> Currently, we only store the filename of the applied patches.
>>>
>>> However, we are soon to want to install those patches in the legal-info
>>> directory, so we'll have to know where those patches come from.
>>>
>>> Instead of duplicating the logic to find the patches, just store the
>>> full path to each of those patches so we can retrieve them more easily
>>> later on.
>>
>> Mmh, storing absolute pathnames always look a bit ugly... Any simple
>> way to store the relative path ("package/busybox/0002-unzip.patch")?
>
> What about GLOBAL_PATCH_DIR or downloaded patches, or patches from
> BR2_EXTERNAL?

Ouch, you're right, I always forget about the out-of-tree stuff...
Since we're not using .applied_patches_list for anything else, it can
be seen as a temporary, internal file. So we can use the absolute
pathnames after all.

>> Also, there's a double slash in the output:
>> $ cat ./output/build/busybox-1.24.1/.applied_patches_list
>> /home/murray/devel/buildroot/package/busybox//0001-networking-libiproute-use-linux-if_packet.h-instead-.patch
>
> Yeah, is that a problem?
>
> If that bothers you, I can try to fix that. But the directory component
> is passed straight from the pkg-generic infra (the $(@D) as set by make).

Not exactly a problem, just not nice to see. Especially after I worked
to remove double slashes from our package URLs... :) Maybe this one can
be removed with some shell expansion magic. But again, we're discussing
about a temporary file, so it can be acceptable here if it's difficult
to remove.

>
>> BTW, in order to evaluate the risk that your change breaks something,
>> I found myself wondering what .applied_patches_list is used for. And it
>> seems unused... am I missing something?
>
> Not at all. Nothing uses it so far. Hence we're free to change its
> content.
>
> Regards,
> Yann E. MORIN.
>

-- 
Luca
