From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 2 Jul 2014 22:37:48 +0200
Subject: [Buildroot] [PATCH 03/14] pkg-infra: move the git download
 helper to a script
In-Reply-To: <20140702223122.72ccaf58@free-electrons.com>
References: <cover.1404167061.git.yann.morin.1998@free.fr>
 <c270e9e49dbc69c08629893f7c5e8fa952e37da7.1404167061.git.yann.morin.1998@free.fr>
 <87fvijbx17.fsf@dell.be.48ers.dk>
 <20140702174430.3f1377ce@free-electrons.com>
 <CAAXf6LVZrM5ZUkAxvGPRuupq3f6_jWU+V6e=0-11UVd9XA1GKQ@mail.gmail.com>
 <20140702192243.20920b70@free-electrons.com>
 <CAAXf6LVqeyzx3oq7croUX+x0U7YeBBhmF5LSYCXyYX9+7M9RNw@mail.gmail.com>
 <20140702223122.72ccaf58@free-electrons.com>
Message-ID: <20140702203748.GC9383@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas?, All,

On 2014-07-02 22:31 +0200, Thomas Petazzoni spake thusly:
> On Wed, 2 Jul 2014 19:31:08 +0200, Thomas De Schampheleire wrote:
> > > Ah, ok, thanks for the clarification. However that doesn't explain why
> > > the temporary repo in $(DL_DIR) is not being removed. That's a
> > > regression compared to the original code in the .mk file, no?
> > 
> > Patch 11 does:
> > 
> > -rm -rf "${repodir}"
> > +rm -rf "${repodir}" "${tmp_tar}" "${tmp_output}"
> > +exit ${ret}
> > 
> > and
> > 
> > -repodir="${BR2_DL_DIR}/${basename}"
> > +repodir="${basename}.tmp-git-checkout"
> > +tmp_tar="$( mktemp "${BUILD_DIR}/.XXXXXX" )"
> > +tmp_output="$( mktemp "${output}.XXXXXX" )"
> > 
> > So from the code (haven't verified this now) there is no repo at all
> > in DL_DIR, so that repo does not need to be removed. The repo $repodir
> > _is_ removed, including all of the other temporary stuff tmp_tar and
> > tmp_output.
> > 
> > Peter, did you test this with all patches applied?
> 
> I think what Peter complains about is that with just PATCH 03/14
> applied, the Git download method no longer works properly as it leaves
> the repo in $(DL_DIR).
> 
> The fact that this problem may or may not get solved by a later patch
> in the series is more-or-less irrelevant here:

Agreed. If that patch changes the behaviour, it is incorrect.

> Peter is just saying
> that the series is not perfectly bisectable, and he stopped reviewing
> when he saw an issue in PATCH 03/14.

And I do not see this issue...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
