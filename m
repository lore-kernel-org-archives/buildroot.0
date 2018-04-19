From: Stefan Becker <chemobejk@gmail.com>
Date: Thu, 19 Apr 2018 10:14:40 +0300
Subject: [Buildroot] [PATCH RESEND] core: enhance printvars for
 variables with newlines
In-Reply-To: <fc8f1cc6-e9ba-9cfe-df4a-4b80792d6434@mind.be>
References: <CAOJ2eMdEHvZeJ6rECyRkzMZN0UYJ2CYK4yMgR9d89P%2B-tWYJYw@mail.gmail.com>
 <20180416115855.26762-1-chemobejk@gmail.com>
 <fc8f1cc6-e9ba-9cfe-df4a-4b80792d6434@mind.be>
Message-ID: <CAOJ2eMc+3Bx40nWF=VALh6JzeaNVWPekyCGXAL2=a_YX4yJWug@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Thu, Apr 19, 2018 at 1:27 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>  I'm still not convinced that this is such a great idea.
>
> 1. As explained in reply to your first iteration, there shouldn't be a need for
> including Buildroot variables in a surrounding Makefile.

There is nothing you can say that will change the fact that a
monolithic meta build system is too slow for the CI of our own
components. So let's just agree to disagree on this point.

> 2. At least equally relevant would be output that is appropriate for Python,
> JSON, ...

I see your point. How about this instead?

$ external/scripts/buildstep.sh printvars MULTILINE_VARS=1
VARS="CANFESTIVAL_INSTALL_TARGET_CMDS"
MULTILINE_VAR_START CANFESTIVAL_INSTALL_TARGET_CMDS
        for d in src drivers ; do
PATH="/workarea/stefanb/repos/buildroot-new/output/host/bin:/workarea/stefanb/repos/buildroot-new/output/host/sbin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/home/stefanb/.local/bin:/home/stefanb/bin"
/usr/bin/make -j1 -C ./$d install
PYTHON=/workarea/stefanb/repos/buildroot-new/output/host/bin/python2
DESTDIR=/workarea/stefanb/repos/buildroot-new/output/target || exit 1
; done
MULTILINE_VAR_END CANFESTIVAL_INSTALL_TARGET_CMDS

i.e. the consumer of the MULTILINE_VARS=1 output is then responsible
to post process it into the format he requires, e.g. for my intended
purpose I would use

... | sed  \
    -e 's/^MULTILINE_VAR_START \(.\+\)$/define \1/' \
    -e 's/^MULTILINE_VAR_END .\+$/endef/'

> 3. The implementation is not complete. In case of RAW_VARS, it's pretty hard to
> use in practice because also all the referenced variables would need to be
> retrieved. In the expanded case, any remaining $ will be interpreted by your
> surrounding make instead of being passed down to the shell like they should. Try
> e.g. CANFESTIVAL_INSTALL_TARGET_CMDS.
>
> Note that QUOTED_VARS is not perfect either, mainly because there are some make
> variables that are not legal shell variables (e.g. all the 4th stuff).

IMHO RAW_VARS, as-is today, is only meant to produce human readable
format for debug purposes. I.e. RAW_VARS=1 with any of the formats
none/QUOTE_VARS/MULTILINE_VARS will not be usable for post-processing,
unless the post-processing knows how to parse for variables and
request them.

Fixing RAW_VARS in such a way that any variable detected would be
added to VARS list and then recurse to get all referenced variables,
is outside the scope of my change.

Or alternatively: drop RAW_VARS support from
QUOTED_VARS/MULTILINE_VARS branches.

Regards, Stefan
