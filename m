From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 8 Feb 2019 22:22:58 +0100
Subject: [Buildroot] [PATCH 08/19] support/check-uniq-files: decode as
 many strings as possible
In-Reply-To: <214715e2-cb18-31d0-45b1-e67d6953dec4@mind.be>
References: <cover.1546898693.git.yann.morin.1998@free.fr>
 <fcf8eccf9d275bd95c7e61099722c1a3b22a6da9.1546898693.git.yann.morin.1998@free.fr>
 <11fc1785-c180-a8fc-7a90-46d487218b7c@mind.be>
 <20190208172521.GC3079@scaer>
 <214715e2-cb18-31d0-45b1-e67d6953dec4@mind.be>
Message-ID: <20190208212258.GF3079@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2019-02-08 21:42 +0100, Arnout Vandecappelle spake thusly:
> On 08/02/2019 18:25, Yann E. MORIN wrote:
> > On 2019-02-08 00:40 +0100, Arnout Vandecappelle spake thusly:
> >> On 07/01/2019 23:05, Yann E. MORIN wrote:
> >>> +def str_decode(s):
> >>> +    try:
> >>> +        return s.decode()
> >>> +    except UnicodeDecodeError:
> >>> +        return repr(s)
> >>
> >>  I think s.decode(errors='replace') is exactly what we want: it prints the
> >> question mark character for things that can't be represented, just like ls does.
[--SNIP--]
> >     >>> lines[0].decode(errors='replace')
> >     u'\ufffd\n'
> >     >>> print('{}'.format(lines[0].decode(errors='replace')))
> >     Traceback (most recent call last):
> >       File "<stdin>", line 1, in <module>
> >     UnicodeEncodeError: 'ascii' codec can't encode character u'\ufffd' in position 0: ordinal not in range(128)
> 
>  Meh, Python2 unicode handling always confuses the hell out of me...
> 
>  So, to do it well, in python3 you need to do:
> print(b'\xc5\x93\xff'.decode(sys.getfilesystemencoding(),errors='replace'))
> 
> while in python2 the proper thing to do is
> 
> print(b'\xc5\x93\xff'.decode(sys.getfilesystemencoding(), \
> 	errors='replace').encode(sys.getfilesystemencoding(),errors='replace'))
> 
> (sys.getfilesystemencoding() makes sure we use the user's encoding so stuff that
> can be printed gets properly printed).
> 
>  I couldn't find a way to do the right thing both in python2 and python3...

At which point, my proposal is much simpler, and more understandable,
don't you think?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
