From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 8 Feb 2019 18:25:21 +0100
Subject: [Buildroot] [PATCH 08/19] support/check-uniq-files: decode as
 many strings as possible
In-Reply-To: <11fc1785-c180-a8fc-7a90-46d487218b7c@mind.be>
References: <cover.1546898693.git.yann.morin.1998@free.fr>
 <fcf8eccf9d275bd95c7e61099722c1a3b22a6da9.1546898693.git.yann.morin.1998@free.fr>
 <11fc1785-c180-a8fc-7a90-46d487218b7c@mind.be>
Message-ID: <20190208172521.GC3079@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2019-02-08 00:40 +0100, Arnout Vandecappelle spake thusly:
> On 07/01/2019 23:05, Yann E. MORIN wrote:
> > +# If possible, try to decode the binary string s with the user's locale.
> > +# If s contains characters that can't be decoded with that locale, return
> > +# the representation (in the user's locale) of the un-decoded string.
> > +def str_decode(s):
> > +    try:
> > +        return s.decode()
> > +    except UnicodeDecodeError:
> > +        return repr(s)
> 
>  I think s.decode(errors='replace') is exactly what we want: it prints the
> question mark character for things that can't be represented, just like ls does.

In the case I used as example, i.e. ? (LATIN SMALL LIGATURE OE) as encoded
in iso8859-15, i.e. \xbd (e.g. stored in a file named 'meh'), with python
2.7:

    >>> with open('meh', 'rb') as f:
    ...    lines = f.readlines()
    ...
    >>> lines
    ['\xbd\n']
    >>> lines[0].decode(errors='replace')
    u'\ufffd\n'
    >>> print('{}'.format(lines[0].decode(errors='replace')))
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
    UnicodeEncodeError: 'ascii' codec can't encode character u'\ufffd' in position 0: ordinal not in range(128)
    >>>

The output with python3 is indeed what you believe will happen, but I
don't think it is so nice:

    >>> lines
    [b'\xbd\n']
    >>> lines[0].decode(errors='replace')
    '?\n'
    >>> print('{}'.format(lines[0].decode(errors='replace')))
    ?

    >>> 

And anyway, check-uniq file should work with python 2.7, since it is part
of the build tools, and python 2.7 is what we require.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
