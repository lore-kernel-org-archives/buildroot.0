From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 18 Oct 2012 22:07:27 +0200
Subject: [Buildroot] Local SVN respository
In-Reply-To: <1350547544.8368.8.camel@john-ubu>
References: <1350547544.8368.8.camel@john-ubu>
Message-ID: <5080617F.9000008@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/10/12 10:05, john wrote:
> I am trying to build a local package from a local svn repository. The
> software I am building is a heavily hacked version of some open source
> package. I am trying to retrieve the software from a local svn
> repository (svn:// and not http) but buildroot keeps fetching the
> official version of the software rather than my local copy. I have tried
> various options like _OVERRIDE_SRCDIR but cannot change this behaviour,
> any suggestions?

  Is it a package that is already in buildroot or a new one?  If it is
already in buildroot, do you create MYPACKAGE under the same name or a
different name?  Did you change the version number from what is in buildroot?
Is you .mk file even included by buildroot?  Is MYPACKAGE selected in the
.config?

  If you want to debug what is happening, use

make -p mypackage 2&>1 | less

  That gives you a dump of all the variables and rules defined by the
Makefiles.  You should see a lot of variables MYPACKAGE_... =
(if that is not the case, you're missing $(eval $(generic-package))).
You should see MYPACKAGE_SITE = ... as you defined it.
You should see mypackage in TARGETS (if not, it's not selected in
.config).  You should also see rules like:

mypackage-build: mypackage-configure .../mypackage-1.0.1/.stamp_built

.../mypackage-1.0.1/.stamp_built:
# PKG = MYPACKAGE
#  commands to execute (from `package/pkg-generic.mk', line 107):
         @$(call MESSAGE,"Building")
         $($(PKG)_BUILD_CMDS)
         $(foreach hook,$($(PKG)_POST_BUILD_HOOKS),$(call $(hook))$(sep))
         $(Q)touch $@



  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
