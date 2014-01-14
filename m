From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 14 Jan 2014 23:49:23 +0100
Subject: [Buildroot] [PATCH 2/6] pkg-infra: move git download helper to
 a script
In-Reply-To: <52D5A070.5040800@mind.be>
References: <cover.1389569992.git.yann.morin.1998@free.fr>
 <add407fe211f2032f76fda6442b06b7d8a3af2cc.1389569992.git.yann.morin.1998@free.fr>
 <52D5A070.5040800@mind.be>
Message-ID: <20140114224923.GI3328@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2014-01-14 21:39 +0100, Arnout Vandecappelle spake thusly:
> On 13/01/14 00:44, Yann E. MORIN wrote:
> >From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >
> >The git download helper is getting a bit more complex, and does not
> >raise an error when a PKG_VERSION is a sha1 that does not exist in
> >the repository. Instead, it generates an empty archive.
> >
> >Fixing it in the Makefile proves to be challenging, to say the least.
> >
> >Move it into a shell script in support/download/git, which will make
> >it much easier to read, maintain, fix an enhance in the future.
> 
>  This patch contains a few more changes than just moving it to a script.
> These should ideally be done in separate patches.

Doh. You're right. I already fixed some, but I missed quite a few.
Sigh...

> [snip]
> >diff --git a/support/download/git b/support/download/git
> >new file mode 100755
> >index 0000000..99ea1b2
> >--- /dev/null
> >+++ b/support/download/git
[--SNIP--]
> >+pushd "${BUILD_DIR}" >/dev/null
> 
>  This used to be DL_DIR.

I do not like to treat DL_DIR as a scratch area, hence the use of
BUIL_DIR isntead.

>  Note that I agree that BUILD_DIR is more appropriate.

I'll do the change in a spearate patch.

>  Although the original indeed does a pushd, this is quite redundant when
> it's done in a script. So I'd directly make it a simple cd (without
> redirection).

I'll simplify this.

> >+rm -rf .git-tmp-repo    # In case a previous attempt was interrupted
> >+
> >+if [ -n "$(${GIT} ls-remote "${repo}" "${cset}" 2>&1)" ]; then
> >+    printf "Doing shallow clone\n"
> >+    ${GIT} clone --depth 1 -b "${cset}" --bare "${repo}" .git-tmp-repo
> 
>  It used to be extracted into $($(PKG)_BASE_NAME). That has the advantage
> that it is unique, which makes it possible to do multiple downloads in
> parallel (which I sometimes do BTW, by manually starting downloads in
> separate shells).

No problem, since we're now using BUILD_DIR, not DL_DIR. ;-)

>  But even better would be $($(PKG)_BASE_NAME).git-tmp-repo :-)

OK.

> >+else
> >+    printf "Doing full clone\n"
> >+    ${GIT} clone --bare "${repo}" .git-tmp-repo
> >+fi
> >+
> >+pushd .git-tmp-repo >/dev/null
> >+${GIT} archive --prefix="${prefix}" --format=tar "${cset}"  \
> >+|gzip -c >"${output}"
> 
>  We have about 20 instances of the | at the end of the line (as was the
> original), and only 4 at the beginning of the line (and two of these were
> done by you...).

Yes, that's my own coding style. I plead guilty! ;-)
Will fix.

>  In the original, the / at the end of the prefix is added explicitly here in
> the call to git archive. I think that makes more sense than adding the / in
> the call itself.

OK, will fix.

Thank you! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
