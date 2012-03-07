From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 07 Mar 2012 12:29:21 -0300
Subject: [Buildroot] [PATCH] Fix microperl
In-Reply-To: <20120307090613.3b8e4a9a@skate>
References: <1330895345-16705-1-git-send-email-arnout@mind.be>
 <871up5o277.fsf@macbook.be.48ers.dk> <20120307090613.3b8e4a9a@skate>
Message-ID: <d35484b93145763e6c0dcb6274f4954e@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-03-07 05:06, Thomas Petazzoni wrote:

> Hello,
>
> Le Tue, 06 Mar 2012 22:21:32 +0100,
> Peter Korsgaard <jacmet@uclibc.org> a ?crit :
>
>> Well, I think getting rid of it would be a pity, but I don't
>> personally use perl so if nobody else is using it? Gustavoz?
>
> Gustavo has a patch that does the conversion to GENTARGETS, he even
> posted it on the list at:
>
> From: Gustavo Zacarias <gustavo@zacarias.com.ar>
> To: buildroot at busybox.net
> Subject: [Buildroot] [PATCHv3] [RFC] microperl: bump to version
> 5.12.3 and convert to gentargets
> Date: Tue, 17 May 2011 15:22:39 -0300
>
> There was only one remaining issue: on a Ubuntu 64 bits host, the 
> build
> was failing. But I think it also fails in the current state, so the
> patch that converts to GENTARGETS could be merged, and the building
> problem on Ubuntu 64 bits solved later.
>
> Best regards,
>
> Thomas

It has a limitation on modules at the moment, they must be of the pm 
(interpreted) type rather than the more complex xs ones (C usually).
That's because full perl is required for xs which in turn requires a 
full-blown configuration.
For the most part it checks for libc functions and presence of other 
libs, and platform details (sizeof... and so on).
At the moment this would be "important" (not for me though) to get 
target autoconf/automake going since there are new required modules 
which are XS when the auto* packages were versioned bumped.
The proper solution would probably be define the lowest denominator for 
libc, say uclibc-0.9.31, generate a cache on a qemu/working target and 
get that back into the package.
For the platform details it would be the same work.
This is more or less the way OE and OpenWRT do it.
And then there's module hell if we plan on Kconfig-ing those in an easy 
way for users :)
But i would split that into a proper perl package maybe, or with a 
config kludge.
Regards.
