From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 1 Jan 2014 18:13:56 +0100
Subject: [Buildroot] [PATCH 1/2] Remove some absolute paths
In-Reply-To: <CAEYzJUGnXJ1x-Qcrxd0xy7LLSDLcjie-9=JZwJoV=sR5wWj8kA@mail.gmail.com>
References: <1388421102-29198-1-git-send-email-bjorn.forsman@gmail.com>
 <52C1FD9C.9060401@lucaceresoli.net>
 <CAEYzJUGnXJ1x-Qcrxd0xy7LLSDLcjie-9=JZwJoV=sR5wWj8kA@mail.gmail.com>
Message-ID: <CAAXf6LXUE7byUiqyPoBWFA_JpwHYk1dYMg9RXcYLkyZmZEZJSA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Dec 31, 2013 at 1:56 PM, Bj?rn Forsman <bjorn.forsman@gmail.com> wrote:
[..]
>
> Hm, package/Makefile.in also defines some "dependency" variables:
> INSTALL, FLEX, BISON, SED. Looks like dependency handling/checking in
> Buildroot could use some refactoring.
>
> "But why not just define local variables in
> support/dependencies/dependencies.sh?" My thinking is that as long as
> we're
>
> - not using full paths
> - not writing setuid tools
> - not selecting between similarly named commands, but built for host or target
>
> there is very little benefit from using e.g. ${GREP} instead of grep.
> Except that it's more difficult to type :-)
>
> I see that SED is defined as "/path/to/sed -i -e". So mixing
> /path/to/tool and tool_options is a way to use such variables. But I
> don't think that's a good idea. I'd rather have separate variables,
> like SED and SED_OPTS, so that there are no surprises: "oh, SED
> changed the source file even though I didn't tell it to". Maybe SED
> should be renamed to SED_INLINE? Or SED_WITH_OPTS?
>
> I guess one benefit from using variables for commands is that it makes
> the dependencies obvious. As in "if there is no variable defined for
> 'tool', don't use it", or "if there is no variable defined for 'tool',
> define it in the central location and then use it". But that is
> difficult to enforce. Just search for 'sed' in buildroot sources and
> you'll see :-)
>
> To sum it up, I have mixed feelings about using variables for command
> names (that are always in PATH) and I think it is a different issue
> than this patch set is trying to solve.


There is at least one reason why using variables to refer to tools in
makefiles makes sense: in make, any variable can be overruled on the
command-line. So you can call 'make SED=/my/own/sed' without any
special rules in the makefile itself. This is not possible if you
directly use 'sed' (or whatever tool).

Best regards,
Thomas
