From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 19 Dec 2015 15:25:09 +0100
Subject: [Buildroot] [PATCH v2 2/3] package/cal3d: new package
In-Reply-To: <20151219150027.72263718@free-electrons.com>
References: <1446915053-13783-1-git-send-email-bernd.kuhls@t-online.de>
 <1446915053-13783-3-git-send-email-bernd.kuhls@t-online.de>
 <20151219150027.72263718@free-electrons.com>
Message-ID: <20151219142509.GA3394@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-12-19 15:00 +0100, Thomas Petazzoni spake thusly:
> On Sat,  7 Nov 2015 17:50:52 +0100, Bernd Kuhls wrote:
> > This package only provides a git submodule for the vsxu package.
> > 
> > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> 
> I don't really like the interaction between this package and the vsxu
> package, but I don't really have a better proposal to be honest.
> 
> Yann, Peter, Arnout, do you have some suggestions on how to handle such
> git submodule cases?

I really don't know what to do with git-submodules.

But in this precise case, I would:
  - dump the cal3d package
  - add a post-download hook (or an extra-download URL) to vsxu to also
    download cal3d
  - add a post-extract hook to vsxu to also extract cal3d in the correct
    location.

Then, when/if cal3d is later used by other packages, we can revisit the
situation.

Otherwise, for proper git-submodule handling, we would have to do
(roughly):

    git clone blabla pkg-version
    cd pkg-version
    git checkout pkg-version
    git submodule update --init --recursive
    find . -name .git -exec rm -rf {} +
    cd ..
    tar czf DL_DIR/pkg-version.tar.gz pkg-version/

This is not very complex, but is stil la significant change from our
current git wrapper.

And then, what about svn externals? About Hg subrepos? Does bzr also
have such a thing?

Note that I would not really mind doing such a change. But is it worth
it, given that we currently have only one package that needs submodules?
Or do we have others for which we had to "deal with it" in a crude way?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
