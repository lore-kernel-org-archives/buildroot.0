From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 11 Dec 2015 11:06:44 +0100
Subject: [Buildroot] [PATCH] support/download: protect from custom
 commands with spaces in args
In-Reply-To: <1449480415-10043-1-git-send-email-yann.morin.1998@free.fr>
References: <1449480415-10043-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <CAAXf6LUYqaH6OMsmj7PMYfHW=KfGQoPGnwnUT9wBaAnuHgrg3w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Dec 7, 2015 at 10:26 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
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

Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Tested-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
[tests: regular hg, wget, scp, git downloads + custom hg with spaces
in command-line]
