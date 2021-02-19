From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 19 Feb 2021 21:34:31 +0100
Subject: [Buildroot] buildroot packages from svn repo fail
In-Reply-To: <5a1ad4cf-f72f-6fc4-da80-7d5c24d45661@xes-inc.com>
References: <AS8PR06MB7686BDC4D80BA193BE5E486384859@AS8PR06MB7686.eurprd06.prod.outlook.com>
 <AS8PR06MB768671E2EF5E7F63A1D6441884859@AS8PR06MB7686.eurprd06.prod.outlook.com>
 <361e9dd7-604b-bf45-e4ce-7b0dc937b06f@xes-inc.com>
 <6abbffd80d7d80062d25b08ed09a3f8c65ac621a.camel@ginzinger.com>
 <5a1ad4cf-f72f-6fc4-da80-7d5c24d45661@xes-inc.com>
Message-ID: <20210219203431.GC2276@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vincent, All,

(sorry for the duplicate, IO forgot to re-add the list in this reply)

On 2021-02-18 21:04 -0600, Vincent Fazio spake thusly:
> The fix may be as simple as:
> 
> diff --git a/support/download/svn b/support/download/svn
> index 839dccaf62..386507ecb5 100755
> --- a/support/download/svn
> +++ b/support/download/svn
> @@ -52,6 +52,9 @@ _svn export ${verbose} "${@}" "'${uri}@${rev}'" "'${basename}'"
>  # last line (svn outputs everything on stdout)
>  date="$( _svn info --show-item last-changed-date "'${uri}@${rev}'" |tail -n 1 )"
> 
> +# Drop sub-second precision to play nice with tar's valid_timespec check
> +date="$(date -d "${date}" -uIseconds)"

This looks nice, but do you know how long 'date' has supported
sub-second precision in the input timestamp?

I think a more robust solution would be to sed-out the sub-second part,
and do that as a single command:

    date="$( _svn info --show-item last-changed-date "'${uri}@${rev}'" \
             |tail -n 1 \
             |sed -r -e 's/\.[[:digit:]]+//'
           )" 

Also, while testing this, I noticed that not all svn version support the
--show-item option. For example, the version I have on my autobuilder
does not support it:

    $ svn --version
    svn, version 1.8.8 (r1568071)
    [...]

    $ svn info --show-item last-changed-date svn://localhost:3690/foo
    svn: invalid option: --show-item

Maybe we should drop it, and revert to sed-ing the required field out
from the whole 'info output... Thoughts?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
