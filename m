From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 29 Mar 2017 21:43:18 +0200
Subject: [Buildroot] Which order: $(MAKE) $(TARGET_CONFIGURE_OPTS) or
 $(TARGET_CONFIGURE_OPTS) $(MAKE)
In-Reply-To: <20170329213552.6455f568@free-electrons.com>
References: <CAAXf6LUHH5Lo=LSSfjGRQ=onT4Bm_WfLAFc0RDjfcT_ZmADmbA@mail.gmail.com>
 <20170329213552.6455f568@free-electrons.com>
Message-ID: <CAAXf6LVwhzcCnEXKaBku5WfwKeR7GHX0v4VFu4kvdxMobW=g9w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 29, 2017 at 9:35 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Wed, 29 Mar 2017 19:58:18 +0200, Thomas De Schampheleire wrote:
>
>> The order matters because it has impact on the precedence rules of make.
>> In the case where $(MAKE) is present first, the variables are passed
>> as make variables, which have precedence over variables explicitly
>> defined in the makefiles.
>> However, if $(MAKE) is _after_ the variable list, then the variables
>> are treated as environment variables. In make, environment variables
>> are directly readable as make variables, but an explicit assignment to
>> such variable overwrites the value passed via the environment, unless
>> the assignment is done conditionally, e.g. with ?= instead of = / :=.
>>
>> Given this, if you want to make sure that the value you give is taken
>> into account, the forms:
>>
>>     $(MAKE) $(TARGET_CONFIGURE_OPTS)
>>     $(MAKE) $(HOST_CONFIGURE_OPTS)
>
> Sadly, doing this breaks a number of packages. Many packages that use
> hand-written Makefiles do:
>
> CFLAGS += -I../include
>
> for example. So if you pass CFLAGS="$(TARGET_CFLAGS)" as a make
> variable (i.e after $(MAKE)), then it overrides the CFLAGS of the
> package Makefile, and it no longer builds.
>
> It would work if those packages were doing:
>
> override CFLAGS += -I../include
>
> but they often don't do this.
>
> Recent example:
>
>   https://git.buildroot.org/buildroot/commit/?id=f4dc73568b08bd96aa659c5ef29226349dee05de
>

But, on the other hand, if a package would do:

CFLAGS = -I../include

then we cannot use either approach because one approach will ignore
the -I../include, and the other will ignore our own settings. In that
case, a patch of the package is required, right?

Is there a recommendation for the case that the package allows either way?

Thanks,
Thomas
