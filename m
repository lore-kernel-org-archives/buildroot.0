From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 13 Jan 2014 15:22:44 +0100
Subject: [Buildroot] [PATCH 3/6] pkg-infra: git helper creates an empty
 archive if PKG_VERSION is a missing hash
In-Reply-To: <b528cb41d4ac90bbccf471a88485b249eabfdc82.1389569992.git.yann.morin.1998@free.fr>
References: <cover.1389569992.git.yann.morin.1998@free.fr>
 <b528cb41d4ac90bbccf471a88485b249eabfdc82.1389569992.git.yann.morin.1998@free.fr>
Message-ID: <52D3F6B4.8000702@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> If the PKG_VERSION is a sha1 that does not exist in the repository, the git
> helper just creates an empty archive instead of failing and erroring out.
>
> This is because of the way we create the archive:
>      git archive ${cset} |gzip -c >"${archive}"
>
> In this construct, git does exit with a non-zero exit-code, but gzip does not,
> as it was successful in creating the archive (from an empty output, but gzip
> does not mind that).
>
> Since a pipe exits with the exit-code of the right-most simple command (see
> POSIX.1-2008), the pipe above exits with gzip's exit-code. And we miss the
> error altogether.
>
> This is most harmful, in that the error may not occur until much later, when
> we try to configure the package, with the error message buried deep down
> ipotentially thousands of lines above... :-(

s/ipotentially/potentially/

>
> Fix that by checking that the hash (or whatever treeish we've been passed, for
> that matters) does indeed exist in the repository, before we even attempt to
> create the archive.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Acked-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca
