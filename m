From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 2 Jul 2014 22:25:12 +0200
Subject: [Buildroot] [PATCH 03/14] pkg-infra: move the git download
	helper to a script
In-Reply-To: <87fvijbx17.fsf@dell.be.48ers.dk>
References: <cover.1404167061.git.yann.morin.1998@free.fr>
 <c270e9e49dbc69c08629893f7c5e8fa952e37da7.1404167061.git.yann.morin.1998@free.fr>
 <87fvijbx17.fsf@dell.be.48ers.dk>
Message-ID: <20140702202512.GA9383@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2014-07-02 17:28 +0200, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>  > The git download helper is getting a bit more complex. Fixing it in the
>  > Makefile when it breaks (like the recent breakage with a non-existing
>  > sha1-cset) proves to be challenging, to say the least.
> 
>  > Move it into a shell script in support/download/git, which will make
>  > it much easier to read, maintain, fix and enhance in the future.
> 
>  > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>  > Cc: Peter Korsgaard <jacmet@uclibc.org>
>  > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>  > Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
>  > Cc: Arnout Vandecappelle <arnout@mind.be>
>  > Reviewed-by: Samuel Martin <s.martin49@gmail.com>
>  > Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
> Thanks. I've verified that the (non-gzip'ed) tarball is identical to
> what we had before, but I noticed that we no longer delete the temporary
> repo in DL_DIR.
> 
> Did you do that change on purpose? I don't think we want to keep it, do
> we?

For sure, that's not on-purpose.

Now, I fail to see how the remporary repository would linger after a
successfull download. Here's what the script does:

    repodir="${BR2_DL_DIR}/${basename}"

    if [ -n "$(${GIT} ls-remote "${repo}" "${cset}" 2>&1)" ]; then
        printf "Doing shallow clone\n"
        ${GIT} clone --depth 1 -b "${cset}" --bare "${repo}" "${repodir}"
    else
        printf "Doing full clone\n"
        ${GIT} clone --bare "${repo}" "${repodir}"
    fi

    pushd "${repodir}"
    ${GIT} archive --prefix="${basename}/" -o "${output}.tmp" --format=tar
    "${cset}"
    gzip -c "${output}.tmp" >"${output}"
    rm -f "${output}.tmp"
    popd

    rm -rf "${repodir}"

So, unless there is something I'm missing, the last statement should get
rid of the temp repo...

Lemme try...

Nope, the repository is properly removed here:

    $ make libllcp-source
    [--SNIP--]
    >>> libllcp cf0c4b3c9df98851c6092c130192130c3f5a46bd Downloading
    Doing full clone
    Cloning into bare repository '/home/ymorin/dev/buildroot/O/test-dl/libllcp-cf0c4b3c9df98851c6092c130192130c3f5a46bd'...
    remote: Counting objects: 1202, done.
    Receiving objects: 100% (1202/1202), 267.40 KiB | 145.00 KiB/s, done.
    Resolving deltas: 100% (812/812), done.
    Checking connectivity... done.
    ~/dev/buildroot/O/test-dl/libllcp-cf0c4b3c9df98851c6092c130192130c3f5a46bd ~/dev/buildroot/buildroot
    ~/dev/buildroot/buildroot

    $ ls -l /home/ymorin/dev/buildroot/O/test-dl/
    -rw-rw-r-- 1 ymorin ymorin 52K Jul  2 22:23 libllcp-cf0c4b3c9df98851c6092c130192130c3f5a46bd.tar.gz

So, no lingering clone...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
