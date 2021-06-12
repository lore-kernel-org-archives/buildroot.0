From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 12 Jun 2021 13:54:41 +0200
Subject: [Buildroot] [EXTERNAL] Re:  Verifying linux 5.4.x hashes
In-Reply-To: <BN8PR11MB366648AEB3D51F92B6843435FF369@BN8PR11MB3666.namprd11.prod.outlook.com>
References: <BN8PR11MB366618492FB8C57A78D7752BFF229@BN8PR11MB3666.namprd11.prod.outlook.com>
 <20210528195506.GH2788252@scaer>
 <c37ac0f3-c771-9654-daa2-42cc64a154b7@mind.be>
 <20210528201700.GI2788252@scaer>
 <BN8PR11MB366648AEB3D51F92B6843435FF369@BN8PR11MB3666.namprd11.prod.outlook.com>
Message-ID: <9627e09c-74e3-c9dc-161d-c2b4d04296ab@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 09/06/2021 16:28, Ian Merin wrote:
> Hello,
> 
> Why wouldn't you be able to set a custom hash in a BR2-External directory?

 There's no problem with that. However, there's a problem with Yann's proposal
of setting the hash in a variable.

> 
> Isn't the issue of multiple kernel versions solvable in the same way it already works?
> 
> If you have say 5.4.123 and 5.10.25 why couldn't you have a file that looks like this:
> 
> Sha256 abc123 linux-5.4.123.tar.xz
> Sha256 123abc linux-5.10.25.tar.xz

So instead of this, Yann proposed:

LINUX_CUSTOM_HASH = abc123

but then there's no way to have multiple, so he changed that to

LINUX_CUSTOM_HASH_5.4.123 = abc123

(which I find contrary to the usual way we do things in Buildroot).

 Adding a hash file in an external seems fine to me. The difficulty lies in
determining whether or not the hash is to be verified. We'd need to have an
option of checking the hash or not. And of course you need to make sure that the
hash really *is* checked - it's too easy to forget about checking the hash.

 Another alternative is to make it a config option:

BR2_LINUX_KERNEL_CUSTOM_HASH="abc123"

(since there's only one custom version possible per config). Although that way
is a bit more clunky from a user perspective, I think it's the most consistent
and also the easiest to implement.

 Regards,
 Arnout

> 
> 
> 
> 
> -----Original Message-----
> From: Yann E. MORIN <yann.morin.1998@free.fr> 
> Sent: Friday, May 28, 2021 4:17 PM
> To: Arnout Vandecappelle <arnout@mind.be>
> Cc: Ian Merin <Ian.Merin@entrust.com>; buildroot at busybox.net
> Subject: [EXTERNAL] Re: [Buildroot] Verifying linux 5.4.x hashes
> 
> WARNING: This email originated outside of Entrust.
> DO NOT CLICK links or attachments unless you trust the sender and know the content is safe.
> 
> ______________________________________________________________________
> Arnout, All,
> 
> On 2021-05-28 22:03 +0200, Arnout Vandecappelle spake thusly:
>> On 28/05/2021 21:55, Yann E. MORIN wrote:
>>> On 2021-05-28 17:15 +0000, Ian Merin via buildroot spake thusly:
>>>> What would be the method to have buildroot download the ???latest???
>>>> 5.4.x kernel and also verify its hash against linux.hash?
>>> And now a quick summary for that part;
>>>
>>>  1. expand the hash-checking infra to accept custom hashes; that would
>>>     impact:
>>>         package/pkg-generic
>>>         package/pkg-download
>>>         support/download/dl-wrapper
>>>         support/download/check-hash
>>>
>>>  2. in linux/Config.in add a new entry for custom version:
>>>         BR2_LINUX_KERNEL_CUSTOM_VERSION_HASHES="sha256:1234abcd sha512:abcd1234"
>>>
>>> Note that I am not vey fond of the hash being set in the menuconfig, 
>>> but I don't have a definitive better idea.
>>  Why not? The kernel version itself is specified in the config file, 
>> so it makes sense that the hash is there to. Compare to a normal 
>> package, where the version and the hash are both specified in the package itself.
>>> One thing to consider, though: people that want to check custom 
>>> versions are probably already using a br2-external tree, so they 
>>> could very well set such hashes in their tree, e.g;
>>  That doesn't work at all! You can have two different configs (with 
>> two different kernel versions) in the same external, so you need to 
>> make the hash specific for the config. An easy way to do that: make 
>> the hash part of the config :-)
> 
> That is why a email client is not meant to write code: you can't test it. ;-)
> 
> But more seriously, that is still doable with some hackery (which means:
> don't do it):
> 
>     LINUX_CUSTOM_HASH_5.4.123 = sha256:1234abcd
>     LINUX_CUSTOM_HASH_5.10.25 = sha256:1234abcd
> 
> and so on... Of course, that is still limiting to a set of know versions.
> But in a project, the set of kernel versions to ever use is more often than not very small, i.e. probably a single one, or just one per suported board...
> 
> But OK, the hash in Config.in is more flexible, so yes, Ian: go with that initial idea of yours.
> 
> Regards,
> Yann E. MORIN.
> 
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' 
> | conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | https://urldefense.com/v3/__http://ymorin.is-a-geek.org/__;!!FJ-Y8qCqXTj2!OUuT-bsJ5X27mcQXNyq0D_2DViN3j2LNd6MuYUs2xLcgV6-WYtDstIbF2PqUkAI$  | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
> 
