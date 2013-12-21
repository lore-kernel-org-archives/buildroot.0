From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Dec 2013 09:39:03 +0100
Subject: [Buildroot] [PATCH] gst-plugins-good: fix typo
 BR2_TOOLCHAIN_HAS_THREAD
In-Reply-To: <20131220224557.GB3484@free.fr>
References: <8ff8a1a8a7d5dfae8a57.1387486943@argentina>
 <20131220095020.565215ee@skate> <20131220224557.GB3484@free.fr>
Message-ID: <20131221093903.22afccf9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Fri, 20 Dec 2013 23:45:57 +0100, Yann E. MORIN wrote:

> > Do you know if there is a way of making kconfig complain loudly if
> > there is a reference to an undefined symbol?
> 
> No, this is not even a warning.
> 
> When Kconfig parsess a 'depends on' line, if the symbol does not exist
> yet, it is added to the list of symbols, in case it is defined later
> on.

Ok.

> But then there is no way to know if a symbol was added because there
> was a corresponding 'config' (or 'menuconfig' or 'choice') entry in
> any of the Config.in files, or because it was added due to it being
> listed in a 'depends on' (or a 'select').

Can't we add this information? When you find a symbol, if it's through
a depends on or a select, you store the symbol, but mark it as
"referenced". When you find a symbol that is really defined through
config/menuconfig/choice, you store the symbol and mark it as
"defined" (or changed from "referenced" to "defined" if the symbol had
already been found). And then, at the end of the parsing, if there are
some remaining symbols marked "referenced", whose state has not been
changed to "defined", you warn about them.

Am I dreaming too much about kconfig ? :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
