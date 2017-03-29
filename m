From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 29 Mar 2017 19:58:18 +0200
Subject: [Buildroot] Which order: $(MAKE) $(TARGET_CONFIGURE_OPTS) or
 $(TARGET_CONFIGURE_OPTS) $(MAKE)
Message-ID: <CAAXf6LUHH5Lo=LSSfjGRQ=onT4Bm_WfLAFc0RDjfcT_ZmADmbA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

In package makefiles, you can find both uses:

    $(MAKE) $(TARGET_CONFIGURE_OPTS)
versus
    $(TARGET_CONFIGURE_OPTS) $(MAKE)

and likewise for host packages:

    $(MAKE) $(HOST_CONFIGURE_OPTS)
versus
    $(HOST_CONFIGURE_OPTS) $(MAKE)


The order matters because it has impact on the precedence rules of make.
In the case where $(MAKE) is present first, the variables are passed
as make variables, which have precedence over variables explicitly
defined in the makefiles.
However, if $(MAKE) is _after_ the variable list, then the variables
are treated as environment variables. In make, environment variables
are directly readable as make variables, but an explicit assignment to
such variable overwrites the value passed via the environment, unless
the assignment is done conditionally, e.g. with ?= instead of = / :=.

Given this, if you want to make sure that the value you give is taken
into account, the forms:

    $(MAKE) $(TARGET_CONFIGURE_OPTS)
    $(MAKE) $(HOST_CONFIGURE_OPTS)

should be used.

Do you agree with this analysis?
If so, there is a cleanup opportunity for motivated developers :-)

Thanks,
Thomas
