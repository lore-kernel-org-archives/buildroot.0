From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 27 Jun 2020 21:26:24 +0200
Subject: [Buildroot] [PATCH 1/1] package/minidlna: Fix FTBFS with gcc10
In-Reply-To: <8e4ksgxalv.ln2@ID-313208.user.individual.net>
References: <20200627114314.2391692-1-bernd.kuhls@t-online.de>
 <20200627171227.1ed12967@windsurf>
 <8e4ksgxalv.ln2@ID-313208.user.individual.net>
Message-ID: <20200627192624.GC20645@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2020-06-27 17:15 +0200, Bernd Kuhls spake thusly:
> Am Sat, 27 Jun 2020 17:12:27 +0200 schrieb Thomas Petazzoni:
> > On Sat, 27 Jun 2020 13:43:14 +0200 Bernd Kuhls
> > <bernd.kuhls@t-online.de> wrote:
> >> Bug was reported upstream:
> >> https://sourceforge.net/p/minidlna/patches/182/
> > This bug doesn't seem at all to match this gcc10 build issue. Am I
> > missing something?

That's because setjmp_buffer is also declared in image_utils.c, and this
triggers the infamous gcc-10 -fno-common error.

> oops, added the wrong link, this is the right one:
> https://sourceforge.net/p/minidlna/support-requests/70/

Ah, but as I see it, both the proposal in that bug repot (addign extern
in front of one of them), or renaming the variable in metadata.c or in 
mage_utils.c, are wrong.

The real fix is to turn both variables as static, so their scope is
limited to the file they are defined and use in.

Care to take that with upstream (and debian), please?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
