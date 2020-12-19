From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 19 Dec 2020 21:29:21 +0100
Subject: [Buildroot] [PATCH v2 04/12]
 support/download/post-process-helpers: add helper function for post process
 scripts
In-Reply-To: <20201219173933.GJ3188@scaer>
References: <20201219153525.1361175-1-thomas.petazzoni@bootlin.com>
 <20201219153525.1361175-5-thomas.petazzoni@bootlin.com>
 <20201219173933.GJ3188@scaer>
Message-ID: <20201219202921.GK3188@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

A few mre tweaks I forgot about...

On 2020-12-19 18:39 +0100, Yann E. MORIN spake thusly:
> On 2020-12-19 16:35 +0100, Thomas Petazzoni spake thusly:
[--SNIP--]
> > +        mkdir ${dest}

Using 'mkdir -p' would ensure that parent direcotries are created as
needed.

> 
>     one_file="$(find "${dest}" -type f |head -n1)"

Of course, the output should be sorted in the C locale, to ensure the
same file is always used as reference (and hence a better name for that
file):

    local ref_file
    ref_file="$(find "${dest}" -type f |LC_ALL=C sort |head -n1)"
    touch -r "${ref_file}" "${dest}.timestamp"

[--SNIP--]
> > +        # let's use a fixed hardcoded date to be reproducible
> > +        date="2020-02-06 01:02:03 +0000"
> Assuming that unpack's dest and repack's src are pointing to the same
> directory:
>         date="$(stat -c "${src}.timestamp")"

Meh.. I forgot the actual format:

    date="$(stat -c '%y' "${src}.timestamp")"

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
