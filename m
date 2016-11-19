From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 19 Nov 2016 09:39:09 +0100
Subject: [Buildroot] 2016.11-rc2 with really old versions of bash (RHEL5)
In-Reply-To: <7725a865-0665-5747-6bfb-518224e3825b@mind.be>
References: <20161113210740.3a8cedb2@free-electrons.com>
 <582ce22d87e4_b6b11ecfac31990@ultri3.mail>
 <20161116231312.GA27675@free.fr>
 <7725a865-0665-5747-6bfb-518224e3825b@mind.be>
Message-ID: <20161119083909.GA3614@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2016-11-17 23:41 +0100, Arnout Vandecappelle spake thusly:
> On 17-11-16 00:13, Yann E. MORIN wrote:
> > Ricardo, All,
> > 
> > On 2016-11-16 20:48 -0200, Ricardo Martincoski spake thusly:
> >> Do you see the issue described below? Maybe I am doing something wrong.
> >> What bash version do you have in your RHEL5 servers?
> >>
> >> All,
> >>
> >> Ancient versions of bash don't support 'Associative arrays', leading to build
> >> error using 2016.11-rc2 in a plain vanilla RHEL5.
> > 
> > Asociative arrays were introduced in bash-4.0, indeed.
> > 
> > Doing without associative arrays is not very easy. Rather, it would be
> > very difficult.
> 
>  The associative arrays can be overcome relatively easily with eval;

Well, I am fully aware we could do it that way. That's not something I'd
have called "easy", though. It is technically easy, but the maintenance
burden is higher (as it is a trick).

> the indexed
> array BR2_EXT_NAMES would be trickier to remove.

Indexed arrays have been there since at least 3.0, released in 2004, so
even RHEL4 should have it...

> This is possible because we
> require the names to be only [A-Za-z0-9_] so they can be used as variable names.

Right. It's fortunate that kconfig does not allow variable names with a
dash or I'd have allowed that as well.

>  The idea is to do:
> 
> -    BR2_EXT_PATHS["${br2_name}"]="${br2_ext}"
> +    eval BR2_EXT_PATH_${br2_name}='"${br2_ext}"'
> 
> and
> 
> -        printf ' %s' "${BR2_EXT_PATHS["${br2_name}"]}"
> +        eval "printf ' %s' \"\${BR2_EXT_PATH_${br2_name}}\""
> 
>  It's horribly ugly, but it does work. Well, at least I think so :-)

Yes, something like this would work. But as you said, it is relatively
ugly. I had to maintain such a trick in the past and this is just a
nightmare...

For the records, RHEL5 standard support deadline in in March 2017, 4
months from now, but extended support is expected until 2021...

But oh well... We still need to know whether we still consider RHEL5 as
our oldest (unoffocially) supported platform, or if we just bite the
bullet and require bash-4.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
