From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 28 May 2021 21:55:06 +0200
Subject: [Buildroot] Verifying linux 5.4.x hashes
In-Reply-To: <BN8PR11MB366618492FB8C57A78D7752BFF229@BN8PR11MB3666.namprd11.prod.outlook.com>
References: <BN8PR11MB366618492FB8C57A78D7752BFF229@BN8PR11MB3666.namprd11.prod.outlook.com>
Message-ID: <20210528195506.GH2788252@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ian, All,

On 2021-05-28 17:15 +0000, Ian Merin via buildroot spake thusly:
> Hello, -- question about verifying linux kernel hashes.  I see in the
> linux.hash file there is an entry for the latest 5.4.x version, but I
> dont see any way to actually download and verify that 5.4.x version
> against the hash in linux.hash

Here's a quick summary of our discussion on IRC:

  - the hash file is shared between linux and linux-headers
  - it is still possible to select a linux 5.4.x as linux-headers
  - hence we still ahve a 5.4.x entry even for linux
  - the hashes for custom version are not checked at all, becasue we
    can't have all the hashes of all the kernel versions

> What would be the method to have buildroot download the ???latest???
> 5.4.x kernel and also verify its hash against linux.hash?

And now a quick summary for that part;

 1. expand the hash-checking infra to accept custom hashes; that would
    impact:
        package/pkg-generic
        package/pkg-download
        support/download/dl-wrapper
        support/download/check-hash

 2. in linux/Config.in add a new entry for custom version:
        BR2_LINUX_KERNEL_CUSTOM_VERSION_HASHES="sha256:1234abcd sha512:abcd1234"

Note that I am not vey fond of the hash being set in the menuconfig, but
I don't have a definitive better idea.

One thing to consider, though: people that want to check custom versions
are probably already using a br2-external tree, so they could very well
set such hashes in their tree, e.g;

    br2-external/
        external/mk
        | include ......./hashes.mk
        `------------
        hashes.mk
        | LINUX_CUSTOM_HASHES = sha256:1234abcd sha512:abcd1234
        `------------

So they would be tracked in the VCS, and would apply transparently even
for configurations made from-scratch, even if you forgot to add it to
the configuraiton (becasue there is no need to add it to the
configuration anymore).

So, maybe that is another track to look at. I am not sure either but on
first glance, I think I'd prefer that...

Oh, and don't forget to update the manual accordingly! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
