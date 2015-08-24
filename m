From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 Aug 2015 17:32:34 +0200
Subject: [Buildroot] [PATCH] package/dropbear: fix when readlink is
	busybox'
In-Reply-To: <87pp2czptc.fsf@dell.be.48ers.dk>
References: <1439925953-5345-1-git-send-email-yann.morin.1998@free.fr>
 <87pp2czptc.fsf@dell.be.48ers.dk>
Message-ID: <20150824153234.GA3619@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2015-08-24 17:09 +0200, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>  > Busybox' "readlink -f" does not canonicalise paths when the target is
>  > missing, while coreutils do.
> 
>  > Fix that by:
>  >   - making an absolute symlink
>  >   - dropping "-f" when calling readlink
> 
>  > Fixes #8276.
> 
> Committed, thanks.
> 
>  > --- a/package/dropbear/S50dropbear
>  > +++ b/package/dropbear/S50dropbear
>  > @@ -18,7 +18,7 @@ start() {
>  >  	#   - the filesystem is RW (i.e. we can rm the symlink),
>  >  	#     replace the symlink with an actual directory
>  >  	if [ -L /etc/dropbear \
>  > -	     -a "$(readlink -f /etc/dropbear)" = "/var/run/dropbear" ]
>  > +	     -a "$(readlink /etc/dropbear)" = "/var/run/dropbear" ]
>  >  	then
>  >  		if rm -f /etc/dropbear; then
>  >  			mkdir -p /etc/dropbear
> 
> Looking at the recent changes to S50dropbear, isn't it quite noisy with
> a RO rootfs? I would imagine those rm and mkdir calls complain with
> RO. Perhaps we should add 2>/dev/null to them?

Well, on a RO filesystem, we'd create /var/run/dropbear on each boot,
and thus regenerate keys on each boot. This means keys from such a
device can not really be trusted.

So I'd prefer we get the error messages, as a clue to the user that
something is wrong. Maybe we could have had an explicit message, yes.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
