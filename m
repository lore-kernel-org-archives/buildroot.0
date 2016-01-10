From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 10 Jan 2016 19:58:23 +0100
Subject: [Buildroot] [PATCH] [RFC] DO NOT APPLY Remove usr/ component
 from HOST_DIR
In-Reply-To: <1444914910-5370-1-git-send-email-arnout@mind.be>
References: <1444914910-5370-1-git-send-email-arnout@mind.be>
Message-ID: <20160110185823.GB9022@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-10-15 15:15 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> We currently use $(HOST_DIR)/usr as the prefix for host packages. That
> has a few disadvantages:
> 
> - There are some things installed in $(HOST_DIR)/etc and
>   $(HOST_DIR)/sbin, which is inconsistent.
> 
> - To pack a buildroot-built toolchain into a tarball for use as an
>   external toolchain, you have to pack output/host/usr instead of the
>   more obvious output/host.
> 
> - Because of the above, the internal toolchain wrapper breaks which
>   forces us to work around it (call the actual toolchain executable
>   directly). This is OK for us, but when used in another build system,
>   that's a problem.
> 
> - Paths are four characters longer.
> 
> This patch replaces all occurences of 'host/usr' (in its various forms)
> with 'host', and updates relative paths accordingly.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> I did not review the change or test it beyond just building busybox
> with an internal and external toolchain. Hence the RFC status.
> I still added my Sob in case anyone wants to take over (you know how
> long it takes me to actually finish anything :-)
> 
> As an example of why more verification is needed: the genromfs package
> was using PREFIX together with the default /usr prefix, so the
> automatic replacement missed that occurence.
> 
> It would be possible to submit this as separate patches (though
> obviously that's more work, since you have to make sure that the
> dependencies are done right, e.g. when moving python then everything
> that calls python should also move). Would this be useful?

Well, we could it step byt step, adding a symlink host/usr -> . so that
we have things available from both locations.

Then we can fix packages one by one, until there's no more offenders.

However, I think we should ultimately keep the host/usr symlinks, if at
least to provide backward compatibility with external packages (like
br2-external).

We can later remove the symlink and add a post-install step-hook (those
you do not like that much! ;-) ) to check if any package creates /usr
and warn users.

Iltimately, in a few years, we can turn that warnoing into an actual
error.

What do you think of that?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
