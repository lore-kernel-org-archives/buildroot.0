From: Anisse Astier <anisse@astier.eu>
Date: Mon, 16 Oct 2017 23:18:42 +0200
Subject: [Buildroot] [PATCH RFC] core: enable per-package log files
In-Reply-To: <20171016185248.0463ac82@windsurf.lan>
References: <20171011105809.2bf05267@windsurf.lan>
 <1508170801-31062-1-git-send-email-anisse@astier.eu>
 <20171016185248.0463ac82@windsurf.lan>
Message-ID: <20171016211842.GA32198@bifrost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Oct 16, 2017 at 06:52:48PM +0200, Thomas Petazzoni wrote:
> Hello,
> 
> Thanks for participating into the discussion and trying to prototype
> other solutions! I'm happy to make the connection between your nickname
> on IRC, and the real person: we have met several times at Kernel
> Recipes! :-)
> 
> On Mon, 16 Oct 2017 18:20:01 +0200, Anisse Astier wrote:
> 
> > -	$(foreach hook,$($(PKG)_PRE_EXTRACT_HOOKS),$(call $(hook))$(sep))
> > +	$(foreach hook,$($(PKG)_PRE_EXTRACT_HOOKS),$(call $(hook)) >> $($(PKG)_LOGFILE) 2>&1 $(sep))
> 
> Are you sure this is working for multi-line hooks ? I think hooks
> suffer from the same problem as commands.

No, it's not working for multi-line hooks, I forgot about it. But we
could use the helper for this as well.

> 
> >  	$(Q)mkdir -p $(@D)
> > -	$($(PKG)_EXTRACT_CMDS)
> > +	@$(call exportvar,$(PKG)_EXTRACT_CMDS)
> 
> Why do variables need to be exported? Isn't their value passed as
> argument to the recipe-forward-log script ?
> 

When simply using the multi-line make variable, it gets replaced in the
recipe, and the shell command only receives the first line, even if we
enclose the variable in double quotes. Exporting it to the environment
made it possible to go through the make -> shell barrier.

Then I had to use the eval trick because otherwise the nested/computed
$(PKG)_EXTRACT_CMDS variable would only be interpreted once, at initial
parsing and not for each packages.

> > diff --git a/support/scripts/recipe-forward-log b/support/scripts/recipe-forward-log
> > new file mode 100755
> > index 0000000..8240d74
> > --- /dev/null
> > +++ b/support/scripts/recipe-forward-log
> > @@ -0,0 +1,59 @@
> > +#!/usr/bin/env python3
> > +
> > +import sys
> > +import subprocess
> > +
> > +
> > +DEBUG = False
> > +
> > +if len(sys.argv) < 2:
> > +    print("usage: %s <log-file> <make-recipe>" % (sys.argv[0]))
> > +    sys.exit(-1)
> > +
> > +
> > +def dprint(*pargs):
> > +    if DEBUG:
> > +        print(*pargs)
> > +
> > +log_file = sys.argv[1]
> > +
> > +args = sys.argv[2:]
> > +
> > +dprint("args: %s" % (args))
> > +if len(args) == 1 and len(args[0]) == 0:
> > +    sys.exit(0)  # only one empty argument, supported use case
> > +
> > +for arg in args:
> > +    for line in arg.splitlines():
> > +        dprint("line: %s" % (line))
> > +        if line[0] != '\t':
> > +            print("Recipe line does not start with tab, aborting: %s" % (line))
> > +            sys.exit(-1)
> > +        line = line[1:]  # remove initial tab
> > +        if len(line) == 0:
> > +            continue  # empty lines are tolerated
> > +        print_command = True
> > +        stop_on_err = True
> > +        while True:
> > +            if line[0] == '@':
> > +                dprint("silent mode")
> > +                print_command = False
> > +                line = line[1:]
> > +            elif line[0] == '-':
> > +                dprint("ignore err mode")
> > +                stop_on_err = False
> > +                line = line[1:]
> > +            elif line[0] == '+':  # ignore
> > +                dprint("jobserver MAKEFLAGS mode")
> > +                line = line[1:]
> > +            else:  # no more matching initial recipe character
> > +                break
> > +        if print_command:
> > +            print(line)
> > +        proc = subprocess.Popen(line, shell=True, stdout=subprocess.PIPE,
> > +                                stderr=subprocess.STDOUT)
> > +        tee = subprocess.call(["tee", "-a", log_file], stdin=proc.stdout,
> > +                              stdout=sys.stdout)
> > +        ret = proc.wait()
> > +        if ret != 0 and stop_on_err:
> > +            sys.exit(ret)
> 
> How many packages have you tested with this? I'm just a little bit
> concerned with this parsing, and how it could break with arbitrary (but
> valid) make commands.

Not many. I have only tested the qemu_aarch64_virt_defconfig which does
not contain much(~28 packages), but I was already able to fix a few
parsing issues.

> 
> But besides that, I have to say your approach overall looks
> interesting, and probably less hackish than the global shell wrapper
> approach.

I just want to see this progress! Let's hope it gives new ideas :-)

Regards,

Anisse
