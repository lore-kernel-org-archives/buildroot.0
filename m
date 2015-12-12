From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Dec 2015 17:01:02 +0100
Subject: [Buildroot] [PATCH] support/download: protect from custom
 commands with spaces in args
In-Reply-To: <1449480415-10043-1-git-send-email-yann.morin.1998@free.fr>
References: <1449480415-10043-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20151212170102.17c6b21a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Mon,  7 Dec 2015 10:26:55 +0100, Yann E. MORIN wrote:
> Some users may provide custom download commands with spaces in their
> arguments, like so:
>     BR2_HG="hg --config foo.bar='some space-separated value'"
> 
> However, the way we currently call those commands does not account
> for the extra quotes, and each space-separated part of the command is
> interpreted as separate arguments.
> 
> Fix that by calling 'eval' on the commands.
> 
> Because of the eval, we must further quote our own arguments, to avoid
> the eval further splitting them in case there are spaces (even though
> we do not support paths with spaces, better be clean from the onset to
> avoid breakage in the future).
> 
> We change all the wrappers to use a wrapper-function, even those with
> a single call, so they all look alike.
> 
> Note that we do not single-quote some of the variables, like ${verbose}
> because it can be empty and we really do not want to generate an
> empty-string argument. That's not a problem, as ${verbose} would not
> normally contain space-separated values (it could get set to something
> like '-q -v' but in that case we'd still want two arguments, so that's
> fine).
> 
> Reported-by: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> ---
>  support/download/bzr  |  8 +++++++-
>  support/download/cp   |  8 +++++++-
>  support/download/cvs  | 10 ++++++++--
>  support/download/git  | 14 ++++++++++----
>  support/download/hg   | 14 ++++++++++----
>  support/download/scp  |  8 +++++++-
>  support/download/svn  |  8 +++++++-
>  support/download/wget |  8 +++++++-
>  8 files changed, 63 insertions(+), 15 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
