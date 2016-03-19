From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 19 Mar 2016 19:56:59 +0100
Subject: [Buildroot] [PATCH 1/9 v2] core: add the possibility to provide
 help for custom rules
In-Reply-To: <20160319190500.088f883a@free-electrons.com>
References: <cover.1457717002.git.yann.morin.1998@free.fr>
 <e9f41039f5e4b50300a78a45a136cd04cf2c6cfe.1457717002.git.yann.morin.1998@free.fr>
 <20160319190500.088f883a@free-electrons.com>
Message-ID: <20160319185659.GF3426@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-03-19 19:05 +0100, Thomas Petazzoni spake thusly:
> On Fri, 11 Mar 2016 18:41:09 +0100, Yann E. MORIN wrote:
> 
> > diff --git a/Makefile b/Makefile
> > index 98c8dc7..7bb5f6d 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -966,6 +966,7 @@ endif
> >  	@echo '  source-check           - check selected packages for valid download URLs'
> >  	@echo '  external-deps          - list external packages used'
> >  	@echo '  legal-info             - generate info about license compliance'
> > +	@echo '  help-custom            - print help about custom actions (if any)'
> >  	@echo
> >  	@echo '  make V=0|1             - 0 => quiet build (default), 1 => verbose build'
> >  	@echo '  make O=dir             - Locate all output files in "dir", including .config'
> > @@ -974,6 +975,12 @@ endif
> >  	@echo 'it on-line at http://buildroot.org/docs.html'
> >  	@echo
> >  
> > +# This rule does nothing, it is expected to be overloaded by
> > +# a br2-external tree or a local.mk . However, it must exist,
> > +# as we reference it in the main help, above. Making the rule
> > +# .PHONY does not work.
> > +help-custom:
> > +
> 
> There is a pretty important problem with this implementation (which
> gets even worse when PATCH 2 is applied), but I am not sure why it
> happens: the custom help is not taken into account if you don't have a
> configuration file defined. This is weird, because BR2_EXTERNAL_FILE
> gets included outside of the BR2_HAVE_DOT_CONFIG condition. But still:
> 
> thomas at skate:~/projets/buildroot (master)$ cat /tmp/external/external.mk 
> help-custom:
> 	@echo TEST
> thomas at skate:~/projets/buildroot (master)$ make BR2_EXTERNAL=/tmp/external help-custom
> make[1]: Nothing to be done for 'help-custom'.
> 
> And then, if I create a .config file:
> 
> thomas at skate:~/projets/buildroot (master)$ make defconfig
> [...]
> thomas at skate:~/projets/buildroot (master)$ make BR2_EXTERNAL=/tmp/external help-custom
> TEST
> 
> This is not expected, since the help text is supposed to be available
> even when no configuration has been defined.

Indeed, that's bad.

However, the proposal by J?r?me has exactly the same problem.

I'll look at it. Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
