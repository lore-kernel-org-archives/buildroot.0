From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 5 Nov 2020 22:12:32 +0100
Subject: [Buildroot] [PATCH 2/4] pkg-infra: add possiblity to check
 downloaded files against known hashes
In-Reply-To: <retd7hxdrv.ln2@ID-313208.user.individual.net>
References: <cover.1404416102.git.yann.morin.1998@free.fr>
 <3ab303bd4f1ee78900e7fafc90947e30319635b7.1404416102.git.yann.morin.1998@free.fr>
 <retd7hxdrv.ln2@ID-313208.user.individual.net>
Message-ID: <20201105211232.GO2887157@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2020-11-05 19:38 +0100, Bernd Kuhls spake thusly:
> Am Thu, 03 Jul 2014 21:36:21 +0200 schrieb Yann E. MORIN:
> sqlite.org started to release sha3 hashes for their tarballs:
> https://www.sqlite.org/download.html
> 
> Apparently a sha3sum utility is not available so I tried
> 
> openssl dgst -sha3-256 dl/sqlite/sqlite-autoconf-3330000.tar.gz
> 
> which shows the hash mentioned upstream:
> 
> SHA3-256(dl/sqlite/sqlite-autoconf-3330000.tar.gz)= 
> 6e94e9453cedf8f2023e3923f856741d1e28a2271e9f93d24d95fa48870edaad
> 
> Should we add the openssl-way to verify sha3 hashes?

Unfortunately, this is only present in very recent versions of openssl.
It was missing in Ubuntu 16.04, while it is present in 18.04 (both still
supported LTS versions)

So, I am not really sure how we can move forward...

If we were to add it, and were to make it mandatory that we be able to
validate them, then it would mean we would have to build our own
host-openssl prior to doing downloads. This is very not nice (see the
existing issue with host-tar, which we are trying to get rid of).

If we were to add it, and only check for them if the host openssl did
support them, and ignore those hashes otherwise, then it would mean some
packages which have only sha3 hashes would not be checked (even if
in-tree we ensure a fallback hash exists, that might not be the case for
external trees, or the situation can slip our attention).

If we don't add it, and upstream does not provide anything else, then we
will have to resort to locally computing our own hashes.

Franckly, my preference would got for the third option: not support sha3,
and add our own hashes. Adding our own hashes is anyway what we already
do for a lot of packages already. sha3 does provide extra resilience,
thanks to its novel design, but sha2 is still far from being considered
broken yet [0].

One thing we may consider adding to reinforce our robustness, is to
store the file size in the hash file, in addition to the hash, e.g.:

    sha256  c35d87f1d0...bbff51fe689  2439463  busybox-1.32.0.tar.bz2

This would protect against size-extension attacks, which afaiu are the
only attacks really considered for now against sha2 [1]...

And we could be backward compatible and recognise 3- or 4-field lines,
to decide whether the size is present of not, and not checking it in the
latter case.

> Should our hash files support different sha3 methods?
> Openssl support sha3-224, sha3-256, sha3-384 & sha3-512.

If we were to add such support, then yes, we would have to add all four
lengths, as we do for sha224, sha256, sha384, and sha512, which all four
are really just sha2 variants.

But unfortunately, I am not convinced we can implement it for now. And
be sure it saddens me... :-(

[0] https://issha2brokenyet.com/  (just for the lols)
[1] https://en.wikipedia.org/wiki/SHA-2#Comparison_of_SHA_functions

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
