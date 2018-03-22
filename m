From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 22 Mar 2018 21:25:32 +0100
Subject: [Buildroot] Unicode problem with check-uniq-files
In-Reply-To: <5ffd29df-7b21-122a-2d50-03fc86f29224@jcz.nl>
References: <3a25e768-759e-e377-fcae-48c8e3e36ddd@jcz.nl>
 <20180319213240.GA340@scaer>
 <86fb507f-1fa7-8355-6ec6-7b346e6945e7@jcz.nl>
 <20180321214436.GA2085@scaer>
 <5ffd29df-7b21-122a-2d50-03fc86f29224@jcz.nl>
Message-ID: <20180322202532.GA4580@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jaap, All,

On 2018-03-22 11:43 +0100, Jaap Crezee spake thusly:
> On 03/21/18 22:44, Yann E. MORIN wrote:
> > If you change your LC_ALL et al to an UTF-8 locale, it will work again,
> > I believe.
> 
> That is not working for me:
> 
> /bin/sh: warning: setlocale: LC_ALL: cannot change locale (UTF-8)

"UTF-8" by itself is not a valid locale definition. A valid locale is
made of three firelds:

  ll_CC[.encoding]

with:

  ll: the ISO 639-1 2-letter language name, e.g. fr, en, cs...

  CC: the ISO 3166-1 alpha-2 2letter country code, e.g. FR, CA, UK, US,
      CS...

  encoding: a relatively-free-form field that defines the character set
      encoding. In practice, only UTF-8 is ever used AFAICS...

E.g.:

  fr_FR.UTF-8    french, in France, UTF-8 charset
  fr_CA.UTF-8    french, in Canada (Quebec), UTF-8 charset
  en_GB.UTF-8    english, Great Britain, UTF-8 charset

Locale can define a large set of representations:

  - number: decimal separator, currency symbol position, negative
    symbol and its position...

  - address: separator between number and streetname, ZIP code...

  - collation, i.e. ordering rules, like uppercase vs. lowercase...

and a sh!tload other stuff, see:  man 7 locale

> >>>   Finalizing target directory
> # Check files that are touched by more than one package
> /bin/sh: warning: setlocale: LC_ALL: cannot change locale (UTF-8)

See what locales are available on your system:

    locale -a

Then use one of those, e.g.:

    LC_ALL=en_US.UTF-8 ./support/scripts/check-uniq-files -t target \
    /data/work/jcz/git/jidiot/clients/innr/buildroot_development/output/build/packages-file-list.txt

> BTW my LANG is set to "C".

That's OK. ;-) I had been using POSIX for years before I decided to
enter the 3rd millenai, and switched to a mix of en_GB.UTF-8 and
fr_FR.UTF-8 a few years ago...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
