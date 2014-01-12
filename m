From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Jan 2014 21:09:37 +0100
Subject: [Buildroot] [PATCH v3] ca-certificates: new package
In-Reply-To: <8738kt3t5f.fsf@dell.be.48ers.dk>
References: <1389368384-1332-1-git-send-email-martin@barkynet.com>
 <20140111234853.GE3391@free.fr> <87zjn14mtn.fsf@dell.be.48ers.dk>
 <20140112112743.GA3374@free.fr> <87bnzh3vqy.fsf@dell.be.48ers.dk>
 <20140112183442.GB3374@free.fr> <8738kt3t5f.fsf@dell.be.48ers.dk>
Message-ID: <20140112200937.GC3374@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2014-01-12 20:19 +0100, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>  >> > I guess there's no point in adding such a check for git, svn and all
[--SNIP--]
>  > For a VCS, maybe the list of files and their respective contents are OK,
>  > but we can't say anything about the generated archive.
> 
> True. If we implement it like _LICENSE, we can probably just not add
> those tags for packages using git/hg/svn/..

I've already started implementing that, and it looks like we have a
problem.

The problem is that some packages have more than one download:
  - the tarball itself
  - optional patches, by way of PKG_PATCH
  - additional files, by way of PKG_EXTRA_DOWNLOADS

So, if we want to implement it at all, we have to provide the check for
those other downloads too. And a variable is not enough.

Another solution would be to annotate each file with its hash, someting
like:
    foo-1.2.3.patch:ABCDEF1234567890 bla.patch:ABCDEF1234567890 \
    file.bin:ABCDEF1234567890

This is ugly, and very convenient either.

An third alternative is to add a package/pkg/pkg.hash file, which
contains the list of files, and their hashes; in fact, the output of the
hash util we'd use:
    ABCDEF1234567890  foo-1.2.3.patch
    ABCDEF1234567890  bla.patch
    ABCDEF1234567890  file.bin

So, it indeed adds a third file to the existing pkg.mk and Config.in,
but it looks like it is the cleanest solution to me, and the one I've
started implementing.

Also, we'd have to settle for a hash function. md5 is outdated and
subject to attacks; sha1 is still current, but there are known potential
attacks; sha2/256 is still very strong for the foreseeable future;
sha2/512 seems like a bit overkill, although the time to hash is not
very different between sha2/256 and sha2/512.

This can be very easily changed, so I've settled for sha2/256 for now.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
