From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 30 Nov 2017 16:34:58 +0100
Subject: [Buildroot] [PATCH 8/8] gitlab-ci: run check-package
In-Reply-To: <20171130085950.0dc9a144@windsurf.home>
References: <cover.1511996903.git.yann.morin.1998@free.fr>
 <b9a9596c19817cf5a70c17acaa23657ed3597f01.1511996903.git.yann.morin.1998@free.fr>
 <20171130085950.0dc9a144@windsurf.home>
Message-ID: <20171130153458.GA3519@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-11-30 08:59 +0100, Thomas Petazzoni spake thusly:
> On Thu, 30 Nov 2017 00:08:45 +0100, Yann E. MORIN wrote:
> > +check-package:
> > +    script:
> > +        - find . -type f -name '*.mk' -exec ./utils/check-package {} +
> 
> Does it run without warning on all .mk files?

As I explained in thecover letter, no. There is a false-positive in
asterisk.

That's why I suggested in the cover-letter not to applu it for now,
until check-pacakge learns about that case.

> In fact, I think we shouldn't limit it to .mk files, because
> check-package can also verify Config.in files and .hash files.

This can be refined later on, probably?

> Perhaps:
>   find package/ boot/ linux/ -type f -exec ./utils/check-package {}

But then it would also catch the patches, the init scripts, and any
other data file that is present in packages directories.

For now, this catches 305+539+264 = 1108 warnings...

So I would at least limit it to Config.in, .mk, .hash, .patch files.

And even that generates 305+566+230 = 1101 warnings.

Regards,
Yann E. MORIN.

PS. Not sure what the split in three numbers is:

  $ find package/ boot/ linux/ -type f \
        \( -name '*.mk' -o -name '*.hash' \
           -o -name '*.patch' -o -name Config.in \
        \) -exec ./utils/check-package {} + 2>&1 \
    |grep 'warnings generated'
    305 warnings generated
    566 warnings generated
    230 warnings generated

> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
