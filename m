From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 19 Jul 2013 18:13:15 +0200
Subject: [Buildroot] [PATCHv2 4/4] toolchain: instrument external
	toolchain wrapper
In-Reply-To: <871u6vvz2h.fsf@dell.be.48ers.dk>
References: <574ef0eb7e941dcc6c9dba3540f4aa1c213472bc.1374182572.git.yann.morin.1998@free.fr>
 <1374184490-13855-1-git-send-email-yann.morin.1998@free.fr>
 <871u6vvz2h.fsf@dell.be.48ers.dk>
Message-ID: <20130719161315.GA3751@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2013-07-19 08:33 +0200, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>  Yann> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>  Yann> If BR_DEBUG_WRAPPER is set in the envirnment, dump the actual command
>  Yann> being exec()uted, to ease debugging issues with the wrapper.
> 
>  Yann> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>  Yann> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
>  Yann> ---
>  Yann> Changes v1 -> v2:
>  Yann>   - style fixes (Thomas)
>  Yann> ---
>  Yann>  toolchain/toolchain-external/ext-toolchain-wrapper.c | 8 ++++++++
>  Yann>  1 file changed, 8 insertions(+)
> 
>  Yann> diff --git a/toolchain/toolchain-external/ext-toolchain-wrapper.c b/toolchain/toolchain-external/ext-toolchain-wrapper.c
>  Yann> index 460f255..8e56414 100644
>  Yann> --- a/toolchain/toolchain-external/ext-toolchain-wrapper.c
>  Yann> +++ b/toolchain/toolchain-external/ext-toolchain-wrapper.c
>  Yann> @@ -136,6 +136,14 @@ int main(int argc, char **argv)
>  Yann>  	/* finish with NULL termination */
>  Yann>  	*cur = NULL;
>  
>  Yann> +	if( getenv("BR_DEBUG_WRAPPER") ) {
>  Yann> +		fprintf( stderr, "path='%s'\n", path );
>  Yann> +		int i;
>  Yann> +		for( i=0; args[i]; i++ ) {
>  Yann> +			fprintf(stderr, "argv[%d]='%s'\n", i, args[i] );
>  Yann> +		}
>  Yann> +	}
>  Yann> +
> 
> That's still not really the code style used elsewhere in this file.

Doh. What happenned? I've just looked at my tree here, adn the style
fixes are applied.

OK. All sorted. I did 'git commit --amend'. I should forgot to pass '-a'
also (or run 'git add' first).

Doh, too bad. Sorry for the inconvenience... :-(

> You could argue that this feature isn't really needed as you can just
> run 'strace -s 1000 -e execve <wrapper>' for basically the same
> information, but OK - This is perhaps a bit more user friendly.

My use-case was to see how the kernel build-system was calling the
wrapper. So I just ran:
    BR_DEBUG_WRAPPER=1 make
in my Buildroot build dir.

> With that in mind, I think a more sensible output format is something
> you can directly cut'n'paste and execute in the shell (after perhaps
> tweaking something), so I've changed it to simply print the args space
> seperated like this:

Yet, one of the motivation behind the \n-separated args was to easily
see the args, without having to 'parse' the command line with the eyes.

The Linux kernel is passing something like 40+ args to the wrapper, so
the line is getting rather long, and difficult to grok visually, while
the one-arg per line output made it very easy.

But OK, that's sane, too.

> Committed with these changes, thanks.

Again, sorry for the inconvenience. :-(

I already owed you one ${BEVERAGE} in Edimburgh; you can make that two,
now! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
