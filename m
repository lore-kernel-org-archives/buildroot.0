From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 27 Jul 2007 20:05:40 +0200
Subject: [Buildroot] "multiple target patterns" error while building
	under cygwin
In-Reply-To: <E496871456016F4CA8959BE4105D2A890E8BA7@troe2k1.cs.myharris.net>
References: <000501c7cd42$2a1b0d20$dcc4af0a@atmel.com>
	<E496871456016F4CA8959BE4105D2A890E8B8C@troe2k1.cs.myharris.net>
	<20070727162707.GH25147@aon.at>
	<E496871456016F4CA8959BE4105D2A890E8BA7@troe2k1.cs.myharris.net>
Message-ID: <20070727180540.GD11697@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jul 27, 2007 at 01:04:00PM -0400, Crane, Matthew wrote:
>Hi, 
> 
>Thanks for your response.  I think my build error is the result of the
>dos2unix + unix2dos patch.  My cygwin system was installed with Unix
>text mode, and I've tried to explicitly set the locale, but fixdep
>always seems to output the Dos text. 
>
>I instead used the dos2unix/unix2dos patch to fix the fixdep output,
>which I think ending up causing the error below.  Not sure how though,
>or how to fix it.  Thanks,
>
>Matt
>
> 
>.applets.o.cmd looks like this:
> 
>cmd_applets/applets.o := <snip>
> 
>deps_applets/applets.o := \
>  applets/applets.c \
>    $(wildcard include/config/static.h) \
>    $(wildcard include/config/show/usage.h) \
><snip>
> 
>line 410: applets/applets.o: $(deps_applets/applets.o)
> 
>$(deps_applets/applets.o):
><eof>
> 
>I had already patched the make process so that it runs fixdep through
>unix2dos, dos2unix similar to this patch I found online:
> 
>define rule_cc_o_c
>     $(call echo-cmd,checksrc) $(cmd_checksrc)              \
>     $(call echo-cmd,cc_o_c) $(cmd_cc_o_c);                  \
>+    dos2unix $(depfile);                                              \
>     $(cmd_modversions)                          \
>-    scripts/basic/fixdep $(depfile) $@ '$(call make-cmd,cc_o_c)' >    \
>
>+ scripts/basic/fixdep $(depfile) $@ '$(call make-cmd,cc_o_c)' |
>unix2dos > \ 
>                                                   $(dot-target).tmp;  \
>     rm -f $(depfile);                          \
>     mv -f $(dot-target).tmp $(dot-target).cmd
>
>It proceeded to build, but failed with the above error.   Maybe related,
>not sure.  I'm looking forward to the day when cygwin support is
>completely transparent in buildroot, soon I'm sure.

This doesn't really sounds like a buildroot issue to me but rather a
busybox issue, fwiw.

Perhaps somebody else is aware of what's going on with busybox on
cygwin.
