From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 1 Jan 2020 09:47:05 +0100
Subject: [Buildroot] [PATCH] package/libnss: fix build failure due to HW
 PPC Crypto bug
In-Reply-To: <a1f74ad6-8dbc-e515-1393-c81ec6013472@benettiengineering.com>
References: <20191227165427.107111-1-giulio.benetti@benettiengineering.com>
 <20191231180736.09a5add2@windsurf>
 <496f5949-570f-2678-6bcd-67660692479b@benettiengineering.com>
 <08c5d316-d21b-f361-1506-af6a3bdd46e0@xes-inc.com>
 <a45613d1-5d52-9c80-8b79-a1eda19e83f0@xes-inc.com>
 <a1f74ad6-8dbc-e515-1393-c81ec6013472@benettiengineering.com>
Message-ID: <20200101084705.GD3519@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Giulio, Vincent, All,

On 2020-01-01 00:44 +0100, Giulio Benetti spake thusly:
> On 1/1/20 12:31 AM, Vincent Fazio wrote:
> >On 12/31/19 4:49 PM, Vincent Fazio wrote:
[--SNIP--]
> >> ??????? /* clang needs the following cast away from const; maybe a bug
> >>in 7.0.0 */
> >> ??????? v = (vec_u64)vec_xl_be(0, (unsigned char *)buf);
> >>
> >>It should be fine to call endian specific functions if you know how
> >>the data is stored.
[--SNIP--]
> >>Based on the below commit, it was tested on a POWER8, presumably in LE
> >>mode, so I'd be hesitant to switch any endian checks:
> >>https://hg.mozilla.org/projects/nss/rev/3d7e509d6d20ecd607a28fa6ce42e4ffd9c51443
[--SNIP--]
> >>The bigger issue may be that 'vec_xl_be' wasn't introduced until GCC 8
> >>and the toolchain used in the failed build is GCC 7, so that function
> >>is not available in altivec.h:
> >>https://github.com/gcc-mirror/gcc/commit/f7b0548e5eba54b637977e3df4d4daf0cabe474d

Thanks Vincent for digging all this info, very informative. :-)

> ...this is a good idea. So with gcc version < 8.x let's disable
> USE_PPC_CRYPTO and with gcc version >= 8.x let's enable it only if
> LITTLE_ENDIAN. So at this point I would change my upstream patch to do that
> in NSS, since there's already a gcc version check but only against version
> 5.x(>=) that instead needs to be >= 8.x.

Yes, that sounds like a good plan. I've marked this patch as changes
requested in ptachwork in the meantime.

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
