From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 28 May 2021 22:03:30 +0200
Subject: [Buildroot] Verifying linux 5.4.x hashes
In-Reply-To: <20210528195506.GH2788252@scaer>
References: <BN8PR11MB366618492FB8C57A78D7752BFF229@BN8PR11MB3666.namprd11.prod.outlook.com>
 <20210528195506.GH2788252@scaer>
Message-ID: <c37ac0f3-c771-9654-daa2-42cc64a154b7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28/05/2021 21:55, Yann E. MORIN wrote:
> Ian, All,
> 
> On 2021-05-28 17:15 +0000, Ian Merin via buildroot spake thusly:
>> Hello, -- question about verifying linux kernel hashes.  I see in the
>> linux.hash file there is an entry for the latest 5.4.x version, but I
>> dont see any way to actually download and verify that 5.4.x version
>> against the hash in linux.hash
> 
> Here's a quick summary of our discussion on IRC:
> 
>   - the hash file is shared between linux and linux-headers
>   - it is still possible to select a linux 5.4.x as linux-headers
>   - hence we still ahve a 5.4.x entry even for linux
>   - the hashes for custom version are not checked at all, becasue we
>     can't have all the hashes of all the kernel versions
> 
>> What would be the method to have buildroot download the ???latest???
>> 5.4.x kernel and also verify its hash against linux.hash?
> 
> And now a quick summary for that part;
> 
>  1. expand the hash-checking infra to accept custom hashes; that would
>     impact:
>         package/pkg-generic
>         package/pkg-download
>         support/download/dl-wrapper
>         support/download/check-hash
> 
>  2. in linux/Config.in add a new entry for custom version:
>         BR2_LINUX_KERNEL_CUSTOM_VERSION_HASHES="sha256:1234abcd sha512:abcd1234"
> 
> Note that I am not vey fond of the hash being set in the menuconfig, but
> I don't have a definitive better idea.

 Why not? The kernel version itself is specified in the config file, so it makes
sense that the hash is there to. Compare to a normal package, where the version
and the hash are both specified in the package itself.


> One thing to consider, though: people that want to check custom versions
> are probably already using a br2-external tree, so they could very well
> set such hashes in their tree, e.g;
> 
>     br2-external/
>         external/mk
>         | include ......./hashes.mk
>         `------------
>         hashes.mk
>         | LINUX_CUSTOM_HASHES = sha256:1234abcd sha512:abcd1234
>         `------------
> 
> So they would be tracked in the VCS, and would apply transparently even
> for configurations made from-scratch, even if you forgot to add it to
> the configuraiton (becasue there is no need to add it to the
> configuration anymore).

 That doesn't work at all! You can have two different configs (with two
different kernel versions) in the same external, so you need to make the hash
specific for the config. An easy way to do that: make the hash part of the
config :-)


 Regards,
 Arnout


> 
> So, maybe that is another track to look at. I am not sure either but on
> first glance, I think I'd prefer that...
> 
> Oh, and don't forget to update the manual accordingly! ;-)
> 
> Regards,
> Yann E. MORIN.
> 
