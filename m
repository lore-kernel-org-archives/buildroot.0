From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 16 Feb 2017 18:41:24 +0100
Subject: [Buildroot] [PATCH v3 2/5] package: add generic support for lz
 archives
In-Reply-To: <83572997-616f-8bec-fadb-0a59bbf847ed@mind.be>
References: <0f0805c9d18137c555b446d6b6e7dd2c68d6e770.1486930542.git.baruch@tkos.co.il>
 <1e78e6f82883e4ba95766459a39cbd2d49934152.1486930542.git.baruch@tkos.co.il>
 <20170215221520.41e4c66e@free-electrons.com>
 <83572997-616f-8bec-fadb-0a59bbf847ed@mind.be>
Message-ID: <20170216174124.GB4986@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2017-02-15 23:48 +0100, Arnout Vandecappelle spake thusly:
> On 15-02-17 22:15, Thomas Petazzoni wrote:
> > On Sun, 12 Feb 2017 22:15:39 +0200, Baruch Siach wrote:
[--SNIP--]
> > Since there is already the exact same pattern for XZCAT, I decided to
> > apply your patch anyway. I also don't really understand the use case
> > for all those BR2_ZCAT, BR2_BZCAT, BR2_XZCAT, etc. config options.
> > Peter, maybe you can shed some light on why we have these?
> 
>  As I understand it, these options are provided in case you have an old build
> host and have locally installed these tools in e.g. your homedir. However, I
> wouldn't mind getting rid of these options completely, and instead require that
> they are in PATH.
> 
>  True, they could also be used to pass alternative options to the extractors,
> but I don't see much point of that. Or they could be used to call it in an
> alternative form, e.g. "zcat" instead of "gzip -d -c", or "busybox gzip -d -c".
> But I also don't see much point of that.

Actually, there is a use-case for being able to specify some of those,
at least the downloaders: git, wget, svn, scp...

I use a script that is called in lieue of each downloader:

    BR2_WGET="/path/to/wrapper wget --passive-ftp -nd -t 3"
    BR2_GIT="/path/to/wrapper git"
    and so on...

That script is responsible for memorising, for each package, whether it
was downloaded from the primary mirror, the official site, or the backup
mirror, then acts according to where the package was downloaded:

  - from the primary mirror, nothing is done,

  - from the official site: it sends the archive to the primary mirror,
    and add it to a report,

  - from the backup site: it sends the archive to the primary mirror,
    and adds it to a report.

This is done by a Jenkins job, which gets both reports as the result. If
any of the reports is non-empty, the build is marked failed.

This allows us to:

  - automatically track new dependencies added by Joe Random Developer,
    especially transitive dependencies he might not be aware of,

  - automatically feed our local mirror so we are not dependent on
    upstream or s.b.o.

So, I would argue in favour of keeping the possibility to override at
least the downloaders.

For the (de)compressors, not so much though.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
