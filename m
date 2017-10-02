From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 2 Oct 2017 07:32:32 +0200
Subject: [Buildroot] [PATCH 1/2] support/run-tests: move packages tests
 to packages directories
In-Reply-To: <59d18e5bc90a4_6a703fce129871805518f@ultri3.mail>
References: <20170917075223.GC2930@scaer>
 <59d18e5bc90a4_6a703fce129871805518f@ultri3.mail>
Message-ID: <20171002053232.GA4753@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo, All,

On 2017-10-01 21:54 -0300, Ricardo Martincoski spake thusly:
> On Sun, Sep 17, 2017 at 04:52 AM, Yann E. MORIN wrote:
> > On 2017-09-17 09:18 +0200, Yann E. MORIN spake thusly:
> >> On 2017-09-17 02:20 -0300, Ricardo Martincoski spake thusly:
> >> > On Sat, Sep 16, 2017 at 05:38 PM, Yann E. MORIN wrote:
> > [--SNIP--]
> >> > > +        package = os.path.basename(dir)
> >> > > +        for file in files:
> >> > 
> >> > You can import fnmatch to drastically reduce the number of regex compilations:
> >> >         for file in fnmatch.filter(files, '*.py'):
> >> Wee! :-)
> > 
> > In fact, no. At least, not in this state, because we do not want to
> > match _any_ .py file; instead, we want to match only .py files that are
> > named after the package.
> 
> We could use 2 filters. Instead of 8k+ regex compilations (one for each file
> inside a package directory) we would run 2k+ fnmatch.filter (that probably
> compile one regex, one per directory) and one regex compilation for each test
> file in the package tree.
> 
>          for file in fnmatch.filter(files, '*.py'):
>              if re.match("^{}.py$".format(package),file):

Err... I already changed it to:

    for file in fnmatch.filter(files, '{}.py'.format(package)):

Is there something wrong with that? ;-)

> But well... the default python interpreter has a cache for regex (I don't know
> its internals, just that it exists) and perhaps the change I suggested won't
> make any difference in performance.
> 
> > 
> > But I guess I can make it to work with fnmatch nonetheless. ;-)
> 
> BTW, could you change the DEVELOPERS file in the same patch?
> +F:     package/*/*.py
>  F:     support/testing/

You meant, add it to your entry ?

In fact, I would expect to assign the test files to the corresponding
package custodian (now imp[licit by their location).

But yes, I can assign them to you as well.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
