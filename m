From: john <john.osullivan@cloudiumsystems.com>
Date: Fri, 19 Oct 2012 17:41:39 +0100
Subject: [Buildroot] Local SVN respository
In-Reply-To: <5080617F.9000008@mind.be>
References: <1350547544.8368.8.camel@john-ubu> <5080617F.9000008@mind.be>
Message-ID: <1350664899.14081.7.camel@john-ubu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Thank you for your help, in answer to your questions,
The package is already in buildroot, at the moment I have the same
version number and I have created it under the same name. It is selected
in the config and when I do make with debug (-p) on I get:

svn: Syntax error in revision argument '1.0.1'

my svn command is
MYPACKAGE_SITE=svn://myserver/mydir/trunk/mysoftware-1.0.1/

but based on the error message it looks like the svn checkout is failing
because the version number is being based a revision (I'm guessing). Is
there some way of to suppress that action.

regards


On Thu, 2012-10-18 at 22:07 +0200, Arnout Vandecappelle wrote:
> On 18/10/12 10:05, john wrote:
> > I am trying to build a local package from a local svn repository. The
> > software I am building is a heavily hacked version of some open source
> > package. I am trying to retrieve the software from a local svn
> > repository (svn:// and not http) but buildroot keeps fetching the
> > official version of the software rather than my local copy. I have tried
> > various options like _OVERRIDE_SRCDIR but cannot change this behaviour,
> > any suggestions?
> 
>   Is it a package that is already in buildroot or a new one?  If it is
> already in buildroot, do you create MYPACKAGE under the same name or a
> different name?  Did you change the version number from what is in buildroot?
> Is you .mk file even included by buildroot?  Is MYPACKAGE selected in the
> .config?
> 
>   If you want to debug what is happening, use
> 
> make -p mypackage 2&>1 | less
> 
>   That gives you a dump of all the variables and rules defined by the
> Makefiles.  You should see a lot of variables MYPACKAGE_... =
> (if that is not the case, you're missing $(eval $(generic-package))).
> You should see MYPACKAGE_SITE = ... as you defined it.
> You should see mypackage in TARGETS (if not, it's not selected in
> .config).  You should also see rules like:
> 
> mypackage-build: mypackage-configure .../mypackage-1.0.1/.stamp_built
> 
> .../mypackage-1.0.1/.stamp_built:
> # PKG = MYPACKAGE
> #  commands to execute (from `package/pkg-generic.mk', line 107):
>          @$(call MESSAGE,"Building")
>          $($(PKG)_BUILD_CMDS)
>          $(foreach hook,$($(PKG)_POST_BUILD_HOOKS),$(call $(hook))$(sep))
>          $(Q)touch $@
> 
> 
> 
>   Regards,
>   Arnout
> 
