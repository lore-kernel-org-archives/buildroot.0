From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 Aug 2015 17:43:08 +0200
Subject: [Buildroot] [PATCH] package/dropbear: fix when readlink is
	busybox'
In-Reply-To: <878u90zogg.fsf@dell.be.48ers.dk>
References: <1439925953-5345-1-git-send-email-yann.morin.1998@free.fr>
 <87pp2czptc.fsf@dell.be.48ers.dk> <20150824153234.GA3619@free.fr>
 <878u90zogg.fsf@dell.be.48ers.dk>
Message-ID: <20150824154308.GE3619@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2015-08-24 17:38 +0200, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
> Hi,
> 
> >> Looking at the recent changes to S50dropbear, isn't it quite noisy with
>  >> a RO rootfs? I would imagine those rm and mkdir calls complain with
>  >> RO. Perhaps we should add 2>/dev/null to them?
> 
>  > Well, on a RO filesystem, we'd create /var/run/dropbear on each boot,
>  > and thus regenerate keys on each boot. This means keys from such a
>  > device can not really be trusted.
> 
> Well, with a RO filesystem you only have the option to either generate
> at each boot or bake in a hardcoded host key in the rootfs. Neither is
> really great for security.

Or, as some are doing (Paul for example), have /etc/dropbear point to a
R/W location (e.g. a persistent FS done at first boot) and have the
symlink overwritten by an overlay to point to that location.

Which is anyway something sane to do in most case of a R/O FS.

>  > So I'd prefer we get the error messages, as a clue to the user that
>  > something is wrong. Maybe we could have had an explicit message, yes.
> 
> Those fairly obscure messages are imho not really helpful - But on the
> other hand I'm not sure a dedicated message is really warranted.

Maybe something along the lines of;

    I have no persistent location to store SSH host keys.
    I will generate new ones on each boot.
    Are you sure that's what you wanted to do?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
