From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 26 Jan 2014 21:33:07 +0100
Subject: [Buildroot] [PATCH 1/2] packages infra: add function to get a
	Kconfig option
In-Reply-To: <87wqhm1pg3.fsf@dell.be.48ers.dk>
References: <cover.1390744549.git.yann.morin.1998@free.fr>
 <b68b4ce8c5017701344c6f32a993de7d3e26802b.1390744549.git.yann.morin.1998@free.fr>
 <87wqhm1pg3.fsf@dell.be.48ers.dk>
Message-ID: <20140126203307.GD1752@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2014-01-26 21:02 +0100, Peter Korsgaard spake thusly:
>  > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>  > We so far have no mean to get the value from a Kconfig option from the
>  > .config file of a package (eg. linux, busybox...).
> 
>  > Add a new function that returns the unmangled value of an option.
>  > It expect two arguments:
>  >   - the Kconfig option name (complete, with leading CONFIG if necessary)
>  >   - the .config file to get it from
> 
>  > Note that, if the Kconfig option is a string, the returned value will
>  > contain the leading and trailing double-quotes.
> 
>  > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>  > ---
>  >  package/pkg-utils.mk | 6 ++++++
>  >  1 file changed, 6 insertions(+)
> 
>  > diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
>  > index 851575c..2f70acc 100644
>  > --- a/package/pkg-utils.mk
>  > +++ b/package/pkg-utils.mk
>  > @@ -52,6 +52,12 @@ define KCONFIG_DISABLE_OPT
>  >  	echo "# $(1) is not set" >> $(2)
>  >  endef
>  
>  > +# Note: we do not indent this, since we want to avoid any leading
>  > +# space or tabs when calling this function
>  > +define KCONFIG_GET_OPT
>  > +$(shell sed -e "/\\<$(1)\\>=\\(.*\\)$$/!d; s//\\1/" $(2))
> 
> Should this perhaps use $(SED)?
> 
> Sorry, I'm probably missing something, but I don't right away see why we
> don't just use:
> 
> $(SED) -n 's/^$(1)=//p' $(2)

Oh, I also forgot: we use $(shell ...) because we want to call this from
inside make conditionals, like I did in the followup patch to check if
CONFIG_KERNEL_LZO was set or not.

If we do not use $(shell ...), then the expansion of KCONFIG_GET_OPT is
used, and we'd get something like:

ifeq (sed 'blabla' config-file,y)
...
endif

which is not really of any help, is it? ;-)

(Not usre if your question was about use of $(shell ...) or about the
sed expression itself. I can certinly use your alternate sed expression
if you prefer, of course.)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
