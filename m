From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 Aug 2018 23:29:05 +0200
Subject: [Buildroot] [PATCH 2/7 v4] support/dependencies: check for
 system-provided bison and flex
In-Reply-To: <20180818231758.69bc7209@windsurf>
References: <cover.1534522005.git.yann.morin.1998@free.fr>
 <d9d77c26d35f7ccfe57e53ce930189ec29980e92.1534522005.git.yann.morin.1998@free.fr>
 <20180818231758.69bc7209@windsurf>
Message-ID: <20180818232905.70811759@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 18 Aug 2018 23:17:58 +0200, Thomas Petazzoni wrote:

> This solution (which differs from what we do for other dependencies,
> that are using suitable-host-package) has a drawback: it shows stderr
> on the terminal, despite the 2>/dev/null:
> 
> $ make
> which: no bison in (/usr/local/bin:/usr/bin:/bin:/home/thomas/.rvm/bin:/usr/local/sbin:/usr/sbin:/home/thomas/.rvm/bin:/home/thomas/sys/bin:/home/thomas/.gem/ruby/2.1.0/bin:/home/thomas/.rvm/bin)
> 
> I'm not sure why this happens.

Wait, wait, scratch that. Even without your patch it does that. This
error is displayed because of:

BISON := $(shell which bison || type -p bison)

in package/Makefile.in. I'm not even sure why we have this definition,
we don't use it anywhere, ditto for the FLEX definition.

So basically your patch looks good, we probably need to remove the
useless lines in package/Makefile.in, as a separate patch.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
