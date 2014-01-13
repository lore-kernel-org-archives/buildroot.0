From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Jan 2014 18:50:13 +0100
Subject: [Buildroot] [PATCH 3/6] pkg-infra: git helper creates an empty
 archive if PKG_VERSION is a missing hash
In-Reply-To: <52D3F6B4.8000702@lucaceresoli.net>
References: <cover.1389569992.git.yann.morin.1998@free.fr>
 <b528cb41d4ac90bbccf471a88485b249eabfdc82.1389569992.git.yann.morin.1998@free.fr>
 <52D3F6B4.8000702@lucaceresoli.net>
Message-ID: <20140113175013.GA3344@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca, All,

On 2014-01-13 15:22 +0100, Luca Ceresoli spake thusly:
> Yann E. MORIN wrote:
> >From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >
> >If the PKG_VERSION is a sha1 that does not exist in the repository, the git
> >helper just creates an empty archive instead of failing and erroring out.
> >
> >This is because of the way we create the archive:
> >     git archive ${cset} |gzip -c >"${archive}"
> >
> >In this construct, git does exit with a non-zero exit-code, but gzip does not,
> >as it was successful in creating the archive (from an empty output, but gzip
> >does not mind that).
> >
> >Since a pipe exits with the exit-code of the right-most simple command (see
> >POSIX.1-2008), the pipe above exits with gzip's exit-code. And we miss the
> >error altogether.
> >
> >This is most harmful, in that the error may not occur until much later, when
> >we try to configure the package, with the error message buried deep down
> >ipotentially thousands of lines above... :-(
> 
> s/ipotentially/potentially/

Fixed.

This is where you see that I use vi as my editor! ;-)

> >Fix that by checking that the hash (or whatever treeish we've been passed, for
> >that matters) does indeed exist in the repository, before we even attempt to
> >create the archive.
> >
> >Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Acked-by: Luca Ceresoli <luca@lucaceresoli.net>

Thank you!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
