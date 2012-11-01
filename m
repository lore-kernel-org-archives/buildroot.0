From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 1 Nov 2012 17:56:53 +0100
Subject: [Buildroot] [PATCH 2/7] support/scripts: add a script to add a
	new package
In-Reply-To: <5091D7B6.8070703@mind.be>
References: <1347234052-10527-1-git-send-email-yann.morin.1998@free.fr>
 <1347234052-10527-3-git-send-email-yann.morin.1998@free.fr>
 <5091D7B6.8070703@mind.be>
Message-ID: <201211011756.54242.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On Thursday 01 November 2012 Arnout Vandecappelle wrote:
> On 09/10/12 01:40, Yann E. MORIN wrote:
> > --- /dev/null
> > +++ b/docs/manual/adding-packages-script.txt
> > @@ -0,0 +1,41 @@
> > +$ ./support/script/pkg-new
> > +Name of the package: libfoo
> > +
> > +1) none
> > +2) multimedia
> > +3) java
> > +4) x11r7
> > +5) games
> > +Category of your package: 1
> 
>   I would skip this question and always create it in packages/libfoo.  The
> subdirectories are rare, we want to get rid of them, and anyway you can
> easily move the generated directory to a different place after the fact.

OK

> > --- a/docs/manual/adding-packages.txt
> > +++ b/docs/manual/adding-packages.txt
> > @@ -19,4 +19,6 @@ include::adding-packages-handwritten.txt[]
> >
> >   include::adding-packages-gettext.txt[]
> >
> > +include::adding-packages-script.txt[]
> > +
> 
>   I would put this before the rest of adding-packages.

I've poundered this, too, but the script just an /implementation/ of the
documentation, so I think it should go last.

> > --- /dev/null
> > +++ b/support/scripts/pkg-new
> > @@ -0,0 +1,151 @@
> > +#!/bin/bash
> 
>   Does it have to be bash?  Hm, yes, for the arrays...  It would be better
> if we can avoid relying on bash for new functionality.

I'll check if I can make it a POSIX-compliant script.


> > +# --------------------------------------
> > +# Can't use 'cat<<-_EOF_', as Config.in uses leading tabs.
> 
>   I don't think the indented Config.in block is very readable; I'd use a
> plain <<_EOF_ with no extra indentation.  Then you can use cat after all.

Indenting here-documents allows one to easily see the end of it. I
personally have difficulties reading scripts where this is not the case.

> > +# --------------------------------------
> > +# Create the package.mk file
> > +cat>"${pkg_dir}/${pkg_name}.mk"<<-_EOF_
> 
>   Same here, indentation doesn't look natural to me.

Hmmm. Let's ask a neutral party, then! ;-)

> > +	#############################################################
> > +	#
> > +	# ${pkg_name}
> > +	#
> > +	#############################################################
> > +	
> > +	${PKG_NAME}_VERSION       =
> > +	${PKG_NAME}_SOURCE        =
> > +	${PKG_NAME}_SITE          =
> > +	${PKG_NAME}_DEPENDENCIES  =
> > +	${PKG_NAME}_LICENSE       =
> > +	${PKG_NAME}_LICENSE_FILES =
> > +	
> > +_EOF_
> 
>   For autotools-package and cmake-package, _CONF_OPT is also a very useful one.
>   Maybe also add _INSTALL_STAGING.

I think we should fill-in only strictly-required variables.

> > +if [ "${pkg_bs}" = "generic" ]; then
> > +    cat>>"${pkg_dir}/${pkg_name}.mk"<<-_EOF_
> > +		# See docs/manual/ for the complete list of actions that can
> > +		# be defined; only the most common ones are listed below:
> > +		
> > +		define ${PKG_NAME}_CONFIGURE_CMDS
> > +		endef
> > +		
> > +		define ${PKG_NAME}_BUILD_CMDS
> > +		endef
> > +		
> > +		define ${PKG_NAME}_INSTALL_TARGET_CMDS
> 
>   Putting a sample
> 	install -D -m 0644 $(@D)/... $(TARGET_DIR)/...
> isn't a bad idea.

I don't like it. This is just a skeleton file. No default value has been
provided for any variable.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
